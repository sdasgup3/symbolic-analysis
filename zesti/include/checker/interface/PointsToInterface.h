#ifndef POINTSTOINTERFACE_H
#define POINTSTOINTERFACE_H

#include "checker/interface/AliasAnalysisCheckerInterface.h"
#include "llvmpa/PointerAnalysis.h"

namespace aachecker {

//
// This pass provides an interface to a points-to analysis that
// returns sets of abstracts locations for pointer expressions.
//
class PointsToInterface : public AliasAnalysisCheckerInterface {

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

  // The PointsTo graph
  llvmpa::PointsToGraph *PTG;

  std::map<llvmpa::NodeFieldPair, AbstractLoc> TypeSafeNodeMap;
  std::map<llvmpa::PointsToNode *, AbstractLoc> TypeUnsafeNodeMap;
  const AbstractLoc *getAbstractLocForNodeFieldPair(const llvmpa::NodeFieldPair &Edge);

public:
  static char ID;

  PointsToInterface() : AliasAnalysisCheckerInterface(ID) {}

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

  void writeToFile(llvm::StringRef Filename);
};

}

#endif
