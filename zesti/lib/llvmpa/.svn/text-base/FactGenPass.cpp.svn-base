#include "facts/FactGenPass.h"

using namespace llvm;

namespace llvmpa {

char FactGenPass::ID;

static RegisterPass<FactGenPass>
X("fact-generator", "Generate facts from code", false, true);

void FactGenPass::getAnalysisUsage(llvm::AnalysisUsage &AU) const {
  AU.addRequired<llvm::TargetLibraryInfo>();
  AU.addRequired<llvm::DataLayout>();
  AU.setPreservesAll();
}

//
// Run the fact generation passes in a suitable order.
//
bool FactGenPass::runOnModule(Module &M) {

  //
  // Get results from required passes
  //
  const TargetLibraryInfo *TLI = &getAnalysis<TargetLibraryInfo>();

  //
  // Get DataLayout for this module
  //
  const DataLayout *DL = &getAnalysis<DataLayout>();

  //
  // Create the appropriate analysis context object
  //
  AnalysisContext = new Context_1cs_h(&DB);

  //
  // Run the field fact generator first, it's a requirement of the other
  // generators.
  //
  FFG = new FieldFactGenerator(&DB, DL);
  FFG->processModule(M);

  //
  // Run the constant fact generator.
  //
  CFG = new ConstantFactGenerator(&DB, FFG, DL, AnalysisContext);
  CFG->processModule(M);

  //
  // Run the fact generator.
  //
  FG = new FactGenerator(&DB, FFG, TLI, DL, AnalysisContext);
  FG->processModule(M);

  return false;
}

FactGenPass::~FactGenPass() {
  delete CFG;
  delete FG;
}

}
