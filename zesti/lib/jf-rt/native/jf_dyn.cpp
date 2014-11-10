/*
 * ===========================================================================
 *
 *       Filename:  jf_dyn.cpp
 *
 *    Description:  Dynamic BB switching
 *
 *        Version:  1.0
 *        Created:  1/05/2012 12:08:27 PM
 *
 *         Author:  Joshua Cranmer, cranmer2@illinois.edu
 *                  Will Dietz (WD), wdietz2@illinois.edu
 *        Company:  UIUC
 *
 * ===========================================================================
 */
// #define DEBUG_LOG 1

#include "jf_dyn.h"
#include "jf_coldwrapper.h"

// Flag tracking if we've notified user of unpatched code
char user_warned = false;

COLDWRAPPER(____jf_modify_instrumentation, void *FP, uintptr_t *Info,
            uint8_t patchout) {
  // Extra element in pointer array is used for state tracking
  uintptr_t *flag = &Info[1];

  PatchInfo * patchInfo = (PatchInfo*)(Info + 3);
  bool on = true;

  if (false) // Enable to check for unpatched bb arrays
  if ((*flag & PATCHED_MASK) != PATCHED_MAGIC) {
    if (!user_warned)
      ____jf_logger("WARNING: Didn't run patcher, or incomplete patched binary.\n");
    abort();
    user_warned = true;
    return;
  }

  if (patchout == 1) patch_me_out<1>();

  // If this is already instrumented appropriately, we're done!
  uintptr_t flag_val = on ? 1 : 0;
  if ((*flag & FLAG_MASK) == flag_val)
    return;

  jfdebug("[P]: Rewriting instrumentation to %s (fp=%p,info=%p)\n",
          on ? "on" : "off", FP, Info);

  uintptr_t count = Info[0];
  // I don't know if this is possible, but for safety, do it!
  if (!count)
    return;
  uintptr_t maxoffset = patchInfo[count - 1].patchoffset + 5;
  protect_memory(FP, maxoffset, true);

  #ifndef NDEBUG
  if (false) // Enable for sanity-checking patch arrays
  for (unsigned i = 0; i < count; ++i) {
    assert(patchInfo[i].patchoffset);
    char * bytes = on ? patchInfo[i].primebytes : patchInfo[i].codebytes;
    char * altbytes = !on ? patchInfo[i].primebytes : patchInfo[i].codebytes;
    const unsigned char *code =
        (const unsigned char *)FP + patchInfo[i].patchoffset;
    assert((FP <= code) && (code + 5 <= (const unsigned char *)FP + maxoffset));
    assert(read5(code) == read5(bytes) || read5(code) == read5(altbytes));
  }
  #endif

  for (unsigned i = 0; i < count; ++i) {
    char * bytes = on ? patchInfo[i].primebytes : patchInfo[i].codebytes;
    unsigned char * code = (unsigned char*)FP + patchInfo[i].patchoffset;
    jfdebug("[P]: Writing %05x to %p\n", read5(bytes), code);
    jfdebug("[P]: %p is currently %05x\n", code, read5(code));
    memcpy(code, bytes, sizeof(patchInfo[i].primebytes));
  }

  // Rewrite entry to use fully instrumented version:
  uintptr_t InstrFP = Info[2];
  if (InstrFP) {
    unsigned char jump[5] = { 0xE9 }; // 32bit relative
    uintptr_t offset = InstrFP - (uintptr_t(FP) + 5);
    uint32_t off32 = offset;
    *(uint32_t*)&jump[1] = off32;
    jfdebug("[P]: Offset: %x\n", off32);
    jfdebug("[P]: Writing %05x to %p\n", read5(jump), FP);
    jfdebug("[P]: %p is currently %05x\n", FP, read5(FP));
    memcpy(FP, jump, sizeof(jump));
  }

  protect_memory(FP, maxoffset, false);
  *flag |= (flag_val & FLAG_MASK);
}
