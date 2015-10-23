#include "symbexchecks/SymbExChecksPrepare.h"
#include "symbexchecks/SimpleReachAnalysis.h"
#include "symbexchecks/PointerCollector.h"
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
  }

  return false;
}

}
