; ModuleID = '14401.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.option = type { i8*, i32, i32*, i32 }
%struct.cmdline_option = type { i8*, i8, i32, i8*, i32 }

@short_options = internal global [128 x i8] zeroinitializer, align 16
@long_options = internal global [5 x %struct.option] zeroinitializer, align 16
@optmap = internal global [96 x i8] zeroinitializer, align 16
@.str = private unnamed_addr constant [19 x i8] c"opt->argtype != -1\00", align 1
@.str1 = private unnamed_addr constant [8 x i8] c"14401.c\00", align 1
@__PRETTY_FUNCTION__.init_switches = private unnamed_addr constant [21 x i8] c"void init_switches()\00", align 1
@.str2 = private unnamed_addr constant [52 x i8] c"o <= sizeof(long_options) / sizeof(long_options[0])\00", align 1
@no_prefix.buffer = internal global [1024 x i8] zeroinitializer, align 16
@no_prefix.p = internal global i8* getelementptr inbounds ([1024 x i8]* @no_prefix.buffer, i32 0, i32 0), align 8
@.str3 = private unnamed_addr constant [7 x i8] c"accept\00", align 1
@.str4 = private unnamed_addr constant [17 x i8] c"adjust-extension\00", align 1
@.str5 = private unnamed_addr constant [16 x i8] c"adjustextension\00", align 1
@option_data = internal global <{ { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] } }> <{ { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([7 x i8]* @.str3, i32 0, i32 0), i8 65, i32 0, i8* getelementptr inbounds ([7 x i8]* @.str3, i32 0, i32 0), i32 -1, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([17 x i8]* @.str4, i32 0, i32 0), i8 69, i32 1, i8* getelementptr inbounds ([16 x i8]* @.str5, i32 0, i32 0), i32 -1, [4 x i8] undef } }>, align 16

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  call void @init_switches()
  ret i32 0
}

; Function Attrs: nounwind uwtable
define internal void @init_switches() #0 {
entry:
  %p = alloca i8*, align 8
  %i = alloca i64, align 8
  %o = alloca i64, align 8
  %opt = alloca %struct.cmdline_option*, align 8
  %longopt = alloca %struct.option*, align 8
  store i8* getelementptr inbounds ([128 x i8]* @short_options, i32 0, i32 0), i8** %p, align 8
  store i64 0, i64* %o, align 8
  store i64 0, i64* %i, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64* %i, align 8
  %cmp = icmp ult i64 %0, 2
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i64* %i, align 8
  %arrayidx = getelementptr inbounds [2 x %struct.cmdline_option]* bitcast (<{ { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] } }>* @option_data to [2 x %struct.cmdline_option]*), i32 0, i64 %1
  store %struct.cmdline_option* %arrayidx, %struct.cmdline_option** %opt, align 8
  %2 = load %struct.cmdline_option** %opt, align 8
  %long_name = getelementptr inbounds %struct.cmdline_option* %2, i32 0, i32 0
  %3 = load i8** %long_name, align 8
  %tobool = icmp ne i8* %3, null
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %for.body
  br label %for.inc

if.end:                                           ; preds = %for.body
  %4 = load i64* %o, align 8
  %inc = add i64 %4, 1
  store i64 %inc, i64* %o, align 8
  %arrayidx1 = getelementptr inbounds [5 x %struct.option]* @long_options, i32 0, i64 %4
  store %struct.option* %arrayidx1, %struct.option** %longopt, align 8
  %5 = load %struct.cmdline_option** %opt, align 8
  %long_name2 = getelementptr inbounds %struct.cmdline_option* %5, i32 0, i32 0
  %6 = load i8** %long_name2, align 8
  %7 = load %struct.option** %longopt, align 8
  %name = getelementptr inbounds %struct.option* %7, i32 0, i32 0
  store i8* %6, i8** %name, align 8
  %8 = load i64* %i, align 8
  %conv = trunc i64 %8 to i32
  %9 = load %struct.option** %longopt, align 8
  %val = getelementptr inbounds %struct.option* %9, i32 0, i32 3
  store i32 %conv, i32* %val, align 4
  %10 = load %struct.cmdline_option** %opt, align 8
  %short_name = getelementptr inbounds %struct.cmdline_option* %10, i32 0, i32 1
  %11 = load i8* %short_name, align 1
  %tobool3 = icmp ne i8 %11, 0
  br i1 %tobool3, label %if.then4, label %if.end10

if.then4:                                         ; preds = %if.end
  %12 = load %struct.cmdline_option** %opt, align 8
  %short_name5 = getelementptr inbounds %struct.cmdline_option* %12, i32 0, i32 1
  %13 = load i8* %short_name5, align 1
  %14 = load i8** %p, align 8
  %incdec.ptr = getelementptr inbounds i8* %14, i32 1
  store i8* %incdec.ptr, i8** %p, align 8
  store i8 %13, i8* %14, align 1
  %15 = load %struct.option** %longopt, align 8
  %sub.ptr.lhs.cast = ptrtoint %struct.option* %15 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, ptrtoint ([5 x %struct.option]* @long_options to i64)
  %sub.ptr.div = sdiv exact i64 %sub.ptr.sub, 32
  %conv6 = trunc i64 %sub.ptr.div to i8
  %16 = load %struct.cmdline_option** %opt, align 8
  %short_name7 = getelementptr inbounds %struct.cmdline_option* %16, i32 0, i32 1
  %17 = load i8* %short_name7, align 1
  %conv8 = sext i8 %17 to i32
  %sub = sub nsw i32 %conv8, 32
  %idxprom = sext i32 %sub to i64
  %arrayidx9 = getelementptr inbounds [96 x i8]* @optmap, i32 0, i64 %idxprom
  store i8 %conv6, i8* %arrayidx9, align 1
  br label %if.end10

if.end10:                                         ; preds = %if.then4, %if.end
  %18 = load %struct.cmdline_option** %opt, align 8
  %type = getelementptr inbounds %struct.cmdline_option* %18, i32 0, i32 2
  %19 = load i32* %type, align 4
  switch i32 %19, label %sw.default [
    i32 0, label %sw.bb
    i32 1, label %sw.bb16
  ]

sw.bb:                                            ; preds = %if.end10
  %20 = load %struct.option** %longopt, align 8
  %has_arg = getelementptr inbounds %struct.option* %20, i32 0, i32 1
  store i32 1, i32* %has_arg, align 4
  %21 = load %struct.cmdline_option** %opt, align 8
  %short_name11 = getelementptr inbounds %struct.cmdline_option* %21, i32 0, i32 1
  %22 = load i8* %short_name11, align 1
  %tobool12 = icmp ne i8 %22, 0
  br i1 %tobool12, label %if.then13, label %if.end15

if.then13:                                        ; preds = %sw.bb
  %23 = load i8** %p, align 8
  %incdec.ptr14 = getelementptr inbounds i8* %23, i32 1
  store i8* %incdec.ptr14, i8** %p, align 8
  store i8 58, i8* %23, align 1
  br label %if.end15

if.end15:                                         ; preds = %if.then13, %sw.bb
  br label %sw.epilog

sw.bb16:                                          ; preds = %if.end10
  %24 = load %struct.option** %longopt, align 8
  %has_arg17 = getelementptr inbounds %struct.option* %24, i32 0, i32 1
  store i32 2, i32* %has_arg17, align 4
  %25 = load i64* %o, align 8
  %inc18 = add i64 %25, 1
  store i64 %inc18, i64* %o, align 8
  %arrayidx19 = getelementptr inbounds [5 x %struct.option]* @long_options, i32 0, i64 %25
  store %struct.option* %arrayidx19, %struct.option** %longopt, align 8
  %26 = load %struct.cmdline_option** %opt, align 8
  %long_name20 = getelementptr inbounds %struct.cmdline_option* %26, i32 0, i32 0
  %27 = load i8** %long_name20, align 8
  %call = call i8* @no_prefix(i8* %27)
  %28 = load %struct.option** %longopt, align 8
  %name21 = getelementptr inbounds %struct.option* %28, i32 0, i32 0
  store i8* %call, i8** %name21, align 8
  %29 = load %struct.option** %longopt, align 8
  %has_arg22 = getelementptr inbounds %struct.option* %29, i32 0, i32 1
  store i32 0, i32* %has_arg22, align 4
  %30 = load i64* %i, align 8
  %or = or i64 %30, 1024
  %conv23 = trunc i64 %or to i32
  %31 = load %struct.option** %longopt, align 8
  %val24 = getelementptr inbounds %struct.option* %31, i32 0, i32 3
  store i32 %conv23, i32* %val24, align 4
  br label %sw.epilog

sw.default:                                       ; preds = %if.end10
  %32 = load %struct.cmdline_option** %opt, align 8
  %argtype = getelementptr inbounds %struct.cmdline_option* %32, i32 0, i32 4
  %33 = load i32* %argtype, align 4
  %cmp25 = icmp ne i32 %33, -1
  br i1 %cmp25, label %cond.true, label %cond.false

cond.true:                                        ; preds = %sw.default
  br label %cond.end

cond.false:                                       ; preds = %sw.default
  call void @__assert_fail(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8]* @.str1, i32 0, i32 0), i32 243, i8* getelementptr inbounds ([21 x i8]* @__PRETTY_FUNCTION__.init_switches, i32 0, i32 0)) #4
  unreachable
                                                  ; No predecessors!
  br label %cond.end

cond.end:                                         ; preds = %34, %cond.true
  %35 = load %struct.cmdline_option** %opt, align 8
  %argtype27 = getelementptr inbounds %struct.cmdline_option* %35, i32 0, i32 4
  %36 = load i32* %argtype27, align 4
  %37 = load %struct.option** %longopt, align 8
  %has_arg28 = getelementptr inbounds %struct.option* %37, i32 0, i32 1
  store i32 %36, i32* %has_arg28, align 4
  %38 = load %struct.cmdline_option** %opt, align 8
  %short_name29 = getelementptr inbounds %struct.cmdline_option* %38, i32 0, i32 1
  %39 = load i8* %short_name29, align 1
  %tobool30 = icmp ne i8 %39, 0
  br i1 %tobool30, label %if.then31, label %if.end38

if.then31:                                        ; preds = %cond.end
  %40 = load %struct.option** %longopt, align 8
  %has_arg32 = getelementptr inbounds %struct.option* %40, i32 0, i32 1
  %41 = load i32* %has_arg32, align 4
  %cmp33 = icmp eq i32 %41, 1
  br i1 %cmp33, label %if.then35, label %if.end37

if.then35:                                        ; preds = %if.then31
  %42 = load i8** %p, align 8
  %incdec.ptr36 = getelementptr inbounds i8* %42, i32 1
  store i8* %incdec.ptr36, i8** %p, align 8
  store i8 58, i8* %42, align 1
  br label %if.end37

if.end37:                                         ; preds = %if.then35, %if.then31
  br label %if.end38

if.end38:                                         ; preds = %if.end37, %cond.end
  br label %sw.epilog

sw.epilog:                                        ; preds = %if.end38, %sw.bb16, %if.end15
  br label %for.inc

for.inc:                                          ; preds = %sw.epilog, %if.then
  %43 = load i64* %i, align 8
  %inc39 = add i64 %43, 1
  store i64 %inc39, i64* %i, align 8
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %44 = load i8** %p, align 8
  store i8 0, i8* %44, align 1
  %45 = load i64* %o, align 8
  %cmp40 = icmp ule i64 %45, 5
  br i1 %cmp40, label %cond.true42, label %cond.false43

cond.true42:                                      ; preds = %for.end
  br label %cond.end44

cond.false43:                                     ; preds = %for.end
  call void @__assert_fail(i8* getelementptr inbounds ([52 x i8]* @.str2, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8]* @.str1, i32 0, i32 0), i32 257, i8* getelementptr inbounds ([21 x i8]* @__PRETTY_FUNCTION__.init_switches, i32 0, i32 0)) #4
  unreachable
                                                  ; No predecessors!
  br label %cond.end44

cond.end44:                                       ; preds = %46, %cond.true42
  ret void
}

; Function Attrs: nounwind uwtable
define internal i8* @no_prefix(i8* %s) #0 {
entry:
  %s.addr = alloca i8*, align 8
  %cp = alloca i8*, align 8
  %size = alloca i32, align 4
  store i8* %s, i8** %s.addr, align 8
  %0 = load i8** @no_prefix.p, align 8
  store i8* %0, i8** %cp, align 8
  %1 = load i8** %s.addr, align 8
  %call = call i64 @strlen(i8* %1) #5
  %add = add i64 3, %call
  %add1 = add i64 %add, 1
  %conv = trunc i64 %add1 to i32
  store i32 %conv, i32* %size, align 4
  %2 = load i8** @no_prefix.p, align 8
  %3 = load i32* %size, align 4
  %idx.ext = sext i32 %3 to i64
  %add.ptr = getelementptr inbounds i8* %2, i64 %idx.ext
  %cmp = icmp uge i8* %add.ptr, getelementptr inbounds (i8* getelementptr inbounds ([1024 x i8]* @no_prefix.buffer, i32 0, i32 0), i64 1024)
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() #4
  unreachable

if.end:                                           ; preds = %entry
  %4 = load i8** %cp, align 8
  %arrayidx = getelementptr inbounds i8* %4, i64 0
  store i8 110, i8* %arrayidx, align 1
  %5 = load i8** %cp, align 8
  %arrayidx3 = getelementptr inbounds i8* %5, i64 1
  store i8 111, i8* %arrayidx3, align 1
  %6 = load i8** %cp, align 8
  %arrayidx4 = getelementptr inbounds i8* %6, i64 2
  store i8 45, i8* %arrayidx4, align 1
  %7 = load i8** %cp, align 8
  %add.ptr5 = getelementptr inbounds i8* %7, i64 3
  %8 = load i8** %s.addr, align 8
  %call6 = call i8* @strcpy(i8* %add.ptr5, i8* %8) #6
  %9 = load i32* %size, align 4
  %10 = load i8** @no_prefix.p, align 8
  %idx.ext7 = sext i32 %9 to i64
  %add.ptr8 = getelementptr inbounds i8* %10, i64 %idx.ext7
  store i8* %add.ptr8, i8** @no_prefix.p, align 8
  %11 = load i8** %cp, align 8
  ret i8* %11
}

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8*, i8*, i32, i8*) #1

; Function Attrs: nounwind readonly
declare i64 @strlen(i8*) #2

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: nounwind
declare i8* @strcpy(i8*, i8*) #3

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind }
attributes #5 = { nounwind readonly }
attributes #6 = { nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)"}
