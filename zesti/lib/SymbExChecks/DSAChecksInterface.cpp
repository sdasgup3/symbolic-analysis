#include "symbexchecks/DSAChecksInterface.h"
#include "dsa/DSGraph.h"
#include "dsa/DSNode.h"

#include "llvm/Support/raw_ostream.h"
#include <iostream>

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
  AU.addRequiredTransitive<TDDataStructures>();
  AU.setPreservesAll();
}

const char *DSAChecksInterface::getPassName() const {
  return "Symbolic execution engine interface for the DSA pointer analysis";
}

bool DSAChecksInterface::runOnModule(Module &M) {
  // initialization
  Graphs = &getAnalysis<TDDataStructures>();

  string s;
  raw_string_ostream rso(s);
  Graphs->print(rso, &M);

  // does not modify module.
  return false;
}

// Returns the computed DSGraph object for the function containing the
// given value. The value has to be either an Instruction, or an Argument,
// or a BasicBlock. 
DSGraph *DSAChecksInterface::getGraphForValue(const Value *V) {
  if (const Instruction *I = dyn_cast<Instruction>(V))
    return Graphs->getDSGraph(*(I->getParent()->getParent()));
  else if (const Argument *A = dyn_cast<Argument>(V))
    return Graphs->getDSGraph(*(A->getParent()));
  else if (const BasicBlock *BB = dyn_cast<BasicBlock>(V))
    return Graphs->getDSGraph(*(BB->getParent()));
  return 0;
}

bool
DSAChecksInterface::mayAlias(const llvm::Value *V1, const llvm::Value *V2) {
  if (V1 == V2) return true;

  DSGraph *G1 = getGraphForValue(V1);
  DSGraph *G2 = getGraphForValue(V2);

  if (G1 != G2)
    return true; // for now, we don't handle interproc queries

  DSGraph *G = G1 ? G1 : Graphs->getGlobalsGraph();
  const DSGraph::ScalarMapTy &GSM = G->getScalarMap();

  DSGraph::ScalarMapTy::const_iterator I = GSM.find(V1);
  if (I == GSM.end()) return false;

  DSGraph::ScalarMapTy::const_iterator J = GSM.find(V2);
  if (J == GSM.end()) return false;

  const DSNode *N1 = I->second.getNode();
  const DSNode *N2 = J->second.getNode();
  if (N1 == 0 || N2 == 0)
    // Can't tell whether anything aliases null.
    return true;

  // We can only make a judgment if one of the nodes is complete.
  if (N1->isCompleteNode() || N2->isCompleteNode()) {
    if (N1 != N2)
      return false;   // Completely different nodes.
  }

  return true;
}

bool
DSAChecksInterface::mustAlias(const llvm::Value *V1, const llvm::Value *V2) {
  return false;
}

SymbExChecksInterface::PtrList &
DSAChecksInterface::getMayNotAliasList(const Value *V) {
  PtrList l;
  return l;
}

SymbExChecksInterface::PtrList &
DSAChecksInterface::getMustAliasList(const Value *V) {
  PtrList l;
  return l;
}

void
DSAChecksInterface::setAuxList(const llvm::Value *V, bool updateMustList, int index, bool value) {
}

void
DSAChecksInterface::dumpAuxInfo(llvm::raw_ostream &O) {
}

void   
DSAChecksInterface::updateSymMap(const llvm::Value *V, bool updateboth, bool value) {
}

void   
DSAChecksInterface::dumpSymMap(llvm::raw_ostream &) {
}


}
