/*
 * ===========================================================================
 *
 *       Filename:  jf_source.cpp
 *
 *    Description:  Source debug logging
 *
 *        Version:  1.0
 *        Created:  1/16/2011 04:44:51 AM
 *
 *         Author:  Will Dietz (WD), wdietz2@illinois.edu
 *        Company:  UIUC
 *
 * ===========================================================================
 */

#include "jfrt/jf.h"
#include "jf_debug.h"

void ____jf_logsource(const char *filename, const char *opcode,
                      const char *rule, int32_t line, int32_t col) {
  // How to (selectively?) quiet this?
  // For now, just change false to true to enable logging sources.
  if (false) {
    if (rule && rule[0])
      ____jf_logger("Source triggered at %s:(%d,%d), rule: '%s', op: '%s'\n",
                    filename, line, col, rule, opcode);
    else
      ____jf_logger("Source triggered at %s:(%d,%d)\n", filename, line, col);
  }

  // This should **only** happen when not using Miso,
  // which really should just be during testing.
  // In this case, we have exactly one state bit to track, so set it.
  ____jf_func_state[0] = 1;
}

void ____jf_sourcetriggered(const void *p, size_t c) {
  // Update instr state
  // XXX: Do this words-at-a-time
  const unsigned char *ptr = (const unsigned char *)p;
  for (unsigned i = 0; i < c; ++i)
    ____jf_func_state[i] |= ptr[i];
}
