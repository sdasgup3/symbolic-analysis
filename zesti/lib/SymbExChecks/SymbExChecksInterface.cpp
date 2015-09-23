#include "symbexchecks/SymbExChecksInterface.h"
#include "llvm/PassSupport.h"

using namespace llvm;

namespace symbexchecks {

char SymbExChecksInterface::ID;
static RegisterAnalysisGroup<SymbExChecksInterface>
  A("Symbolic Execution Pointer/Alias Analysis Checks Interface");

PointerCollector::PointerCollector() : llvmModule(0) {}

void PointerCollector::visitModule(Module &M) {
  Pointers.clear();
  llvmModule = &M;

  Module::global_iterator it = M.global_begin(), itEnd = M.global_end();
  for (; it != itEnd; ++it) {
    GlobalVariable *gv = &(*it);
    assert(gv->getType()->isPointerTy());
    GlobalPointers.insert(gv);
  }
}

void PointerCollector::visitFunction(Function &F) {
  Function::arg_iterator it = F.arg_begin(), itEnd = F.arg_end();
  for (; it != itEnd; ++it) {
    Argument *arg = &(*it);
    if (arg->getType()->isPointerTy())
      Pointers[&F].insert(arg);
  }
}

void PointerCollector::visitInstruction(Instruction &I) {
  Function *f = I.getParent()->getParent();

  if (I.getType()->isPointerTy())
    Pointers[f].insert(&I);

  User::op_iterator it = I.op_begin(), itEnd = I.op_end();
  for (; it != itEnd; ++it) {
    Value *op = *it;
    if (op->getType()->isPointerTy() && dyn_cast<ConstantExpr>(op)) {
      GlobalPointers.insert(op);
      visitConstantExpr(cast<ConstantExpr>(op));
    }
  }
}

void PointerCollector::visitConstantExpr(ConstantExpr *expr) {
  User::op_iterator it = expr->op_begin(), itEnd = expr->op_end();
  for (; it != itEnd; ++it) {
    Value *op = *it;
    if (op->getType()->isPointerTy() && dyn_cast<ConstantExpr>(op)) {
      GlobalPointers.insert(op);
      visitConstantExpr(cast<ConstantExpr>(op));
    }
  }
}

void PointerCollector::printPointers(raw_ostream &O) {
  O << "\n======================================================\n";
  O << "                   Global Pointers\n";
  O << "------------------------------------------------------\n\n";

  PointerSet::iterator itG = GlobalPointers.begin(),
                       itGEnd = GlobalPointers.end();
  for (; itG != itGEnd; ++itG) {
    const Value *ptr = *itG;
    O << "\t";
    ptr->print(O);
    O << "\n";
  }

  O << "======================================================\n\n";

  O << "\n======================================================\n";
  O << "                   Local Pointers\n";
  O << "------------------------------------------------------\n\n";

  PointerMap::iterator it = Pointers.begin(), itEnd = Pointers.end();
  for (; it != itEnd; ++it) {
    const Function *f = it->first;
    PointerSet &LocalPtrs = it->second;
    O << "Function: " << f->getName() << "\n";
    PointerSet::iterator it2 = LocalPtrs.begin(), it2End = LocalPtrs.end();
    for (; it2 != it2End; ++it2) {
      const Value *ptr = *it2;
      O << "\t";
      ptr->print(O);
      O << "\n";
    }
    O << "\n";
  }

  O << "======================================================\n\n";
}

const PointerCollector::PointerSet &
SymbExChecksInterface::getPointerSetForFunction(const llvm::Function *F) {
  return Collector.Pointers[F]; 
}

const PointerCollector::PointerSet &
SymbExChecksInterface::getGlobalPointerSet() {
  return Collector.GlobalPointers; 
}

}
