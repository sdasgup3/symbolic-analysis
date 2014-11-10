/*
 * ===========================================================================
 *
 *       Filename:  jf.cpp
 *
 *    Description:  JitFlow IF tracking
 *
 *        Version:  1.0
 *        Created:  10/05/2010 08:40:06 PM
 *
 *         Author:  Will Dietz (WD), wdietz2@illinois.edu
 *        Company:  UIUC
 *
 * ===========================================================================
 */

#include "jfrt/jf.h"
#include "metadata/rt_impl.h"
#include "jf_debug.h"

#include <assert.h>
#include <string.h>
#include <stdlib.h>

// "NOPOINTERS" controls if our debug traces include the related pointer values.
// Not having pointer values can be cleaner and useful for comparing "always-on"
// traces versus ones resulting from dynamic techniques.
#define NOPOINTERS

void ____jf_checksink(label_t l, const char *msg) {
  if (l != LABEL_LOW) {
    if (msg)
      ____jf_logger("Tainted value reached %s\n", msg);
    ____jf_badness();
  }
}

void ____jf_set_label(const void *ptr, size_t size, label_t newlabel) {
  check(newlabel);

  setlabel(ptr,size,newlabel);

#ifndef NOPOINTERS
  jfdebug("JF: %p (%lu) <--- %s\n",
      ptr, (unsigned long)size, label2str(newlabel));
#else
  jfdebug("JF: <--- %s\n", label2str(newlabel));
#endif
}

label_t ____jf_get_label(const void *ptr, size_t size) {
  label_t ret = getlabel(ptr,size);
#ifndef NOPOINTERS
  jfdebug("JF: %p (%lu) ---> %s\n",
      ptr, (unsigned long)size, label2str(ret));
#else
  jfdebug("JF: ---> %s\n", label2str(ret));
#endif
   return ret;
}

void ____jf_copy_label(const void *dst, const void *src, size_t len,
                       label_t add, bool forward) {
  jfdebug("JF: %p (%lu) <--- %p (copy: add=%s, forward=%d)\n", dst, len, src, label2str(add), forward);

  copylabel(dst, src, len, add, forward);
}

// Checks if the Callee is the expected one.
// Also, debug logs the labels and the fact that we entered a function.
uint8_t ____jf_callee(label_t *ArgLabels, size_t ActualArgCount,
                      size_t ArgCount, const void *FP, const void *CalleeFP) {
  // assert(ArgLabels && FP);

#ifndef NOPOINTERS
  jfdebug("JF: Callee:   FP: %p |||, ArgCount: %lu, ActualArgs: %lu",
      FP, (unsigned long)ArgCount, (unsigned long)ActualArgCount);
#else
  jfdebug("JF: Callee:   |||, ArgCount: %lu, ActualArgs: %lu",
      (unsigned long)ArgCount, (unsigned long)ActualArgCount);
#endif

  if (CalleeFP != FP) {
    ____jf_logger(" ** WARNING: Caller/Callee mismatch!\n");
    ____jf_logger("JF: Callee: %p FP: %p |||, ArgCount: %lu, ActualArgs: %lu",
                  CalleeFP, FP, (unsigned long) ArgCount,
                  (unsigned long) ActualArgCount);
    abort();

    // For now, initialize these labels to 'low'...
    for(unsigned i = 0; i < ActualArgCount; ++i) {
      ArgLabels[i] = LABEL_LOW;
    }
    return 1;
  }

  // If expectedargmask has bits not in ArgCount bitmask
  size_t BitsMissing = ActualArgCount & ~ArgCount;
  if (BitsMissing) {
    ____jf_logger(" ** WARNING: Wrong set of argument labels found!\n");
    ____jf_logger("Expect mask: %lx, got: %lx (bits missing=%lx)\n",
                  ActualArgCount, ArgCount, BitsMissing);
    ____jf_logger("Callee: %p FP: %P\n", CalleeFP, FP);
    abort();
  }


  loglabels(ArgLabels, ActualArgCount);

  // If we got this far, all is well.
  // Return '0' indicating this to the caller.
  return 0;
}

void ____jf_start_function(void *FP, void *_Info, size_t index) {
  //XXX: Is this more efficient in terms of a word instead of byte?
  //     As in: [index / 64] & (1 << (index % wordsize))
  bool shouldInstr = ____jf_func_state[index / 8] & (1 << (index % 8));

  if (shouldInstr)
    ____jf_modify_instrumentation(FP, (uintptr_t*)_Info, true);
}

void ____jf_callsite(label_t *ArgLabels, size_t ActualArgCount,
                     const void *CallerFP, const void *CalleeFP) {
  // assert(ArgLabels && CallerFP && CalleeFP);

#ifndef NOPOINTERS
  jfdebug("JF: Callsite: FP: %p \\\\\\, NumArgs: %lu",
      CalleeFP, (unsigned long)ActualArgCount);
#else
  jfdebug("JF: Callsite: \\\\\\, NumArgs: %lu",
      (unsigned long)ActualArgCount);
#endif

  loglabels(ArgLabels, ActualArgCount);
}

void ____jf_labelprint(label_t l) {
  jfdebug("JF: Debug label: %s (%lu)\n",
      label2str(l), (unsigned long)l);
}

void ____jf_log_return(const void *FP) {
#ifndef NOPOINTERS
  jfdebug("JF: Func ret: FP: %p ///\n", FP);
#else
  jfdebug("JF: Func ret: ///\n", FP);
#endif
}

// XXX: HACK
// Get around using memory-based sink marking
// in testing, use c++ templates.
template <typename T> void ____jf_sink(T v) {}

template void ____jf_sink< int8_t>(int8_t);
template void ____jf_sink<uint8_t>(uint8_t);
template void ____jf_sink< int16_t>(int16_t);
template void ____jf_sink<uint16_t>(uint16_t);
template void ____jf_sink< int32_t>(int32_t);
template void ____jf_sink<uint32_t>(uint32_t);
template void ____jf_sink< int64_t>(int64_t);
template void ____jf_sink<uint64_t>(uint64_t);
