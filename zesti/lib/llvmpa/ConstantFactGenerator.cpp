#include "facts/ConstantFactGenerator.h"

using namespace llvm;
using std::pair;
using std::string;
using std::vector;

namespace llvmpa {

//
// Return true if Ty is an interesting type for our analysis. For now these are:
//  - integer type with size equal to the pointer size
//  - pointer type
//
bool ConstantFactGenerator::isLLVMPAPtrTy(Type *Ty) {
  Type *IntPtrTy = DL->getIntPtrType(Ty->getContext());
  return Ty->isPointerTy() /*|| Ty == IntPtrTy*/;
}


//
// Add facts for global initializers and for constant expression parameters of
// instructions.
//
void ConstantFactGenerator::processModule(Module &M) {
  //
  // Register the Global Context. All the global variables are analysed under
  // this context.
  //
  Function *GlobalFunction = AnalysisContext->registerGlobalContext(M);

  //
  // Visit the global variables in the module and add facts pertaining to their
  // initializers.
  //
  Module::global_iterator GlIt = M.global_begin(), GlItEnd = M.global_end();
  for (; GlIt != GlItEnd; ++GlIt)
    visitGlobalVariable(GlobalFunction, *GlIt);

  visit(M);
}

//
// If an object has an initializer, add the facts for the fields of the object
// and model them as Stores of variables into the object.
//
void ConstantFactGenerator::visitGlobalVariable(
  Function *GlobalFunction, GlobalVariable &GV
) {
  //
  // Add the StaticAlloca relation.
  //
  Value *GlobalVariablePtr = &GV;
  Value *Allocsite = &GV;
  Type *AllocsiteType =
    GV.getType()->getPointerElementType(); // global variables always have
                                           // pointer type
  DB->add("StaticAlloca", GlobalVariablePtr, Allocsite);
  DB->add("AllocsiteType", Allocsite, AllocsiteType);


  if (!GV.hasInitializer())
    return;

  //
  // Add facts for the initializers. We model the initialization as multiple
  // stores, one for each field, by using InitField facts.
  //
  Constant *Init = GV.getInitializer();
  Type *InitType = Init->getType();

  vector<InitializerSet> Initializers;
  getInitializerSequence(GlobalFunction, Init, Initializers);

  vector<Field *> Fields;
  FFG->getFieldsInOrder(InitType, Fields);

  //
  // Match each computed initializer set with a field of the object.
  //
  for (unsigned Index = 0; Index < Fields.size(); ++Index) {
    Field *TheField = Fields[Index];

    InitializerSet &InitSet = Initializers[Index];
    InitializerSet::iterator InitIt = InitSet.begin();
    InitializerSet::iterator InitEnd = InitSet.end();

    for (; InitIt != InitEnd; ++InitIt) {
      Constant *Initializer = *InitIt;

      DB->add("InitField", TheField, Initializer, &GV);
    }
  }
}

//
// For each field of the constant object in order, get the set of initializers
// for that field and append it to the vector.
//
void ConstantFactGenerator::getInitializerSequence(
  Function *GlobalFunction, Constant *Init, vector<InitializerSet> &Initializers
) {

  //
  // Get the type of the constant.
  //
  Type *InitType = Init->getType();

  //
  // Base case: a field of a scalar expression that is a pointer
  //
  if (isLLVMPAPtrTy(InitType)) {
    InitializerSet CurrentSet;

    //
    // If there is a corresponding initiliazer expression, add it.
    //
    if (!isa<ConstantAggregateZero>(Init)) {
      addFactsForConstant(GlobalFunction, Init);
      CurrentSet.insert(Init);
    }

    Initializers.push_back(CurrentSet);
  }

  //
  // If the initializer is a struct, traverse the fields of the struct in
  // order to add the initializers.
  //
  else if (isa<StructType>(InitType)) {
    StructType *InitStructType = cast<StructType>(InitType);

    //
    // If this struct has a corresponding initializer, add the fields of the
    // initializer.
    //
    if (isa<ConstantStruct>(Init)) {
      unsigned InitSize = InitStructType->getNumElements();
      for (unsigned Index = 0; Index < InitSize; ++Index) {
        Constant *TheField = cast<ConstantStruct>(Init)->getOperand(Index);
        getInitializerSequence(GlobalFunction, TheField, Initializers);
      }
    }
      
    //
    // Otherwise just add empty fields.
    //
    else {
      InitializerSet EmptySet;
      vector<Field *> Fields;
      FFG->getFieldsInOrder(InitStructType, Fields);

      for (unsigned Index = 0; Index < Fields.size(); ++Index)
        Initializers.push_back(EmptySet);
    }
  }

  //
  // Handle initializing of arrays.
  //
  else if (isa<ArrayType>(InitType)) {

    ArrayType *InitArrType = cast<ArrayType>(InitType);
  
    //
    // If the initializer is an array, since we don't handle separate array
    // elements, then collect all the initializers for the array elements and
    // merge their sets.
    //
    if (isa<ConstantArray>(Init)) {

      unsigned InitSize = (unsigned) InitArrType->getNumElements();

      //
      // An array element may correspond to a sequence of fields, but each field
      // may be initialized to multiple values in the array because the array
      // has multiple elements. So we combine all the initializers for all the
      // elements in this vector.
      //
      vector<InitializerSet> CombinedInitializers;

      vector<InitializerSet> ArrayInitializers;

      for (unsigned Index = 0; Index < InitSize; ++Index) {
        Constant *TheField = cast<ConstantArray>(Init)->getOperand(Index);

        ArrayInitializers.clear();

        getInitializerSequence(GlobalFunction, TheField, ArrayInitializers);

        CombinedInitializers.resize(ArrayInitializers.size());

        //
        // Now combine the gathered initializers back to the vector of sets that
        // hold the fields inside this array.
        //
        for (unsigned AIIdx = 0; AIIdx < ArrayInitializers.size(); ++AIIdx) {
          InitializerSet &TheSet = ArrayInitializers[AIIdx];
          CombinedInitializers[AIIdx].insert(TheSet.begin(), TheSet.end());
        }
      }

      //
      // Now extend the initializer list with the combined element initializers.
      //
      Initializers.insert(
        Initializers.end(),
        CombinedInitializers.begin(),
        CombinedInitializers.end()
      );
    }

    //
    // Otherwise add empty fields.
    //
    else {
      InitializerSet EmptySet;
      vector<Field *> Fields;
      FFG->getFieldsInOrder(InitArrType, Fields);

      for (unsigned Index = 0; Index < Fields.size(); ++Index)
        Initializers.push_back(EmptySet);
    }
  }

  //
  // Otherwise, skip this field, essentially add the empty set to it.
  //
  else {
    InitializerSet EmptySet;
    Initializers.push_back(EmptySet);
  }
}

//
// Generate facts about the constant operands to the instruction.
//
void ConstantFactGenerator::visitInstruction(Instruction &I) {
  Function *Parent = I.getParent()->getParent();

  unsigned OpCount = I.getNumOperands();
  for (unsigned Index = 0; Index < OpCount; ++Index) {
    Value *ValAtIndex = I.getOperand(Index);
    if (isa<Constant>(ValAtIndex))
//      addFactsForConstant(Parent, cast<Constant>(ValAtIndex));
      addFactsForConstant(Parent, cast<Constant>(ValAtIndex));
  }
}

//
// Build the facts for the constant, treating it like a variable.
//
void ConstantFactGenerator::addFactsForConstant(Function *F, Constant *C) {

  //
  // Check if we've already processed this value.
  //
  pair<Constant *, Function *> ConstFuncPair(C, F);
  if (FinishedValues.find(ConstFuncPair) != FinishedValues.end())
    return;

  if (!isa<ConstantExpr>(C)) {
    FinishedValues.insert(ConstFuncPair);
    return;
  }

  //
  // Handle expressions
  //
  ConstantExpr *Expr = cast<ConstantExpr>(C);
  unsigned Code = Expr->getOpcode();

  switch (Code) {
    case Instruction::BitCast: {
      Constant *Source = Expr->getOperand(0);
      if (isLLVMPAPtrTy(Expr->getType()) && isLLVMPAPtrTy(Source->getType()))
        DB->add("PtrAssign", Expr, Source, F);
      break;
    }

    case Instruction::Select: {
      Constant *Source1 = Expr->getOperand(1);
      Constant *Source2 = Expr->getOperand(2);
      if (isLLVMPAPtrTy(Expr->getType())) {
        DB->add("PtrAssign", Expr, Source1, F);
        DB->add("PtrAssign", Expr, Source2, F);
      }
      break;
    }

    case Instruction::PtrToInt: {
      Constant *Source = Expr->getOperand(0);
      if (isLLVMPAPtrTy(Expr->getType()))
        DB->add("PtrAssign", Expr, Source, F);
      else
        DB->add("PtrToInt", Source, F);
      break;
    }

    case Instruction::IntToPtr: {
      Constant *Source = Expr->getOperand(0);
      if (isLLVMPAPtrTy(Source->getType()))
        DB->add("PtrAssign", Expr, Source, F);
      else
        DB->add("IntToPtr", Expr, F);
      break;
    }

    case Instruction::GetElementPtr: {
      Constant *Source = Expr->getOperand(0);
      Type *BaseType = Expr->getOperand(0)->getType();
      vector<Value *> GEPParams;
      for (unsigned Index = 1; Index < Expr->getNumOperands(); ++Index)
        GEPParams.push_back(Expr->getOperand(Index));
      string *Offset = FFG->getOffset(BaseType, GEPParams);
      DB->add("GEP", Expr, Source, Offset, F);
      break;
    }

    case Instruction::Add:
    case Instruction::Sub:
    case Instruction::Mul:
    case Instruction::And:
    case Instruction::Or:
    case Instruction::Xor:
    case Instruction::UDiv:
    case Instruction::SDiv:
    case Instruction::URem:
    case Instruction::SRem: {
      Constant *Source1 = Expr->getOperand(0);
      Constant *Source2 = Expr->getOperand(1);
      if (isLLVMPAPtrTy(Expr->getType())) {
        DB->add("PtrAssign", Expr, Source1, F);
        DB->add("PtrAssign", Expr, Source2, F);
      }
      break;
    }

    case Instruction::Shl:
    case Instruction::LShr:
    case Instruction::AShr: {
      Constant *Source = Expr->getOperand(0);
      if (isLLVMPAPtrTy(Expr->getType()))
        DB->add("PtrAssign", Expr, Source, F);
      break;
    }

  }

  FinishedValues.insert(ConstFuncPair);

  //
  // Add facts recursively for the entire constant tree.
  //
  unsigned OpCount = Expr->getNumOperands();
  for (unsigned Index = 0; Index < OpCount; ++Index)
    addFactsForConstant(F, Expr->getOperand(Index));
}

}
