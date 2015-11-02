#include "symbexchecks/SymbExChecksPrepare.h"
#include "symbexchecks/SimpleReachAnalysis.h"
#include "symbexchecks/PointerCollector.h"
#include "llvm/IR/DataLayout.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/Support/CommandLine.h"

using namespace llvm;

cl::opt<bool> EnableReach("enable-reach",
                          cl::desc("Use reachabilty analysis to make "
                                   "symbolic inputs that affect pointers"),
                          cl::init(0));

namespace symbexchecks {

char SymbExChecksPrepare::ID;

static RegisterPass<SymbExChecksPrepare> SymbExChecksPreparePI(
  "symbexchecks-prepare",
  "This pass modifies the module with useful functionality for "
  "symbolic execution checks", false, false);

void SymbExChecksPrepare::getAnalysisUsage(llvm::AnalysisUsage &AU) const {
    if (EnableReach) {
      AU.addRequired<DataLayout>();
      AU.addRequired<SimpleReachAnalysis>();
    }
}

const char *SymbExChecksPrepare::getPassName() const {
  return "Transformations for symbolic execution with checks";
}

bool SymbExChecksPrepare::runOnModule(Module &M) {
  errs() << "SymbExChecksPrepare Runs\n!";

  if (EnableReach) {
    // Get the reachability analysis
    SimpleReachAnalysis &RA = getAnalysis<SimpleReachAnalysis>();
    
    // Compute inputs that reach pointers.
    PointerCollector PC;
    PC.visit(M);

    SimpleReachAnalysis::ValueSet Values;
    SimpleReachAnalysis::ValueSet Inputs;

    Module::iterator funIt = M.begin(), funItEnd = M.end();
    for (; funIt != funItEnd; ++funIt) {
      Function *f = &*funIt;
      PointerCollector::PointerSet &Ps = PC.Pointers[f];
      Values.insert<PointerCollector::PointerSet::iterator>(Ps.begin(),
                                                            Ps.end());
    }
    RA.getReachingInputs(Values, Inputs, M);
    errs() << "Reaching Inputs\n";
    RA.printValueSet(errs(), Inputs);

    // Find global variables that are initialized with pointer
    // reaching inputs.
    std::set<GlobalVariable *> Globals;
    Module::global_iterator it = M.global_begin(), itEnd = M.global_end();
    for (; it != itEnd; ++it) {
      GlobalVariable &GV = *it;

      // Ignore globals holding pointer values.
      if (GV.getType()->getPointerElementType()->isPointerTy()) continue;

      // Ignore global strings holding names of symbolic variables.
      if (isGlobalSymName(GV)) continue;

      if (GV.hasInitializer() && Inputs.count(GV.getInitializer())) {
        Globals.insert(&GV);
        errs() << "Symbolic global: " << GV << "\n";
      }
    }
    makeGlobalsSymbolic(M, Globals);
  }

  return true;
}

bool SymbExChecksPrepare::isGlobalSymName(GlobalVariable &GV) const {

  // We assume that each symbolic variable has a unique name.
  if (!GV.hasOneUse()) return false;

  if (ConstantExpr *use = dyn_cast<ConstantExpr>(GV.use_back())) {
    if (use->getOpcode() != Instruction::GetElementPtr) return false;
    if (use->getOperand(0) != &GV) return false;
    if (!use->hasOneUse()) return false;
    if (CallInst *call = dyn_cast<CallInst>(use->use_back())) {
      CallSite CS(call);
      if (Function *f = CS.getCalledFunction()) {
        return f->getName() == "klee_make_symbolic";
      }
    }
  }

  return false;
}

void SymbExChecksPrepare::makeGlobalsSymbolic(
       Module &M, std::set<GlobalVariable *> &Globals) {

  // Get main.
  Function* mainFunc = M.getFunction("__user_main");
  if (!mainFunc) {
    mainFunc = M.getFunction("main");
  }

  // Get DataLayout.
  DataLayout *TD = &getAnalysis<DataLayout>();

  // Find the definition of klee_make_symbolic.
  Type *i8Ty = Type::getInt8Ty(getGlobalContext());
  Constant *fc = M.getOrInsertFunction("klee_make_symbolic",
                                       Type::getVoidTy(getGlobalContext()),
                                       PointerType::getUnqual(i8Ty),
                                       Type::getInt64Ty(getGlobalContext()),
                                       PointerType::getUnqual(i8Ty), NULL);
  Function* kleeMakeSymbolic = cast<Function>(fc);

  // Useful types and constants.
  Type *VoidPtrTy = Type::getInt8PtrTy(getGlobalContext());
  Type *Int8Ty = Type::getInt8Ty(getGlobalContext());
  Type *Int32Ty = Type::getInt32Ty(getGlobalContext());
  Type *Int64Ty = Type::getInt64Ty(getGlobalContext());
  Constant *zeroConst = ConstantInt::get(Int32Ty, 0);
  std::vector<Constant *> zeros(2, zeroConst);

  // Add calls to klee_make_symbolic for each global.
  Instruction *insertBeforeInst = ++(mainFunc->begin()->begin());

  std::set<GlobalVariable *>::iterator it = Globals.begin(),
                                       itEnd = Globals.end();
  for(; it != itEnd ; ++it) {
    GlobalVariable *gv = *it;
    Type* g_type = gv->getType();
    Type* g_eltype = g_type->getPointerElementType();

    // Assert that the global is not declared constant.
    gv->setConstant(false);

    // Create a global string holding the name of the symbolic variable
    // for the global.
    std::string symName = ("SYM_" + gv->getName()).str();
    unsigned symNameLen = symName.size();
    GlobalVariable *symNameString = (GlobalVariable *)
      M.getOrInsertGlobal((".aachecks." + gv->getName() + ".symname").str(),
                          ArrayType::get(Int8Ty, symNameLen+1));
    symNameString->setInitializer(
                   ConstantDataArray::getString(getGlobalContext(), symName));
    symNameString->setConstant(true);
    symNameString->setUnnamedAddr(true);
    symNameString->setLinkage(GlobalValue::PrivateLinkage);
    symNameString->setAlignment(1);

    // Create call to make_klee_symbolic.
    Value* castInst = new BitCastInst(gv, VoidPtrTy,
                                      "aachecks." + gv->getName() + ".cast",
                                      insertBeforeInst);
    Value* gepConst =
      ConstantExpr::getInBoundsGetElementPtr(symNameString, zeros);
    std::vector<Value* > klee_args;
    klee_args.push_back(castInst);
    klee_args.push_back(ConstantInt::get(Int64Ty,
                                         TD->getTypeAllocSize(g_eltype)));
    klee_args.push_back(gepConst);
    CallInst::Create(kleeMakeSymbolic, klee_args, "", insertBeforeInst);
  }
}

}
