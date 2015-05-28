#include "symbexchecks/SymbExChecksInterface.h"
#include "llvm/PassSupport.h"

using namespace llvm;

namespace symbexchecks {

char SymbExChecksInterface::ID;
static RegisterAnalysisGroup<SymbExChecksInterface>
  A("Symbolic Execution Pointer/Alias Analysis Checks Interface");

}
