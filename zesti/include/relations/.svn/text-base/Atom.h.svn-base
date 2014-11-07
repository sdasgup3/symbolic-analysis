#ifndef _ATOM_H
#define _ATOM_H

#include "domains/Domain.h"
#include "fields/Field.h"
#include "llvm/IR/Value.h"
#include "llvm/Support/raw_ostream.h"

namespace llvmpa {

class Atom {
public:
  DomainKind Kind;

  // Accessor for different kinds of objects.
  llvm::Value *LLVMValue;
  llvm::Type  *LLVMType;
  Field *FieldValue;
  std::string *StringValue;
  int IntValue;

  Atom() : Kind(UNKNOWN_KIND) {}
  Atom(llvm::Value *V) : Kind(LLVM_VALUE), LLVMValue(V) {}
  Atom(llvm::Type *T) : Kind(LLVM_TYPE), LLVMType(T) {}
  Atom(Field *F) : Kind(FIELD), FieldValue(F) {}
  Atom(std::string *S) : Kind(STRING), StringValue(S) {}
  Atom(int I) : Kind(INTEGER), IntValue(I) {}

  // Implement comparison so we can store this in maps.
  bool operator<(const Atom& Other) const {
    switch (Kind) {
      case LLVM_TYPE:
        return ((uintptr_t) LLVMType) < ((uintptr_t) Other.LLVMType);
      case LLVM_VALUE:
        return ((uintptr_t) LLVMValue) < ((uintptr_t) Other.LLVMValue);
      case INTEGER:
        return IntValue < Other.IntValue;
      case FIELD:
        return *FieldValue < *Other.FieldValue;
      case STRING:
        return *StringValue < *Other.StringValue;
      default:
        llvm::errs() << "Comparison with unknown atom type!\n";
        exit(1);
    }
  }
};

typedef std::vector<Atom> AtomTuple;

}

#endif
