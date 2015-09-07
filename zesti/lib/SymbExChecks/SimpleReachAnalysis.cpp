#include "symbexchecks/SimpleReachAnalysis.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/Module.h"
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

  MemoryWrites.clear();
  ValueToInputs.clear();

  collectMemoryWrites(M);

  findReachingInputs(M);
/*
  Module::iterator funIt = M.begin(), funItEnd = M.end();
  for (; funIt != funItEnd; ++funIt) {
    Function &F = *funIt;
    Function::iterator bbIt = F.begin(), bbItEnd = F.end();
    for (; bbIt != bbItEnd; ++bbIt) {
      BasicBlock &BB = *bbIt;
      BasicBlock::iterator instIt = BB.begin(), instItEnd = BB.end();
      for (; instIt != instItEnd; ++instIt) {
        Instruction &I = *instIt;
        if (LoadInst *loadInst = dyn_cast<LoadInst>(&I)) {
          Value *ptr = loadInst->getPointerOperand();
          printInputs(errs(), ptr);
        }
      } 
    }
  }
*/
  // does not modify module.
  return false;
}

void SimpleReachAnalysis::printReachNodes(raw_ostream &O,
                                          IndexToValueVector &ValueOf,
                                          ValueToIndexMap &IndexOf) {
  O << "\n======================================================\n";
  O << "Reach Nodes Enumeration" << "\n";
  O << "------------------------------------------------------\n\n";

  for (index_t i = 0; i < ValueOf.size(); ++i) {
    const Value *val = ValueOf[i];
    O << IndexOf[val] << ")\t";
    if (const Function *f = dyn_cast<Function>(val))
      O << "Function @" << f->getName();
    else
      val->print(O);
    O << "\n";
  }

  O << "======================================================\n\n";
}

void SimpleReachAnalysis::printInputs(raw_ostream &O, const Value *v) {
  O << "\n======================================================\n";
  O << *v << "\n";
  O << "------------------------------------------------------\n\n";

  ReachMap::iterator RMIt = ValueToInputs.find(v);
  if (RMIt == ValueToInputs.end()) {
    O << "\tValue cannot be affected by inputs (possibly constant.\n\n";
  }
  else {
    InputSet &ReachingInputs = RMIt->second;
    InputSet::iterator it = ReachingInputs.begin(),
                       itEnd = ReachingInputs.end();
    if (it == itEnd) {
      O << "\tNo reaching inputs found.\n\n";
    }
    else {
      for (; it != itEnd; ++it) {
        const Value *inp = *it;
        O << "\t";
        inp->print(O);
        O << "\n";
      }
      O << "\n";
    }
  }
  O << "======================================================\n\n";
}

bool SimpleReachAnalysis::isInput(const Value *v) {
  // return true for command line arguments, global variables, and
  // external function calls.
  return false;
}

void SimpleReachAnalysis::collectMemoryWrites(Module &M) {

  Module::iterator funIt = M.begin(), funItEnd = M.end();
  for (; funIt != funItEnd; ++funIt) {
    Function &F = *funIt;
    Function::iterator bbIt = F.begin(), bbItEnd = F.end();
    for (; bbIt != bbItEnd; ++bbIt) {
      BasicBlock &BB = *bbIt;
      BasicBlock::iterator instIt = BB.begin(), instItEnd = BB.end();
      for (; instIt != instItEnd; ++instIt) {
        MemoryWrite MW;
        Instruction &I = *instIt;
        if (StoreInst *storeInst = dyn_cast<StoreInst>(&I)) {
          MW.inst = storeInst;
          MW.ptr = storeInst->getPointerOperand();
          MW.val = storeInst->getValueOperand();
          MemoryWrites.insert(MW);
        }
        else if (AtomicCmpXchgInst *acxInst = dyn_cast<AtomicCmpXchgInst>(&I)) {
          MW.inst = acxInst;
          MW.ptr = acxInst->getPointerOperand();
          MW.val = acxInst->getNewValOperand();
          MemoryWrites.insert(MW);
        }
        else if (AtomicRMWInst *armwInst = dyn_cast<AtomicRMWInst>(&I)) {
          MW.inst = armwInst;
          MW.ptr = armwInst->getPointerOperand();
          MW.val = armwInst->getValOperand();
          MemoryWrites.insert(MW);
        }
      } 
    }
  }
}

void SimpleReachAnalysis::enumerateReachNodes(Module &M,
                                              IndexToValueVector &ValueOf,
                                              ValueToIndexMap &IndexOf) {
  index_t idx = 0;

  Module::global_iterator gvIt = M.global_begin(), gvItEnd = M.global_end();
  for (; gvIt != gvItEnd; ++gvIt) {
    GlobalVariable &GV = *gvIt;
    assert(idx + 1 > idx && "SimpleReachAnalysis: enumerateReachNodes"
                            " overflow!");
    ValueOf.push_back(&GV);
    IndexOf[&GV] = idx;
    ++idx;
  }

  Module::iterator funIt = M.begin(), funItEnd = M.end();
  for (; funIt != funItEnd; ++funIt) {
    Function &F = *funIt;
    assert(idx + 1 > idx && "SimpleReachAnalysis: enumerateReachNodes"
                            " overflow!");
    ValueOf.push_back(&F);
    IndexOf[&F] = idx;
    ++idx;

    Function::iterator bbIt = F.begin(), bbItEnd = F.end();
    for (; bbIt != bbItEnd; ++bbIt) {
      BasicBlock &BB = *bbIt;
      BasicBlock::iterator instIt = BB.begin(), instItEnd = BB.end();
      for (; instIt != instItEnd; ++instIt) {
        Instruction &I = *instIt;
        assert(idx + 1 > idx && "SimpleReachAnalysis: enumerateReachNodes"
                                " overflow!");
        ValueOf.push_back(&I);
        IndexOf[&I] = idx;
        ++idx;
      } 
    }

    Function::arg_iterator argIt = F.arg_begin(), argItEnd = F.arg_end();
    for (; argIt != argItEnd; ++argIt) {
      Argument &Arg = *argIt;
      assert(idx + 1 > idx && "SimpleReachAnalysis: enumerateReachNodes"
                              " overflow!");
      ValueOf.push_back(&Arg);
      IndexOf[&Arg] = idx;
      ++idx;
    }
  }
}

bool SimpleReachAnalysis::getImmediateSuccessors(const Value *v,
                                                 ValuePtrSet &Successors) {
  if (const Argument *arg = dyn_cast<Argument>(v)) {
    // case Argument
  }
  else if (const Instruction *inst = dyn_cast<Instruction>(v)) {
    // case Instruction
    if (const BinaryOperator *binop = dyn_cast<BinaryOperator>(inst)) {
      Successors.insert(binop->getOperand(0));
      Successors.insert(binop->getOperand(1));
      return true;
    }
    else if (const CmpInst *cmpInst = dyn_cast<CmpInst>(inst)) {
      Successors.insert(cmpInst->getOperand(0));
      Successors.insert(cmpInst->getOperand(1));
      return true;
    }
    else if (const CastInst *castInst = dyn_cast<CastInst>(inst)) {
      Successors.insert(castInst->getOperand(0));
      return true;
    }
    else if (const LoadInst *loadInst = dyn_cast<LoadInst>(inst)) {
      Successors.insert(loadInst->getPointerOperand());

      MemoryWriteSet::iterator MWIt = MemoryWrites.begin(),
                               MWItEnd = MemoryWrites.end();
      for (; MWIt != MWItEnd; ++MWIt)
        Successors.insert(MWIt->val);

      return true;
    }
  }
  else if (isa<Constant>(v))
    // Constant values cannot be affected by any
    // program input.
    return false;
  else if (isa<BasicBlock>(v))
    assert(false && "SimpleReachAnalysis: getImmediateSuccessors called "
                    "with BasicBlock value!");
  else if (isa<InlineAsm>(v))
    assert(false && "SimpleReachAnalysis: getImmediateSuccessors called "
                    "with an InlineAsm value!");
  else if (isa<MDNode>(v))
    assert(false && "SimpleReachAnalysis: getImmediateSuccessors called "
                    "with an MDNode value!");
  else
    assert(false && "SimpleReachAnalysis: getImmediateSuccessors called "
                    "with an unknown value");

  return false;
}

void SimpleReachAnalysis::findReachingInputs(Module &M) {
  IndexToValueVector ValueOf;
  ValueToIndexMap IndexOf;

  // enumerate nodes of the reachability graph
  enumerateReachNodes(M, ValueOf, IndexOf);
  index_t NumNodes = ValueOf.size();

  // this matrix will serve as the reachability graph
  unsigned char ReachMatrix[NumNodes][NumNodes];

  // initialize reachbility graph
  for (index_t i = 0; i < NumNodes; ++i) {
    const Value *val = ValueOf[i];
    for (index_t j = 0; j < NumNodes; ++j)
      ReachMatrix[i][j] = 0;
    ValuePtrSet Successors;
    getImmediateSuccessors(val, Successors);
    ValuePtrSet::iterator It = Successors.begin(), ItEnd = Successors.end();
    for (; It != ItEnd; ++It)
      ReachMatrix[i][IndexOf[*It]] = 1;
  }

  // compute full reachability graph with floyd-warshall
  for (index_t k = 0; k < NumNodes; ++k)
    for (index_t i = 0; i < NumNodes; ++i)
      for (index_t j = 0; j < NumNodes; ++j)
        if (ReachMatrix[i][k] && ReachMatrix[k][j])
          ReachMatrix[i][j] = 1;

  // populate the ValueToInputs map
  for (index_t i = 0; i < NumNodes; ++i) {
    const Value *val = ValueOf[i];
    InputSet &Inputs = ValueToInputs[val];
    for (index_t j = 0; j < NumNodes; ++j) {
      const Value *reachingVal = ValueOf[j];
      if (isInput(reachingVal))
        Inputs.insert(reachingVal);
    }
  }
}

bool SimpleReachAnalysis::getReachingInputs(const Value *v, InputSet &Inputs) {
  return false;
}

}
