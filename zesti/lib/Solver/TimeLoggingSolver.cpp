//===-- PCLoggingSolver.cpp -----------------------------------------------===//
//
//                     The KLEE Symbolic Virtual Machine
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//

#include "klee/Solver.h"

#include "klee/Expr.h"
#include "klee/SolverImpl.h"
#include "klee/Internal/Support/QueryLog.h"
#include "klee/Internal/System/Time.h"

#include "llvm/Support/CommandLine.h"
#include "klee/Internal/Module/InstructionInfoTable.h"

#include <fstream>

using namespace klee;
using namespace llvm;
using namespace klee::util;

///
//hack to log only mem accesse
extern volatile int doLog;

class TimeLoggingSolver : public SolverImpl {
  Solver *solver;
  std::ofstream os;
  unsigned queryCount;
  double startTime;
  const InstructionInfoProvider* iip;

  void startQuery(const Query& query, const char *typeName,
                  const ref<Expr> *evalExprsBegin = 0,
                  const ref<Expr> *evalExprsEnd = 0,
                  const Array * const* evalArraysBegin = 0,
                  const Array * const* evalArraysEnd = 0) {

    startTime = getWallTime();
  }

  void finishQuery(bool success) {
    if (doLog) {
      double delta = getWallTime() - startTime;
      os << delta << "\n";
    }
  }
  
public:
  TimeLoggingSolver(Solver *_solver, std::string path, const InstructionInfoProvider* _iip) 
  : solver(_solver),
    os(path.c_str(), std::ios::trunc),
    queryCount(0),
    iip(_iip) {
      os.precision(2);
  }
  ~TimeLoggingSolver() {
    delete solver;
  }
  
  bool computeTruth(const Query& query, bool &isValid) {
    startQuery(query, "Truth");
    bool success = solver->impl->computeTruth(query, isValid);
    finishQuery(success);
    return success;
  }

  bool computeValidity(const Query& query, Solver::Validity &result) {
    startQuery(query, "Validity");
    bool success = solver->impl->computeValidity(query, result);
    finishQuery(success);
    return success;
  }

  bool computeValue(const Query& query, ref<Expr> &result) {
    startQuery(query.withFalse(), "Value", 
               &query.expr, &query.expr + 1);
    bool success = solver->impl->computeValue(query, result);
    finishQuery(success);
    return success;
  }

  bool computeInitialValues(const Query& query,
                            const std::vector<const Array*> &objects,
                            std::vector< std::vector<unsigned char> > &values,
                            bool &hasSolution) {
    if (objects.empty()) {
      startQuery(query, "InitialValues",
                 0, 0);
    } else {
      startQuery(query, "InitialValues",
                 0, 0,
                 &objects[0], &objects[0] + objects.size());
    }
    bool success = solver->impl->computeInitialValues(query, objects, 
                                                      values, hasSolution);
    finishQuery(success);
    return success;
  }

  SolverImpl::SolverRunStatus getOperationStatusCode() {
    return solver->impl->getOperationStatusCode();
  }
};

///
namespace klee {
  Solver *createTimeLoggingSolver(Solver *_solver, std::string path,  const InstructionInfoProvider* iip) {
    return new Solver(new TimeLoggingSolver(_solver, path, iip));
  }
}
