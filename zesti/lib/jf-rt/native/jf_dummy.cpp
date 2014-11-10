// Dummy function for testing purposes

extern "C" int ____jf_return_arg(int);
extern "C" void ____jf_void(void);

int ____jf_return_arg(int i) { return i; }

// Simple coldcc-compat function that returns immediately.
extern "C" {
asm(
  ".text\n"
  ".globl ____jf_void\n"
  ".type ____jf_void, @function\n"
  "____jf_void:\n"
  "ret\n"
  );
}
