#include"klee.h"
#include <stdlib.h>
struct S {
  int a;
  int b;
  int c;
  int d;
};

int  bar (int x) {
  struct S *st1 = (struct S *)malloc(sizeof(struct S));
  struct S *st2  = (struct S *)malloc(sizeof(struct S));
  struct S *st3  = (struct S *)malloc(sizeof(struct S));
  struct S *st4  = (struct S *)malloc(sizeof(struct S));

  int *temp;

  if (x > 100) {
    temp =   &(st1->a);
    if(x < 150) {
      temp = &st2->a; 
    }
  } else {
    temp =  &(st3->b);
    if(x > 50) {
      temp =  &(st4->b);
    }
  }
   return x;
}

int foo(int x) {
  int *ptr;

  return  bar(x);
   
  //return *ptr;
}


int main() {
  int x;

  klee_make_symbolic(&x, sizeof(x), "x");

  return foo(x);
}

