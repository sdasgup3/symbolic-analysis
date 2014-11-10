/*
 * ===========================================================================
 *
 *       Filename:  set_rt.cpp
 *
 *    Description:  Set-based metadata runtime
 *
 *        Version:  1.0
 *        Created:  06/24/2011 04:51:38 PM
 *
 *         Author:  Will Dietz (WD), w@wdtz.org
 *        Company:  UIUC
 *
 * ===========================================================================
 */

#include "jf/jf.h"
#include "rt_impl.h"

#include <set>

typedef std::set<uintptr_t> MemMap_t;

// Existance of a pointer in this set means it's tainted.
static MemMap_t LameMemMap;

INLINE label_t ____jf_get_label_set(void *ptr, size_t size) {
  uintptr_t p = (uintptr_t)ptr;
  label_t ret = LABEL_LOW;
  for(uintptr_t pp = p; pp < p + size; ++pp) {
    label_t l = LameMemMap.count(pp) ? LABEL_HIGH : LABEL_LOW;
    ret = l | ret;

    // Bail out early if we can, explicitly taking advantage of
    // a property of the our meet function.
    if (ret == LABEL_HIGH) return LABEL_HIGH;
  }

  return ret;
}

INLINE void ____jf_set_label_set(void *ptr, size_t size, label_t newlabel) {
  uintptr_t p = (uintptr_t)ptr;

  if (newlabel == LABEL_HIGH)
    for(uintptr_t pp = p; pp < p + size; ++pp)
      LameMemMap.insert(pp);
  else
    for(uintptr_t pp = p; pp < p + size; ++pp)
      LameMemMap.erase(pp);
}
