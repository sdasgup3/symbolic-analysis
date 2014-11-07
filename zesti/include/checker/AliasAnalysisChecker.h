//===-- AliasAnalysisChecker.h ------------------------------------------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// AliasAnalysisChecker inserts runtime checks into the code to make sure that
// the points-to alias analysis is working properly.
//
//===----------------------------------------------------------------------===//

#ifndef ALIASANALYSISCHECKER_H
#define ALIASANALYSISCHECKER_H

#include "checker/interface/AliasAnalysisCheckerInterface.h"
#include "llvm/Target/TargetLibraryInfo.h"
#include "llvm/IR/IRBuilder.h"


namespace aachecker{

class AliasAnalysisChecker : public llvm::ModulePass {
  protected:   
    AliasAnalysisCheckerInterface *pti;
    llvm::Constant *Logger;
    llvm::Constant *NoteAL;
    llvm::Constant *GetAL;
    llvm::Constant *FreeAL;
    llvm::Constant *Abort;

    llvm::DataLayout *DL;
    llvm::TargetLibraryInfo *TLI;

    llvm::DenseMap<const AbstractLoc *, uint32_t> locationIds;
    uint32_t nextID;

    virtual void checkFunction(llvm::Function &F);
    virtual void addChecks(llvm::Value *A, llvm::IRBuilder<true> &Builder);

    virtual void numberGlobalAllocationSites(llvm::Module &M);
    virtual void numberAllocationSites(llvm::Function &F);
    virtual void cleanupOnExit(llvm::Function &F, llvm::Value *V,
        llvm::IRBuilder<true> &Builder);

    uint32_t getLocationId(const AbstractLoc *loc);
    void printString(const llvm::Value *V, llvm::raw_ostream &out);
    
  public:
    AliasAnalysisChecker() : llvm::ModulePass(ID), pti(0), nextID(1) {}

    static char ID;
    void getAnalysisUsage(llvm::AnalysisUsage &AU) const;
    const char *getPassName() const;
    bool runOnModule(llvm::Module &M);

    void setAliasAnalysisCheckerInterface(AliasAnalysisCheckerInterface *pti);
};
}

#endif
