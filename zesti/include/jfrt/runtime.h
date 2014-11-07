/*
 * ===========================================================================
 *
 *       Filename:  jf_runtime.h
 *
 *    Description:  Annotation declarations, included by source for now.
 *
 *        Version:  1.0
 *        Created:  12/21/2010 01:34:44 AM
 *
 *         Author:  Will Dietz (WD), wdietz2@illinois.edu
 *        Company:  UIUC
 *
 * ===========================================================================
 */

#ifndef _JF_RUNTIME_H_
#define _JF_RUNTIME_H_

#include <alloca.h>
#include <assert.h>
#include <stdint.h>
#include <stddef.h>

#ifdef __cplusplus
extern "C" {
#endif

/* ===========================================================================
 * ____source
 *
 *  Description:  Indicates a source, the returned value is what we track
 *       Inputs:  Value indicating if this source triggered dynamically.
 *                The varargs should be pointers to value(s) that are affected
 *                by the source (result of computation, etc).
 *                These indicate the *values* that act as flow sources.
 *                Update: For now, single value only.
 * =========================================================================*/
void ____source(char trigger, void * val, size_t size,
                char * filename, char * opcode, char * rule,
                int32_t line, int32_t col);

/* ===========================================================================
 * ____sink
 *
 *  Description:  Indicates a sink.  The parameters are values used by
 *                the sink, used for flow tracking.
 *                Update: For now, single value only.
 * =========================================================================*/
void ____sink(void * val, size_t size);

/* ===========================================================================
 * jf_cleartaint
 *
 *  Description:  Indicates a value's taint should be cleared
 * =========================================================================*/
void ____jf_set_label(const void *val, size_t size, uint8_t l);

/* ===========================================================================
 * jf_badness
 *
 *  Description:  Handles the error case where a vulnerable sink is reached
 *                by tainted data.
 * =========================================================================*/
void ____jf_badness();

#ifdef __cplusplus
}
#endif

// Label information
// Really label_t is just a single bit, not the whole 8-bit value.
typedef uint8_t label_t;

//#define UNINIT_IS_NOT_LOW

#ifdef UNINIT_IS_NOT_LOW
// Labels implicitly now have three values:
// 0 -- uninitialized, or zero'd memory
// 1 -- Low
// 2 -- High
#define LABEL_LOW  (1 << 0)
#define LABEL_HIGH (1 << 1)
#else
// Here, as a small optimization, reduce this to two states
// 0 -- uninitialized/low
// 1 -- high
// Also means that meet(l1,l2) = l1 | l2,
// since we don't have to worry about (1 | 2) == 3.
#define LABEL_LOW  (0)
#define LABEL_HIGH (1)
#endif

#define LABEL_DEFAULT LABEL_LOW

// Convenience for c-based tests...
#define source(t,v) \
  ____source(t,v,sizeof(*v),__FILE__,0,0,__LINE__,0)


#ifdef __cplusplus
template <typename T> void ____jf_sink(T v);
#define sink(v) ____jf_sink(v)
#else
// Here we ensure that we're checking the value of the variable
// pointer to by 'v', not the taint of (copy!) stored in the memory location
// backing the variable.
// This should go away entirely with something better/smarter.
#define sink(v) do { \
  typeof(v) __pp = (typeof(v))alloca(sizeof(*v)); \
  settainted(__pp, 0); \
  *__pp = *v; \
  ____sink(__pp,sizeof(*v)); \
} while(0)
#endif


#define settainted(v, b) ____jf_set_label(v, sizeof(*v), b ? LABEL_HIGH : LABEL_LOW )

#endif // _JF_RUNTIME_H_
