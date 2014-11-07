#include "llvmpa/PointerAnalysis.h"
#include "llvm/ADT/OwningPtr.h"
#include "llvm/Bitcode/ReaderWriter.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/PassManager.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Support/MemoryBuffer.h"
#include "llvm/Support/system_error.h"
#include <sys/stat.h>
#include <iostream>

using namespace llvm;

using std::cerr;
using std::auto_ptr;
using std::string;


static cl::opt<string>
InputFileName(cl::Positional, cl::Required, cl::desc("<input file>"), cl::init("-"));

static cl::opt<bool>
PrintPointsToGraph(
  "print-graph",
  cl::init(false),
  cl::desc("Print out the points-to graph")
);

static cl::opt<bool>
RunSolver(
  "run-solver",
  cl::init(true),
  cl::desc("Run datalog solver on the generated facts")
);

//
// Create the output directory.
//
string makeOutputDir(const string InputFileName) {
  string FileTemplateString = "llvmpa." + InputFileName;
  char *DirName = strdup(FileTemplateString.c_str());
  if (mkdir(DirName, 0755) != 0) {
    cerr << "Unable to make directory for facts!\n";
    exit(1);
  }
  string Result(DirName);
  free(DirName);
  return Result;
}

//
// main() liberally inspired by poolalloc's pa code.
//
int main(int argc, char **argv) {
  cl::ParseCommandLineOptions(argc, argv);
  auto_ptr<Module> M;
  Module *Mptr;
  string ErrorMsg;

  OwningPtr<MemoryBuffer> BPTR;
  if (MemoryBuffer::getFileOrSTDIN(InputFileName.getValue().c_str(), BPTR) == 0) {
    M.reset(ParseBitcodeFile(BPTR.get(), getGlobalContext(), &ErrorMsg));
  }
  else {
    cerr << "error opening file!\n";
    return 1;
  }

  Mptr = M.get();

  if (Mptr == 0) {
    cerr << "error reading bitcode!\n";
    return 1;
  }

  //
  // Create the output directory.
  //
  string OutputDir = makeOutputDir(InputFileName.getValue());

  //
  // Create an appropriate DataLayout object for the module
  //
  DataLayout *DL = 0;
  const string &ModuleDataLayout = Mptr->getDataLayout();
  if (!ModuleDataLayout.empty())
    DL = new DataLayout(ModuleDataLayout);

  //
  // Run the llvmpa pointer analysis algorithm.
  //
  PassManager Passes;
  Passes.add(new TargetLibraryInfo());
  if (DL)
    Passes.add(DL);
  else {
    cerr << "no data layout found in the given module!\n";
    return 1;
  }
  Passes.add(new llvmpa::FactGenPass());
  Passes.add(
    new llvmpa::PointerAnalysis(OutputDir, RunSolver, true, PrintPointsToGraph)
  );
  Passes.run(*Mptr);
  return 0;
}
