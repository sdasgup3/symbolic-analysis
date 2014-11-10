//===-- wrappers_scanf_c99.c ----------------------------------------------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// C99-specific versions of scanf functions.
//
//===----------------------------------------------------------------------===//

#include "wrappers.h"

#include <ctype.h>
#include <stdarg.h>
#include <stdio.h>
#include <string.h>

extern "C" void scanf_taint(const char *fmt, int ret, va_list ap);
extern "C" int __isoc99_scanf(const char *fmt, ...);
extern "C" int __isoc99_sscanf(const char *str, const char *fmt, ...);
extern "C" int __isoc99_fscanf(FILE *f, const char *fmt, ...);
extern "C" int __isoc99_vscanf(const char *fmt, va_list ap);
extern "C" int __isoc99_vsscanf(const char *str, const char *fmt, va_list ap);
extern "C" int __isoc99_vfscanf(FILE *f, const char *fmt, va_list ap);

//===-- ISO C99 Variants --------------------------------------------------===//

WRAPPER(int, __isoc99_scanf)(const char *fmt, label_t ft, ...) {
  va_list ap;
  va_start(ap, ft);
  int ret = __isoc99_vscanf(fmt, ap);
  va_end(ap);

  va_start(ap, ft);
  scanf_taint(fmt, ret, ap);

  return ret;
}

WRAPPER(int, __isoc99_sscanf)(const char *str, label_t st, const char *fmt,
                              label_t ft, ...) {
  va_list ap;
  va_start(ap, ft);
  int ret = __isoc99_vsscanf(str, fmt, ap);
  va_end(ap);

  va_start(ap, ft);
  scanf_taint(fmt, ret, ap);

  return ret;
}

WRAPPER(int, __isoc99_fscanf)(FILE *f, label_t ft, const char *fmt,
                              label_t fmtt, ...) {
  va_list ap;
  va_start(ap, fmtt);
  int ret = __isoc99_vfscanf(f, fmt, ap);
  va_end(ap);

  va_start(ap, fmtt);
  scanf_taint(fmt, ret, ap);

  return ret;
}

WRAPPER(int, __isoc99_vscanf)(const char *fmt, label_t ft, va_list ap,
                              label_t at) {
  va_list ap_copy;
  va_copy(ap_copy, ap);
  int ret = __isoc99_vscanf(fmt, ap);

  scanf_taint(fmt, ret, ap_copy);

  return ret;
}

WRAPPER(int, __isoc99_vsscanf)(const char *str, label_t st, const char *fmt,
                               label_t ft, va_list ap, label_t at) {
  va_list ap_copy;
  va_copy(ap_copy, ap);
  int ret = __isoc99_vsscanf(str, fmt, ap);

  scanf_taint(fmt, ret, ap_copy);

  return ret;
}

WRAPPER(int, __isoc99_vfscanf)(FILE *f, label_t ft, const char *fmt,
                               label_t fmtt, va_list ap, label_t at) {
  va_list ap_copy;
  va_copy(ap_copy, ap);
  int ret = __isoc99_vfscanf(f, fmt, ap);

  scanf_taint(fmt, ret, ap_copy);

  return ret;
}
