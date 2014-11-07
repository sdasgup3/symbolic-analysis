#include "pointstograph/PointsToGraph.h"
#include "llvm/IR/Function.h"

using namespace llvm;

namespace llvmpa {

//
// Get the map from field to points to set.
//
EdgeMap &PointsToNode::getEdges() {
  return Edges;
}

//
// Get the allocation site of this node.
//
AllocationSite PointsToNode::getAllocationSite() {
  return AllocSite;
}

//
// Set the allocation site of this node.
//
void PointsToNode::setAllocationSite(AllocationSite Site) {
  AllocSite = Site;
}

//
// Add an edge from a field to the node.
//
void PointsToNode::addEdge(Field *Src, PointsToNode *Node, Field *Dest) {
  Field Collapsed(Field::COLLAPSED);
  Field SourceField, DestField;

  if (AllocSite && !isa<PointerType>(AllocSite->getType()))
    return;
    
  //
  // Determine the source field and destination field based on the kind of
  // node this is.
  //
  if (Kind == TYPE_UNSAFE)
    SourceField = Collapsed;
  else
    SourceField = *Src;

  if (Node->Kind == TYPE_UNSAFE || Node->Kind == EXTERNAL)
    DestField = Collapsed;
  else
    DestField = *Dest;

  Edges[SourceField].insert(NodeFieldPair(Node, DestField));
}


//
// Create the node for external objects.
//
PointsToNode *PointsToGraph::getOrCreateExternalNode() {
  if (!ExternalNode) {
    Field Collapsed(Field::COLLAPSED);
    ExternalNode = new PointsToNode(0, PointsToNode::EXTERNAL);
    ExternalNode->addEdge(&Collapsed, ExternalNode, &Collapsed);
  }
  return ExternalNode;
}


//
// Create a points-to node for the given allocation site.
//
PointsToNode *PointsToGraph::getOrCreateNode(AllocationSite Site,
                                             PointsToNode::NodeKind Kind) {
  if (GraphNodes.find(Site) == GraphNodes.end())
    GraphNodes[Site] = new PointsToNode(Site, Kind);
  return GraphNodes[Site];
}


//
// Add a points-to relation for the given scalar value.
//
void PointsToGraph::addScalarEdge(Value *Value, PointsToNode *Node, Field *F) {
  ScalarMap[Value].insert(NodeFieldPair(Node, *F));
}

//
// Get the points-to set for the given scalar value.
//
PointsToSet &PointsToGraph::getPointsToSetForValue(const llvm::Value *Val) {
  return ScalarMap[Val];
}

//
// Get the scalar map.
//
std::map<const llvm::Value *, PointsToSet> &PointsToGraph::getScalarMap() {
  return ScalarMap;
}

//
// Get the nodes in the graph.
//
std::map<AllocationSite, PointsToNode *> &PointsToGraph::getNodes() {
  return GraphNodes;
}


//
// Print out statistics pertaining to the graph.
//
void PointsToGraph::printStats(raw_ostream &Stream) {
  unsigned long NumEdges, NumNodes, NumPointsToSets;

  NumEdges = NumNodes = NumPointsToSets = 0ul;

  //
  // First add info for the external node.
  //
  if (ExternalNode) {
    NumNodes += 1;
    NumPointsToSets += 1;
    NumEdges += 1;
  }

  //
  // Record the statistics for the scalar points-to sets.
  //
  ScalarMapTy::iterator SMIt = ScalarMap.begin(), SMItEnd = ScalarMap.end();
  for (; SMIt != SMItEnd; ++SMIt) {
    PointsToSet &PTS = SMIt->second;
    NumEdges += PTS.size();
    NumPointsToSets += 1;
  }

  //
  // Record the statistics for the node map.
  //
  NodeMapTy::iterator GNIt = GraphNodes.begin(), GNItEnd = GraphNodes.end();
  for (; GNIt != GNItEnd; ++GNIt) {
    NumNodes += 1;

    PointsToNode *Node = GNIt->second;
    EdgeMap &Edges = Node->getEdges();

    EdgeMap::iterator EIt = Edges.begin(), EItEnd = Edges.end();
    for (; EIt != EItEnd; ++EIt) {
      PointsToSet &PTS = EIt->second;

      NumEdges += PTS.size();
      NumPointsToSets += 1;
    }
  }

  Stream << "Number of points-to nodes: " << NumNodes << "\n";
  Stream << "Number of points-to edges: " << NumEdges << "\n";
  Stream << "Number of points-to sets: " << NumPointsToSets << "\n";
}

//
// Print out a value, treating functions reasonably.
//
static void printValue(raw_ostream &Stream, const Value *Val) {
  if (isa<Function>(Val))
    Stream << "[function " << cast<Function>(Val)->getName().str() << "]";
  else
    Val->print(Stream);
}

//
// Print out a points-to set.
//
static void printPointsToSet(raw_ostream &Stream, const PointsToSet &Set) {
  PointsToSet::iterator PTIt = Set.begin(), PTItEnd = Set.end();
  Stream << "printing points to set...\n";
  for (; PTIt != PTItEnd; ++PTIt) {
    PointsToNode *Node = PTIt->first;
    const Field &F = PTIt->second;

    Stream << "  - ";

    switch (Node->Kind) {
      case PointsToNode::TYPE_SAFE:
        Stream << "(";
        printValue(Stream, Node->getAllocationSite());
        Stream << ", ";
        F.print(Stream);
        Stream << ")";
        break;
      case PointsToNode::TYPE_UNSAFE:
        Stream << "(";
        printValue(Stream, Node->getAllocationSite());
        Stream << ", collapsed)";
      case PointsToNode::EXTERNAL:
        Stream << "(";
        if (Node->getAllocationSite() == 0)
          Stream << "external";
        else
          printValue(Stream, Node->getAllocationSite());
        Stream << ", collapsed)";
        break;
    }

    Stream << "\n";
  }
}

//
// Print out a summary of the points-to sets of the graph.
//
void PointsToGraph::printGraph(raw_ostream &Stream) {
  const char *Break = "------------------------------\n";

  Stream << "SCALAR MAP\n";

  //
  // Write out the scalar map.
  //
  ScalarMapTy::iterator SMIt = ScalarMap.begin(), SMItEnd = ScalarMap.end();
  for (; SMIt != SMItEnd; ++SMIt) {
    const Value *Pointer = SMIt->first;
    const PointsToSet &PTS = SMIt->second;

    Stream << Break;
    Stream << "Pointer: ";
    printValue(Stream, Pointer);
    Stream << "\n";
    Stream << "Points-to set:\n";
    printPointsToSet(Stream, PTS);
  }

  Stream << "POINTS-TO GRAPH\n";

  //
  // Write out the nodes in the points-to graph.
  //
  NodeMapTy::iterator NMIt = GraphNodes.begin(), NMItEnd = GraphNodes.end();
  for (; NMIt != NMItEnd; ++NMIt) {
    PointsToNode *Node = NMIt->second;
    Value *AllocSite = Node->getAllocationSite();

    Stream << Break;

    Stream << "Allocation site: ";
    printValue(Stream, AllocSite);
    Stream << "\n";

    EdgeMap &Edges = Node->getEdges();
    EdgeMap::iterator EIt = Edges.begin(), EItEnd = Edges.end();
    for (; EIt != EItEnd; ++EIt) {
      const Field &F = EIt->first;
      const PointsToSet &PTS = EIt->second;

      Stream << " At field ";
      F.print(Stream);
      Stream << ":\n";

      printPointsToSet(Stream, PTS);
    }
  }
}

}
