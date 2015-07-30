#include "symbexchecks/AAChecksInterface.h"
#include "llvm/IR/Argument.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/Support/CommandLine.h"

using namespace llvm;
using std::map;
using std::string;

#include <llvm/Support/raw_ostream.h>

namespace symbexchecks {

// Helper functions
static const Function *getParent(const Value *V) {
  if (const Instruction *inst = dyn_cast<Instruction>(V))
    return inst->getParent()->getParent();

  if (const Argument *arg = dyn_cast<Argument>(V))
    return arg->getParent();

  return NULL;
}

static bool differentParent(const Value *O1, const Value *O2) {

  const Function *F1 = getParent(O1);
  const Function *F2 = getParent(O2);

  return F1 && F2 && F1 != F2;
}


// Implementation of the AAChecksInterface pass
static cl::opt<bool> InterprocQueries("interproc-queries", cl::init(false),
    cl::desc("Allow interprocedural queries for the construction of the alias"
             " analysis interface"));

char AAChecksInterface::ID;

static RegisterPass<AAChecksInterface> AAChecksInterfacePI(
  "aa-interface", "Interface to the AA analysis group", false, true);

static RegisterAnalysisGroup<SymbExChecksInterface, true> X(AAChecksInterfacePI);

void  AAChecksInterface::getAnalysisUsage(llvm::AnalysisUsage &AU) const {
  AU.addRequiredTransitive<llvm::AliasAnalysis>();
  AU.setPreservesAll();
}

const char *AAChecksInterface::getPassName() const {
  return "Symbolic execution engine interface for the aa Analysis Group";
}

bool AAChecksInterface::runOnModule(Module &M) {
  // initialization
  AA = &getAnalysis<AliasAnalysis>();
  interprocQueries = InterprocQueries;
  Visitor.visit(M);

  //Visitor.printPointers(errs());

  // does not modify module.
  return false;
}

bool AAChecksInterface::mayAlias(const llvm::Value *V1, const llvm::Value *V2) {
  // If interprocedural queries are not allowed we have to assume that
  // pointers from different functions may allias 
  if (!interprocQueries && differentParent(V1, V2))
    return true;

  return AA->alias(V1, V2);
}

bool AAChecksInterface::mustAlias(const llvm::Value *V1, const llvm::Value *V2) {
  // If interprocedural queries are not allowed we have to assume that
  // pointers from different functions do not have to allias 
  if (!interprocQueries && differentParent(V1, V2))
    return false;

  AliasAnalysis::AliasResult res = AA->alias(V1, V2);
  return res == AliasAnalysis::PartialAlias || res == AliasAnalysis::MustAlias;
}

}
