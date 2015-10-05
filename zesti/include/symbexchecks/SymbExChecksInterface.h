#ifndef SYMBEXCHECKSINTERFACE_H
#define SYMBEXCHECKSINTERFACE_H

#include "symbexchecks/PointerCollector.h"
#include "llvm/IR/Value.h"
#include "llvm/Pass.h"

namespace symbexchecks {

// This class defines an interface used by the symbolic execution engine to
// perform alias/pointer analysis checks. A subclass that implements the
// interface should be provided for each pointer analysis pass to be checked.
class SymbExChecksInterface : public llvm::ModulePass {
protected:
  PointerCollector Collector;
  
public:
  static char ID;
  SymbExChecksInterface() : llvm::ModulePass(ID) {}
  SymbExChecksInterface(char &id) : llvm::ModulePass(id) {}

  // Alias queries for two given values. Should be implemented by the
  // subclasses.
  virtual bool mayAlias(const llvm::Value *V1, const llvm::Value *V2)=0;
  virtual bool mustAlias(const llvm::Value *V1, const llvm::Value *V2)=0;

  // Alias queries for a single value. Should be implemented by the
  // subclasses.
  typedef std::vector<const llvm::Value *> PtrList;
  virtual PtrList &getMayNotAliasList(const llvm::Value *V)=0;
  virtual PtrList &getMustAliasList(const llvm::Value *V)=0;
  virtual void   setAuxList(const llvm::Value *V, bool updateMustList, int index, bool value)=0;
  virtual void   dumpAuxInfo(llvm::raw_ostream &)=0;


  // Accessors for the visitor.
  const PointerCollector::PointerSet &
  getPointerSetForFunction(const llvm::Function *F);
  const PointerCollector::PointerSet &getGlobalPointerSet(void);
};

}

#endif
