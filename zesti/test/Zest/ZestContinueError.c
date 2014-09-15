// RUN: %llvmgcc -emit-llvm -c -o %t1.bc %s
// RUN: %klee --libc=uclibc --posix-runtime --zest --zest-continue-after-error %t1.bc ab
// RUN: test -f klee-last/test000002.ptr.err

#include <stdio.h>
int main(int argc, char** argv) {
  int v['b'];

  if (argv[1][0] > 0) {
    v[argv[1][0]] = 10;
    v[argv[1][1]-1] = 32;
  }
  printf("v[\'a\']=%d\n", v['a']);
  return 0;
}

