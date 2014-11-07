#include "llvmpa/PointerAnalysis.h"
#include "domains/DomainMap.h"
#include "pointstograph/GraphBuilder.h"
#include "output/LLVMPAOut.h"
#include <sstream>
#include <sys/time.h>

using namespace llvm;
using std::string;
using std::stringstream;

namespace llvmpa {

//#define BLOXBATCH

#define DEFAULT_LLVMPA_DIR "/home/kasampa2/Documents/llvmpa/llvmpa.src/datalog/"

#define TIME(inst, msg)  \
  if (PrintStats)  \
    gettimeofday(&start, NULL);  \
  inst;  \
  if (PrintStats) {  \
    gettimeofday(&end, NULL);  \
    errs() << msg << "....";  \
    printTimeInterval(&start, &end);  \
    errs() << "\n";  \
  }

char PointerAnalysis::ID;

static RegisterPass<PointerAnalysis>
X("llvmpa-pointer-analysis", "Run the llvmpa analysis", false, true);

void PointerAnalysis::getAnalysisUsage(llvm::AnalysisUsage &AU) const {
  AU.addRequired<FactGenPass>();
  AU.setPreservesAll();
}

//
// Print the time interval between start and end.
//
void printTimeInterval(struct timeval *start, struct timeval *end) {
  long seconds = end->tv_sec - start->tv_sec;
  long useconds = end->tv_usec - start->tv_usec;
  double interval = seconds + useconds/(1000.0*1000.0);
  errs() << interval << " sec";
}

//
// Create a temporary directory when the user didn't specify one.
//
static string createTempDirectory() {
  char *TmpDirName = strdup("/tmp/llvmpa.XXXXXX");
  if (mkdtemp(TmpDirName) == 0) {
    errs() << "couldn't create output directory\n";
    exit(1);
  }
  string Result = TmpDirName;
  free(TmpDirName);
  return Result;
}

//
// Get the name of the llvmpa resource directory from the environment.
//
static string getResourceDirName() {
  const char *Env_LLVMPA_DIR = getenv("LLVMPA_DIR");
  if (Env_LLVMPA_DIR)
    return Env_LLVMPA_DIR;
  else
    return DEFAULT_LLVMPA_DIR;
}

//
// Run the llvmpa pointer analysis.
//
bool PointerAnalysis::runOnModule(Module &M) {
  struct timeval start, end;

  //
  // Check if we have to create a temporary directory.
  //
  bool RunningInTmpDir = (OutputDir == "");

  if (RunningInTmpDir)
    OutputDir = createTempDirectory();

  //
  // Get the fact database and build the domain map out of the facts.
  //
  TIME(
    Database &DB = getAnalysis<FactGenPass>().getDB();
    DomainMap DM;
    DM.buildFrom(DB),
    "Creating facts for the logicblox database"
  )

  //
  // Write to the output files.
  //
  TIME(
    LLVMPAOut Output(OutputDir, &DM, &DB);
    Output.doOutput(),
    "Writing facts to output files"
  )

  if (RunSolver) {
    TIME(
      //
      // Copy over the llvmpa.*.logic file.
      //
      string ResourceDir = getResourceDirName();
      string CopyCommand =
        "cp " + ResourceDir + "/llvmpa.1cs_h.logic " + OutputDir;
      if (system(CopyCommand.c_str())) {
        errs() << "Failed to copy over the datalog files!";
        errs() << " Is LLVMPA_DIR set properly?\n";
        exit(1);
      },
      "Setting up"
    )

    //
    // Logicblox commands
    //
#ifdef BLOXBATCH
  string loglevel = " -logLevel debugDetail@execCycleGraph ";
  string bloxbatch = "bloxbatch -db " + OutputDir + "/llvmpadb ";
  string CreateCommand = bloxbatch + "-create -overwrite > /dev/null";
  string AddLogicCommand = bloxbatch + "-addBlock -file " + OutputDir + "/llvmpa.1cs_h.logic > /dev/null";
  string AddFactsCommand = bloxbatch + "-execute -file " + OutputDir + "/llvmpa.data.logic" + loglevel;
#else
  string CreateCommand = "lb create --overwrite llvmpadb > /dev/null";
  string AddLogicCommand = "lb addblock -f " + OutputDir + "/llvmpa.1cs_h.logic llvmpadb" + "  > /dev/null";
  string AddFactsCommand = "lb exec -f " + OutputDir + "/llvmpa.data.logic llvmpadb";
  string RunPointsToOutCommand = "lb print llvmpadb PointsToOut > " + OutputDir + "/PointsTo.tuples";
  string RunObjPointsToOutCommand = "lb print llvmpadb ObjPointsToOut > " + OutputDir + "/ObjPointsTo.tuples";
  string RunCollapsedCommand = "lb print llvmpadb CollapsedOut > " + OutputDir + "/Collapsed.tuples";
  string RunObjEscapesCommand = "lb print llvmpadb ObjEscapesOut > " + OutputDir + "/ObjEscapes.tuples";
  string RunPointsToExternalCommand = "lb print llvmpadb PointsToExternalOut > " + OutputDir + "/PointsToExternal.tuples";
  string RunObjPointsToExternalCommand = "lb print llvmpadb ObjPointsToExternalOut > " + OutputDir + "/ObjPointsToExternal.tuples";
  string DeleteCommand = "lb delete llvmpadb  > /dev/null";
#endif

    //
    // Run LogicBlox.
    //
    TIME(
      if (system(CreateCommand.c_str())) {
        errs() << "Failed to create a LogicBlox workspace!\n";
        exit(1);
      },
      "Initializing the logicblox database"
    )

    TIME(
      if (system(AddLogicCommand.c_str())) {
        errs() << "Failed to add datalog logic!\n";
        exit(1);
      },
      "Adding the datalog rules to the logicblox database"
    )

    TIME(
      if (system(AddFactsCommand.c_str())) {
        errs() << "Failed to add datalog facts!\n";
        exit(1);
      },
      "Executing pointer analysis"
    )

#ifndef BLOXBATCH
    TIME(
/*
      string RunMyCommand =
        "lb popcount llvmpadb > out";
      if (system(RunMyCommand.c_str())) {
        errs() << "My query failed!\n";
        exit(1);
      }
*/
      if (system(RunPointsToOutCommand.c_str())) {
        errs() << "Failed to query for PointsToOut!\n";
        exit(1);
      }
      if (system(RunObjPointsToOutCommand.c_str())) {
        errs() << "Failed to query for ObjPointsToOut!\n";
        exit(1);
      }
      if (system(RunCollapsedCommand.c_str())) {
        errs() << "Failed to query for Collapsed!\n";
        exit(1);
      }
      if (system(RunObjEscapesCommand.c_str())) {
        errs() << "Failed to query for ObjEscapes!\n";
        exit(1);
      }
      if (system(RunPointsToExternalCommand.c_str())) {
        errs() << "Failed to query for PointsToExternal!\n";
        exit(1);
      }
      if (system(RunObjPointsToExternalCommand.c_str())) {
        errs() << "Failed to query for ObjPointsToExternal!\n";
        exit(1);
      },
      "Querying logicblox database for points-to relations"
    )

    TIME(
      if (system(DeleteCommand.c_str())) {
        errs() << "Failed to delete the LogicBlox workspace!\n";
        exit(1);
      },
      "Deleting the logicblox database"
    )


    //
    // Now run the graph builder.
    //
    TIME(
      GraphBuilder GB(OutputDir);
      Graph = GB.buildGraph(),
      "Building the points-to graph"
    )

    if (PrintStats)
      Graph->printStats(errs());

    if (PrintSummary) {
      stringstream FNameStream;
      FNameStream << OutputDir + "/llvmpa.summary";
      string ErrorStr;
      raw_fd_ostream OutputStream(FNameStream.str().c_str(), ErrorStr);
      Graph->printGraph(OutputStream);
      OutputStream.close();
    }
#endif
  }

  //
  // Delete the output directory if we ran in a temporary directory.
  //
  if (RunningInTmpDir) {
    stringstream RmTempDirStream;
    RmTempDirStream << "rm -rf " << OutputDir;
    int RmTempDirStatus = system(RmTempDirStream.str().c_str());
    if (RmTempDirStatus != 0)
      errs() << "WARNING: couldn't remove temporary directory!\n";
  }

  return false;
}

}
