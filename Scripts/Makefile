.PHONY: clean

#OPTIMIZATIONS=-mem2reg
#OPTIMIZATIONS=
CLANG=clang
CLANGPLUS=clang++
LLVMDIS=llvm-dis
LLVMAS=llvm-as
LLVMLD=llvm-link
OPT=opt

CPPFLAGS += -I$(HOME)/Documents/klee-zesti/SymbolicAnalysis/zesti/include/klee
ZESTILIB=$(HOME)/Documents/klee-zesti/zesti.obj/Release+Asserts/lib
ZESTI=$(HOME)/Documents/klee-zesti/zesti.obj/Release+Asserts/bin/klee
ZESTIOPTIONS=--zest --use-symbex=2 --symbex-for=10 \
             --search=zest --zest-search-heuristic=br \
             --zest-discard-far-states=false
KLEELIB=$(HOME)/Documents/klee-zesti/klee.obj/Release+Asserts/lib
KLEE=$(HOME)/Documents/klee-zesti/klee.obj/Release+Asserts/bin/klee
KLEEOPTIONS=--simplify-sym-indices --write-cvcs --write-cov --output-module \
            --max-memory=1000 --disable-inlining \
            --use-forked-solver \
            --libc=uclibc --allow-external-sym-calls \
            --only-output-states-covering-new \
            --use-query-log=solver:pc \
            --max-sym-array-size=4096 --max-instruction-time=120 \
            --max-time=172800 \
            --watchdog --max-memory-inhibit=false --max-static-fork-pct=1 \
            --max-static-solve-pct=1 --max-static-cpfork-pct=1 \
            --switch-type=internal \
            --randomize-fork --search=random-path --search=nurs:covnew \
            --use-batching-search --batch-instructions=10000
STDIN_FILENAME=/dev/null

%: %.c
	$(CLANG) -O0 -emit-llvm  $(CPPFLAGS)   -c $< -o $@.unopt.bc
	$(OPT) $(OPTIMIZATIONS) $@.unopt.bc > $@.bc
	$(LLVMDIS) $@.bc > $@.ll

%: %.ll
	$(LLVMAS) $@.ll > $@.bc

%: %.cpp
	$(CLANGPLUS) -O0 -emit-llvm  $(CPPFLAGS) -I ./ -c $< -o $@.unopt.bc
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

clean ::
	rm -rf llvmpa.*.bc a.out *.exe a.out.* klee-out* 
	rm -f  *-check *.graph *.graph.txt *.o


runzesti: 
	$(ZESTI) $(ZESTIOPTIONS) ./$< $(RUN_OPTIONS) < $(STDIN_FILENAME)
	clang -L$(ZESTILIB) -Wl,-rpath,$(ZESTILIB) -o $<.klee $< -lkleeRuntest

%-runchecks: %.bc
	$(ZESTI) $(ZESTIOPTIONS) --aachecks ./$< $(RUN_OPTIONS) < $(STDIN_FILENAME)
	clang -L$(ZESTILIB) -Wl,-rpath,$(ZESTILIB) -o $<.klee $< -lkleeRuntest

%-rundsachecks: %.bc
	$(ZESTI) $(ZESTIOPTIONS) --aachecks --dsa  ./$< $(RUN_OPTIONS) < $(STDIN_FILENAME)
	clang -L$(ZESTILIB) -Wl,-rpath,$(ZESTILIB) -o $<.klee $< -lkleeRuntest

runklee: 
	$(KLEE) $(KLEEOPTIONS) ./$< $(RUN_OPTIONS) < $(STDIN_FILENAME)
	clang -L$(KLEELIB) -Wl,-rpath,$(KLEELIB) -o $<.klee $< -lkleeRuntest

clean::
	rm -f td.*.dot
