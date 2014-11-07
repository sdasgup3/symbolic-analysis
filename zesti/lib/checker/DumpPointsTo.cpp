//===- DumpPointsTo.cpp ---------------------------------------------------===//
//
//===----------------------------------------------------------------------===//
//
// Implementing the PointsToInterface::writeToFile function.
//
//===----------------------------------------------------------------------===//

#include "checker/interface/PointsToInterface.h"

using namespace llvmpa;
using namespace llvm;
using namespace aachecker;

#if 0
class PuntingIterator {
public:
  typedef std::set<PointsToNode*>::iterator WrappedIterator;
  PuntingIterator(WrappedIterator it) : m_it(it) {}

  PointsToNode &operator*() const { return **m_it; }

  void operator++() { ++m_it; }

  bool operator!=(const PuntingIterator &o) const { return m_it != o.m_it; }

private:
  WrappedIterator m_it;
};

class ChildIterator : public std::iterator<std::input_iterator_tag, PointsToNode> {
public:
  typedef EdgeMap::iterator MacroIterator;
  typedef PointsToSet::iterator MicroIterator;
  ChildIterator(MacroIterator it, bool isEnd) : m_macro(it), atEnd(isEnd) {
    if (!atEnd)
      m_micro = m_macro->second.begin();
  }

  PointsToNode *operator*() const { return m_micro->first; }

  void operator++() {
    if (++m_micro == m_macro->second.end()) {
      ++m_macro;
      m_micro = m_macro->second.begin();
    }
  }

  bool operator!=(const ChildIterator &o) const {
    if (m_macro != o.m_macro)
      return false;
    return atEnd || o.atEnd ? false : m_micro != o.m_micro;
  }

private:
  MacroIterator m_macro;
  MicroIterator m_micro;
  bool atEnd;
};

namespace llvm {
  typedef std::set<PointsToNode*> PTSet;
template <>
struct GraphTraits<PTSet> {
  typedef PointsToNode NodeType;
  typedef ChildIterator ChildIteratorType;
  typedef PuntingIterator nodes_iterator;

  static nodes_iterator nodes_begin(const PTSet &G) {
    return PuntingIterator(G.begin());
  }
  static nodes_iterator nodes_end(const PTSet &G) {
    return PuntingIterator(G.end());
  }

  static ChildIteratorType child_begin(NodeType *T) {
    return ChildIterator(T->getEdges().begin(), false);
  }
  static ChildIteratorType child_end(NodeType *T) {
    return ChildIterator(T->getEdges().end(), true);
  }
};

template <>
struct DOTGraphTraits<PTSet> : public DefaultDOTGraphTraits {
  DOTGraphTraits(bool simple = false) : DefaultDOTGraphTraits(simple) {}

  static std::string getNodeLabel(PointsToNode *N, const PTSet &) {
    const Value *V = N->getAllocationSite();
    std::string output;
    {
      raw_string_ostream out(output);
      if (!V) {
        // Purposefully do absolutely nothing here.
        out << "Null value";
      } else if (const GlobalValue *GV = dyn_cast<GlobalValue>(V))
        out << '@' << GV->getName();
      else if (const Argument *A = dyn_cast<Argument>(V)) {
        V->print(out);
        out << " of function " << A->getParent()->getName();
      } else if (const Instruction *I = dyn_cast<Instruction>(V)) {
        V->print(out);
        out << " of function " << I->getParent()->getParent()->getName();
      } else
        V->print(out);
    }
    return output;
  }
};
}

void PointsToInterface::writeToFile(StringRef Filename) {
  std::string error;
  raw_fd_ostream out(Filename.data(), error);

  std::set<PointsToNode*> allNodes;
  for (std::map<const Value *, PointsToSet>::iterator
      I = PTG->getScalarMap().begin(), E = PTG->getScalarMap().end();
      I != E; ++I) {
    allNodes.insert(PTG->getOrCreateNode(const_cast<AllocationSite>(I->first)));
  }
  for (std::map<AllocationSite, PointsToNode *>::iterator
      I = PTG->getNodes().begin(), E = PTG->getNodes().end();
      I != E; ++I) {
    allNodes.insert(I->second);
  }
  //WriteGraph(out, PTG);
  WriteGraph(out, allNodes);
}
#else

struct GraphNode {
  union {
    const Value *Val;
    PointsToNode *PtsNode;
  };
  bool isAlloc;

  GraphNode(const Value *V) : Val(V), isAlloc(false) {}
  GraphNode(PointsToNode *N) : PtsNode(N), isAlloc(true) {}

  void printLabel(raw_ostream &out) const {
    const Value *Node = isAlloc ? PtsNode->getAllocationSite() : Val;
    if (!Node) {
      // Purposefully do absolutely nothing here.
      out << "Null value";
    } else if (const GlobalValue *GV = dyn_cast<GlobalValue>(Node))
      out << '@' << GV->getName();
    else if (const Argument *A = dyn_cast<Argument>(Node)) {
      Node->print(out);
      out << " of function " << A->getParent()->getName();
    } else if (const Instruction *I = dyn_cast<Instruction>(Node)) {
      Node->print(out);
      out << " of function " << I->getParent()->getParent()->getName();
    } else
      Node->print(out);
  }
};

bool operator<(const GraphNode &g1, const GraphNode &g2) {
  if (g1.isAlloc == g2.isAlloc)
    return g1.Val < g2.Val;
  return g1.isAlloc;
}

bool operator==(const GraphNode &g1, const GraphNode &g2) {
  return g1.isAlloc == g2.isAlloc && g1.Val == g2.Val;
}

std::string getNodeName(PointsToNode *Node, std::set<GraphNode> &Nodes) {
  std::string output;
  {
    raw_string_ostream out(output);
    out << "Node";
    out << static_cast<const void*>(&*Nodes.find(GraphNode(Node)));
  }
  return output;
}

void printEdges(raw_ostream &out, const GraphNode *Source, PointsToSet &Targets,
    std::set<GraphNode> &Nodes) {
  for (PointsToSet::iterator Target = Targets.begin(), E = Targets.end();
      Target != E; ++Target) {
    out << "  Node" << static_cast<const void*>(Source) << " -> "
        << getNodeName(Target->first, Nodes) << ";\n";
  }
}

void PointsToInterface::writeToFile(StringRef Filename) {
  std::string error;
  raw_fd_ostream out(Filename.data(), error);

  std::set<GraphNode> nodes;
  for (std::map<const Value *, PointsToSet>::iterator
      I = PTG->getScalarMap().begin(), E = PTG->getScalarMap().end();
      I != E; ++I) {
    nodes.insert(GraphNode(I->first));
  }
  for (std::map<AllocationSite, PointsToNode *>::iterator
      I = PTG->getNodes().begin(), E = PTG->getNodes().end();
      I != E; ++I) {
    nodes.insert(GraphNode(I->second));
  }

  out << "digraph unnamed {\n";
  // Nodes
  for (std::set<GraphNode>::iterator I = nodes.begin(), E = nodes.end();
      I != E; ++I) {
    out << "  Node" << static_cast<const void*>(&*I) <<
      " [shape=record,label=\"{";
    I->printLabel(out);
    // This isn't right for fields...
#if 0
    if (I->isAlloc) {
      out << " |{";
      const char *pre = "";
      EdgeMap &edges = I->PtsNode->getEdges();
      for (EdgeMap::iterator Edge = edges.begin(), E = edges.end();
          Edge != E; ++Edge) {
        out << pre << "<";
        Edge->first.print(out);
        out << "> ";
        Edge->first.print(out);
        pre = " |";
      }
      out << "}";
    }
#endif
    out << "}\"];\n";
  }
  PointsToNode *External = PTG->getOrCreateExternalNode();
  nodes.insert(GraphNode(External));
  out << "  " << getNodeName(External, nodes) <<
    " [shape=record,label=\"{External}\"];\n";

  // Edges
  for (std::set<GraphNode>::iterator I = nodes.begin(), E = nodes.end();
      I != E; ++I) {
    if (I->isAlloc) {
      EdgeMap &edges = I->PtsNode->getEdges();
      for (EdgeMap::iterator F = edges.begin(), E = edges.end(); F != E; ++F) {
        printEdges(out, &*I, F->second, nodes);
      }
    } else {
      PointsToSet &targets = PTG->getPointsToSetForValue(I->Val);
      printEdges(out, &*I, targets, nodes);
    }
  }

  out << "}\n";
}
#endif
