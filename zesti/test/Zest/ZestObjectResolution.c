// RUN: %llvmgcc -emit-llvm -c -o %t1.bc %s
// RUN: %klee --zest %t1.bc
// RUN: test -f klee-last/test000001.ptr.err

#include <stdio.h>
#include <stdlib.h>

int main(int argc, char* argv[])
{
  int v[100] = {0};
  int idx = 0;

  klee_make_symbolic(&idx, sizeof idx, "idx");
  
  return v[idx];
}

