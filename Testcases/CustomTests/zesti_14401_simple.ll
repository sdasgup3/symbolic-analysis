; ModuleID = 'zesti_14401_simple.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.S = type { i32, i32 }

@data = global [2 x %struct.S] [%struct.S { i32 1, i32 2 }, %struct.S { i32 3, i32 4 }], align 16
@.str = private unnamed_addr constant [2 x i8] c"X\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %i = alloca i32, align 4
  %x = alloca i32, align 4
  %S = alloca i32, align 4
  %z = alloca %struct.S*, align 8
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  store i32 0, i32* %x, align 4
  %0 = bitcast i32* %x to i8*
  call void @klee_make_symbolic(i8* %0, i64 4, i8* getelementptr inbounds ([2 x i8]* @.str, i32 0, i32 0))
  %1 = load i32* %x, align 4
  %cmp = icmp sge i32 %1, 0
  br i1 %cmp, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %entry
  %2 = load i32* %x, align 4
  %cmp1 = icmp sle i32 %2, 1
  br label %land.end

land.end:                                         ; preds = %land.rhs, %entry
  %3 = phi i1 [ false, %entry ], [ %cmp1, %land.rhs ]
  %land.ext = zext i1 %3 to i32
  %conv = sext i32 %land.ext to i64
  call void @klee_assume(i64 %conv)
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %land.end
  %4 = load i32* %i, align 4
  %cmp2 = icmp slt i32 %4, 1
  br i1 %cmp2, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %5 = load i32* %x, align 4
  %inc = add nsw i32 %5, 1
  store i32 %inc, i32* %x, align 4
  %idxprom = sext i32 %5 to i64
  %arrayidx = getelementptr inbounds [2 x %struct.S]* @data, i32 0, i64 %idxprom
  store %struct.S* %arrayidx, %struct.S** %z, align 8
  %6 = load %struct.S** %z, align 8
  %x4 = getelementptr inbounds %struct.S* %6, i32 0, i32 0 ; shows buggy behaviour if klee_assume is not used on %x, otherwise it will make the index symbolic
                                                           ; which may lead to x4 pointing to many spurious objects
  %7 = load i32* %x4, align 4
  store i32 %7, i32* %S, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %8 = load i32* %i, align 4
  %inc5 = add nsw i32 %8, 1
  store i32 %inc5, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret i32 0
}

declare void @klee_make_symbolic(i8*, i64, i8*) #1

declare void @klee_assume(i64) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)"}
