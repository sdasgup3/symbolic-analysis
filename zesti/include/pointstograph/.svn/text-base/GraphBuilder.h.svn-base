#ifndef _GRAPHBUILDER_H
#define _GRAPHBUILDER_H

#include "pointstograph/PointsToGraph.h"

namespace llvmpa {

typedef std::vector<uintptr_t> IntVect;

//
// This class reads the computed relations and builds a points-to graph from
// the results.
//
class GraphBuilder {
private:
  //
  // The name of the output directory
  //
  std::string OutputDir;
  
  //
  // Parse a file containing columns of integers.
  //
  void parseFile(std::string &FileName, unsigned Columns, std::vector<IntVect> &Output);

  //
  // The computed graph.
  //
  PointsToGraph *ComputedGraph;

public:
  GraphBuilder(const std::string &DirName) : OutputDir(DirName), ComputedGraph(0) {}

  //
  // Construct the points-to graph.
  //
  PointsToGraph *buildGraph();
};

}

#endif
