; ModuleID = 'dsaa-wa.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

;In function @func_22, the parameter %p_23 should alias %22, because @func_1 passes  %call = load i32*** @g_134 as argument %p_23 of @func_22, and %22 is also load i32*** @g_134. 
;http://llvm.org/bugs/show_bug.cgi?id=14496

%union.U0 = type { i64 }
%union.U1 = type { i64 }

@g_0 = internal global i32* null
@g_134 = internal global i32** getelementptr(i32** @g_0, i32 0), align 8

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %call = call i64 @func_1()
  ret i32 0
}


define internal i64 @func_1() nounwind uwtable {
entry:
  %call = load i32*** @g_134, align 8
  %call97 = call i32** @func_22(i32** %call)
   ret i64 0
}

define internal i32** @func_22(i32** %p_23)  {
entry:
  %p_23.addr = alloca i32**, align 8
  %0 = load i32** %p_23  
  %1 = load i32*** @g_134, align 8
  %2 = load i32** %1
  ret i32** null
}
