#ifndef _DOMAIN_H
#define _DOMAIN_H

namespace llvmpa {

// Type for a relation.
typedef const char *Domain;

typedef enum {
  INTEGER,
  LLVM_VALUE,
  LLVM_TYPE,
  STRING,
  FIELD,
  UNKNOWN_KIND
} DomainKind;

Domain getNameOfDomain(unsigned n);

DomainKind getKindForDomain(Domain D);

}

#endif
