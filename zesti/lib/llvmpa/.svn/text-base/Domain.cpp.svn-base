#include "domains/Domain.h"
#include <string>

using std::string;

namespace llvmpa {

static const struct {
  Domain Name;
  DomainKind Kind;
} DomainList[] = {
  { "Integer",   INTEGER    },
  { "Field",     FIELD      },
  { "Offset",    STRING     },
  { "Pointer",   LLVM_VALUE },
  { "Callsite",  LLVM_VALUE },
  { "Allocsite", LLVM_VALUE },
  { "Function",  LLVM_VALUE },
  { "Valist",    LLVM_VALUE },
  { "Type",      LLVM_TYPE  },
  { 0,     UNKNOWN_KIND }
};

Domain getNameOfDomain(unsigned Index) {
  return DomainList[Index].Name;
}

DomainKind getKindForDomain(Domain D) {
  string DomainString(D);
  for (unsigned Index = 0; DomainList[Index].Name; ++Index) {
    if (DomainString == DomainList[Index].Name)
      return DomainList[Index].Kind;
  }
  return UNKNOWN_KIND;
}

}
