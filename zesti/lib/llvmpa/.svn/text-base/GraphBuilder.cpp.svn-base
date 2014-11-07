#include "pointstograph/GraphBuilder.h"
#include <cstdio>

using namespace llvm;
using std::string;
using std::vector;
using std::set;

namespace llvmpa {

void GraphBuilder::parseFile(
  string &FileName, unsigned Columns, vector<IntVect> &Output
) {
  FILE *InputFile = fopen(FileName.c_str(), "r");

  unsigned index;
  uintptr_t elem;
  unsigned col = 0;
  IntVect Result;
  while (fscanf(InputFile, " [%u] %lu ", &index, &elem) != EOF) {
    Result.push_back(elem);
    col = (col+1) % Columns;
    if (col == 0) {
      Output.push_back(Result);
      Result.clear();
    }
  }

  assert(col == 0);

  fclose(InputFile);
}

//
// Construct the points-to graph out of the logicblox output files.
//
PointsToGraph *GraphBuilder::buildGraph() {
  if (ComputedGraph)
    return ComputedGraph;

  //DomainMap &DM = *DMap;

  //
  // Parse the relation tuples.
  //
  string PointsToMap = OutputDir + "/PointsTo.tuples";
  vector<IntVect> PointsToItems;

  string ObjPointsToMap = OutputDir + "/ObjPointsTo.tuples";
  vector<IntVect> ObjPointsToItems;

  string CollapsedMap = OutputDir + "/Collapsed.tuples";
  vector<IntVect> CollapsedItems;

  string EscapesMap = OutputDir + "/ObjEscapes.tuples";
  vector<IntVect> EscapingItems;

  string PTExternalMap = OutputDir + "/PointsToExternal.tuples";
  vector<IntVect> PTExternalItems;

  string OPTExternalMap = OutputDir + "/ObjPointsToExternal.tuples";
  vector<IntVect> OPTExternalItems;

  parseFile(CollapsedMap, 1, CollapsedItems);
  parseFile(EscapesMap, 1, EscapingItems);
  parseFile(PointsToMap, 3, PointsToItems);
  parseFile(ObjPointsToMap, 4, ObjPointsToItems);
  parseFile(PTExternalMap, 1, PTExternalItems);
  parseFile(OPTExternalMap, 2, OPTExternalItems);

  PointsToGraph *Graph = new PointsToGraph();

  Field Collapsed(Field::COLLAPSED);
  PointsToNode *ExternalNode = Graph->getOrCreateExternalNode();

  set<PointsToNode *> CollapsedNodes;
  set<Value *> EscapingObjects;

#define isCollapsed(val) (CollapsedNodes.find(val) != CollapsedNodes.end())
#define isExternal(val) (EscapingObjects.find(val) != EscapingObjects.end())

  //
  // Construct the set of escaping objects.
  //
  vector<IntVect>::iterator EscapingIt = EscapingItems.begin();
  vector<IntVect>::iterator EscapingItEnd = EscapingItems.end();

  for (; EscapingIt != EscapingItEnd; ++EscapingIt) {
    IntVect &Vect = *EscapingIt;
    Value *Object = (Value *) Vect[0];

    EscapingObjects.insert(Object);

    PointsToNode *EscapingNode =
      Graph->getOrCreateNode(Object, PointsToNode::EXTERNAL);
    EscapingNode->addEdge(
      &Collapsed, ExternalNode, &Collapsed
    );
  }

  //
  // Add the pointers which point to external objects into the graph.
  //
  vector<IntVect>::iterator PTExternalIt = PTExternalItems.begin();
  vector<IntVect>::iterator PTExternalItEnd = PTExternalItems.end();

  for (; PTExternalIt != PTExternalItEnd; ++PTExternalIt) {
    IntVect &Vect = *PTExternalIt;
    Value *Pointer = (Value *) Vect[0];

    Graph->addScalarEdge(Pointer, ExternalNode, &Collapsed);
  }

  //
  // Construct the set of collapsed nodes.
  //
  vector<IntVect>::iterator CollapsedIt = CollapsedItems.begin();
  vector<IntVect>::iterator CollapsedItEnd = CollapsedItems.end();
  for (; CollapsedIt != CollapsedItEnd; ++CollapsedIt) {
    IntVect &Vect = *CollapsedIt;
    Value *Object = (Value *) Vect[0];

    if (isExternal(Object))
      continue;

    PointsToNode *Node =
      Graph->getOrCreateNode(Object, PointsToNode::TYPE_UNSAFE);
    CollapsedNodes.insert(Node);
  }

  //
  // Add the points-to edges for fields of objects that point to external
  // objects.
  //
  vector<IntVect>::iterator OPTExternalIt = OPTExternalItems.begin();
  vector<IntVect>::iterator OPTExternalItEnd = OPTExternalItems.end();
  for (; OPTExternalIt != OPTExternalItEnd; ++OPTExternalIt) {
    IntVect &Vect = *OPTExternalIt;

    Value *Object = (Value *) Vect[0];
    Field *F = (Field *) Vect[1];

    if (isExternal(Object))
      continue;

    PointsToNode *ObjectNode = Graph->getOrCreateNode(Object);
    
    ObjectNode->addEdge(F, ExternalNode, &Collapsed);
  }

  //
  // Build the scalar map.
  //
  vector<IntVect>::iterator PointsToIt = PointsToItems.begin();
  vector<IntVect>::iterator PointsToItEnd = PointsToItems.end();
  for (; PointsToIt != PointsToItEnd; ++PointsToIt) {
    IntVect &Vect = *PointsToIt;
    Value *Variable = (Value *) Vect[0];
    Value *Object = (Value *) Vect[1];
    Field *F = (Field *) Vect[2];

    PointsToNode *ObjectNode;

    ObjectNode = Graph->getOrCreateNode(Object);

    Graph->addScalarEdge(Variable, ObjectNode, F);
  }

  //
  // Build the points to graph.
  //
  vector<IntVect>::iterator ObjPointsToIt = ObjPointsToItems.begin();
  vector<IntVect>::iterator ObjPointsToItEnd = ObjPointsToItems.end();
  for (; ObjPointsToIt != ObjPointsToItEnd; ++ObjPointsToIt) {
    IntVect &Vect = *ObjPointsToIt;

    Value *Left = (Value *) Vect[0];
    Field *LeftField = (Field *) Vect[1];
    Value *Right = (Value *) Vect[2];
    Field *RightField = (Field *) Vect[3];

    if (isExternal(Left))
      continue;

    PointsToNode *LeftNode, *RightNode;

    LeftNode = Graph->getOrCreateNode(Left);
    RightNode = Graph->getOrCreateNode(Right);
    LeftNode->addEdge(LeftField, RightNode, RightField);
  }

  ComputedGraph = Graph;

  return Graph;
}

}
