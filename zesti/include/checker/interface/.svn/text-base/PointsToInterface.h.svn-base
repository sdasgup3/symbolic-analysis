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
  
  llvmpa::PointsToGraph *PTG;

  static const AbstractLocSet EmptySet;
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
  const AbstractLocSet *getAbstractLocSetForValue(const llvm::Value *V);
  const AbstractLocSet *getReachableAbstractLocSetForValue(const llvm::Value *V);
  bool isAllocationSite(const llvm::Value *V);
  const AbstractLoc *getExternalLoc();
  const AbstractLocSet &getAllocatableLocs(const llvm::Value *V);

  void writeToFile(llvm::StringRef Filename);
};

}

#endif
