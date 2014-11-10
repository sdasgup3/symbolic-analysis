//===-- wrappers_libbsd.cpp -----------------------------------------------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// Wrappers for recognized libbsd functions.
//
//===----------------------------------------------------------------------===//

#include "wrappers.h"

#include <algorithm>
#include <stdint.h>
#include <string.h>

extern "C" size_t strlcpy(char *dst, const char *src, size_t size);
extern "C" size_t strlcat(char *dst, const char *src, size_t size);

WRAPPER(size_t, strlcpy)(char *dst, label_t dt, const char *src, label_t st,
                         size_t len, label_t lt) {
  size_t r = strlcpy(dst, src, len);
  ____jf_copy_label(dst, src, std::min(r, len), LABEL_LOW, true);

  return r;
}

WRAPPER(size_t, strlcat)(char *dst, label_t dt, const char *src, label_t st,
                         size_t len, label_t lt) {
  size_t srclen = strlen(src);
  size_t dstlen = strlen(dst);
  size_t r = strlcat(dst, src, len);
  ____jf_copy_label(dst + dstlen, src, std::min(srclen, len - dstlen),
                    LABEL_LOW, true);

  return r;
}
