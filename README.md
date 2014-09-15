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






