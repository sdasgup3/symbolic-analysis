#include "facts/FactGenerator.h"
#include "llvm/Analysis/MemoryBuiltins.h"

using namespace llvm;
using std::string;

namespace llvmpa {


//
// Return true if Ty is an interesting type for our analysis. For now these are:
//  - integer type with size equal to the pointer size
//  - pointer type
//
bool FactGenerator::isLLVMPAPtrTy(Type *Ty) {
  Type *IntPtrTy = DL->getIntPtrType(Ty->getContext());
  return Ty->isPointerTy() /*|| Ty == IntPtrTy*/;
}


//
// Handle the alloca instruction.
//
void FactGenerator::visitAllocaInst(AllocaInst &I) {
  Value *AllocaPtr = &I;
  Value *Allocsite = &I;
  Function *Parent = I.getParent()->getParent();
  Type *AllocsiteType =
    I.getType()->getPointerElementType(); // alloca always returns a pointer

  DB->add("Alloca", AllocaPtr, Allocsite, Parent);
  DB->add("AllocsiteType", Allocsite, AllocsiteType);
}


//
// Add a pointer assignment for every incoming value in the PHI node.
//
void FactGenerator::visitPHINode(PHINode &I) {
  Value *PhiPtr = &I;
  Function *Parent = I.getParent()->getParent();

  if (!isLLVMPAPtrTy(I.getType()))
    return;

  for (unsigned J = 0; J < I.getNumIncomingValues(); ++J) {
    Value *Incoming = I.getIncomingValue(J);
    DB->add("PtrAssign", PhiPtr, Incoming, Parent);
  }
}


//
// Add a pointer assignment for both arguments of the select instruction.
//
void FactGenerator::visitSelectInst(SelectInst &I) {
  Value *SelectPtr = &I;
  Value *IncomingTrue = I.getTrueValue();
  Value *IncomingFalse = I.getFalseValue();
  Function *Parent = I.getParent()->getParent();

  if (!isLLVMPAPtrTy(I.getType()))
    return;

  DB->add("PtrAssign", SelectPtr, IncomingTrue, Parent);
  DB->add("PtrAssign", SelectPtr, IncomingFalse, Parent);
}


//
// Treat the binary instructions as a pointer assignments.
//
void FactGenerator::visitBinaryOperator(BinaryOperator &I) {
  Value *BinOpPtr = &I;
  Value *IncomingLeft = I.getOperand(0);
  Value *IncomingRight = I.getOperand(1);
  Function *Parent = I.getParent()->getParent();

  if (!isLLVMPAPtrTy(I.getType()))
    return;

  switch (I.getOpcode()) {
    case Instruction::Add:
    case Instruction::Sub:
    case Instruction::Mul:
    case Instruction::And:
    case Instruction::Or:
    case Instruction::Xor:
    case Instruction::UDiv:
    case Instruction::SDiv:
    case Instruction::URem:
    case Instruction::SRem:
      DB->add("PtrAssign", BinOpPtr, IncomingRight, Parent);
    case Instruction::Shl:
    case Instruction::LShr:
    case Instruction::AShr:
      DB->add("PtrAssign", BinOpPtr, IncomingLeft, Parent);
    default:
      ; // add nothing
  }
}


//
// Treat the bitcast instruction as a pointer assignment.
//
void FactGenerator::visitBitCastInst(BitCastInst &I) {
  Value *CastPtr = &I;
  Value *Incoming = I.getOperand(0);
  Function *Parent = I.getParent()->getParent();


  // Either both or none of the source and the destination of the cast will be
  // pointers. A bitcast instruction is no-op by definition.
  if (!isLLVMPAPtrTy(I.getSrcTy())) {
    assert(!isLLVMPAPtrTy(I.getDestTy()));
    return;
  }
  assert(isLLVMPAPtrTy(I.getDestTy()));

  DB->add("PtrAssign", CastPtr, Incoming, Parent);
}

//
// Treat the ptrtoint instruction as a pointer assignment.
//
void FactGenerator::visitPtrToIntInst(PtrToIntInst &I) {
  Value *CastPtr = &I;
  Value *Incoming = I.getPointerOperand();
  Function *Parent = I.getParent()->getParent();

  if (!isLLVMPAPtrTy(I.getType())) {
    DB->add("PtrToInt", Incoming, Parent);
    return;
  }

  assert(I.isNoopCast(DL->getIntPtrType(I.getType()->getContext())));

  DB->add("PtrAssign", CastPtr, Incoming, Parent);
}

//
// Treat the inttoptr instruction as a pointer assignment.
//
void FactGenerator::visitIntToPtrInst(IntToPtrInst &I) {
  Value *CastPtr = &I;
  Value *Incoming = I.getOperand(0);
  Function *Parent = I.getParent()->getParent();

  if (!isLLVMPAPtrTy(Incoming->getType())) {
    DB->add("IntToPtr", CastPtr, Parent);
    return;
  }

  assert(I.isNoopCast(DL->getIntPtrType(I.getType()->getContext())));

  DB->add("PtrAssign", CastPtr, Incoming, Parent);
}


//
// Handle structure indexing.
//
void FactGenerator::visitGetElementPtrInst(GetElementPtrInst &GEP) {
  Value *GEPPtr = &GEP;
  Function *Parent = GEP.getParent()->getParent();
  Value *BasePtr = GEP.getPointerOperand();
  string *Offset = FFG->getOffset(GEP);

  DB->add("GEP", GEPPtr, BasePtr, Offset, Parent);
}


//
// Handle the load instruction.
//
void FactGenerator::visitLoadInst(LoadInst &I) {
  Value *LoadPtr = &I;
  Value *SrcPtr = I.getPointerOperand();
  Function *Parent = I.getParent()->getParent();

  if (!isLLVMPAPtrTy(I.getType())) {
    if (isa<IntegerType>(I.getType()))
      DB->add("IntLoad", SrcPtr, Parent);
    return;
  }

  DB->add("Load", LoadPtr, SrcPtr, Parent);
}


//
// Handle the store instruction.
//
void FactGenerator::visitStoreInst(StoreInst &I) {
  Value *StorePtr = I.getPointerOperand();
  Value *DataPtr = I.getValueOperand();
  Function *Parent = I.getParent()->getParent();

  if (!isLLVMPAPtrTy(DataPtr->getType())) {
    if (isa<IntegerType>(DataPtr->getType()))
      DB->add("IntStore", StorePtr, Parent);
    return;
  }

  DB->add("Store", StorePtr, DataPtr, Parent);
}


//
// Treat the cmpxchg instruction as a store.
//
void FactGenerator::visitAtomicCmpXchgInst(AtomicCmpXchgInst &I) {
  Value *StorePtr = I.getPointerOperand();
  Value *DataPtr = I.getNewValOperand();
  Function *Parent = I.getParent()->getParent();

  if (!isLLVMPAPtrTy(DataPtr->getType())) {
    if (isa<IntegerType>(DataPtr->getType()))
      DB->add("IntStore", StorePtr, Parent);
    return;
  }

  DB->add("Store", StorePtr, DataPtr, Parent);
}


//
// Handle the llvm.memset intrinsic.
//
void FactGenerator::visitMemSetInst(MemSetInst &I) {


  Value *Dest = I.getDest();
  Value *SetValue = I.getValue();
  Function *Parent = I.getParent()->getParent();

  bool isNullValue =
    isa<Constant>(SetValue) && cast<Constant>(SetValue)->isZeroValue();

  // Setting memory to zero is a no-op for our analysis
  if (isNullValue)
    return;

  // Using memset to initialize an array of integers is treated as an integer
  // store
  assert(!isLLVMPAPtrTy(SetValue->getType()));
  assert(isa<IntegerType>(SetValue->getType()));
  DB->add("IntStore", Dest, Parent);
}


//
// Handle the llvm.memcpy intrinsic.
//
void FactGenerator::visitMemCpyInst(MemCpyInst &I) {
  Value *Dest = I.getDest();
  Value *Source = I.getSource();
  Function *Parent = I.getParent()->getParent();
  DB->add("Copy", Dest, Source, Parent);
}


//
// Handle the llvm.memmove intrinsic.
//
void FactGenerator::visitMemMoveInst(MemMoveInst &I) {
  Value *Dest = I.getDest();
  Value *Source = I.getSource();
  Function *Parent = I.getParent()->getParent();
  DB->add("Copy", Dest, Source, Parent);
}


//
// Handle the llvm.va_start intrinsic.
//
void FactGenerator::visitVAStartInst(VAStartInst &I) {
  Value *VaStartPtr = I.getArgList();
  Function *Parent = I.getParent()->getParent();
  DB->add("VaStart", VaStartPtr, Parent);
}


//
// Handle the llvm.va_copy intrinsic.
//
void FactGenerator::visitVACopyInst(VACopyInst &I) {
  Value *To = I.getDest();
  Value *From = I.getSrc();
  Function *Parent = I.getParent()->getParent();
  DB->add("VaCopy", To, From, Parent);
}


//
// Handle the va_arg instruction.
//
void FactGenerator::visitVAArgInst(VAArgInst &I) {
  Value *VaArgPtr = &I;
  Value *ValistPtr = I.getPointerOperand();
  Function *Parent = I.getParent()->getParent();

  if (!isLLVMPAPtrTy(I.getType()))
    return;

  DB->add("VaArg", VaArgPtr, ValistPtr, Parent);
}


//
// Handle a return from a function.
//
void FactGenerator::visitReturnInst(ReturnInst &I) {
  Value *ReturnValue = I.getReturnValue();
  Function *Parent = I.getParent()->getParent();

  if (ReturnValue == 0)
    return;

  if (!isLLVMPAPtrTy(ReturnValue->getType()))
    return;

  DB->add("Ret", ReturnValue, Parent);
}


static bool isKnownSafeFunction(string FName) {
  //
  // Incomplete list of safe functions.
  //
  static const char *SafeFunctionList[] =
    { "free", "printf", "fprintf", "vprintf", "vfprintf", "write", "fwrite",
      "fopen", "fclose",
      "puts", "strtol", 0 };
  for (unsigned Index = 0; SafeFunctionList[Index]; ++Index) {
    if (FName == SafeFunctionList[Index])
      return true;
  }

  //
  // All library functions suppported by the analysis are also considered safe
  // functions.
  //
  for (unsigned Index = 0; !LibFunctions[Index].name.empty(); ++Index) {
    if (FName == LibFunctions[Index].name)
      return true;
  }

  return false;
}


static bool isAllocator(string FName) {
  static const char *AllocatorList[] =
    { "_Znwm", "_Znam", "malloc", "strdup", "open", "calloc", "realloc", 0 };
  for (unsigned Index = 0; AllocatorList[Index]; ++Index) {
    if (FName == AllocatorList[Index])
      return true;
  }
  return false;
}


//
// Generate facts about calls to functions. This encompasses a few
// different cases:
//   1. calls to allocators
//   2. supported library calls
//   3. arbitrary call sites
//
void FactGenerator::visitCallSite(CallSite CS) {
  Value *CalledValue = CS.getCalledValue();
  Instruction *CallInstr = CS.getInstruction();
  Function *Parent = CS.getCaller();

  //
  // Try to find the Function object that corresponds to the called value.
  //
  Function *CalledFunction =
    dyn_cast<Function>(CalledValue->stripPointerCasts());

  //
  // Check for allocators.
  //
  if (isAllocationFn(CallInstr, TLI, true)) {
    Value *AllocaPtr = CallInstr;
    Value *Allocsite = CallInstr;
    Type *AllocsiteType = 0;

    if (isMallocLikeFn(CallInstr, TLI, true))
      if (CallInst *mallocCall = dyn_cast<CallInst>(CallInstr))
        AllocsiteType = getMallocAllocatedType(mallocCall, TLI);
      
    if (!AllocsiteType)
      // allocators should return a pointer
      AllocsiteType = CallInstr->getType()->getPointerElementType();

    DB->add("Alloca", AllocaPtr, Allocsite, Parent);
    DB->add("AllocsiteType", Allocsite, AllocsiteType);

    if (CalledFunction && !isAllocator(CalledFunction->getName().str())) {
      errs() << CalledFunction->getName().str();
      errs() << " should be included in the allocator functions list\n";
      assert(false);
    }

    // if it is a realloc like allocator, also add a memcpy fact
    if (isReallocLikeFn(CallInstr, TLI, true)) {
      Value *Dest = AllocaPtr;
      Value *Source = CS.getArgument(0);
      DB->add("Copy", Dest, Source, Parent);
    }

    return;
  }

  //
  // Check for calls to free. We ingore such calls.
  //
  if (isFreeCall(CallInstr, TLI))
    return;

  //
  // Library function support goes here...
  //
  if (CalledFunction)
    if (LibFuncHandlerTy Handler = LibFunctionHandlers[CalledFunction]) {
      Handler(DB, &CS);
      return;
    }

  //
  // If we know this function doesn't do anything evil to the points-to sets
  // we forgo recognizing the call.
  //
  if (CalledFunction) {
    string FName = CalledFunction->getName().str();
    if (isKnownSafeFunction(FName))
      return;
  }

  //
  // This is a call to an arbitrary function; add facts about the call site.
  //

  //
  // Add the facts for the function call.
  //
  DB->add("Call", CalledValue, CallInstr, Parent);

  //
  // Add the facts for the call site parameters.
  //
  for (unsigned Index = 0; Index < CS.arg_size(); ++Index) {
    Value *Arg = CS.getArgument(Index);
    if (!isLLVMPAPtrTy(Arg->getType()))
      continue;

    DB->add("Actual", Arg, Index + 1, CallInstr, Parent);
  }

  //
  // Add the facts for the return value of the call site.
  //
  if (isLLVMPAPtrTy(CallInstr->getType()))
    DB->add("CallRet", CallInstr, CallInstr, Parent);
}


//
// Visit a function.
//
void FactGenerator::visitFunction(Function &F) {
  //
  // The address of the value object representating the function is used
  // as the allocation site of the function object in our analysis.
  //
  Value *FunctionPtr = &F;
  Value *FunctionAllocsite = &F;
  string FName = F.getName().str();

  //
  // If the function has its address taken, our analysis should handle it like
  // any other pointer. Otherwise, it is only interesting as a target of
  // function calls. We have two different facts to distinguish between these
  // two types of functions.
  //
  if (F.hasAddressTaken()) {
    //
    // Add the StaticAlloca relation for the function pointer.
    //
    DB->add("FunctionDefinition", FunctionPtr, FunctionAllocsite);
    Type *AllocsiteType = F.getFunctionType();
    DB->add("AllocsiteType", FunctionAllocsite, AllocsiteType);
  }
  else {
    DB->add("NoAddressFunctionDefinition", FunctionPtr, FunctionAllocsite);
  }

  //
  // Check if the function is a declaration. In this case, the function
  // pointer should be considered external.
  // 
  if (F.isDeclaration() && !isAllocator(FName) && !isKnownSafeFunction(FName)) {
    DB->add("ExternallyVisible", FunctionPtr);
    DB->add("ExternallyVisibleFunction", &F);
  }

  //
  // Check if the function should be considered as  starting point for the
  // analysis. We need a starting context for the main function of the module
  // or, if there is no main, for every function that is not a declaration, but
  // can be callled from outside of the module.
  //
  bool isStartingPoint =
    (FName == "main") ||
    !(Main || F.isDeclaration() || F.hasPrivateLinkage() || F.hasInternalLinkage());

  //
  // Add the HasValist relation for vararg functions.
  //
  if (F.isVarArg())
    DB->add("HasValist", &F, &F);

  //
  // Insert the number of arguments to this function.
  //
  DB->add("Argc", F.arg_size(), &F);

  //
  // Register a starting context if the function is a starting point of the
  // analysis.
  //
  if (isStartingPoint)
    AnalysisContext->registerStartingPoint(F);

  //
  // Add the formal parameters relation.
  //
  Function::arg_iterator ArgIt = F.arg_begin(), ArgItEnd = F.arg_end();
  unsigned ArgIndex = 1;

  for (; ArgIt != ArgItEnd; ++ArgIt, ++ArgIndex) {
    Value *Arg = &*ArgIt;
    if (!isLLVMPAPtrTy(Arg->getType()))
      continue;
    DB->add("Formal", Arg, ArgIndex, &F);

    //
    // Add a fact for every pointer argument of a starting point function.
    //
    if (isStartingPoint) {
      DB->add("ExternallyInitializedFormalArg", Arg, &F);
    }
  }
}

//
// Add relevant points-to information for the global variable, including if
// it should be considered external.
//
void FactGenerator::visitGlobalVariable(GlobalVariable &GV) {
  if (!(GV.hasPrivateLinkage() || GV.hasInternalLinkage()))
    DB->add("ExternallyVisible", &GV);
}

//
// Register the functions appended in the llvm.global_ctors array as starting
// points, since they will be called when the module is loaded.
//
void FactGenerator::visitGlobalConstructors(Module &M) {
  GlobalVariable *GCtors = M.getGlobalVariable("llvm.global_ctors");
  if (!GCtors)
    return;

  Constant *gctors = GCtors->getInitializer();

  if (gctors->isZeroValue())
    return;

  for (unsigned i = 0; true; i++) {
    Constant *Elem = gctors->getAggregateElement(i);

    if (!Elem)
      break;

    Function *F = cast<Function>(Elem->getAggregateElement(1));
    // assert that the type of the function is void ()
    assert(F->getReturnType()->isVoidTy() &&
           F->getFunctionType()->getFunctionNumParams() == 0);
    AnalysisContext->registerStartingPoint(*F);    
  }
}

//
// Register the functions appended in the llvm.global_dtors array as starting
// points, since they will be called when the module is loaded.
//
void FactGenerator::visitGlobalDistructors(Module &M) {
  GlobalVariable *GDtors = M.getGlobalVariable("llvm.global_dtors");
  if (!GDtors)
    return;

  Constant *gdtors = GDtors->getInitializer();

  if (gdtors->isZeroValue())
    return;

  for (unsigned i = 0; true; i++) {
    Constant *Elem = gdtors->getAggregateElement(i);

    if (!Elem)
      break;

    Function *F = cast<Function>(Elem->getAggregateElement(1));
    // assert that the type of the function is void ()
    assert(F->getReturnType()->isVoidTy() &&
           F->getFunctionType()->getFunctionNumParams() == 0);
    AnalysisContext->registerStartingPoint(*F);    
  }
}

//
// Register all the supported library functions that are used in the program.
//
void
FactGenerator::registerLibraryFunctions(Module &M) {
  unsigned i = 0;
  LibFunctionHandlers.clear();
  while (!LibFunctions[i].name.empty()) {
    Function *LibFunction = M.getFunction(LibFunctions[i].name);
    LibFuncHandlerTy Handler = LibFunctions[i].handler;
    if (LibFunction)
      LibFunctionHandlers[LibFunction] = Handler;
    i++;
  }
}


//
// Entry point for fact generator
//
void FactGenerator::processModule(Module &M) {
  //
  // Get the main function (if there is one)
  //
  Main = M.getFunction("main");


  //
  // Register supported library functions
  //
  registerLibraryFunctions(M);


  //
  // Visit the module to collect facts
  //
  visit(M);


  //
  // Visit the global variables.
  //
  Module::global_iterator GlIt = M.global_begin(), GlItEnd = M.global_end();
  for (; GlIt != GlItEnd; ++GlIt)
    visitGlobalVariable(*GlIt);

  //
  // Visit the global constructors and distructors
  //
  visitGlobalConstructors(M);
  visitGlobalDistructors(M);
}

}
