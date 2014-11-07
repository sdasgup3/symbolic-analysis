#ifndef _FACTGENERATOR_H
#define _FACTGENERATOR_H

#include "context/Context.h"
#include "facts/FieldFactGenerator.h"
#include "facts/LibraryFunctionFacts.h"
#include "llvm/ADT/ValueMap.h"
#include "llvm/InstVisitor.h"
#include "llvm/Target/TargetLibraryInfo.h"

namespace llvmpa {

//
// Support for Library Functions: This struct holds all the library functions
// that our analysis handles, along with a pointer to an appropriate handler.
//
static const struct LibFunc {
  std::string name;
  LibFuncHandlerTy handler;
} LibFunctions[] = {
  // string.h
  {"strcpy",   visitStrcpy   },
  {"strncpy",  visitStrncpy  },
  {"memccpy",  visitMemccpy  },
  {"memcpy",   visitMemcpy   },
  {"memchr",   visitMemchr   },
  {"memmove",  visitMemmove  },
  {"memset",   visitMemset   },
  {"strcat",   visitStrcat   },
  {"strchr",   visitStrchr   },
  {"strncat",  visitStrncat  },
  {"strbrk",   visitStrbrk   },
  {"strrchr",  visitStrrchr  },
  {"strstr",   visitStrstr   },
  {"strtok",   visitStrtok   },
  {"strtok_r", visitStrtok_r },
  // strings.h
  {"bcopy",    visitBcopy   },
  {"index",    visitIndex   },
  {"rindex",   visitRindex  },
  // last element
  {"",         0            }
};


//
// Fact generator pass
//
class FactGenerator : public llvm::InstVisitor<FactGenerator> {
private:
  Database *DB;
  FieldFactGenerator *FFG;
  const llvm::TargetLibraryInfo *TLI;
  const llvm::DataLayout *DL;
  Context *AnalysisContext;

  llvm::Function *Main;

  llvm::ValueMap<llvm::Function *, LibFuncHandlerTy> LibFunctionHandlers;
  void registerLibraryFunctions(llvm::Module &M);

  bool isLLVMPAPtrTy(llvm::Type *Ty);

  void visitGlobalVariable(llvm::GlobalVariable &GV);
  void visitGlobalConstructors(llvm::Module &M);
  void visitGlobalDistructors(llvm::Module &M);

public:
  FactGenerator(Database *TheDB, FieldFactGenerator *TheFFG,
                const llvm::TargetLibraryInfo *TheTLI,
                const llvm::DataLayout *TheDL, Context *TheContext)
    : DB(TheDB), FFG(TheFFG), TLI(TheTLI), DL(TheDL),
      AnalysisContext(TheContext) {}

  void processModule(llvm::Module &M);

  // visitor functions
  void visitAllocaInst(llvm::AllocaInst &AI);
  void visitPHINode(llvm::PHINode &I);
  void visitSelectInst(llvm::SelectInst &I);
  void visitBinaryOperator(llvm::BinaryOperator &I);
  void visitBitCastInst(llvm::BitCastInst &I);
  void visitPtrToIntInst(llvm::PtrToIntInst &I);
  void visitIntToPtrInst(llvm::IntToPtrInst &I);
  void visitGetElementPtrInst(llvm::GetElementPtrInst &GEP);
  void visitLoadInst(llvm::LoadInst &I);
  void visitStoreInst(llvm::StoreInst &I);
  void visitAtomicCmpXchgInst(llvm::AtomicCmpXchgInst &I);
  void visitMemSetInst(llvm::MemSetInst &I);
  void visitMemCpyInst(llvm::MemCpyInst &I);
  void visitMemMoveInst(llvm::MemMoveInst &I);
  void visitVAStartInst(llvm::VAStartInst &I);
  void visitVACopyInst(llvm::VACopyInst &I);
  void visitVAArgInst(llvm::VAArgInst &I);
  void visitReturnInst(llvm::ReturnInst &I);
  void visitCallSite(llvm::CallSite CS);
  void visitFunction(llvm::Function &F);
};

}

#endif
