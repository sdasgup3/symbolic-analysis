#ifndef SYMBEXCHECKSINTERFACE_H
#define SYMBEXCHECKSINTERFACE_H

#include "llvm/IR/Value.h"
#include "llvm/Pass.h"
#include <set>

namespace symbexchecks {

// This class defines an interface used by the symbolic execution engine to perform
// alias/pointer analysis checks. A subclass that implements the interface should be
// provided for each pointer analysis pass to be checked.
class SymbExChecksInterface : public llvm::ModulePass {
//private:
  // A visitor class that will collect allocation sites. 
//  AliasAnalysisInterfaceVisitor *Visitor;
  
public:
  static char ID;
  SymbExChecksInterface() : llvm::ModulePass(ID) {}
  SymbExChecksInterface(char &id) : llvm::ModulePass(id) {}

  // Alias query for two given values. Should be implemented by the subclasses.
  virtual bool mayAlias(const llvm::Value *V1, const llvm::Value *V2)=0;

  // Returns true if this value is an allocation site according to the symbolic
  // execution engine.
//  bool isAllocationSite(const llvm::Value *V);

  // Returns a set of allocation sites (as identified from the above method) that
  // alias with the given value.
//  set<llvm::Value *> &getAliasingAllocationSites(const llvm::Value *V);
};

}

#endif
