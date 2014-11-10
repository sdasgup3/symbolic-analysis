//===-- wrappers.h --------------------------------------------------------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// Wrapper definitions to perform taint propagation for calls
// to recognized external functions.
//
//===----------------------------------------------------------------------===//

#ifndef _JF_RT_WRAPPERS_H_
#define _JF_RT_WRAPPERS_H_

#include "jfrt/jf.h"
#include "jf_debug.h"

#define WRAPPER(RET, FUNC) extern "C" RET ____jf_wrapper_##FUNC

inline label_t meet(label_t a, label_t b) { return a | b; }

#endif // _JF_RT_WRAPPERS_H_
