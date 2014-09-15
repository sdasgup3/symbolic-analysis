// RUN: %llvmgcc -emit-llvm -c -o %t1.bc %s
// RUN: echo a > %t2.in
// RUN: %klee --libc=uclibc --posix-runtime --zest %t1.bc %t2.in
// RUN: test -f klee-last/test000001.ptr.err

#include <stdio.h>
#include <stdlib.h>
#include <assert.h>

int main(int argc, char* argv[])
{
  int v[100] = {0};
  char idx = 0;

  assert(argc == 2); 

  FILE* fp = fopen(argv[1], "r");
  if (NULL != fp) {
    fread(&idx, 1, 1, fp);
    fclose(fp);
  }
  
  int over = v[idx];
  return 0;
}

