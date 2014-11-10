// jf_coldwrapper.h
// Defines useful macro to create a coldcc-compatible
// wrapper for a normal C function.

#ifndef _JF_COLDWRAPPER_H_
#define _JF_COLDWRAPPER_H_

#ifdef __x86_64
// Non-callee-saved registers:
#define R11 "0"
#define R10 "8"
#define R9  "16"
#define R8  "24"
#define RAX "32"
#define RCX "40"
#define RDX "48"
#define RSI "56"
#define RDI "64"

#define FRAME_SIZE "72"

// Notes:
// * No need to save normal CSR's:
//   R15, R14, R13, R12, RBP, RBX
// * Ignore FP registers
// * Save/restore EFLAGS
// * RSP/RBP managed explicitly
// * cfa directives are so unwinding works as expected

#define SAVE_ALL \
  /* Adjust stack */ \
  "pushq %rbp\n" \
  ".cfi_def_cfa_offset 16\n" \
  "movq %rsp, %rbp\n" \
  "pushfq\n" /* Save EFLAGS */ \
  ".cfi_adjust_cfa_offset 8\n" \
  "subq $" FRAME_SIZE ", %rsp\n" \
  ".cfi_adjust_cfa_offset " FRAME_SIZE "\n" \
  \
  /* Save registers */ \
  "movq %r11, " R11 "(%rsp)\n" \
  "movq %r10, " R10 "(%rsp)\n" \
  "movq %r9,  " R9  "(%rsp)\n" \
  "movq %r8,  " R8  "(%rsp)\n" \
  "movq %rax, " RAX "(%rsp)\n" \
  "movq %rcx, " RCX "(%rsp)\n" \
  "movq %rdx, " RDX "(%rsp)\n" \
  "movq %rsi, " RSI "(%rsp)\n" \
  "movq %rdi, " RDI "(%rsp)\n"

#define RESTORE_ALL \
  /* Restore all the things */ \
  "movq " RDI "(%rsp), %rdi\n" \
  "movq " RSI "(%rsp), %rsi\n" \
  "movq " RDX "(%rsp), %rdx\n" \
  "movq " RCX "(%rsp), %rcx\n" \
  "movq " RAX "(%rsp), %rax\n" \
  "movq " R8  "(%rsp), %r8\n"  \
  "movq " R9  "(%rsp), %r9\n"  \
  "movq " R10 "(%rsp), %r10\n" \
  "movq " R11 "(%rsp), %r11\n" \
  \
  "addq $" FRAME_SIZE ", %rsp\n" \
  "popfq\n" /* Restore EFLAGS */ \
  "popq %rbp\n"

#elif defined(__i386)

// Non-callee-saved registers:
#define EAX "0"
#define ECX "4"
#define EDX "8"

#define FRAME_SIZE "12"

#define SAVE_ALL \
  /* Adjust stack */ \
  "push %ebp\n" \
  ".cfi_def_cfa_offset 16\n" \
  "mov %esp, %ebp\n" \
  "pushf\n" /* Save EFLAGS */ \
  ".cfi_adjust_cfa_offset 8\n" \
  "sub $" FRAME_SIZE ", %esp\n" \
  ".cfi_adjust_cfa_offset " FRAME_SIZE "\n" \
  \
  /* Save registers */ \
  "mov %eax, " EAX "(%esp)\n" \
  "mov %ecx, " ECX "(%esp)\n" \
  "mov %edx, " EDX "(%esp)\n"

#define RESTORE_ALL \
  /* Restore all the things */ \
  "mov " EAX "(%esp), %eax\n" \
  "mov " ECX "(%esp), %ecx\n" \
  "mov " EDX "(%esp), %edx\n" \
  \
  "add $" FRAME_SIZE ", %esp\n" \
  "popf\n" /* Restore EFLAGS */ \
  "pop %ebp\n"

#else
# error "Unknown architecture."
#endif

#define COLDWRAPPER(FUNC, ...) \
extern "C" { \
asm( \
  ".text\n" \
  ".globl " #FUNC "\n" \
  ".align 16,0x90\n" \
  ".type " #FUNC ",@function\n" \
  #FUNC ":\n" \
  ".cfi_startproc\n" \
  SAVE_ALL \
  /* Call real version */ \
  "call " #FUNC "_internal\n" \
  RESTORE_ALL \
  "ret\n" \
  #FUNC "_end:\n" \
  ".size " #FUNC ", " #FUNC "_end - " #FUNC "\n" \
  ".cfi_endproc\n" \
); \
} \
extern "C" void FUNC ##_internal(__VA_ARGS__); \
void __attribute__((visibility("hidden"))) FUNC ##_internal(__VA_ARGS__)


#endif // _JF_COLDWRAPPER_H_
