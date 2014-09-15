Build zesti/klee
===================

Build llvm 2.9
-----------------
tar zxvf llvm-2.9.tgz
cd llvm-2.9
./configure --enable-optimized --enable-assertions
make

Build stp
----------------
tar xzfv stp-r940.tgz
cd stp-r940
./scripts/configure --with-prefix=`pwd`/install --with-cryptominisat2
make OPTIMIZE=-O2 CFLAGS_M32= install

Build uclibc
----------------
git clone --branch klee_0_9_29 https://github.com/ccadar/klee-uclibc.git
or 
git clone --depth 1 --branch klee_0_9_29 https://github.com/ccadar/klee-uclibc.git

cd klee-uclibc/

export PATH=$PATH:/home/sdasgup3/KLEE/llvm-2.9/Release+Asserts/bin/

./configure -l  
/*  ./configure --make-llvm-lib

https://github.com/klee/klee-uclibc/wiki/Getting-started
*/

make

Build klee/zesti
--------------
git clone https://github.com/ccadar/klee.git //for klee
tar -xvf zesti.tar.gz
cd klee/zesti

./configure --with-llvm=/home/sdasgup3/llvm/llvm-2.9/ --with-stp=/home/sdasgup3/klee/stp-r940/install/ --with-uclibc=/home/sdasgup3/klee/klee-uclibc/ --enable-posix-runtime

make ENABLE_OPTIMIZED=1


Running TestCase
===================
The commands can be viewed from Scripts/build.pl. Also find the Makefiles required from Scripts folder.

make clean

make $test LLVM_BIN=$llvm_bin_3_4 LLVMPALIB=$llvmpalib KLEEINCLUDE=$kleeincl
make $test-kleecheck LLVM_BIN=$llvm_bin_3_4 LLVMPALIB=$llvmpalib

cat $test-kleecheck.ll | sed 's/target datalayout.*//' | sed 's/\!llvm.ident =.*//' | sed 's/\!0 = metadata.*//' | sed 's/^attributes \#[0-9]*.*//' | sed 's/\#[0-9][0-9]*//' >  temp

mv temp $test-kleecheck.ll

$clang2_9 -emit-llvm -c $SCRIPTDIR/jf_checker_map.cpp -I $SCRIPTDIR -o jf_checker_map.bc

$llvmas2_9 < $test-kleecheck.ll  > a.bc

$llvmld2_9 -disable-opt a.bc  jf_checker_map.bc

$llvmdis2_9 < a.out.bc  > a.out.ll

cp a.out.bc $test.a.out.bc


zesti --zest --zest-depth-offset=$offset  --use-symbex=2 --symbex-for=10 --search=zest --zest-search-heuristic=br --zest-discard-far-states=false  ./$test.a.out.bc


