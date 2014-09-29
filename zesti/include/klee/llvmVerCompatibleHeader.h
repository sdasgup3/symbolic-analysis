#if LLVM_VERSION_CODE >= LLVM_VERSION(3, 4)
  #include "llvm/IR/Constants.h"
  #include "llvm/IR/DerivedTypes.h"
  #include "llvm/IR/User.h"
  #include "llvm/IR/Function.h"
  #include "llvm/IR/Attributes.h"
  #include "llvm/IR/BasicBlock.h"
  #include "llvm/IR/InstrTypes.h"
  #include "llvm/IR/Instruction.h"
  #include "llvm/IR/Instructions.h"
  #include "llvm/IR/IntrinsicInst.h"
  #include "llvm/IR/LLVMContext.h"
  #include "llvm/IR/InlineAsm.h"
  #include "llvm/IR/Module.h"
  #include "llvm/IR/Type.h"
  #include "llvm/IR/IRBuilder.h"
  #include "llvm/Bitcode/ReaderWriter.h"
  #include "llvm/IR/ValueSymbolTable.h"
  #include "llvm/Object/Archive.h"
  #include "llvm/Object/ObjectFile.h"
  #include "llvm/Object/Error.h"
  #include "llvm/Support/FileSystem.h"
  #include "llvm/Support/SourceMgr.h"
  #include "llvm/Support/DataStream.h"
  #include "llvm/IR/TypeBuilder.h"
#else
  #include "llvm/Constants.h"
  #include "llvm/DerivedTypes.h"
  #include "llvm/User.h"
  #include "llvm/Function.h"
  #include "llvm/Attributes.h"
  #include "llvm/BasicBlock.h"
  #include "llvm/InstrTypes.h"
  #include "llvm/Instruction.h"
  #include "llvm/Instructions.h"
  #include "llvm/IntrinsicInst.h"
  #if LLVM_VERSION_CODE >= LLVM_VERSION(2, 7)
    #include "llvm/LLVMContext.h"
  #endif
  #include "llvm/InlineAsm.h"
  #include "llvm/Module.h"
  #include "llvm/Type.h"
  #include "llvm/Support/IRBuilder.h"
  #include "llvm/ValueSymbolTable.h"
  #include "llvm/Support/TypeBuilder.h"
#endif

#if LLVM_VERSION_CODE <= LLVM_VERSION(3, 1)
  #include "llvm/Target/TargetData.h"
#else
  #if LLVM_VERSION_CODE >= LLVM_VERSION(3, 4)
    #include "llvm/IR/DataLayout.h"
  #else
    #include "llvm/DataLayout.h"
  #endif
#endif

#if LLVM_VERSION_CODE >= LLVM_VERSION(2, 7)
  #if LLVM_VERSION_CODE == LLVM_VERSION(3, 4)
    #include "llvm/DebugInfo.h"
  #else
    #include "llvm/Analysis/DebugInfo.h"
  #endif
#endif

