#include "symbexchecks/PostDominanceFrontiers.h"
#include "llvm/Support/CFG.h"

using namespace llvm;

namespace symbexchecks {

PostDominanceFrontiers::PostDominanceFrontiers(PostDominatorTree *pdt) {
  thisPDT = pdt;
}

PostDominanceFrontiers::iterator
PostDominanceFrontiers::begin() { return Frontiers.begin(); }

PostDominanceFrontiers::const_iterator
PostDominanceFrontiers::begin() const { return Frontiers.begin(); }

PostDominanceFrontiers::iterator
PostDominanceFrontiers::end() { return Frontiers.end(); }

PostDominanceFrontiers::const_iterator
PostDominanceFrontiers::end() const { return Frontiers.end(); }

PostDominanceFrontiers::iterator
PostDominanceFrontiers::find(BasicBlock *B) { return Frontiers.find(B); }

PostDominanceFrontiers::const_iterator
PostDominanceFrontiers::find(BasicBlock *B) const { return Frontiers.find(B); }

void PostDominanceFrontiers::calculate(void) {
  Frontiers.clear();
  assert(thisPDT);

  calculate(thisPDT->getRootNode());
}

void PostDominanceFrontiers::calculate(const DomTreeNode *n) {

  // First we visit the children for a bottom up traversal of the
  // post dominator tree.
  DomTreeNode::const_iterator it = n->begin(), itEnd = n->end();
  for (; it != itEnd; ++it) {
    calculate(*it);
  }

  // Then we visit the node itself. If this is a dummy root node
  // (usefull to serve a unique root of multiple exits) we return.
  BasicBlock *bb = n->getBlock();
  if (!bb) return;
  DomSetType &DS = Frontiers[bb];

  // Calculate the DF_local: loop over CFG predecessors.
  pred_iterator pi = pred_begin(bb), piEnd = pred_end(bb);
  for (; pi != piEnd; ++pi) {
    BasicBlock *predBB = *pi;
    // does n immediately postdominate this predecessor?
    if (thisPDT->getNode(predBB)->getIDom() != n) DS.insert(predBB);
  }

  // Calculate the DF_up: loop over post dominator tree children.
  for (it = n->begin(); it != itEnd; ++it) {
    BasicBlock *childBB = (*it)->getBlock();
    assert(childBB);
    DomSetMapType::iterator dfIt = Frontiers.find(childBB);
    assert(dfIt != Frontiers.end());
    DomSetType &ChildDS = dfIt->second;
    DomSetType::iterator it2 = ChildDS.begin(), it2End = ChildDS.end();
    for (; it2 != it2End; ++it2) {
      BasicBlock *bb2 = *it2;
      if (thisPDT->getNode(bb2)->getIDom() != n) DS.insert(bb2);
    }
  }
}

}
