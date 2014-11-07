#ifndef _DOMAINMAP_H
#define _DOMAINMAP_H

#include "relations/Database.h"

namespace llvmpa {

//
// Holds the values in the program that belong in given domains.
//
class DomainMap {
private:
  std::map<std::string, unsigned> DomainSizes;
  std::map<std::string, std::map<Atom, unsigned> > AtomToIndex;
  std::map<std::string, std::map<unsigned, Atom> > IndexToAtom;

public:
  //
  // Construct the domains from the given database entries.
  //
  void buildFrom(Database &DB);

  //
  // Add a value to the given domain.
  //
  void add(Domain D, const Atom &A); 

  //
  // Check if the value belongs in the specified domain.
  //
  bool isItemInDomain(Domain D, const Atom &A);

  //
  // Get the value at the specified index in the domain.
  //
  Atom &getItem(Domain D, unsigned I);

  //
  // Return the index of the given value in the domain. (zero-based counter)
  //
  unsigned getIndexForItemInDomain(Domain D, const Atom &A);

  //
  // Return the size of the given domain.
  //
  unsigned getSizeOfDomain(Domain D);
};

}


#endif
