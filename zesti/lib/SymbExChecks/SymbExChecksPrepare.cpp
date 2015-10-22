#include "symbexchecks/SymbExChecksPrepare.h"
#include "symbexchecks/SimpleReachAnalysis.h"
#include "llvm/Support/CommandLine.h"

using namespace llvm;

namespace symbexchecks {

static cl::opt<bool> EnableReach("enable-reach", cl::init(false),
  cl::desc("Use reachabilty analysis to make symbolic inputs that "
           "affect pointers"));

char SymbExChecksPrepare::ID;

static RegisterPass<SymbExChecksPrepare> SymbExChecksPreparePI(
  "symbexchecks-prepare",
  "This pass modifies the module with useful functionality for "
  "symbolic execution checks", false, false);

void SymbExChecksPrepare::getAnalysisUsage(llvm::AnalysisUsage &AU) const {
    AU.addRequired<SimpleReachAnalysis>();
}

const char *SymbExChecksPrepare::getPassName() const {
  return "Transformations for symbolic execution with checks";
}

bool SymbExChecksPrepare::runOnModule(Module &M) {
  errs() << "SymbExChecksPrepare Runs\n!";
  return false;
}

}
