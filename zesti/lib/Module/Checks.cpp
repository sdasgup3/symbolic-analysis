//===-- Checks.cpp --------------------------------------------------------===//
//
//                     The KLEE Symbolic Virtual Machine
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//

#include "Passes.h"

#include "klee/Config/Version.h"

#include "llvm/Constants.h"
#include "llvm/DerivedTypes.h"
#include "llvm/Function.h"
#include "llvm/InstrTypes.h"
#include "llvm/Instruction.h"
#include "llvm/Instructions.h"
#include "llvm/IntrinsicInst.h"
#if LLVM_VERSION_CODE >= LLVM_VERSION(2, 7)
#include "llvm/LLVMContext.h"
#endif
#include "llvm/Module.h"
#include "llvm/Pass.h"
#include "llvm/Type.h"
#include "llvm/Transforms/Scalar.h"
#include "llvm/Transforms/Utils/BasicBlockUtils.h"
#if LLVM_VERSION_CODE <= LLVM_VERSION(3, 1)
#include "llvm/Target/TargetData.h"
#else
#include "llvm/DataLayout.h"
#endif
#include "llvm/Support/CallSite.h"
#include <iostream>
using namespace llvm;
using namespace klee;

char DivCheckPass::ID;

bool DivCheckPass::runOnModule(Module &M) { 
  Function *divZeroCheckFunction = 0;

  bool moduleChanged = false;
  
  for (Module::iterator f = M.begin(), fe = M.end(); f != fe; ++f) {
    for (Function::iterator b = f->begin(), be = f->end(); b != be; ++b) {
      for (BasicBlock::iterator i = b->begin(), ie = b->end(); i != ie; ++i) {     
          if (BinaryOperator* binOp = dyn_cast<BinaryOperator>(i)) {
          // find all [s|u][div|mod] instructions
          Instruction::BinaryOps opcode = binOp->getOpcode();
          if (opcode == Instruction::SDiv || opcode == Instruction::UDiv ||
              opcode == Instruction::SRem || opcode == Instruction::URem) {
            
            CastInst *denominator =
              CastInst::CreateIntegerCast(i->getOperand(1),
                                          Type::getInt64Ty(getGlobalContext()),
                                          false,  /* sign doesn't matter */
                                          "int_cast_to_i64",
                                          i);
            
            // Lazily bind the function to avoid always importing it.
            if (!divZeroCheckFunction) {
              Constant *fc = M.getOrInsertFunction("klee_div_zero_check", 
                                                   Type::getVoidTy(getGlobalContext()), 
                                                   Type::getInt64Ty(getGlobalContext()), 
                                                   NULL);
              divZeroCheckFunction = cast<Function>(fc);
            }

	    CallInst::Create(divZeroCheckFunction, denominator, "", &*i);
            moduleChanged = true;
          }
        }
      }
    }
  }
  return moduleChanged;
}

char AssertCheckPass::ID = 0;

bool AssertCheckPass::runOnModule(Module &M) {
  Function *enableSymbexFunction = 0;
  Function *disableSymbexFunction = 0;
  bool moduleChanged = false;
  /*
  for (Module::iterator f = M.begin(), fe = M.end(); f != fe; ++f) {
    for (Function::iterator b = f->begin(), be = f->end(); b != be; ++b) {
      BasicBlock::iterator it = b->begin();
      Instruction *i = it;
      if (i->getOpcode() == Instruction::Call) {
        CallSite cs(i);
        Function *f = cs.getCalledFunction();
        if (f && (f->getNameStr() == "__assert_fail")) {
          std::vector<BasicBlock*> Preds(pred_begin(b), pred_end(b));
          for (std::vector<BasicBlock*>::iterator it = Preds.begin(), ite = Preds.end();
              it != ite; ++it) {
            // need to get to the branch instruction and add a call to klee_enable_symbex
            // also need to disable symbex in the target bb
            BranchInst *bi = dyn_cast<BranchInst>((*it)->getTerminator());
            if(bi && bi->isConditional()) { // what about assert(false) ?
               // Lazily bind the function to avoid always importing it.
              if (!enableSymbexFunction) {
                Constant *fc = M.getOrInsertFunction("klee_enable_symbex",
                                                     Type::getVoidTy(getGlobalContext()),
                                                     NULL);
                if (NULL == fc) {
                  std::cerr << "got null fc" << std::endl;
                }
                std::cerr << "ooo " << fc << std::endl;
                enableSymbexFunction = cast<Function>(fc);
              }

              CallInst::Create(enableSymbexFunction, "", bi);
              moduleChanged = true;

              // not interested in the __assert_fail bb
              BasicBlock *bb = bi->getSuccessor(0);
              if (bb == &*b)
                bb = bi->getSuccessor(1);
               if (!disableSymbexFunction) {
                Constant *fc = M.getOrInsertFunction("klee_disable_symbex", 
                                                     Type::getVoidTy(getGlobalContext()), 
                                                     NULL);
                disableSymbexFunction = cast<Function>(fc);
              }
              CallInst::Create(disableSymbexFunction, "", bb->begin());
              moduleChanged = true;

            }
          }
        }
      }
    }
  }
  */
  return moduleChanged;
}
