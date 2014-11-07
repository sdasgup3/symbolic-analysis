#ifndef _POINTERANALYSIS_H
#define _POINTERANALYSIS_H

#include "facts/FactGenPass.h"
#include "pointstograph/PointsToGraph.h"

namespace llvmpa {

//
// This class runs the llvmpa pointer analysis algorithm.
//
class PointerAnalysis : public llvm::ModulePass {
private:
  //
  // The name of the output directory
  //
  std::string OutputDir;

  //
  // Whether to run the solver.
  //
  bool RunSolver;

  //
  // Whether to output graph summary/graph statistics.
  //
  bool PrintSummary, PrintStats;

  //
  // Computed graph
  //
  PointsToGraph *Graph;

  //
  // Create the output directory.
  //
  void makeOutputDir();

public:
  static char ID;

  PointerAnalysis(std::string &OutputDirName, bool Run, bool PrStat, bool PrSummary)
    : ModulePass(ID),
      OutputDir(OutputDirName),
      RunSolver(Run),
      PrintSummary(PrSummary),
      PrintStats(PrStat),
      Graph(0) {
  }

  PointerAnalysis()
    : ModulePass(ID),
      OutputDir(""),
      RunSolver(true),
      PrintSummary(false),
      PrintStats(false),
      Graph(0) {
  }

  ~PointerAnalysis() { }

  PointsToGraph *getGraph() { return Graph; }

  bool runOnModule(llvm::Module &M);

  void getAnalysisUsage(llvm::AnalysisUsage &AU) const;
};

}

#endif
