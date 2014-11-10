//===-- wrappers_readline.cpp ---------------------------------------------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// Wrappers for recognized readline functions.
//
//===----------------------------------------------------------------------===//

#include <stdio.h>
#include "wrappers.h"

#include <string.h>

extern "C" char *readline(const char *prompt);

WRAPPER(char *, readline)(const char *prompt, label_t pt) {
  char *ret = readline(prompt);
  if (ret)
    ____jf_set_label(ret, strlen(ret), LABEL_LOW);

  return ret;
}
