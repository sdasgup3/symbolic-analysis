Build zesti/klee http://klee.github.io/getting-started/
=================================================================

```
sudo yum install g++ curl dejagnu subversion bison flex bc libcap-devel
export PATH=$PATH:/home/sdasgup3/llvm/llvm-gcc4.2-2.9-x86_64-linux/bin/
/*To Find the tarball @
http://llvm.org/releases/2.9/llvm-gcc4.2-2.9-x86_64-linux.tar.bz2
*/
```

Build llvm 2.9
-----------------
```
tar zxvf llvm-2.9.tgz
cd llvm-2.9
./configure --enable-optimized --enable-assertions
make
```

Build stp
----------------
```
tar xzfv stp-r940.tgz /*Find the tarball http://www.doc.ic.ac.uk/~cristic/klee/stp.html */
cd stp-r940
./scripts/configure --with-prefix=`pwd`/install --with-cryptominisat2
make OPTIMIZE=-O2 CFLAGS_M32= install
ulimit -s unlimited
```

Build uclibc
----------------
```
git clone --depth 1 --branch klee_0_9_29 https://github.com/ccadar/klee-uclibc.git
/*
In case u want to do some dev oin uclibc then use the following:
git clone --branch klee_0_9_29 https://github.com/ccadar/klee-uclibc.git
*/
cd klee-uclibc/
export PATH=$PATH:/home/sdasgup3/llvm/llvm-2.9/Release+Asserts/bin/
/* or
export PATH=$PATH:/home/sdasgup3/llvm/llvm-3.4.2/llvm-build/Release+Asserts/bin/
module load gcc
*/
./configure -l  
/*  
./configure --make-llvm-lib
https://github.com/klee/klee-uclibc/wiki/Getting-started
*/
make -j2
```
Build llvmpa
---------------
```
setenv LD_LIBRARY_PATH /software/gcc-4.8.2/lib64:/software/gcc-4.8.2/lib:/usr/lib64
module load gcc
../llvmpa/configure --with-llvmsrc=/home/sdasgup3/llvm/llvm-3.4.2/llvm-src/ --with-llvmobj=/home/sdasgup3/llvm/llvm-3.4.2/llvm-build --with-gcc-toolchain=/software/gcc-4.8.2 --with-extra-options=-std=c++11 --with-extra-ld-options="-Wl,-rpath,/software/gcc-4.8.2/lib64" --enable-optimized --enable-assertions
make
```

Build klee/zesti
--------------
```
git clone https://github.com/ccadar/klee.git //for klee
tar -xvf zesti.tar.gz
cd klee/zesti
./configure --with-llvm=/home/sdasgup3/llvm/llvm-2.9/ --with-stp=/home/sdasgup3/klee/stp-r940/install/ --with-uclibc=/home/sdasgup3/klee/klee-uclibc/ --enable-posix-runtime

/*
or
./configure --with-llvmsrc=/home/sdasgup3/llvm/llvm-3.4.2/llvm-src/ --with-llvmobj=/home/sdasgup3/llvm/llvm-3.4.2/llvm-build/ --with-stp=/home/sdasgup3/SymbolicAnalysis/stp-r940/install/ --with-uclibc=/home/sdasgup3/SymbolicAnalysis/klee-uclibc/ --enable-posix-runtime
*/

When building zesti add these options to configure to help it find llvmpa:
--with-llvmpasrc=/path/to/llvmpa/src/tree
--with-llvmpaobj=/path/to/llvmpa/obj/tree
Ex:
./configure --with-llvmsrc=/home/sdasgup3/llvm/llvm-3.4.2/llvm-src/ --with-llvmobj=/home/sdasgup3/llvm/llvm-3.4.2/llvm-build/ --with-stp=/home/sdasgup3/zesti_utils//stp-r940/install/ --with-uclibc=/home/sdasgup3/zesti_utils/klee-uclibc/ --with-llvmpasrc=/home/sdasgup3/llvmpa/ --with-llvmpaobj=/home/sdasgup3/llvmpa-build/ --enable-posix-runtime

/* In case stuck in problems
sudo ln -s /usr/include/x86_64-linux-gnu/asm/ /usr/include/asm
In case of prblms like C compiler not working
sudo apt-get remove gcc
sudo apt-get install gcc
sudo apt-get install g++
*/
make ENABLE_OPTIMIZED=1 
make check  //optional
make unittests  //optional
```

Running Testcase with checker
-----------------------------

```
// The detailed commands can be viewed from Scripts/build.pl. Also find the Makefiles required from Scripts folder.

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
```

Running withOUT checker (the llvm used must be compatible with klee build)
--------------------
```
/home/sdasgup3/llvm/llvm-3.4.2/llvm-build//Release+Asserts/bin/clang -O0 -emit-llvm -I /home/sdasgup3/SymbolicAnalysis/zesti//include/klee -I ./ -c zesti_test_6.c -o zesti_test_6.a.out.bc 
/home/sdasgup3/llvm/llvm-3.4.2/llvm-build//Release+Asserts/bin/llvm-dis zesti_test_6.a.out.bc -o a.out.ll 
/home/sdasgup3/SymbolicAnalysis/zesti//Release+Asserts/bin/klee  --zest      -debug-print-instructions         --use-symbex=2 --symbex-for=10 --search=zest --zest-search-heuristic=br --zest-discard-far-states=false ./zesti_test_6.a.out.bc
```

