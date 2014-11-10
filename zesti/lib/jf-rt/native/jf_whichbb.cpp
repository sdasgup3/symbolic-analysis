// whichbb.cpp
#include "jfrt/jf.h"
#include "../jf_debug.h"
#include <stdlib.h>

// Here's an asm version of whichbb,
// although note that unless we're debugging or something
// *all* calls to whichbb should be removed!
#if 0
extern "C" {
asm(
		".text\n"
		".align 8\n"
		".globl ____jf_which_bb\n"
	"____jf_which_bb:\n"
		"pushfw\n" // Save EFLAGS
		"mov $any_taint_introduced, %rax\n" // Load any_taint_introduced
		"cmpb $0x0,(%rax)\n" // Compare against zero
		"cmovne %rsi, %rdi\n" // Select codeprime if non-zero
		"mov %rdi,%rax\n"    // Put result in rax
		"popfw\n" // Restore EFLAGS
		"retq\n"
);
}

#else
NOINLINE void* ____jf_which_bb(void* code, void* codeprime) {
  abort();
}
#endif
