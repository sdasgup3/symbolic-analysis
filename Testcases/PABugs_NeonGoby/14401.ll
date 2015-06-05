; ModuleID = '14401.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.option = type { i8*, i32, i32*, i32 }
%struct.cmdline_option = type { i8*, i8, i32, i8*, i32 }

@short_options = internal global [128 x i8] zeroinitializer, align 16
@.str = private unnamed_addr constant [8 x i8] c"symvari\00", align 1
@.str1 = private unnamed_addr constant [3 x i8] c"%c\00", align 1
@long_options = internal global [5 x %struct.option] zeroinitializer, align 16
@optmap = internal global [96 x i8] zeroinitializer, align 16
@.str2 = private unnamed_addr constant [19 x i8] c"opt->argtype != -1\00", align 1
@.str3 = private unnamed_addr constant [8 x i8] c"14401.c\00", align 1
@__PRETTY_FUNCTION__.init_switches = private unnamed_addr constant [21 x i8] c"void init_switches()\00", align 1
@.str4 = private unnamed_addr constant [52 x i8] c"o <= sizeof(long_options) / sizeof(long_options[0])\00", align 1
@no_prefix.buffer = internal global [1024 x i8] zeroinitializer, align 16
@no_prefix.p = internal global i8* getelementptr inbounds ([1024 x i8]* @no_prefix.buffer, i32 0, i32 0), align 8
@.str5 = private unnamed_addr constant [7 x i8] c"accept\00", align 1
@.str6 = private unnamed_addr constant [17 x i8] c"adjust-extension\00", align 1
@.str7 = private unnamed_addr constant [16 x i8] c"adjustextension\00", align 1
@option_data = internal global <{ { i8*, i8, i32, i8*, i32, [4 x i8] }, { i8*, i8, i32, i8*, i32, [4 x i8] } }> <{ { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([7 x i8]* @.str5, i32 0, i32 0), i8 65, i32 0, i8* getelementptr inbounds ([7 x i8]* @.str5, i32 0, i32 0), i32 -1, [4 x i8] undef }, { i8*, i8, i32, i8*, i32, [4 x i8] } { i8* getelementptr inbounds ([17 x i8]* @.str6, i32 0, i32 0), i8 69, i32 1, i8* getelementptr inbounds ([16 x i8]* @.str7, i32 0, i32 0), i32 -1, [4 x i8] undef } }>, align 16

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
  store i64 0, i64* %i, align 8
  store i64 0, i64* %o, align 8
  %call = call i32 (i64*, i64, i8*, ...)* bitcast (i32 (...)* @klee_make_symbolic to i32 (i64*, i64, i8*, ...)*)(i64* %i, i64 8, i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0))
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
  %4 = load %struct.cmdline_option** %opt, align 8
  %long_name1 = getelementptr inbounds %struct.cmdline_option* %4, i32 0, i32 0
  %5 = load i8** %long_name1, align 8
  %6 = load i8* %5, align 1
  %conv = sext i8 %6 to i32
  %call2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str1, i32 0, i32 0), i32 %conv)
  %7 = load i64* %o, align 8
  %inc = add i64 %7, 1
  store i64 %inc, i64* %o, align 8
  %arrayidx3 = getelementptr inbounds [5 x %struct.option]* @long_options, i32 0, i64 %7
  store %struct.option* %arrayidx3, %struct.option** %longopt, align 8
  %8 = load %struct.cmdline_option** %opt, align 8
  %long_name4 = getelementptr inbounds %struct.cmdline_option* %8, i32 0, i32 0
  %9 = load i8** %long_name4, align 8
  %10 = load %struct.option** %longopt, align 8
  %name = getelementptr inbounds %struct.option* %10, i32 0, i32 0
  store i8* %9, i8** %name, align 8
  %11 = load i64* %i, align 8
  %conv5 = trunc i64 %11 to i32
  %12 = load %struct.option** %longopt, align 8
  %val = getelementptr inbounds %struct.option* %12, i32 0, i32 3
  store i32 %conv5, i32* %val, align 4
  %13 = load %struct.cmdline_option** %opt, align 8
  %short_name = getelementptr inbounds %struct.cmdline_option* %13, i32 0, i32 1
  %14 = load i8* %short_name, align 1
  %tobool6 = icmp ne i8 %14, 0
  br i1 %tobool6, label %if.then7, label %if.end13

if.then7:                                         ; preds = %if.end
  %15 = load %struct.cmdline_option** %opt, align 8
  %short_name8 = getelementptr inbounds %struct.cmdline_option* %15, i32 0, i32 1
  %16 = load i8* %short_name8, align 1
  %17 = load i8** %p, align 8
  %incdec.ptr = getelementptr inbounds i8* %17, i32 1
  store i8* %incdec.ptr, i8** %p, align 8
  store i8 %16, i8* %17, align 1
  %18 = load %struct.option** %longopt, align 8
  %sub.ptr.lhs.cast = ptrtoint %struct.option* %18 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, ptrtoint ([5 x %struct.option]* @long_options to i64)
  %sub.ptr.div = sdiv exact i64 %sub.ptr.sub, 32
  %conv9 = trunc i64 %sub.ptr.div to i8
  %19 = load %struct.cmdline_option** %opt, align 8
  %short_name10 = getelementptr inbounds %struct.cmdline_option* %19, i32 0, i32 1
  %20 = load i8* %short_name10, align 1
  %conv11 = sext i8 %20 to i32
  %sub = sub nsw i32 %conv11, 32
  %idxprom = sext i32 %sub to i64
  %arrayidx12 = getelementptr inbounds [96 x i8]* @optmap, i32 0, i64 %idxprom
  store i8 %conv9, i8* %arrayidx12, align 1
  br label %if.end13

if.end13:                                         ; preds = %if.then7, %if.end
  %21 = load %struct.cmdline_option** %opt, align 8
  %type = getelementptr inbounds %struct.cmdline_option* %21, i32 0, i32 2
  %22 = load i32* %type, align 4
  switch i32 %22, label %sw.default [
    i32 0, label %sw.bb
    i32 1, label %sw.bb19
  ]

sw.bb:                                            ; preds = %if.end13
  %23 = load %struct.option** %longopt, align 8
  %has_arg = getelementptr inbounds %struct.option* %23, i32 0, i32 1
  store i32 1, i32* %has_arg, align 4
  %24 = load %struct.cmdline_option** %opt, align 8
  %short_name14 = getelementptr inbounds %struct.cmdline_option* %24, i32 0, i32 1
  %25 = load i8* %short_name14, align 1
  %tobool15 = icmp ne i8 %25, 0
  br i1 %tobool15, label %if.then16, label %if.end18

if.then16:                                        ; preds = %sw.bb
  %26 = load i8** %p, align 8
  %incdec.ptr17 = getelementptr inbounds i8* %26, i32 1
  store i8* %incdec.ptr17, i8** %p, align 8
  store i8 58, i8* %26, align 1
  br label %if.end18

if.end18:                                         ; preds = %if.then16, %sw.bb
  br label %sw.epilog

sw.bb19:                                          ; preds = %if.end13
  %27 = load %struct.option** %longopt, align 8
  %has_arg20 = getelementptr inbounds %struct.option* %27, i32 0, i32 1
  store i32 2, i32* %has_arg20, align 4
  %28 = load i64* %o, align 8
  %inc21 = add i64 %28, 1
  store i64 %inc21, i64* %o, align 8
  %arrayidx22 = getelementptr inbounds [5 x %struct.option]* @long_options, i32 0, i64 %28
  store %struct.option* %arrayidx22, %struct.option** %longopt, align 8
  %29 = load %struct.cmdline_option** %opt, align 8
  %long_name23 = getelementptr inbounds %struct.cmdline_option* %29, i32 0, i32 0
  %30 = load i8** %long_name23, align 8
  %call24 = call i8* @no_prefix(i8* %30)
  %31 = load %struct.option** %longopt, align 8
  %name25 = getelementptr inbounds %struct.option* %31, i32 0, i32 0
  store i8* %call24, i8** %name25, align 8
  %32 = load %struct.option** %longopt, align 8
  %has_arg26 = getelementptr inbounds %struct.option* %32, i32 0, i32 1
  store i32 0, i32* %has_arg26, align 4
  %33 = load i64* %i, align 8
  %or = or i64 %33, 1024
  %conv27 = trunc i64 %or to i32
  %34 = load %struct.option** %longopt, align 8
  %val28 = getelementptr inbounds %struct.option* %34, i32 0, i32 3
  store i32 %conv27, i32* %val28, align 4
  br label %sw.epilog

sw.default:                                       ; preds = %if.end13
  %35 = load %struct.cmdline_option** %opt, align 8
  %argtype = getelementptr inbounds %struct.cmdline_option* %35, i32 0, i32 4
  %36 = load i32* %argtype, align 4
  %cmp29 = icmp ne i32 %36, -1
  br i1 %cmp29, label %cond.true, label %cond.false

cond.true:                                        ; preds = %sw.default
  br label %cond.end

cond.false:                                       ; preds = %sw.default
  call void @__assert_fail(i8* getelementptr inbounds ([19 x i8]* @.str2, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8]* @.str3, i32 0, i32 0), i32 119, i8* getelementptr inbounds ([21 x i8]* @__PRETTY_FUNCTION__.init_switches, i32 0, i32 0)) #5
  unreachable
                                                  ; No predecessors!
  br label %cond.end

cond.end:                                         ; preds = %37, %cond.true
  %38 = load %struct.cmdline_option** %opt, align 8
  %argtype31 = getelementptr inbounds %struct.cmdline_option* %38, i32 0, i32 4
  %39 = load i32* %argtype31, align 4
  %40 = load %struct.option** %longopt, align 8
  %has_arg32 = getelementptr inbounds %struct.option* %40, i32 0, i32 1
  store i32 %39, i32* %has_arg32, align 4
  %41 = load %struct.cmdline_option** %opt, align 8
  %short_name33 = getelementptr inbounds %struct.cmdline_option* %41, i32 0, i32 1
  %42 = load i8* %short_name33, align 1
  %tobool34 = icmp ne i8 %42, 0
  br i1 %tobool34, label %if.then35, label %if.end42

if.then35:                                        ; preds = %cond.end
  %43 = load %struct.option** %longopt, align 8
  %has_arg36 = getelementptr inbounds %struct.option* %43, i32 0, i32 1
  %44 = load i32* %has_arg36, align 4
  %cmp37 = icmp eq i32 %44, 1
  br i1 %cmp37, label %if.then39, label %if.end41

if.then39:                                        ; preds = %if.then35
  %45 = load i8** %p, align 8
  %incdec.ptr40 = getelementptr inbounds i8* %45, i32 1
  store i8* %incdec.ptr40, i8** %p, align 8
  store i8 58, i8* %45, align 1
  br label %if.end41

if.end41:                                         ; preds = %if.then39, %if.then35
  br label %if.end42

if.end42:                                         ; preds = %if.end41, %cond.end
  br label %sw.epilog

sw.epilog:                                        ; preds = %if.end42, %sw.bb19, %if.end18
  br label %for.inc

for.inc:                                          ; preds = %sw.epilog, %if.then
  %46 = load i64* %i, align 8
  %inc43 = add i64 %46, 1
  store i64 %inc43, i64* %i, align 8
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %47 = load i8** %p, align 8
  store i8 0, i8* %47, align 1
  %48 = load i64* %o, align 8
  %cmp44 = icmp ule i64 %48, 5
  br i1 %cmp44, label %cond.true46, label %cond.false47

cond.true46:                                      ; preds = %for.end
  br label %cond.end48

cond.false47:                                     ; preds = %for.end
  call void @__assert_fail(i8* getelementptr inbounds ([52 x i8]* @.str4, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8]* @.str3, i32 0, i32 0), i32 133, i8* getelementptr inbounds ([21 x i8]* @__PRETTY_FUNCTION__.init_switches, i32 0, i32 0)) #5
  unreachable
                                                  ; No predecessors!
  br label %cond.end48

cond.end48:                                       ; preds = %49, %cond.true46
  ret void
}

declare i32 @klee_make_symbolic(...) #1

declare i32 @printf(i8*, ...) #1

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
  %call = call i64 @strlen(i8* %1) #6
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
  call void @abort() #5
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
  %call6 = call i8* @strcpy(i8* %add.ptr5, i8* %8) #7
  %9 = load i32* %size, align 4
  %10 = load i8** @no_prefix.p, align 8
  %idx.ext7 = sext i32 %9 to i64
  %add.ptr8 = getelementptr inbounds i8* %10, i64 %idx.ext7
  store i8* %add.ptr8, i8** @no_prefix.p, align 8
  %11 = load i8** %cp, align 8
  ret i8* %11
}

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8*, i8*, i32, i8*) #2

; Function Attrs: nounwind readonly
declare i64 @strlen(i8*) #3

; Function Attrs: noreturn nounwind
declare void @abort() #2

; Function Attrs: nounwind
declare i8* @strcpy(i8*, i8*) #4

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn nounwind }
attributes #6 = { nounwind readonly }
attributes #7 = { nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)"}
