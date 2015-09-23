#ifndef SYMBEXCHECKSINTERFACE_H
#define SYMBEXCHECKSINTERFACE_H

#include "llvm/ADT/SmallPtrSet.h"
#include "llvm/ADT/ValueMap.h"
#include "llvm/IR/Value.h"
#include "llvm/InstVisitor.h"
#include "llvm/Pass.h"


namespace symbexchecks {

// A visitor class that will collect all pointer instructions. 
class PointerCollector : public llvm::InstVisitor<PointerCollector> {
public:
  typedef llvm::SmallPtrSet<const llvm::Value*, 256> PointerSet;
  typedef llvm::ValueMap<const llvm::Function*, PointerSet> PointerMap;

  PointerMap Pointers;
  PointerSet GlobalPointers;
  llvm::Module *llvmModule;

  PointerCollector(void);
  void visitModule(llvm::Module &M);
  void visitFunction(llvm::Function &F);
  void visitInstruction(llvm::Instruction &I);

  void printPointers(llvm::raw_ostream &O);

private:
  void visitConstantExpr(llvm::ConstantExpr *expr);
};

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

  // Accessors for the visitor.
  const PointerCollector::PointerSet &
  getPointerSetForFunction(const llvm::Function *F);
  const PointerCollector::PointerSet &getGlobalPointerSet(void);
};

}

#endif
