#ifndef _CONSTANTFACTGENERATOR_H
#define _CONSTANTFACTGENERATOR_H

#include "facts/FieldFactGenerator.h"
#include "context/Context.h"
#include "llvm/InstVisitor.h"

namespace llvmpa {

typedef std::set<llvm::Constant *> InitializerSet;

//
// Handle fact generation for constant expression values
//
class ConstantFactGenerator : public llvm::InstVisitor<ConstantFactGenerator> {
private:
  Database *DB;
  FieldFactGenerator *FFG;
  const llvm::DataLayout *DL;
  Context *AnalysisContext;
  std::set< std::pair<llvm::Constant *, llvm::Function*> > FinishedValues;

  bool isLLVMPAPtrTy(llvm::Type *Ty);

  void addFactsForConstant(llvm::Function *F, llvm::Constant *C);
  void visitGlobalVariable(llvm::Function *GlobalFunction,
                           llvm::GlobalVariable &GV);
  void getInitializerSequence(llvm::Function *GlobalFunction,
                              llvm::Constant *Init,
                              std::vector<InitializerSet> &Initializers);


public:
  static char ID;

  ConstantFactGenerator(Database *TheDB, FieldFactGenerator *TheFFG,
                        const llvm::DataLayout *TheDL, Context *TheContext)
   : DB(TheDB), FFG(TheFFG), DL(TheDL), AnalysisContext(TheContext) {}

  void processModule(llvm::Module &M);

  // visitor functions
  void visitInstruction(llvm::Instruction &I);

};

}

#endif
