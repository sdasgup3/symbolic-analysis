#ifndef DSACHECKSINTERFACE_H
#define DSACHECKSINTERFACE_H

#include "symbexchecks/SymbExChecksInterface.h"
#include "dsa/DataStructure.h"

namespace symbexchecks {

// This class implements the symbolic execution interface for the 
// DSA (Data Structure Analysis) pointer analysis.
class DSAChecksInterface : public SymbExChecksInterface {
private:
  llvm::DataStructures *Graphs;
 
  llvm::DSGraph *getGraphForValue(const llvm::Value *V);

public:
  static char ID;
  DSAChecksInterface() : SymbExChecksInterface(ID) {}

  void getAnalysisUsage(llvm::AnalysisUsage &AU) const;
  const char *getPassName() const;
  bool runOnModule(llvm::Module &M);

  // SymbExChecksInterface implementation methods
  bool mayAlias(const llvm::Value *V1, const llvm::Value *V2);
  bool mustAlias(const llvm::Value *V1, const llvm::Value *V2);
  PtrList &getMayNotAliasList(const llvm::Value *V);
  PtrList &getMustAliasList(const llvm::Value *V);
  void setAuxList(const llvm::Value *V, bool updateMustList, int index, bool value);
  void dumpAuxInfo(llvm::raw_ostream &);


};

}

#endif
