#include "output/LLVMPAOut.h"
#include <iostream>
#include <fstream>
#include <sstream>

using namespace llvm;
using std::cerr;
using std::ios_base;
using std::ofstream;
using std::set;
using std::string;
using std::stringstream;

namespace llvmpa {

//
// Output all domains into their respective files.
//
void LLVMPAOut::outputDomainInfo() {
  //
  // Open the output file in append mode.
  //
  stringstream LogicBloxDataFileNameStream;
  LogicBloxDataFileNameStream << OutputDir << "/" << "llvmpa.data.logic";
  string TheLogicBloxDataFileName = LogicBloxDataFileNameStream.str();
  ofstream LogicBloxDataFile;
  LogicBloxDataFile.open(TheLogicBloxDataFileName.c_str(), ios_base::app);

  DomainMap &DM = *DMap;

  for (unsigned DomainNum = 0; getNameOfDomain(DomainNum); DomainNum++) {
    Domain DomainName = getNameOfDomain(DomainNum);
    const unsigned DomainSize = DM.getSizeOfDomain(DomainName);

    //
    // Add entries to the data file.
    //
    for (unsigned ValIndex = 0; ValIndex < DomainSize; ++ValIndex) {
      LogicBloxDataFile << "+" << DomainName << "(";

      DomainKind DNKind = getKindForDomain(DomainName);
      const Atom &TheAtom = DM.getItem(DomainName, ValIndex);
      if (DNKind == LLVM_VALUE) {
        Value *TheValue = TheAtom.LLVMValue;
        LogicBloxDataFile << (uint64_t) TheValue;
      }
      else if (DNKind == LLVM_TYPE) {
        Type *TheType = TheAtom.LLVMType;
        LogicBloxDataFile << (uint64_t) TheType;
      }
      else if (DNKind == INTEGER) {
        int TheInt = TheAtom.IntValue;
        LogicBloxDataFile << TheInt;
      }
      else if (DNKind == FIELD) {
        Field *TheField = TheAtom.FieldValue;
        LogicBloxDataFile << (uint64_t) TheField;
      }
      else if (DNKind == STRING) {
        string *TheString = TheAtom.StringValue;
        LogicBloxDataFile << (uint64_t) TheString;
      }
      else {
        cerr <<
          "Encountered domain of uknown kind, can't print into map file!\n";
      }

      LogicBloxDataFile << ").\n";
    }
  }

  LogicBloxDataFile.close();
}

//
// Output all relations into respective files.
//
void LLVMPAOut::outputRelationInfo() {
  //
  // Open the output file in append mode.
  //
  stringstream LogicBloxDataFileNameStream;
  LogicBloxDataFileNameStream << OutputDir << "/" << "llvmpa.data.logic";
  string TheLogicBloxDataFileName = LogicBloxDataFileNameStream.str();
  ofstream LogicBloxDataFile;
  LogicBloxDataFile.open(TheLogicBloxDataFileName.c_str(), ios_base::app);

  for (unsigned RelationIndex = 0;
       getNameOfRelation(RelationIndex);
       ++RelationIndex) {
    Relation TheRelation = getNameOfRelation(RelationIndex);
    unsigned Arity = arity(TheRelation);

    //
    // Add all entries for the relation that were computed.
    //
    const set<AtomTuple> &Entries = DB->getEntriesForRelation(TheRelation);
    set<AtomTuple>::const_iterator I = Entries.begin(), IE = Entries.end();
    for (; I != IE; ++I) {
      LogicBloxDataFile << "+" << TheRelation << "(";

      const AtomTuple &Tuple = *I;
      for (unsigned J = 0; J < Arity; ++J) {
        Domain D = getDomainAtIndex(TheRelation, J);
        DomainKind DNKind = getKindForDomain(D);
        const Atom &TheAtom = Tuple[J];
        if (DNKind == LLVM_VALUE) {
          Value *TheValue = TheAtom.LLVMValue;
          LogicBloxDataFile << (uintptr_t) TheValue;
        }
        else if (DNKind == LLVM_TYPE) {
          Type *TheType = TheAtom.LLVMType;
          LogicBloxDataFile << (uintptr_t) TheType;
        }
        else if (DNKind == INTEGER) {
          int TheInt = TheAtom.IntValue;
          LogicBloxDataFile << TheInt;
        }
        else if (DNKind == FIELD) {
          Field *TheField = TheAtom.FieldValue;
          LogicBloxDataFile << (uintptr_t) TheField;
        }
        else if (DNKind == STRING) {
          string *TheString = TheAtom.StringValue;
          LogicBloxDataFile << (uint64_t) TheString;
        }
        else {
          cerr <<
            "Encountered domain of uknown kind, can't print into map file!\n";
        }

        LogicBloxDataFile << ((J != Tuple.size() - 1) ? "," : ").\n");
      }
    }
  }

  LogicBloxDataFile.close();
}

//
// Process with the output of facts.
//
void LLVMPAOut::doOutput() {
  outputDomainInfo();
  outputRelationInfo();
}

}
