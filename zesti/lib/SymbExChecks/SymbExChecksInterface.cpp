#include "symbexchecks/SymbExChecksInterface.h"
#include "llvm/PassSupport.h"

using namespace llvm;

namespace symbexchecks {

char SymbExChecksInterface::ID;
static RegisterAnalysisGroup<SymbExChecksInterface>
  A("Symbolic Execution Pointer/Alias Analysis Checks Interface");

const PointerCollector::PointerSet &
SymbExChecksInterface::getPointerSetForFunction(const llvm::Function *F) {
  return Collector.Pointers[F]; 
}

const PointerCollector::PointerSet &
SymbExChecksInterface::getGlobalPointerSet() {
  return Collector.GlobalPointers; 
}

}
