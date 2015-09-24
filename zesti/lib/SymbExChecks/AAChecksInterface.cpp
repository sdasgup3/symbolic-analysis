#include "symbexchecks/AAChecksInterface.h"
#include "llvm/IR/Argument.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/Support/CommandLine.h"

using namespace llvm;
using std::map;
using std::string;

#include <llvm/Support/raw_ostream.h>

namespace symbexchecks {

// Helper functions
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


// Implementation of the AAChecksInterface pass
static cl::opt<bool> InterprocQueries("interproc-queries", cl::init(false),
    cl::desc("Allow interprocedural queries for the construction of the alias"
             " analysis interface"));

char AAChecksInterface::ID;

static RegisterPass<AAChecksInterface> AAChecksInterfacePI(
  "aa-interface", "Interface to the AA analysis group", false, true);

static RegisterAnalysisGroup<SymbExChecksInterface, true> X(AAChecksInterfacePI);

void  AAChecksInterface::getAnalysisUsage(llvm::AnalysisUsage &AU) const {
  AU.addRequiredTransitive<llvm::AliasAnalysis>();
  AU.setPreservesAll();
}

const char *AAChecksInterface::getPassName() const {
  return "Symbolic execution engine interface for the aa Analysis Group";
}

bool AAChecksInterface::runOnModule(Module &M) {
  // initialization
  AA = &getAnalysis<AliasAnalysis>();
  interprocQueries = InterprocQueries;
  Collector.visit(M);

  //Collector.printPointers(errs());


  // populating the alias query caches - for now the pointers
  // that can be used as keys in the caches are only pointers
  // found as agruments of load instructions.
  const symbexchecks::PointerCollector::PointerSet &GlobalPointers =
    getGlobalPointerSet();

  Module::iterator it = M.begin(), itEnd = M.end();
  for (; it != itEnd; ++it) {
    const Function *f = &*it;

    const symbexchecks::PointerCollector::PointerSet &Pointers =
      getPointerSetForFunction(f);

    Function::const_iterator bbIt = f->begin(), bbItEnd = f->end();
    for (; bbIt != bbItEnd; ++bbIt) {
      const BasicBlock *bb = &*bbIt;

      BasicBlock::const_iterator instIt = bb->begin(), instItEnd = bb->end();
      for (; instIt != instItEnd; ++instIt) {
        const Instruction *inst = &*instIt;
        if (const LoadInst *loadInst = dyn_cast<LoadInst>(inst)) {
          const Value *base = loadInst->getPointerOperand();

          if (!isa<Constant>(base) &&
              MayNotAliasCache.find(base) != MayNotAliasCache.end()) {
            assert(isa<Instruction>(base) || isa<Argument>(base));
            assert(MustAliasCache.find(base) != MustAliasCache.end());
            continue;
          }
          assert(isa<Constant>(base) ||
                 ( (isa<Instruction>(base) || isa<Argument>(base))    &&
                   MustAliasCache.find(base) == MustAliasCache.end()  &&
                   MayNotAliasCache.find(base) == MayNotAliasCache.end() 
		   ));

          PtrList &mayNotList = MayNotAliasCache[base];
          PtrList &mustList = MustAliasCache[base];

          symbexchecks::PointerCollector::PointerSet::iterator
            ptrsIt = Pointers.begin(), ptrsItEnd = Pointers.end();
          for (; ptrsIt != ptrsItEnd; ++ptrsIt) {
            const Value *ptr = *ptrsIt;
            if (mayAlias(base, ptr) == false) {
              mayNotList.push_back(ptr);
            }
            if (mustAlias(base, ptr) == true) {
              mustList.push_back(ptr);
            }
          }
        }
      }
    }
  }

  AliasCache::iterator cacheIt = MayNotAliasCache.begin();
  AliasCache::iterator cacheItEnd = MayNotAliasCache.end();
  for (; cacheIt != cacheItEnd; ++cacheIt) {
    const Value * base = cacheIt->first;
    PtrList &mayNotList = cacheIt->second;
    symbexchecks::PointerCollector::PointerSet::iterator 	
    ptrsIt = GlobalPointers.begin(), ptrsItEnd = GlobalPointers.end();
    for (; ptrsIt != ptrsItEnd; ++ptrsIt) {
      const Value *ptr = *ptrsIt;
      if (mayAlias(base, ptr) == false) {
        mayNotList.push_back(ptr);
      }
    }
  }

  cacheIt = MustAliasCache.begin();
  cacheItEnd = MustAliasCache.end();
  for (; cacheIt != cacheItEnd; ++cacheIt) {
    const Value * base = cacheIt->first;
    PtrList &mustList = cacheIt->second;
    symbexchecks::PointerCollector::PointerSet::iterator 	
    ptrsIt = GlobalPointers.begin(), ptrsItEnd = GlobalPointers.end();
    for (; ptrsIt != ptrsItEnd; ++ptrsIt) {
      const Value *ptr = *ptrsIt;
      if (mustAlias(base, ptr) == true) {
        mustList.push_back(ptr);
      }
    }
  }

  // does not modify module.
  return false;
}

bool AAChecksInterface::mayAlias(const llvm::Value *V1, const llvm::Value *V2) {
  // If interprocedural queries are not allowed we have to assume that
  // pointers from different functions may allias 
  if (!interprocQueries && differentParent(V1, V2))
    return true;

  return AA->alias(V1, V2);
}

bool AAChecksInterface::mustAlias(const llvm::Value *V1, const llvm::Value *V2) {
  // If interprocedural queries are not allowed we have to assume that
  // pointers from different functions do not have to allias 
  if (!interprocQueries && differentParent(V1, V2))
    return false;

  AliasAnalysis::AliasResult res = AA->alias(V1, V2);
  return res == AliasAnalysis::PartialAlias || res == AliasAnalysis::MustAlias;
}

SymbExChecksInterface::PtrList &
AAChecksInterface::getMayNotAliasList(const Value *V) {
  AliasCache::iterator it = MayNotAliasCache.find(V);
  assert(it != MayNotAliasCache.end());
  return it->second;
}

SymbExChecksInterface::PtrList &
AAChecksInterface::getMustAliasList(const Value *V) {
  AliasCache::iterator it = MustAliasCache.find(V);
  assert(it != MustAliasCache.end());
  return it->second;
}

}
