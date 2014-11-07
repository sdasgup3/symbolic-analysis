#ifndef _FIELDFACTGENERATOR_H
#define _FIELDFACTGENERATOR_H

#include "relations/Database.h"
#include "llvm/IR/DataLayout.h"
#include "llvm/IR/DerivedTypes.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/Module.h"

namespace llvmpa {

//
//
//
class FieldOffsetTuple {
public:
  Field Field1;
  std::string Offset; // canonical and annotated
  Field Field2;

  FieldOffsetTuple() {}
  FieldOffsetTuple(Field &F1, std::string &O, Field &F2)
    : Field1(F1), Offset(O), Field2(F2) {}
};

//
// Goes over the type system of the module and computes the set of fields of
// the structs on the module. This class also computes how struct indexing
// operations translate across fields of an object.
//
class FieldFactGenerator {
                           
private:
  llvm::Type *VoidTy;
  Database *DB;
  const llvm::DataLayout *DL;

  std::map<Field, Field *> AllFields;
  std::map<std::string, std::string *> AllOffsets;

  // Add the specified field to the field set.
  void registerField(const Field &F);

  // Add the specified offset to the offset set.
  void registerOffset(const std::string &Offset);

  // Get the field handle (pointer that is used in atoms) for the specified
  // field.
  Field *getFieldHandle(const Field &F);

  // Get the offset handle (pointer that is used in atoms) for the specified 
  // field.
  std::string *getOffsetHandle(const std::string &Offset);


  std::string buildAnnotatedOffsetString(llvm::Type *Base,
                                         const std::string &OffsetString);
  std::string buildAnnotatedOffsetString(llvm::Type *Base,
                                         std::vector<llvm::Value *> &GEPSeq);
  std::string buildCanonicalOffsetString(const FieldPath &Offsets);


  // All struct types found in the program.
  std::set<llvm::StructType *> AllStructTypes;
  // All fields of a given structure, in order.
  std::map<llvm::StructType *, std::vector<Field> > StructFields;

  // Process and identify the fields of a structure.
  void addFieldsForStruct(llvm::StructType *ST);

  // Add corresponding fields from the smaller struct into the larger one.
  void embedFieldsInStruct(
    llvm::StructType *Base, llvm::StructType *Inner, FieldPath &Prefix
  );

  // Collect overlapping fields of two structs
  void getOverlappingFields(
    llvm::StructType *ST1, llvm::StructType *ST2,
    std::vector<std::pair<Field, Field> > &overlapFields
  );

  // OffsetsForStruct: Given a struct type, this map holds the struct type's
  // mapping from offset string into field.
  typedef std::map<Field, std::string> FieldOffsetMap;
  typedef std::map<llvm::StructType *, FieldOffsetMap> StructOffsetMap;
  StructOffsetMap OffsetsForStruct;

  // Compute and insert the offsets that are legal from the basis of the given
  // struct type.
  void computeCanonicalOffsets(llvm::StructType *ST);


  std::set<llvm::StructType *> MergedTypes;
  std::map<llvm::Type *, std::vector<FieldOffsetTuple> > FieldOffsetRelationForBaseType;

  void generateFieldOffsetRelation();
  void generateFieldInTypeRelation();
  void generateOverlapsWithEpsilonRelation();
  void generateSafeCastRelation();
  void mergeOffsetRelationsFor(llvm::StructType *ST);

public:
  FieldFactGenerator(Database *TheDB, const llvm::DataLayout *TheDL)
    : DB(TheDB), DL(TheDL) {}

  ~FieldFactGenerator();

  void processModule(llvm::Module &M);

  // Given a type, return the sequence of offsets that are the canonical way
  // to access the fields of that type, in order.
  void getFieldsInOrder(llvm::Type *T, std::vector<Field *> &FVect);

  // Get the epsilon field (field at the start of a structure).
  Field *getEpsilonField();

  // Get the field for a scalar object.
  Field *getScalarField();

  // Get the field for a collapsed object.
  Field *getCollapseField();

  // Get the offset for the specified GEP.
  std::string *getOffset(llvm::Type *Base, std::vector<llvm::Value *> &GEPSequence);
  std::string *getOffset(llvm::GetElementPtrInst &GEP);
};

}

#endif
