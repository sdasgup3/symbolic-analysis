//===-- AddressSpace.cpp --------------------------------------------------===//
//
//                     The KLEE Symbolic Virtual Machine
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//

#include "AddressSpace.h"
#include "CoreStats.h"
#include "Memory.h"
#include "TimingSolver.h"
#include "Common.h"
#include "Executor.h"

#if LLVM_VERSION_CODE >= LLVM_VERSION(3, 3)
#include "llvm/IR/Function.h"
#include "llvm/IR/Attributes.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/Constants.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/IntrinsicInst.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/DataLayout.h"
#include "llvm/IR/TypeBuilder.h"
#else
#include "llvm/Attributes.h"
#include "llvm/BasicBlock.h"
#include "llvm/Constants.h"
#include "llvm/Function.h"
#include "llvm/Instructions.h"
#include "llvm/IntrinsicInst.h"
#include "llvm/LLVMContext.h"
#include "llvm/Module.h"
#if LLVM_VERSION_CODE <= LLVM_VERSION(3, 1)
#include "llvm/Target/TargetData.h"
#else
#include "llvm/DataLayout.h"
#include "llvm/TypeBuilder.h"
#endif
#endif


#include "llvm/ADT/SmallPtrSet.h"
#include "llvm/ADT/StringExtras.h"
#include "llvm/Support/CallSite.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Support/raw_ostream.h"
#if LLVM_VERSION_CODE < LLVM_VERSION(2, 9)
#include "llvm/System/Process.h"
#else
#include "llvm/Support/Process.h"
#endif


#include "klee/ExecutionState.h"
#include "klee/Expr.h"
#include "klee/Interpreter.h"
#include "klee/TimerStatIncrementer.h"
#include "klee/CommandLine.h"
#include "klee/util/Assignment.h"
#include "klee/util/ExprPPrinter.h"
#include "klee/util/ExprSMTLIBLetPrinter.h"
#include "klee/util/ExprUtil.h"
#include "klee/util/GetElementPtrTypeIterator.h"
#include "klee/Config/Version.h"
#include "klee/Internal/ADT/KTest.h"
#include "klee/Internal/ADT/RNG.h"
#include "klee/Internal/Module/Cell.h"
#include "klee/Internal/Module/InstructionInfoTable.h"
#include "klee/Internal/Module/KInstruction.h"
#include "klee/Internal/Module/KModule.h"
#include "klee/Internal/Support/FloatEvaluation.h"
#include "klee/Internal/System/Time.h"
#include "klee/Internal/System/MemoryUsage.h"


#include "klee/Expr.h"
#include "klee/TimerStatIncrementer.h"

using namespace klee;

///

void AddressSpace::bindObject(const MemoryObject *mo, ObjectState *os) {
  assert(os->copyOnWriteOwner==0 && "object already has owner");
  os->copyOnWriteOwner = cowKey;
  objects = objects.replace(std::make_pair(mo, os));
}

void AddressSpace::unbindObject(const MemoryObject *mo) {
  objects = objects.remove(mo);
}

const ObjectState *AddressSpace::findObject(const MemoryObject *mo) const {
  const MemoryMap::value_type *res = objects.lookup(mo);
  
  return res ? res->second : 0;
}

ObjectState *AddressSpace::getWriteable(const MemoryObject *mo,
                                        const ObjectState *os) {
  assert(!os->readOnly);

  if (cowKey==os->copyOnWriteOwner) {
    return const_cast<ObjectState*>(os);
  } else {
    ObjectState *n = new ObjectState(*os);
    n->copyOnWriteOwner = cowKey;
    objects = objects.replace(std::make_pair(mo, n));
    return n;    
  }
}

/// 

bool AddressSpace::resolveOne(const ref<ConstantExpr> &addr, 
                              ObjectPair &result) {
  uint64_t address = addr->getZExtValue();
  MemoryObject hack(address);

  if (const MemoryMap::value_type *res = objects.lookup_previous(&hack)) {
    const MemoryObject *mo = res->first;
    klee_message("DSAND[inside resolveOne]: address: %lu mo->address: %lu diff: %lu mo->size: %u\n", address, mo->address, address - mo->address, mo->size);
    if ((mo->size==0 && address==mo->address) ||
        (address - mo->address < mo->size)) {
      result = *res;
      return true;
    }
  }

  return false;
}

bool AddressSpace::resolveOne(ExecutionState &state,
                              TimingSolver *solver,
                              ref<Expr> address,
                              ObjectPair &result,
                              bool &success) {
  if (ConstantExpr *CE = dyn_cast<ConstantExpr>(address)) {
    //klee_message("sdasgup3: inside resolveOne2:ConstantExpr");
    success = resolveOne(CE, result);
    return true;
  } else {
    TimerStatIncrementer timer(stats::resolveTime);

    // try cheap search, will succeed for any inbounds pointer

    ref<ConstantExpr> cex;
    if (!solver->getValue(state, address, cex))
      return false;
    uint64_t example = cex->getZExtValue();
    MemoryObject hack(example);
    const MemoryMap::value_type *res = objects.lookup_previous(&hack);
    
    if (res) {
      const MemoryObject *mo = res->first;
      klee_message("DSAND[inside resolveOne(NonCOnst)]: address: %lu mo->address: %lu diff: %lu mo->size: %u\n", example, mo->address, example - mo->address, mo->size);
      if (example - mo->address < mo->size) {
        result = *res;
        success = true;
        return true;
      }
    }
    klee_message("sdasgup3: inside resolveOne2:NON-ConstantExpr");

    // didn't work, now we have to search
       
    MemoryMap::iterator oi = objects.upper_bound(&hack);
    MemoryMap::iterator begin = objects.begin();
    MemoryMap::iterator end = objects.end();
      
    MemoryMap::iterator start = oi;
    while (oi!=begin) {
      --oi;
      const MemoryObject *mo = oi->first;
        
      bool mayBeTrue;
      if (!solver->mayBeTrue(state, 
                             mo->getBoundsCheckPointer(address), mayBeTrue))
        return false;
      if (mayBeTrue) {
        result = *oi;
        success = true;
        return true;
      } else {
        bool mustBeTrue;
        if (!solver->mustBeTrue(state, 
                                UgeExpr::create(address, mo->getBaseExpr()),
                                mustBeTrue))
          return false;
        if (mustBeTrue)
          break;
      }
    }

    // search forwards
    for (oi=start; oi!=end; ++oi) {
      const MemoryObject *mo = oi->first;

      bool mustBeTrue;
      if (!solver->mustBeTrue(state, 
                              UltExpr::create(address, mo->getBaseExpr()),
                              mustBeTrue))
        return false;
      if (mustBeTrue) {
        break;
      } else {
        bool mayBeTrue;

        if (!solver->mayBeTrue(state, 
                               mo->getBoundsCheckPointer(address),
                               mayBeTrue))
          return false;
        if (mayBeTrue) {
          result = *oi;
          success = true;
          return true;
        }
      }
    }

    success = false;
    return true;
  }
}

bool AddressSpace::resolve(ExecutionState &state,
                           TimingSolver *solver, 
                           ref<Expr> p, 
                           ResolutionList &rl, 
                           unsigned maxResolutions,
                           double timeout,
                           bool useSeeds) {
  if (ConstantExpr *CE = dyn_cast<ConstantExpr>(p)) {
    ObjectPair res;
    //printf("Inside resolve\n");
    //klee_message("sdasgup3: inside resolve:ConstantExpr");
    if (resolveOne(CE, res))
      rl.push_back(res);
    return false;
  } else {
    TimerStatIncrementer timer(stats::resolveTime);
    uint64_t timeout_us = (uint64_t) (timeout*1000000.);

    // XXX in general this isn't exactly what we want... for
    // a multiple resolution case (or for example, a \in {b,c,0})
    // we want to find the first object, find a cex assuming
    // not the first, find a cex assuming not the second...
    // etc.
    
    // XXX how do we smartly amortize the cost of checking to
    // see if we need to keep searching up/down, in bad cases?
    // maybe we don't care?
    
    // XXX we really just need a smart place to start (although
    // if its a known solution then the code below is guaranteed
    // to hit the fast path with exactly 2 queries). we could also
    // just get this by inspection of the expr.
    
    ref<ConstantExpr> cex;
    if (!solver->getValue(state, p, cex, useSeeds))
      return true;


    uint64_t example = cex->getZExtValue();
    MemoryObject hack(example);
    
    //klee_message("sdasgup3: inside resolve:NON-ConstantExpr");

    MemoryMap::iterator oi = objects.upper_bound(&hack);
    MemoryMap::iterator begin = objects.begin();
    MemoryMap::iterator end = objects.end();
      
    MemoryMap::iterator start = oi;
      
    // XXX in the common case we can save one query if we ask
    // mustBeTrue before mayBeTrue for the first result. easy
    // to add I just want to have a nice symbolic test case first.
      
    // search backwards, start with one minus because this
    // is the object that p *should* be within, which means we
    // get write off the end with 4 queries (XXX can be better,
    // no?)
    while (oi!=begin) {
      --oi;
      const MemoryObject *mo = oi->first;



      if (timeout_us && timeout_us < timer.check())
        return true;

      // XXX I think there is some query wasteage here?
      ref<Expr> inBounds = mo->getBoundsCheckPointer(p);
      bool mayBeTrue;
      if (!solver->mayBeTrue(state, inBounds, mayBeTrue, useSeeds))
      //if (!solver->mustBeTrue(state, inBounds, mayBeTrue, useSeeds))
        return true;
      if (mayBeTrue) {
        rl.push_back(*oi);

        std::string alloc_site_str;
        llvm::raw_string_ostream rso_alloc(alloc_site_str);
        mo->allocSite->print(rso_alloc);
        //klee_message("inside resolve: backward:%s", rso_alloc.str().c_str());
        
        // fast path check
        unsigned size = rl.size();
        if (size==1) {
          bool mustBeTrue;
          if (!solver->mustBeTrue(state, inBounds, mustBeTrue, useSeeds))
            return true;
          if (mustBeTrue) {
            //klee_message("inside resolve: backward:return from resolve");
            return false;
            }
        } else if (size==maxResolutions) {
          return true;
        }
      }
        
      bool mustBeTrue;
      if (!solver->mustBeTrue(state, 
                              UgeExpr::create(p, mo->getBaseExpr()),
                              mustBeTrue,
                              useSeeds))
        return true;
      if (mustBeTrue)
        break;
    }
    // search forwards
    for (oi=start; oi!=end; ++oi) {
      const MemoryObject *mo = oi->first;
      if (timeout_us && timeout_us < timer.check())
        return true;


      bool mustBeTrue;
      if (!solver->mustBeTrue(state, 
                              UltExpr::create(p, mo->getBaseExpr()),
                              mustBeTrue,
                              useSeeds))
        return true;
      if (mustBeTrue)
        break;
      
      // XXX I think there is some query wasteage here?
      ref<Expr> inBounds = mo->getBoundsCheckPointer(p);
      bool mayBeTrue;
      if (!solver->mayBeTrue(state, inBounds, mayBeTrue, useSeeds))
      //if (!solver->mustBeTrue(state, inBounds, mayBeTrue, useSeeds))
        return true;
      if (mayBeTrue) {
        rl.push_back(*oi);

        std::string alloc_site_str;
        llvm::raw_string_ostream rso_alloc(alloc_site_str);
        mo->allocSite->print(rso_alloc);
        //klee_message("inside resolve: forward:%s", rso_alloc.str().c_str());
        
        // fast path check
        unsigned size = rl.size();
        if (size==1) {
          bool mustBeTrue;
          if (!solver->mustBeTrue(state, inBounds, mustBeTrue, useSeeds))
            return true;
          if (mustBeTrue)
            return false;
        } else if (size==maxResolutions) {
          return true;
        }
      }
    }
  }

  return false;
}

// These two are pretty big hack so we can sort of pass memory back
// and forth to externals. They work by abusing the concrete cache
// store inside of the object states, which allows them to
// transparently avoid screwing up symbolics (if the byte is symbolic
// then its concrete cache byte isn't being used) but is just a hack.

void AddressSpace::copyOutConcretes() {
  for (MemoryMap::iterator it = objects.begin(), ie = objects.end(); 
       it != ie; ++it) {
    const MemoryObject *mo = it->first;

    if (!mo->isUserSpecified) {
      ObjectState *os = it->second;
      uint8_t *address = (uint8_t*) (unsigned long) mo->address;

      if (!os->readOnly)
        memcpy(address, os->concreteStore, mo->size);
    }
  }
}

bool AddressSpace::copyInConcretes() {
  for (MemoryMap::iterator it = objects.begin(), ie = objects.end(); 
       it != ie; ++it) {
    const MemoryObject *mo = it->first;

    if (!mo->isUserSpecified) {
      const ObjectState *os = it->second;
      uint8_t *address = (uint8_t*) (unsigned long) mo->address;

      if (memcmp(address, os->concreteStore, mo->size)!=0) {
        if (os->readOnly) {
          return false;
        } else {
          ObjectState *wos = getWriteable(mo, os);
          memcpy(wos->concreteStore, address, mo->size);
        }
      }
    }
  }

  return true;
}

/***/

bool MemoryObjectLT::operator()(const MemoryObject *a, const MemoryObject *b) const {
  return a->address < b->address;
}

