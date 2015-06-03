; ModuleID = 'test.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

;http://llvm.org/bugs/show_bug.cgi?id=14179
;DataStructureAA reports %ptr_1 and %ptr_2 don't alias, but they are both derived from %argv.

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable readnone {
entry:
  %int_1 = ptrtoint i8** %argv to i64
  %int_2 = ptrtoint i8** %argv to i64
  %ptr_1 = inttoptr i64 %int_1 to i8*
  %ptr_2 = inttoptr i64 %int_2 to i8*
  %0 = load i8* %ptr_1, align 4
  %1 = load i8* %ptr_2, align 4
  ; %ptr_1 = bitcast i8** %argv to i8*
  ; %ptr_2 = bitcast i8** %argv to i8*
  call void @foo(i8* %ptr_1, i8* %ptr_2)
  call void @foo(i8* %ptr_1, i8* %ptr_2)
  ret i32 0
}

declare void @foo(i8* %a, i8* %b) nounwind
