#ifndef _JF_DYN_H_
#define _JF_DYN_H_

#include "jfrt/jf.h"
#include "jfrt/jf_structs.h"
#include "../jf_debug.h"

#include <errno.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>

static const uint64_t PATCHED_MAGIC = (0xCAFE << 8);
static const uint64_t PATCHED_MASK  = (0xFFFF << 8);
static const uint64_t FLAG_MASK = 0XF;

// Set the write memory protection on/off for the given address range
static inline void protect_memory(const void *addr, size_t n, bool write) {
  int protection = PROT_READ | PROT_EXEC | (write ? PROT_WRITE : 0);
  static int pagesize = -1;
  if (pagesize == -1)
    pagesize = sysconf(_SC_PAGE_SIZE);
  uintptr_t addrval = (uintptr_t) addr & ~(pagesize - 1);
  int ret = mprotect((void *)addrval, (uintptr_t) addr + n - addrval, protection);
  if (ret) {
    ____jf_logger("mprotect() failed during rewriting, aborting.\n"
                  "\tbase: [addr=%p, n=%zu, write=%d]\n"
                  "\targs: [addr=%p, len=%zu, prot=%d]\n"
                  "\tError: %s\n",
                  addr, n, write, addrval, (uintptr_t) addr + n - addrval,
                  protection, strerror(errno));
    abort();
  }
}

static inline uint64_t read5(const void *ptr) {
  const unsigned char *p = (const unsigned char *)ptr;
  uint64_t ret = 0;
  ret |= (uint64_t) p[0] << 4 * 8;
  ret |= (uint64_t) p[1] << 3 * 8;
  ret |= (uint64_t) p[2] << 2 * 8;
  ret |= (uint64_t) p[3] << 1 * 8;
  ret |= (uint64_t) p[4] << 0 * 8;
  return ret;
}

static const unsigned char nop5b [] = {0x0F, 0x1F, 0x44, 0x00, 0x00 };

template <int N>
static INLINE void patch_me_out() {
  //   ^^^^^^
  // Patches the call out, so it doesn't get called again
  void *ptr = __builtin_return_address(N);
  unsigned char *p = (unsigned char*)ptr - 5;
  if (ptr && *p == 0xE8) {
    protect_memory(p, 5, true);
    memcpy(p, nop5b, 5);
  } else
    abort();
}


#endif // _JF_DYN_H_
