#include "symbexchecks/SymbExChecksInterface.h"
#include "llvm/PassSupport.h"

using namespace llvm;

namespace symbexchecks {

char SymbExChecksInterface::ID;
static RegisterAnalysisGroup<SymbExChecksInterface>
  A("Symbolic Execution Pointer/Alias Analysis Checks Interface");

SymbExChecksVisitor::SymbExChecksVisitor() : llvmModule(0) {}

void SymbExChecksVisitor::visitModule(Module &M) {
  Pointers.clear();
  llvmModule = &M;
}

void SymbExChecksVisitor::visitFunction(Function &F) {
  Function::arg_iterator it = F.arg_begin(), itEnd = F.arg_end();
  for (; it != itEnd; ++it) {
    Argument *arg = &(*it);
    if (arg->getType()->isPointerTy())
      Pointers[&F].insert(arg);
  }
}

void SymbExChecksVisitor::visitInstruction(Instruction &I) {
  Function *f = I.getParent()->getParent();

  if (I.getType()->isPointerTy())
    Pointers[f].insert(&I);

  User::op_iterator it = I.op_begin(), itEnd = I.op_end();
  for (; it != itEnd; ++it) {
    Value *op = *it;
    if (op->getType()->isPointerTy() && dyn_cast<ConstantExpr>(op)) {
      Pointers[f].insert(op);
      visitConstantExpr(cast<ConstantExpr>(op), f);
    }
  }
}

void SymbExChecksVisitor::visitConstantExpr(ConstantExpr *expr, Function *f) {
  User::op_iterator it = expr->op_begin(), itEnd = expr->op_end();
  for (; it != itEnd; ++it) {
    Value *op = *it;
    if (op->getType()->isPointerTy() && dyn_cast<ConstantExpr>(op)) {
      Pointers[f].insert(op);
      visitConstantExpr(cast<ConstantExpr>(op), f);
    }
  }
}

void SymbExChecksVisitor::printPointers(raw_ostream &O) {
  O << "\n======================================================\n";
  O << "                   Local Pointers\n";
  O << "------------------------------------------------------\n\n";

  PointerMap::iterator it = Pointers.begin(), itEnd = Pointers.end();
  for (; it != itEnd; ++it) {
    Function *f = it->first;
    PointerSet &LocalPtrs = it->second;
    O << "Function: " << f->getName() << "\n";
    PointerSet::iterator it2 = LocalPtrs.begin(), it2End = LocalPtrs.end();
    for (; it2 != it2End; ++it2) {
      Value *ptr = *it2;
      O << "\t";
      ptr->print(O);
      O << "\n";
    }
    O << "\n";
  }

  O << "======================================================\n\n";
}

}
