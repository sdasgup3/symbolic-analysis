#include "context/ContextTypes.h"
#include "relations/Relation.h"
#include "llvm/Support/raw_ostream.h"
#include <cstdlib>
#include <string>

using std::string;

namespace llvmpa {

#define ADD_RELATION(name, arity, fields) { #name, arity, fields }

#define FIELD                  { "Field" }
#define FIELD_FIELD            { "Field", "Field" }
#define FIELD_OFFSET_FIELD     { "Field", "Offset", "Field" }
#define FIELD_TYPE             { "Field", "Type" }
#define PTR_ALLOCSITE          { "Pointer", "Allocsite" }
#define FIELD_PTR_ALLOCSITE    { "Field", "Pointer", "Allocsite" }
#define PTR_ALLOCSITE_FUNC     { "Pointer", "Allocsite", "Function" }
#define PTR_INT_CALLSITE_FUNC  { "Pointer", "Integer", "Callsite", "Function" }
#define PTR_CALLSITE_FUNC      { "Pointer", "Callsite", "Function" }
#define PTR_INT_FUNC           { "Pointer", "Integer", "Function" }
#define INT_FUNC               { "Integer", "Function" } 
#define VALIST_FUNC            { "Valist", "Function" }
#define PTR_FUNC               { "Pointer", "Function" }
#define PTR_PTR_FUNC           { "Pointer", "Pointer", "Function" }
#define PTR_PTR_OFFSET_FUNC    { "Pointer", "Pointer", "Offset", "Function" }
#define PTR                    { "Pointer" }
#define FUNC                   { "Function" }
#define PTR_NOADDRFUNC         { "Pointer", "Function" }
#define ALLOCSITE              { "Allocsite" }
#define ALLOCSITE_TYPE         { "Allocsite", "Type" }

#define CONTEXT                { CONTEXT_1CS_H }
#define FUNC_CONTEXT           { "Function", CONTEXT_1CS_H }


//
// This structure holds all the string values we consider relations.
//
const struct REntry {
  Relation name;
  unsigned arity;
  Domain fields[5];
} Relations[] = {
  //           name                arity  field types
  // FieldFactGenerator relations
  ADD_RELATION(EpsilonField,       1,     FIELD),
  ADD_RELATION(CollapseField,      1,     FIELD),
  ADD_RELATION(OverlapsWithEpsilon,1,     FIELD),
  ADD_RELATION(SafeCast           ,2,     FIELD_FIELD),
  ADD_RELATION(FieldOffset,        3,     FIELD_OFFSET_FIELD),
  ADD_RELATION(FieldInType,        2,     FIELD_TYPE),

  // ConstantFactGenerator relations
  ADD_RELATION(StaticAlloca,       2,     PTR_ALLOCSITE),
  ADD_RELATION(GlobalContext,      1,     CONTEXT),
  ADD_RELATION(InitField,          3,     FIELD_PTR_ALLOCSITE),

  // FactGenerator relations
  ADD_RELATION(Alloca,             3,     PTR_ALLOCSITE_FUNC),
  ADD_RELATION(AllocsiteType,      2,     ALLOCSITE_TYPE),
  ADD_RELATION(Call,               3,     PTR_CALLSITE_FUNC),
  ADD_RELATION(Actual,             4,     PTR_INT_CALLSITE_FUNC),
  ADD_RELATION(VaArg,              3,     PTR_PTR_FUNC),
  ADD_RELATION(VaStart,            2,     PTR_FUNC),
  ADD_RELATION(VaCopy,             3,     PTR_PTR_FUNC),
  ADD_RELATION(CallRet,            3,     PTR_CALLSITE_FUNC),
  ADD_RELATION(Formal,             3,     PTR_INT_FUNC),
  ADD_RELATION(Argc,               2,     INT_FUNC),
  ADD_RELATION(HasValist,          2,     VALIST_FUNC),
  ADD_RELATION(Ret,                2,     PTR_FUNC),
  ADD_RELATION(FunctionDefinition, 2,     PTR_FUNC),
  ADD_RELATION(NoAddressFunctionDefinition, 2, PTR_NOADDRFUNC),
  ADD_RELATION(StartingPoint,      2,     FUNC_CONTEXT),
  ADD_RELATION(PtrAssign,          3,     PTR_PTR_FUNC),
  ADD_RELATION(GEP,                4,     PTR_PTR_OFFSET_FUNC),
  ADD_RELATION(Store,              3,     PTR_PTR_FUNC),
  ADD_RELATION(Load,               3,     PTR_PTR_FUNC),
  ADD_RELATION(Copy,               3,     PTR_PTR_FUNC),
  ADD_RELATION(Set,                2,     PTR_FUNC),
  ADD_RELATION(PtrToInt,           2,     PTR_FUNC),
  ADD_RELATION(IntToPtr,           2,     PTR_FUNC),
  ADD_RELATION(IntLoad,            2,     PTR_FUNC),
  ADD_RELATION(IntStore,           2,     PTR_FUNC),
  ADD_RELATION(ExternallyVisible,  1,     PTR),
  ADD_RELATION(ExternallyVisibleFunction, 1, FUNC),
  ADD_RELATION(ExternallyInitializedFormalArg, 2, PTR_FUNC),
  { 0, 0, { } }
};

//
// Get the arity of the specified relation.
//
unsigned arity(Relation R) {
  string RString(R);
  for (unsigned i = 0; Relations[i].name; ++i) {
    if (RString == Relations[i].name)
      return Relations[i].arity;
  }
  llvm::errs() << "Relation " << R << " not found!\n";
  exit(1);
}

Relation getNameOfRelation(unsigned n) {
  if (n >= (sizeof(Relations) / sizeof(struct REntry)))
    return 0;
  else
    return Relations[n].name;
}

Domain getDomainAtIndex(Relation R, unsigned Index) {
  string RString(R);
  for (unsigned i = 0; Relations[i].name; ++i) {
    if (RString == Relations[i].name) {
      if (Relations[i].arity <= Index) {
        llvm::errs() << "Can't get index " << Index << " on relation " << R;
        llvm::errs() << " of arity " << Relations[i].arity << "!\n";
        exit(1);
      }
      return Relations[i].fields[Index];
    }
  }
  llvm::errs() << "Relation " << R << " not found!\n";
  exit(1);
}

}
