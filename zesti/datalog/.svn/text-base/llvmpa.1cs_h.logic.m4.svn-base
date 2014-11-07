/* *
 * *     CONTEXT SENSITIVITY SPECIFICS
 * */

// Context Macros for simple 1cs+h context sensitive analysis
changequote({,})

define({Context}, {$1_cntx})
define({AnyContext}, {_})
define({ContextType}, {Callsite($1_cntx)})

define({Object}, {$1})
define({AnyObject}, {_})
define({ObjectType}, {Allocsite($1)})

define({Record}, {$1})
define({Merge}, {$1})
define({AllocsiteOf}, {$1})


/* *
 * *     DECLARATIONS
 * */

include({llvmpa.decl.logic})


/* *
 * *     RULES
 * */

include({llvmpa.rules.logic})


/* *
 * *     OUTPUT
 * */

/*
 * Output relation signatures for simple 1cs+h context sensitive analysis
 */
PointsToOut(ptr, obj, fld) -> Pointer(ptr), Allocsite(obj), Field(fld).

ObjPointsToOut(obj1, fld1, obj2, fld2) ->
  Allocsite(obj1), Field(fld1), Allocsite(obj2), Field(fld2).

CollapsedOut(obj) -> Allocsite(obj).

ObjEscapesOut(obj) -> Allocsite(obj).

PointsToExternalOut(ptr) -> Pointer(ptr).

ObjPointsToExternalOut(obj, fld) -> Allocsite(obj), Field(fld).

/*
 * Output relation implementation for simple 1cs+h context sensitive analysis
 */
PointsToOut(ptr, obj, fld) <-
  UsefulPointsTo(obj, fld, ptr, _).

PointsToOut(fptr, noaddrfunc, epsilon) <-
  EpsilonField(epsilon),
  NoAddressFunctionDefinition(fptr, noaddrfunc).

ObjPointsToOut(obj1, fld1, obj2, fld2) <-
  UsefulObjPointsTo(obj1, fld1, obj2, fld2).

CollapsedOut(obj) <-
  Collapsed(obj).

ObjEscapesOut(obj) <-
  ObjEscapes(obj).

PointsToExternalOut(ptr) <-
  PointsToExternal(ptr, _).

ObjPointsToExternalOut(obj, fld) <-
  ObjPointsToExternal(obj, fld).

