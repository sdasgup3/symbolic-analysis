/*
 * ===========================================================================
 *
 *       Filename:  jf.h
 *
 *    Description:  Jitflow runtime interface
 *
 *        Version:  1.0
 *        Created:  10/05/2010 08:40:23 PM
 *
 *         Author:  Will Dietz (WD), wdietz2@illinois.edu
 *        Company:  UIUC
 *
 * ===========================================================================
 */

#include "jfrt/runtime.h"

#ifndef _JF_H_
#define _JF_H_

#define INLINE __attribute((always_inline)) inline
#define NOINLINE __attribute((noinline))

// Runtime method that is called when tainted data reaches a sink
extern "C" {
void ____jf_badness(void);
void ____jf_checksink(label_t l, const char *msg);
void ____jf_set_label(const void *ptr, size_t size, label_t newlabel);
label_t ____jf_get_label(const void *ptr, size_t size);
void ____jf_copy_label(const void *dst, const void *src, size_t len,
                       label_t add, bool forward);
uint8_t ____jf_callee(label_t *ArgLabels, size_t ActualArgCount,
                      size_t ArgCount, const void *CalleeFP, const void *FP);
void ____jf_callsite(label_t *ArgLabels, size_t ActualArgCount,
                     const void *CallerFP, const void *CalleeFP);
void ____jf_labelprint(label_t l);
void ____jf_log_return(const void *FP);
void *____jf_which_bb(const void *code, void *codeprime);
void ____jf_start_function(void *FP, void *Info, size_t index);

void ____jf_logsource(const char *filename, const char *opcode,
                      const char *rule, int32_t line, int32_t col);
void ____jf_sourcetriggered(const void *ptr, size_t count);
void ____jf_modify_instrumentation(void *FP, uintptr_t *Info, uint8_t remove);
void ____jf_modify_instrumentation_internal(void *FP, uintptr_t *Info,
                                            uint8_t remove);
void ____jf_replace_stack(void);

void ____jf_logger(const char *fmt, ...);
void ____jf_reinit_logger();
void ____jf_init(void);

extern uint8_t ____jf_func_state[] __attribute((weak));
extern char user_warned;
}

#endif // _JF_H_
