#ifndef _LLVMPAOUT_H
#define _LLVMPAOUT_H

#include "domains/DomainMap.h"

namespace llvmpa {

//
// This class outputs LLVMPA information into a directory.
//
class LLVMPAOut {
private:
  //
  // The name of the output directory
  //
  std::string OutputDir;

  //
  // Output all domain information.
  //
  void outputDomainInfo();

  //
  // Output all relation information.
  //
  void outputRelationInfo();

  DomainMap *DMap;
  Database *DB;
public:
  LLVMPAOut(const std::string &DirName, DomainMap *TheDM, Database *TheDB)
    : OutputDir(DirName), DMap(TheDM), DB(TheDB) {}

  //
  // Process with the output of facts.
  //
  void doOutput(void);
};

}

#endif
