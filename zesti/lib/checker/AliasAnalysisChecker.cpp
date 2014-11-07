//===-- AliasAnalysisChecker.cpp ------------------------------------------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// AliasAnalysisChecker inserts runtime checks into the code to make sure that
// the points-to alias analysis is working properly.
//
//===----------------------------------------------------------------------===//

#include "checker/AliasAnalysisChecker.h"
#include "checker/interface/AliasAnalysisCheckerInterface.h"
#include "llvm/Analysis/Dominators.h"
#include "llvm/Analysis/MemoryBuiltins.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Support/InstIterator.h"

using namespace llvm;

namespace aachecker {

static cl::opt<bool> KleeReady("klee-ready", cl::init(false),
    cl::desc("Make the check addition compatible with klee"));
  
static cl::opt<bool> EnableLogging("enable-logging", cl::init(false),
    cl::desc("Enable logging for check failures (log file can be found in /tmp)"));

char AliasAnalysisChecker::ID;
static RegisterPass<AliasAnalysisChecker>
  X("check-aa", "Alias Analysis Checker", false, false);

void AliasAnalysisChecker::getAnalysisUsage(AnalysisUsage &AU) const {
  AU.addRequired<DominatorTree>();
  AU.addRequired<TargetLibraryInfo>();
  AU.addRequired<DataLayout>();
  AU.addRequired<AliasAnalysisCheckerInterface>();
}

const char *AliasAnalysisChecker::getPassName() const {
  return "Alias Analysis Checker";
}

void AliasAnalysisChecker::setAliasAnalysisCheckerInterface(
       AliasAnalysisCheckerInterface *pti) {
  this->pti = pti;
}

bool AliasAnalysisChecker::runOnModule(Module &M) {
  // Get the data layout and target library info objects
  DL = &getAnalysis<DataLayout>();
  TLI = &getAnalysis<TargetLibraryInfo>();

  // Load the runtime functions we will need to eventually call.
  Type *VoidTy = Type::getVoidTy(M.getContext());
  Type *VoidPtrTy = Type::getInt8PtrTy(M.getContext());
  Type *SizeTy = DL->getIntPtrType(M.getContext());
  Type *LocTy = Type::getInt64Ty(M.getContext());
  if (EnableLogging) {
    FunctionType *LogFT = FunctionType::get(VoidTy, VoidPtrTy, true);
    Logger = M.getOrInsertFunction("____jf_logger", LogFT);
  }
  else {
    FunctionType *AbortFT = FunctionType::get(VoidTy, false);
    Abort = M.getOrInsertFunction("abort", AbortFT);
  }
  Type *JFNALParams[3] = {VoidPtrTy, SizeTy, LocTy};
  NoteAL = M.getOrInsertFunction("____jf_note_abstract_location",
    FunctionType::get(VoidTy, JFNALParams, false));
  GetAL = M.getOrInsertFunction("____jf_test_abstract_location",
    FunctionType::get(LocTy, VoidPtrTy, false));
  FreeAL = M.getOrInsertFunction("____jf_free_abstract_location",
    FunctionType::get(VoidTy, VoidPtrTy, false));

  // Preseed some points-to interface data
  pti = &getAnalysis<AliasAnalysisCheckerInterface>();
  assert(pti && "No points to interface was provided to the checker!");
  locationIds[pti->getExternalLoc()] = 0;
  
  //errs() << "dsand " <<*(pti->getExternalLoc()) << "\n";


  // Pass 1: number all allocation sites.
  numberGlobalAllocationSites(M);
  for (Module::iterator F = M.begin(), E = M.end(); F != E; ++F) {
    if (F->empty())
      continue;
    numberAllocationSites(*F);
  }

  // Pass 2: insert the necessary checks.
  for (Module::iterator F = M.begin(), E = M.end(); F != E; ++F) {
    if (F->empty())
      continue;
    checkFunction(*F);
  }

  // Remove all the metadata if we want to run with klee
  if (KleeReady) {
    std::vector<NamedMDNode *> NMDnodes;
    Module::named_metadata_iterator NMDIt = M.named_metadata_begin(),
                                    NMDItEnd = M.named_metadata_end();
    for (; NMDIt != NMDItEnd; ++NMDIt)
      NMDnodes.push_back(&*NMDIt);
    for (unsigned i = 0; i < NMDnodes.size(); ++i)
      M.eraseNamedMetadata(NMDnodes[i]);
  }

  return true;
}

void AliasAnalysisChecker::checkFunction(Function &F) {
  IRBuilder<true> Builder(F.begin());
  std::vector<std::pair<Value *, Instruction *> > WorkList;
  for (inst_iterator I = inst_begin(F), E = inst_end(F); I != E; ++I) {
    Instruction *Inst = &*I;

    // Find the pointer dereferenced in this instruction, if any.
    Value *Pointer = NULL;
    if (LoadInst *LI = dyn_cast<LoadInst>(Inst)) {
      Pointer = LI->getPointerOperand();
    } else if (StoreInst *SI = dyn_cast<StoreInst>(Inst)) {
      Pointer = SI->getPointerOperand();
    } else if (AtomicCmpXchgInst *AI = dyn_cast<AtomicCmpXchgInst>(Inst)) {
      Pointer = AI->getPointerOperand();
    } else if (AtomicRMWInst *AI = dyn_cast<AtomicRMWInst>(Inst)) {
      Pointer = AI->getPointerOperand();
    } else if (CallInst *CI = dyn_cast<CallInst>(Inst)) {
      Pointer = CI->getCalledValue();
    } else if (InvokeInst *II = dyn_cast<InvokeInst>(Inst)) {
      Pointer = II->getCalledValue();
    }

    // If the instruction doesn't dereference a pointer, or if the dereferenced
    // pointer is a constant, ignore the value.
    if (Pointer && isa<Instruction>(Pointer))
      WorkList.push_back(std::make_pair(Pointer, Inst));
  }

  for (std::vector<std::pair<Value*,Instruction*> >::iterator I = WorkList.begin();
      I != WorkList.end(); ++I) {
    Value *Pointer = I->first;
    Instruction *Inst = I->second;

    // Find the insert point for the instruction and add the checks
    Builder.SetInsertPoint(Inst);
    addChecks(Pointer, Builder);
  }
}

void AliasAnalysisChecker::numberGlobalAllocationSites(Module &M) {
  // Find the insert point for the instruction. It will be the beginning of the
  // main function of the module.
  Function *Main = M.getFunction("main");
  assert(Main && "Main not found!");
  IRBuilder<true> Builder(Main->begin()->begin());

  // Handle allocation sites produced from global variables,but ignore the llvm
  // intrinsic global variables
  Module::global_iterator GlIt = M.global_begin(), GlItEnd = M.global_end();
  for (; GlIt != GlItEnd; ++GlIt) {

    //errs() << "\ndsand (GlIt)" << *GlIt << "\n";

    GlobalVariable *GV = &*GlIt;
    if (GV->getName().startswith("llvm.")) // llvm intrinsic global  variable
      continue;
    assert(pti->isAllocationSite(GV));

    // Find the abstract locations involved
    const AbstractLocSet &allocSite(pti->getAllocatableLocs(GV));    
    Value *AsVoidPtr = Builder.CreatePointerCast(GV, Builder.getInt8PtrTy());

    // Introduce a new ID for the site, and make sure that all the locations
    // have that ID.
    uint32_t locId = allocSite.size() == 0 ? 0 : nextID++;
    for (AbstractLocSet::const_iterator I = allocSite.begin();
        I != allocSite.end(); ++I) {
      //errs() << "\ndsand (allocssite) [id]" << *I << "[ "<< locId << "] " << " of " << *GlIt << "\n";
      locationIds[*I] = locId;
    }

    // Find the size of the objects allocated in this allocation site
    Value *Size;
    if (GV->hasPrivateLinkage() || GV->hasInternalLinkage()) {
        ObjectSizeOffsetEvaluator eval(DL, TLI, GV->getContext());
      SizeOffsetEvalType size = eval.compute(GV);
      assert(eval.knownSize(size) && "Please be true");
      Size = size.first;
    }
    else {
      // the allocated objects are external, so their size won't matter
      Size = Builder.getInt64(1);
    }

    // Insert the runtime call to set the data values
    Builder.CreateCall3(NoteAL, AsVoidPtr, Size, Builder.getInt64(locId));
  }

  // Handle allocation sites produced from functions, but ignore the checker
  // functions and the llvm intrinsic functions
  Module::iterator FIt = M.begin(), FItEnd = M.end();
  for (; FIt != FItEnd; ++FIt) {

    //errs() << "\ndsand (FIt)" << *FIt << "\n";

    Function *F = &*FIt;
    if (F->isIntrinsic())
      continue;
    std::string FName = F->getName();
    if (FName == "abort" ||
        FName == "____jf_logger" ||
        FName == "____jf_note_abstract_location" ||
        FName == "____jf_test_abstract_location" ||
        FName == "____jf_free_abstract_location")
      continue;
    
    assert(pti->isAllocationSite(F));

    // Find the abstract locations involved
    const AbstractLocSet &allocSite(pti->getAllocatableLocs(F));
    Value *AsVoidPtr = Builder.CreatePointerCast(F, Builder.getInt8PtrTy());

    // Introduce a new ID for the site, and make sure that all the locations
    // have that ID.
    uint32_t locId = allocSite.size() == 0 ? 0 : nextID++;
    for (AbstractLocSet::const_iterator I = allocSite.begin();
        I != allocSite.end(); ++I) {
      //errs() << "\ndsand (allocssite) [id]" << *I << "[ "<< locId << "] " << " of " << *FIt << "\n";
      locationIds[*I] = locId;
    }

    // Insert the runtime call to set the data values
    Builder.CreateCall3(NoteAL, AsVoidPtr, Builder.getInt64(1),
      Builder.getInt64(locId));

    // Finally remove all function attributes if we want to run with klee
    if (KleeReady) // DSAND
      F->setAttributes(AttributeSet());
  }
}

void AliasAnalysisChecker::numberAllocationSites(Function &F) {
  IRBuilder<true> Builder(F.begin());
  for (inst_iterator I = inst_begin(F), E = inst_end(F); I != E; ++I) {
    Instruction *Inst = &*I;

    // Remove attributes from call and invoke if we want to run with klee
    if (KleeReady) {
      if (CallInst *CI = dyn_cast<CallInst>(Inst))
        CI->setAttributes(AttributeSet());
      if (InvokeInst *II = dyn_cast<InvokeInst>(Inst))
        II->setAttributes(AttributeSet());
    }

    // Insert the free and realloc checks here.
    if (isFreeCall(Inst, TLI)) {
      Builder.SetInsertPoint(&*I);
      if (CallInst *CI = dyn_cast<CallInst>(Inst)) {
        Builder.CreateCall(FreeAL, CI->getArgOperand(0));
      }
    } else if (isReallocLikeFn(Inst, TLI)) {
      if (CallInst *CI = dyn_cast<CallInst>(Inst)) {
        // XXX: null-check
        Builder.SetInsertPoint(CI);
        Builder.CreateCall(FreeAL, CI->getArgOperand(0));
      }
    }

    // If this isn't an allocation site, go away at this point.
    if (!pti->isAllocationSite(Inst))
      continue;

    // Find the insert point for the instruction.
    BasicBlock *BB = I->getParent();
    BasicBlock::iterator insPoint(*I);
    if (InvokeInst *II = dyn_cast<InvokeInst>(&*I)) {
      // Invokes suck. Make a fake block for inserting the checks in post-invoke
      // (so that we know we always dominate), and thread the invokes properly.
      BasicBlock *target = II->getNormalDest();
      BasicBlock *checkBlock = BasicBlock::Create(II->getContext(),
        BB->getName() + ".check", BB->getParent(), target);
      Builder.SetInsertPoint(BranchInst::Create(target, checkBlock));
      II->setNormalDest(checkBlock);
      for (BasicBlock::iterator TI = target->begin();
          TI != target->end(); ++TI) {
        PHINode *phi = dyn_cast<PHINode>(&(*TI));
        if (!phi)
          break;
        for (unsigned i = 0; i < phi->getNumIncomingValues(); ++i)
          if (BB == phi->getIncomingBlock(i))
            phi->setIncomingBlock(i, checkBlock);
      }
    } else
      Builder.SetInsertPoint(++insPoint);

    // Find the abstract locations involved
    const AbstractLocSet &allocSite(pti->getAllocatableLocs(Inst));
    Value *AsVoidPtr = Builder.CreatePointerCast(Inst, Builder.getInt8PtrTy());
    //Inst->dump();
    //assert(allocSite.size() >= 1 &&
    //  "Should have at least one abstract location");

    // Introduce a new ID for the site, and make sure that all the locations
    // have that ID.
    uint32_t locId = allocSite.size() == 0 ? 0 : nextID++;
    for (AbstractLocSet::const_iterator I = allocSite.begin();
        I != allocSite.end(); ++I) {
      locationIds[*I] = locId;
    }

    // Insert the runtime call to set the data values
    ObjectSizeOffsetEvaluator eval(DL, TLI, Inst->getContext());
    SizeOffsetEvalType size = eval.compute(Inst);
    assert(eval.knownSize(size) && "Please be true");
    Builder.CreateCall3(NoteAL, AsVoidPtr, size.first,
      Builder.getInt64(locId));

    // For alloca instructions, insert code on all dominated returns/resumes to
    // clean up the stack entry.
    if (isa<AllocaInst>(Inst))
      cleanupOnExit(F, AsVoidPtr, Builder);
  }
}

void AliasAnalysisChecker::cleanupOnExit(Function &F, Value *V,
    IRBuilder<true> &Builder) {

  DominatorTree *Tree = &getAnalysis<DominatorTree>(F);

  for (Function::iterator BB = F.begin(); BB != F.end(); ++BB) {
    TerminatorInst *End = BB->getTerminator();
    // Ignore non-dominated exits.
    if (!Tree->dominates(cast<Instruction>(V), End))
      continue;
    Builder.SetInsertPoint(End);
    if (isa<ReturnInst>(End) || isa<ResumeInst>(End))
      Builder.CreateCall(FreeAL, V);
  }
}

uint32_t AliasAnalysisChecker::getLocationId(const AbstractLoc *loc) {
  DenseMap<const AbstractLoc *, uint32_t>::iterator it = locationIds.find(loc);
  if (it == locationIds.end()) {
    return locationIds[loc] = nextID++;
  }
  return it->second;
}

void AliasAnalysisChecker::printString(const Value *V, raw_ostream &out) {
  V->print(out);
  if (const Argument *A = dyn_cast<Argument>(V)) {
    out << " of function " << A->getParent()->getName();
  } else if (const Instruction *I = dyn_cast<Instruction>(V)) {
    out << " of function " << I->getParent()->getParent()->getName();
  }
}

void AliasAnalysisChecker::addChecks(Value *A, IRBuilder<true> &Builder) {
  const AbstractLocSet &pointsA = *pti->getAbstractLocSetForValue(A);
  Value *AsVoidPtr = Builder.CreatePointerCast(A, Builder.getInt8PtrTy());

  // Ignore allocation sites.
  if (pti->isAllocationSite(A))
    return;

  Value *LocId = Builder.CreateCall(GetAL, AsVoidPtr);

  // Build strings for easier debugging of failures.
  std::string failedMessageStr;
  raw_string_ostream failedMessage(failedMessageStr);
  failedMessage << "Value ";
  printString(A, failedMessage);
  failedMessage << " was found to unexpectedly alias another value.";

  // Zero is a special value for null pointers/external/etc.
  Value *Valid = Builder.CreateICmpEQ(LocId, Builder.getInt64(0));
  for (AbstractLocSet::iterator L = pointsA.begin(); L != pointsA.end(); ++L) {
    // Is the value one of these?
    Value *eq = Builder.CreateICmpEQ(LocId, Builder.getInt64(
      getLocationId(*L)));
    Valid = Builder.CreateOr(Valid, eq);
  }

  // If any of the above hold true, abort
  BasicBlock *current = Builder.GetInsertBlock();
  BasicBlock *resume = current->splitBasicBlock(Builder.GetInsertPoint());
  current->getTerminator()->eraseFromParent();
  BasicBlock *aborter = BasicBlock::Create(current->getContext(),
    "pointer_check_abort", current->getParent(), resume);
  Builder.SetInsertPoint(current);
  Builder.CreateCondBr(Valid, resume, aborter);

  // For debugging purposes, make the abort block dump out the violating set of
  // points-to values.
  Builder.SetInsertPoint(aborter);
  failedMessage.flush();
  if (EnableLogging) {
    Builder.CreateCall3(Logger,
      Builder.CreateGlobalStringPtr("%s (actual location: %d)\n"),
      Builder.CreateGlobalStringPtr(failedMessageStr),
      LocId);
    Builder.CreateCall(
      Intrinsic::getDeclaration(current->getParent()->getParent(), Intrinsic::debugtrap));
  }
  else {
    Builder.CreateCall(Abort);
  }
  Builder.CreateUnreachable();
}


}

