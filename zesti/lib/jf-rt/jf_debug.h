/*
 * ===========================================================================
 *
 *       Filename:  jf_debug.h
 *
 *    Description:  Debug utility code
 *
 *        Version:  1.0
 *        Created:  1/05/2012 12:26:45 PM
 *
 *         Author:  Will Dietz (WD), wdietz2@illinois.edu
 *        Company:  UIUC
 *
 * ===========================================================================
 */

#ifndef _JF_DEBUG_H_
#define _JF_DEBUG_H_

#include "jfrt/jf.h"

#ifndef NDEBUG
#define NDEBUG
#endif

// Global default debug logging...
#ifndef DEBUG_LOG
extern "C" const char ____jf_debug_logging;
#define DEBUG_LOG ____jf_debug_logging
#endif

static const char * label2str(label_t l) {
  if (l != LABEL_LOW)
    return "High";
  return "Low ";
}

#ifndef NDEBUG
#define check(l) \
  do{ assert(l == LABEL_HIGH || l == LABEL_LOW); } while(0)
#else
#define check(l) do{}while(0)
#endif

// Debug print wrapper
#define jfdebug(...)                                                      \
  do {                                                                         \
    if (DEBUG_LOG)                                                             \
      ____jf_logger(__VA_ARGS__);                                       \
  } while (0)

static inline void loglabels(label_t * L, size_t n) {
  jfdebug(" (");
  for(unsigned i = 0; i < n; ++i) {
    label_t l = L[i];
    jfdebug("%s", label2str(l));
    if (i < n - 1)
      jfdebug(", ");
  }
  jfdebug(")\n");
}

#endif // _JF_DEBUG_H_
