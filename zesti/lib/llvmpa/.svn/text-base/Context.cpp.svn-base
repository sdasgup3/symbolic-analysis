#include "context/Context.h"

using namespace llvm;

namespace llvmpa {

Function *Context_1cs_h::registerGlobalContext(const Module &M) {
  // Use the null pointer as the global context.
  Value *GlobalContext = (Value *) 0;
  DB->add("GlobalContext", GlobalContext);
  // Use a null function as the function analyzed under the global context.
  Function *GlobalFunction = (Function *) 0;
  DB->add("StartingPoint", GlobalFunction, GlobalContext);
  return GlobalFunction;
}

void Context_1cs_h::registerStartingPoint(const Function &F) {
  // Use the function allocation site as its initial context.
  // This is not to be confused with the heap context of the function object.
  Value *FunctionStartingContext = (Value *) &F;
  DB->add("StartingPoint", &F, FunctionStartingContext);
}


Function *Context_insensitive::registerGlobalContext(const Module &M) {
  // Use the null pointer as the global context.
  Value *GlobalContext = (Value *) 0;
  DB->add("GlobalContext", GlobalContext);
  // Use a null function as the function analyzed under the global context.
  Function *GlobalFunction = (Function *) 0;
  DB->add("StartingPoint", GlobalFunction, GlobalContext);
  return GlobalFunction;
}

void Context_insensitive::registerStartingPoint(const Function &F) {
  // Also use the null pointer as the function's initial context.
  Value *FunctionStartingContext = (Value *) 0;
  DB->add("StartingPoint", &F, FunctionStartingContext);
}


}
