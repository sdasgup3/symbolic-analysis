//===-- jf_structs.h - Struct definitions for runtime -----------*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// A list of struct definitions that are shared between the patcher and the
// runtime code.
//
//===----------------------------------------------------------------------===//

#ifndef _JF_STRUCTS_H_
#define _JF_STRUCTS_H_

/// An entry in the basic block array
typedef struct {
  uint64_t patchoffset; // Offset from function start
  char codebytes[5];   // Bytes to write to choose Code
  char primebytes[5];  // Bytes to write to choose CodePrime
} PatchInfo;

/// An entry in the list of global patch lists
struct jf_pla {
  void *func;      // The address of the funtion pointer
  void *func_end;  // func + [function symbol size]
  void *bbarray;   // The array of PatchInfo to pass into modify_instrumentation
};

#endif // _JF_STRUCTS_H_
