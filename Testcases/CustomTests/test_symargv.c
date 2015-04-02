#include <stdio.h>
#include <string.h>
int main(int argc, char * argv[]) {
  char buf[10];
  char buf_2[10];
  int i = 1;
  printf("%s", argv[1]);


  if(argv[1][0] == 'l') {
    strcpy(buf, argv[1]);
  } else {
    buf[i] = 'l';
  }
  return 0;
}
