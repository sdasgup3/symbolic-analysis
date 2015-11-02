#ifndef SYMBEXCHECKSPREPARE_H
#define SYMBEXCHECKSPREPARE_H

#include "llvm/Pass.h"
#include "llvm/IR/GlobalVariable.h"
#include <set>

namespace symbexchecks {

// This class implements a transformation pass that modifies the module
// in various ways, adding useful functionality for symbolic execution
// with checks enabled:
//   - If reachability analysis is enabled, we modify the module by adding
//     calls to klee_make_symbolic for inputs that affect pointers.
class SymbExChecksPrepare : public llvm::ModulePass {

public:
  // Pass related
  static char ID;
  SymbExChecksPrepare() : llvm::ModulePass(ID) {}

  void getAnalysisUsage(llvm::AnalysisUsage &AU) const;
  const char *getPassName() const;
  bool runOnModule(llvm::Module &M);

private:
  bool isGlobalSymName(llvm::GlobalVariable &GV) const;
  void makeGlobalsSymbolic(llvm::Module &M,
                           std::set<llvm::GlobalVariable *> &Globals);
};

}

#endif
