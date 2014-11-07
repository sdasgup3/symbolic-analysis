#ifndef _FACTGENPASS_H
#define _FACTGENPASS_H

#include "facts/ConstantFactGenerator.h"
#include "facts/FactGenerator.h"

namespace llvmpa {

//
// This pass coordinates the fact generation stage of llvmpa. It constructs the
// database of facts generated from the module.
//
class FactGenPass : public llvm::ModulePass {
private:
  Database DB;

  FieldFactGenerator *FFG;
  ConstantFactGenerator *CFG;
  FactGenerator *FG;
  Context *AnalysisContext;


public:
  static char ID;

  Database &getDB() { return DB; }

  FactGenPass() : llvm::ModulePass(ID), FFG(0), CFG(0), FG(0),
                  AnalysisContext(0) {}

  ~FactGenPass();

  FieldFactGenerator *getFieldFactGenerator() { return FFG; }

  virtual bool runOnModule(llvm::Module &M);

  void getAnalysisUsage(llvm::AnalysisUsage &AU) const;
};

}

#endif
