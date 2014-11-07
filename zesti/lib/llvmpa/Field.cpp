#include "fields/Field.h"
#include <sstream>

using namespace llvm;
using std::string;
using std::stringstream;
using std::max;

namespace llvmpa {

void Field::addPathPrefix(PathItem Prefix) {
  PathFromBase.insert(PathFromBase.begin(), Prefix);
}

void Field::addPathPrefix(FieldPath Prefix) {
  PathFromBase.insert(PathFromBase.begin(), Prefix.begin(), Prefix.end());
}

static inline void print_fieldpath(raw_ostream &Out, const FieldPath &Path) {
  FieldPath::const_iterator FPIt = Path.begin(), FPItEnd = Path.end();
  for (; FPIt != FPItEnd; ++FPIt) {
    const PathItem &Item = *FPIt;
    if (Item.IndexKind == PathItem::ARRAY_INDEX)
      Out << "[array]";
    else
      Out << Item.Offset;
    Out << " ";
  }
}

//
// Debugging output...
//
void Field::print(raw_ostream &Out) const {
  if (Flag == EPSILON)
    Out << "EPSILON";
  else if (Flag == COLLAPSED)
    Out << "COLLAPSED";
  else {
    Out << "Field ";
    print_fieldpath(Out, PathFromBase);
    Out << "of structure ";
    BaseType->print(Out);
    Out << " [" << (void *) BaseType << "]";
  }
}

void Field::print() const { print(errs()); }

// One line summary for map file.
string Field::summary() const {
  if (Flag == EPSILON)
    return "[epsilon]";
  else if (Flag == COLLAPSED)
    return "[collapsed]";

  stringstream Output;
  Output << (void *) BaseType;
  for (unsigned Index = 0; Index < PathFromBase.size(); ++Index) {
    const PathItem &Item = PathFromBase[Index];
    Output << ".";
    if (Item.IndexKind == PathItem::NORMAL_INDEX)
      Output << Item.Offset;
    else
      Output << "array";
  }
  Output << "." << (void *) FieldType;
  return Output.str();
}


//
// Comparison implementation so we can store fields in containers.
//
bool Field::operator<(const Field &Other) const {
  //errs() << "other is " << (void *) &Other << "\n";
  if (Flag != Other.Flag)
    return ((int) Flag) < ((int) Other.Flag);
  else if (Flag == EPSILON || Flag == UNKNOWN || Flag == COLLAPSED)
    return false;
  else if (BaseType != Other.BaseType)
    return (uintptr_t) BaseType < (uintptr_t) Other.BaseType;
  else {
    unsigned Max = max(PathFromBase.size(), Other.PathFromBase.size());
    for (unsigned Index = 0; Index < Max; ++Index) {
      //
      // Compare path indices.
      //
      enum PathItem::IndexKind ThisKind = PathFromBase[Index].IndexKind;
      enum PathItem::IndexKind OtherKind = Other.PathFromBase[Index].IndexKind;

      if (ThisKind == PathItem::ARRAY_INDEX &&
          OtherKind != PathItem::ARRAY_INDEX)
          return true;
      else if (OtherKind == PathItem::ARRAY_INDEX)
        return false;

      int ThisOffset = PathFromBase[Index].Offset;
      int OtherOffset = Other.PathFromBase[Index].Offset;
      if (ThisOffset != OtherOffset)
        return (ThisOffset < OtherOffset);
    }
  }
  return false;
}

bool Field::operator==(const Field &Other) const {
  return !(*this < Other) && !(Other < *this);
}

}
