#include "checker/interface/AliasAnalysisCheckerInterface.h"
#include "llvm/PassSupport.h"

using namespace llvm;

namespace aachecker {

char AliasAnalysisCheckerInterface::ID;
static RegisterAnalysisGroup<AliasAnalysisCheckerInterface>
  A("Alias Analysis Checker Interface");

}
