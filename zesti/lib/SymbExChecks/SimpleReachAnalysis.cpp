#include "symbexchecks/SimpleReachAnalysis.h"
#include "llvm/Support/raw_ostream.h"

using namespace llvm;

namespace symbexchecks {

char SimpleReachAnalysis::ID;

static RegisterPass<SimpleReachAnalysis> SimpleReachAnalysisPI(
  "simplereach", "Simple reachability analysis from "
                 "inputs to LLVM values", false, true);

void  SimpleReachAnalysis::getAnalysisUsage(llvm::AnalysisUsage &AU) const {
  AU.setPreservesAll();
}

const char *SimpleReachAnalysis::getPassName() const {
  return "Simple reachability analysis from inputs to LLVM values";
}

bool SimpleReachAnalysis::runOnModule(Module &M) {

  errs() << "SimpleReachAnalysis runs!!!\n";

  // does not modify module.
  return false;
}

bool SimpleReachAnalysis::isInput(const Value *) {
  // return true for command line arguments, global variables, and
  // external function calls.
  return false;
}

bool SimpleReachAnalysis::getImmediateSuccessors(const Value *v,
                                                 ValuePtrSet &Successors) {
/*
  if (const Argument *arg = dyn_cast<Argument>(v)) {
    // case Argument
  }
  else if (const Instruction *inst = dyn_cast<Instruction>(v)) {
    // case Instruction
  }
  else if (isa<Constant>(v))
    // Constant values cannot be affected by any
    // program input.
    return false;
  else if (isa<BasicBlock>(v))
    assert(false && "SimpleReachAnalysis.getReachingInputs called "
                    "a BasicBlock value!");
  else if (isa<InlineAsm>(v))
    assert(false && "SimpleReachAnalysis.getReachingInputs called "
                    "an InlineAsm value!");
  else if (isa<MDNode>(v))
    assert(false && "SimpleReachAnalysis.getReachingInputs called "
                    "an MDNode value!");
  else
    assert(false && "SimpleReachAnalysis.getReachingInputs: unknown value");
*/

  return false;
}

bool SimpleReachAnalysis::getReachingInputs(const Value *v, InputSet &Inputs) {

  unsigned size = Inputs.size();
  ValueState State = getReachingInputsRec(v, Inputs);
  unsigned newSize = Inputs.size();
  assert(newSize >= size && "SimpleReachAnalysis: Inputs lost.");

  if (State == Incomplete) {
    // The result is incomplete because of dependency cycles. We
    // ignore the cycles and change the result to completed.
    assert(ValueToRemainingOps.find(v) != ValueToRemainingOps.end() &&
           "SimpleReachAnalysis: No incomplete set for incomplete value.");
    ValueToState[v] = Completed;
    ValueToRemainingOps.erase(v);
  }

  assert(State != InProgress && "SimpleReachAnalysis: InProgress returned at "
                                "the top of the recursion.");
  return newSize > size;
}

SimpleReachAnalysis::ValueState
SimpleReachAnalysis::getReachingInputsRec(const Value *v, InputSet &Inputs) {

  StateMap::iterator SMIt = ValueToState.find(v);
  if (SMIt != ValueToState.end()) {
    enum ValueState State = SMIt->second;

    assert(ValueToInputs.find(v) != ValueToInputs.end() &&
           "SimpleReachAnalysis: No reaching input set for value with state.");

    InputSet &ReachingInputs = ValueToInputs[v];


    switch (State) {
      case Completed:
      {
        Inputs.insert<InputSet::iterator>(ReachingInputs.begin(),
                                          ReachingInputs.end());
        return Completed;
      }

      case InProgress:
        return InProgress;

      case Incomplete:
      {
        // 0. change state of v to InProgress
        ValueToState[v] = InProgress;

        // 1. explore remaining values found in ValueToRemainingOps[v]
        // 2. all inputs returned from rec calls are added to ValueToInputs[v]
        IncompleteMap::iterator IMIt = ValueToRemainingOps.find(v);
        assert(IMIt != ValueToRemainingOps.end() &&
               "SimpleReachAnalysis: No incomplete set for incomplete value.");

        ValuePtrSet &Remaining = IMIt->second;
        assert(!Remaining.empty() &&
               "SimpleReachAnalysis: Empty incomplete set for incomplete value.");

        bool stillIncomplete = false;
        ValuePtrSet NewlyCompleted;

        ValuePtrSet::iterator It = Remaining.begin(), ItEnd = Remaining.end();
        for (; It != ItEnd; ++It) {
          const Value *remV = *It;
          ValueState resState = getReachingInputsRec(remV, ReachingInputs);
          if (resState == Completed)
            NewlyCompleted.insert(remV);
          else
            stillIncomplete = true;
        }

        Inputs.insert<InputSet::iterator>(ReachingInputs.begin(),
                                          ReachingInputs.end());

        // 3. if all rec calls return Completed,
        // 4.   change state of v to Completed and
        //      return (Completed, ValueToInputs[v])
        if (!stillIncomplete) {
          ValueToState[v] = Completed;
          ValueToRemainingOps.erase(v); 
          return Completed;
        }

        // 5. else, change state of v to Incomplete, remove newly completed
        //          remaining values, and return (Incomplete, ValueToInputs[v])
        ValueToState[v] = Incomplete;
        
        ValuePtrSet::iterator NCIt = NewlyCompleted.begin(),
                              NCItEnd = NewlyCompleted.end();
        for (; It != NCItEnd; ++NCIt)
          Remaining.erase(*NCIt);

        return Incomplete;
      }
    }
  }

  // No state was found for v
  assert(ValueToInputs.find(v) == ValueToInputs.end() &&
         "SimpleReachAnalysis: Reaching input set found "
         "for value with no state.");
  assert(ValueToRemainingOps.find(v) == ValueToRemainingOps.end() &&
         "SimpleReachAnalysis: Incomplete set found for value with no state.");

  // 0. if v is an input value (command line arg, external call result, constant, etc),
  // 1.   add it to Inputs, return (Completed, Inputs)
  if (isInput(v)) {
    Inputs.insert(v);
    return Completed;
  }

  // 2. else, find Immediate Successor values
  ValuePtrSet Successors;
  getImmediateSuccessors(v, Successors);

  // 3. set state of v to InProgress
  ValueToState[v] = InProgress;

  // 4. for each successor, rec call
  // 5. all inputs returned from rec calls are added to ValueToInputs[v]
  InputSet FoundInputs;
  ValuePtrSet Remaining; 
  bool incomplete = false;

  ValuePtrSet::iterator It = Successors.begin(), ItEnd = Successors.end();
  for (; It != ItEnd; ++It) {
    const Value *succV = *It;
    ValueState resState = getReachingInputsRec(succV, FoundInputs);
    if (resState != Completed) {
      incomplete = true;
      Remaining.insert(succV);
    }
  }

  ValueToInputs[v] = FoundInputs;
  Inputs.insert<InputSet::iterator>(FoundInputs.begin(), FoundInputs.end());

  // 3. if all rec calls return Completed, change state of v to Completed and
  //                                       return Completed
  if (!incomplete) {
    ValueToState[v] = Completed;
    return Completed;
  }

  // 4. else, change state of v to Incomplete and return Incomplete
  ValueToState[v] = Incomplete;
  ValueToRemainingOps[v] = Remaining;
  return Incomplete;
}

}
