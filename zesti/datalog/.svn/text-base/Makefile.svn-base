LEVEL=..

BUILT_SOURCES = llvmpa.1cs_h.logic llvmpa.insensitive.logic

include $(LEVEL)/Makefile.common

DLPATH = $(PROJ_SRC_ROOT)/datalog
CORESRC = $(DLPATH)/llvmpa.decl.logic $(DLPATH)/llvmpa.rules.logic 
SOURCES = $(CORESRC) $(DLPATH)/llvmpa.1cs_h.logic.m4 \
  $(DLPATH)/llvmpa.insensitive.logic.m4

clean ::
	rm -f $(patsubst %, $(DLPATH)/%, $(BUILT_SOURCES))

llvmpa.1cs_h.logic : $(CORESRC) $(DLPATH)/llvmpa.1cs_h.logic.m4
	m4 -I $(DLPATH) $(DLPATH)/llvmpa.1cs_h.logic.m4 > $(DLPATH)/llvmpa.1cs_h.logic

llvmpa.insensitive.logic : $(CORESRC) $(DLPATH)/llvmpa.insensitive.logic.m4
	m4 -I $(DLPATH) $(DLPATH)/llvmpa.insensitive.logic.m4 > $(DLPATH)/llvmpa.insensitive.logic

