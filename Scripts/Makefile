.PHONY: clean

#OPTIMIZATIONS=-mem2reg
#OPTIMIZATIONS=
CLANG=$(LLVM_BIN)/clang
CLANGPLUS=$(LLVM_BIN)/clang++
LLVMDIS=$(LLVM_BIN)/llvm-dis
LLVMAS=$(LLVM_BIN)/llvm-as
LLVMLD=$(LLVM_BIN)/llvm-link
OPT=$(LLVM_BIN)/opt

%: %.c
	$(CLANG) -O0 -emit-llvm -I $(KLEEINCLUDE)   -c $< -o $@.unopt.bc
	$(OPT) $(OPTIMIZATIONS) $@.unopt.bc > $@.bc
	$(LLVMDIS) $@.bc > $@.ll

%: %.ll
	$(LLVMAS) $@.ll > $@.bc

%: %.cpp
	$(CLANGPLUS) -O0 -emit-llvm -I $(KLEEINCLUDE) -I ./ -c $< -o $@.unopt.bc
	$(OPT) $(OPTIMIZATIONS) $@.unopt.bc > $@.bc
	$(LLVMDIS) $@.bc > $@.ll

%-check: %.bc
	$(OPT) -load=$(LLVMPALIB)/libllvmpa.so -load=$(LLVMPALIB)/libchecker.so  -pa-interface -check-aa -enable-logging=true -dump-points-to=$<.graph $< > $@.bc
	$(CLANG) -L$(LLVMPALIB) $@.bc -lJFRT -lJFRTNative -pthread -lstdc++ -o $@
	$(LLVMDIS)  $@.bc > $@.ll

%-aacheck: %.bc
	opt -load=$(LLVMPALIB)/libllvmpa.so -load=$(LLVMPALIB)/libchecker.so -basicaa -tbaa -aa-interface -check-aa -enable-logging=true $< > $@.bc
	clang -L$(LLVMPALIB) $@.bc -lJFRT -lJFRTNative -pthread -lstdc++ -o $@
	llvm-dis $@.bc > $@.ll

jf_checker_map.bc:
	clang -emit-llvm -c $(JFCHECKERMAP)/jf_checker_map.cpp -I $(JFCHECKERMAP) -I $(JFINCLUDE) -o jf_checker_map.bc
	

%-kleecheck: %.bc jf_checker_map.bc
	$(OPT) -load=$(LLVMPALIB)/libllvmpa.so -load=$(LLVMPALIB)/libchecker.so   -check-aa  -pa-interface -dump-points-to=$<.graph  $< > $@.a.bc
	$(LLVMDIS)  $@.a.bc > $@.a.ll
	$(LLVMLD) $@.a.bc jf_checker_map.bc -o $@.bc
	$(LLVMDIS) < $@.bc > $@.ll

clean :
	rm -rf llvmpa.*.bc a.out *.exe a.out.*
	rm -f  *-check *.graph *.graph.txt *.o

