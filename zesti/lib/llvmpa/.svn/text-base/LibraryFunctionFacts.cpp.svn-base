#include "facts/LibraryFunctionFacts.h"
#include "llvm/IR/BasicBlock.h"

using namespace llvm;

namespace llvmpa {

void visitStrcpy(Database *DB, CallSite *CS) {
  Value *Dest = CS->getArgument(0);
  Value *Ret = CS->getInstruction();
  Function *Parent = CS->getCaller();

  DB->add("PtrAssign", Ret, Dest, Parent);
}


void visitStrncpy(Database *DB, CallSite *CS) {
  Value *Dest = CS->getArgument(0);
  Value *Ret = CS->getInstruction();
  Function *Parent = CS->getCaller();

  DB->add("PtrAssign", Ret, Dest, Parent);
}


void visitMemccpy(Database *DB, CallSite *CS) {
  Value *Dest = CS->getArgument(0);
  Value *Source =  CS->getArgument(1);
  Value *Ret = CS->getInstruction();
  Function *Parent = CS->getCaller();

  DB->add("Copy", Dest, Source, Parent);
  DB->add("PtrAssign", Ret, Dest, Parent);
}

void visitMemcpy(Database *DB, CallSite *CS) {
  Value *Dest = CS->getArgument(0);
  Value *Source =  CS->getArgument(1);
  Value *Ret = CS->getInstruction();
  Function *Parent = CS->getCaller();

  DB->add("Copy", Dest, Source, Parent);
  DB->add("PtrAssign", Ret, Dest, Parent);
}


void visitMemchr(Database *DB, CallSite *CS) {
  Value *Dest = CS->getArgument(0);
  Value *Source =  CS->getArgument(1);
  Value *Ret = CS->getInstruction();
  Function *Parent = CS->getCaller();

  DB->add("Copy", Dest, Source, Parent);
  DB->add("PtrAssign", Ret, Dest, Parent);
}


void visitMemmove(Database *DB, CallSite *CS) {
  Value *Dest = CS->getArgument(0);
  Value *Source =  CS->getArgument(1);
  Value *Ret = CS->getInstruction();
  Function *Parent = CS->getCaller();

  DB->add("Copy", Dest, Source, Parent);
  DB->add("PtrAssign", Ret, Dest, Parent);
}


void visitMemset(Database *DB, CallSite *CS) {
  Value *Dest = CS->getArgument(0);
  Value *Source =  CS->getArgument(1);
  Value *Ret = CS->getInstruction();
  Function *Parent = CS->getCaller();

  DB->add("Copy", Dest, Source, Parent);
  DB->add("PtrAssign", Ret, Dest, Parent);
}


void visitStrcat(Database *DB, CallSite *CS) {
  Value *Dest = CS->getArgument(0);
  Value *Ret = CS->getInstruction();
  Function *Parent = CS->getCaller();

  DB->add("PtrAssign", Ret, Dest, Parent);
}


void visitStrchr(Database *DB, CallSite *CS) {
  Value *Ptr = CS->getArgument(0);
  Value *Ret = CS->getInstruction();
  Function *Parent = CS->getCaller();

  DB->add("PtrAssign", Ret, Ptr, Parent);
}


void visitStrncat(Database *DB, CallSite *CS) {
  Value *Dest = CS->getArgument(0);
  Value *Ret = CS->getInstruction();
  Function *Parent = CS->getCaller();

  DB->add("PtrAssign", Ret, Dest, Parent);
}


void visitStrbrk(Database *DB, CallSite *CS) {
  Value *Ptr = CS->getArgument(0);
  Value *Ret = CS->getInstruction();
  Function *Parent = CS->getCaller();

  DB->add("PtrAssign", Ret, Ptr, Parent);
}


void visitStrrchr(Database *DB, CallSite *CS) {
  Value *Ptr = CS->getArgument(0);
  Value *Ret = CS->getInstruction();
  Function *Parent = CS->getCaller();

  DB->add("PtrAssign", Ret, Ptr, Parent);
}


void visitStrstr(Database *DB, CallSite *CS) {
  Value *Ptr = CS->getArgument(0);
  Value *Ret = CS->getInstruction();
  Function *Parent = CS->getCaller();

  DB->add("PtrAssign", Ret, Ptr, Parent);
}


void visitStrtok(Database *DB, CallSite *CS) {
  Value *Ptr = CS->getArgument(0);
  Value *Ret = CS->getInstruction();
  Function *Parent = CS->getCaller();

  DB->add("PtrAssign", Ret, Ptr, Parent);
}


void visitStrtok_r(Database *DB, CallSite *CS) {
  Value *Ptr = CS->getArgument(0);
  Value *Ret = CS->getInstruction();
  Function *Parent = CS->getCaller();

  DB->add("PtrAssign", Ret, Ptr, Parent);
}


void visitBcopy(Database *DB, CallSite *CS) {
  Value *Dest = CS->getArgument(0);
  Value *Source =  CS->getArgument(1);
  Function *Parent = CS->getCaller();

  DB->add("Copy", Dest, Source, Parent);
}


void visitIndex(Database *DB, CallSite *CS) {
  Value *Ptr = CS->getArgument(0);
  Value *Ret = CS->getInstruction();
  Function *Parent = CS->getCaller();

  DB->add("PtrAssign", Ret, Ptr, Parent);
}


void visitRindex(Database *DB, CallSite *CS) {
  Value *Ptr = CS->getArgument(0);
  Value *Ret = CS->getInstruction();
  Function *Parent = CS->getCaller();

  DB->add("PtrAssign", Ret, Ptr, Parent);
}



}
