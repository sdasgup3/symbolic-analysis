/*
 * ===========================================================================
 *
 *       Filename:  jf_unwind.cpp
 *
 *    Description:  Implementation of replace_stack runtime call,
 *                  walks the stack and calls modify_instrumentation
 *                  as appropriate on each function.
 *
 *         Author:  Joshua Cranmer, cranmer2@illinois.edu
 *        Company:  UIUC
 *
 * ===========================================================================
 */

#include "jf_dyn.h"
#include "jf_coldwrapper.h"

#include <stdlib.h>
#include <unwind.h>
#include <string.h>

// The number of entries immediately precedes the entire patch array, which we
// load via $ORIGIN linking.
extern uintptr_t __attribute((weak)) ____jf_pla_entry_count;
static uint64_t pla_size = &____jf_pla_entry_count ? ____jf_pla_entry_count : 0;
static jf_pla * all_functions = (jf_pla*)(&____jf_pla_entry_count + 1); 

static int compare_pla(const void *key, const void *f2) {
  const void *val = *(const void *const*)key;
  const jf_pla *pla2 = (const jf_pla*)f2;
  // If pla1's address (the key in bsearch) is in range, select it as equal.
  if (val >= pla2->func && val < pla2->func_end)
    return 0;
  // Otherwise, move based on the left/right boundary
  return (intptr_t)val - (intptr_t)pla2->func;
}

static _Unwind_Reason_Code callback(struct _Unwind_Context *context, void *) {
  void *pc = reinterpret_cast<void*>(_Unwind_GetIP(context));
  jf_pla *pla = (jf_pla*)bsearch((void*)&pc, (void*)all_functions, pla_size,
      sizeof(jf_pla), compare_pla);
  if (pla && pla->func)
    ____jf_modify_instrumentation_internal(pla->func, (uintptr_t*)pla->bbarray,
                                           0);
  jfdebug("Function: (at %p) (IP: %p)\n", pla ? pla->func : (void*)0xDEAD, pc);
  return _URC_NO_REASON;
}

COLDWRAPPER(____jf_replace_stack,void) {
  _Unwind_Backtrace(callback, NULL);
  patch_me_out<1>();
}
