//===-- wrappers_scanf.cpp ------------------------------------------------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// Wrappers for recognized scanf variants.
//
//===----------------------------------------------------------------------===//

#include "wrappers.h"

#include <ctype.h>
#include <stdarg.h>
#include <stdio.h>
#include <string.h>

//===-- Helpers -----------------------------------------------------------===//

template <typename T>
static void set_taint(va_list ap, label_t label, size_t width = 0) {
  T *typed_pointer = va_arg(ap, T *);
  size_t write_size = width ? width : sizeof(T);
  ____jf_set_label(typed_pointer, write_size, label);
}

// Read length modifier if present, advancing 'p' past it.
// Returns size to write to if length modifier is given,
// and returns zero otherwise.
int get_length_modifier(const char *&p) {
  // TODO: Cross-compile friendly!
  switch (*p++) {
  case 'h':
    if (*p == 'h') {
      ++p;
      return sizeof(char);
    }
    return sizeof(short);
  case 'l':
    if (*p == 'l') {
      ++p;
      return sizeof(long long);
    }
    return sizeof(long);
  case 'j':
    return sizeof(intmax_t);
  case 'z':
    return sizeof(size_t);
  case 't':
    return sizeof(ptrdiff_t);
  case 'L':
    return sizeof(long double);
  default:
    --p;
    return 0;
  }
}

//===-- Format string taint handling --------------------------------------===//

// XXX: This code is inspired by the Minix-based scanf implementation
//      used in the SAFECode project.
extern "C" void scanf_taint(const char *fmt, int ret, va_list ap);
void scanf_taint(const char *fmt, int ret, va_list ap) {
  // Looking only at the format string and the return value
  // of the scanf-variant, clear taint appropriately
  // for the arguments contained in 'ap'.

  jfdebug("scanf_taint(fmt=%s, ret=%d, ...)\n", fmt, ret);

  // Ignore null format strings
  if (!fmt)
    return;

  // Fast-path failed matches:
  if (ret == 0 || ret == EOF)
    return;

  const char *p = fmt;

  for (int match_count = 0; match_count < ret; ++p) {
    // If we hit end of format string, we're done.
    if (!*p)
      break;

    // Otherwise, loop until hit start of next format directive
    if (*p != '%')
      continue;

    // Format directive started, let's look at first character
    ++p;

    // Skip over '%%'
    if (*p == '%')
      continue;

    // Skip over '%*'
    if (*p == '*')
      continue;

    // Skip over field width specification:
    while (isdigit(*p))
      ++p;

    // Get length modifier if present, advancing past it.
    int length_modifier = get_length_modifier(p);

    // Okay, actual specifier now:
    switch (*p) {
    case 'n':
      // Write integer number of consumed characters.
      set_taint<int>(ap, LABEL_LOW, length_modifier);
      ++match_count;
      break;
    case 'p':
      // Read pointer, as printed by printf's %p.
      // (ignore field width or width specifiers)
      set_taint<void *>(ap, LABEL_LOW);
      ++match_count;
      break;
    case 'b':
    case 'd':
    case 'i':
    case 'o':
    case 'u':
    case 'x':
    case 'X':
      // Integer conversions
      set_taint<unsigned>(ap, LABEL_LOW, length_modifier);
      ++match_count;
      break;
    case 'c':
      // Single character, don't support wide characters/etc
      assert(!length_modifier && "Unsupported length modifier with %c");
      set_taint<char>(ap, LABEL_LOW);
      ++match_count;
      break;
    case 's': {
      // String!
      char *str = va_arg(ap, char *);
      // Presumably we already wrote a string to this, based on match_count.
      // Simply clear the written string:
      ____jf_set_label(str, strlen(str) + 1, LABEL_LOW);
      ++match_count;
      break;
    }
    default:
      jfdebug("Unrecognized format specifier '%c' in scanf variant\n", *p);
      // Clear taint of this argument, apparently the 'real' scanf matched this.
      // We're fudging on size here, fix this should things break...
      set_taint<void *>(ap, LABEL_LOW, length_modifier);
      ++match_count;
      break;
    }
  }

  va_end(ap);
}

//===-- Standard Scanf Variants -------------------------------------------===//

WRAPPER(int, scanf)(const char *fmt, label_t ft, ...) {
  va_list ap;
  va_start(ap, ft);
  int ret = vscanf(fmt, ap);
  va_end(ap);

  va_start(ap, ft);
  scanf_taint(fmt, ret, ap);

  return ret;
}

WRAPPER(int, sscanf)(const char *str, label_t st, const char *fmt, label_t ft,
                     ...) {
  va_list ap;
  va_start(ap, ft);
  int ret = vsscanf(str, fmt, ap);
  va_end(ap);

  va_start(ap, ft);
  scanf_taint(fmt, ret, ap);

  return ret;
}

WRAPPER(int, fscanf)(FILE *f, label_t ft, const char *fmt, label_t fmtt, ...) {
  va_list ap;
  va_start(ap, fmtt);
  int ret = vfscanf(f, fmt, ap);
  va_end(ap);

  va_start(ap, fmtt);
  scanf_taint(fmt, ret, ap);

  return ret;
}

WRAPPER(int, vscanf)(const char *fmt, label_t ft, va_list ap, label_t at) {
  va_list ap_copy;
  va_copy(ap_copy, ap);
  int ret = vscanf(fmt, ap);

  scanf_taint(fmt, ret, ap_copy);

  return ret;
}

WRAPPER(int, vsscanf)(const char *str, label_t st, const char *fmt, label_t ft,
                      va_list ap, label_t at) {
  va_list ap_copy;
  va_copy(ap_copy, ap);
  int ret = vsscanf(str, fmt, ap);

  scanf_taint(fmt, ret, ap_copy);

  return ret;
}

WRAPPER(int, vfscanf)(FILE *f, label_t ft, const char *fmt, label_t fmtt,
                      va_list ap, label_t at) {
  va_list ap_copy;
  va_copy(ap_copy, ap);
  int ret = vfscanf(f, fmt, ap);

  scanf_taint(fmt, ret, ap_copy);

  return ret;
}

