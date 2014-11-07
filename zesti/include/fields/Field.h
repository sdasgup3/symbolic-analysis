#ifndef _FIELD_H
#define _FIELD_H

#include "llvm/IR/Type.h"
#include "llvm/Support/raw_ostream.h"
#include <string>
#include <vector>

namespace llvmpa {

//
// An item representing an index of a GEP argument.
//
class PathItem {
public:
  enum IndexKind { ARRAY_INDEX, NORMAL_INDEX } IndexKind;
  // The value of the indexing offset, if it is a normal index.
  int Offset;

  PathItem(int ItemOffset) : IndexKind(NORMAL_INDEX), Offset(ItemOffset) {}
  PathItem() : IndexKind(ARRAY_INDEX), Offset(0) {}
};

//
// A sequence of GEP indices
//
typedef std::vector<PathItem> FieldPath;

//
// A field of a structure. The base type is the structure that the field is
// part of, the field type is the type of the field itself, and the path from
// the base type consists of the sequence of GEP indices that can be used to
// access the field from the structure.
//
class Field {
public:
  llvm::Type *BaseType;
  llvm::Type *FieldType;
  FieldPath PathFromBase;
  enum FieldFlag { COLLAPSED, EPSILON, NORMAL, UNKNOWN } Flag;

  Field() : BaseType(0), FieldType(0), Flag(UNKNOWN) {}

  Field(enum FieldFlag TheFlag) : BaseType(0), FieldType(0), Flag(TheFlag) {}

  Field(llvm::Type *BT, llvm::Type *FT, FieldPath &Offset)
    : BaseType(BT), FieldType(FT), PathFromBase(Offset), Flag(NORMAL) {}

  void addPathPrefix(PathItem Prefix);

  void addPathPrefix(FieldPath Prefix);

  // A one line summary suitable for putting into the map file.
  std::string summary() const;

  // Print to errs.
  void print() const;

  // Print to an ostream.
  void print(llvm::raw_ostream &Stream) const;

  bool operator <(const Field &Other) const;

  bool operator==(const Field &Other) const;
};

}

#endif
