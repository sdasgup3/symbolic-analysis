#ifndef ALIASANALYSISINTERFACE_H
#define ALIASANALYSISINTERFACE_H

#include "checker/interface/AliasAnalysisCheckerInterface.h"
#include "llvm/Analysis/AliasAnalysis.h"
#include <map>
#include <set>

namespace aachecker {

class AliasAnalysisInterfaceVisitor;

//
// This pass provides an interface to the LLVM AliasAnalysis group that
// returns sets of abstracts locations for pointer expressions.
//
class AliasAnalysisInterface : public AliasAnalysisCheckerInterface {

private:
  // The abstract location for the external node
  AbstractLoc ExternalAbsLoc;

  // A map of abstract locations allocatable at a given allocation site
  std::map<const llvm::Value *, AbstractLocSet> AllocatableLocSets;

  // A map of abstract locations that a given value may point to
  std::map<const llvm::Value *, AbstractLocSet> AbsLocSets;

  // A map of abstract locations reachable by a given value
  std::map<const llvm::Value *, AbstractLocSet> ReachableAbsLocSets;
  
  // The empty set of abstract locations
  static const AbstractLocSet EmptySet;

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
  virtual const AbstractLocSet *getAbstractLocSetForValue(const llvm::Value *V);
  virtual const AbstractLocSet *getReachableAbstractLocSetForValue(
    const llvm::Value *V);
  virtual bool isAllocationSite(const llvm::Value *V);
  virtual const AbstractLoc *getExternalLoc();
  virtual const AbstractLocSet &getAllocatableLocs(const llvm::Value *V);
};

}

#endif
