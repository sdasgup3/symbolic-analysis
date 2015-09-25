#ifndef POINTERCOLLECTOR_H
#define POINTERCOLLECTOR_H

#include "llvm/ADT/SmallPtrSet.h"
#include "llvm/ADT/ValueMap.h"
#include "llvm/InstVisitor.h"
#include <map>

namespace symbexchecks {

// A visitor class that will collect all pointer instructions.
// Use like this:
//   PointerCollector PC;
//   PC.visit(M);
// Then the public fields Pointers and GlobalPointers contain
// local (per function) and global pointer respectively for the module M.
class PointerCollector : public llvm::InstVisitor<PointerCollector> {
public:
  typedef llvm::SmallPtrSet<const llvm::Value*, 256> PointerSet;
  typedef llvm::ValueMap<const llvm::Function*, PointerSet> PointerMap;

  PointerMap Pointers;
  PointerSet GlobalPointers;
  llvm::Module *llvmModule;

  PointerCollector(void);
  void visitModule(llvm::Module &M);
  void visitFunction(llvm::Function &F);
  void visitInstruction(llvm::Instruction &I);

  void printPointers(llvm::raw_ostream &O);

private:
  void visitConstantExpr(llvm::ConstantExpr *expr);
};

}
#endif
