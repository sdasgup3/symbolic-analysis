; ModuleID = '14147.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }

@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @sum(i32 %n, ...) #0 {
entry:
  %n.addr = alloca i32, align 4
  %vl = alloca [1 x %struct.__va_list_tag], align 16
  %i = alloca i32, align 4
  %result = alloca i32, align 4
  %value = alloca i32, align 4
  %value10 = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  store i32 0, i32* %result, align 4
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %vl, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4
  %1 = load i32* %n.addr, align 4
  %cmp = icmp slt i32 %0, %1
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %arraydecay2 = getelementptr inbounds [1 x %struct.__va_list_tag]* %vl, i32 0, i32 0
  %gp_offset_p = getelementptr inbounds %struct.__va_list_tag* %arraydecay2, i32 0, i32 0
  %gp_offset = load i32* %gp_offset_p
  %fits_in_gp = icmp ule i32 %gp_offset, 40
  br i1 %fits_in_gp, label %vaarg.in_reg, label %vaarg.in_mem

vaarg.in_reg:                                     ; preds = %for.body
  %2 = getelementptr inbounds %struct.__va_list_tag* %arraydecay2, i32 0, i32 3
  %reg_save_area = load i8** %2
  %3 = getelementptr i8* %reg_save_area, i32 %gp_offset
  %4 = bitcast i8* %3 to i32*
  %5 = add i32 %gp_offset, 8
  store i32 %5, i32* %gp_offset_p
  br label %vaarg.end

vaarg.in_mem:                                     ; preds = %for.body
  %overflow_arg_area_p = getelementptr inbounds %struct.__va_list_tag* %arraydecay2, i32 0, i32 2
  %overflow_arg_area = load i8** %overflow_arg_area_p
  %6 = bitcast i8* %overflow_arg_area to i32*
  %overflow_arg_area.next = getelementptr i8* %overflow_arg_area, i32 8
  store i8* %overflow_arg_area.next, i8** %overflow_arg_area_p
  br label %vaarg.end

vaarg.end:                                        ; preds = %vaarg.in_mem, %vaarg.in_reg
  %vaarg.addr = phi i32* [ %4, %vaarg.in_reg ], [ %6, %vaarg.in_mem ]
  %7 = load i32* %vaarg.addr
  store i32 %7, i32* %value, align 4
  %8 = load i32* %value, align 4
  %9 = load i32* %result, align 4
  %add = add nsw i32 %9, %8
  store i32 %add, i32* %result, align 4
  br label %for.inc

for.inc:                                          ; preds = %vaarg.end
  %10 = load i32* %i, align 4
  %inc = add nsw i32 %10, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %arraydecay3 = getelementptr inbounds [1 x %struct.__va_list_tag]* %vl, i32 0, i32 0
  %arraydecay34 = bitcast %struct.__va_list_tag* %arraydecay3 to i8*
  call void @llvm.va_end(i8* %arraydecay34)
  %arraydecay5 = getelementptr inbounds [1 x %struct.__va_list_tag]* %vl, i32 0, i32 0
  %arraydecay56 = bitcast %struct.__va_list_tag* %arraydecay5 to i8*
  call void @llvm.va_start(i8* %arraydecay56)
  store i32 0, i32* %i, align 4
  br label %for.cond7

for.cond7:                                        ; preds = %for.inc24, %for.end
  %11 = load i32* %i, align 4
  %12 = load i32* %n.addr, align 4
  %cmp8 = icmp slt i32 %11, %12
  br i1 %cmp8, label %for.body9, label %for.end26

for.body9:                                        ; preds = %for.cond7
  %arraydecay11 = getelementptr inbounds [1 x %struct.__va_list_tag]* %vl, i32 0, i32 0
  %gp_offset_p12 = getelementptr inbounds %struct.__va_list_tag* %arraydecay11, i32 0, i32 0
  %gp_offset13 = load i32* %gp_offset_p12
  %fits_in_gp14 = icmp ule i32 %gp_offset13, 40
  br i1 %fits_in_gp14, label %vaarg.in_reg15, label %vaarg.in_mem17

vaarg.in_reg15:                                   ; preds = %for.body9
  %13 = getelementptr inbounds %struct.__va_list_tag* %arraydecay11, i32 0, i32 3
  %reg_save_area16 = load i8** %13
  %14 = getelementptr i8* %reg_save_area16, i32 %gp_offset13
  %15 = bitcast i8* %14 to i32*
  %16 = add i32 %gp_offset13, 8
  store i32 %16, i32* %gp_offset_p12
  br label %vaarg.end21

vaarg.in_mem17:                                   ; preds = %for.body9
  %overflow_arg_area_p18 = getelementptr inbounds %struct.__va_list_tag* %arraydecay11, i32 0, i32 2
  %overflow_arg_area19 = load i8** %overflow_arg_area_p18
  %17 = bitcast i8* %overflow_arg_area19 to i32*
  %overflow_arg_area.next20 = getelementptr i8* %overflow_arg_area19, i32 8
  store i8* %overflow_arg_area.next20, i8** %overflow_arg_area_p18
  br label %vaarg.end21

vaarg.end21:                                      ; preds = %vaarg.in_mem17, %vaarg.in_reg15
  %vaarg.addr22 = phi i32* [ %15, %vaarg.in_reg15 ], [ %17, %vaarg.in_mem17 ]
  %18 = load i32* %vaarg.addr22
  store i32 %18, i32* %value10, align 4
  %19 = load i32* %value10, align 4
  %20 = load i32* %result, align 4
  %add23 = add nsw i32 %20, %19
  store i32 %add23, i32* %result, align 4
  br label %for.inc24

for.inc24:                                        ; preds = %vaarg.end21
  %21 = load i32* %i, align 4
  %inc25 = add nsw i32 %21, 1
  store i32 %inc25, i32* %i, align 4
  br label %for.cond7

for.end26:                                        ; preds = %for.cond7
  %arraydecay27 = getelementptr inbounds [1 x %struct.__va_list_tag]* %vl, i32 0, i32 0
  %arraydecay2728 = bitcast %struct.__va_list_tag* %arraydecay27 to i8*
  call void @llvm.va_end(i8* %arraydecay2728)
  %22 = load i32* %result, align 4
  ret i32 %22
}

; Function Attrs: nounwind
declare void @llvm.va_start(i8*) #1

; Function Attrs: nounwind
declare void @llvm.va_end(i8*) #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 (i32, ...)* @sum(i32 5, i32 1, i32 2, i32 3, i32 4, i32 5)
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %call)
  ret i32 0
}

declare i32 @printf(i8*, ...) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)"}
