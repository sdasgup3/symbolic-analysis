#include"klee.h"
#include <stdio.h>

  static const  int x;;
  char* y = "%d";

int foo(int x) {
  if(x < 1) {
    x= 0 ;
  } else {
    x = 1;
    if(y[0] == '%') {
      x ++;
    }  else {
      x--;
    }
  }
  printf(y,x);
  printf("dsamd");
  return x;
}


int main(int argc, char** argv) {
  return foo(x);
}
        
