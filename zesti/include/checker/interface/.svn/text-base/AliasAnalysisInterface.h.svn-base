#ifndef ALIASANALYSISINTERFACE_H
#define ALIASANALYSISINTERFACE_H

#include "checker/interface/AliasAnalysisCheckerInterface.h"
#include "llvm/Analysis/AliasAnalysis.h"
#include <set>

namespace aachecker {

class AliasAnalysisInterfaceVisitor;

//
// This pass provides an interface to the LLVM AliasAnalysis group that
// returns sets of abstracts locations for pointer expressions.
//
class AliasAnalysisInterface : public AliasAnalysisCheckerInterface {

private:
  // The alias analysis to be checked
  llvm::AliasAnalysis *AA;

  // A visitor class that will collect alloaction sites
  AliasAnalysisInterfaceVisitor *Visitor;
  
  // Are interprocedural alias queries allowed
  bool interprocQueries;

public:
  static char ID;

  AliasAnalysisInterface() : AliasAnalysisCheckerInterface(ID), Visitor(0) {}
  ~AliasAnalysisInterface();

  void getAnalysisUsage(llvm::AnalysisUsage &AU) const;
  const char *getPassName() const;
  bool runOnModule(llvm::Module &M);

  // AliasAnalysisCheckerInterface implementation methods
  const AbstractLocSet *getAbstractLocSetForValue(const llvm::Value *V);
  const AbstractLocSet *getReachableAbstractLocSetForValue(const llvm::Value *V);
  bool isAllocationSite(const llvm::Value *V);
  const AbstractLoc *getExternalLoc();
  const AbstractLocSet &getAllocatableLocs(const llvm::Value *V);
};

}

#endif
