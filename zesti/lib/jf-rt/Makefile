##===- projects/jitflow/rt/Makefile ------------------------*- Makefile -*-===##

LEVEL=../..

DIRS = native

LIBRARYNAME=JFRT
ARCHIVE_LIBRARY := 1

# Always build an optimized runtime.
CFLAGS += -O3
CXXFLAGS += -O3

include $(LEVEL)/Makefile.common

# For our code, fail on warnings.
CompileCommonOpts += -Werror -Wno-variadic-macros -Wno-deprecated-declarations

