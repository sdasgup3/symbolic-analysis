#ifndef RDOMINANCEFRONTIERS_H
#define RDOMINANCEFRONTIERS_H

#include "llvm/Analysis/PostDominators.h"
#include "llvm/IR/BasicBlock.h"
#include <map>
#include <set>

namespace symbexchecks {

class PostDominanceFrontiers {
public:
  typedef std::set<llvm::BasicBlock*> DomSetType;
  typedef std::map<llvm::BasicBlock*, DomSetType> DomSetMapType;

private:
  DomSetMapType Frontiers;

public:
  // Interface for accessing the post dominance frontiers
  typedef DomSetMapType::iterator iterator;
  typedef DomSetMapType::const_iterator const_iterator;
  iterator begin();
  const_iterator begin() const;
  iterator end();
  const_iterator end() const;
  iterator find(llvm::BasicBlock *B);
  const_iterator find(llvm::BasicBlock *B) const;

  // This is to be called to calculate the post dominance frontiers.
  void calculate(const llvm::PostDominatorTree &PDT);

  // Printing
  void print(llvm::raw_ostream &O) const;

private:
  void calculate(const llvm::PostDominatorTree &PDT,
                 const llvm::DomTreeNode *n);
};

}
#endif
