#ifndef DATABASE_H
#define DATABASE_H

#include "relations/Atom.h"
#include "relations/Relation.h"
#include <map>
#include <set>

namespace llvmpa {

//
// Represents the value of an entry in the relation tuple.
//
typedef std::vector<Atom> AtomTuple;

//
// A database to hold relations.
//
class Database {
private:
  std::map<std::string, std::set<AtomTuple> > RelationsDB;

public:
  void add(Relation R, ...);
  void addTuple(Relation R, AtomTuple &Tuple);

  // Gets all the entries for the specified relation.
  const std::set<AtomTuple> &getEntriesForRelation(Relation R);
};

}

#endif
