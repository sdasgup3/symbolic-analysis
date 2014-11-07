#include "checker/AliasAnalysisChecker.h"
#include "checker/interface/PointsToInterface.h"
#include "llvm/ADT/OwningPtr.h"
#include "llvm/Analysis/Dominators.h"
#include "llvm/Bitcode/ReaderWriter.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/PassManager.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Support/MemoryBuffer.h"
#include "llvm/Support/ToolOutputFile.h"
#include "llvm/Support/system_error.h"
#include <sys/stat.h>
#include <iostream>

using namespace llvm;

using std::cerr;
using std::auto_ptr;
using std::string;


static cl::opt<string>
InputFileName(
  cl::Positional,
  cl::Required,
  cl::desc("Input file name"),
  cl::init("-"),
  cl::value_desc("filename")
);

static cl::opt<string>
OutputFileName(
  "o",
  cl::Required,
  cl::desc("Output file name"),
  cl::init("-"),
  cl::value_desc("filename")
);

static cl::opt<bool>
PrintPointsToGraph(
  "print-graph",
  cl::init(false),
  cl::desc("Print out the points-to graph")
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
// A pass that prints a module pass result - inspired from
// the implementation of a similar pass for the opt tool
//
struct ModulePassPrinter : public ModulePass {
  static char ID;
  const PassInfo *PassToPrint;
  raw_ostream &Out;
  std::string PassName;

  ModulePassPrinter(const PassInfo *PI, raw_ostream &out)
    : ModulePass(ID), PassToPrint(PI), Out(out) {
      std::string PassToPrintName =  PassToPrint->getPassName();
      PassName = "ModulePass Printer: " + PassToPrintName;
    }

  bool runOnModule(Module &M) {
    // Get and print pass...
    // TODO Implement print for the AliasAnalysisChecker pass
    getAnalysisID<Pass>(PassToPrint->getTypeInfo()).print(Out, &M);
    return false;
  }

  const char *getPassName() const { return PassName.c_str(); }

  void getAnalysisUsage(AnalysisUsage &AU) const {
    AU.addRequiredID(PassToPrint->getTypeInfo());
    AU.setPreservesAll();
  }
};

char ModulePassPrinter::ID = 0;

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

  // Create output stream
  std::unique_ptr<tool_output_file> Out;
  std::string ErrorInfo;
  Out.reset(new tool_output_file(OutputFileName.c_str(), ErrorInfo,
                                 sys::fs::F_None));
  if (!ErrorInfo.empty()) {
    cerr << ErrorInfo << "\n";
    return 1;
  }

  //
  // Create an appropriate DataLayout object for the module
  //
  DataLayout *DL = 0;
  const string &ModuleDataLayout = Mptr->getDataLayout();
  if (!ModuleDataLayout.empty())
    DL = new DataLayout(ModuleDataLayout);

  //
  // Add the needed passes for running the llvmpa pointer analysis and the
  // checker
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
    new llvmpa::PointerAnalysis(OutputDir, true, false, PrintPointsToGraph)
  );

  Passes.add(new aachecker::PointsToInterface());

  Passes.add(new DominatorTree());

  Passes.add(new aachecker::AliasAnalysisChecker());

  // Write bitcode or assembly to the output as the last pass
  const PassInfo *PI =
    Pass::lookupPassInfo(&aachecker::AliasAnalysisChecker::ID);
  Passes.add(new ModulePassPrinter(PI, Out->os()));

  // Run the passes
  Passes.run(*Mptr);

  // Store the output
  Out->keep();

  return 0;
}
