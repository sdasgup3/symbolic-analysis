#ifndef _CONTEXT_H
#define _CONTEXT_H

#include "relations/Database.h"

namespace llvmpa {

class Context {
protected:
  Database *DB;
public:
  Context(Database *TheDB) : DB(TheDB) {}

  virtual llvm::Function *registerGlobalContext(const llvm::Module &M) =0;
  virtual void registerStartingPoint(const llvm::Function &F) =0;
};

class Context_1cs_h : public Context {
public:
  Context_1cs_h(Database *TheDB) : Context(TheDB) {}
  llvm::Function *registerGlobalContext(const llvm::Module &M);
  void registerStartingPoint(const llvm::Function &F);
};

class Context_insensitive : public Context {
public:
  Context_insensitive(Database *TheDB) : Context(TheDB) {}
  llvm::Function *registerGlobalContext(const llvm::Module &M);
  void registerStartingPoint(const llvm::Function &F);
};

}


#endif
