#ifndef SIMPLEREACHANALYSIS_H
#define SIMPLEREACHANALYSIS_H

#include "llvm/ADT/SmallPtrSet.h"
#include "llvm/ADT/ValueMap.h"
#include "llvm/IR/Value.h"
#include "llvm/Pass.h"
#include <set>

namespace symbexchecks {

// This class implements a reachablity analysis algorithm that
// discovers which inputs reach a specific LLVM value.
class SimpleReachAnalysis : public llvm::ModulePass {
private:
  // Useful set type definitions.
  typedef std::set<const llvm::Value *> InputSet;
  typedef llvm::SmallPtrSet<const llvm::Value *, 8> ValuePtrSet;

  // Map from a value to the inputs affecting the value.
  typedef llvm::ValueMap<const llvm::Value *, InputSet> ReachMap;
  ReachMap ValueToInputs;

  // Map from a value to the values that need to be revisited to
  // produce a complete set of inputs affecting the value.
  typedef llvm::ValueMap<const llvm::Value *, ValuePtrSet> IncompleteMap;
  IncompleteMap ValueToRemainingOps;

  // Map from a value to its state:
  //   Completed  -> the inputs affecting the value can be found
  //                 from ValueToInputs
  //   InProgress -> inputs affecting this value are currently being
  //                 collected - the inputs found in ValueToInputsMap
  //                 are a partial result
  //   Incomplete -> not all inputs affecting this value have been
  //                 collected - use ValueToRemainingOps to find
  //                 the operands that still need to be revisited
  enum ValueState { Completed, InProgress, Incomplete };
  typedef llvm::ValueMap<const llvm::Value *, enum ValueState> StateMap;
  StateMap ValueToState;

  // Returns false, when v is not affected by any other values, otherwise
  // the values that directly affect the definition of v are inserted into
  // the Successors argument and true is returned.
  bool getImmediateSuccessors(const llvm::Value *v, ValuePtrSet &Successors);

  bool isInput(const llvm::Value *);
  
  // Returns false when no reaching input to v is found, otherwise
  // the reaching inputs are inserted into the Inputs argument
  // and true is returned.
  bool getReachingInputs(const llvm::Value *v, InputSet &Inputs);

  // Helper recursive function for input discovery. 
  enum ValueState getReachingInputsRec(const llvm::Value *v, InputSet &Inputs);
  
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
