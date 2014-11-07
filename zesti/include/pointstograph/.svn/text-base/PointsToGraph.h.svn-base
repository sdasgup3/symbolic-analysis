#ifndef _POINTSTOGRAPH_H
#define _POINTSTOGRAPH_H

#include "fields/Field.h"
#include "llvm/IR/Value.h"
#include <map>
#include <set>

namespace llvmpa {

class PointsToNode;

// A name for an allocation site in the program.
typedef llvm::Value *AllocationSite;
// A pointer points to a node and field.
typedef std::pair<PointsToNode *, Field> NodeFieldPair;
typedef std::set<NodeFieldPair> PointsToSet;
typedef std::map<Field, PointsToSet> EdgeMap;

class PointsToNode {
private:
  AllocationSite AllocSite;
  EdgeMap Edges;

public:
  enum NodeKind { TYPE_SAFE, TYPE_UNSAFE, EXTERNAL } Kind;

  //
  // Construct the node for an allocation site.
  //
  PointsToNode(
    AllocationSite Site, enum NodeKind NKind = PointsToNode::TYPE_SAFE
  ) : AllocSite(Site), Kind(NKind) { }

  //
  // Get the map from field to points to set.
  //
  EdgeMap &getEdges();

  //
  // Get the allocation site of this node.
  //
  AllocationSite getAllocationSite();

  //
  // Set the allocation site of this node.
  //
  void setAllocationSite(AllocationSite Site);

  //
  // Add an edge from a field to the node.
  //
  void addEdge(Field *Src, PointsToNode *Node, Field *Dest);
};


class PointsToGraph {
private:
  PointsToNode *ExternalNode;

  typedef std::map<AllocationSite, PointsToNode *> NodeMapTy;
  NodeMapTy GraphNodes;

  typedef std::map<const llvm::Value *, PointsToSet> ScalarMapTy;
  ScalarMapTy ScalarMap;

public:
  PointsToGraph() : ExternalNode(0) {}

  //
  // Create the node for external objects.
  //
  PointsToNode *getOrCreateExternalNode();

  //
  // Create a points-to node for the given allocation site.
  //
  PointsToNode *getOrCreateNode(
    AllocationSite Site,
    PointsToNode::NodeKind Kind = PointsToNode::TYPE_SAFE
  );

  //
  // Add a points-to relation for the given scalar value.
  //
  void addScalarEdge(llvm::Value *Value, PointsToNode *Node, Field *F);

  //
  // Get the points-to set for the given scalar value.
  //
  PointsToSet &getPointsToSetForValue(const llvm::Value *Val);

  //
  // Get the scalar map.
  //
  std::map<const llvm::Value *, PointsToSet> &getScalarMap();

  //
  // Get the nodes in the graph.
  //
  std::map<AllocationSite, PointsToNode *> &getNodes();

  //
  // Print out stats about the points-to graph.
  //
  void printStats(llvm::raw_ostream &Stream);

  //
  // Print out a readable description of the graph.
  //
  void printGraph(llvm::raw_ostream &Stream);

  ~PointsToGraph() {
    delete ExternalNode;

    NodeMapTy::iterator NIt = GraphNodes.begin(), NItEnd = GraphNodes.end();
    for (; NIt != NItEnd; ++NIt)
      delete NIt->second;
  }
};

}

#endif
