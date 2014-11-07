#include "facts/FieldFactGenerator.h"
#include "llvm/IR/Constants.h"
#include "llvm/IR/TypeFinder.h"
#include <sstream>

using namespace llvm;
using std::map;
using std::set;
using std::string;
using std::stringstream;
using std::pair;
using std::vector;

namespace llvmpa {

//
// Destructor...
//
FieldFactGenerator::~FieldFactGenerator() {
  map<Field, Field *>::iterator AFIt = AllFields.begin();
  map<Field, Field *>::iterator AFItEnd = AllFields.end();
  for (; AFIt != AFItEnd; ++AFIt)
    delete AFIt->second;

  map<string, string *>::iterator AOIt = AllOffsets.begin();
  map<string, string *>::iterator AOItEnd = AllOffsets.end();
  for (; AOIt != AOItEnd; ++AOIt)
    delete AOIt->second;
}

void FieldFactGenerator::processModule(Module &M) {
  //
  // Get the void pointer type and void type.
  //
  VoidTy = Type::getVoidTy(M.getContext());

  //
  // Register epsilon field, scalar field, collapsed field.
  //
  Field Epsilon(Field::EPSILON);
  registerField(Epsilon);
  Field *EpsilonH = getFieldHandle(Epsilon);
  DB->add("EpsilonField", EpsilonH);


  Field Collapse(Field::COLLAPSED);
  registerField(Collapse);
  Field *CollapseH = getFieldHandle(Collapse);
  DB->add("CollapseField", CollapseH);

  FieldPath EmptyPath;
  Field Scalar(VoidTy, VoidTy, EmptyPath);
  registerField(Scalar);
  Field *ScalarH = getFieldHandle(Scalar);

  //
  // Compute the FieldOffset relation and FieldInType relation for the scalar
  // object.
  //
  string EmptyOffset = buildCanonicalOffsetString(EmptyPath);
  string ScalarOffset = buildAnnotatedOffsetString(VoidTy, EmptyOffset);
  registerOffset(ScalarOffset);

  string *ScalarOffsetH = getOffsetHandle(ScalarOffset);

  DB->add("FieldOffset", EpsilonH, ScalarOffsetH, ScalarH);
  DB->add("FieldOffset", ScalarH, ScalarOffsetH, ScalarH);

  DB->add("FieldInType", ScalarH, VoidTy);

  //
  // Get the set of struct types in this module.
  //
  TypeFinder TF;
  TF.run(M, false);

  //
  // Compute field information for all structs in the program.
  //
  vector<StructType *>::iterator SIT = TF.begin(), SIE = TF.end();
  for (; SIT != SIE; ++SIT) {
    addFieldsForStruct(*SIT);
    //computeCanonicalOffsets(*SIT);
  }


  //
  // Compute the FieldOffset relation.
  //
  generateFieldOffsetRelation();

  //
  // Compute the FieldInType relation.
  //
  generateFieldInTypeRelation();

  //
  // Compute the OverlapsWithEpsilon relation.
  //
  //generateOverlapsWithEpsilonRelation();

  //
  // Compute the SafeCast relation.
  //
  generateSafeCastRelation();
}

//////////////////////////////////////////////////////////////////////////////
// OFFSET FETCHING ///////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////

//
// Get the fields to the elements of this type in the order that the offsets
// appear in memory.
//
void FieldFactGenerator::getFieldsInOrder(Type *T, vector<Field *> &OV) {

  //
  // Ignore arrays.
  //
  while (isa<ArrayType>(T))
    T = cast<ArrayType>(T)->getElementType();

  //
  // If it's a struct type, we have already precomputed the fields and their
  // order.
  //
  if (isa<StructType>(T)) {
    vector<Field> &Fields = StructFields[cast<StructType>(T)];
    for (unsigned Index = 0; Index < Fields.size(); ++Index) {
      Field &F = Fields[Index];
      OV.push_back(getFieldHandle(F));
    }

  }

  //
  // If it's a scalar type, then add the scalar field.
  //
  else
    OV.push_back(getScalarField());

}

//////////////////////////////////////////////////////////////////////////////
// FIELD AND OFFSET HANDLES //////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////

void FieldFactGenerator::registerField(const Field &F) {
  if (AllFields.find(F) == AllFields.end())
    AllFields[F] = new Field(F);
}

void FieldFactGenerator::registerOffset(const string &Offset) {
  if (AllOffsets.find(Offset) == AllOffsets.end())
    AllOffsets[Offset] = new string(Offset);
}

Field *FieldFactGenerator::getFieldHandle(const Field &F) {
  if (AllFields.find(F) == AllFields.end()) {
    errs() << "couldn't find field!\n";
    F.print();
    exit(1);
  }
  return AllFields[F];
}

string *FieldFactGenerator::getOffsetHandle(const string &Offset) {
  if (AllOffsets.find(Offset) == AllOffsets.end()) {
    errs() << "couldn't find offset: " << Offset << "\n";
    exit(1);
  }
  return AllOffsets[Offset];
}

//////////////////////////////////////////////////////////////////////////////
// GEP INSTRUCTIONS //////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////


string *FieldFactGenerator::getOffset(GetElementPtrInst &GEP) {
  Type *BaseType = GEP.getOperand(0)->getType();
  vector<Value *> Params;

  for (unsigned Index = 1; Index < GEP.getNumOperands(); ++Index)
    Params.push_back(GEP.getOperand(Index));

  return getOffset(BaseType, Params);
}

string *FieldFactGenerator::getOffset(Type *BaseType, vector<Value *> &Seq) {
  string AnnotatedString = buildAnnotatedOffsetString(BaseType, Seq);
  return getOffsetHandle(AnnotatedString);
}

//
// Given a GEP instruction, return a string representing the offset computed
// by the GEP.
//
string
FieldFactGenerator::buildAnnotatedOffsetString(
  Type *Base, vector<Value *> &GEPSequence
) {

  PointerType *OperandType = dyn_cast<PointerType>(Base);

  if (OperandType == 0) {
    errs() << "WTF?\n";
    exit(1);
  }

  Type *OffsetHeadType = OperandType->getElementType();
  CompositeType *CurrTypeAtIndex = dyn_cast<CompositeType>(OffsetHeadType);

  FieldPath OffsetVector;

  // Get the first non-array type in the offset, this is the base type for our
  // purposes....
  Type *BaseType = OffsetHeadType;
  while (isa<ArrayType>(BaseType))
    BaseType = cast<ArrayType>(BaseType)->getElementType();

  //
  // If this isn't an index from a composite type, then it is an index from a
  // scalar type. We treat all scalar types as void.
  //
  if (!isa<StructType>(BaseType))
    BaseType = VoidTy;

  for (unsigned Index = 1; Index < GEPSequence.size(); ++Index) {
    ConstantInt *IntValue = dyn_cast<ConstantInt>(GEPSequence[Index]);
    unsigned GEPIndexVal =
      (IntValue == 0) ? 0 : (unsigned) IntValue->getLimitedValue();

    if (isa<StructType>(CurrTypeAtIndex)) {
      OffsetVector.push_back(PathItem(GEPIndexVal));
    }
    else {
      OffsetVector.push_back(PathItem());
    }

    CurrTypeAtIndex =
      dyn_cast<CompositeType>(CurrTypeAtIndex->getTypeAtIndex(GEPIndexVal));
  }

  string CanonicalString = buildCanonicalOffsetString(OffsetVector);
  return buildAnnotatedOffsetString(BaseType, CanonicalString);
}


//////////////////////////////////////////////////////////////////////////////
// FIELDS ////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////


//
// Get the field representing epsilon, the start of an object.
//
Field *FieldFactGenerator::getEpsilonField() {
  Field Epsilon(Field::EPSILON);
  return getFieldHandle(Epsilon);
}

//
// Get the field representing a non-struct object.
//
Field *FieldFactGenerator::getScalarField() {
  FieldPath EmptyPath;
  Field Scalar(VoidTy, VoidTy, EmptyPath);
  return getFieldHandle(Scalar);
}

//
// Get the field representing a collapsed object.
//
Field *FieldFactGenerator::getCollapseField() {
  Field Collapsed(Field::COLLAPSED);
  return getFieldHandle(Collapsed);
}


//////////////////////////////////////////////////////////////////////////////
// OFFSETS ///////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////

//
// Build an "annotated" offset string. This consists of a sequence of indices
// plus a starting type, and corresponds to an element in the OFFSET relation.
//
string
FieldFactGenerator::buildAnnotatedOffsetString(
  Type *Base, const string &Path
) {
  stringstream Stream;
  Stream << (void *) Base << ":" << Path;
  string Result = Stream.str();
  registerOffset(Result);
  return Result;
}

//
// Given an offset vector, return a string representing the given offset.
//
string
FieldFactGenerator::buildCanonicalOffsetString(const FieldPath &Offsets) {
  stringstream result;
  for (unsigned Index = 0; Index < Offsets.size(); ++Index) {
    if (Offsets[Index].IndexKind == PathItem::ARRAY_INDEX)
      continue;
    result << "." << Offsets[Index].Offset;
  }
  return result.str();
}

//////////////////////////////////////////////////////////////////////////////
// RELATION BUILDERS /////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////

//
// Tell if we have an array or struct type.
//
static inline bool isArrayOrStruct(Type *T) {
  return T && (isa<StructType>(T) || isa<ArrayType>(T));
}

//
// Add the FieldsOverlap relation to the database, which tells us which
// fields overlap with the epsilon field.
//
void FieldFactGenerator::generateOverlapsWithEpsilonRelation() {

  //
  // The scalar field overlaps with epsilon, and so does the collapse field.
  //
  Field *Epsilon = getEpsilonField();
  Field *Scalar = getScalarField();
  Field *Collapse = getCollapseField();

  DB->add("OverlapsWithEpsilon", Epsilon);
  DB->add("OverlapsWithEpsilon", Scalar);
  DB->add("OverlapsWithEpsilon", Collapse);
  
  //
  // Each starting field of a structure may overlap with epsilon.
  //
  map<StructType *, vector<Field> >::iterator SFIt, SFItEnd;
  SFIt = StructFields.begin();
  SFItEnd = StructFields.end();

  for (; SFIt != SFItEnd; ++SFIt) {
    if ((SFIt->second).size() == 0)
      continue;
    Field &Start = (SFIt->second)[0];
    Field *StartHandle = getFieldHandle(Start);
    DB->add("OverlapsWithEpsilon", StartHandle);
  }

  return;
}

//
// Add the SafeCast relation to the database, which tells us which
// fields of different struct types overlap. For example the fields
// a, x1 of struct type s1 overlap with the fields c, x2 of struct
// type s2:
//   struct s1 { int a; int x1; int b; };
//   struct s2 { int c; int x2; };
//
// Note that the first field of every object overlaps with the epsilon field.
// Also, the epsilon field ovelaps with itself, with the scalar field, and with
// the collapse field.
//
void FieldFactGenerator::generateSafeCastRelation() {
  Field *EpsilonHandle = getEpsilonField();
  Field *ScalarHandle = getScalarField();
  Field *CollapseHandle = getCollapseField();

  // Add overlaps between epsilon, scalar, and collapse fields
  DB->add("SafeCast", EpsilonHandle, EpsilonHandle);
  DB->add("SafeCast", EpsilonHandle, CollapseHandle);
  DB->add("SafeCast", CollapseHandle, EpsilonHandle);
  DB->add("SafeCast", EpsilonHandle, ScalarHandle);
  DB->add("SafeCast", ScalarHandle, EpsilonHandle);

  set<StructType *>::iterator AllStructsIt1 = AllStructTypes.begin();
  set<StructType *>::iterator AllStructsItEnd1 = AllStructTypes.end();
  for (; AllStructsIt1 != AllStructsItEnd1; ++AllStructsIt1) {
    StructType *ST1 = *AllStructsIt1;

    if (StructFields[ST1].size() == 0)
      continue;

    // For every struct, add overlap between the epsilon field and the struct's
    // first field
    Field &Start = StructFields[ST1][0];
    Field *StartHandle = getFieldHandle(Start);
    DB->add("SafeCast", StartHandle, EpsilonHandle);
    DB->add("SafeCast", EpsilonHandle, StartHandle);

    set<StructType *>::iterator AllStructsIt2 = AllStructTypes.begin();
    set<StructType *>::iterator AllStructsItEnd2 = AllStructTypes.end();
    for (; AllStructsIt2 != AllStructsItEnd2; ++AllStructsIt2) {
      if (AllStructsIt1 == AllStructsIt2)
        continue;

      StructType *ST2 = *AllStructsIt2;

      if (StructFields[ST2].size() == 0)
        continue;

      // For every other struct, add appropriate overlaps between the two
      // structs' fields
      vector<pair<Field, Field> > overlapFields;
      getOverlappingFields(ST1, ST2, overlapFields);

      for (unsigned I = 0; I < overlapFields.size(); ++I) {
        Field &Field1 = overlapFields[I].first;
        Field &Field2 = overlapFields[I].second;
        Field *FieldHandle1 = getFieldHandle(Field1);
        Field *FieldHandle2 = getFieldHandle(Field2);
        DB->add("SafeCast", FieldHandle1, FieldHandle2);
        DB->add("SafeCast", FieldHandle2, FieldHandle1);
      }
    }
  }

  return;
}

//
// Add the FieldInType relation to the database, which maps fields to their
// corresponding types.
//
void FieldFactGenerator::generateFieldInTypeRelation() {
  map<Field, Field *>::iterator AllFieldsIt, AllFieldsItEnd;

  AllFieldsIt = AllFields.begin();
  AllFieldsItEnd = AllFields.end();
  for (; AllFieldsIt != AllFieldsItEnd; ++AllFieldsIt) {
    const Field &F = *AllFieldsIt->second;

    //
    // Ignore the epsilon/collapsed fields, they don't have a 'type' for
    // our purposes.
    //
    if (F.Flag != Field::NORMAL)
      continue;

    DB->add("FieldInType", &F, F.BaseType);
  }
}


//
// Go over the computed offset information and generate the FIELDOFFSET
// relation tuples from them.
//
void FieldFactGenerator::generateFieldOffsetRelation() {
  //
  // First, find all valid offsets that we could get by indexing from the
  // epsilon field (the start of an object).
  //
  Field Epsilon(Field::EPSILON);

  set<StructType *>::iterator AllStructsIt = AllStructTypes.begin();
  set<StructType *>::iterator AllStructsItEnd = AllStructTypes.end();

  //
  // Compute, for each struct, the valid index computations that go from the
  // field at the start of the struct into the fields of the struct.
  //
  for (; AllStructsIt != AllStructsItEnd; ++AllStructsIt) {
    StructType *BaseType = *AllStructsIt;

    if (StructFields[BaseType].size() == 0)
      continue;

    Field &StartField = StructFields[BaseType][0];

    //
    // Each field of the structure has a set of offsets that may index it,
    // and these offsets essentially differ by their suffixes: trailing zeros
    // are irrelevant for GEP indices. We compute all variants of all offsets
    // that may index into this structure.
    //

    vector<Field> &TheFields = StructFields[BaseType];
    vector<Field>::iterator FieldsIt = TheFields.begin();
    vector<Field>::iterator FieldsEnd = TheFields.end();

    for (; FieldsIt != FieldsEnd; ++FieldsIt) {
      const Field &CurrField = *FieldsIt;

      //
      // Record if the field is inside an array.
      //
      bool IsInsideArray = false;

      //
      // Compute all aggregates that this field is the head of. The set
      // contains every index of the path to the field which is an aggregate
      // type.
      //
      set<unsigned> EnclosingAggregates;
      CompositeType *LastType = BaseType;
      const FieldPath &Path = CurrField.PathFromBase;

      for (unsigned Depth = 0; Depth < Path.size(); ++Depth) {
        //
        // Check if we are in an array at this stage in the descent.
        //
        bool AtArray = (Path[Depth].IndexKind != PathItem::NORMAL_INDEX);
        IsInsideArray = AtArray;

        EnclosingAggregates.insert(Depth);

        unsigned NewIndex = AtArray ? 0 : Path[Depth].Offset;

        LastType = dyn_cast<CompositeType>(LastType->getTypeAtIndex(NewIndex));

        if (NewIndex != 0)
          EnclosingAggregates.clear();

        //
        // If we've reached a primitive field, don't go further.
        //
        if (!isArrayOrStruct(LastType))
          break;
      }

      //
      // For fields that are inside arrays, we allow array arithmetic on them
      // under the assumption that it doesn't go out of bounds.
      //
      if (IsInsideArray) {
        FieldOffsetTuple Tuple;
        FieldPath EmptyPath;
        string OffStrCanonical = buildCanonicalOffsetString(EmptyPath);
        string OffStr = buildAnnotatedOffsetString(VoidTy, OffStrCanonical);
        Tuple.Field1 = CurrField;
        Tuple.Offset = OffStr;
        Tuple.Field2 = CurrField;

        FieldOffsetRelationForBaseType[VoidTy].push_back(Tuple);
      }

      //
      // Add the complete index to the relation.
      //
      FieldOffsetTuple Tuple;

      string OffStr = buildCanonicalOffsetString(Path);

      Tuple.Field1 = StartField;
      Tuple.Offset = buildAnnotatedOffsetString(BaseType, OffStr);
      Tuple.Field2 = CurrField;

      FieldOffsetRelationForBaseType[BaseType].push_back(Tuple);

      Tuple.Field1 = Epsilon;

      FieldOffsetRelationForBaseType[0].push_back(Tuple);

      //
      // Add the partial indices to the relation.
      //

      set<unsigned>::iterator ParentIt, ParentItEnd;
      ParentIt = EnclosingAggregates.begin();
      ParentItEnd = EnclosingAggregates.end();
      
      //
      // For each aggregate that this field is the head of, we compute the
      // indexing path that we use to reach from the base to this field.
      //
      for (; ParentIt != ParentItEnd; ++ParentIt) {
        unsigned Depth = *ParentIt;
        FieldPath Prefix;

        for (unsigned Index = 0; Index < Depth; ++Index)
          Prefix.push_back(Path[Index]);

        string OffStr = buildCanonicalOffsetString(Prefix);

        FieldOffsetTuple Tuple;
        Tuple.Field1 = StartField;
        Tuple.Offset = buildAnnotatedOffsetString(BaseType, OffStr);
        Tuple.Field2 = CurrField;

        FieldOffsetRelationForBaseType[BaseType].push_back(Tuple);

        //
        // This is also an index that we use from epsilon.
        //
        Tuple.Field1 = Epsilon;
        FieldOffsetRelationForBaseType[0].push_back(Tuple);
      }
    }
  }

  //
  // Now merge all the computed offset information so that indexes can start
  // from an arbitrary position in a struct.
  //
  AllStructsIt = AllStructTypes.begin();
  AllStructsItEnd = AllStructTypes.end();
  for (; AllStructsIt != AllStructsItEnd; ++AllStructsIt)
    mergeOffsetRelationsFor(*AllStructsIt);

  //
  // Now insert the FieldOffset relation to the database.
  //
  map<Type *, vector<FieldOffsetTuple> >::iterator RelationIt;
  map<Type *, vector<FieldOffsetTuple> >::iterator RelationEnd;

  RelationIt = FieldOffsetRelationForBaseType.begin();
  RelationEnd = FieldOffsetRelationForBaseType.end();

  for (; RelationIt != RelationEnd; ++RelationIt) {
    vector<FieldOffsetTuple> &Tuples = RelationIt->second;
    for (unsigned Index = 0; Index < Tuples.size(); ++Index) {
      FieldOffsetTuple &Tuple = Tuples[Index];

      Field *Field1 = getFieldHandle(Tuple.Field1);
      string *Offset = getOffsetHandle(Tuple.Offset);
      Field *Field2 = getFieldHandle(Tuple.Field2);

      DB->add("FieldOffset", Field1, Offset, Field2);
    }
  }
}

//
// Given the computed indexing operations for the elements of a struct, create
// indexing operations that work relative to the larger struct.
//
void FieldFactGenerator::mergeOffsetRelationsFor(StructType *ST) {
  if (MergedTypes.find(ST) != MergedTypes.end())
    return;
  MergedTypes.insert(ST);

  unsigned Elements = ST->getNumElements();
  for (unsigned EltIndex = 0; EltIndex < Elements; ++EltIndex) {
    Type *EltType = ST->getElementType(EltIndex);
    FieldPath Prefix;
    Prefix.push_back(PathItem(EltIndex));

    while (isa<ArrayType>(EltType)) {
      Prefix.push_back(PathItem());
      EltType = cast<ArrayType>(EltType)->getElementType();
    }

    StructType *StructEltType = dyn_cast<StructType>(EltType);
    if (StructEltType == 0)
      continue;

    mergeOffsetRelationsFor(StructEltType);

    vector<FieldOffsetTuple> &Tuples =
      FieldOffsetRelationForBaseType[StructEltType];

    for (unsigned Index = 0; Index < Tuples.size(); ++Index) {
      //
      // Change this tuple to be relative to ST's elements.
      //
      FieldOffsetTuple Tuple = Tuples[Index];

      Tuple.Field1.BaseType = ST;
      Tuple.Field1.addPathPrefix(Prefix);

      Tuple.Field2.BaseType = ST;
      Tuple.Field2.addPathPrefix(Prefix);

      FieldOffsetRelationForBaseType[ST].push_back(Tuple);
    }
  }
}

//////////////////////////////////////////////////////////////////////////////
// FIELD AND OFFSET COMPUTATION //////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////

//
// Check if a type is a C language primitive.
//
static inline bool isPrimitive(Type *T) {
  return T->isIntegerTy() || T->isPointerTy() || T->isFloatingPointTy();
}

//
// For a given struct type, compute all the fields that we distinguish in the
// structure.
//
void FieldFactGenerator::addFieldsForStruct(StructType *ST) {
  
  //
  // Check if the structure has already been analyzed.
  //
  if (AllStructTypes.find(ST) != AllStructTypes.end())
    return;

  AllStructTypes.insert(ST);

  unsigned Elements = ST->getNumElements();

  //
  // For each structure element, determine how to split it into fields.
  //
  for (unsigned EltIndex = 0; EltIndex < Elements; ++EltIndex) {
    Type *ElementType = ST->getElementType(EltIndex);

    //
    // Primitive types get their own field. 
    //
    if (isPrimitive(ElementType)) {
      FieldPath Offset(1);
      Offset[0] = PathItem((int) EltIndex);

      Field ElementField(ST, ElementType, Offset);

      StructFields[ST].push_back(ElementField);
      registerField(ElementField);

    }

    //
    // Struct types get recursively traversed for fields.
    //
    else if (ElementType->isStructTy()) {
      StructType *STElementType = cast<StructType>(ElementType);
      FieldPath Offset(1);
      Offset[0] = PathItem(EltIndex);
      embedFieldsInStruct(ST, STElementType, Offset);
    }

    //
    // Array types are handled by treating the whole array as a single
    // element.
    //
    else if (ElementType->isArrayTy()) {
      FieldPath OffsetPrefix;
      Type *CurrentType = ElementType;

      OffsetPrefix.push_back(PathItem((int) EltIndex));

      //
      // Descend the array type until we find a non-array element type.
      //
      while (isa<ArrayType>(CurrentType)) {
        OffsetPrefix.push_back(PathItem());
        CurrentType = cast<ArrayType>(CurrentType)->getElementType();
      }
      Type *ArrayElementType = CurrentType;

      //
      // If the array element type is a struct, get the fields of the struct.
      //
      if (ArrayElementType->isStructTy()) {
        StructType *InnerStructType = cast<StructType>(ArrayElementType);
        embedFieldsInStruct(ST, InnerStructType, OffsetPrefix);
      }

      //
      // If it's a primitive item, make the field primitive.
      //
      else if (isPrimitive(ArrayElementType)) {
        FieldPath Offset = OffsetPrefix;
        //FIXME: Next line might not be necessary
        //Offset.push_back(PathItem((int) EltIndex));

        Field ElementField(ST, ArrayElementType, Offset);

        StructFields[ST].push_back(ElementField);

        registerField(ElementField);
      }

      //
      // Otherwise report a warning.
      //
      else {
        errs() << "Warning: unknown array element type inside array: ";
        ArrayElementType->dump();
        errs() << "Will ignore this type, but probably not safe to do so!\n";
      }
    }

    //
    // Warn about unknown types.
    //
    else {
      errs() <<
        "Warning: encountering unknown structure element inside the struct: ";
      ST->dump();
      errs() << "(The field in question is at index " << EltIndex << ")\n";
      errs() << "Will ignore this type, but probably not safe to do so!\n";
    }
  }
}

//
// Called when a struct type has another struct inside it. Take the fields of
// the inner struct and create fields for the outer struct that essentially
// "embed" the inner struct inside the outer struct.
//
// Inputs
//  BaseType  - The outer struct type
//  InnerType - The inner struct type
//  Prefix    - The indexing path from the base to the start of this struct
//  Index     - The element number of the inner struct in the outer struct
//
//
void FieldFactGenerator::embedFieldsInStruct(
  StructType *BaseType, StructType *InnerType, FieldPath &Prefix
) {
  //
  // Compute the struct fields for the inner element if they haven't been
  // computed already.
  //
  addFieldsForStruct(InnerType);

  //
  // The fields of the element's structure type need to get embedded in
  // the fields of the structure type we are analyzing. We do this by
  // "prefixing" the field offsets to create new fields whose base type is
  // the type we are analyzing.
  //
  vector<Field> &InnerFields = StructFields[InnerType];

  vector<Field>::iterator FI = InnerFields.begin(), FIE = InnerFields.end();
  for (; FI != FIE; ++FI) {
    Field F = *FI;
    F.BaseType = BaseType;

    F.addPathPrefix(Prefix);

    StructFields[BaseType].push_back(F);

    registerField(F);
  }
}

//
// Collect overlapping fields of two structs
//
void FieldFactGenerator::getOverlappingFields(
  StructType *ST1, StructType *ST2, vector<pair<Field, Field> > &overlapFields
) {
  vector<Field> &Fields1 = StructFields[ST1];
  vector<Field> &Fields2 = StructFields[ST2];

  assert(Fields1.size() > 0 && Fields2.size() > 0);
  overlapFields.push_back(pair<Field, Field>(Fields1[0], Fields2[0]));

  for (unsigned I = 0; I < std::min(Fields1.size(), Fields2.size()) - 1; ++I) {
    Type *T1 = Fields1[I].FieldType;
    Type *T2 = Fields2[I].FieldType;

    if (DL->getTypeSizeInBits(T1) == DL->getTypeSizeInBits(T2))
      overlapFields.push_back(pair<Field, Field>(Fields1[I+1], Fields2[I+1]));
    else
      break;
  }
}

//
// Compute the offset string for every field of this structure.
//
void FieldFactGenerator::computeCanonicalOffsets(StructType *ST) {
  vector<Field> &Fields = StructFields[ST];

  vector<Field>::iterator FieldsIt = Fields.begin(), FieldsEnd = Fields.end();
  for (; FieldsIt != FieldsEnd; ++FieldsIt) {
    const Field &F = *FieldsIt;
    string OffStr = buildCanonicalOffsetString(F.PathFromBase);
    OffsetsForStruct[ST][F] = OffStr;
  }
}

}
