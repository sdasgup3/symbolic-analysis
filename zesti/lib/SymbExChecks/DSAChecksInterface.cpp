#include "symbexchecks/DSAChecksInterface.h"

using namespace llvm;
using std::map;
using std::string;

namespace symbexchecks {

// Implementation of the DSAChecksInterface pass
char DSAChecksInterface::ID;

static RegisterPass<DSAChecksInterface> DSAChecksInterfacePI(
  "dsa-interface", "Interface to the DSA pointer analysis", false, true);

static RegisterAnalysisGroup<SymbExChecksInterface, false>
X(DSAChecksInterfacePI);

void  DSAChecksInterface::getAnalysisUsage(llvm::AnalysisUsage &AU) const {
  AU.setPreservesAll();
}

const char *DSAChecksInterface::getPassName() const {
  return "Symbolic execution engine interface for the DSA pointer analysis";
}

bool DSAChecksInterface::runOnModule(Module &M) {
  // initialization

  // does not modify module.
  return false;
}

bool
DSAChecksInterface::mayAlias(const llvm::Value *V1, const llvm::Value *V2) {
  return true;
}

}
