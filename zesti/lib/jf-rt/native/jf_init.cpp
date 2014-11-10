// Initialize our source select variable
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

#include "jfrt/jf.h"
#include "../metadata/mmap_rt.h"

extern "C" uint64_t ____jf_source_select;
uint64_t ____jf_source_select = -1; // Use all
struct SourceSelect {
  SourceSelect() {
    const char *JFSource = getenv("JF_SOURCE");
    if (JFSource) {
      int source = atoi(JFSource);
      ____jf_logger("[JF] Selecting source %d...\n", source);
      ____jf_source_select = source;
    }
  }
} SS;

extern "C" uint8_t ____jf_init_lock;
uint8_t ____jf_init_lock = 0;
void lock() {
  while (__sync_lock_test_and_set(&____jf_init_lock, 1)) {}
}

void unlock() {
  __sync_lock_release(&____jf_init_lock);
}

extern "C" bool ____jf_init_already;
bool ____jf_init_already = false;

void ____jf_init() {
  lock();
  if (!____jf_init_already) {
    jitflow::shadow::allocMem();
    ____jf_init_already = true;
  }
  unlock();
}

label_t* ____jf_base = 0;
