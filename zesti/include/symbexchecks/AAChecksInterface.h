#ifndef AACHECKSINTERFACE_H
#define AACHECKSINTERFACE_H

#include "symbexchecks/SymbExChecksInterface.h"
#include "llvm/Analysis/AliasAnalysis.h"

namespace symbexchecks {

// This class implements the symbolic execution interface for the LLVM AliasAnalysis
// group.
class AAChecksInterface : public SymbExChecksInterface {
private:
  // Pointer to the aa pass
  llvm::AliasAnalysis *AA;

  // Are interprocedural alias queries allowed
  bool interprocQueries;

  // Cache fo query results
  typedef llvm::ValueMap<const llvm::Value *, PtrList> AliasCache;
  AliasCache MustAliasCache;
  AliasCache MayNotAliasCache;

public:
  static char ID;
  AAChecksInterface() : SymbExChecksInterface(ID) {}

  void getAnalysisUsage(llvm::AnalysisUsage &AU) const;
  const char *getPassName() const;
  bool runOnModule(llvm::Module &M);

  // SymbExChecksInterface implementation methods
  bool mayAlias(const llvm::Value *V1, const llvm::Value *V2);
  bool mustAlias(const llvm::Value *V1, const llvm::Value *V2);
  PtrList &getMayNotAliasList(const llvm::Value *V); // cached
  PtrList &getMustAliasList(const llvm::Value *V); //cached
};

}

#endif
