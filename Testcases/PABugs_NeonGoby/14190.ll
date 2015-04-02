; ModuleID = 'test-fp.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

;DataStructureAA misses the alias between %call2 and %1 in function @print. Interestingly, it does report %add.ptr and %base alias in function @foo, but this local information in @foo doesn't seem to be propagated to function @print.`
;http://llvm.org/bugs/show_bug.cgi?id=14190

define i8* @foo(i8* %base, i32 %offset) nounwind uwtable readnone {
entry:
  %idx.ext = sext i32 %offset to i64
  %add.ptr = getelementptr inbounds i8* %base, i64 %idx.ext
  ret i8* %add.ptr
}

define void @print(i8* (i8*, i32)** nocapture %target_loc, i8** nocapture %argv) nounwind uwtable noinline {
entry:
  %0 = load i8* (i8*, i32)** %target_loc, align 8, !tbaa !0
  %1 = load i8** %argv, align 8, !tbaa !0
  %arrayidx1 = getelementptr inbounds i8** %argv, i64 1
  %2 = load i8** %arrayidx1, align 8, !tbaa !0
  %call.i = tail call i64 @strtol(i8* nocapture %2, i8** null, i32 10) nounwind
  %conv.i = trunc i64 %call.i to i32
  %call2 = tail call i8* %0(i8* %1, i32 %conv.i) nounwind
  %puts = tail call i32 @puts(i8* %call2)
  ret void
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %local = alloca i8* (i8*, i32)*, align 8
  store i8* (i8*, i32)* @foo, i8* (i8*, i32)** %local, align 8, !tbaa !0
  call void @print(i8* (i8*, i32)** %local, i8** %argv)
  ret i32 0
}

declare i64 @strtol(i8*, i8** nocapture, i32) nounwind

declare i32 @puts(i8* nocapture) nounwind

!0 = metadata !{metadata !"any pointer", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA"}
