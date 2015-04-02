#include <stdio.h>
#include <stdarg.h>

//reg_save_area and reg_save_area16 both point to the base of the var list, and should alias. I guess the problem is that point-to relations targeting variable length arguments are missed because these arguments are not allocated explicitly.
//revision 160292 from ds-aa’s SVN repo
//http://llvm.org/bugs/show_bug.cgi?id=14147

int sum(int n, ...) {
  va_list vl;
  int i;
  int result = 0;

  va_start(vl, n);
  for (i = 0; i < n; ++i) {
    int value = va_arg(vl, int);
    result += value;
  }
  va_end(vl);

  va_start(vl, n);
  for (i = 0; i < n; ++i) {
    int value = va_arg(vl, int);
    result += value;
  }
  va_end(vl);

  return result;
}

int main() {
  printf("%d\n", sum(5, 1, 2, 3, 4, 5));
  return 0;
}
