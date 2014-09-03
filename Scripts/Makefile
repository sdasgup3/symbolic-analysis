.PHONY: clean

#OPTIMIZATIONS=-mem2reg
OPTIMIZATIONS=
CLANG=$(LLVM_BIN)/clang
CLANGPLUS=$(LLVM_BIN)/clang++
LLVMDIS=$(LLVM_BIN)/llvm-dis
OPT=$(LLVM_BIN)/opt

%: %.c
	$(CLANG) -O0 -emit-llvm -I $(KLEEINCLUDE) -I ./  -c $< -o $@.unopt.bc
	$(OPT) $(OPTIMIZATIONS) $@.unopt.bc > $@.bc
	$(LLVMDIS) $@.bc > $@.ll

%: %.cpp
	$(CLANGPLUS) -O0 -emit-llvm -I $(KLEEINCLUDE) -I ./ -c $< -o $@.unopt.bc
	$(OPT) $(OPTIMIZATIONS) $@.unopt.bc > $@.bc
	$(LLVMDIS) $@.bc > $@.ll

%-check: %.bc
	$(OPT) -load=$(LLVMPALIB)/libllvmpa.so -load=$(LLVMPALIB)/libchecker.so -check-pointer -dump-points-to=$<.graph $< > $@.bc
	$(CLANG) -L$(LLVMPALIB) $@.bc -lJFRT -lJFRTNative -pthread -lstdc++ -o $@
	$(LLVMDIS)  $@.bc > $@.ll

%-kleecheck: %.bc
#	$(OPT) -load=$(LLVMPALIB)/libllvmpa.so -load=$(LLVMPALIB)/libchecker.so  -check-aa -aa-interface  $< > $@.bc
#$(OPT) -load=$(LLVMPALIB)/libllvmpa.so -load=$(LLVMPALIB)/libchecker.so   -basicaa -check-aa -aaa-interface  $< > $@.bc
	$(OPT) -load=$(LLVMPALIB)/libllvmpa.so -load=$(LLVMPALIB)/libchecker.so   -check-aa  -pa-interface -klee-ready -dump-points-to=$<.graph  $< > $@.bc
	$(LLVMDIS)  $@.bc > $@.ll

%.bc: %.c
	clang -O0 -emit-llvm -c $< -o $@

%.ll: %.bc	
	llvm-dis $< -o $@
clean :
	rm -rf llvmpa.*.bc a.out *.exe a.out.*
	rm -f  *-check *.graph *.graph.txt *.o

