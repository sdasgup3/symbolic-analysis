#ifndef _LIBRARYFUNCTIONFACTS_H
#define _LIBRARYFUNCTIONFACTS_H

#include "relations/Database.h"
#include "llvm/Support/CallSite.h"

namespace llvmpa {

typedef void (*LibFuncHandlerTy) (Database *DB, llvm::CallSite *CS);

// string.h
void visitStrcpy(Database *DB, llvm::CallSite *CS);
void visitStrncpy(Database *DB, llvm::CallSite *CS);
void visitMemccpy(Database *DB, llvm::CallSite *CS);
void visitMemcpy(Database *DB, llvm::CallSite *CS);
void visitMemchr(Database *DB, llvm::CallSite *CS);
void visitMemmove(Database *DB, llvm::CallSite *CS);
void visitMemset(Database *DB, llvm::CallSite *CS);
void visitStrcat(Database *DB, llvm::CallSite *CS);
void visitStrchr(Database *DB, llvm::CallSite *CS);
void visitStrncat(Database *DB, llvm::CallSite *CS);
void visitStrbrk(Database *DB, llvm::CallSite *CS);
void visitStrrchr(Database *DB, llvm::CallSite *CS);
void visitStrstr(Database *DB, llvm::CallSite *CS);
void visitStrtok(Database *DB, llvm::CallSite *CS);
void visitStrtok_r(Database *DB, llvm::CallSite *CS);
// strings.h
void visitBcopy(Database *DB, llvm::CallSite *CS);
void visitIndex(Database *DB, llvm::CallSite *CS);
void visitRindex(Database *DB, llvm::CallSite *CS);

}

#endif
