#ifndef SIMPLEREACHANALYSIS_H
#define SIMPLEREACHANALYSIS_H

#include "symbexchecks/PostDominanceFrontiers.h"
#include "llvm/IR/Value.h"
#include "llvm/InstVisitor.h"
#include "llvm/Pass.h"
#include <map>
#include <set>
#include <vector>

namespace symbexchecks {

// This class implements a reachablity analysis algorithm that
// discovers which inputs reach a specific LLVM value.
class SimpleReachAnalysis : public llvm::ModulePass,
                            public llvm::InstVisitor<SimpleReachAnalysis> {

public:
  typedef std::set<const llvm::Value *> ValueSet;

private:
  // struct holding a memory write instruction
  struct MemoryWrite {
    llvm::Value *memwrite;
    llvm::Value *ptr;
    llvm::Value *val;
  };

  struct mwcomp {
    bool operator() (const struct MemoryWrite& lhs,
                     const struct MemoryWrite& rhs) const {
      return lhs.memwrite == rhs.memwrite ?
               lhs.val < rhs.val :
               lhs.memwrite < rhs.memwrite;
    }
  };

  // Useful type definitions.
  typedef std::map<const llvm::Function *, PostDominanceFrontiers> PDFMap;
  typedef std::set<struct MemoryWrite, mwcomp> MemoryWriteSet;
  typedef std::set<const llvm::Function *> FunctionSet;
  typedef std::map<const llvm::Value *, ValueSet> ReachGraph;

  // Map from functions to their post dominance frontiers.
  PDFMap PDFs;

  // Set of memory write instructions.
  MemoryWriteSet MemoryWrites;

  // Set of functions that are used as function pointers.
  FunctionSet AddressTakenFunctions;

  // Initial reachability graph. Each node is an llvm value.
  // Edges flow from a node to the nodes that directly affect
  // its value computation.
  ReachGraph OneStepReachGraph;

  // Helper method that collects functions that are used as function
  // pointers into the AddressTakenFunctions field of this class.
  void collectAddressTakenFunctions(llvm::Module &M);

  // Helper method that collects instructions that write to memory
  // into the MemoryWrites field of this class. Requires
  // collectAddressTaken to have been called before.
  void collectMemoryWrites(llvm::Module &M);

  // Helper method that calculates the post dominance frontier sets of
  // the basic blocks of each function in the module. The sets are
  // stored into the PostDominanceFrontiers field of this class.
  void calculatePostDominanceFrontiers(llvm::Module &M);
  
  // This method populates the initial reachability graph found in
  // the field OneStepReachGraph.
  void initOneStepReachGraph(llvm::Module &M);

  // Helper method used to add information about a function call to
  // the OneStepReachGraph
  void visitFunctionCall(const llvm::Function *f, llvm::CallSite CS);

  // Print utilities
  void printPostDominanceFrontiers(llvm::raw_ostream &O) const;
  
public:
  // Pass related
  static char ID;
  SimpleReachAnalysis() : llvm::ModulePass(ID) {}

  void getAnalysisUsage(llvm::AnalysisUsage &AU) const;
  const char *getPassName() const;
  bool runOnModule(llvm::Module &M);

  // Overriden InstVisitor methods
  void visitBinaryOperator(llvm::BinaryOperator &I);
  void visitCmpInst(llvm::CmpInst &I);
  void visitCastInst(llvm::CastInst &I);
  void visitSelectInst(llvm::SelectInst &I);
  void visitGetElementPtrInst(llvm::GetElementPtrInst &I);
  void visitExtractElementInst(llvm::ExtractElementInst &I);
  void visitInsertElementInst(llvm::InsertElementInst &I);
  void visitShuffleVectorInst(llvm::ShuffleVectorInst &I);
  void visitExtractValueInst(llvm::ExtractValueInst &I);
  void visitInsertValueInst(llvm::InsertValueInst &I);
  void visitLoadInst(llvm::LoadInst &I);
  void visitAtomicCmpXchgInst(llvm::AtomicCmpXchgInst &I);
  void visitVAArgInst(llvm::VAArgInst &I);
  void visitPHINode(llvm::PHINode &I);
  void visitCallSite(llvm::CallSite CS);
  void visitIntrinsicInst(llvm::IntrinsicInst &I);

  // This method finds the inputs that affect the values provided
  // in the argument Values. The found inputs are inserted into the
  // Inputs argument.
  void getReachingInputs(const ValueSet &Values, ValueSet &Inputs,
                         const llvm::Module &M) const;

  // Returns true for values considered inputs by the analysis.
  bool isInput(const llvm::Value *v, const llvm::Module &M) const;
  
  // Print utilities
  void printValueSet(llvm::raw_ostream &O, const ValueSet &S) const;
  void printReachGraph(llvm::raw_ostream &O, const ReachGraph &G) const;
};

}

#endif
