//===- PointsToInterface.cpp ----------------------------------------------===//
//
//===----------------------------------------------------------------------===//
//
// Implementation of the basic points-to interface.
//
//===----------------------------------------------------------------------===//

#include "checker/interface/PointsToInterface.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Support/Debug.h"
#include <deque>
#include "llvm/Transforms/Scalar.h"
#include "llvm/IR/DerivedTypes.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Constants.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/Pass.h"
#include "llvm/Support/Debug.h"
#include "llvm/ADT/Statistic.h"

using namespace llvm;
using namespace llvmpa;

namespace aachecker {

char PointsToInterface::ID;

static RegisterPass<PointsToInterface> PointsToInterfacePI(
  "pa-interface", "Interface to llvmpa", false, true);

static RegisterAnalysisGroup<AliasAnalysisCheckerInterface, false>
X(PointsToInterfacePI);

void PointsToInterface::getAnalysisUsage(llvm::AnalysisUsage &AU) const {
  AU.addRequired<llvmpa::PointerAnalysis>();
  AU.setPreservesAll();
}

const char *PointsToInterface::getPassName() const {
  return "Interface to llvmpa";
}

static cl::opt<std::string> GraphDumpFile("dump-points-to",
    cl::desc("Dump the points-to graph to a file"));

bool PointsToInterface::runOnModule(Module &M) {
  PTG = getAnalysis<PointerAnalysis>().getGraph();
  if (!GraphDumpFile.empty()) {
    writeToFile(GraphDumpFile);
    std::string fancyName = GraphDumpFile;
    fancyName += ".txt";
    std::string error;
    raw_fd_ostream out(fancyName.data(), error);
    PTG->printGraph(out);
  }

  // Does not modify module.
  return false;
}

const AbstractLocSet PointsToInterface::EmptySet;

//
// Return a pointer to the abstract location for the specified node-field
// pair that represents the target of a pointer. The value of the abstract
// location depends on the node that is pointed to.
//
const AbstractLoc *
PointsToInterface::getAbstractLocForNodeFieldPair(const NodeFieldPair &Edge) {
  PointsToNode &Node = *Edge.first;
  if (Node.Kind == PointsToNode::TYPE_SAFE) {
    //
    // For type-safe nodes not escaping to external code, we can distinguish
    // the fields that are pointed to. Return a location representing
    // (node, field).
    //
    return &TypeSafeNodeMap[Edge];
  } else if (Node.Kind == PointsToNode::TYPE_UNSAFE) {
    //
    // If the node is type-unsafe, then return an abstract location representing
    // the entire memory object, rather than distinguishing individual fields.
    //
    return &TypeUnsafeNodeMap[&Node];
  } else {
    //
    // This node is reachable from external code; return the abstract
    // location representing external objects.
    //
    return getExternalLoc();
  }
}

//
// Given a value in the program, returns a pointer to a set of abstract
// locations that the value points to.
//
const AbstractLocSet *
PointsToInterface::getAbstractLocSetForValue(const Value *V) {
  //
  // Check if this abstract location set was already constructed.
  //
  if (AbsLocSets.count(V)) {
    return &AbsLocSets[V];

  } else if (PTG->getScalarMap().count(V)) {
    //
    // Otherwise, build the abstract location set.
    //
    PointsToSet &PTS = PTG->getPointsToSetForValue(V);

    for (PointsToSet::iterator I = PTS.begin(), E = PTS.end();
         I != E; ++I) {
      AbsLocSets[V].insert(getAbstractLocForNodeFieldPair(*I));
    }

    return &AbsLocSets[V];
  } else {
    //
    // Value not found in the scalar map, assume it isn't a pointer.
    //
    return &EmptySet;
  }
}

//
// Given a value in the program, returns a pointer to a set of abstract
// locations that are reachable from the value.
//
const AbstractLocSet *
PointsToInterface::getReachableAbstractLocSetForValue(const Value *V) {
  if (ReachableAbsLocSets.count(V)) {
    return &ReachableAbsLocSets[V];
  } else if (PTG->getScalarMap().count(V)) {
    //
    // Traverse the graph building the set of reachable abstract locations.
    //
    std::set<const AbstractLoc *> &Visited = ReachableAbsLocSets[V];
    const PointsToSet &PTS = PTG->getPointsToSetForValue(V);
    std::deque<NodeFieldPair> EdgesToVisit(PTS.begin(), PTS.end());

    while (!EdgesToVisit.empty()) {
      NodeFieldPair NFP = EdgesToVisit.front();
      EdgesToVisit.pop_front();

      const AbstractLoc *AL = getAbstractLocForNodeFieldPair(NFP);

      if (Visited.count(AL))
        continue;

      Visited.insert(AL);

      PointsToNode &Node = *NFP.first;
      EdgeMap &EM = Node.getEdges();

      if (Node.Kind == PointsToNode::TYPE_SAFE) {
        //
        // For a type-safe node, visit the points-to set of the field.
        //
        PointsToSet &Targets = EM[NFP.second];
        EdgesToVisit.insert(EdgesToVisit.end(), Targets.begin(), Targets.end());
      } else if (Node.Kind == PointsToNode::TYPE_UNSAFE) {
        //
        // For a type-unsafe node, visit all outgoing edges.
        //
        for (EdgeMap::iterator I = EM.begin(), E = EM.end();
             I != E; ++I) {
          PointsToSet &Targets = I->second;
          EdgesToVisit.insert(
            EdgesToVisit.end(), Targets.begin(), Targets.end()
          );
        }
      }

      //
      // For an External node, don't visit anything more, since we represent
      // all externally reachable memory with a single abstract location.
      //
    }

    return &Visited;
  } else {
    return &EmptySet;
  }
}

bool PointsToInterface::isAllocationSite(const Value *V) {
  AllocationSite S = const_cast<AllocationSite>(V);
  std::map<AllocationSite, PointsToNode *> &GraphNodes = PTG->getNodes();
  return GraphNodes.find(S) != GraphNodes.end();
}

const AbstractLoc *PointsToInterface::getExternalLoc() {
  return &ExternalAbsLoc;
}

const AbstractLocSet &PointsToInterface::getAllocatableLocs(const Value *V) {
  assert(isAllocationSite(V) && "This call makes no sense");
#if 1
  if (AllocatableLocSets.empty()) {
    std::map<const Value *, PointsToSet> &ScalarMap = PTG->getScalarMap();
    // Build the map
    for (std::map<const Value *, PointsToSet>::iterator I = ScalarMap.begin(),
        E = ScalarMap.end(); I != E; ++I) {
      PointsToSet &targets = I->second;
      for (PointsToSet::iterator I = targets.begin(); I != targets.end(); ++I) {
        const AbstractLoc *al = getAbstractLocForNodeFieldPair(*I);
        // Don't insert external nodes into the output.
        if (al == getExternalLoc())
          continue;
        AllocatableLocSets[I->first->getAllocationSite()].insert(al);
      }
    }
  }
  return AllocatableLocSets[V];
#else
  AllocationSite S = const_cast<AllocationSite>(V);
  PointsToNode *Node = PTG->getNodes()[S];

  AbstractLocSet allAbstractLocs;
  for (EdgeMap::iterator I = Node->getEdges().begin(),
      E = Node->getEdges().end(); I != E; ++I) {
    for (PointsToSet::iterator NFP = I->second.begin(), E = I->second.end();
        NFP != E; ++NFP) {
      allNodes.insert(getAbstractLocForNodeFieldPair(*NFP));
    }
  }
  return allNodes;
#endif
}
}
