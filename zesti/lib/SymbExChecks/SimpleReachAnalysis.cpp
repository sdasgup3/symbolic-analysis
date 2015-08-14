#include "symbexchecks/SimpleReachAnalysis.h"

using namespace llvm;

namespace symbexchecks {

char SimpleReachAnalysis::ID;

static RegisterPass<SimpleReachAnalysis> SimpleReachAnalysisPI(
  "simplereach", "Simple reachability analysis from "
                 "inputs to pointers", false, true);

void  SimpleReachAnalysis::getAnalysisUsage(llvm::AnalysisUsage &AU) const {
  AU.setPreservesAll();
}

const char *SimpleReachAnalysis::getPassName() const {
  return "Simple reachability analysis frominputs to pointers";
}

bool SimpleReachAnalysis::runOnModule(Module &M) {

  // does not modify module.
  return false;
}

}
