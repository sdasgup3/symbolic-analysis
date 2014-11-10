/*
 * ===========================================================================
 *
 *       Filename:  mmap_rt.cpp
 *
 *    Description:  mmap-based metadata tracking
 *
 *        Version:  1.0
 *        Created:  06/24/2011 05:49:13 PM
 *
 *         Author:  Will Dietz (WD), w@wdtz.org
 *        Company:  UIUC
 *
 * ===========================================================================
 */

#include "jfrt/jf.h"
#include "rt_impl.h"

#include <assert.h>
#include <stdio.h>
#include <sys/mman.h>
#include <string.h>

#include "mmap_rt.h"

#include "../jf_debug.h"

using namespace jitflow::shadow;

#if ( __WORDSIZE == 64 )
#define ARCH_64 1
#endif

#define NO_MAGIC_NUMBER 1

enum RUNTIME_TYPE {
  RT_BYTE_PER_BYTE,    // easy
  RT_BIT_PER_BYTE,     // smallest shadow memory
  RT_TWOBITS_PER_BYTE  // 32bit accesses become byte accesses
};
const RUNTIME_TYPE RT_TY = RT_BYTE_PER_BYTE;

/* Size of shadow memory.  We're hoping everything fits in 46bits. */
#ifdef ARCH_64
#define SIZE ((size_t)(1L << 46))
#else
#define SIZE ((size_t)(1L << 31))
#endif

// TODO:
// * Remove need for magic number, but still have benefits of constant prop.
//   One idea is to still use dynamic mmap but add an optimization pass that
//   loads the base at most once per function, giving us hopefully most of the
//   benefits of it being a statically-known constant while still being
//   partially flexible to where exactly that is.
//   Alternatively, perhaps with some magic we could coerce our loader into
//   allocating this region for us, and touching up uses via relocations.
// * Remove need for compare/subtract in 'getLabelBase'.  Good architecting of
//   the memory layout should let us make the computation of the corresponding
//   shadow memory location a simple addition to the pointer in question.
//   (Hopefully without having to write our own loader or allocator!)
#ifndef NO_MAGIC_NUMBER
// For the time being, this is a magic number.
//#define BASE ((label_t *)(0x2aaaab88c000))
#ifdef ARCH_64
#define BASE ((label_t*)(1L << 32))
#else
#define BASE ((label_t*)(1L << 30))
#endif
#else
#define BASE ____jf_base
extern label_t* ____jf_base;
#endif

#ifndef NDEBUG
#define NDEBUG
#endif

/*
 * Do some macro magic to get mmap macros defined properly on all platforms.
 */
#if defined(MAP_ANON) && !defined(MAP_ANONYMOUS)
# define MAP_ANONYMOUS MAP_ANON
#endif /* defined(MAP_ANON) && !defined(MAP_ANONYMOUS) */

void jitflow::shadow::allocMem() {
  unsigned flags = MAP_PRIVATE | MAP_ANONYMOUS | MAP_NORESERVE;
  void * res = mmap(BASE, SIZE, PROT_READ | PROT_WRITE, flags, -1, 0);
#ifndef ARCH_64
  size_t sub;
  for (sub = 1; sub < SIZE && res == MAP_FAILED; sub <<= 1) {
    res = mmap(BASE, SIZE - sub, PROT_READ | PROT_WRITE, flags, -1, 0);
  }
  if (res != MAP_FAILED) {
    jfdebug("Mapped %x bytes of memory for shadow\n", SIZE - sub);
  }
#endif

  if (res == MAP_FAILED) {
    fprintf(stderr, "Failed to map shadow memory!\n");
    fflush(stderr);
    assert(0 && "MAP_FAILED!");
  }

#ifndef NO_MAGIC_NUMBER
  assert(res == BASE);
#else
  ____jf_base = (label_t*)res;
#endif

  // Our implementation assumes these values, as lame as that may be.
  assert(LABEL_LOW == 0);
  assert(LABEL_HIGH == 1);
}

label_t *jitflow::shadow::getLabelBase(const void *ptr) {
  uintptr_t p = (uintptr_t)ptr;

  // Mask off relevant lower bits
  // This shouldn't be needed for bitpacked runtimes!
  if (RT_TY == RT_BYTE_PER_BYTE)
    p &= (SIZE - 1);

  if (RT_TY == RT_BIT_PER_BYTE)
    p >>= 3;
  else if (RT_TY == RT_TWOBITS_PER_BYTE)
    p >>= 2;

  // And add the BASE offset
  return (label_t*)(BASE+p);
}

// Actual get/set interface to the metadata runtime
extern "C" INLINE label_t ____jf_get_label_mmap(const void *ptr, size_t size) {
  // Specialize to fast check corresponding to size.
  // 'size' should /always/ be a constant value, so
  // optimizations should (and do) reduce this neatly.
  switch (RT_TY) {
    case RT_BYTE_PER_BYTE: {
      uint64_t *lptr = (uint64_t*)getLabelBase(ptr);
      switch(size) {
        case 1:
          return *(uint8_t*)lptr != 0;
        case 2:
          return *(uint16_t*)lptr != 0;
        case 4:
          return *(uint32_t*)lptr != 0;
        case 8:
          return *(uint64_t*)lptr != 0;
        case 16: {
          label_t l1 = lptr[0] != 0;
          label_t l2 = lptr[1] != 0;
          return l1 | l2;
        }
        case 32: {
          label_t l1 = lptr[0] != 0;
          label_t l2 = lptr[1] != 0;
          label_t l3 = lptr[2] != 0;
          label_t l4 = lptr[3] != 0;
          return (l1 | l2) | (l3 | l4);
        }
        default:
          assert(0 && "Unsupported read size!\n");
          return LABEL_LOW;
      }
      break;
    }
    case RT_BIT_PER_BYTE: {
      label_t *lptr = getLabelBase(ptr);
      unsigned bit = (uintptr_t(ptr) & 0x7);
      // 'size' bytes become 'size' bits
      switch (size) {
        case 1:
          return ((lptr[0] >> bit) & 0x1) != 0;
        case 2:
          // Assume aligned!
          return ((lptr[0] >> bit) & 0x3) != 0;
        case 4:
          // Assume aligned!
          return ((lptr[0] >> bit) & 0xF) != 0;
        case 8:
          // Assume aligned!
          return lptr[0] != 0;
        case 16:
          return *(uint16_t*)lptr != 0;
        case 32:
          return *(uint32_t*)lptr != 0;
        default:
          assert(0 && "Unsupported read size!\n");
          return LABEL_LOW;
      }
      break;
    }
    case RT_TWOBITS_PER_BYTE: {
      label_t *lptr = getLabelBase(ptr);
      unsigned bit = (uintptr_t(ptr) & 0x3) << 1;
      // 'size' bytes become 'size' bits
      switch (size) {
        case 1:
          return ((lptr[0] >> bit) & 0x3) != 0;
        case 2:
          // Assume aligned!
          return ((lptr[0] >> bit) & 0xF) != 0;
        case 4:
          // Assume aligned!
          return lptr[0] != 0;
        case 8:
          return *(uint16_t*)lptr != 0;
        case 16:
          return *(uint32_t*)lptr != 0;
        case 32:
          return *(uint64_t*)lptr != 0;
        default:
          assert(0 && "Unsupported read size!\n");
          return LABEL_LOW;
      }
    }
  }
}

extern "C" INLINE void
____jf_set_label_mmap(const void *ptr, size_t size, label_t newlabel) {
  label_t *lptr = getLabelBase(ptr);
  switch (RT_TY) {
    case RT_BYTE_PER_BYTE:
      memset(lptr, newlabel, size);
      break;
    case RT_BIT_PER_BYTE: {
      unsigned bit = (uintptr_t(ptr) & 0x7);
      switch(size) {
        case 1:
          if (newlabel)
            *lptr |= (0x1 << bit);
          else
            *lptr &= ~(0x1 << bit);
          break;
        case 2:
          if (newlabel)
            *lptr |= (0x3 << bit);
          else
            *lptr &= ~(0x3 << bit);
          break;
        case 4:
          if (newlabel)
            *lptr |= (0xF << bit);
          else
            *lptr &= ~(0xF << bit);
          break;
        case 8:
          *lptr = newlabel ? 0xFF : 0x00;
          break;
        case 16:
        case 32:
          memset(lptr, newlabel ? 0xFF : 0x00, size >> 3);
          break;
        default:
          assert(0 && "Unsupported write size!\n");
          break;
      }
      break;
    }
    case RT_TWOBITS_PER_BYTE: {
      unsigned bit = (uintptr_t(ptr) & 0x3) << 1;
      switch(size) {
        case 1:
          if (newlabel)
            *lptr |= (0x3 << bit);
          else
            *lptr &= ~(0x3 << bit);
          break;
        case 2:
          if (newlabel)
            *lptr |= (0xF << bit);
          else
            *lptr &= ~(0xF << bit);
          break;
        case 4:
          *lptr = newlabel ? 0xFF : 0x00;
        case 8:
        case 16:
        case 32:
          memset(lptr, newlabel ? 0xFF : 0x00, size >> 2);
          break;
        default:
          assert(0 && "Unsupported write size!\n");
          break;
      }
      break;
    }
  }
}

extern "C" void ____jf_copy_label_mmap(const void *dst, const void *src,
                                       size_t len, bool forward) {
  label_t *ld = getLabelBase(dst);
  label_t *ls = getLabelBase(src);

  // Optimizing for this case
  assert(RT_TY == RT_BYTE_PER_BYTE);

  if (forward) {
    memcpy(ld, ls, len);
  } else {
    memmove(ld, ls, len);
  }
}

