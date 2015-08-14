#ifndef SIMPLEREACHANALYSIS_H
#define SIMPLEREACHANALYSIS_H

#include "llvm/Pass.h"

namespace symbexchecks {

class SimpleReachAnalysis : public llvm::ModulePass {
  
public:
  static char ID;
  SimpleReachAnalysis() : llvm::ModulePass(ID) {}

  void getAnalysisUsage(llvm::AnalysisUsage &AU) const;
  const char *getPassName() const;
  bool runOnModule(llvm::Module &M);
};

}

#endif
