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
          isPointerSymMap[base] = std::pair<bool, bool>(false, false);

          symbexchecks::PointerCollector::PointerSet::iterator
            ptrsIt = Pointers.begin(), ptrsItEnd = Pointers.end();
          for (; ptrsIt != ptrsItEnd; ++ptrsIt) {
            const Value *ptr = *ptrsIt;
            if (mayAlias(base, ptr) == false) {
              //Two pointers P1, P2 need to be different for mayAlias(P1,P2)
              //to be false.
              assert(base != ptr && "Pointers base, ptr need to be different "
                                    "for mayAlias(base,ptr) to be false");

              //H2: Two different alloca instruction will trivially not 
              //be alias. No need to check it.
              //H2: Two different global variables  will trivially not
              //be alias. No need to check it.
              if (base != ptr && ( (true == isa<AllocaInst>(ptr) &&
                                    true == isa<AllocaInst>(base)) ||
                                   (true == isa<GlobalVariable>(ptr) &&
                                    true == isa<GlobalVariable>(base)) )) {
                continue;
              }

              mayNotList.push_back(ptr);
              isPointerSymMap[ptr] = std::pair<bool, bool>(false, false);
            }

            if (mustAlias(base, ptr) == true) {
              //mustAlias(P1,P2) should not  be true if both are
              //different allocas or both are different globals.	    
              assert(((base == ptr) ||
                     !((true == isa<AllocaInst>(ptr) &&
                        true == isa<AllocaInst>(base))  ||
                       (true == isa<GlobalVariable>(ptr) &&
                        true == isa<GlobalVariable>(base))))  && 
                     "Both base and ptr cannot to allocates or globals "
                     "for mustAlias(base,ptr) to be true");

              //H1: mustAlias(ptr,ptr) is trivially true. No need to check it.
              if(base == ptr) continue;

              mustList.push_back(ptr);
              isPointerSymMap[ptr] = std::pair<bool, bool>(false, false);
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
        //Two pointers P1, P2 need to be different for mayAlias(P1,P2)
        //to be false.
        assert(base != ptr && "Pointers base, ptr need to be different "
                              "for mayAlias(base,ptr) to be false");

        //H2: Two different global variables  will trivially not be
        //alias. No need to check it.
        if(base != ptr && (true == isa<GlobalVariable>(ptr) &&
           true == isa<GlobalVariable>(base))) {
          continue;
        }

        mayNotList.push_back(ptr);
        isPointerSymMap[ptr] = std::pair<bool, bool>(false, false);
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
        //mustAlias(P1,P2) can never be true if both are different allocas.
        assert(((base  == ptr) || 
                !(true == isa<GlobalVariable>(ptr) &&
                  true == isa<GlobalVariable>(base))) &&
               "Both base and ptr cannot to allocates or globals "
               "for mustAlias(base,ptr) to be true");

        //H1: mustAlias(ptr,ptr) is trivially true. No need to check it.
        if(base == ptr) continue;

        mustList.push_back(ptr);
        isPointerSymMap[ptr] = std::pair<bool, bool>(false, false);
      }
    }
  }

  /*Initializing the auxiallary Caches*/
  cacheIt = MayNotAliasCache.begin();
  cacheItEnd = MayNotAliasCache.end();
  for (; cacheIt != cacheItEnd; ++cacheIt) {
    const Value * base = cacheIt->first;
   PtrList &mayNotList = cacheIt->second;

    int size = mayNotList.size();
    std::vector<bool> &PtrPairList = MayNotPtrPairCache[base];
    PtrPairList.resize(size,false);
  }

  cacheIt = MustAliasCache.begin();
  cacheItEnd = MustAliasCache.end();
  for (; cacheIt != cacheItEnd; ++cacheIt) {
    const Value * base = cacheIt->first;
    PtrList &mustList = cacheIt->second;

    int size = mustList.size();
    std::vector<bool> &PtrPairList = MustPtrPairCache[base];
    PtrPairList.resize(size,false);
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

void 
AAChecksInterface::setPtrPairCache(const llvm::Value *base, bool updateMustList, int index, bool value) {

  if(false == value) return;

  if(true == updateMustList) {
    std::vector<bool> &mustList = MustPtrPairCache[base];
    mustList[index] = value;
  } else {  
    std::vector<bool> &mayNotList = MayNotPtrPairCache[base];
    mayNotList[index] = value;
  }
}

void
AAChecksInterface::dumpPtrPairCacheInfo(llvm::raw_ostream &O) {

  assert(MayNotAliasCache.size() == MayNotPtrPairCache.size() && "MayNotAliasCache.size() != MayNotPtrPairCache.size()");
  assert(MustAliasCache.size()   == MustPtrPairCache.size() && "MustAliasCache.size() != MustPtrPairCache.size()");

  AliasCache::iterator cacheIt = MayNotAliasCache.begin();
  AliasCache::iterator cacheItEnd = MayNotAliasCache.end();
  int maynotpairs = 0;
  int checked_maynotpairs = 0;

  for (; cacheIt != cacheItEnd; ++cacheIt) {
    const Value * base = cacheIt->first;
    PtrList &mayNotList = cacheIt->second;

    std::vector<bool> &auxList = MayNotPtrPairCache[base];
    assert(mayNotList.size() == auxList.size() && "mayNotList.size()  != auxList.size()");

    maynotpairs += mayNotList.size(); 
    for(unsigned  i = 0; i < auxList.size() ; i ++) {
      if(true == auxList[i]) {
        checked_maynotpairs ++;   
      }
    }
  }

  O << "Percentage checked maynot pairs :" << checked_maynotpairs << "/" << maynotpairs << " = " <<checked_maynotpairs*100/maynotpairs << "%" << "\n";

  cacheIt = MustAliasCache.begin();
  cacheItEnd = MustAliasCache.end();
  int mustpairs = 0;
  int checked_mustpairs = 0;

  for (; cacheIt != cacheItEnd; ++cacheIt) {
    const Value * base = cacheIt->first;
    PtrList &mustList = cacheIt->second;

    std::vector<bool> &auxList = MustPtrPairCache[base];
    assert(mustList.size() == auxList.size() && "mustList.size()  != auxList.size()");

    mustpairs += mustList.size(); 
    for(unsigned  i = 0; i < auxList.size() ; i ++) {
      if(true == auxList[i]) {
        checked_mustpairs++;
      }
    }
  }

  O << "Percentage checked must pairs :" << checked_mustpairs << "/" << mustpairs << " = " << (checked_mustpairs*100)/mustpairs << "%" << "\n";

  O << "Percentage checked total pairs :" << ((checked_maynotpairs + checked_mustpairs)*100)/(maynotpairs + mustpairs) << "%" << "\n";

}

void   
AAChecksInterface::updateSymMap(const llvm::Value *V, bool isSym, bool isMultiResPtr) {
  isPointerSymMap[V].first  = isSym;
  isPointerSymMap[V].second =  isMultiResPtr;
}
 
void   
AAChecksInterface::dumpSymMap(llvm::raw_ostream &rso) {
  unsigned int size_isPointerSymMap = isPointerSymMap.size();
  unsigned int count = 0;
  unsigned int singleRes = 0;
  unsigned int multiRes = 0;
  symPtrMap::iterator symIt = isPointerSymMap.begin();
  symPtrMap::iterator symItE = isPointerSymMap.end();
  
  for (; symIt != symItE; ++symIt) {
    if(true == symIt->second.first) {
      count ++;
      if(true == symIt->second.second) {
        multiRes++;       
      } else {
        singleRes++;
      }
    }
  }
  rso << "Percentage Sym Pointers: "          << count      << "/" <<  size_isPointerSymMap << " =  " << (count*100)/size_isPointerSymMap << "\n";
  rso << "\tPercentage single-res Pointers: " << singleRes  << "/" <<  count << " =  " << (singleRes*100)/count << "\n";
  rso << "\tPercentage multi-res Pointers: "  << multiRes   << "/" <<  count << " =  " << (multiRes*100)/count << "\n";
}


}
