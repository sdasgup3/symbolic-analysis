#include "domains/DomainMap.h"

using namespace llvm;
using std::set;

namespace llvmpa {

//
// Construct the domains from the database of items.
//
void DomainMap::buildFrom(Database &DB) {
  //
  // Go over the entries in each relation in the database and add the atoms
  // to the relevant domains.
  //
  for (unsigned RelNum = 0; getNameOfRelation(RelNum); ++RelNum) {

    Relation TheRelation = getNameOfRelation(RelNum);
    const set<AtomTuple> &Tuples = DB.getEntriesForRelation(TheRelation);

    unsigned RelSize = arity(TheRelation);
    for (unsigned Index = 0; Index < RelSize; ++Index) {
      Domain TheDomain = getDomainAtIndex(TheRelation, Index);

      set<AtomTuple>::const_iterator TuplesIt = Tuples.begin();
      set<AtomTuple>::const_iterator TuplesItEnd = Tuples.end();
      for (; TuplesIt != TuplesItEnd; ++TuplesIt) {
        const Atom &Atom = (*TuplesIt)[Index];
        add(TheDomain, Atom);
      }
    }
  }
}

//
// Add a value to the given domain.
//
void DomainMap::add(Domain D, const Atom &A) {
  if (AtomToIndex[D].find(A) == AtomToIndex[D].end()) {
    // Check to make sure the atom is of the given type.
    if (A.Kind != getKindForDomain(D)) {
      errs() << "Inserting element of wrong type into domain!\n";
      exit(1);
    }
    unsigned Index = DomainSizes[D];
    AtomToIndex[D][A] = Index;
    IndexToAtom[D][Index] = A;
    DomainSizes[D] = Index + 1;
  }
}

//
// Check if the value belongs in the specified domain.
//
bool DomainMap::isItemInDomain(Domain D, const Atom &A) {
  if (AtomToIndex.find(D) == AtomToIndex.end())
    return false;
  else if (AtomToIndex[D].find(A) == AtomToIndex[D].end())
    return false;
  else
    return true;
}

//
// Get the value at the specified index in the domain.
//
Atom &DomainMap::getItem(Domain D, unsigned I) {
  unsigned Size = getSizeOfDomain(D);
  if (Size == 0 || I >= Size) {
    errs() << "Index out of bounds!\n";
    exit(1);
  }
  return IndexToAtom[D][I];
}

//
// Return the index of the given value in the domain. (zero-based counter)
//
unsigned DomainMap::getIndexForItemInDomain(Domain D, const Atom &A) {
  if (!isItemInDomain(D, A)) {
    errs() << "Domain is " << D << " btw\n";
    errs() << "Item not found in domain!\n";
    if (A.Kind == LLVM_VALUE) {
      errs() << "It's an llvm value " << (void *) A.LLVMValue << "\n";
      A.LLVMValue->dump();
    }
    else if (A.Kind == STRING) {
      errs() << "It's the string " << A.StringValue << "\n";
    }
    else if (A.Kind == FIELD) {
      errs() << "It's the field " << A.FieldValue->summary() << "\n";
      A.FieldValue->print();
    }
    exit(1);
  }
  return AtomToIndex[D][A];
}

//
// Return the size of the given domain.
//
unsigned DomainMap::getSizeOfDomain(Domain D) {
  if (DomainSizes.find(D) == DomainSizes.end())
    return 0;
  else
    return DomainSizes[D];
}

}
