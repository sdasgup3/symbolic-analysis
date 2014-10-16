#!/usr/bin/perl 
use Getopt::Long;
use strict;
use warnings;


#Usage: build -test zesti_test_6 -wc -zest -offset 3 -klee_dir ~/SymbolicAnalysis/zesti/ -llvm_dir ~/llvm/llvm-3.4.2/llvm-build/

#################### PATHS #################
my $SCRIPTDIR       = "/home/sdasgup3/SymbolicAnalysis/Scripts/";
my $llvm_bin_3_4    = "/home/sdasgup3/llvm/llvm-llvmpa/llvm-build/Release+Asserts/bin/";
my $llvmpalib       = "/home/sdasgup3/llvmpa/llvmpa-build/Release+Asserts/lib/";

##############################################

my $test = "";
my $maxt = "";
my $result = "";
my $reuse = "";
my $genexec = "";
my $run = "";
my $watch = "";
my $modifiedll = "";
my $withoutcheker = "";
my @progargs = "";
my $zest = "";
my $offset = "1";
my $klee_dir = "";
my $llvm_dir = "";

GetOptions ("wc"        => \$withoutcheker, 
            "test=s"    => \$test, 
            "offset=s"  => \$offset, 
            "zest"      => \$zest, 
            "result"    => \$result, 
            "reuse"     => \$reuse, 
            "genexec"   => \$genexec, 
            "run"       => \$run, 
            "watch"     => \$watch, 
            "args=s"    => \@progargs, 
            "maxt=s"    => \$maxt, 
            "klee_dir=s"    => \$klee_dir, 
            "llvm_dir=s"    => \$llvm_dir, 
            "mdll"      => \$modifiedll) 
 or die("Error in command line arguments\n");


if("" eq $klee_dir) {
  print "Specify klee_dir\n";
  exit(1);
}
if("" eq $llvm_dir) {
  print "Specify llvm_dir\n";
  exit(1);
}

my $make        = "make -f $SCRIPTDIR/Makefile"; 

###  LLVM Args
my $clang       = "$llvm_dir/Release+Asserts/bin/clang";
my $llvmdis     = "$llvm_dir/Release+Asserts/bin/llvm-dis";
my $llvmas      = "$llvm_dir/Release+Asserts/bin/llvm-as";
my $llvmld      = "$llvm_dir/Release+Asserts/bin/llvm-ld";
if(!(-e "$llvmld")) { # We llvm-ld not there, so search for llvm-link
  $llvmld = "$llvm_dir/Release+Asserts/bin/llvm-link";
} else {
  $llvmld = $llvmld  . " -disable-opt "
}

###  Klee/Zesti Args
my $runkleetest = "$SCRIPTDIR/runseq";
my $watchV      = "$SCRIPTDIR/watchV";
my $kleeexec    = "$klee_dir/Release+Asserts/bin/klee";
my $kleeincl    = "$klee_dir/include/klee";
my $maxtime     = "";
my $kleeargs    = "";

if("" eq $maxt) {
  print "Setting max time to default 172800\n";
  $maxtime = "172800";
} else {
  $maxtime = $maxt;
}


if($zest eq "") {

# $kleeargs  = "-write-test-info";
# $kleeargs  = "--libc=uclibc  --allow-external-sym-calls";
# $kleeargs  = "--emit-all-errors";
#$kleeargs = "--libc=uclibc --allow-external-sym-calls  --max-time=$maxtime";
  $kleeargs = 
        " --simplify-sym-indices --write-cvcs --write-cov --output-module"
      . " --max-memory=1000 --disable-inlining "
#    . " --optimize"
      . " --use-forked-solver" 
#    . " --use-cex-cache --libc=uclibc --posix-runtime"
      . " --libc=uclibc --allow-external-sym-calls --only-output-states-covering-new" 
#    . " --environ=$SCRIPTDIR/test.env --run-in=/tmp/sandbox" 
#  . " --use-query-log=all:pc"
      . " --use-query-log=solver:pc"
      . " --max-sym-array-size=4096 --max-instruction-time=120 --max-time=$maxtime" 
      . " --watchdog --max-memory-inhibit=false --max-static-fork-pct=1" 
      . " --max-static-solve-pct=1 --max-static-cpfork-pct=1 --switch-type=internal" 
      . " --randomize-fork --search=random-path --search=nurs:covnew" 
      . " --use-batching-search --batch-instructions=10000"; 
#./paste.bc --sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdout "; 
} else {
#$kleeargs = " --zest --zest-depth-offset=$offset -debug-print-instructions  --use-symbex=2 --symbex-for=10 --search=zest --zest-search-heuristic=br "; 
#$kleeargs = " --zest --zest-depth-offset=$offset     -debug-print-instructions         --use-symbex=2 --symbex-for=10 --search=zest --zest-search-heuristic=br --zest-discard-far-states=false"; 
  $kleeargs = " --zest      -debug-print-instructions         --use-symbex=2 --symbex-for=10 --search=zest --zest-search-heuristic=br --zest-discard-far-states=false"; 
#-watchdog --max-time=30 --optimize --max-cex-size=0 --zest-continue-after-error=true --output-source=false --no-std-out --output-level=error --use-cex-cache=false ---dump-states-on-halt=false -use-forked-stp --max-stp-time=10 --posix-runtime --libc=uclibc $CU/src/TEMPLATE-EXE.bc ${1+"$@"}    
}


if(defined($test)) {

  if($withoutcheker ne "") {
    execute("$make clean");
    execute("$clang -O3 -emit-llvm -I $kleeincl -I ./ -c $test.c -o $test.a.out.bc");
    execute("$llvmdis $test.a.out.bc -o a.out.ll");

    if("" eq $genexec) {
      &runKlee;
    }
    
    execute("echo");
    execute("echo");
    exit(0);
  }


  if($modifiedll eq "") {
    execute("$make clean");
    execute("$make $test LLVM_BIN=$llvm_bin_3_4 LLVMPALIB=$llvmpalib KLEEINCLUDE=$kleeincl");
    execute("echo");
    execute("$make $test-kleecheck LLVM_BIN=$llvm_bin_3_4 LLVMPALIB=$llvmpalib");
    execute("cat $test-kleecheck.ll | sed 's/target datalayout.*//' | sed 's/\!llvm.ident =.*//' | sed 's/\!0 = metadata.*//' | sed 's/^attributes \#[0-9]*.*//' | sed 's/\#[0-9][0-9]*//' >  temp ");
    execute("mv temp $test-kleecheck.ll") ;
    execute("echo");
    execute("echo");
  }
  execute("$clang -emit-llvm -c $SCRIPTDIR/jf_checker_map.cpp -I $SCRIPTDIR -o jf_checker_map.bc");
  execute("$llvmas < $test-kleecheck.ll  > a.bc");
  execute("$llvmld a.bc  jf_checker_map.bc -o a.out.bc");
  execute("$llvmdis < a.out.bc  > a.out.ll");
  execute("cp a.out.bc $test.a.out.bc");
  if("" eq $genexec) {
    &runKlee;
  }
  execute("echo");
  execute("echo");
  exit(0);
}


sub runKlee {
  if(-e "$test.a.out.bc") {
    execute("$kleeexec $kleeargs ./$test.a.out.bc @progargs");
  }
}

sub execute {
  my $args = shift @_;
  print "$args \n";
  system("$args");
}

if("" ne $result) {
  system("cat $runkleetest");
  system("tcsh $runkleetest");
  system("cat $watchV");
  system("tcsh $watchV");
  exit(0);
}
if("" ne $run) {
  system("cat $runkleetest");
  system("tcsh $runkleetest");
  exit(0);
}
if("" ne $watch) {
  system("cat $watchV");
  system("tcsh $watchV");
  exit(0);
}

if("" ne $reuse) {
  if(-e "$test.a.out.bc") {
    &runKlee;
  }
  exit(0);
}
