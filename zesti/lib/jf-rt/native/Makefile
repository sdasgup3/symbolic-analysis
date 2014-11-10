##===- projects/jitflow/rt/native/Makefile -----------------*- Makefile -*-===##

# This directory contains the pieces of the runtime that shouldn't be
# built into bytecode, either for compatibility reasons or because
# it's desirable to hide them entirely from the optimizer.

LEVEL=../../..

LIBRARYNAME=JFRTNative
ARCHIVE_LIBRARY := 1
# Don't build as shared library, lazy loading breaks lowered instrumentation.
#SHARED_LIBRARY := 1

CXXFLAGS += -I$(PROJ_SRC_DIR)/..

CFLAGS += -Werror -Wno-variadic-macros
CXXFLAGS += -Werror -Wno-variadic-macros

include $(LEVEL)/Makefile.common
