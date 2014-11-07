//===- AliasAnalysisInterface.cpp -----------------------------------------===//
//
//===----------------------------------------------------------------------===//
//
// Implementation of the basic points-to interface.
//
//===----------------------------------------------------------------------===//

#include "checker/interface/AliasAnalysisInterface.h"
#include "llvm/Analysis/MemoryBuiltins.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Support/Debug.h"
#include "llvm/Transforms/Scalar.h"
#include "llvm/InstVisitor.h"
#include "llvm/IR/DerivedTypes.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Constants.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/Pass.h"
#include "llvm/Support/Debug.h"
#include "llvm/ADT/Statistic.h"

using namespace llvm;
using std::map;
using std::string;

namespace aachecker {


//
// This visitor class is used to discover allocation sites
//
class AliasAnalysisInterfaceVisitor :
  public InstVisitor<AliasAnalysisInterfaceVisitor> {

public:
  // A map form allocation sites to abstract locations
  typedef std::map<const llvm::Value *, AbstractLoc> AllocSiteMapType; 

  // An iterator type for the map
  typedef AllocSiteMapType::const_iterator const_iterator;

private:
  AliasAnalysis *AA;
  AllocSiteMapType AllocSiteMap;

 public:
  AliasAnalysisInterfaceVisitor(AliasAnalysis *AA) : AA(AA) {}
  // Visitor methods
  void visitAllocaInst(llvm::AllocaInst &AI) {
    AllocSiteMap[&AI];
  }

  void visitCallSite(llvm::CallSite CS) {
    Instruction *CallInstr = CS.getInstruction();
    if (isAllocationFn(CallInstr, AA->getTargetLibraryInfo(), true))
      AllocSiteMap[CallInstr];
  }

  void visitFunction(llvm::Function &F) {
    AllocSiteMap[&F];
  }

  void visitModule(Module &M) {
    Module::global_iterator GlIt = M.global_begin(), GlItEnd = M.global_end();
    for (; GlIt != GlItEnd; ++GlIt)
      AllocSiteMap[&*GlIt];
  }

  // Methods to access the AllocSiteMap data structure
  bool isAllocSite(const Value *V) {
    return AllocSiteMap.find(V) != AllocSiteMap.end();
  }

  AbstractLoc &getAbstractLocForAllocSite(const Value * &V) {
    return AllocSiteMap.at(V);
  }

  const_iterator          begin() const { return AllocSiteMap.begin(); }
  const_iterator          end  () const { return AllocSiteMap.end();   }
  size_t                  size() const  { return AllocSiteMap.size();  }
  bool                    empty() const { return AllocSiteMap.empty(); }
};

//
// Helper functions
//
static const Function *getParent(const Value *V) {
  if (const Instruction *inst = dyn_cast<Instruction>(V))
    return inst->getParent()->getParent();

  if (const Argument *arg = dyn_cast<Argument>(V))
    return arg->getParent();

  return NULL;
}

static bool differentParent(const Value *O1, const Value *O2) {

  const Function *F1 = getParent(O1);
  const Function *F2 = getParent(O2);

  return F1 && F2 && F1 != F2;
}


//
// Implementation of the AliasAnalysisInterface pass
//
static cl::opt<bool> InterprocQueries("interproc-queries", cl::init(false),
    cl::desc("Allow interprocedural queries for the construction of the alias"
             " analysis interface"));

char AliasAnalysisInterface::ID;

static RegisterPass<AliasAnalysisInterface> AliasAnalysisInterfacePI(
  "aa-interface", "Interface to the AA analysis group", false, true);

static RegisterAnalysisGroup<AliasAnalysisCheckerInterface, true>
X(AliasAnalysisInterfacePI);

void  AliasAnalysisInterface::getAnalysisUsage(llvm::AnalysisUsage &AU) const {
  AU.addRequiredTransitive<llvm::AliasAnalysis>();
  AU.setPreservesAll();
}

const char *AliasAnalysisInterface::getPassName() const {
  return "Interface to the aa Analysis Group";
}

bool AliasAnalysisInterface::runOnModule(Module &M) {
  AA = &getAnalysis<AliasAnalysis>();

  interprocQueries = InterprocQueries;

  // Visit the module to add allocation site locations
  delete Visitor;
  Visitor = new AliasAnalysisInterfaceVisitor(AA);
  Visitor->visit(M);

  // Does not modify module.
  return false;
}

AliasAnalysisInterface::~AliasAnalysisInterface() {
  delete Visitor;
}

//
// For a given value in the module, returns a pointer to a set representing
// the set of abstract memory locations that the value can point to.
//
const AbstractLocSet *
AliasAnalysisInterface::getAbstractLocSetForValue(const Value *V) {
  //
  // Check if this abstract location set has been already constructed.
  //
  if (AbsLocSets.find(V) != AbsLocSets.end())
    return &AbsLocSets[V];

  // Else, iteratate through the allocation sites and determine which should be
  // included in the abstract location set for the value
  AliasAnalysisInterfaceVisitor::const_iterator I = Visitor->begin(),
    E = Visitor->end();
  for (; I != E; ++I) {
    const Value * AlllocSite = I->first;
    const AbstractLoc *Loc = &I->second;

    // If interprocedural queries are not allowed we have to assume that
    // pointers from different functions may allias 
    if (!interprocQueries && differentParent(AlllocSite, V)) {
      AbsLocSets[V].insert(Loc);
      continue;
    }

    if (AA->alias(AlllocSite, V))
      AbsLocSets[V].insert(Loc);
  }

  return &AbsLocSets[V];
}

//
// For a given value in the module, returns the set of all abstract memory
// locations reachable from that value.
//
const AbstractLocSet *
AliasAnalysisInterface::getReachableAbstractLocSetForValue(const Value *V) {
  return &EmptySet;
}

// Returns true if this is an allocation site
bool AliasAnalysisInterface::isAllocationSite(const Value *V) {
  return Visitor->isAllocSite(V);
}

// Returns the abstract location corresponding to external nodes.
const AbstractLoc *AliasAnalysisInterface::getExternalLoc() {
  return &ExternalAbsLoc;
}

// Return all abstract locations that may be created by an allocation site.
const AbstractLocSet &
AliasAnalysisInterface::getAllocatableLocs(const Value *V) {
  assert(isAllocationSite(V) && "This call makes no sense");

  //
  // Check if this allocation site has been already constructed.
  //
  if (AllocatableLocSets.find(V) != AllocatableLocSets.end())
    return AllocatableLocSets[V];

  // Else, create the set of allocatable abstract locations for this allocation
  // site.
  AllocatableLocSets[V].insert(&Visitor->getAbstractLocForAllocSite(V));

  return AllocatableLocSets[V];
}

}
