// RUN: %llvmgcc -emit-llvm -c -g -o %t1.bc %s
// RUN: %klee --zest --output-level=error --patch-check-before=1 --patch-manual-branch %t1.bc ax
// RUN: ls klee-last/ | grep .ptr.err | wc -l | grep 1
// RUN: %klee --zest --output-level=error --patch-check-before=1 --patch-manual-branch %t1.bc xx
// RUN: not test -f klee-last/test00001.ptr.err
// RUN: %klee --zest --output-level=error --patch-check-before=1 --patch-manual-branch %t1.bc bx
// RUN: ls klee-last/ | grep .ptr.err | wc -l | grep 1

#include <assert.h>

int main(int argc, char** argv) {
  int a[10] = {0};

  char opt = argv[1][0];
  char opt2 = argv[1][1];

  int index = 9;

  if (opt == 'a')
    index += 3;
  else {
    klee_patch_begin();
    if (opt == 'b')
      a[10] = 0;
    klee_patch_end();
  }

  return a[index];
}
