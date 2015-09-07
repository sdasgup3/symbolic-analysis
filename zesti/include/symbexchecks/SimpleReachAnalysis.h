#ifndef SIMPLEREACHANALYSIS_H
#define SIMPLEREACHANALYSIS_H

#include "llvm/ADT/SmallPtrSet.h"
#include "llvm/ADT/ValueMap.h"
#include "llvm/IR/Value.h"
#include "llvm/Pass.h"
#include <set>
#include <vector>

namespace symbexchecks {

// This class implements a reachablity analysis algorithm that
// discovers which inputs reach a specific LLVM value.
class SimpleReachAnalysis : public llvm::ModulePass {
private:
  // struct holding a memory write instruction
  struct MemoryWrite {
    llvm::Instruction *inst;
    llvm::Value *ptr;
    llvm::Value *val;
  };

  struct mwcomp {
    bool operator() (const struct MemoryWrite& lhs,
                     const struct MemoryWrite& rhs) const {
      return lhs.inst < rhs.inst;
    }
  };

  // Useful type definitions.
  typedef std::vector<const llvm::Value *> IndexToValueVector;
  typedef IndexToValueVector::size_type index_t;
  typedef llvm::ValueMap<const llvm::Value *, index_t> ValueToIndexMap;
  typedef std::set<struct MemoryWrite, mwcomp> MemoryWriteSet;
  typedef std::set<const llvm::Value *> InputSet;
  typedef std::set<const llvm::Value *> ValuePtrSet;
  typedef llvm::ValueMap<const llvm::Value *, InputSet> ReachMap;

  // Map from a value to the inputs affecting the value.
  ReachMap ValueToInputs;

  // Set of memory write instructions.
  MemoryWriteSet MemoryWrites;

  // Returns false, when v is not affected by any other values, otherwise
  // the values that directly affect the definition of v are inserted into
  // the Successors argument and true is returned.
  bool getImmediateSuccessors(const llvm::Value *v, ValuePtrSet &Successors);

  // This method actually runs the reachability analysis and populates the
  // ValueToInputs map with the result.
  void findReachingInputs(llvm::Module &M);

  // Returns false when no reaching input to v is found, otherwise
  // the reaching inputs are inserted into the Inputs argument
  // and true is returned.
  bool getReachingInputs(const llvm::Value *v, InputSet &Inputs);

  // Helper method that collects instructions that write to memory
  // into the MemoryWrites field of this class.
  void collectMemoryWrites(llvm::Module &M);
  
  // Helper method that enumerates all the reachability graph nodes
  // (instructions, globals, and formal arguments). It creates a mapping
  // from values to indicies and its inverse.
  void enumerateReachNodes(llvm::Module &M, IndexToValueVector &ValueOf,
                           ValueToIndexMap &IndexOf);

  bool isInput(const llvm::Value *v);
  
  void printReachNodes(llvm::raw_ostream &O, IndexToValueVector &ValueOf,
                       ValueToIndexMap &IndexOf);
  void printInputs(llvm::raw_ostream &O, const llvm::Value *v);

public:
  // Pass related
  static char ID;
  SimpleReachAnalysis() : llvm::ModulePass(ID) {}

  void getAnalysisUsage(llvm::AnalysisUsage &AU) const;
  const char *getPassName() const;
  bool runOnModule(llvm::Module &M);
};

}

#endif
