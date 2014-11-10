// rt_impl.h
// Bounce to the appropriate metdata-tracking runtime implementation.

#ifndef _JF_RT_IMPL_H_
#define _JF_RT_IMPL_H_

#include "jfrt/jf.h"

#include "mmap_rt.cpp"

inline void setlabel(const void *ptr, size_t size, label_t l) {
  ____jf_set_label_mmap(ptr, size, l);
}

inline label_t getlabel(const void *ptr, size_t size) {
  return ____jf_get_label_mmap(ptr, size);
}

inline void copylabel(const void *dst, const void *src, size_t n, label_t add,
                      bool forward) {
  if (add) {
    setlabel(dst, n, add);
  } else {
    ____jf_copy_label_mmap(dst, src, n, forward);
  }
}

#endif // _JF_RT_IMPL_H_
