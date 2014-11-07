#include "relations/Database.h"
#include "fields/Field.h"

using namespace llvm;
using std::stringstream;
using std::string;
using std::set;
#include <stdarg.h>

namespace llvmpa {

//
// Add an entry to the relations database (directly).
//
void Database::addTuple(Relation R, AtomTuple &Tuple) {
  const unsigned Arity = arity(R);

  if (Arity != Tuple.size()) {
    errs() << "Incorrect arity!\n";
    exit(1);
  }

  //
  // FIXME: It may benefit to sanity check the domains of the tuple....
  //

  RelationsDB[R].insert(Tuple);
}


//
// Add an entry to the relations database.
//
void Database::add(Relation R, ...) {
  AtomTuple Tuple;

  const unsigned Arity = arity(R);
  va_list Args;
  va_start(Args, R);

  for (unsigned Index = 0; Index < Arity; ++Index) {
    DomainKind Kind = getKindForDomain(getDomainAtIndex(R, Index));
    switch (Kind) {
      case INTEGER:
        Tuple.push_back(Atom(va_arg(Args, int)));
        break;
      case LLVM_VALUE:
        Tuple.push_back(Atom(va_arg(Args, Value *)));
        break;
      case LLVM_TYPE:
        Tuple.push_back(Atom(va_arg(Args, Type *)));
        break;
      case STRING:
        Tuple.push_back(Atom(va_arg(Args, string *)));
        break;
      case FIELD:
        Tuple.push_back(Atom(va_arg(Args, Field *)));
        break;
      default:
        errs() << "unexpected domain kind!\n";
        exit(1);
        break;
    }
  }

  va_end(Args);

  RelationsDB[R].insert(Tuple);
}


//
// Get the set corresponding to the specified relation in this database.
//
const set<AtomTuple> &Database::getEntriesForRelation(Relation R) {
  return RelationsDB[R];
}

}
