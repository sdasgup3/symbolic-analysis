#!/usr/bin/perl 
use Getopt::Long;
use strict;
use warnings;

#################### PATHS #################
my $SCRIPTDIR       = "/home/sdasgup3/SymbolicAnalysis/Scripts/";
my $llvm_bin_2_9    = "/home/sdasgup3/llvm/llvm-2.9/Release+Asserts/bin"; 
my $llvm_bin_3_4    = "/home/sdasgup3/llvm/llvm-llvmpa/llvm-build/Release+Asserts/bin/";
my $llvmpalib       = "/home/sdasgup3/llvmpa/llvmpa-build/Release+Asserts/lib/";
my $klee_bin        = "/home/sdasgup3/klee/klee/Release+Asserts/bin/";
my $klee_include    = "/home/sdasgup3/klee/klee/include/klee";
my $zesti_bin       = "/home/sdasgup3/zesti/Release+Asserts/bin/";
my $zesti_include   = "/home/sdasgup3/zesti/include/klee/";

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
my $offset = "";

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
            "mdll"      => \$modifiedll) 
 or die("Error in command line arguments\n");


my $make        = "make -f $SCRIPTDIR/Makefile"; 

###  LLVM Args
my $clang2_9       = "$llvm_bin_2_9/clang";
my $llvmdis2_9     = "$llvm_bin_2_9/llvm-dis";
my $llvmas2_9      = "$llvm_bin_2_9/llvm-as";
my $llvmld2_9      = "$llvm_bin_2_9/llvm-ld";

###  Klee Args
my $runkleetest = "$SCRIPTDIR/runseq";
my $watchV      = "$SCRIPTDIR/watchV";
my $kleeargs    = "";
my $kleeexec    = "";
my $kleeincl    = "";
my $maxtime     = "";

if("" eq $maxt) {
  print "Setting max time to default 172800\n";
  $maxtime = "172800";
} else {
  $maxtime = $maxt;
}

if($zest eq "") {

  $kleeexec = "$klee_bin/klee";
  $kleeincl = "$klee_include/";
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
  $kleeexec = "$zesti_bin/klee";
  $kleeincl = "$zesti_include/";
#$kleeargs = " --zest --zest-depth-offset=$offset -debug-print-instructions  --use-symbex=2 --symbex-for=10 --search=zest --zest-search-heuristic=br "; 
$kleeargs = " --zest --zest-depth-offset=$offset              --use-symbex=2 --symbex-for=10 --search=zest --zest-search-heuristic=br "; 
#-watchdog --max-time=30 --optimize --max-cex-size=0 --zest-continue-after-error=true --output-source=false --no-std-out --output-level=error --use-cex-cache=false ---dump-states-on-halt=false -use-forked-stp --max-stp-time=10 --posix-runtime --libc=uclibc $CU/src/TEMPLATE-EXE.bc ${1+"$@"}    
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

if(defined($test)) {

  if($withoutcheker ne "") {
    execute("$make clean");
    execute("$clang2_9 -O0 -emit-llvm -I $kleeincl -I ./ -c $test.c -o $test.a.out.bc");
    execute("$llvmdis2_9 $test.a.out.bc -o a.out.ll");

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
  execute("$clang2_9 -emit-llvm -c $SCRIPTDIR/jf_checker_map.cpp -I $SCRIPTDIR -o jf_checker_map.bc");
  execute("$llvmas2_9 < $test-kleecheck.ll  > a.bc");
  execute("$llvmld2_9 -disable-opt a.bc  jf_checker_map.bc");
  execute("$llvmdis2_9 < a.out.bc  > a.out.ll");
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
    execute("klee $kleeargs ./$test.a.out.bc @progargs");
  }
}

sub execute {
  my $args = shift @_;
  print "$args \n";
  system("$args");
}
