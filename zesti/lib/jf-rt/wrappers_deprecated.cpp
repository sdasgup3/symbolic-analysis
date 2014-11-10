//===-- wrappers_deprecated.cpp -------------------------------------------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// Wrappers for functions that cause the linker to complain are deprecated.
// No need for this unless the code actually does use one of these.
//
//===----------------------------------------------------------------------===//

#include <stdio.h>
#include "wrappers.h"

#include <string.h>

WRAPPER(char *, gets)(char *s, label_t sl) {
  char *r = gets(s);
  if (r)
    ____jf_set_label(r, strlen(r), LABEL_LOW);
  return r;
}
