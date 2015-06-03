; ModuleID = 'dsaa-wa.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

;In function @func_22, the parameter %p_23 should alias %22, because @func_1 passes  %call = load i32*** @g_134 as argument %p_23 of @func_22, and %22 is also load i32*** @g_134. 
;http://llvm.org/bugs/show_bug.cgi?id=14496

%union.U0 = type { i64 }
%union.U1 = type { i64 }

@g_1039 = internal global [1 x [6 x i64*]] [[6 x i64*] [i64* getelementptr inbounds (%union.U1* @g_1037, i32 0, i32 0), i64* getelementptr inbounds (%union.U1* @g_307, i32 0, i32 0), i64* getelementptr inbounds (%union.U1* @g_1037, i32 0, i32 0), i64* getelementptr inbounds (%union.U1* @g_307, i32 0, i32 0), i64* getelementptr inbounds (%union.U1* @g_1037, i32 0, i32 0), i64* getelementptr inbounds (%union.U1* @g_307, i32 0, i32 0)]], align 16
@g_1038 = internal global i64** bitcast (i8* getelementptr (i8* bitcast ([1 x [6 x i64*]]* @g_1039 to i8*), i64 24) to i64**), align 8
@.str = private unnamed_addr constant [2 x i8] c"1\00", align 1
@g_3 = internal global i32 -153252589, align 4
@.str1 = private unnamed_addr constant [4 x i8] c"g_3\00", align 1
@g_13 = internal global %union.U0 { i64 -1 }, align 8
@.str2 = private unnamed_addr constant [8 x i8] c"g_13.f1\00", align 1
@g_49 = internal global i64 674246282095490018, align 8
@.str3 = private unnamed_addr constant [5 x i8] c"g_49\00", align 1
@g_66 = internal global [6 x [1 x [10 x i32]]] [[1 x [10 x i32]] [[10 x i32] [i32 -1561403615, i32 -1561403615, i32 1, i32 -1561403615, i32 -1561403615, i32 1, i32 -1561403615, i32 -1561403615, i32 1, i32 -1561403615]], [1 x [10 x i32]] [[10 x i32] [i32 -1561403615, i32 -1561403615, i32 1, i32 -1561403615, i32 -1561403615, i32 1, i32 -1561403615, i32 -1561403615, i32 1, i32 -1561403615]], [1 x [10 x i32]] [[10 x i32] [i32 -1561403615, i32 -1561403615, i32 1, i32 -1561403615, i32 -1561403615, i32 1, i32 -1561403615, i32 -1561403615, i32 1, i32 -1561403615]], [1 x [10 x i32]] [[10 x i32] [i32 -1561403615, i32 -1561403615, i32 1, i32 -1561403615, i32 -1561403615, i32 1, i32 -1561403615, i32 -1561403615, i32 1, i32 -1561403615]], [1 x [10 x i32]] [[10 x i32] [i32 -1561403615, i32 -1561403615, i32 1, i32 -1561403615, i32 -1561403615, i32 1, i32 -1561403615, i32 -1561403615, i32 1, i32 -1561403615]], [1 x [10 x i32]] [[10 x i32] [i32 -1561403615, i32 -1561403615, i32 1, i32 -1561403615, i32 -1561403615, i32 1, i32 -1561403615, i32 -1561403615, i32 1, i32 -1561403615]]], align 16
@.str4 = private unnamed_addr constant [14 x i8] c"g_66[i][j][k]\00", align 1
@.str5 = private unnamed_addr constant [22 x i8] c"index = [%d][%d][%d]\0A\00", align 1
@g_110 = internal global [1 x [8 x [10 x i32]]] [[8 x [10 x i32]] [[10 x i32] [i32 1414912305, i32 -1, i32 2, i32 1642620146, i32 2137642836, i32 95595322, i32 583003103, i32 5, i32 1588503345, i32 2], [10 x i32] [i32 1414912305, i32 -1, i32 2, i32 1642620146, i32 2137642836, i32 95595322, i32 583003103, i32 5, i32 1588503345, i32 2], [10 x i32] [i32 1414912305, i32 -1, i32 2, i32 1642620146, i32 2137642836, i32 95595322, i32 583003103, i32 5, i32 1588503345, i32 2], [10 x i32] [i32 1414912305, i32 -1, i32 2, i32 1642620146, i32 2137642836, i32 95595322, i32 583003103, i32 5, i32 1588503345, i32 2], [10 x i32] [i32 1414912305, i32 -1, i32 2, i32 1642620146, i32 2137642836, i32 95595322, i32 583003103, i32 5, i32 1588503345, i32 2], [10 x i32] [i32 1414912305, i32 -1, i32 2, i32 1642620146, i32 2137642836, i32 95595322, i32 583003103, i32 5, i32 1588503345, i32 2], [10 x i32] [i32 1414912305, i32 -1, i32 2, i32 1642620146, i32 2137642836, i32 95595322, i32 583003103, i32 5, i32 1588503345, i32 2], [10 x i32] [i32 1414912305, i32 -1, i32 2, i32 1642620146, i32 2137642836, i32 95595322, i32 583003103, i32 5, i32 1588503345, i32 2]]], align 16
@.str6 = private unnamed_addr constant [15 x i8] c"g_110[i][j][k]\00", align 1
@g_130 = internal global %union.U1 { i64 -6978288996931971940 }, align 8
@.str7 = private unnamed_addr constant [9 x i8] c"g_130.f1\00", align 1
@.str8 = private unnamed_addr constant [9 x i8] c"g_130.f3\00", align 1
@g_163 = internal global i64 1, align 8
@.str9 = private unnamed_addr constant [6 x i8] c"g_163\00", align 1
@g_166 = internal global i16 11747, align 2
@.str10 = private unnamed_addr constant [6 x i8] c"g_166\00", align 1
@g_182 = internal global i8 9, align 1
@.str11 = private unnamed_addr constant [6 x i8] c"g_182\00", align 1
@g_193 = internal global i16 -1, align 2
@.str12 = private unnamed_addr constant [6 x i8] c"g_193\00", align 1
@g_200 = internal global i8 41, align 1
@.str13 = private unnamed_addr constant [6 x i8] c"g_200\00", align 1
@g_213 = internal global [7 x i32] [i32 -1, i32 -1, i32 1882170968, i32 -1, i32 -1, i32 1882170968, i32 -1], align 16
@.str14 = private unnamed_addr constant [9 x i8] c"g_213[i]\00", align 1
@.str15 = private unnamed_addr constant [14 x i8] c"index = [%d]\0A\00", align 1
@g_307 = internal global %union.U1 { i64 1437375277647706542 }, align 8
@.str16 = private unnamed_addr constant [9 x i8] c"g_307.f1\00", align 1
@.str17 = private unnamed_addr constant [9 x i8] c"g_307.f3\00", align 1
@g_322 = internal global i32 2007608965, align 4
@.str18 = private unnamed_addr constant [6 x i8] c"g_322\00", align 1
@g_353 = internal global i32 -133732662, align 4
@.str19 = private unnamed_addr constant [6 x i8] c"g_353\00", align 1
@g_361 = internal global %union.U1 { i64 4520978876400702248 }, align 8
@.str20 = private unnamed_addr constant [9 x i8] c"g_361.f0\00", align 1
@.str21 = private unnamed_addr constant [9 x i8] c"g_361.f1\00", align 1
@.str22 = private unnamed_addr constant [9 x i8] c"g_361.f2\00", align 1
@.str23 = private unnamed_addr constant [9 x i8] c"g_361.f3\00", align 1
@.str24 = private unnamed_addr constant [9 x i8] c"g_361.f4\00", align 1
@g_364 = internal global [5 x i16] [i16 6, i16 -10716, i16 6, i16 -10716, i16 6], align 2
@.str25 = private unnamed_addr constant [9 x i8] c"g_364[i]\00", align 1
@.str26 = private unnamed_addr constant [6 x i8] c"g_434\00", align 1
@g_462 = internal global i8 100, align 1
@.str27 = private unnamed_addr constant [6 x i8] c"g_462\00", align 1
@g_471 = internal global i32 1164149948, align 4
@.str28 = private unnamed_addr constant [6 x i8] c"g_471\00", align 1
@g_536 = internal global %union.U1 { i64 1 }, align 8
@.str29 = private unnamed_addr constant [9 x i8] c"g_536.f1\00", align 1
@.str30 = private unnamed_addr constant [9 x i8] c"g_536.f3\00", align 1
@.str31 = private unnamed_addr constant [6 x i8] c"g_639\00", align 1
@g_674 = internal global %union.U1 { i64 3382057562077998469 }, align 8
@.str32 = private unnamed_addr constant [9 x i8] c"g_674.f1\00", align 1
@.str33 = private unnamed_addr constant [9 x i8] c"g_674.f3\00", align 1
@g_682 = internal global i8 1, align 1
@.str34 = private unnamed_addr constant [6 x i8] c"g_682\00", align 1
@g_809 = internal global i16 -12928, align 2
@.str35 = private unnamed_addr constant [6 x i8] c"g_809\00", align 1
@g_815 = internal global %union.U1 { i64 -7 }, align 8
@.str36 = private unnamed_addr constant [9 x i8] c"g_815.f1\00", align 1
@.str37 = private unnamed_addr constant [9 x i8] c"g_815.f2\00", align 1
@.str38 = private unnamed_addr constant [9 x i8] c"g_815.f3\00", align 1
@.str39 = private unnamed_addr constant [9 x i8] c"g_815.f4\00", align 1
@g_880 = internal global [3 x [6 x [1 x i8]]] [[6 x [1 x i8]] [[1 x i8] c"\F4", [1 x i8] c"\F4", [1 x i8] c"\F4", [1 x i8] c"\F4", [1 x i8] c"\F4", [1 x i8] c"\F4"], [6 x [1 x i8]] [[1 x i8] c"\F4", [1 x i8] c"\F4", [1 x i8] c"\F4", [1 x i8] c"\F4", [1 x i8] c"\F4", [1 x i8] c"\F4"], [6 x [1 x i8]] [[1 x i8] c"\F4", [1 x i8] c"\F4", [1 x i8] c"\F4", [1 x i8] c"\F4", [1 x i8] c"\F4", [1 x i8] c"\F4"]], align 16
@.str40 = private unnamed_addr constant [15 x i8] c"g_880[i][j][k]\00", align 1
@g_886 = internal global %union.U0 { i64 -4201152992507587824 }, align 8
@.str41 = private unnamed_addr constant [9 x i8] c"g_886.f1\00", align 1
@g_904 = internal global i8 -6, align 1
@.str42 = private unnamed_addr constant [6 x i8] c"g_904\00", align 1
@g_965 = internal global %union.U1 { i64 7325131140212585150 }, align 8
@.str43 = private unnamed_addr constant [9 x i8] c"g_965.f1\00", align 1
@.str44 = private unnamed_addr constant [9 x i8] c"g_965.f2\00", align 1
@.str45 = private unnamed_addr constant [9 x i8] c"g_965.f3\00", align 1
@.str46 = private unnamed_addr constant [9 x i8] c"g_965.f4\00", align 1
@g_994 = internal global i32 4, align 4
@.str47 = private unnamed_addr constant [6 x i8] c"g_994\00", align 1
@g_996 = internal global i16 -24731, align 2
@.str48 = private unnamed_addr constant [6 x i8] c"g_996\00", align 1
@g_1037 = internal global %union.U1 { i64 -1 }, align 8
@.str49 = private unnamed_addr constant [10 x i8] c"g_1037.f1\00", align 1
@.str50 = private unnamed_addr constant [10 x i8] c"g_1037.f3\00", align 1
@g_1041 = internal global %union.U1 { i64 5894763543175119403 }, align 8
@.str51 = private unnamed_addr constant [10 x i8] c"g_1041.f0\00", align 1
@.str52 = private unnamed_addr constant [10 x i8] c"g_1041.f1\00", align 1
@.str53 = private unnamed_addr constant [10 x i8] c"g_1041.f2\00", align 1
@.str54 = private unnamed_addr constant [10 x i8] c"g_1041.f3\00", align 1
@.str55 = private unnamed_addr constant [10 x i8] c"g_1041.f4\00", align 1
@g_1050 = internal global %union.U1 { i64 5741653008715799560 }, align 8
@.str56 = private unnamed_addr constant [10 x i8] c"g_1050.f0\00", align 1
@.str57 = private unnamed_addr constant [10 x i8] c"g_1050.f1\00", align 1
@.str58 = private unnamed_addr constant [10 x i8] c"g_1050.f2\00", align 1
@.str59 = private unnamed_addr constant [10 x i8] c"g_1050.f3\00", align 1
@.str60 = private unnamed_addr constant [10 x i8] c"g_1050.f4\00", align 1
@g_1053 = internal global i8 -1, align 1
@.str61 = private unnamed_addr constant [7 x i8] c"g_1053\00", align 1
@g_1103 = internal constant %union.U1 { i64 5739472242336121021 }, align 8
@.str62 = private unnamed_addr constant [10 x i8] c"g_1103.f0\00", align 1
@.str63 = private unnamed_addr constant [10 x i8] c"g_1103.f1\00", align 1
@.str64 = private unnamed_addr constant [10 x i8] c"g_1103.f2\00", align 1
@.str65 = private unnamed_addr constant [10 x i8] c"g_1103.f3\00", align 1
@.str66 = private unnamed_addr constant [10 x i8] c"g_1103.f4\00", align 1
@g_1114 = internal global [1 x i8] c"\F8", align 1
@.str67 = private unnamed_addr constant [10 x i8] c"g_1114[i]\00", align 1
@g_1427 = internal global i32 -4, align 4
@.str68 = private unnamed_addr constant [7 x i8] c"g_1427\00", align 1
@g_1455 = internal global i8 -5, align 1
@.str69 = private unnamed_addr constant [7 x i8] c"g_1455\00", align 1
@g_1506 = internal global %union.U1 { i64 3303948127294504094 }, align 8
@.str70 = private unnamed_addr constant [10 x i8] c"g_1506.f0\00", align 1
@.str71 = private unnamed_addr constant [10 x i8] c"g_1506.f1\00", align 1
@.str72 = private unnamed_addr constant [10 x i8] c"g_1506.f2\00", align 1
@.str73 = private unnamed_addr constant [10 x i8] c"g_1506.f3\00", align 1
@.str74 = private unnamed_addr constant [10 x i8] c"g_1506.f4\00", align 1
@crc32_context = internal global i32 -1, align 4
@.str75 = private unnamed_addr constant [15 x i8] c"checksum = %X\0A\00", align 1
@.str76 = private unnamed_addr constant [36 x i8] c"...checksum after hashing %s : %lX\0A\00", align 1
@crc32_tab = internal global [256 x i32] zeroinitializer, align 16
@func_1.l_569 = private unnamed_addr constant [10 x [8 x [3 x i32*]]] [[8 x [3 x i32*]] [[3 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_471], [3 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_471], [3 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_471], [3 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_471], [3 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_471], [3 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_471], [3 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_471], [3 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_471]], [8 x [3 x i32*]] [[3 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_471], [3 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_471], [3 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_471], [3 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_471], [3 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_471], [3 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_471], [3 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_471], [3 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_471]], [8 x [3 x i32*]] [[3 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_471], [3 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_471], [3 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_471], [3 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_471], [3 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_471], [3 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_471], [3 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_471], [3 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_471]], [8 x [3 x i32*]] [[3 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_471], [3 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_471], [3 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_471], [3 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_471], [3 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_471], [3 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_471], [3 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_471], [3 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_471]], [8 x [3 x i32*]] [[3 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_471], [3 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_471], [3 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_471], [3 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_471], [3 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_471], [3 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_471], [3 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_471], [3 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_471]], [8 x [3 x i32*]] [[3 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_471], [3 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_471], [3 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_471], [3 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_471], [3 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_471], [3 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_471], [3 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_471], [3 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_471]], [8 x [3 x i32*]] [[3 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_471], [3 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_471], [3 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_471], [3 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_471], [3 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_471], [3 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_471], [3 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_471], [3 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_471]], [8 x [3 x i32*]] [[3 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_471], [3 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_471], [3 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_471], [3 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_471], [3 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_471], [3 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_471], [3 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_471], [3 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_471]], [8 x [3 x i32*]] [[3 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_471], [3 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_471], [3 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_471], [3 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_471], [3 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_471], [3 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_471], [3 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_471], [3 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_471]], [8 x [3 x i32*]] [[3 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_471], [3 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_471], [3 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_471], [3 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_471], [3 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_471], [3 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_471], [3 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_471], [3 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_471]]], align 16
@func_1.l_1462 = private unnamed_addr constant [8 x %union.U0] [%union.U0 { i64 6498973361908278915 }, %union.U0 { i64 3 }, %union.U0 { i64 6498973361908278915 }, %union.U0 { i64 3 }, %union.U0 { i64 6498973361908278915 }, %union.U0 { i64 3 }, %union.U0 { i64 6498973361908278915 }, %union.U0 { i64 3 }], align 16
@g_258 = internal global i32* bitcast (%union.U0* @g_13 to i32*), align 8
@func_1.l_1402 = private unnamed_addr constant [4 x i64] [i64 -1728117263596144478, i64 1, i64 -1728117263596144478, i64 1], align 16
@g_84 = internal global %union.U0* @g_13, align 8
@func_1.l_1419 = private unnamed_addr constant %union.U0 { i64 2296976567446432047 }, align 8
@g_278 = internal global i32* bitcast (%union.U0* @g_13 to i32*), align 8
@func_1.l_1435 = private unnamed_addr constant [5 x [4 x [7 x i32**]]] [[4 x [7 x i32**]] [[7 x i32**] [i32** @g_258, i32** @g_258, i32** @g_258, i32** @g_278, i32** @g_258, i32** @g_258, i32** @g_258], [7 x i32**] [i32** @g_258, i32** @g_258, i32** @g_258, i32** @g_278, i32** @g_258, i32** @g_258, i32** @g_258], [7 x i32**] [i32** @g_258, i32** @g_258, i32** @g_258, i32** @g_278, i32** @g_258, i32** @g_258, i32** @g_258], [7 x i32**] [i32** @g_258, i32** @g_258, i32** @g_258, i32** @g_278, i32** @g_258, i32** @g_258, i32** @g_258]], [4 x [7 x i32**]] [[7 x i32**] [i32** @g_258, i32** @g_258, i32** @g_258, i32** @g_278, i32** @g_258, i32** @g_258, i32** @g_258], [7 x i32**] [i32** @g_258, i32** @g_258, i32** @g_258, i32** @g_278, i32** @g_258, i32** @g_258, i32** @g_258], [7 x i32**] [i32** @g_258, i32** @g_258, i32** @g_258, i32** @g_278, i32** @g_258, i32** @g_258, i32** @g_258], [7 x i32**] [i32** @g_258, i32** @g_258, i32** @g_258, i32** @g_278, i32** @g_258, i32** @g_258, i32** @g_258]], [4 x [7 x i32**]] [[7 x i32**] [i32** @g_258, i32** @g_258, i32** @g_258, i32** @g_278, i32** @g_258, i32** @g_258, i32** @g_258], [7 x i32**] [i32** @g_258, i32** @g_258, i32** @g_258, i32** @g_278, i32** @g_258, i32** @g_258, i32** @g_258], [7 x i32**] [i32** @g_258, i32** @g_258, i32** @g_258, i32** @g_278, i32** @g_258, i32** @g_258, i32** @g_258], [7 x i32**] [i32** @g_258, i32** @g_258, i32** @g_258, i32** @g_278, i32** @g_258, i32** @g_258, i32** @g_258]], [4 x [7 x i32**]] [[7 x i32**] [i32** @g_258, i32** @g_258, i32** @g_258, i32** @g_278, i32** @g_258, i32** @g_258, i32** @g_258], [7 x i32**] [i32** @g_258, i32** @g_258, i32** @g_258, i32** @g_278, i32** @g_258, i32** @g_258, i32** @g_258], [7 x i32**] [i32** @g_258, i32** @g_258, i32** @g_258, i32** @g_278, i32** @g_258, i32** @g_258, i32** @g_258], [7 x i32**] [i32** @g_258, i32** @g_258, i32** @g_258, i32** @g_278, i32** @g_258, i32** @g_258, i32** @g_258]], [4 x [7 x i32**]] [[7 x i32**] [i32** @g_258, i32** @g_258, i32** @g_258, i32** @g_278, i32** @g_258, i32** @g_258, i32** @g_258], [7 x i32**] [i32** @g_258, i32** @g_258, i32** @g_258, i32** @g_278, i32** @g_258, i32** @g_258, i32** @g_258], [7 x i32**] [i32** @g_258, i32** @g_258, i32** @g_258, i32** @g_278, i32** @g_258, i32** @g_258, i32** @g_258], [7 x i32**] [i32** @g_258, i32** @g_258, i32** @g_258, i32** @g_278, i32** @g_258, i32** @g_258, i32** @g_258]]], align 16
@g_134 = internal global i32** null, align 8
@func_1.l_1428 = private unnamed_addr constant [1 x [5 x i32*]] [[5 x i32*] [i32* @g_1427, i32* null, i32* @g_1427, i32* null, i32* @g_1427]], align 16
@func_1.l_1432 = private unnamed_addr constant %union.U0 { i64 1 }, align 8
@g_489 = internal global [4 x i16*] [i16* null, i16* @g_166, i16* null, i16* @g_166], align 16
@g_1426 = internal constant i32* @g_1427, align 8
@g_416 = internal global i16** @g_417, align 8
@g_417 = internal global i16* bitcast (i8* getelementptr (i8* bitcast ([5 x i16]* @g_364 to i8*), i64 4) to i16*), align 8
@g_985 = internal global i16*** @g_416, align 8
@func_1.l_1458 = private unnamed_addr constant %union.U0 { i64 5446981079833881212 }, align 8
@g_1127 = internal global i32* @g_353, align 8
@g_868 = internal global i32* bitcast (i8* getelementptr (i8* bitcast ([6 x [1 x [10 x i32]]]* @g_66 to i8*), i64 40) to i32*), align 8
@g_1522 = internal constant i8** @g_1523, align 8
@g_1524 = internal global i8*** bitcast (i8* getelementptr (i8* bitcast ([9 x i8**]* @g_1525 to i8*), i64 56) to i8***), align 8
@g_65 = internal global i32* bitcast (i8* getelementptr (i8* bitcast ([6 x [1 x [10 x i32]]]* @g_66 to i8*), i64 92) to i32*), align 8
@g_1525 = internal global [9 x i8**] [i8** @g_1523, i8** @g_1523, i8** @g_1523, i8** @g_1523, i8** @g_1523, i8** @g_1523, i8** @g_1523, i8** @g_1523, i8** @g_1523], align 16
@g_1523 = internal global i8* getelementptr inbounds ([1 x i8]* @g_1114, i32 0, i32 0), align 8
@func_45.l_54 = private unnamed_addr constant [8 x [8 x [2 x i32*]]] [[8 x [2 x i32*]] [[2 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*)], [2 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*)], [2 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*)], [2 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*)], [2 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*)], [2 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*)], [2 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*)], [2 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*)]], [8 x [2 x i32*]] [[2 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*)], [2 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*)], [2 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*)], [2 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*)], [2 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*)], [2 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*)], [2 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*)], [2 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*)]], [8 x [2 x i32*]] [[2 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*)], [2 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*)], [2 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*)], [2 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*)], [2 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*)], [2 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*)], [2 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*)], [2 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*)]], [8 x [2 x i32*]] [[2 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*)], [2 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*)], [2 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*)], [2 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*)], [2 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*)], [2 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*)], [2 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*)], [2 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*)]], [8 x [2 x i32*]] [[2 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*)], [2 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*)], [2 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*)], [2 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*)], [2 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*)], [2 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*)], [2 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*)], [2 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*)]], [8 x [2 x i32*]] [[2 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*)], [2 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*)], [2 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*)], [2 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*)], [2 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*)], [2 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*)], [2 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*)], [2 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*)]], [8 x [2 x i32*]] [[2 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*)], [2 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*)], [2 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*)], [2 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*)], [2 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*)], [2 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*)], [2 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*)], [2 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*)]], [8 x [2 x i32*]] [[2 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*)], [2 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*)], [2 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*)], [2 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*)], [2 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*)], [2 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*)], [2 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*)], [2 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (%union.U0* @g_13 to i32*)]]], align 16
@func_45.l_149 = private unnamed_addr constant [10 x i32] [i32 -1714541336, i32 2019860490, i32 -1714541336, i32 2019860490, i32 -1714541336, i32 2019860490, i32 -1714541336, i32 2019860490, i32 -1714541336, i32 2019860490], align 16
@func_45.l_145 = private unnamed_addr constant [3 x [2 x i32]] [[2 x i32] [i32 -1, i32 1855305077], [2 x i32] [i32 -1, i32 1855305077], [2 x i32] [i32 -1, i32 1855305077]], align 16
@g_55 = internal global i32** @g_56, align 8
@func_45.l_96 = private unnamed_addr constant [6 x i32] [i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1], align 16
@func_45.l_62 = private unnamed_addr constant [6 x [8 x i64]] [[8 x i64] [i64 -1, i64 -1, i64 -5, i64 -8882357926947931187, i64 -7246206247032376745, i64 -8784718449897361935, i64 -5, i64 -1], [8 x i64] [i64 -1, i64 -1, i64 -5, i64 -8882357926947931187, i64 -7246206247032376745, i64 -8784718449897361935, i64 -5, i64 -1], [8 x i64] [i64 -1, i64 -1, i64 -5, i64 -8882357926947931187, i64 -7246206247032376745, i64 -8784718449897361935, i64 -5, i64 -1], [8 x i64] [i64 -1, i64 -1, i64 -5, i64 -8882357926947931187, i64 -7246206247032376745, i64 -8784718449897361935, i64 -5, i64 -1], [8 x i64] [i64 -1, i64 -1, i64 -5, i64 -8882357926947931187, i64 -7246206247032376745, i64 -8784718449897361935, i64 -5, i64 -1], [8 x i64] [i64 -1, i64 -1, i64 -5, i64 -8882357926947931187, i64 -7246206247032376745, i64 -8784718449897361935, i64 -5, i64 -1]], align 16
@func_45.l_68 = private unnamed_addr constant [2 x [4 x i32]] [[4 x i32] [i32 -1, i32 1517227733, i32 -1, i32 1517227733], [4 x i32] [i32 -1, i32 1517227733, i32 -1, i32 1517227733]], align 16
@g_83 = internal global %union.U0** @g_84, align 8
@func_45.l_86 = private unnamed_addr constant [10 x [6 x [4 x i32*]]] [[6 x [4 x i32*]] [[4 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_3, i32* bitcast (%union.U0* @g_13 to i32*), i32* null], [4 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_3, i32* bitcast (%union.U0* @g_13 to i32*), i32* null], [4 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_3, i32* bitcast (%union.U0* @g_13 to i32*), i32* null], [4 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_3, i32* bitcast (%union.U0* @g_13 to i32*), i32* null], [4 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_3, i32* bitcast (%union.U0* @g_13 to i32*), i32* null], [4 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_3, i32* bitcast (%union.U0* @g_13 to i32*), i32* null]], [6 x [4 x i32*]] [[4 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_3, i32* bitcast (%union.U0* @g_13 to i32*), i32* null], [4 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_3, i32* bitcast (%union.U0* @g_13 to i32*), i32* null], [4 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_3, i32* bitcast (%union.U0* @g_13 to i32*), i32* null], [4 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_3, i32* bitcast (%union.U0* @g_13 to i32*), i32* null], [4 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_3, i32* bitcast (%union.U0* @g_13 to i32*), i32* null], [4 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_3, i32* bitcast (%union.U0* @g_13 to i32*), i32* null]], [6 x [4 x i32*]] [[4 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_3, i32* bitcast (%union.U0* @g_13 to i32*), i32* null], [4 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_3, i32* bitcast (%union.U0* @g_13 to i32*), i32* null], [4 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_3, i32* bitcast (%union.U0* @g_13 to i32*), i32* null], [4 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_3, i32* bitcast (%union.U0* @g_13 to i32*), i32* null], [4 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_3, i32* bitcast (%union.U0* @g_13 to i32*), i32* null], [4 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_3, i32* bitcast (%union.U0* @g_13 to i32*), i32* null]], [6 x [4 x i32*]] [[4 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_3, i32* bitcast (%union.U0* @g_13 to i32*), i32* null], [4 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_3, i32* bitcast (%union.U0* @g_13 to i32*), i32* null], [4 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_3, i32* bitcast (%union.U0* @g_13 to i32*), i32* null], [4 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_3, i32* bitcast (%union.U0* @g_13 to i32*), i32* null], [4 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_3, i32* bitcast (%union.U0* @g_13 to i32*), i32* null], [4 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_3, i32* bitcast (%union.U0* @g_13 to i32*), i32* null]], [6 x [4 x i32*]] [[4 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_3, i32* bitcast (%union.U0* @g_13 to i32*), i32* null], [4 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_3, i32* bitcast (%union.U0* @g_13 to i32*), i32* null], [4 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_3, i32* bitcast (%union.U0* @g_13 to i32*), i32* null], [4 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_3, i32* bitcast (%union.U0* @g_13 to i32*), i32* null], [4 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_3, i32* bitcast (%union.U0* @g_13 to i32*), i32* null], [4 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_3, i32* bitcast (%union.U0* @g_13 to i32*), i32* null]], [6 x [4 x i32*]] [[4 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_3, i32* bitcast (%union.U0* @g_13 to i32*), i32* null], [4 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_3, i32* bitcast (%union.U0* @g_13 to i32*), i32* null], [4 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_3, i32* bitcast (%union.U0* @g_13 to i32*), i32* null], [4 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_3, i32* bitcast (%union.U0* @g_13 to i32*), i32* null], [4 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_3, i32* bitcast (%union.U0* @g_13 to i32*), i32* null], [4 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_3, i32* bitcast (%union.U0* @g_13 to i32*), i32* null]], [6 x [4 x i32*]] [[4 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_3, i32* bitcast (%union.U0* @g_13 to i32*), i32* null], [4 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_3, i32* bitcast (%union.U0* @g_13 to i32*), i32* null], [4 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_3, i32* bitcast (%union.U0* @g_13 to i32*), i32* null], [4 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_3, i32* bitcast (%union.U0* @g_13 to i32*), i32* null], [4 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_3, i32* bitcast (%union.U0* @g_13 to i32*), i32* null], [4 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_3, i32* bitcast (%union.U0* @g_13 to i32*), i32* null]], [6 x [4 x i32*]] [[4 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_3, i32* bitcast (%union.U0* @g_13 to i32*), i32* null], [4 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_3, i32* bitcast (%union.U0* @g_13 to i32*), i32* null], [4 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_3, i32* bitcast (%union.U0* @g_13 to i32*), i32* null], [4 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_3, i32* bitcast (%union.U0* @g_13 to i32*), i32* null], [4 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_3, i32* bitcast (%union.U0* @g_13 to i32*), i32* null], [4 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_3, i32* bitcast (%union.U0* @g_13 to i32*), i32* null]], [6 x [4 x i32*]] [[4 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_3, i32* bitcast (%union.U0* @g_13 to i32*), i32* null], [4 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_3, i32* bitcast (%union.U0* @g_13 to i32*), i32* null], [4 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_3, i32* bitcast (%union.U0* @g_13 to i32*), i32* null], [4 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_3, i32* bitcast (%union.U0* @g_13 to i32*), i32* null], [4 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_3, i32* bitcast (%union.U0* @g_13 to i32*), i32* null], [4 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_3, i32* bitcast (%union.U0* @g_13 to i32*), i32* null]], [6 x [4 x i32*]] [[4 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_3, i32* bitcast (%union.U0* @g_13 to i32*), i32* null], [4 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_3, i32* bitcast (%union.U0* @g_13 to i32*), i32* null], [4 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_3, i32* bitcast (%union.U0* @g_13 to i32*), i32* null], [4 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_3, i32* bitcast (%union.U0* @g_13 to i32*), i32* null], [4 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_3, i32* bitcast (%union.U0* @g_13 to i32*), i32* null], [4 x i32*] [i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_3, i32* bitcast (%union.U0* @g_13 to i32*), i32* null]]], align 16
@g_106 = internal global %union.U0** @g_84, align 8
@g_132 = internal global %union.U1** @g_133, align 8
@g_56 = internal global i32* @g_3, align 8
@func_45.l_212 = private unnamed_addr constant [9 x [10 x [2 x i32]]] [[10 x [2 x i32]] [[2 x i32] [i32 36753899, i32 2119384184], [2 x i32] [i32 36753899, i32 2119384184], [2 x i32] [i32 36753899, i32 2119384184], [2 x i32] [i32 36753899, i32 2119384184], [2 x i32] [i32 36753899, i32 2119384184], [2 x i32] [i32 36753899, i32 2119384184], [2 x i32] [i32 36753899, i32 2119384184], [2 x i32] [i32 36753899, i32 2119384184], [2 x i32] [i32 36753899, i32 2119384184], [2 x i32] [i32 36753899, i32 2119384184]], [10 x [2 x i32]] [[2 x i32] [i32 36753899, i32 2119384184], [2 x i32] [i32 36753899, i32 2119384184], [2 x i32] [i32 36753899, i32 2119384184], [2 x i32] [i32 36753899, i32 2119384184], [2 x i32] [i32 36753899, i32 2119384184], [2 x i32] [i32 36753899, i32 2119384184], [2 x i32] [i32 36753899, i32 2119384184], [2 x i32] [i32 36753899, i32 2119384184], [2 x i32] [i32 36753899, i32 2119384184], [2 x i32] [i32 36753899, i32 2119384184]], [10 x [2 x i32]] [[2 x i32] [i32 36753899, i32 2119384184], [2 x i32] [i32 36753899, i32 2119384184], [2 x i32] [i32 36753899, i32 2119384184], [2 x i32] [i32 36753899, i32 2119384184], [2 x i32] [i32 36753899, i32 2119384184], [2 x i32] [i32 36753899, i32 2119384184], [2 x i32] [i32 36753899, i32 2119384184], [2 x i32] [i32 36753899, i32 2119384184], [2 x i32] [i32 36753899, i32 2119384184], [2 x i32] [i32 36753899, i32 2119384184]], [10 x [2 x i32]] [[2 x i32] [i32 36753899, i32 2119384184], [2 x i32] [i32 36753899, i32 2119384184], [2 x i32] [i32 36753899, i32 2119384184], [2 x i32] [i32 36753899, i32 2119384184], [2 x i32] [i32 36753899, i32 2119384184], [2 x i32] [i32 36753899, i32 2119384184], [2 x i32] [i32 36753899, i32 2119384184], [2 x i32] [i32 36753899, i32 2119384184], [2 x i32] [i32 36753899, i32 2119384184], [2 x i32] [i32 36753899, i32 2119384184]], [10 x [2 x i32]] [[2 x i32] [i32 36753899, i32 2119384184], [2 x i32] [i32 36753899, i32 2119384184], [2 x i32] [i32 36753899, i32 2119384184], [2 x i32] [i32 36753899, i32 2119384184], [2 x i32] [i32 36753899, i32 2119384184], [2 x i32] [i32 36753899, i32 2119384184], [2 x i32] [i32 36753899, i32 2119384184], [2 x i32] [i32 36753899, i32 2119384184], [2 x i32] [i32 36753899, i32 2119384184], [2 x i32] [i32 36753899, i32 2119384184]], [10 x [2 x i32]] [[2 x i32] [i32 36753899, i32 2119384184], [2 x i32] [i32 36753899, i32 2119384184], [2 x i32] [i32 36753899, i32 2119384184], [2 x i32] [i32 36753899, i32 2119384184], [2 x i32] [i32 36753899, i32 2119384184], [2 x i32] [i32 36753899, i32 2119384184], [2 x i32] [i32 36753899, i32 2119384184], [2 x i32] [i32 36753899, i32 2119384184], [2 x i32] [i32 36753899, i32 2119384184], [2 x i32] [i32 36753899, i32 2119384184]], [10 x [2 x i32]] [[2 x i32] [i32 36753899, i32 2119384184], [2 x i32] [i32 36753899, i32 2119384184], [2 x i32] [i32 36753899, i32 2119384184], [2 x i32] [i32 36753899, i32 2119384184], [2 x i32] [i32 36753899, i32 2119384184], [2 x i32] [i32 36753899, i32 2119384184], [2 x i32] [i32 36753899, i32 2119384184], [2 x i32] [i32 36753899, i32 2119384184], [2 x i32] [i32 36753899, i32 2119384184], [2 x i32] [i32 36753899, i32 2119384184]], [10 x [2 x i32]] [[2 x i32] [i32 36753899, i32 2119384184], [2 x i32] [i32 36753899, i32 2119384184], [2 x i32] [i32 36753899, i32 2119384184], [2 x i32] [i32 36753899, i32 2119384184], [2 x i32] [i32 36753899, i32 2119384184], [2 x i32] [i32 36753899, i32 2119384184], [2 x i32] [i32 36753899, i32 2119384184], [2 x i32] [i32 36753899, i32 2119384184], [2 x i32] [i32 36753899, i32 2119384184], [2 x i32] [i32 36753899, i32 2119384184]], [10 x [2 x i32]] [[2 x i32] [i32 36753899, i32 2119384184], [2 x i32] [i32 36753899, i32 2119384184], [2 x i32] [i32 36753899, i32 2119384184], [2 x i32] [i32 36753899, i32 2119384184], [2 x i32] [i32 36753899, i32 2119384184], [2 x i32] [i32 36753899, i32 2119384184], [2 x i32] [i32 36753899, i32 2119384184], [2 x i32] [i32 36753899, i32 2119384184], [2 x i32] [i32 36753899, i32 2119384184], [2 x i32] [i32 36753899, i32 2119384184]]], align 16
@g_220 = internal global %union.U1** @g_133, align 8
@g_133 = internal global %union.U1* @g_130, align 8
@func_22.l_458 = private unnamed_addr constant [7 x i32] [i32 -413362149, i32 -413362149, i32 -596823674, i32 -413362149, i32 -413362149, i32 -596823674, i32 -413362149], align 16
@func_22.l_354 = private unnamed_addr constant [2 x [6 x i32]] [[6 x i32] [i32 8, i32 69726516, i32 0, i32 0, i32 69726516, i32 8], [6 x i32] [i32 8, i32 69726516, i32 0, i32 0, i32 69726516, i32 8]], align 16
@func_22.l_558 = private unnamed_addr constant [6 x [6 x [3 x i32]]] [[6 x [3 x i32]] [[3 x i32] [i32 9, i32 -1, i32 -8], [3 x i32] [i32 9, i32 -1, i32 -8], [3 x i32] [i32 9, i32 -1, i32 -8], [3 x i32] [i32 9, i32 -1, i32 -8], [3 x i32] [i32 9, i32 -1, i32 -8], [3 x i32] [i32 9, i32 -1, i32 -8]], [6 x [3 x i32]] [[3 x i32] [i32 9, i32 -1, i32 -8], [3 x i32] [i32 9, i32 -1, i32 -8], [3 x i32] [i32 9, i32 -1, i32 -8], [3 x i32] [i32 9, i32 -1, i32 -8], [3 x i32] [i32 9, i32 -1, i32 -8], [3 x i32] [i32 9, i32 -1, i32 -8]], [6 x [3 x i32]] [[3 x i32] [i32 9, i32 -1, i32 -8], [3 x i32] [i32 9, i32 -1, i32 -8], [3 x i32] [i32 9, i32 -1, i32 -8], [3 x i32] [i32 9, i32 -1, i32 -8], [3 x i32] [i32 9, i32 -1, i32 -8], [3 x i32] [i32 9, i32 -1, i32 -8]], [6 x [3 x i32]] [[3 x i32] [i32 9, i32 -1, i32 -8], [3 x i32] [i32 9, i32 -1, i32 -8], [3 x i32] [i32 9, i32 -1, i32 -8], [3 x i32] [i32 9, i32 -1, i32 -8], [3 x i32] [i32 9, i32 -1, i32 -8], [3 x i32] [i32 9, i32 -1, i32 -8]], [6 x [3 x i32]] [[3 x i32] [i32 9, i32 -1, i32 -8], [3 x i32] [i32 9, i32 -1, i32 -8], [3 x i32] [i32 9, i32 -1, i32 -8], [3 x i32] [i32 9, i32 -1, i32 -8], [3 x i32] [i32 9, i32 -1, i32 -8], [3 x i32] [i32 9, i32 -1, i32 -8]], [6 x [3 x i32]] [[3 x i32] [i32 9, i32 -1, i32 -8], [3 x i32] [i32 9, i32 -1, i32 -8], [3 x i32] [i32 9, i32 -1, i32 -8], [3 x i32] [i32 9, i32 -1, i32 -8], [3 x i32] [i32 9, i32 -1, i32 -8], [3 x i32] [i32 9, i32 -1, i32 -8]]], align 16
@func_18.l_572 = private unnamed_addr constant [7 x [9 x i32*]] [[9 x i32*] [i32* @g_3, i32* @g_3, i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_3, i32* @g_3, i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([6 x [1 x [10 x i32]]]* @g_66 to i8*), i64 92) to i32*), i32* @g_3, i32* bitcast (%union.U0* @g_13 to i32*)], [9 x i32*] [i32* @g_3, i32* @g_3, i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_3, i32* @g_3, i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([6 x [1 x [10 x i32]]]* @g_66 to i8*), i64 92) to i32*), i32* @g_3, i32* bitcast (%union.U0* @g_13 to i32*)], [9 x i32*] [i32* @g_3, i32* @g_3, i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_3, i32* @g_3, i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([6 x [1 x [10 x i32]]]* @g_66 to i8*), i64 92) to i32*), i32* @g_3, i32* bitcast (%union.U0* @g_13 to i32*)], [9 x i32*] [i32* @g_3, i32* @g_3, i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_3, i32* @g_3, i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([6 x [1 x [10 x i32]]]* @g_66 to i8*), i64 92) to i32*), i32* @g_3, i32* bitcast (%union.U0* @g_13 to i32*)], [9 x i32*] [i32* @g_3, i32* @g_3, i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_3, i32* @g_3, i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([6 x [1 x [10 x i32]]]* @g_66 to i8*), i64 92) to i32*), i32* @g_3, i32* bitcast (%union.U0* @g_13 to i32*)], [9 x i32*] [i32* @g_3, i32* @g_3, i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_3, i32* @g_3, i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([6 x [1 x [10 x i32]]]* @g_66 to i8*), i64 92) to i32*), i32* @g_3, i32* bitcast (%union.U0* @g_13 to i32*)], [9 x i32*] [i32* @g_3, i32* @g_3, i32* bitcast (%union.U0* @g_13 to i32*), i32* @g_3, i32* @g_3, i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([6 x [1 x [10 x i32]]]* @g_66 to i8*), i64 92) to i32*), i32* @g_3, i32* bitcast (%union.U0* @g_13 to i32*)]], align 16
@func_16.l_616 = private unnamed_addr constant [5 x [8 x %union.U0**]] [[8 x %union.U0**] [%union.U0** @g_84, %union.U0** @g_84, %union.U0** @g_84, %union.U0** @g_84, %union.U0** @g_84, %union.U0** @g_84, %union.U0** @g_84, %union.U0** @g_84], [8 x %union.U0**] [%union.U0** @g_84, %union.U0** @g_84, %union.U0** @g_84, %union.U0** @g_84, %union.U0** @g_84, %union.U0** @g_84, %union.U0** @g_84, %union.U0** @g_84], [8 x %union.U0**] [%union.U0** @g_84, %union.U0** @g_84, %union.U0** @g_84, %union.U0** @g_84, %union.U0** @g_84, %union.U0** @g_84, %union.U0** @g_84, %union.U0** @g_84], [8 x %union.U0**] [%union.U0** @g_84, %union.U0** @g_84, %union.U0** @g_84, %union.U0** @g_84, %union.U0** @g_84, %union.U0** @g_84, %union.U0** @g_84, %union.U0** @g_84], [8 x %union.U0**] [%union.U0** @g_84, %union.U0** @g_84, %union.U0** @g_84, %union.U0** @g_84, %union.U0** @g_84, %union.U0** @g_84, %union.U0** @g_84, %union.U0** @g_84]], align 16
@g_619 = internal global %union.U0** @g_84, align 8
@func_16.l_723 = private unnamed_addr constant [10 x [8 x i32]] [[8 x i32] [i32 0, i32 508454726, i32 0, i32 508454726, i32 0, i32 508454726, i32 0, i32 508454726], [8 x i32] [i32 0, i32 508454726, i32 0, i32 508454726, i32 0, i32 508454726, i32 0, i32 508454726], [8 x i32] [i32 0, i32 508454726, i32 0, i32 508454726, i32 0, i32 508454726, i32 0, i32 508454726], [8 x i32] [i32 0, i32 508454726, i32 0, i32 508454726, i32 0, i32 508454726, i32 0, i32 508454726], [8 x i32] [i32 0, i32 508454726, i32 0, i32 508454726, i32 0, i32 508454726, i32 0, i32 508454726], [8 x i32] [i32 0, i32 508454726, i32 0, i32 508454726, i32 0, i32 508454726, i32 0, i32 508454726], [8 x i32] [i32 0, i32 508454726, i32 0, i32 508454726, i32 0, i32 508454726, i32 0, i32 508454726], [8 x i32] [i32 0, i32 508454726, i32 0, i32 508454726, i32 0, i32 508454726, i32 0, i32 508454726], [8 x i32] [i32 0, i32 508454726, i32 0, i32 508454726, i32 0, i32 508454726, i32 0, i32 508454726], [8 x i32] [i32 0, i32 508454726, i32 0, i32 508454726, i32 0, i32 508454726, i32 0, i32 508454726]], align 16
@func_16.l_845 = private unnamed_addr constant [10 x [2 x [8 x %union.U1*]]] [[2 x [8 x %union.U1*]] [[8 x %union.U1*] [%union.U1* null, %union.U1* @g_674, %union.U1* @g_815, %union.U1* null, %union.U1* @g_674, %union.U1* @g_674, %union.U1* @g_130, %union.U1* null], [8 x %union.U1*] [%union.U1* null, %union.U1* @g_674, %union.U1* @g_815, %union.U1* null, %union.U1* @g_674, %union.U1* @g_674, %union.U1* @g_130, %union.U1* null]], [2 x [8 x %union.U1*]] [[8 x %union.U1*] [%union.U1* null, %union.U1* @g_674, %union.U1* @g_815, %union.U1* null, %union.U1* @g_674, %union.U1* @g_674, %union.U1* @g_130, %union.U1* null], [8 x %union.U1*] [%union.U1* null, %union.U1* @g_674, %union.U1* @g_815, %union.U1* null, %union.U1* @g_674, %union.U1* @g_674, %union.U1* @g_130, %union.U1* null]], [2 x [8 x %union.U1*]] [[8 x %union.U1*] [%union.U1* null, %union.U1* @g_674, %union.U1* @g_815, %union.U1* null, %union.U1* @g_674, %union.U1* @g_674, %union.U1* @g_130, %union.U1* null], [8 x %union.U1*] [%union.U1* null, %union.U1* @g_674, %union.U1* @g_815, %union.U1* null, %union.U1* @g_674, %union.U1* @g_674, %union.U1* @g_130, %union.U1* null]], [2 x [8 x %union.U1*]] [[8 x %union.U1*] [%union.U1* null, %union.U1* @g_674, %union.U1* @g_815, %union.U1* null, %union.U1* @g_674, %union.U1* @g_674, %union.U1* @g_130, %union.U1* null], [8 x %union.U1*] [%union.U1* null, %union.U1* @g_674, %union.U1* @g_815, %union.U1* null, %union.U1* @g_674, %union.U1* @g_674, %union.U1* @g_130, %union.U1* null]], [2 x [8 x %union.U1*]] [[8 x %union.U1*] [%union.U1* null, %union.U1* @g_674, %union.U1* @g_815, %union.U1* null, %union.U1* @g_674, %union.U1* @g_674, %union.U1* @g_130, %union.U1* null], [8 x %union.U1*] [%union.U1* null, %union.U1* @g_674, %union.U1* @g_815, %union.U1* null, %union.U1* @g_674, %union.U1* @g_674, %union.U1* @g_130, %union.U1* null]], [2 x [8 x %union.U1*]] [[8 x %union.U1*] [%union.U1* null, %union.U1* @g_674, %union.U1* @g_815, %union.U1* null, %union.U1* @g_674, %union.U1* @g_674, %union.U1* @g_130, %union.U1* null], [8 x %union.U1*] [%union.U1* null, %union.U1* @g_674, %union.U1* @g_815, %union.U1* null, %union.U1* @g_674, %union.U1* @g_674, %union.U1* @g_130, %union.U1* null]], [2 x [8 x %union.U1*]] [[8 x %union.U1*] [%union.U1* null, %union.U1* @g_674, %union.U1* @g_815, %union.U1* null, %union.U1* @g_674, %union.U1* @g_674, %union.U1* @g_130, %union.U1* null], [8 x %union.U1*] [%union.U1* null, %union.U1* @g_674, %union.U1* @g_815, %union.U1* null, %union.U1* @g_674, %union.U1* @g_674, %union.U1* @g_130, %union.U1* null]], [2 x [8 x %union.U1*]] [[8 x %union.U1*] [%union.U1* null, %union.U1* @g_674, %union.U1* @g_815, %union.U1* null, %union.U1* @g_674, %union.U1* @g_674, %union.U1* @g_130, %union.U1* null], [8 x %union.U1*] [%union.U1* null, %union.U1* @g_674, %union.U1* @g_815, %union.U1* null, %union.U1* @g_674, %union.U1* @g_674, %union.U1* @g_130, %union.U1* null]], [2 x [8 x %union.U1*]] [[8 x %union.U1*] [%union.U1* null, %union.U1* @g_674, %union.U1* @g_815, %union.U1* null, %union.U1* @g_674, %union.U1* @g_674, %union.U1* @g_130, %union.U1* null], [8 x %union.U1*] [%union.U1* null, %union.U1* @g_674, %union.U1* @g_815, %union.U1* null, %union.U1* @g_674, %union.U1* @g_674, %union.U1* @g_130, %union.U1* null]], [2 x [8 x %union.U1*]] [[8 x %union.U1*] [%union.U1* null, %union.U1* @g_674, %union.U1* @g_815, %union.U1* null, %union.U1* @g_674, %union.U1* @g_674, %union.U1* @g_130, %union.U1* null], [8 x %union.U1*] [%union.U1* null, %union.U1* @g_674, %union.U1* @g_815, %union.U1* null, %union.U1* @g_674, %union.U1* @g_674, %union.U1* @g_130, %union.U1* null]]], align 16
@func_16.l_612 = private unnamed_addr constant %union.U0 { i64 5 }, align 8
@func_16.l_732 = private unnamed_addr constant [10 x %union.U0] [%union.U0 { i64 1 }, %union.U0 { i64 6394436690758783814 }, %union.U0 { i64 1 }, %union.U0 { i64 6394436690758783814 }, %union.U0 { i64 1 }, %union.U0 { i64 6394436690758783814 }, %union.U0 { i64 1 }, %union.U0 { i64 6394436690758783814 }, %union.U0 { i64 1 }, %union.U0 { i64 6394436690758783814 }], align 16
@func_16.l_621 = private unnamed_addr constant [4 x i64*] [i64* @g_49, i64* @g_49, i64* @g_49, i64* @g_49], align 16
@func_16.l_623 = private unnamed_addr constant [8 x i32] [i32 -4, i32 -1973064916, i32 -4, i32 -1973064916, i32 -4, i32 -1973064916, i32 -4, i32 -1973064916], align 16
@g_618 = internal global %union.U0*** @g_619, align 8
@g_639 = internal constant i32 -663374844, align 4
@g_434 = internal constant i8 -6, align 1
@func_16.l_670 = private unnamed_addr constant [10 x i32] [i32 -1296464779, i32 155017619, i32 -1296464779, i32 155017619, i32 -1296464779, i32 155017619, i32 -1296464779, i32 155017619, i32 -1296464779, i32 155017619], align 16
@func_16.l_719 = private unnamed_addr constant [7 x i16] [i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1], align 2
@func_16.l_725 = private unnamed_addr constant [6 x [4 x i32]] [[4 x i32] [i32 -1164742704, i32 1720939403, i32 -1136390224, i32 -2110768762], [4 x i32] [i32 -1164742704, i32 1720939403, i32 -1136390224, i32 -2110768762], [4 x i32] [i32 -1164742704, i32 1720939403, i32 -1136390224, i32 -2110768762], [4 x i32] [i32 -1164742704, i32 1720939403, i32 -1136390224, i32 -2110768762], [4 x i32] [i32 -1164742704, i32 1720939403, i32 -1136390224, i32 -2110768762], [4 x i32] [i32 -1164742704, i32 1720939403, i32 -1136390224, i32 -2110768762]], align 16
@g_81 = internal global [5 x [9 x i32*]] [[9 x i32*] [i32* @g_3, i32* null, i32* bitcast (i8* getelementptr (i8* bitcast ([6 x [1 x [10 x i32]]]* @g_66 to i8*), i64 92) to i32*), i32* null, i32* null, i32* null, i32* @g_3, i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([6 x [1 x [10 x i32]]]* @g_66 to i8*), i64 88) to i32*)], [9 x i32*] [i32* @g_3, i32* null, i32* bitcast (i8* getelementptr (i8* bitcast ([6 x [1 x [10 x i32]]]* @g_66 to i8*), i64 92) to i32*), i32* null, i32* null, i32* null, i32* @g_3, i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([6 x [1 x [10 x i32]]]* @g_66 to i8*), i64 88) to i32*)], [9 x i32*] [i32* @g_3, i32* null, i32* bitcast (i8* getelementptr (i8* bitcast ([6 x [1 x [10 x i32]]]* @g_66 to i8*), i64 92) to i32*), i32* null, i32* null, i32* null, i32* @g_3, i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([6 x [1 x [10 x i32]]]* @g_66 to i8*), i64 88) to i32*)], [9 x i32*] [i32* @g_3, i32* null, i32* bitcast (i8* getelementptr (i8* bitcast ([6 x [1 x [10 x i32]]]* @g_66 to i8*), i64 92) to i32*), i32* null, i32* null, i32* null, i32* @g_3, i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([6 x [1 x [10 x i32]]]* @g_66 to i8*), i64 88) to i32*)], [9 x i32*] [i32* @g_3, i32* null, i32* bitcast (i8* getelementptr (i8* bitcast ([6 x [1 x [10 x i32]]]* @g_66 to i8*), i64 92) to i32*), i32* null, i32* null, i32* null, i32* @g_3, i32* bitcast (%union.U0* @g_13 to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([6 x [1 x [10 x i32]]]* @g_66 to i8*), i64 88) to i32*)]], align 16
@func_16.l_795 = private unnamed_addr constant %union.U0 { i64 1 }, align 8
@func_16.l_808 = private unnamed_addr constant [6 x [8 x i16*]] [[8 x i16*] [i16* bitcast (i8* getelementptr (i8* bitcast ([5 x i16]* @g_364 to i8*), i64 4) to i16*), i16* bitcast (i8* getelementptr (i8* bitcast ([5 x i16]* @g_364 to i8*), i64 2) to i16*), i16* @g_809, i16* bitcast (i8* getelementptr (i8* bitcast ([5 x i16]* @g_364 to i8*), i64 4) to i16*), i16* bitcast (i8* getelementptr (i8* bitcast ([5 x i16]* @g_364 to i8*), i64 8) to i16*), i16* bitcast (i8* getelementptr (i8* bitcast ([5 x i16]* @g_364 to i8*), i64 4) to i16*), i16* bitcast (i8* getelementptr (i8* bitcast ([5 x i16]* @g_364 to i8*), i64 4) to i16*), i16* null], [8 x i16*] [i16* bitcast (i8* getelementptr (i8* bitcast ([5 x i16]* @g_364 to i8*), i64 4) to i16*), i16* bitcast (i8* getelementptr (i8* bitcast ([5 x i16]* @g_364 to i8*), i64 2) to i16*), i16* @g_809, i16* bitcast (i8* getelementptr (i8* bitcast ([5 x i16]* @g_364 to i8*), i64 4) to i16*), i16* bitcast (i8* getelementptr (i8* bitcast ([5 x i16]* @g_364 to i8*), i64 8) to i16*), i16* bitcast (i8* getelementptr (i8* bitcast ([5 x i16]* @g_364 to i8*), i64 4) to i16*), i16* bitcast (i8* getelementptr (i8* bitcast ([5 x i16]* @g_364 to i8*), i64 4) to i16*), i16* null], [8 x i16*] [i16* bitcast (i8* getelementptr (i8* bitcast ([5 x i16]* @g_364 to i8*), i64 4) to i16*), i16* bitcast (i8* getelementptr (i8* bitcast ([5 x i16]* @g_364 to i8*), i64 2) to i16*), i16* @g_809, i16* bitcast (i8* getelementptr (i8* bitcast ([5 x i16]* @g_364 to i8*), i64 4) to i16*), i16* bitcast (i8* getelementptr (i8* bitcast ([5 x i16]* @g_364 to i8*), i64 8) to i16*), i16* bitcast (i8* getelementptr (i8* bitcast ([5 x i16]* @g_364 to i8*), i64 4) to i16*), i16* bitcast (i8* getelementptr (i8* bitcast ([5 x i16]* @g_364 to i8*), i64 4) to i16*), i16* null], [8 x i16*] [i16* bitcast (i8* getelementptr (i8* bitcast ([5 x i16]* @g_364 to i8*), i64 4) to i16*), i16* bitcast (i8* getelementptr (i8* bitcast ([5 x i16]* @g_364 to i8*), i64 2) to i16*), i16* @g_809, i16* bitcast (i8* getelementptr (i8* bitcast ([5 x i16]* @g_364 to i8*), i64 4) to i16*), i16* bitcast (i8* getelementptr (i8* bitcast ([5 x i16]* @g_364 to i8*), i64 8) to i16*), i16* bitcast (i8* getelementptr (i8* bitcast ([5 x i16]* @g_364 to i8*), i64 4) to i16*), i16* bitcast (i8* getelementptr (i8* bitcast ([5 x i16]* @g_364 to i8*), i64 4) to i16*), i16* null], [8 x i16*] [i16* bitcast (i8* getelementptr (i8* bitcast ([5 x i16]* @g_364 to i8*), i64 4) to i16*), i16* bitcast (i8* getelementptr (i8* bitcast ([5 x i16]* @g_364 to i8*), i64 2) to i16*), i16* @g_809, i16* bitcast (i8* getelementptr (i8* bitcast ([5 x i16]* @g_364 to i8*), i64 4) to i16*), i16* bitcast (i8* getelementptr (i8* bitcast ([5 x i16]* @g_364 to i8*), i64 8) to i16*), i16* bitcast (i8* getelementptr (i8* bitcast ([5 x i16]* @g_364 to i8*), i64 4) to i16*), i16* bitcast (i8* getelementptr (i8* bitcast ([5 x i16]* @g_364 to i8*), i64 4) to i16*), i16* null], [8 x i16*] [i16* bitcast (i8* getelementptr (i8* bitcast ([5 x i16]* @g_364 to i8*), i64 4) to i16*), i16* bitcast (i8* getelementptr (i8* bitcast ([5 x i16]* @g_364 to i8*), i64 2) to i16*), i16* @g_809, i16* bitcast (i8* getelementptr (i8* bitcast ([5 x i16]* @g_364 to i8*), i64 4) to i16*), i16* bitcast (i8* getelementptr (i8* bitcast ([5 x i16]* @g_364 to i8*), i64 8) to i16*), i16* bitcast (i8* getelementptr (i8* bitcast ([5 x i16]* @g_364 to i8*), i64 4) to i16*), i16* bitcast (i8* getelementptr (i8* bitcast ([5 x i16]* @g_364 to i8*), i64 4) to i16*), i16* null]], align 16
@g_780 = internal global [7 x i32***] [i32*** @g_134, i32*** @g_134, i32*** @g_134, i32*** @g_134, i32*** @g_134, i32*** @g_134, i32*** @g_134], align 16
@func_16.l_826 = private unnamed_addr constant [5 x i8] c"\C5\07\C5\07\C5", align 1
@func_7.l_899 = private unnamed_addr constant [7 x [1 x i16*]] [[1 x i16*] [i16* bitcast (%union.U1* @g_815 to i16*)], [1 x i16*] [i16* bitcast (%union.U1* @g_815 to i16*)], [1 x i16*] [i16* bitcast (%union.U1* @g_815 to i16*)], [1 x i16*] [i16* bitcast (%union.U1* @g_815 to i16*)], [1 x i16*] [i16* bitcast (%union.U1* @g_815 to i16*)], [1 x i16*] [i16* bitcast (%union.U1* @g_815 to i16*)], [1 x i16*] [i16* bitcast (%union.U1* @g_815 to i16*)]], align 16
@func_7.l_1035 = private unnamed_addr constant [3 x [8 x [5 x i32]]] [[8 x [5 x i32]] [[5 x i32] [i32 1406955587, i32 -584539520, i32 -1, i32 -1, i32 2041226391], [5 x i32] [i32 1406955587, i32 -584539520, i32 -1, i32 -1, i32 2041226391], [5 x i32] [i32 1406955587, i32 -584539520, i32 -1, i32 -1, i32 2041226391], [5 x i32] [i32 1406955587, i32 -584539520, i32 -1, i32 -1, i32 2041226391], [5 x i32] [i32 1406955587, i32 -584539520, i32 -1, i32 -1, i32 2041226391], [5 x i32] [i32 1406955587, i32 -584539520, i32 -1, i32 -1, i32 2041226391], [5 x i32] [i32 1406955587, i32 -584539520, i32 -1, i32 -1, i32 2041226391], [5 x i32] [i32 1406955587, i32 -584539520, i32 -1, i32 -1, i32 2041226391]], [8 x [5 x i32]] [[5 x i32] [i32 1406955587, i32 -584539520, i32 -1, i32 -1, i32 2041226391], [5 x i32] [i32 1406955587, i32 -584539520, i32 -1, i32 -1, i32 2041226391], [5 x i32] [i32 1406955587, i32 -584539520, i32 -1, i32 -1, i32 2041226391], [5 x i32] [i32 1406955587, i32 -584539520, i32 -1, i32 -1, i32 2041226391], [5 x i32] [i32 1406955587, i32 -584539520, i32 -1, i32 -1, i32 2041226391], [5 x i32] [i32 1406955587, i32 -584539520, i32 -1, i32 -1, i32 2041226391], [5 x i32] [i32 1406955587, i32 -584539520, i32 -1, i32 -1, i32 2041226391], [5 x i32] [i32 1406955587, i32 -584539520, i32 -1, i32 -1, i32 2041226391]], [8 x [5 x i32]] [[5 x i32] [i32 1406955587, i32 -584539520, i32 -1, i32 -1, i32 2041226391], [5 x i32] [i32 1406955587, i32 -584539520, i32 -1, i32 -1, i32 2041226391], [5 x i32] [i32 1406955587, i32 -584539520, i32 -1, i32 -1, i32 2041226391], [5 x i32] [i32 1406955587, i32 -584539520, i32 -1, i32 -1, i32 2041226391], [5 x i32] [i32 1406955587, i32 -584539520, i32 -1, i32 -1, i32 2041226391], [5 x i32] [i32 1406955587, i32 -584539520, i32 -1, i32 -1, i32 2041226391], [5 x i32] [i32 1406955587, i32 -584539520, i32 -1, i32 -1, i32 2041226391], [5 x i32] [i32 1406955587, i32 -584539520, i32 -1, i32 -1, i32 2041226391]]], align 16
@func_7.l_1111 = private unnamed_addr constant [6 x [1 x [2 x i32]]] [[1 x [2 x i32]] [[2 x i32] [i32 923402368, i32 923402368]], [1 x [2 x i32]] [[2 x i32] [i32 923402368, i32 923402368]], [1 x [2 x i32]] [[2 x i32] [i32 923402368, i32 923402368]], [1 x [2 x i32]] [[2 x i32] [i32 923402368, i32 923402368]], [1 x [2 x i32]] [[2 x i32] [i32 923402368, i32 923402368]], [1 x [2 x i32]] [[2 x i32] [i32 923402368, i32 923402368]]], align 16
@func_7.l_1144 = private unnamed_addr constant [10 x [8 x [1 x i16]]] [[8 x [1 x i16]] [[1 x i16] [i16 1], [1 x i16] [i16 1], [1 x i16] [i16 1], [1 x i16] [i16 1], [1 x i16] [i16 1], [1 x i16] [i16 1], [1 x i16] [i16 1], [1 x i16] [i16 1]], [8 x [1 x i16]] [[1 x i16] [i16 1], [1 x i16] [i16 1], [1 x i16] [i16 1], [1 x i16] [i16 1], [1 x i16] [i16 1], [1 x i16] [i16 1], [1 x i16] [i16 1], [1 x i16] [i16 1]], [8 x [1 x i16]] [[1 x i16] [i16 1], [1 x i16] [i16 1], [1 x i16] [i16 1], [1 x i16] [i16 1], [1 x i16] [i16 1], [1 x i16] [i16 1], [1 x i16] [i16 1], [1 x i16] [i16 1]], [8 x [1 x i16]] [[1 x i16] [i16 1], [1 x i16] [i16 1], [1 x i16] [i16 1], [1 x i16] [i16 1], [1 x i16] [i16 1], [1 x i16] [i16 1], [1 x i16] [i16 1], [1 x i16] [i16 1]], [8 x [1 x i16]] [[1 x i16] [i16 1], [1 x i16] [i16 1], [1 x i16] [i16 1], [1 x i16] [i16 1], [1 x i16] [i16 1], [1 x i16] [i16 1], [1 x i16] [i16 1], [1 x i16] [i16 1]], [8 x [1 x i16]] [[1 x i16] [i16 1], [1 x i16] [i16 1], [1 x i16] [i16 1], [1 x i16] [i16 1], [1 x i16] [i16 1], [1 x i16] [i16 1], [1 x i16] [i16 1], [1 x i16] [i16 1]], [8 x [1 x i16]] [[1 x i16] [i16 1], [1 x i16] [i16 1], [1 x i16] [i16 1], [1 x i16] [i16 1], [1 x i16] [i16 1], [1 x i16] [i16 1], [1 x i16] [i16 1], [1 x i16] [i16 1]], [8 x [1 x i16]] [[1 x i16] [i16 1], [1 x i16] [i16 1], [1 x i16] [i16 1], [1 x i16] [i16 1], [1 x i16] [i16 1], [1 x i16] [i16 1], [1 x i16] [i16 1], [1 x i16] [i16 1]], [8 x [1 x i16]] [[1 x i16] [i16 1], [1 x i16] [i16 1], [1 x i16] [i16 1], [1 x i16] [i16 1], [1 x i16] [i16 1], [1 x i16] [i16 1], [1 x i16] [i16 1], [1 x i16] [i16 1]], [8 x [1 x i16]] [[1 x i16] [i16 1], [1 x i16] [i16 1], [1 x i16] [i16 1], [1 x i16] [i16 1], [1 x i16] [i16 1], [1 x i16] [i16 1], [1 x i16] [i16 1], [1 x i16] [i16 1]]], align 16
@func_7.l_944 = private unnamed_addr constant [8 x [4 x [2 x i32**]]] [[4 x [2 x i32**]] [[2 x i32**] [i32** @g_278, i32** @g_258], [2 x i32**] [i32** @g_278, i32** @g_258], [2 x i32**] [i32** @g_278, i32** @g_258], [2 x i32**] [i32** @g_278, i32** @g_258]], [4 x [2 x i32**]] [[2 x i32**] [i32** @g_278, i32** @g_258], [2 x i32**] [i32** @g_278, i32** @g_258], [2 x i32**] [i32** @g_278, i32** @g_258], [2 x i32**] [i32** @g_278, i32** @g_258]], [4 x [2 x i32**]] [[2 x i32**] [i32** @g_278, i32** @g_258], [2 x i32**] [i32** @g_278, i32** @g_258], [2 x i32**] [i32** @g_278, i32** @g_258], [2 x i32**] [i32** @g_278, i32** @g_258]], [4 x [2 x i32**]] [[2 x i32**] [i32** @g_278, i32** @g_258], [2 x i32**] [i32** @g_278, i32** @g_258], [2 x i32**] [i32** @g_278, i32** @g_258], [2 x i32**] [i32** @g_278, i32** @g_258]], [4 x [2 x i32**]] [[2 x i32**] [i32** @g_278, i32** @g_258], [2 x i32**] [i32** @g_278, i32** @g_258], [2 x i32**] [i32** @g_278, i32** @g_258], [2 x i32**] [i32** @g_278, i32** @g_258]], [4 x [2 x i32**]] [[2 x i32**] [i32** @g_278, i32** @g_258], [2 x i32**] [i32** @g_278, i32** @g_258], [2 x i32**] [i32** @g_278, i32** @g_258], [2 x i32**] [i32** @g_278, i32** @g_258]], [4 x [2 x i32**]] [[2 x i32**] [i32** @g_278, i32** @g_258], [2 x i32**] [i32** @g_278, i32** @g_258], [2 x i32**] [i32** @g_278, i32** @g_258], [2 x i32**] [i32** @g_278, i32** @g_258]], [4 x [2 x i32**]] [[2 x i32**] [i32** @g_278, i32** @g_258], [2 x i32**] [i32** @g_278, i32** @g_258], [2 x i32**] [i32** @g_278, i32** @g_258], [2 x i32**] [i32** @g_278, i32** @g_258]]], align 16
@func_7.l_1059 = private unnamed_addr constant [10 x i8] c"\98\98[\98\98[\98\98[\98", align 1
@func_7.l_947 = private unnamed_addr constant %union.U0 { i64 3422662646425273528 }, align 8
@func_7.l_995 = private unnamed_addr constant [1 x [7 x [6 x i32]]] [[7 x [6 x i32]] [[6 x i32] [i32 -256774813, i32 -2, i32 150196940, i32 -1349678558, i32 -803858298, i32 -1826457981], [6 x i32] [i32 -256774813, i32 -2, i32 150196940, i32 -1349678558, i32 -803858298, i32 -1826457981], [6 x i32] [i32 -256774813, i32 -2, i32 150196940, i32 -1349678558, i32 -803858298, i32 -1826457981], [6 x i32] [i32 -256774813, i32 -2, i32 150196940, i32 -1349678558, i32 -803858298, i32 -1826457981], [6 x i32] [i32 -256774813, i32 -2, i32 150196940, i32 -1349678558, i32 -803858298, i32 -1826457981], [6 x i32] [i32 -256774813, i32 -2, i32 150196940, i32 -1349678558, i32 -803858298, i32 -1826457981], [6 x i32] [i32 -256774813, i32 -2, i32 150196940, i32 -1349678558, i32 -803858298, i32 -1826457981]]], align 16
@func_7.l_999 = private unnamed_addr constant [4 x i32] [i32 5, i32 -336037301, i32 5, i32 -336037301], align 16
@func_7.l_924 = private unnamed_addr constant [9 x i32*] [i32* bitcast (i8* getelementptr (i8* bitcast ([6 x [1 x [10 x i32]]]* @g_66 to i8*), i64 92) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([6 x [1 x [10 x i32]]]* @g_66 to i8*), i64 92) to i32*), i32* @g_471, i32* bitcast (i8* getelementptr (i8* bitcast ([6 x [1 x [10 x i32]]]* @g_66 to i8*), i64 92) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([6 x [1 x [10 x i32]]]* @g_66 to i8*), i64 92) to i32*), i32* @g_471, i32* bitcast (i8* getelementptr (i8* bitcast ([6 x [1 x [10 x i32]]]* @g_66 to i8*), i64 92) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([6 x [1 x [10 x i32]]]* @g_66 to i8*), i64 92) to i32*), i32* @g_471], align 16
@func_7.l_928 = private unnamed_addr constant [3 x [5 x [7 x i8*]]] [[5 x [7 x i8*]] [[7 x i8*] [i8* @g_182, i8* @g_182, i8* null, i8* @g_200, i8* @g_182, i8* @g_200, i8* @g_200], [7 x i8*] [i8* @g_182, i8* @g_182, i8* null, i8* @g_200, i8* @g_182, i8* @g_200, i8* @g_200], [7 x i8*] [i8* @g_182, i8* @g_182, i8* null, i8* @g_200, i8* @g_182, i8* @g_200, i8* @g_200], [7 x i8*] [i8* @g_182, i8* @g_182, i8* null, i8* @g_200, i8* @g_182, i8* @g_200, i8* @g_200], [7 x i8*] [i8* @g_182, i8* @g_182, i8* null, i8* @g_200, i8* @g_182, i8* @g_200, i8* @g_200]], [5 x [7 x i8*]] [[7 x i8*] [i8* @g_182, i8* @g_182, i8* null, i8* @g_200, i8* @g_182, i8* @g_200, i8* @g_200], [7 x i8*] [i8* @g_182, i8* @g_182, i8* null, i8* @g_200, i8* @g_182, i8* @g_200, i8* @g_200], [7 x i8*] [i8* @g_182, i8* @g_182, i8* null, i8* @g_200, i8* @g_182, i8* @g_200, i8* @g_200], [7 x i8*] [i8* @g_182, i8* @g_182, i8* null, i8* @g_200, i8* @g_182, i8* @g_200, i8* @g_200], [7 x i8*] [i8* @g_182, i8* @g_182, i8* null, i8* @g_200, i8* @g_182, i8* @g_200, i8* @g_200]], [5 x [7 x i8*]] [[7 x i8*] [i8* @g_182, i8* @g_182, i8* null, i8* @g_200, i8* @g_182, i8* @g_200, i8* @g_200], [7 x i8*] [i8* @g_182, i8* @g_182, i8* null, i8* @g_200, i8* @g_182, i8* @g_200, i8* @g_200], [7 x i8*] [i8* @g_182, i8* @g_182, i8* null, i8* @g_200, i8* @g_182, i8* @g_200, i8* @g_200], [7 x i8*] [i8* @g_182, i8* @g_182, i8* null, i8* @g_200, i8* @g_182, i8* @g_200, i8* @g_200], [7 x i8*] [i8* @g_182, i8* @g_182, i8* null, i8* @g_200, i8* @g_182, i8* @g_200, i8* @g_200]]], align 16
@func_7.l_948 = private unnamed_addr constant [4 x %union.U0] [%union.U0 { i64 7290092462921383777 }, %union.U0 { i64 7290092462921383777 }, %union.U0 { i64 7290092462921383777 }, %union.U0 { i64 7290092462921383777 }], align 16
@func_7.l_971 = private unnamed_addr constant %union.U0 { i64 -1170788338216176402 }, align 8
@func_7.l_990 = private unnamed_addr constant [5 x [7 x [7 x i32]]] [[7 x [7 x i32]] [[7 x i32] [i32 0, i32 1, i32 0, i32 -6, i32 -197516375, i32 1, i32 -430294279], [7 x i32] [i32 0, i32 1, i32 0, i32 -6, i32 -197516375, i32 1, i32 -430294279], [7 x i32] [i32 0, i32 1, i32 0, i32 -6, i32 -197516375, i32 1, i32 -430294279], [7 x i32] [i32 0, i32 1, i32 0, i32 -6, i32 -197516375, i32 1, i32 -430294279], [7 x i32] [i32 0, i32 1, i32 0, i32 -6, i32 -197516375, i32 1, i32 -430294279], [7 x i32] [i32 0, i32 1, i32 0, i32 -6, i32 -197516375, i32 1, i32 -430294279], [7 x i32] [i32 0, i32 1, i32 0, i32 -6, i32 -197516375, i32 1, i32 -430294279]], [7 x [7 x i32]] [[7 x i32] [i32 0, i32 1, i32 0, i32 -6, i32 -197516375, i32 1, i32 -430294279], [7 x i32] [i32 0, i32 1, i32 0, i32 -6, i32 -197516375, i32 1, i32 -430294279], [7 x i32] [i32 0, i32 1, i32 0, i32 -6, i32 -197516375, i32 1, i32 -430294279], [7 x i32] [i32 0, i32 1, i32 0, i32 -6, i32 -197516375, i32 1, i32 -430294279], [7 x i32] [i32 0, i32 1, i32 0, i32 -6, i32 -197516375, i32 1, i32 -430294279], [7 x i32] [i32 0, i32 1, i32 0, i32 -6, i32 -197516375, i32 1, i32 -430294279], [7 x i32] [i32 0, i32 1, i32 0, i32 -6, i32 -197516375, i32 1, i32 -430294279]], [7 x [7 x i32]] [[7 x i32] [i32 0, i32 1, i32 0, i32 -6, i32 -197516375, i32 1, i32 -430294279], [7 x i32] [i32 0, i32 1, i32 0, i32 -6, i32 -197516375, i32 1, i32 -430294279], [7 x i32] [i32 0, i32 1, i32 0, i32 -6, i32 -197516375, i32 1, i32 -430294279], [7 x i32] [i32 0, i32 1, i32 0, i32 -6, i32 -197516375, i32 1, i32 -430294279], [7 x i32] [i32 0, i32 1, i32 0, i32 -6, i32 -197516375, i32 1, i32 -430294279], [7 x i32] [i32 0, i32 1, i32 0, i32 -6, i32 -197516375, i32 1, i32 -430294279], [7 x i32] [i32 0, i32 1, i32 0, i32 -6, i32 -197516375, i32 1, i32 -430294279]], [7 x [7 x i32]] [[7 x i32] [i32 0, i32 1, i32 0, i32 -6, i32 -197516375, i32 1, i32 -430294279], [7 x i32] [i32 0, i32 1, i32 0, i32 -6, i32 -197516375, i32 1, i32 -430294279], [7 x i32] [i32 0, i32 1, i32 0, i32 -6, i32 -197516375, i32 1, i32 -430294279], [7 x i32] [i32 0, i32 1, i32 0, i32 -6, i32 -197516375, i32 1, i32 -430294279], [7 x i32] [i32 0, i32 1, i32 0, i32 -6, i32 -197516375, i32 1, i32 -430294279], [7 x i32] [i32 0, i32 1, i32 0, i32 -6, i32 -197516375, i32 1, i32 -430294279], [7 x i32] [i32 0, i32 1, i32 0, i32 -6, i32 -197516375, i32 1, i32 -430294279]], [7 x [7 x i32]] [[7 x i32] [i32 0, i32 1, i32 0, i32 -6, i32 -197516375, i32 1, i32 -430294279], [7 x i32] [i32 0, i32 1, i32 0, i32 -6, i32 -197516375, i32 1, i32 -430294279], [7 x i32] [i32 0, i32 1, i32 0, i32 -6, i32 -197516375, i32 1, i32 -430294279], [7 x i32] [i32 0, i32 1, i32 0, i32 -6, i32 -197516375, i32 1, i32 -430294279], [7 x i32] [i32 0, i32 1, i32 0, i32 -6, i32 -197516375, i32 1, i32 -430294279], [7 x i32] [i32 0, i32 1, i32 0, i32 -6, i32 -197516375, i32 1, i32 -430294279], [7 x i32] [i32 0, i32 1, i32 0, i32 -6, i32 -197516375, i32 1, i32 -430294279]]], align 16
@func_7.l_1056 = private unnamed_addr constant [7 x i32] [i32 -511401493, i32 -1, i32 -511401493, i32 -1, i32 -511401493, i32 -1, i32 -511401493], align 16
@func_7.l_1117 = private unnamed_addr constant %union.U0 { i64 4 }, align 8
@func_7.l_1135 = private unnamed_addr constant [5 x [4 x [9 x i32**]]] [[4 x [9 x i32**]] [[9 x i32**] [i32** @g_258, i32** @g_258, i32** @g_258, i32** @g_258, i32** @g_258, i32** @g_278, i32** @g_258, i32** @g_258, i32** @g_278], [9 x i32**] [i32** @g_258, i32** @g_258, i32** @g_258, i32** @g_258, i32** @g_258, i32** @g_278, i32** @g_258, i32** @g_258, i32** @g_278], [9 x i32**] [i32** @g_258, i32** @g_258, i32** @g_258, i32** @g_258, i32** @g_258, i32** @g_278, i32** @g_258, i32** @g_258, i32** @g_278], [9 x i32**] [i32** @g_258, i32** @g_258, i32** @g_258, i32** @g_258, i32** @g_258, i32** @g_278, i32** @g_258, i32** @g_258, i32** @g_278]], [4 x [9 x i32**]] [[9 x i32**] [i32** @g_258, i32** @g_258, i32** @g_258, i32** @g_258, i32** @g_258, i32** @g_278, i32** @g_258, i32** @g_258, i32** @g_278], [9 x i32**] [i32** @g_258, i32** @g_258, i32** @g_258, i32** @g_258, i32** @g_258, i32** @g_278, i32** @g_258, i32** @g_258, i32** @g_278], [9 x i32**] [i32** @g_258, i32** @g_258, i32** @g_258, i32** @g_258, i32** @g_258, i32** @g_278, i32** @g_258, i32** @g_258, i32** @g_278], [9 x i32**] [i32** @g_258, i32** @g_258, i32** @g_258, i32** @g_258, i32** @g_258, i32** @g_278, i32** @g_258, i32** @g_258, i32** @g_278]], [4 x [9 x i32**]] [[9 x i32**] [i32** @g_258, i32** @g_258, i32** @g_258, i32** @g_258, i32** @g_258, i32** @g_278, i32** @g_258, i32** @g_258, i32** @g_278], [9 x i32**] [i32** @g_258, i32** @g_258, i32** @g_258, i32** @g_258, i32** @g_258, i32** @g_278, i32** @g_258, i32** @g_258, i32** @g_278], [9 x i32**] [i32** @g_258, i32** @g_258, i32** @g_258, i32** @g_258, i32** @g_258, i32** @g_278, i32** @g_258, i32** @g_258, i32** @g_278], [9 x i32**] [i32** @g_258, i32** @g_258, i32** @g_258, i32** @g_258, i32** @g_258, i32** @g_278, i32** @g_258, i32** @g_258, i32** @g_278]], [4 x [9 x i32**]] [[9 x i32**] [i32** @g_258, i32** @g_258, i32** @g_258, i32** @g_258, i32** @g_258, i32** @g_278, i32** @g_258, i32** @g_258, i32** @g_278], [9 x i32**] [i32** @g_258, i32** @g_258, i32** @g_258, i32** @g_258, i32** @g_258, i32** @g_278, i32** @g_258, i32** @g_258, i32** @g_278], [9 x i32**] [i32** @g_258, i32** @g_258, i32** @g_258, i32** @g_258, i32** @g_258, i32** @g_278, i32** @g_258, i32** @g_258, i32** @g_278], [9 x i32**] [i32** @g_258, i32** @g_258, i32** @g_258, i32** @g_258, i32** @g_258, i32** @g_278, i32** @g_258, i32** @g_258, i32** @g_278]], [4 x [9 x i32**]] [[9 x i32**] [i32** @g_258, i32** @g_258, i32** @g_258, i32** @g_258, i32** @g_258, i32** @g_278, i32** @g_258, i32** @g_258, i32** @g_278], [9 x i32**] [i32** @g_258, i32** @g_258, i32** @g_258, i32** @g_258, i32** @g_258, i32** @g_278, i32** @g_258, i32** @g_258, i32** @g_278], [9 x i32**] [i32** @g_258, i32** @g_258, i32** @g_258, i32** @g_258, i32** @g_258, i32** @g_278, i32** @g_258, i32** @g_258, i32** @g_278], [9 x i32**] [i32** @g_258, i32** @g_258, i32** @g_258, i32** @g_258, i32** @g_258, i32** @g_278, i32** @g_258, i32** @g_258, i32** @g_278]]], align 16
@g_1136 = internal global i32* @g_471, align 8
@func_7.l_1146 = private unnamed_addr constant %union.U0 { i64 8 }, align 8
@func_7.l_1222 = private unnamed_addr constant %union.U0 { i64 -3 }, align 8
@g_1006 = internal global i32** @g_278, align 8
@func_7.l_1165 = private unnamed_addr constant [10 x [5 x [5 x i32**]]] [[5 x [5 x i32**]] [[5 x i32**] [i32** @g_258, i32** @g_278, i32** @g_258, i32** @g_278, i32** @g_258], [5 x i32**] [i32** @g_258, i32** @g_278, i32** @g_258, i32** @g_278, i32** @g_258], [5 x i32**] [i32** @g_258, i32** @g_278, i32** @g_258, i32** @g_278, i32** @g_258], [5 x i32**] [i32** @g_258, i32** @g_278, i32** @g_258, i32** @g_278, i32** @g_258], [5 x i32**] [i32** @g_258, i32** @g_278, i32** @g_258, i32** @g_278, i32** @g_258]], [5 x [5 x i32**]] [[5 x i32**] [i32** @g_258, i32** @g_278, i32** @g_258, i32** @g_278, i32** @g_258], [5 x i32**] [i32** @g_258, i32** @g_278, i32** @g_258, i32** @g_278, i32** @g_258], [5 x i32**] [i32** @g_258, i32** @g_278, i32** @g_258, i32** @g_278, i32** @g_258], [5 x i32**] [i32** @g_258, i32** @g_278, i32** @g_258, i32** @g_278, i32** @g_258], [5 x i32**] [i32** @g_258, i32** @g_278, i32** @g_258, i32** @g_278, i32** @g_258]], [5 x [5 x i32**]] [[5 x i32**] [i32** @g_258, i32** @g_278, i32** @g_258, i32** @g_278, i32** @g_258], [5 x i32**] [i32** @g_258, i32** @g_278, i32** @g_258, i32** @g_278, i32** @g_258], [5 x i32**] [i32** @g_258, i32** @g_278, i32** @g_258, i32** @g_278, i32** @g_258], [5 x i32**] [i32** @g_258, i32** @g_278, i32** @g_258, i32** @g_278, i32** @g_258], [5 x i32**] [i32** @g_258, i32** @g_278, i32** @g_258, i32** @g_278, i32** @g_258]], [5 x [5 x i32**]] [[5 x i32**] [i32** @g_258, i32** @g_278, i32** @g_258, i32** @g_278, i32** @g_258], [5 x i32**] [i32** @g_258, i32** @g_278, i32** @g_258, i32** @g_278, i32** @g_258], [5 x i32**] [i32** @g_258, i32** @g_278, i32** @g_258, i32** @g_278, i32** @g_258], [5 x i32**] [i32** @g_258, i32** @g_278, i32** @g_258, i32** @g_278, i32** @g_258], [5 x i32**] [i32** @g_258, i32** @g_278, i32** @g_258, i32** @g_278, i32** @g_258]], [5 x [5 x i32**]] [[5 x i32**] [i32** @g_258, i32** @g_278, i32** @g_258, i32** @g_278, i32** @g_258], [5 x i32**] [i32** @g_258, i32** @g_278, i32** @g_258, i32** @g_278, i32** @g_258], [5 x i32**] [i32** @g_258, i32** @g_278, i32** @g_258, i32** @g_278, i32** @g_258], [5 x i32**] [i32** @g_258, i32** @g_278, i32** @g_258, i32** @g_278, i32** @g_258], [5 x i32**] [i32** @g_258, i32** @g_278, i32** @g_258, i32** @g_278, i32** @g_258]], [5 x [5 x i32**]] [[5 x i32**] [i32** @g_258, i32** @g_278, i32** @g_258, i32** @g_278, i32** @g_258], [5 x i32**] [i32** @g_258, i32** @g_278, i32** @g_258, i32** @g_278, i32** @g_258], [5 x i32**] [i32** @g_258, i32** @g_278, i32** @g_258, i32** @g_278, i32** @g_258], [5 x i32**] [i32** @g_258, i32** @g_278, i32** @g_258, i32** @g_278, i32** @g_258], [5 x i32**] [i32** @g_258, i32** @g_278, i32** @g_258, i32** @g_278, i32** @g_258]], [5 x [5 x i32**]] [[5 x i32**] [i32** @g_258, i32** @g_278, i32** @g_258, i32** @g_278, i32** @g_258], [5 x i32**] [i32** @g_258, i32** @g_278, i32** @g_258, i32** @g_278, i32** @g_258], [5 x i32**] [i32** @g_258, i32** @g_278, i32** @g_258, i32** @g_278, i32** @g_258], [5 x i32**] [i32** @g_258, i32** @g_278, i32** @g_258, i32** @g_278, i32** @g_258], [5 x i32**] [i32** @g_258, i32** @g_278, i32** @g_258, i32** @g_278, i32** @g_258]], [5 x [5 x i32**]] [[5 x i32**] [i32** @g_258, i32** @g_278, i32** @g_258, i32** @g_278, i32** @g_258], [5 x i32**] [i32** @g_258, i32** @g_278, i32** @g_258, i32** @g_278, i32** @g_258], [5 x i32**] [i32** @g_258, i32** @g_278, i32** @g_258, i32** @g_278, i32** @g_258], [5 x i32**] [i32** @g_258, i32** @g_278, i32** @g_258, i32** @g_278, i32** @g_258], [5 x i32**] [i32** @g_258, i32** @g_278, i32** @g_258, i32** @g_278, i32** @g_258]], [5 x [5 x i32**]] [[5 x i32**] [i32** @g_258, i32** @g_278, i32** @g_258, i32** @g_278, i32** @g_258], [5 x i32**] [i32** @g_258, i32** @g_278, i32** @g_258, i32** @g_278, i32** @g_258], [5 x i32**] [i32** @g_258, i32** @g_278, i32** @g_258, i32** @g_278, i32** @g_258], [5 x i32**] [i32** @g_258, i32** @g_278, i32** @g_258, i32** @g_278, i32** @g_258], [5 x i32**] [i32** @g_258, i32** @g_278, i32** @g_258, i32** @g_278, i32** @g_258]], [5 x [5 x i32**]] [[5 x i32**] [i32** @g_258, i32** @g_278, i32** @g_258, i32** @g_278, i32** @g_258], [5 x i32**] [i32** @g_258, i32** @g_278, i32** @g_258, i32** @g_278, i32** @g_258], [5 x i32**] [i32** @g_258, i32** @g_278, i32** @g_258, i32** @g_278, i32** @g_258], [5 x i32**] [i32** @g_258, i32** @g_278, i32** @g_258, i32** @g_278, i32** @g_258], [5 x i32**] [i32** @g_258, i32** @g_278, i32** @g_258, i32** @g_278, i32** @g_258]]], align 16
@func_7.l_1158 = private unnamed_addr constant %union.U0 { i64 -1 }, align 8
@func_7.l_1164 = private unnamed_addr constant [10 x [1 x [4 x i32]]] [[1 x [4 x i32]] [[4 x i32] [i32 -1, i32 -1, i32 -6, i32 1147229952]], [1 x [4 x i32]] [[4 x i32] [i32 -1, i32 -1, i32 -6, i32 1147229952]], [1 x [4 x i32]] [[4 x i32] [i32 -1, i32 -1, i32 -6, i32 1147229952]], [1 x [4 x i32]] [[4 x i32] [i32 -1, i32 -1, i32 -6, i32 1147229952]], [1 x [4 x i32]] [[4 x i32] [i32 -1, i32 -1, i32 -6, i32 1147229952]], [1 x [4 x i32]] [[4 x i32] [i32 -1, i32 -1, i32 -6, i32 1147229952]], [1 x [4 x i32]] [[4 x i32] [i32 -1, i32 -1, i32 -6, i32 1147229952]], [1 x [4 x i32]] [[4 x i32] [i32 -1, i32 -1, i32 -6, i32 1147229952]], [1 x [4 x i32]] [[4 x i32] [i32 -1, i32 -1, i32 -6, i32 1147229952]], [1 x [4 x i32]] [[4 x i32] [i32 -1, i32 -1, i32 -6, i32 1147229952]]], align 16
@func_7.l_1176 = private unnamed_addr constant [10 x [2 x i16]] [[2 x i16] [i16 9, i16 26474], [2 x i16] [i16 9, i16 26474], [2 x i16] [i16 9, i16 26474], [2 x i16] [i16 9, i16 26474], [2 x i16] [i16 9, i16 26474], [2 x i16] [i16 9, i16 26474], [2 x i16] [i16 9, i16 26474], [2 x i16] [i16 9, i16 26474], [2 x i16] [i16 9, i16 26474], [2 x i16] [i16 9, i16 26474]], align 16
@func_7.l_1264 = private unnamed_addr constant [9 x i8] c"\FF\FF\01\FF\FF\01\FF\FF\01", align 1
@func_7.l_1352 = private unnamed_addr constant [9 x i32] [i32 -1847928364, i32 -1847928364, i32 995104450, i32 -1847928364, i32 -1847928364, i32 995104450, i32 -1847928364, i32 -1847928364, i32 995104450], align 16
@g_976 = internal global i32** @g_258, align 8
@func_7.l_1362 = private unnamed_addr constant [10 x [10 x i32]] [[10 x i32] [i32 949141175, i32 949141175, i32 1, i32 -4, i32 -1822517897, i32 -4, i32 1, i32 949141175, i32 949141175, i32 1], [10 x i32] [i32 949141175, i32 949141175, i32 1, i32 -4, i32 -1822517897, i32 -4, i32 1, i32 949141175, i32 949141175, i32 1], [10 x i32] [i32 949141175, i32 949141175, i32 1, i32 -4, i32 -1822517897, i32 -4, i32 1, i32 949141175, i32 949141175, i32 1], [10 x i32] [i32 949141175, i32 949141175, i32 1, i32 -4, i32 -1822517897, i32 -4, i32 1, i32 949141175, i32 949141175, i32 1], [10 x i32] [i32 949141175, i32 949141175, i32 1, i32 -4, i32 -1822517897, i32 -4, i32 1, i32 949141175, i32 949141175, i32 1], [10 x i32] [i32 949141175, i32 949141175, i32 1, i32 -4, i32 -1822517897, i32 -4, i32 1, i32 949141175, i32 949141175, i32 1], [10 x i32] [i32 949141175, i32 949141175, i32 1, i32 -4, i32 -1822517897, i32 -4, i32 1, i32 949141175, i32 949141175, i32 1], [10 x i32] [i32 949141175, i32 949141175, i32 1, i32 -4, i32 -1822517897, i32 -4, i32 1, i32 949141175, i32 949141175, i32 1], [10 x i32] [i32 949141175, i32 949141175, i32 1, i32 -4, i32 -1822517897, i32 -4, i32 1, i32 949141175, i32 949141175, i32 1], [10 x i32] [i32 949141175, i32 949141175, i32 1, i32 -4, i32 -1822517897, i32 -4, i32 1, i32 949141175, i32 949141175, i32 1]], align 16
@func_5.l_1377 = private unnamed_addr constant [10 x [6 x i64*]] [[6 x i64*] [i64* getelementptr inbounds (%union.U1* @g_815, i32 0, i32 0), i64* getelementptr inbounds (%union.U1* @g_1050, i32 0, i32 0), i64* getelementptr inbounds (%union.U1* @g_965, i32 0, i32 0), i64* getelementptr inbounds (%union.U1* @g_1050, i32 0, i32 0), i64* getelementptr inbounds (%union.U1* @g_815, i32 0, i32 0), i64* getelementptr inbounds (%union.U1* @g_965, i32 0, i32 0)], [6 x i64*] [i64* getelementptr inbounds (%union.U1* @g_815, i32 0, i32 0), i64* getelementptr inbounds (%union.U1* @g_1050, i32 0, i32 0), i64* getelementptr inbounds (%union.U1* @g_965, i32 0, i32 0), i64* getelementptr inbounds (%union.U1* @g_1050, i32 0, i32 0), i64* getelementptr inbounds (%union.U1* @g_815, i32 0, i32 0), i64* getelementptr inbounds (%union.U1* @g_965, i32 0, i32 0)], [6 x i64*] [i64* getelementptr inbounds (%union.U1* @g_815, i32 0, i32 0), i64* getelementptr inbounds (%union.U1* @g_1050, i32 0, i32 0), i64* getelementptr inbounds (%union.U1* @g_965, i32 0, i32 0), i64* getelementptr inbounds (%union.U1* @g_1050, i32 0, i32 0), i64* getelementptr inbounds (%union.U1* @g_815, i32 0, i32 0), i64* getelementptr inbounds (%union.U1* @g_965, i32 0, i32 0)], [6 x i64*] [i64* getelementptr inbounds (%union.U1* @g_815, i32 0, i32 0), i64* getelementptr inbounds (%union.U1* @g_1050, i32 0, i32 0), i64* getelementptr inbounds (%union.U1* @g_965, i32 0, i32 0), i64* getelementptr inbounds (%union.U1* @g_1050, i32 0, i32 0), i64* getelementptr inbounds (%union.U1* @g_815, i32 0, i32 0), i64* getelementptr inbounds (%union.U1* @g_965, i32 0, i32 0)], [6 x i64*] [i64* getelementptr inbounds (%union.U1* @g_815, i32 0, i32 0), i64* getelementptr inbounds (%union.U1* @g_1050, i32 0, i32 0), i64* getelementptr inbounds (%union.U1* @g_965, i32 0, i32 0), i64* getelementptr inbounds (%union.U1* @g_1050, i32 0, i32 0), i64* getelementptr inbounds (%union.U1* @g_815, i32 0, i32 0), i64* getelementptr inbounds (%union.U1* @g_965, i32 0, i32 0)], [6 x i64*] [i64* getelementptr inbounds (%union.U1* @g_815, i32 0, i32 0), i64* getelementptr inbounds (%union.U1* @g_1050, i32 0, i32 0), i64* getelementptr inbounds (%union.U1* @g_965, i32 0, i32 0), i64* getelementptr inbounds (%union.U1* @g_1050, i32 0, i32 0), i64* getelementptr inbounds (%union.U1* @g_815, i32 0, i32 0), i64* getelementptr inbounds (%union.U1* @g_965, i32 0, i32 0)], [6 x i64*] [i64* getelementptr inbounds (%union.U1* @g_815, i32 0, i32 0), i64* getelementptr inbounds (%union.U1* @g_1050, i32 0, i32 0), i64* getelementptr inbounds (%union.U1* @g_965, i32 0, i32 0), i64* getelementptr inbounds (%union.U1* @g_1050, i32 0, i32 0), i64* getelementptr inbounds (%union.U1* @g_815, i32 0, i32 0), i64* getelementptr inbounds (%union.U1* @g_965, i32 0, i32 0)], [6 x i64*] [i64* getelementptr inbounds (%union.U1* @g_815, i32 0, i32 0), i64* getelementptr inbounds (%union.U1* @g_1050, i32 0, i32 0), i64* getelementptr inbounds (%union.U1* @g_965, i32 0, i32 0), i64* getelementptr inbounds (%union.U1* @g_1050, i32 0, i32 0), i64* getelementptr inbounds (%union.U1* @g_815, i32 0, i32 0), i64* getelementptr inbounds (%union.U1* @g_965, i32 0, i32 0)], [6 x i64*] [i64* getelementptr inbounds (%union.U1* @g_815, i32 0, i32 0), i64* getelementptr inbounds (%union.U1* @g_1050, i32 0, i32 0), i64* getelementptr inbounds (%union.U1* @g_965, i32 0, i32 0), i64* getelementptr inbounds (%union.U1* @g_1050, i32 0, i32 0), i64* getelementptr inbounds (%union.U1* @g_815, i32 0, i32 0), i64* getelementptr inbounds (%union.U1* @g_965, i32 0, i32 0)], [6 x i64*] [i64* getelementptr inbounds (%union.U1* @g_815, i32 0, i32 0), i64* getelementptr inbounds (%union.U1* @g_1050, i32 0, i32 0), i64* getelementptr inbounds (%union.U1* @g_965, i32 0, i32 0), i64* getelementptr inbounds (%union.U1* @g_1050, i32 0, i32 0), i64* getelementptr inbounds (%union.U1* @g_815, i32 0, i32 0), i64* getelementptr inbounds (%union.U1* @g_965, i32 0, i32 0)]], align 16
@func_5.l_1386 = private unnamed_addr constant %union.U0 { i64 8524640712353537966 }, align 8
@g_1250 = internal global i32*** getelementptr inbounds ([5 x i32**]* @g_1251, i32 0, i32 0), align 8
@g_1251 = internal global [5 x i32**] [i32** @g_56, i32** @g_56, i32** @g_56, i32** @g_56, i32** @g_56], align 16

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %print_hash_value = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  store i32 0, i32* %print_hash_value, align 4
  %0 = load i32* %argc.addr, align 4
  %cmp = icmp eq i32 %0, 2
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %1 = load i8*** %argv.addr, align 8
  %arrayidx = getelementptr inbounds i8** %1, i64 1
  %2 = load i8** %arrayidx, align 8
  %call = call i32 @strcmp(i8* %2, i8* getelementptr inbounds ([2 x i8]* @.str, i32 0, i32 0)) nounwind readonly
  %cmp1 = icmp eq i32 %call, 0
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  store i32 1, i32* %print_hash_value, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  call void @platform_main_begin()
  call void @crc32_gentab()
  %call2 = call i64 @func_1()
  %3 = load i32* @g_3, align 4
  %conv = sext i32 %3 to i64
  %4 = load i32* %print_hash_value, align 4
  call void @transparent_crc(i64 %conv, i8* getelementptr inbounds ([4 x i8]* @.str1, i32 0, i32 0), i32 %4)
  %5 = load i32* bitcast (%union.U0* @g_13 to i32*), align 4
  %conv3 = sext i32 %5 to i64
  %6 = load i32* %print_hash_value, align 4
  call void @transparent_crc(i64 %conv3, i8* getelementptr inbounds ([8 x i8]* @.str2, i32 0, i32 0), i32 %6)
  %7 = load i64* @g_49, align 8
  %8 = load i32* %print_hash_value, align 4
  call void @transparent_crc(i64 %7, i8* getelementptr inbounds ([5 x i8]* @.str3, i32 0, i32 0), i32 %8)
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc26, %if.end
  %9 = load i32* %i, align 4
  %cmp4 = icmp slt i32 %9, 6
  br i1 %cmp4, label %for.body, label %for.end28

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4
  br label %for.cond6

for.cond6:                                        ; preds = %for.inc23, %for.body
  %10 = load i32* %j, align 4
  %cmp7 = icmp slt i32 %10, 1
  br i1 %cmp7, label %for.body9, label %for.end25

for.body9:                                        ; preds = %for.cond6
  store i32 0, i32* %k, align 4
  br label %for.cond10

for.cond10:                                       ; preds = %for.inc, %for.body9
  %11 = load i32* %k, align 4
  %cmp11 = icmp slt i32 %11, 10
  br i1 %cmp11, label %for.body13, label %for.end

for.body13:                                       ; preds = %for.cond10
  %12 = load i32* %k, align 4
  %idxprom = sext i32 %12 to i64
  %13 = load i32* %j, align 4
  %idxprom14 = sext i32 %13 to i64
  %14 = load i32* %i, align 4
  %idxprom15 = sext i32 %14 to i64
  %arrayidx16 = getelementptr inbounds [6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 %idxprom15
  %arrayidx17 = getelementptr inbounds [1 x [10 x i32]]* %arrayidx16, i32 0, i64 %idxprom14
  %arrayidx18 = getelementptr inbounds [10 x i32]* %arrayidx17, i32 0, i64 %idxprom
  %15 = load i32* %arrayidx18, align 4
  %conv19 = sext i32 %15 to i64
  %16 = load i32* %print_hash_value, align 4
  call void @transparent_crc(i64 %conv19, i8* getelementptr inbounds ([14 x i8]* @.str4, i32 0, i32 0), i32 %16)
  %17 = load i32* %print_hash_value, align 4
  %tobool = icmp ne i32 %17, 0
  br i1 %tobool, label %if.then20, label %if.end22

if.then20:                                        ; preds = %for.body13
  %18 = load i32* %i, align 4
  %19 = load i32* %j, align 4
  %20 = load i32* %k, align 4
  %call21 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str5, i32 0, i32 0), i32 %18, i32 %19, i32 %20)
  br label %if.end22

if.end22:                                         ; preds = %if.then20, %for.body13
  br label %for.inc

for.inc:                                          ; preds = %if.end22
  %21 = load i32* %k, align 4
  %inc = add nsw i32 %21, 1
  store i32 %inc, i32* %k, align 4
  br label %for.cond10

for.end:                                          ; preds = %for.cond10
  br label %for.inc23

for.inc23:                                        ; preds = %for.end
  %22 = load i32* %j, align 4
  %inc24 = add nsw i32 %22, 1
  store i32 %inc24, i32* %j, align 4
  br label %for.cond6

for.end25:                                        ; preds = %for.cond6
  br label %for.inc26

for.inc26:                                        ; preds = %for.end25
  %23 = load i32* %i, align 4
  %inc27 = add nsw i32 %23, 1
  store i32 %inc27, i32* %i, align 4
  br label %for.cond

for.end28:                                        ; preds = %for.cond
  store i32 0, i32* %i, align 4
  br label %for.cond29

for.cond29:                                       ; preds = %for.inc58, %for.end28
  %24 = load i32* %i, align 4
  %cmp30 = icmp slt i32 %24, 1
  br i1 %cmp30, label %for.body32, label %for.end60

for.body32:                                       ; preds = %for.cond29
  store i32 0, i32* %j, align 4
  br label %for.cond33

for.cond33:                                       ; preds = %for.inc55, %for.body32
  %25 = load i32* %j, align 4
  %cmp34 = icmp slt i32 %25, 8
  br i1 %cmp34, label %for.body36, label %for.end57

for.body36:                                       ; preds = %for.cond33
  store i32 0, i32* %k, align 4
  br label %for.cond37

for.cond37:                                       ; preds = %for.inc52, %for.body36
  %26 = load i32* %k, align 4
  %cmp38 = icmp slt i32 %26, 10
  br i1 %cmp38, label %for.body40, label %for.end54

for.body40:                                       ; preds = %for.cond37
  %27 = load i32* %k, align 4
  %idxprom41 = sext i32 %27 to i64
  %28 = load i32* %j, align 4
  %idxprom42 = sext i32 %28 to i64
  %29 = load i32* %i, align 4
  %idxprom43 = sext i32 %29 to i64
  %arrayidx44 = getelementptr inbounds [1 x [8 x [10 x i32]]]* @g_110, i32 0, i64 %idxprom43
  %arrayidx45 = getelementptr inbounds [8 x [10 x i32]]* %arrayidx44, i32 0, i64 %idxprom42
  %arrayidx46 = getelementptr inbounds [10 x i32]* %arrayidx45, i32 0, i64 %idxprom41
  %30 = load i32* %arrayidx46, align 4
  %conv47 = zext i32 %30 to i64
  %31 = load i32* %print_hash_value, align 4
  call void @transparent_crc(i64 %conv47, i8* getelementptr inbounds ([15 x i8]* @.str6, i32 0, i32 0), i32 %31)
  %32 = load i32* %print_hash_value, align 4
  %tobool48 = icmp ne i32 %32, 0
  br i1 %tobool48, label %if.then49, label %if.end51

if.then49:                                        ; preds = %for.body40
  %33 = load i32* %i, align 4
  %34 = load i32* %j, align 4
  %35 = load i32* %k, align 4
  %call50 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str5, i32 0, i32 0), i32 %33, i32 %34, i32 %35)
  br label %if.end51

if.end51:                                         ; preds = %if.then49, %for.body40
  br label %for.inc52

for.inc52:                                        ; preds = %if.end51
  %36 = load i32* %k, align 4
  %inc53 = add nsw i32 %36, 1
  store i32 %inc53, i32* %k, align 4
  br label %for.cond37

for.end54:                                        ; preds = %for.cond37
  br label %for.inc55

for.inc55:                                        ; preds = %for.end54
  %37 = load i32* %j, align 4
  %inc56 = add nsw i32 %37, 1
  store i32 %inc56, i32* %j, align 4
  br label %for.cond33

for.end57:                                        ; preds = %for.cond33
  br label %for.inc58

for.inc58:                                        ; preds = %for.end57
  %38 = load i32* %i, align 4
  %inc59 = add nsw i32 %38, 1
  store i32 %inc59, i32* %i, align 4
  br label %for.cond29

for.end60:                                        ; preds = %for.cond29
  %39 = load volatile i8* bitcast (%union.U1* @g_130 to i8*), align 1
  %conv61 = sext i8 %39 to i64
  %40 = load i32* %print_hash_value, align 4
  call void @transparent_crc(i64 %conv61, i8* getelementptr inbounds ([9 x i8]* @.str7, i32 0, i32 0), i32 %40)
  %41 = load i16* bitcast (%union.U1* @g_130 to i16*), align 2
  %conv62 = sext i16 %41 to i64
  %42 = load i32* %print_hash_value, align 4
  call void @transparent_crc(i64 %conv62, i8* getelementptr inbounds ([9 x i8]* @.str8, i32 0, i32 0), i32 %42)
  %43 = load volatile i64* @g_163, align 8
  %44 = load i32* %print_hash_value, align 4
  call void @transparent_crc(i64 %43, i8* getelementptr inbounds ([6 x i8]* @.str9, i32 0, i32 0), i32 %44)
  %45 = load i16* @g_166, align 2
  %conv63 = sext i16 %45 to i64
  %46 = load i32* %print_hash_value, align 4
  call void @transparent_crc(i64 %conv63, i8* getelementptr inbounds ([6 x i8]* @.str10, i32 0, i32 0), i32 %46)
  %47 = load i8* @g_182, align 1
  %conv64 = zext i8 %47 to i64
  %48 = load i32* %print_hash_value, align 4
  call void @transparent_crc(i64 %conv64, i8* getelementptr inbounds ([6 x i8]* @.str11, i32 0, i32 0), i32 %48)
  %49 = load i16* @g_193, align 2
  %conv65 = zext i16 %49 to i64
  %50 = load i32* %print_hash_value, align 4
  call void @transparent_crc(i64 %conv65, i8* getelementptr inbounds ([6 x i8]* @.str12, i32 0, i32 0), i32 %50)
  %51 = load i8* @g_200, align 1
  %conv66 = zext i8 %51 to i64
  %52 = load i32* %print_hash_value, align 4
  call void @transparent_crc(i64 %conv66, i8* getelementptr inbounds ([6 x i8]* @.str13, i32 0, i32 0), i32 %52)
  store i32 0, i32* %i, align 4
  br label %for.cond67

for.cond67:                                       ; preds = %for.inc78, %for.end60
  %53 = load i32* %i, align 4
  %cmp68 = icmp slt i32 %53, 7
  br i1 %cmp68, label %for.body70, label %for.end80

for.body70:                                       ; preds = %for.cond67
  %54 = load i32* %i, align 4
  %idxprom71 = sext i32 %54 to i64
  %arrayidx72 = getelementptr inbounds [7 x i32]* @g_213, i32 0, i64 %idxprom71
  %55 = load volatile i32* %arrayidx72, align 4
  %conv73 = sext i32 %55 to i64
  %56 = load i32* %print_hash_value, align 4
  call void @transparent_crc(i64 %conv73, i8* getelementptr inbounds ([9 x i8]* @.str14, i32 0, i32 0), i32 %56)
  %57 = load i32* %print_hash_value, align 4
  %tobool74 = icmp ne i32 %57, 0
  br i1 %tobool74, label %if.then75, label %if.end77

if.then75:                                        ; preds = %for.body70
  %58 = load i32* %i, align 4
  %call76 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([14 x i8]* @.str15, i32 0, i32 0), i32 %58)
  br label %if.end77

if.end77:                                         ; preds = %if.then75, %for.body70
  br label %for.inc78

for.inc78:                                        ; preds = %if.end77
  %59 = load i32* %i, align 4
  %inc79 = add nsw i32 %59, 1
  store i32 %inc79, i32* %i, align 4
  br label %for.cond67

for.end80:                                        ; preds = %for.cond67
  %60 = load volatile i8* bitcast (%union.U1* @g_307 to i8*), align 1
  %conv81 = sext i8 %60 to i64
  %61 = load i32* %print_hash_value, align 4
  call void @transparent_crc(i64 %conv81, i8* getelementptr inbounds ([9 x i8]* @.str16, i32 0, i32 0), i32 %61)
  %62 = load i16* bitcast (%union.U1* @g_307 to i16*), align 2
  %conv82 = sext i16 %62 to i64
  %63 = load i32* %print_hash_value, align 4
  call void @transparent_crc(i64 %conv82, i8* getelementptr inbounds ([9 x i8]* @.str17, i32 0, i32 0), i32 %63)
  %64 = load i32* @g_322, align 4
  %conv83 = sext i32 %64 to i64
  %65 = load i32* %print_hash_value, align 4
  call void @transparent_crc(i64 %conv83, i8* getelementptr inbounds ([6 x i8]* @.str18, i32 0, i32 0), i32 %65)
  %66 = load i32* @g_353, align 4
  %conv84 = zext i32 %66 to i64
  %67 = load i32* %print_hash_value, align 4
  call void @transparent_crc(i64 %conv84, i8* getelementptr inbounds ([6 x i8]* @.str19, i32 0, i32 0), i32 %67)
  %68 = load volatile i64* getelementptr inbounds (%union.U1* @g_361, i32 0, i32 0), align 8
  %69 = load i32* %print_hash_value, align 4
  call void @transparent_crc(i64 %68, i8* getelementptr inbounds ([9 x i8]* @.str20, i32 0, i32 0), i32 %69)
  %70 = load volatile i8* bitcast (%union.U1* @g_361 to i8*), align 1
  %conv85 = sext i8 %70 to i64
  %71 = load i32* %print_hash_value, align 4
  call void @transparent_crc(i64 %conv85, i8* getelementptr inbounds ([9 x i8]* @.str21, i32 0, i32 0), i32 %71)
  %72 = load volatile i32* bitcast (%union.U1* @g_361 to i32*), align 4
  %conv86 = sext i32 %72 to i64
  %73 = load i32* %print_hash_value, align 4
  call void @transparent_crc(i64 %conv86, i8* getelementptr inbounds ([9 x i8]* @.str22, i32 0, i32 0), i32 %73)
  %74 = load volatile i16* bitcast (%union.U1* @g_361 to i16*), align 2
  %conv87 = sext i16 %74 to i64
  %75 = load i32* %print_hash_value, align 4
  call void @transparent_crc(i64 %conv87, i8* getelementptr inbounds ([9 x i8]* @.str23, i32 0, i32 0), i32 %75)
  %76 = load volatile i32* bitcast (%union.U1* @g_361 to i32*), align 4
  %conv88 = sext i32 %76 to i64
  %77 = load i32* %print_hash_value, align 4
  call void @transparent_crc(i64 %conv88, i8* getelementptr inbounds ([9 x i8]* @.str24, i32 0, i32 0), i32 %77)
  store i32 0, i32* %i, align 4
  br label %for.cond89

for.cond89:                                       ; preds = %for.inc100, %for.end80
  %78 = load i32* %i, align 4
  %cmp90 = icmp slt i32 %78, 5
  br i1 %cmp90, label %for.body92, label %for.end102

for.body92:                                       ; preds = %for.cond89
  %79 = load i32* %i, align 4
  %idxprom93 = sext i32 %79 to i64
  %arrayidx94 = getelementptr inbounds [5 x i16]* @g_364, i32 0, i64 %idxprom93
  %80 = load i16* %arrayidx94, align 2
  %conv95 = zext i16 %80 to i64
  %81 = load i32* %print_hash_value, align 4
  call void @transparent_crc(i64 %conv95, i8* getelementptr inbounds ([9 x i8]* @.str25, i32 0, i32 0), i32 %81)
  %82 = load i32* %print_hash_value, align 4
  %tobool96 = icmp ne i32 %82, 0
  br i1 %tobool96, label %if.then97, label %if.end99

if.then97:                                        ; preds = %for.body92
  %83 = load i32* %i, align 4
  %call98 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([14 x i8]* @.str15, i32 0, i32 0), i32 %83)
  br label %if.end99

if.end99:                                         ; preds = %if.then97, %for.body92
  br label %for.inc100

for.inc100:                                       ; preds = %if.end99
  %84 = load i32* %i, align 4
  %inc101 = add nsw i32 %84, 1
  store i32 %inc101, i32* %i, align 4
  br label %for.cond89

for.end102:                                       ; preds = %for.cond89
  %85 = load i32* %print_hash_value, align 4
  call void @transparent_crc(i64 -6, i8* getelementptr inbounds ([6 x i8]* @.str26, i32 0, i32 0), i32 %85)
  %86 = load volatile i8* @g_462, align 1
  %conv103 = sext i8 %86 to i64
  %87 = load i32* %print_hash_value, align 4
  call void @transparent_crc(i64 %conv103, i8* getelementptr inbounds ([6 x i8]* @.str27, i32 0, i32 0), i32 %87)
  %88 = load i32* @g_471, align 4
  %conv104 = sext i32 %88 to i64
  %89 = load i32* %print_hash_value, align 4
  call void @transparent_crc(i64 %conv104, i8* getelementptr inbounds ([6 x i8]* @.str28, i32 0, i32 0), i32 %89)
  %90 = load volatile i8* bitcast (%union.U1* @g_536 to i8*), align 1
  %conv105 = sext i8 %90 to i64
  %91 = load i32* %print_hash_value, align 4
  call void @transparent_crc(i64 %conv105, i8* getelementptr inbounds ([9 x i8]* @.str29, i32 0, i32 0), i32 %91)
  %92 = load i16* bitcast (%union.U1* @g_536 to i16*), align 2
  %conv106 = sext i16 %92 to i64
  %93 = load i32* %print_hash_value, align 4
  call void @transparent_crc(i64 %conv106, i8* getelementptr inbounds ([9 x i8]* @.str30, i32 0, i32 0), i32 %93)
  %94 = load i32* %print_hash_value, align 4
  call void @transparent_crc(i64 -663374844, i8* getelementptr inbounds ([6 x i8]* @.str31, i32 0, i32 0), i32 %94)
  %95 = load volatile i8* bitcast (%union.U1* @g_674 to i8*), align 1
  %conv107 = sext i8 %95 to i64
  %96 = load i32* %print_hash_value, align 4
  call void @transparent_crc(i64 %conv107, i8* getelementptr inbounds ([9 x i8]* @.str32, i32 0, i32 0), i32 %96)
  %97 = load i16* bitcast (%union.U1* @g_674 to i16*), align 2
  %conv108 = sext i16 %97 to i64
  %98 = load i32* %print_hash_value, align 4
  call void @transparent_crc(i64 %conv108, i8* getelementptr inbounds ([9 x i8]* @.str33, i32 0, i32 0), i32 %98)
  %99 = load i8* @g_682, align 1
  %conv109 = sext i8 %99 to i64
  %100 = load i32* %print_hash_value, align 4
  call void @transparent_crc(i64 %conv109, i8* getelementptr inbounds ([6 x i8]* @.str34, i32 0, i32 0), i32 %100)
  %101 = load i16* @g_809, align 2
  %conv110 = zext i16 %101 to i64
  %102 = load i32* %print_hash_value, align 4
  call void @transparent_crc(i64 %conv110, i8* getelementptr inbounds ([6 x i8]* @.str35, i32 0, i32 0), i32 %102)
  %103 = load volatile i8* bitcast (%union.U1* @g_815 to i8*), align 1
  %conv111 = sext i8 %103 to i64
  %104 = load i32* %print_hash_value, align 4
  call void @transparent_crc(i64 %conv111, i8* getelementptr inbounds ([9 x i8]* @.str36, i32 0, i32 0), i32 %104)
  %105 = load volatile i32* bitcast (%union.U1* @g_815 to i32*), align 4
  %conv112 = sext i32 %105 to i64
  %106 = load i32* %print_hash_value, align 4
  call void @transparent_crc(i64 %conv112, i8* getelementptr inbounds ([9 x i8]* @.str37, i32 0, i32 0), i32 %106)
  %107 = load i16* bitcast (%union.U1* @g_815 to i16*), align 2
  %conv113 = sext i16 %107 to i64
  %108 = load i32* %print_hash_value, align 4
  call void @transparent_crc(i64 %conv113, i8* getelementptr inbounds ([9 x i8]* @.str38, i32 0, i32 0), i32 %108)
  %109 = load i32* bitcast (%union.U1* @g_815 to i32*), align 4
  %conv114 = sext i32 %109 to i64
  %110 = load i32* %print_hash_value, align 4
  call void @transparent_crc(i64 %conv114, i8* getelementptr inbounds ([9 x i8]* @.str39, i32 0, i32 0), i32 %110)
  store i32 0, i32* %i, align 4
  br label %for.cond115

for.cond115:                                      ; preds = %for.inc144, %for.end102
  %111 = load i32* %i, align 4
  %cmp116 = icmp slt i32 %111, 3
  br i1 %cmp116, label %for.body118, label %for.end146

for.body118:                                      ; preds = %for.cond115
  store i32 0, i32* %j, align 4
  br label %for.cond119

for.cond119:                                      ; preds = %for.inc141, %for.body118
  %112 = load i32* %j, align 4
  %cmp120 = icmp slt i32 %112, 6
  br i1 %cmp120, label %for.body122, label %for.end143

for.body122:                                      ; preds = %for.cond119
  store i32 0, i32* %k, align 4
  br label %for.cond123

for.cond123:                                      ; preds = %for.inc138, %for.body122
  %113 = load i32* %k, align 4
  %cmp124 = icmp slt i32 %113, 1
  br i1 %cmp124, label %for.body126, label %for.end140

for.body126:                                      ; preds = %for.cond123
  %114 = load i32* %k, align 4
  %idxprom127 = sext i32 %114 to i64
  %115 = load i32* %j, align 4
  %idxprom128 = sext i32 %115 to i64
  %116 = load i32* %i, align 4
  %idxprom129 = sext i32 %116 to i64
  %arrayidx130 = getelementptr inbounds [3 x [6 x [1 x i8]]]* @g_880, i32 0, i64 %idxprom129
  %arrayidx131 = getelementptr inbounds [6 x [1 x i8]]* %arrayidx130, i32 0, i64 %idxprom128
  %arrayidx132 = getelementptr inbounds [1 x i8]* %arrayidx131, i32 0, i64 %idxprom127
  %117 = load volatile i8* %arrayidx132, align 1
  %conv133 = sext i8 %117 to i64
  %118 = load i32* %print_hash_value, align 4
  call void @transparent_crc(i64 %conv133, i8* getelementptr inbounds ([15 x i8]* @.str40, i32 0, i32 0), i32 %118)
  %119 = load i32* %print_hash_value, align 4
  %tobool134 = icmp ne i32 %119, 0
  br i1 %tobool134, label %if.then135, label %if.end137

if.then135:                                       ; preds = %for.body126
  %120 = load i32* %i, align 4
  %121 = load i32* %j, align 4
  %122 = load i32* %k, align 4
  %call136 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str5, i32 0, i32 0), i32 %120, i32 %121, i32 %122)
  br label %if.end137

if.end137:                                        ; preds = %if.then135, %for.body126
  br label %for.inc138

for.inc138:                                       ; preds = %if.end137
  %123 = load i32* %k, align 4
  %inc139 = add nsw i32 %123, 1
  store i32 %inc139, i32* %k, align 4
  br label %for.cond123

for.end140:                                       ; preds = %for.cond123
  br label %for.inc141

for.inc141:                                       ; preds = %for.end140
  %124 = load i32* %j, align 4
  %inc142 = add nsw i32 %124, 1
  store i32 %inc142, i32* %j, align 4
  br label %for.cond119

for.end143:                                       ; preds = %for.cond119
  br label %for.inc144

for.inc144:                                       ; preds = %for.end143
  %125 = load i32* %i, align 4
  %inc145 = add nsw i32 %125, 1
  store i32 %inc145, i32* %i, align 4
  br label %for.cond115

for.end146:                                       ; preds = %for.cond115
  %126 = load i32* bitcast (%union.U0* @g_886 to i32*), align 4
  %conv147 = sext i32 %126 to i64
  %127 = load i32* %print_hash_value, align 4
  call void @transparent_crc(i64 %conv147, i8* getelementptr inbounds ([9 x i8]* @.str41, i32 0, i32 0), i32 %127)
  %128 = load i8* @g_904, align 1
  %conv148 = sext i8 %128 to i64
  %129 = load i32* %print_hash_value, align 4
  call void @transparent_crc(i64 %conv148, i8* getelementptr inbounds ([6 x i8]* @.str42, i32 0, i32 0), i32 %129)
  %130 = load volatile i8* bitcast (%union.U1* @g_965 to i8*), align 1
  %conv149 = sext i8 %130 to i64
  %131 = load i32* %print_hash_value, align 4
  call void @transparent_crc(i64 %conv149, i8* getelementptr inbounds ([9 x i8]* @.str43, i32 0, i32 0), i32 %131)
  %132 = load volatile i32* bitcast (%union.U1* @g_965 to i32*), align 4
  %conv150 = sext i32 %132 to i64
  %133 = load i32* %print_hash_value, align 4
  call void @transparent_crc(i64 %conv150, i8* getelementptr inbounds ([9 x i8]* @.str44, i32 0, i32 0), i32 %133)
  %134 = load i16* bitcast (%union.U1* @g_965 to i16*), align 2
  %conv151 = sext i16 %134 to i64
  %135 = load i32* %print_hash_value, align 4
  call void @transparent_crc(i64 %conv151, i8* getelementptr inbounds ([9 x i8]* @.str45, i32 0, i32 0), i32 %135)
  %136 = load i32* bitcast (%union.U1* @g_965 to i32*), align 4
  %conv152 = sext i32 %136 to i64
  %137 = load i32* %print_hash_value, align 4
  call void @transparent_crc(i64 %conv152, i8* getelementptr inbounds ([9 x i8]* @.str46, i32 0, i32 0), i32 %137)
  %138 = load volatile i32* @g_994, align 4
  %conv153 = sext i32 %138 to i64
  %139 = load i32* %print_hash_value, align 4
  call void @transparent_crc(i64 %conv153, i8* getelementptr inbounds ([6 x i8]* @.str47, i32 0, i32 0), i32 %139)
  %140 = load volatile i16* @g_996, align 2
  %conv154 = sext i16 %140 to i64
  %141 = load i32* %print_hash_value, align 4
  call void @transparent_crc(i64 %conv154, i8* getelementptr inbounds ([6 x i8]* @.str48, i32 0, i32 0), i32 %141)
  %142 = load volatile i8* bitcast (%union.U1* @g_1037 to i8*), align 1
  %conv155 = sext i8 %142 to i64
  %143 = load i32* %print_hash_value, align 4
  call void @transparent_crc(i64 %conv155, i8* getelementptr inbounds ([10 x i8]* @.str49, i32 0, i32 0), i32 %143)
  %144 = load i16* bitcast (%union.U1* @g_1037 to i16*), align 2
  %conv156 = sext i16 %144 to i64
  %145 = load i32* %print_hash_value, align 4
  call void @transparent_crc(i64 %conv156, i8* getelementptr inbounds ([10 x i8]* @.str50, i32 0, i32 0), i32 %145)
  %146 = load volatile i64* getelementptr inbounds (%union.U1* @g_1041, i32 0, i32 0), align 8
  %147 = load i32* %print_hash_value, align 4
  call void @transparent_crc(i64 %146, i8* getelementptr inbounds ([10 x i8]* @.str51, i32 0, i32 0), i32 %147)
  %148 = load volatile i8* bitcast (%union.U1* @g_1041 to i8*), align 1
  %conv157 = sext i8 %148 to i64
  %149 = load i32* %print_hash_value, align 4
  call void @transparent_crc(i64 %conv157, i8* getelementptr inbounds ([10 x i8]* @.str52, i32 0, i32 0), i32 %149)
  %150 = load volatile i32* bitcast (%union.U1* @g_1041 to i32*), align 4
  %conv158 = sext i32 %150 to i64
  %151 = load i32* %print_hash_value, align 4
  call void @transparent_crc(i64 %conv158, i8* getelementptr inbounds ([10 x i8]* @.str53, i32 0, i32 0), i32 %151)
  %152 = load volatile i16* bitcast (%union.U1* @g_1041 to i16*), align 2
  %conv159 = sext i16 %152 to i64
  %153 = load i32* %print_hash_value, align 4
  call void @transparent_crc(i64 %conv159, i8* getelementptr inbounds ([10 x i8]* @.str54, i32 0, i32 0), i32 %153)
  %154 = load volatile i32* bitcast (%union.U1* @g_1041 to i32*), align 4
  %conv160 = sext i32 %154 to i64
  %155 = load i32* %print_hash_value, align 4
  call void @transparent_crc(i64 %conv160, i8* getelementptr inbounds ([10 x i8]* @.str55, i32 0, i32 0), i32 %155)
  %156 = load i64* getelementptr inbounds (%union.U1* @g_1050, i32 0, i32 0), align 8
  %157 = load i32* %print_hash_value, align 4
  call void @transparent_crc(i64 %156, i8* getelementptr inbounds ([10 x i8]* @.str56, i32 0, i32 0), i32 %157)
  %158 = load volatile i8* bitcast (%union.U1* @g_1050 to i8*), align 1
  %conv161 = sext i8 %158 to i64
  %159 = load i32* %print_hash_value, align 4
  call void @transparent_crc(i64 %conv161, i8* getelementptr inbounds ([10 x i8]* @.str57, i32 0, i32 0), i32 %159)
  %160 = load volatile i32* bitcast (%union.U1* @g_1050 to i32*), align 4
  %conv162 = sext i32 %160 to i64
  %161 = load i32* %print_hash_value, align 4
  call void @transparent_crc(i64 %conv162, i8* getelementptr inbounds ([10 x i8]* @.str58, i32 0, i32 0), i32 %161)
  %162 = load i16* bitcast (%union.U1* @g_1050 to i16*), align 2
  %conv163 = sext i16 %162 to i64
  %163 = load i32* %print_hash_value, align 4
  call void @transparent_crc(i64 %conv163, i8* getelementptr inbounds ([10 x i8]* @.str59, i32 0, i32 0), i32 %163)
  %164 = load i32* bitcast (%union.U1* @g_1050 to i32*), align 4
  %conv164 = sext i32 %164 to i64
  %165 = load i32* %print_hash_value, align 4
  call void @transparent_crc(i64 %conv164, i8* getelementptr inbounds ([10 x i8]* @.str60, i32 0, i32 0), i32 %165)
  %166 = load i8* @g_1053, align 1
  %conv165 = sext i8 %166 to i64
  %167 = load i32* %print_hash_value, align 4
  call void @transparent_crc(i64 %conv165, i8* getelementptr inbounds ([7 x i8]* @.str61, i32 0, i32 0), i32 %167)
  %168 = load volatile i64* getelementptr inbounds (%union.U1* @g_1103, i32 0, i32 0), align 8
  %169 = load i32* %print_hash_value, align 4
  call void @transparent_crc(i64 %168, i8* getelementptr inbounds ([10 x i8]* @.str62, i32 0, i32 0), i32 %169)
  %170 = load volatile i8* bitcast (%union.U1* @g_1103 to i8*), align 1
  %conv166 = sext i8 %170 to i64
  %171 = load i32* %print_hash_value, align 4
  call void @transparent_crc(i64 %conv166, i8* getelementptr inbounds ([10 x i8]* @.str63, i32 0, i32 0), i32 %171)
  %172 = load volatile i32* bitcast (%union.U1* @g_1103 to i32*), align 4
  %conv167 = sext i32 %172 to i64
  %173 = load i32* %print_hash_value, align 4
  call void @transparent_crc(i64 %conv167, i8* getelementptr inbounds ([10 x i8]* @.str64, i32 0, i32 0), i32 %173)
  %174 = load volatile i16* bitcast (%union.U1* @g_1103 to i16*), align 2
  %conv168 = sext i16 %174 to i64
  %175 = load i32* %print_hash_value, align 4
  call void @transparent_crc(i64 %conv168, i8* getelementptr inbounds ([10 x i8]* @.str65, i32 0, i32 0), i32 %175)
  %176 = load volatile i32* bitcast (%union.U1* @g_1103 to i32*), align 4
  %conv169 = sext i32 %176 to i64
  %177 = load i32* %print_hash_value, align 4
  call void @transparent_crc(i64 %conv169, i8* getelementptr inbounds ([10 x i8]* @.str66, i32 0, i32 0), i32 %177)
  store i32 0, i32* %i, align 4
  br label %for.cond170

for.cond170:                                      ; preds = %for.inc181, %for.end146
  %178 = load i32* %i, align 4
  %cmp171 = icmp slt i32 %178, 1
  br i1 %cmp171, label %for.body173, label %for.end183

for.body173:                                      ; preds = %for.cond170
  %179 = load i32* %i, align 4
  %idxprom174 = sext i32 %179 to i64
  %arrayidx175 = getelementptr inbounds [1 x i8]* @g_1114, i32 0, i64 %idxprom174
  %180 = load i8* %arrayidx175, align 1
  %conv176 = sext i8 %180 to i64
  %181 = load i32* %print_hash_value, align 4
  call void @transparent_crc(i64 %conv176, i8* getelementptr inbounds ([10 x i8]* @.str67, i32 0, i32 0), i32 %181)
  %182 = load i32* %print_hash_value, align 4
  %tobool177 = icmp ne i32 %182, 0
  br i1 %tobool177, label %if.then178, label %if.end180

if.then178:                                       ; preds = %for.body173
  %183 = load i32* %i, align 4
  %call179 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([14 x i8]* @.str15, i32 0, i32 0), i32 %183)
  br label %if.end180

if.end180:                                        ; preds = %if.then178, %for.body173
  br label %for.inc181

for.inc181:                                       ; preds = %if.end180
  %184 = load i32* %i, align 4
  %inc182 = add nsw i32 %184, 1
  store i32 %inc182, i32* %i, align 4
  br label %for.cond170

for.end183:                                       ; preds = %for.cond170
  %185 = load i32* @g_1427, align 4
  %conv184 = sext i32 %185 to i64
  %186 = load i32* %print_hash_value, align 4
  call void @transparent_crc(i64 %conv184, i8* getelementptr inbounds ([7 x i8]* @.str68, i32 0, i32 0), i32 %186)
  %187 = load i8* @g_1455, align 1
  %conv185 = zext i8 %187 to i64
  %188 = load i32* %print_hash_value, align 4
  call void @transparent_crc(i64 %conv185, i8* getelementptr inbounds ([7 x i8]* @.str69, i32 0, i32 0), i32 %188)
  %189 = load i64* getelementptr inbounds (%union.U1* @g_1506, i32 0, i32 0), align 8
  %190 = load i32* %print_hash_value, align 4
  call void @transparent_crc(i64 %189, i8* getelementptr inbounds ([10 x i8]* @.str70, i32 0, i32 0), i32 %190)
  %191 = load volatile i8* bitcast (%union.U1* @g_1506 to i8*), align 1
  %conv186 = sext i8 %191 to i64
  %192 = load i32* %print_hash_value, align 4
  call void @transparent_crc(i64 %conv186, i8* getelementptr inbounds ([10 x i8]* @.str71, i32 0, i32 0), i32 %192)
  %193 = load volatile i32* bitcast (%union.U1* @g_1506 to i32*), align 4
  %conv187 = sext i32 %193 to i64
  %194 = load i32* %print_hash_value, align 4
  call void @transparent_crc(i64 %conv187, i8* getelementptr inbounds ([10 x i8]* @.str72, i32 0, i32 0), i32 %194)
  %195 = load i16* bitcast (%union.U1* @g_1506 to i16*), align 2
  %conv188 = sext i16 %195 to i64
  %196 = load i32* %print_hash_value, align 4
  call void @transparent_crc(i64 %conv188, i8* getelementptr inbounds ([10 x i8]* @.str73, i32 0, i32 0), i32 %196)
  %197 = load i32* bitcast (%union.U1* @g_1506 to i32*), align 4
  %conv189 = sext i32 %197 to i64
  %198 = load i32* %print_hash_value, align 4
  call void @transparent_crc(i64 %conv189, i8* getelementptr inbounds ([10 x i8]* @.str74, i32 0, i32 0), i32 %198)
  %199 = load i32* @crc32_context, align 4
  %conv190 = zext i32 %199 to i64
  %xor = xor i64 %conv190, 4294967295
  %conv191 = trunc i64 %xor to i32
  %200 = load i32* %print_hash_value, align 4
  call void @platform_main_end(i32 %conv191, i32 %200)
  ret i32 0
}

declare i32 @strcmp(i8*, i8*) nounwind readonly

define internal void @platform_main_begin() nounwind uwtable {
entry:
  ret void
}

define internal void @crc32_gentab() nounwind uwtable {
entry:
  %crc = alloca i32, align 4
  %poly = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 -306674912, i32* %poly, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc5, %entry
  %0 = load i32* %i, align 4
  %cmp = icmp slt i32 %0, 256
  br i1 %cmp, label %for.body, label %for.end6

for.body:                                         ; preds = %for.cond
  %1 = load i32* %i, align 4
  store i32 %1, i32* %crc, align 4
  store i32 8, i32* %j, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %2 = load i32* %j, align 4
  %cmp2 = icmp sgt i32 %2, 0
  br i1 %cmp2, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %3 = load i32* %crc, align 4
  %and = and i32 %3, 1
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %for.body3
  %4 = load i32* %crc, align 4
  %shr = lshr i32 %4, 1
  %xor = xor i32 %shr, -306674912
  store i32 %xor, i32* %crc, align 4
  br label %if.end

if.else:                                          ; preds = %for.body3
  %5 = load i32* %crc, align 4
  %shr4 = lshr i32 %5, 1
  store i32 %shr4, i32* %crc, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %6 = load i32* %j, align 4
  %dec = add nsw i32 %6, -1
  store i32 %dec, i32* %j, align 4
  br label %for.cond1

for.end:                                          ; preds = %for.cond1
  %7 = load i32* %crc, align 4
  %8 = load i32* %i, align 4
  %idxprom = sext i32 %8 to i64
  %arrayidx = getelementptr inbounds [256 x i32]* @crc32_tab, i32 0, i64 %idxprom
  store i32 %7, i32* %arrayidx, align 4
  br label %for.inc5

for.inc5:                                         ; preds = %for.end
  %9 = load i32* %i, align 4
  %inc = add nsw i32 %9, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end6:                                         ; preds = %for.cond
  ret void
}

define internal i64 @func_1() nounwind uwtable {
entry:
  %retval = alloca i64, align 8
  %l_2 = alloca i32*, align 8
  %l_4 = alloca i32**, align 8
  %l_569 = alloca [10 x [8 x [3 x i32*]]], align 16
  %l_570 = alloca i32**, align 8
  %l_885 = alloca %union.U0*, align 8
  %l_1430 = alloca i16*, align 8
  %l_1429 = alloca [8 x [8 x i16**]], align 16
  %l_1445 = alloca [10 x [3 x [1 x i16]]], align 16
  %l_1454 = alloca i32*, align 8
  %l_1462 = alloca [8 x %union.U0], align 16
  %l_1463 = alloca i32*, align 8
  %l_1490 = alloca i32, align 4
  %l_1498 = alloca i64*, align 8
  %l_1497 = alloca [7 x i64**], align 16
  %l_1509 = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %agg.tmp = alloca %union.U0, align 8
  %coerce = alloca %union.U0, align 8
  %l_1399 = alloca i32*, align 8
  %l_1402 = alloca [4 x i64], align 16
  %l_1405 = alloca i32, align 4
  %l_1406 = alloca i32, align 4
  %l_1407 = alloca i32, align 4
  %l_1411 = alloca %union.U0**, align 8
  %l_1416 = alloca i32**, align 8
  %l_1420 = alloca i64, align 8
  %l_1456 = alloca i32*, align 8
  %l_1464 = alloca i32**, align 8
  %i107 = alloca i32, align 4
  %l_1400 = alloca i64, align 8
  %l_1401 = alloca i32, align 4
  %l_1408 = alloca i8, align 1
  %l_1419 = alloca %union.U0, align 8
  %l_1431 = alloca %union.U1*, align 8
  %l_1435 = alloca [5 x [4 x [7 x i32**]]], align 16
  %i112 = alloca i32, align 4
  %j113 = alloca i32, align 4
  %k114 = alloca i32, align 4
  %l_1433 = alloca i32, align 4
  %l_1436 = alloca i8, align 1
  %l_1428 = alloca [1 x [5 x i32*]], align 16
  %l_1432 = alloca %union.U0, align 8
  %l_1434 = alloca i32, align 4
  %i121 = alloca i32, align 4
  %j122 = alloca i32, align 4
  %l_1451 = alloca i64, align 8
  %l_1457 = alloca [4 x i32*], align 16
  %l_1458 = alloca %union.U0, align 8
  %l_1459 = alloca i64*, align 8
  %l_1460 = alloca i64*, align 8
  %l_1461 = alloca i32*, align 8
  %i176 = alloca i32, align 4
  %l_1469 = alloca i8, align 1
  %l_1470 = alloca i32**, align 8
  %l_1472 = alloca %union.U0, align 8
  %l_1496 = alloca i64*, align 8
  %l_1495 = alloca i64**, align 8
  %l_1508 = alloca i32, align 4
  %l_1471 = alloca [6 x [10 x i32**]], align 16
  %l_1473 = alloca i8*, align 8
  %l_1474 = alloca i8*, align 8
  %l_1475 = alloca i8*, align 8
  %l_1492 = alloca i64*, align 8
  %l_1491 = alloca i64**, align 8
  %l_1493 = alloca i64***, align 8
  %l_1494 = alloca [6 x i64***], align 16
  %l_1502 = alloca i32, align 4
  %l_1505 = alloca [7 x %union.U1*], align 16
  %i296 = alloca i32, align 4
  %j297 = alloca i32, align 4
  %l_1501 = alloca i8, align 1
  %l_1507 = alloca i64, align 8
  %l_1516 = alloca i32, align 4
  %l_1520 = alloca i32, align 4
  %l_1517 = alloca i8, align 1
  %l_1521 = alloca i32*, align 8
  store i32* @g_3, i32** %l_2, align 8
  store i32** %l_2, i32*** %l_4, align 8
  %0 = bitcast [10 x [8 x [3 x i32*]]]* %l_569 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* bitcast ([10 x [8 x [3 x i32*]]]* @func_1.l_569 to i8*), i64 1920, i32 16, i1 false)
  %arrayidx = getelementptr inbounds [10 x [8 x [3 x i32*]]]* %l_569, i32 0, i64 2
  %arrayidx1 = getelementptr inbounds [8 x [3 x i32*]]* %arrayidx, i32 0, i64 5
  %arrayidx2 = getelementptr inbounds [3 x i32*]* %arrayidx1, i32 0, i64 0
  store i32** %arrayidx2, i32*** %l_570, align 8
  store %union.U0* @g_886, %union.U0** %l_885, align 8
  store i16* bitcast (%union.U1* @g_1050 to i16*), i16** %l_1430, align 8
  %arrayinit.begin = getelementptr inbounds [8 x [8 x i16**]]* %l_1429, i64 0, i64 0
  %arrayinit.begin3 = getelementptr inbounds [8 x i16**]* %arrayinit.begin, i64 0, i64 0
  store i16** %l_1430, i16*** %arrayinit.begin3
  %arrayinit.element = getelementptr inbounds i16*** %arrayinit.begin3, i64 1
  store i16** %l_1430, i16*** %arrayinit.element
  %arrayinit.element4 = getelementptr inbounds i16*** %arrayinit.element, i64 1
  store i16** %l_1430, i16*** %arrayinit.element4
  %arrayinit.element5 = getelementptr inbounds i16*** %arrayinit.element4, i64 1
  store i16** %l_1430, i16*** %arrayinit.element5
  %arrayinit.element6 = getelementptr inbounds i16*** %arrayinit.element5, i64 1
  store i16** %l_1430, i16*** %arrayinit.element6
  %arrayinit.element7 = getelementptr inbounds i16*** %arrayinit.element6, i64 1
  store i16** %l_1430, i16*** %arrayinit.element7
  %arrayinit.element8 = getelementptr inbounds i16*** %arrayinit.element7, i64 1
  store i16** %l_1430, i16*** %arrayinit.element8
  %arrayinit.element9 = getelementptr inbounds i16*** %arrayinit.element8, i64 1
  store i16** %l_1430, i16*** %arrayinit.element9
  %arrayinit.element10 = getelementptr inbounds [8 x i16**]* %arrayinit.begin, i64 1
  %arrayinit.begin11 = getelementptr inbounds [8 x i16**]* %arrayinit.element10, i64 0, i64 0
  store i16** %l_1430, i16*** %arrayinit.begin11
  %arrayinit.element12 = getelementptr inbounds i16*** %arrayinit.begin11, i64 1
  store i16** %l_1430, i16*** %arrayinit.element12
  %arrayinit.element13 = getelementptr inbounds i16*** %arrayinit.element12, i64 1
  store i16** %l_1430, i16*** %arrayinit.element13
  %arrayinit.element14 = getelementptr inbounds i16*** %arrayinit.element13, i64 1
  store i16** %l_1430, i16*** %arrayinit.element14
  %arrayinit.element15 = getelementptr inbounds i16*** %arrayinit.element14, i64 1
  store i16** %l_1430, i16*** %arrayinit.element15
  %arrayinit.element16 = getelementptr inbounds i16*** %arrayinit.element15, i64 1
  store i16** %l_1430, i16*** %arrayinit.element16
  %arrayinit.element17 = getelementptr inbounds i16*** %arrayinit.element16, i64 1
  store i16** %l_1430, i16*** %arrayinit.element17
  %arrayinit.element18 = getelementptr inbounds i16*** %arrayinit.element17, i64 1
  store i16** %l_1430, i16*** %arrayinit.element18
  %arrayinit.element19 = getelementptr inbounds [8 x i16**]* %arrayinit.element10, i64 1
  %arrayinit.begin20 = getelementptr inbounds [8 x i16**]* %arrayinit.element19, i64 0, i64 0
  store i16** %l_1430, i16*** %arrayinit.begin20
  %arrayinit.element21 = getelementptr inbounds i16*** %arrayinit.begin20, i64 1
  store i16** %l_1430, i16*** %arrayinit.element21
  %arrayinit.element22 = getelementptr inbounds i16*** %arrayinit.element21, i64 1
  store i16** %l_1430, i16*** %arrayinit.element22
  %arrayinit.element23 = getelementptr inbounds i16*** %arrayinit.element22, i64 1
  store i16** %l_1430, i16*** %arrayinit.element23
  %arrayinit.element24 = getelementptr inbounds i16*** %arrayinit.element23, i64 1
  store i16** %l_1430, i16*** %arrayinit.element24
  %arrayinit.element25 = getelementptr inbounds i16*** %arrayinit.element24, i64 1
  store i16** %l_1430, i16*** %arrayinit.element25
  %arrayinit.element26 = getelementptr inbounds i16*** %arrayinit.element25, i64 1
  store i16** %l_1430, i16*** %arrayinit.element26
  %arrayinit.element27 = getelementptr inbounds i16*** %arrayinit.element26, i64 1
  store i16** %l_1430, i16*** %arrayinit.element27
  %arrayinit.element28 = getelementptr inbounds [8 x i16**]* %arrayinit.element19, i64 1
  %arrayinit.begin29 = getelementptr inbounds [8 x i16**]* %arrayinit.element28, i64 0, i64 0
  store i16** %l_1430, i16*** %arrayinit.begin29
  %arrayinit.element30 = getelementptr inbounds i16*** %arrayinit.begin29, i64 1
  store i16** %l_1430, i16*** %arrayinit.element30
  %arrayinit.element31 = getelementptr inbounds i16*** %arrayinit.element30, i64 1
  store i16** %l_1430, i16*** %arrayinit.element31
  %arrayinit.element32 = getelementptr inbounds i16*** %arrayinit.element31, i64 1
  store i16** %l_1430, i16*** %arrayinit.element32
  %arrayinit.element33 = getelementptr inbounds i16*** %arrayinit.element32, i64 1
  store i16** %l_1430, i16*** %arrayinit.element33
  %arrayinit.element34 = getelementptr inbounds i16*** %arrayinit.element33, i64 1
  store i16** %l_1430, i16*** %arrayinit.element34
  %arrayinit.element35 = getelementptr inbounds i16*** %arrayinit.element34, i64 1
  store i16** %l_1430, i16*** %arrayinit.element35
  %arrayinit.element36 = getelementptr inbounds i16*** %arrayinit.element35, i64 1
  store i16** %l_1430, i16*** %arrayinit.element36
  %arrayinit.element37 = getelementptr inbounds [8 x i16**]* %arrayinit.element28, i64 1
  %arrayinit.begin38 = getelementptr inbounds [8 x i16**]* %arrayinit.element37, i64 0, i64 0
  store i16** %l_1430, i16*** %arrayinit.begin38
  %arrayinit.element39 = getelementptr inbounds i16*** %arrayinit.begin38, i64 1
  store i16** %l_1430, i16*** %arrayinit.element39
  %arrayinit.element40 = getelementptr inbounds i16*** %arrayinit.element39, i64 1
  store i16** %l_1430, i16*** %arrayinit.element40
  %arrayinit.element41 = getelementptr inbounds i16*** %arrayinit.element40, i64 1
  store i16** %l_1430, i16*** %arrayinit.element41
  %arrayinit.element42 = getelementptr inbounds i16*** %arrayinit.element41, i64 1
  store i16** %l_1430, i16*** %arrayinit.element42
  %arrayinit.element43 = getelementptr inbounds i16*** %arrayinit.element42, i64 1
  store i16** %l_1430, i16*** %arrayinit.element43
  %arrayinit.element44 = getelementptr inbounds i16*** %arrayinit.element43, i64 1
  store i16** %l_1430, i16*** %arrayinit.element44
  %arrayinit.element45 = getelementptr inbounds i16*** %arrayinit.element44, i64 1
  store i16** %l_1430, i16*** %arrayinit.element45
  %arrayinit.element46 = getelementptr inbounds [8 x i16**]* %arrayinit.element37, i64 1
  %arrayinit.begin47 = getelementptr inbounds [8 x i16**]* %arrayinit.element46, i64 0, i64 0
  store i16** %l_1430, i16*** %arrayinit.begin47
  %arrayinit.element48 = getelementptr inbounds i16*** %arrayinit.begin47, i64 1
  store i16** %l_1430, i16*** %arrayinit.element48
  %arrayinit.element49 = getelementptr inbounds i16*** %arrayinit.element48, i64 1
  store i16** %l_1430, i16*** %arrayinit.element49
  %arrayinit.element50 = getelementptr inbounds i16*** %arrayinit.element49, i64 1
  store i16** %l_1430, i16*** %arrayinit.element50
  %arrayinit.element51 = getelementptr inbounds i16*** %arrayinit.element50, i64 1
  store i16** %l_1430, i16*** %arrayinit.element51
  %arrayinit.element52 = getelementptr inbounds i16*** %arrayinit.element51, i64 1
  store i16** %l_1430, i16*** %arrayinit.element52
  %arrayinit.element53 = getelementptr inbounds i16*** %arrayinit.element52, i64 1
  store i16** %l_1430, i16*** %arrayinit.element53
  %arrayinit.element54 = getelementptr inbounds i16*** %arrayinit.element53, i64 1
  store i16** %l_1430, i16*** %arrayinit.element54
  %arrayinit.element55 = getelementptr inbounds [8 x i16**]* %arrayinit.element46, i64 1
  %arrayinit.begin56 = getelementptr inbounds [8 x i16**]* %arrayinit.element55, i64 0, i64 0
  store i16** %l_1430, i16*** %arrayinit.begin56
  %arrayinit.element57 = getelementptr inbounds i16*** %arrayinit.begin56, i64 1
  store i16** %l_1430, i16*** %arrayinit.element57
  %arrayinit.element58 = getelementptr inbounds i16*** %arrayinit.element57, i64 1
  store i16** %l_1430, i16*** %arrayinit.element58
  %arrayinit.element59 = getelementptr inbounds i16*** %arrayinit.element58, i64 1
  store i16** %l_1430, i16*** %arrayinit.element59
  %arrayinit.element60 = getelementptr inbounds i16*** %arrayinit.element59, i64 1
  store i16** %l_1430, i16*** %arrayinit.element60
  %arrayinit.element61 = getelementptr inbounds i16*** %arrayinit.element60, i64 1
  store i16** %l_1430, i16*** %arrayinit.element61
  %arrayinit.element62 = getelementptr inbounds i16*** %arrayinit.element61, i64 1
  store i16** %l_1430, i16*** %arrayinit.element62
  %arrayinit.element63 = getelementptr inbounds i16*** %arrayinit.element62, i64 1
  store i16** %l_1430, i16*** %arrayinit.element63
  %arrayinit.element64 = getelementptr inbounds [8 x i16**]* %arrayinit.element55, i64 1
  %arrayinit.begin65 = getelementptr inbounds [8 x i16**]* %arrayinit.element64, i64 0, i64 0
  store i16** %l_1430, i16*** %arrayinit.begin65
  %arrayinit.element66 = getelementptr inbounds i16*** %arrayinit.begin65, i64 1
  store i16** %l_1430, i16*** %arrayinit.element66
  %arrayinit.element67 = getelementptr inbounds i16*** %arrayinit.element66, i64 1
  store i16** %l_1430, i16*** %arrayinit.element67
  %arrayinit.element68 = getelementptr inbounds i16*** %arrayinit.element67, i64 1
  store i16** %l_1430, i16*** %arrayinit.element68
  %arrayinit.element69 = getelementptr inbounds i16*** %arrayinit.element68, i64 1
  store i16** %l_1430, i16*** %arrayinit.element69
  %arrayinit.element70 = getelementptr inbounds i16*** %arrayinit.element69, i64 1
  store i16** %l_1430, i16*** %arrayinit.element70
  %arrayinit.element71 = getelementptr inbounds i16*** %arrayinit.element70, i64 1
  store i16** %l_1430, i16*** %arrayinit.element71
  %arrayinit.element72 = getelementptr inbounds i16*** %arrayinit.element71, i64 1
  store i16** %l_1430, i16*** %arrayinit.element72
  store i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 2, i64 0, i64 3), i32** %l_1454, align 8
  %1 = bitcast [8 x %union.U0]* %l_1462 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %1, i8* bitcast ([8 x %union.U0]* @func_1.l_1462 to i8*), i64 64, i32 16, i1 false)
  store i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 2, i64 0, i64 3), i32** %l_1463, align 8
  store i32 -1315397880, i32* %l_1490, align 4
  store i64* getelementptr inbounds (%union.U1* @g_965, i32 0, i32 0), i64** %l_1498, align 8
  %arrayinit.begin73 = getelementptr inbounds [7 x i64**]* %l_1497, i64 0, i64 0
  store i64** %l_1498, i64*** %arrayinit.begin73
  %arrayinit.element74 = getelementptr inbounds i64*** %arrayinit.begin73, i64 1
  store i64** %l_1498, i64*** %arrayinit.element74
  %arrayinit.element75 = getelementptr inbounds i64*** %arrayinit.element74, i64 1
  store i64** %l_1498, i64*** %arrayinit.element75
  %arrayinit.element76 = getelementptr inbounds i64*** %arrayinit.element75, i64 1
  store i64** %l_1498, i64*** %arrayinit.element76
  %arrayinit.element77 = getelementptr inbounds i64*** %arrayinit.element76, i64 1
  store i64** %l_1498, i64*** %arrayinit.element77
  %arrayinit.element78 = getelementptr inbounds i64*** %arrayinit.element77, i64 1
  store i64** %l_1498, i64*** %arrayinit.element78
  %arrayinit.element79 = getelementptr inbounds i64*** %arrayinit.element78, i64 1
  store i64** %l_1498, i64*** %arrayinit.element79
  store i32 8, i32* %l_1509, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc94, %entry
  %2 = load i32* %i, align 4
  %cmp = icmp slt i32 %2, 10
  br i1 %cmp, label %for.body, label %for.end96

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4
  br label %for.cond80

for.cond80:                                       ; preds = %for.inc91, %for.body
  %3 = load i32* %j, align 4
  %cmp81 = icmp slt i32 %3, 3
  br i1 %cmp81, label %for.body82, label %for.end93

for.body82:                                       ; preds = %for.cond80
  store i32 0, i32* %k, align 4
  br label %for.cond83

for.cond83:                                       ; preds = %for.inc, %for.body82
  %4 = load i32* %k, align 4
  %cmp84 = icmp slt i32 %4, 1
  br i1 %cmp84, label %for.body85, label %for.end

for.body85:                                       ; preds = %for.cond83
  %5 = load i32* %k, align 4
  %idxprom = sext i32 %5 to i64
  %6 = load i32* %j, align 4
  %idxprom86 = sext i32 %6 to i64
  %7 = load i32* %i, align 4
  %idxprom87 = sext i32 %7 to i64
  %arrayidx88 = getelementptr inbounds [10 x [3 x [1 x i16]]]* %l_1445, i32 0, i64 %idxprom87
  %arrayidx89 = getelementptr inbounds [3 x [1 x i16]]* %arrayidx88, i32 0, i64 %idxprom86
  %arrayidx90 = getelementptr inbounds [1 x i16]* %arrayidx89, i32 0, i64 %idxprom
  store i16 -9, i16* %arrayidx90, align 2
  br label %for.inc

for.inc:                                          ; preds = %for.body85
  %8 = load i32* %k, align 4
  %inc = add nsw i32 %8, 1
  store i32 %inc, i32* %k, align 4
  br label %for.cond83

for.end:                                          ; preds = %for.cond83
  br label %for.inc91

for.inc91:                                        ; preds = %for.end
  %9 = load i32* %j, align 4
  %inc92 = add nsw i32 %9, 1
  store i32 %inc92, i32* %j, align 4
  br label %for.cond80

for.end93:                                        ; preds = %for.cond80
  br label %for.inc94

for.inc94:                                        ; preds = %for.end93
  %10 = load i32* %i, align 4
  %inc95 = add nsw i32 %10, 1
  store i32 %inc95, i32* %i, align 4
  br label %for.cond

for.end96:                                        ; preds = %for.cond
  %11 = load i32** %l_2, align 8
  %12 = load i32*** %l_4, align 8
  store i32* %11, i32** %12, align 8
  %13 = load %union.U0** %l_885, align 8
  %call = load i32*** @g_134, align 8
  %14 = load i32** @g_258, align 8
  %15 = load i32*** %l_4, align 8
  %16 = load i32** %15, align 8
  %17 = load i64* getelementptr inbounds (%union.U0* @g_13, i32 0, i32 0)
  %call97 = call i32** @func_22(i32** %call, i32* %14, i64 %17, i32* %16)
  %arrayidx98 = getelementptr inbounds [10 x [8 x [3 x i32*]]]* %l_569, i32 0, i64 0
  %arrayidx99 = getelementptr inbounds [8 x [3 x i32*]]* %arrayidx98, i32 0, i64 4
  %arrayidx100 = getelementptr inbounds [3 x i32*]* %arrayidx99, i32 0, i64 1
  %18 = load i32** %arrayidx100, align 8
  %19 = load i32*** %l_570, align 8
  store i32* %18, i32** %19, align 8
  %call101 = call i64 @func_18(i32** %call97, i32* @g_471, i32* %18)
  %20 = load volatile i32* bitcast (%union.U1* @g_307 to i32*), align 4
  %call102 = call i64 @func_16(i32 %20)
  %coerce.dive = getelementptr %union.U0* %coerce, i32 0, i32 0
  store i64 %call102, i64* %coerce.dive
  %21 = bitcast %union.U0* %13 to i8*
  %22 = bitcast %union.U0* %coerce to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %21, i8* %22, i64 8, i32 8, i1 false)
  %23 = bitcast %union.U0* %agg.tmp to i8*
  %24 = bitcast %union.U0* %13 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %23, i8* %24, i64 8, i32 8, i1 false)
  %coerce.dive103 = getelementptr %union.U0* %agg.tmp, i32 0, i32 0
  %25 = load i64* %coerce.dive103
  %call104 = call i32 @func_14(i64 %25)
  %26 = load i32** @g_258, align 8
  %27 = load i32** @g_258, align 8
  %28 = load i32* %27, align 4
  %29 = load i64* getelementptr inbounds (%union.U0* @g_13, i32 0, i32 0)
  %call105 = call i32** @func_7(i64 %29, i32** null, i32 -6, i32* %26, i32 %28)
  %call106 = call i32 @func_5(i32** %call105)
  %tobool = icmp ne i32 %call106, 0
  br i1 %tobool, label %if.then, label %if.else224

if.then:                                          ; preds = %for.end96
  store i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 2, i64 0, i64 3), i32** %l_1399, align 8
  %30 = bitcast [4 x i64]* %l_1402 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %30, i8* bitcast ([4 x i64]* @func_1.l_1402 to i8*), i64 32, i32 16, i1 false)
  store i32 0, i32* %l_1405, align 4
  store i32 1267702649, i32* %l_1406, align 4
  store i32 -68603898, i32* %l_1407, align 4
  store %union.U0** @g_84, %union.U0*** %l_1411, align 8
  store i32** %l_2, i32*** %l_1416, align 8
  store i64 0, i64* %l_1420, align 8
  store i32* bitcast (%union.U0* @g_886 to i32*), i32** %l_1456, align 8
  store i32** %l_1399, i32*** %l_1464, align 8
  br label %lbl_1450

lbl_1450:                                         ; preds = %if.then196, %if.then
  store i8 0, i8* @g_1053, align 1
  br label %for.cond108

for.cond108:                                      ; preds = %for.inc155, %lbl_1450
  %31 = load i8* @g_1053, align 1
  %conv = sext i8 %31 to i32
  %cmp109 = icmp ne i32 %conv, 16
  br i1 %cmp109, label %for.body111, label %for.end157

for.body111:                                      ; preds = %for.cond108
  store i64 -4632762613142130370, i64* %l_1400, align 8
  store i32 1, i32* %l_1401, align 4
  store i8 2, i8* %l_1408, align 1
  %32 = bitcast %union.U0* %l_1419 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %32, i8* bitcast (%union.U0* @func_1.l_1419 to i8*), i64 8, i32 8, i1 false)
  store %union.U1* @g_1050, %union.U1** %l_1431, align 8
  %33 = bitcast [5 x [4 x [7 x i32**]]]* %l_1435 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %33, i8* bitcast ([5 x [4 x [7 x i32**]]]* @func_1.l_1435 to i8*), i64 1120, i32 16, i1 false)
  %34 = load i32** %l_1399, align 8
  %35 = load i32*** @g_134, align 8
  store i32* %34, i32** %35, align 8
  %arrayidx115 = getelementptr inbounds [4 x i64]* %l_1402, i32 0, i64 1
  %36 = load i64* %arrayidx115, align 8
  %inc116 = add i64 %36, 1
  store i64 %inc116, i64* %arrayidx115, align 8
  %37 = load i8* %l_1408, align 1
  %dec = add i8 %37, -1
  store i8 %dec, i8* %l_1408, align 1
  store i32 1, i32* bitcast (%union.U0* @g_13 to i32*), align 4
  br label %for.cond117

for.cond117:                                      ; preds = %for.inc153, %for.body111
  %38 = load i32* bitcast (%union.U0* @g_13 to i32*), align 4
  %cmp118 = icmp sle i32 %38, 4
  br i1 %cmp118, label %for.body120, label %for.end154

for.body120:                                      ; preds = %for.cond117
  store i32 257074916, i32* %l_1433, align 4
  store i8 -40, i8* %l_1436, align 1
  %39 = bitcast [1 x [5 x i32*]]* %l_1428 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %39, i8* bitcast ([1 x [5 x i32*]]* @func_1.l_1428 to i8*), i64 40, i32 16, i1 false)
  %40 = bitcast %union.U0* %l_1432 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %40, i8* bitcast (%union.U0* @func_1.l_1432 to i8*), i64 8, i32 8, i1 false)
  store i32 -1659436467, i32* %l_1434, align 4
  %41 = load i32*** %l_570, align 8
  %42 = load i32** %41, align 8
  %arrayidx123 = getelementptr inbounds [1 x [5 x i32*]]* %l_1428, i32 0, i64 0
  %arrayidx124 = getelementptr inbounds [5 x i32*]* %arrayidx123, i32 0, i64 4
  store i32* %42, i32** %arrayidx124, align 8
  %arrayidx125 = getelementptr inbounds [8 x [8 x i16**]]* %l_1429, i32 0, i64 5
  %arrayidx126 = getelementptr inbounds [8 x i16**]* %arrayidx125, i32 0, i64 0
  %43 = load i16*** %arrayidx126, align 8
  %cmp127 = icmp ne i16** getelementptr inbounds ([4 x i16*]* @g_489, i32 0, i64 0), %43
  %conv128 = zext i1 %cmp127 to i32
  %44 = load %union.U1** %l_1431, align 8
  %cmp129 = icmp eq %union.U1* %44, null
  %conv130 = zext i1 %cmp129 to i32
  %conv131 = trunc i32 %conv130 to i16
  store i16 %conv131, i16* bitcast (%union.U1* @g_307 to i16*), align 2
  %conv132 = sext i16 %conv131 to i32
  %tobool133 = icmp ne i32 %conv132, 0
  br i1 %tobool133, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %for.body120
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %for.body120
  %45 = phi i1 [ true, %for.body120 ], [ true, %lor.rhs ]
  %lor.ext = zext i1 %45 to i32
  %46 = load i32** %l_1399, align 8
  %47 = load i32* %46, align 4
  %48 = load i32* %l_1433, align 4
  %49 = load i32** @g_1426, align 8
  store i32 %48, i32* %49, align 4
  %cmp134 = icmp ne i32 %47, %48
  %conv135 = zext i1 %cmp134 to i32
  %or = or i32 %lor.ext, %conv135
  %tobool136 = icmp ne i32 %or, 0
  br i1 %tobool136, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %lor.end
  %50 = load i32* %l_1434, align 4
  %tobool137 = icmp ne i32 %50, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %lor.end
  %51 = phi i1 [ false, %lor.end ], [ %tobool137, %land.rhs ]
  %land.ext = zext i1 %51 to i32
  %neg = xor i32 %land.ext, -1
  %conv138 = sext i32 %neg to i64
  %f0 = bitcast %union.U0* %l_1419 to i64*
  %52 = load i64* %f0, align 8
  %or139 = or i64 %conv138, %52
  %conv140 = trunc i64 %or139 to i32
  store i32 %conv140, i32* getelementptr inbounds ([1 x [8 x [10 x i32]]]* @g_110, i32 0, i64 0, i64 2, i64 2), align 4
  %arrayidx141 = getelementptr inbounds [1 x [5 x i32*]]* %l_1428, i32 0, i64 0
  %arrayidx142 = getelementptr inbounds [5 x i32*]* %arrayidx141, i32 0, i64 4
  %arrayidx143 = getelementptr inbounds [5 x [4 x [7 x i32**]]]* %l_1435, i32 0, i64 4
  %arrayidx144 = getelementptr inbounds [4 x [7 x i32**]]* %arrayidx143, i32 0, i64 1
  %arrayidx145 = getelementptr inbounds [7 x i32**]* %arrayidx144, i32 0, i64 3
  %53 = load i32*** %arrayidx145, align 8
  %cmp146 = icmp ne i32** %arrayidx142, %53
  %conv147 = zext i1 %cmp146 to i32
  %conv148 = sext i32 %conv147 to i64
  %cmp149 = icmp ule i64 %conv148, -2764829524185367556
  %conv150 = zext i1 %cmp149 to i32
  %54 = load i8* %l_1436, align 1
  %conv151 = zext i8 %54 to i32
  %and = and i32 %conv151, %conv150
  %conv152 = trunc i32 %and to i8
  store i8 %conv152, i8* %l_1436, align 1
  br label %for.inc153

for.inc153:                                       ; preds = %land.end
  %55 = load i32* bitcast (%union.U0* @g_13 to i32*), align 4
  %add = add nsw i32 %55, 1
  store i32 %add, i32* bitcast (%union.U0* @g_13 to i32*), align 4
  br label %for.cond117

for.end154:                                       ; preds = %for.cond117
  br label %for.inc155

for.inc155:                                       ; preds = %for.end154
  %56 = load i8* @g_1053, align 1
  %inc156 = add i8 %56, 1
  store i8 %inc156, i8* @g_1053, align 1
  br label %for.cond108

for.end157:                                       ; preds = %for.cond108
  %57 = load volatile i8* bitcast (%union.U1* @g_1041 to i8*), align 1
  %58 = load i16*** @g_416, align 8
  %59 = load i16** %58, align 8
  %60 = load i16* %59, align 2
  %call158 = call zeroext i16 @safe_div_func_uint16_t_u_u(i16 zeroext -1, i16 zeroext %60)
  %61 = load i8* @g_1053, align 1
  %62 = load volatile i8* @g_462, align 1
  %conv159 = sext i8 %62 to i32
  %call160 = call zeroext i8 @safe_lshift_func_uint8_t_u_u(i8 zeroext %61, i32 %conv159)
  %conv161 = zext i8 %call160 to i32
  %63 = load i16** @g_417, align 8
  %64 = load i16* %63, align 2
  %call162 = call zeroext i16 @safe_mul_func_uint16_t_u_u(i16 zeroext -2401, i16 zeroext %64)
  %conv163 = zext i16 %call162 to i32
  %cmp164 = icmp sle i32 %conv161, %conv163
  %conv165 = zext i1 %cmp164 to i32
  %65 = load volatile i16**** @g_985, align 8
  %66 = load i16*** %65, align 8
  %67 = load i16** %66, align 8
  %68 = load i16* %67, align 2
  %call166 = call zeroext i16 @safe_lshift_func_uint16_t_u_s(i16 zeroext %68, i32 13)
  %arrayidx167 = getelementptr inbounds [10 x [3 x [1 x i16]]]* %l_1445, i32 0, i64 4
  %arrayidx168 = getelementptr inbounds [3 x [1 x i16]]* %arrayidx167, i32 0, i64 0
  %arrayidx169 = getelementptr inbounds [1 x i16]* %arrayidx168, i32 0, i64 0
  %69 = load i16* %arrayidx169, align 2
  %conv170 = sext i16 %69 to i32
  %70 = load i8* @g_904, align 1
  %conv171 = sext i8 %70 to i32
  %cmp172 = icmp sge i32 %conv170, %conv171
  br i1 %cmp172, label %if.then174, label %if.else

if.then174:                                       ; preds = %for.end157
  %71 = load volatile i32* getelementptr inbounds ([7 x i32]* @g_213, i32 0, i64 4), align 4
  %conv175 = sext i32 %71 to i64
  store i64 %conv175, i64* %retval
  br label %return

if.else:                                          ; preds = %for.end157
  store i64 -1, i64* %l_1451, align 8
  %72 = bitcast %union.U0* %l_1458 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %72, i8* bitcast (%union.U0* @func_1.l_1458 to i8*), i64 8, i32 8, i1 false)
  store i64* getelementptr inbounds (%union.U1* @g_1037, i32 0, i32 0), i64** %l_1459, align 8
  store i64* %l_1420, i64** %l_1460, align 8
  store i32* @g_322, i32** %l_1461, align 8
  store i32 0, i32* %i176, align 4
  br label %for.cond177

for.cond177:                                      ; preds = %for.inc183, %if.else
  %73 = load i32* %i176, align 4
  %cmp178 = icmp slt i32 %73, 4
  br i1 %cmp178, label %for.body180, label %for.end185

for.body180:                                      ; preds = %for.cond177
  %74 = load i32* %i176, align 4
  %idxprom181 = sext i32 %74 to i64
  %arrayidx182 = getelementptr inbounds [4 x i32*]* %l_1457, i32 0, i64 %idxprom181
  store i32* null, i32** %arrayidx182, align 8
  br label %for.inc183

for.inc183:                                       ; preds = %for.body180
  %75 = load i32* %i176, align 4
  %inc184 = add nsw i32 %75, 1
  store i32 %inc184, i32* %i176, align 4
  br label %for.cond177

for.end185:                                       ; preds = %for.cond177
  store i32 -28, i32* bitcast (%union.U1* @g_965 to i32*), align 4
  br label %for.cond186

for.cond186:                                      ; preds = %for.inc202, %for.end185
  %76 = load i32* bitcast (%union.U1* @g_965 to i32*), align 4
  %cmp187 = icmp sle i32 %76, 18
  br i1 %cmp187, label %for.body189, label %for.end204

for.body189:                                      ; preds = %for.cond186
  store i8 -1, i8* @g_182, align 1
  br label %for.cond190

for.cond190:                                      ; preds = %for.inc197, %for.body189
  %77 = load i8* @g_182, align 1
  %conv191 = zext i8 %77 to i32
  %cmp192 = icmp sgt i32 %conv191, 14
  br i1 %cmp192, label %for.body194, label %for.end201

for.body194:                                      ; preds = %for.cond190
  %78 = load i8* @g_904, align 1
  %tobool195 = icmp ne i8 %78, 0
  br i1 %tobool195, label %if.then196, label %if.end

if.then196:                                       ; preds = %for.body194
  br label %lbl_1450

if.end:                                           ; preds = %for.body194
  br label %for.inc197

for.inc197:                                       ; preds = %if.end
  %79 = load i8* @g_182, align 1
  %conv198 = zext i8 %79 to i16
  %call199 = call zeroext i16 @safe_add_func_uint16_t_u_u(i16 zeroext %conv198, i16 zeroext 6)
  %conv200 = trunc i16 %call199 to i8
  store i8 %conv200, i8* @g_182, align 1
  br label %for.cond190

for.end201:                                       ; preds = %for.cond190
  br label %for.inc202

for.inc202:                                       ; preds = %for.end201
  %80 = load i32* bitcast (%union.U1* @g_965 to i32*), align 4
  %inc203 = add nsw i32 %80, 1
  store i32 %inc203, i32* bitcast (%union.U1* @g_965 to i32*), align 4
  br label %for.cond186

for.end204:                                       ; preds = %for.cond186
  %81 = load i64* %l_1451, align 8
  %82 = load i32** %l_1399, align 8
  %83 = load i32* %82, align 4
  %conv205 = sext i32 %83 to i64
  %and206 = and i64 %conv205, %81
  %conv207 = trunc i64 %and206 to i32
  store i32 %conv207, i32* %82, align 4
  %84 = load i32** @g_1426, align 8
  store i32 %conv207, i32* %84, align 4
  %85 = load i16** @g_417, align 8
  %86 = load i16* %85, align 2
  %conv208 = zext i16 %86 to i32
  %tobool209 = icmp ne i32 %conv208, 0
  br i1 %tobool209, label %land.rhs210, label %land.end217

land.rhs210:                                      ; preds = %for.end204
  %87 = load i32*** %l_1464, align 8
  %call211 = call i32 @func_5(i32** %87)
  %88 = load i16*** @g_416, align 8
  %89 = load i16** %88, align 8
  %90 = load i16* %89, align 2
  %conv212 = zext i16 %90 to i32
  %and213 = and i32 %conv212, %call211
  %conv214 = trunc i32 %and213 to i16
  store i16 %conv214, i16* %89, align 2
  %conv215 = zext i16 %conv214 to i32
  %tobool216 = icmp ne i32 %conv215, 0
  br label %land.end217

land.end217:                                      ; preds = %land.rhs210, %for.end204
  %91 = phi i1 [ false, %for.end204 ], [ %tobool216, %land.rhs210 ]
  %land.ext218 = zext i1 %91 to i32
  %92 = load i8* @g_1455, align 1
  %conv219 = zext i8 %92 to i32
  %cmp220 = icmp eq i32 %land.ext218, %conv219
  %conv221 = zext i1 %cmp220 to i32
  %93 = load i32** %l_1456, align 8
  %94 = load i32* %93, align 4
  %and222 = and i32 %94, %conv221
  store i32 %and222, i32* %93, align 4
  %95 = load i32** %l_1463, align 8
  %96 = load i32* %95, align 4
  %97 = load i32*** %l_1464, align 8
  %98 = load i32** %97, align 8
  store i32 %96, i32* %98, align 4
  br label %if.end223

if.end223:                                        ; preds = %land.end217
  br label %if.end464

if.else224:                                       ; preds = %for.end96
  store i8 0, i8* %l_1469, align 1
  store i32** %l_1454, i32*** %l_1470, align 8
  %99 = bitcast %union.U0* %l_1472 to i8*
  call void @llvm.memset.p0i8.i64(i8* %99, i8 0, i64 8, i32 8, i1 false)
  store i64* getelementptr inbounds (%union.U1* @g_1050, i32 0, i32 0), i64** %l_1496, align 8
  store i64** %l_1496, i64*** %l_1495, align 8
  store i32 -1, i32* %l_1508, align 4
  br label %lbl_1526

lbl_1526:                                         ; preds = %if.then441, %if.else224
  store i32 -9, i32* bitcast (%union.U1* @g_815 to i32*), align 4
  br label %for.cond225

for.cond225:                                      ; preds = %for.inc449, %lbl_1526
  %100 = load i32* bitcast (%union.U1* @g_815 to i32*), align 4
  %cmp226 = icmp slt i32 %100, -20
  br i1 %cmp226, label %for.body228, label %for.end453

for.body228:                                      ; preds = %for.cond225
  %arrayinit.begin229 = getelementptr inbounds [6 x [10 x i32**]]* %l_1471, i64 0, i64 0
  %arrayinit.begin230 = getelementptr inbounds [10 x i32**]* %arrayinit.begin229, i64 0, i64 0
  store i32** %l_1454, i32*** %arrayinit.begin230
  %arrayinit.element231 = getelementptr inbounds i32*** %arrayinit.begin230, i64 1
  store i32** @g_278, i32*** %arrayinit.element231
  %arrayinit.element232 = getelementptr inbounds i32*** %arrayinit.element231, i64 1
  store i32** @g_278, i32*** %arrayinit.element232
  %arrayinit.element233 = getelementptr inbounds i32*** %arrayinit.element232, i64 1
  store i32** %l_1463, i32*** %arrayinit.element233
  %arrayinit.element234 = getelementptr inbounds i32*** %arrayinit.element233, i64 1
  store i32** %l_1463, i32*** %arrayinit.element234
  %arrayinit.element235 = getelementptr inbounds i32*** %arrayinit.element234, i64 1
  store i32** %l_1463, i32*** %arrayinit.element235
  %arrayinit.element236 = getelementptr inbounds i32*** %arrayinit.element235, i64 1
  store i32** %l_1463, i32*** %arrayinit.element236
  %arrayinit.element237 = getelementptr inbounds i32*** %arrayinit.element236, i64 1
  store i32** @g_278, i32*** %arrayinit.element237
  %arrayinit.element238 = getelementptr inbounds i32*** %arrayinit.element237, i64 1
  store i32** @g_278, i32*** %arrayinit.element238
  %arrayinit.element239 = getelementptr inbounds i32*** %arrayinit.element238, i64 1
  store i32** %l_1454, i32*** %arrayinit.element239
  %arrayinit.element240 = getelementptr inbounds [10 x i32**]* %arrayinit.begin229, i64 1
  %arrayinit.begin241 = getelementptr inbounds [10 x i32**]* %arrayinit.element240, i64 0, i64 0
  store i32** %l_1454, i32*** %arrayinit.begin241
  %arrayinit.element242 = getelementptr inbounds i32*** %arrayinit.begin241, i64 1
  store i32** @g_278, i32*** %arrayinit.element242
  %arrayinit.element243 = getelementptr inbounds i32*** %arrayinit.element242, i64 1
  store i32** @g_278, i32*** %arrayinit.element243
  %arrayinit.element244 = getelementptr inbounds i32*** %arrayinit.element243, i64 1
  store i32** %l_1463, i32*** %arrayinit.element244
  %arrayinit.element245 = getelementptr inbounds i32*** %arrayinit.element244, i64 1
  store i32** %l_1463, i32*** %arrayinit.element245
  %arrayinit.element246 = getelementptr inbounds i32*** %arrayinit.element245, i64 1
  store i32** %l_1463, i32*** %arrayinit.element246
  %arrayinit.element247 = getelementptr inbounds i32*** %arrayinit.element246, i64 1
  store i32** %l_1463, i32*** %arrayinit.element247
  %arrayinit.element248 = getelementptr inbounds i32*** %arrayinit.element247, i64 1
  store i32** @g_278, i32*** %arrayinit.element248
  %arrayinit.element249 = getelementptr inbounds i32*** %arrayinit.element248, i64 1
  store i32** @g_278, i32*** %arrayinit.element249
  %arrayinit.element250 = getelementptr inbounds i32*** %arrayinit.element249, i64 1
  store i32** %l_1454, i32*** %arrayinit.element250
  %arrayinit.element251 = getelementptr inbounds [10 x i32**]* %arrayinit.element240, i64 1
  %arrayinit.begin252 = getelementptr inbounds [10 x i32**]* %arrayinit.element251, i64 0, i64 0
  store i32** %l_1454, i32*** %arrayinit.begin252
  %arrayinit.element253 = getelementptr inbounds i32*** %arrayinit.begin252, i64 1
  store i32** @g_278, i32*** %arrayinit.element253
  %arrayinit.element254 = getelementptr inbounds i32*** %arrayinit.element253, i64 1
  store i32** @g_278, i32*** %arrayinit.element254
  %arrayinit.element255 = getelementptr inbounds i32*** %arrayinit.element254, i64 1
  store i32** %l_1463, i32*** %arrayinit.element255
  %arrayinit.element256 = getelementptr inbounds i32*** %arrayinit.element255, i64 1
  store i32** %l_1463, i32*** %arrayinit.element256
  %arrayinit.element257 = getelementptr inbounds i32*** %arrayinit.element256, i64 1
  store i32** %l_1463, i32*** %arrayinit.element257
  %arrayinit.element258 = getelementptr inbounds i32*** %arrayinit.element257, i64 1
  store i32** %l_1463, i32*** %arrayinit.element258
  %arrayinit.element259 = getelementptr inbounds i32*** %arrayinit.element258, i64 1
  store i32** @g_278, i32*** %arrayinit.element259
  %arrayinit.element260 = getelementptr inbounds i32*** %arrayinit.element259, i64 1
  store i32** @g_278, i32*** %arrayinit.element260
  %arrayinit.element261 = getelementptr inbounds i32*** %arrayinit.element260, i64 1
  store i32** %l_1454, i32*** %arrayinit.element261
  %arrayinit.element262 = getelementptr inbounds [10 x i32**]* %arrayinit.element251, i64 1
  %arrayinit.begin263 = getelementptr inbounds [10 x i32**]* %arrayinit.element262, i64 0, i64 0
  store i32** %l_1454, i32*** %arrayinit.begin263
  %arrayinit.element264 = getelementptr inbounds i32*** %arrayinit.begin263, i64 1
  store i32** @g_278, i32*** %arrayinit.element264
  %arrayinit.element265 = getelementptr inbounds i32*** %arrayinit.element264, i64 1
  store i32** @g_278, i32*** %arrayinit.element265
  %arrayinit.element266 = getelementptr inbounds i32*** %arrayinit.element265, i64 1
  store i32** %l_1463, i32*** %arrayinit.element266
  %arrayinit.element267 = getelementptr inbounds i32*** %arrayinit.element266, i64 1
  store i32** %l_1463, i32*** %arrayinit.element267
  %arrayinit.element268 = getelementptr inbounds i32*** %arrayinit.element267, i64 1
  store i32** %l_1463, i32*** %arrayinit.element268
  %arrayinit.element269 = getelementptr inbounds i32*** %arrayinit.element268, i64 1
  store i32** %l_1463, i32*** %arrayinit.element269
  %arrayinit.element270 = getelementptr inbounds i32*** %arrayinit.element269, i64 1
  store i32** @g_278, i32*** %arrayinit.element270
  %arrayinit.element271 = getelementptr inbounds i32*** %arrayinit.element270, i64 1
  store i32** @g_278, i32*** %arrayinit.element271
  %arrayinit.element272 = getelementptr inbounds i32*** %arrayinit.element271, i64 1
  store i32** %l_1454, i32*** %arrayinit.element272
  %arrayinit.element273 = getelementptr inbounds [10 x i32**]* %arrayinit.element262, i64 1
  %arrayinit.begin274 = getelementptr inbounds [10 x i32**]* %arrayinit.element273, i64 0, i64 0
  store i32** %l_1454, i32*** %arrayinit.begin274
  %arrayinit.element275 = getelementptr inbounds i32*** %arrayinit.begin274, i64 1
  store i32** @g_278, i32*** %arrayinit.element275
  %arrayinit.element276 = getelementptr inbounds i32*** %arrayinit.element275, i64 1
  store i32** @g_278, i32*** %arrayinit.element276
  %arrayinit.element277 = getelementptr inbounds i32*** %arrayinit.element276, i64 1
  store i32** %l_1463, i32*** %arrayinit.element277
  %arrayinit.element278 = getelementptr inbounds i32*** %arrayinit.element277, i64 1
  store i32** %l_1463, i32*** %arrayinit.element278
  %arrayinit.element279 = getelementptr inbounds i32*** %arrayinit.element278, i64 1
  store i32** %l_1463, i32*** %arrayinit.element279
  %arrayinit.element280 = getelementptr inbounds i32*** %arrayinit.element279, i64 1
  store i32** %l_1463, i32*** %arrayinit.element280
  %arrayinit.element281 = getelementptr inbounds i32*** %arrayinit.element280, i64 1
  store i32** @g_278, i32*** %arrayinit.element281
  %arrayinit.element282 = getelementptr inbounds i32*** %arrayinit.element281, i64 1
  store i32** @g_278, i32*** %arrayinit.element282
  %arrayinit.element283 = getelementptr inbounds i32*** %arrayinit.element282, i64 1
  store i32** %l_1454, i32*** %arrayinit.element283
  %arrayinit.element284 = getelementptr inbounds [10 x i32**]* %arrayinit.element273, i64 1
  %arrayinit.begin285 = getelementptr inbounds [10 x i32**]* %arrayinit.element284, i64 0, i64 0
  store i32** %l_1454, i32*** %arrayinit.begin285
  %arrayinit.element286 = getelementptr inbounds i32*** %arrayinit.begin285, i64 1
  store i32** @g_278, i32*** %arrayinit.element286
  %arrayinit.element287 = getelementptr inbounds i32*** %arrayinit.element286, i64 1
  store i32** @g_278, i32*** %arrayinit.element287
  %arrayinit.element288 = getelementptr inbounds i32*** %arrayinit.element287, i64 1
  store i32** %l_1463, i32*** %arrayinit.element288
  %arrayinit.element289 = getelementptr inbounds i32*** %arrayinit.element288, i64 1
  store i32** %l_1463, i32*** %arrayinit.element289
  %arrayinit.element290 = getelementptr inbounds i32*** %arrayinit.element289, i64 1
  store i32** %l_1463, i32*** %arrayinit.element290
  %arrayinit.element291 = getelementptr inbounds i32*** %arrayinit.element290, i64 1
  store i32** %l_1463, i32*** %arrayinit.element291
  %arrayinit.element292 = getelementptr inbounds i32*** %arrayinit.element291, i64 1
  store i32** @g_278, i32*** %arrayinit.element292
  %arrayinit.element293 = getelementptr inbounds i32*** %arrayinit.element292, i64 1
  store i32** @g_278, i32*** %arrayinit.element293
  %arrayinit.element294 = getelementptr inbounds i32*** %arrayinit.element293, i64 1
  store i32** %l_1454, i32*** %arrayinit.element294
  store i8* @g_1455, i8** %l_1473, align 8
  store i8* null, i8** %l_1474, align 8
  store i8* @g_200, i8** %l_1475, align 8
  %f0295 = bitcast %union.U0* %l_1472 to i64*
  store i64* %f0295, i64** %l_1492, align 8
  store i64** %l_1492, i64*** %l_1491, align 8
  store i64*** %l_1491, i64**** %l_1493, align 8
  store i32 1783821731, i32* %l_1502, align 4
  store i32 0, i32* %i296, align 4
  br label %for.cond298

for.cond298:                                      ; preds = %for.inc304, %for.body228
  %101 = load i32* %i296, align 4
  %cmp299 = icmp slt i32 %101, 6
  br i1 %cmp299, label %for.body301, label %for.end306

for.body301:                                      ; preds = %for.cond298
  %102 = load i32* %i296, align 4
  %idxprom302 = sext i32 %102 to i64
  %arrayidx303 = getelementptr inbounds [6 x i64***]* %l_1494, i32 0, i64 %idxprom302
  store i64*** null, i64**** %arrayidx303, align 8
  br label %for.inc304

for.inc304:                                       ; preds = %for.body301
  %103 = load i32* %i296, align 4
  %inc305 = add nsw i32 %103, 1
  store i32 %inc305, i32* %i296, align 4
  br label %for.cond298

for.end306:                                       ; preds = %for.cond298
  store i32 0, i32* %i296, align 4
  br label %for.cond307

for.cond307:                                      ; preds = %for.inc313, %for.end306
  %104 = load i32* %i296, align 4
  %cmp308 = icmp slt i32 %104, 7
  br i1 %cmp308, label %for.body310, label %for.end315

for.body310:                                      ; preds = %for.cond307
  %105 = load i32* %i296, align 4
  %idxprom311 = sext i32 %105 to i64
  %arrayidx312 = getelementptr inbounds [7 x %union.U1*]* %l_1505, i32 0, i64 %idxprom311
  store %union.U1* @g_1506, %union.U1** %arrayidx312, align 8
  br label %for.inc313

for.inc313:                                       ; preds = %for.body310
  %106 = load i32* %i296, align 4
  %inc314 = add nsw i32 %106, 1
  store i32 %inc314, i32* %i296, align 4
  br label %for.cond307

for.end315:                                       ; preds = %for.cond307
  %107 = load i32*** %l_1470, align 8
  %arrayidx316 = getelementptr inbounds [6 x [10 x i32**]]* %l_1471, i32 0, i64 4
  %arrayidx317 = getelementptr inbounds [10 x i32**]* %arrayidx316, i32 0, i64 8
  store i32** %107, i32*** %arrayidx317, align 8
  %call318 = call i32 @func_5(i32** %107)
  %call319 = call signext i16 @safe_lshift_func_int16_t_s_u(i16 signext 0, i32 %call318)
  %conv320 = sext i16 %call319 to i32
  %108 = load i32*** %l_1470, align 8
  %109 = load i32** %108, align 8
  store i32 %conv320, i32* %109, align 4
  %110 = load i16* getelementptr inbounds ([5 x i16]* @g_364, i32 0, i64 3), align 2
  %conv321 = zext i16 %110 to i32
  %coerce.dive322 = getelementptr %union.U0* %l_1472, i32 0, i32 0
  %111 = load i64* %coerce.dive322
  %call323 = call i32 @func_14(i64 %111)
  %112 = load i8** %l_1473, align 8
  %113 = load i8* %112, align 1
  %conv324 = zext i8 %113 to i32
  %or325 = or i32 %conv324, %call323
  %conv326 = trunc i32 %or325 to i8
  store i8 %conv326, i8* %112, align 1
  %114 = load i8** %l_1475, align 8
  store i8 %conv326, i8* %114, align 1
  %conv327 = zext i8 %conv326 to i32
  %cmp328 = icmp slt i32 %conv321, %conv327
  br i1 %cmp328, label %land.lhs.true, label %if.else384

land.lhs.true:                                    ; preds = %for.end315
  %115 = load i32* @g_322, align 4
  %tobool330 = icmp ne i32 %115, 0
  br i1 %tobool330, label %land.rhs331, label %land.end333

land.rhs331:                                      ; preds = %land.lhs.true
  %116 = load volatile i64* getelementptr inbounds (%union.U1* @g_1103, i32 0, i32 0), align 8
  %tobool332 = icmp ne i64 %116, 0
  br label %land.end333

land.end333:                                      ; preds = %land.rhs331, %land.lhs.true
  %117 = phi i1 [ false, %land.lhs.true ], [ %tobool332, %land.rhs331 ]
  %land.ext334 = zext i1 %117 to i32
  %call335 = call i32 @safe_sub_func_int32_t_s_s(i32 %land.ext334, i32 -543448899)
  %conv336 = trunc i32 %call335 to i16
  %call337 = call zeroext i16 @safe_lshift_func_uint16_t_u_s(i16 zeroext -19591, i32 14)
  %conv338 = zext i16 %call337 to i32
  %118 = load i64*** %l_1491, align 8
  %119 = load i64**** %l_1493, align 8
  store i64** %118, i64*** %119, align 8
  store i64** %118, i64*** %l_1495, align 8
  %arrayidx339 = getelementptr inbounds [7 x i64**]* %l_1497, i32 0, i64 1
  %120 = load i64*** %arrayidx339, align 8
  %cmp340 = icmp eq i64** %118, %120
  %conv341 = zext i1 %cmp340 to i32
  %121 = load i8** %l_1473, align 8
  %122 = load i8* %121, align 1
  %conv342 = zext i8 %122 to i32
  %and343 = and i32 %conv342, %conv341
  %conv344 = trunc i32 %and343 to i8
  store i8 %conv344, i8* %121, align 1
  %conv345 = zext i8 %conv344 to i32
  %cmp346 = icmp sle i32 %conv338, %conv345
  %conv347 = zext i1 %cmp346 to i32
  %123 = load i32** @g_1127, align 8
  %124 = load i32* %123, align 4
  %cmp348 = icmp ule i32 %conv347, %124
  %conv349 = zext i1 %cmp348 to i32
  %125 = load i32*** %l_1470, align 8
  %126 = load i32** %125, align 8
  %127 = load i32* %126, align 4
  %conv350 = trunc i32 %127 to i16
  %call351 = call signext i16 @safe_mod_func_int16_t_s_s(i16 signext %conv350, i16 signext -27332)
  %128 = load i32** %l_1463, align 8
  %129 = load i32* %128, align 4
  %130 = load i32* @g_471, align 4
  %cmp352 = icmp eq i32 %129, %130
  %conv353 = zext i1 %cmp352 to i32
  %131 = load i16* @g_809, align 2
  %conv354 = zext i16 %131 to i32
  %cmp355 = icmp sle i32 %conv353, %conv354
  %conv356 = zext i1 %cmp355 to i32
  %132 = load i32** %l_1463, align 8
  %133 = load i32* %132, align 4
  %134 = load i32** %l_1463, align 8
  %135 = load i32* %134, align 4
  %xor = xor i32 %133, %135
  %conv357 = trunc i32 %xor to i16
  %136 = load i16* bitcast (%union.U1* @g_815 to i16*), align 2
  %call358 = call signext i16 @safe_mul_func_int16_t_s_s(i16 signext %conv357, i16 signext %136)
  %conv359 = sext i16 %call358 to i32
  %neg360 = xor i32 %conv359, -1
  %137 = load i8* @g_182, align 1
  %conv361 = zext i8 %137 to i16
  %call362 = call signext i16 @safe_mul_func_int16_t_s_s(i16 signext %conv336, i16 signext %conv361)
  %138 = load i16** @g_417, align 8
  %139 = load i16* %138, align 2
  %conv363 = zext i16 %139 to i32
  %call364 = call signext i16 @safe_rshift_func_int16_t_s_u(i16 signext %call362, i32 %conv363)
  %conv365 = sext i16 %call364 to i64
  %cmp366 = icmp uge i64 %conv365, -8452422497309763652
  %conv367 = zext i1 %cmp366 to i32
  %conv368 = trunc i32 %conv367 to i16
  %140 = load i16** @g_417, align 8
  %141 = load i16* %140, align 2
  %conv369 = zext i16 %141 to i32
  %call370 = call signext i16 @safe_rshift_func_int16_t_s_u(i16 signext %conv368, i32 %conv369)
  %conv371 = sext i16 %call370 to i32
  %tobool372 = icmp ne i32 %conv371, 0
  br i1 %tobool372, label %if.then373, label %if.else384

if.then373:                                       ; preds = %land.end333
  store i32 0, i32* bitcast (%union.U1* @g_536 to i32*), align 4
  br label %for.cond374

for.cond374:                                      ; preds = %for.inc381, %if.then373
  %142 = load i32* bitcast (%union.U1* @g_536 to i32*), align 4
  %cmp375 = icmp ne i32 %142, -2
  br i1 %cmp375, label %for.body377, label %for.end383

for.body377:                                      ; preds = %for.cond374
  store i8 -75, i8* %l_1501, align 1
  %143 = load i32** @g_1127, align 8
  store i32 -492378603, i32* %143, align 4
  %144 = load i8* %l_1501, align 1
  %conv378 = zext i8 %144 to i32
  %cmp379 = icmp eq i32 -492378603, %conv378
  %conv380 = zext i1 %cmp379 to i32
  store i32 %conv380, i32* %l_1502, align 4
  %145 = load volatile i64* getelementptr inbounds (%union.U1* @g_1041, i32 0, i32 0), align 8
  store i64 %145, i64* %retval
  br label %return

for.inc381:                                       ; No predecessors!
  %146 = load i32* bitcast (%union.U1* @g_536 to i32*), align 4
  %dec382 = add nsw i32 %146, -1
  store i32 %dec382, i32* bitcast (%union.U1* @g_536 to i32*), align 4
  br label %for.cond374

for.end383:                                       ; preds = %for.cond374
  br label %if.end397

if.else384:                                       ; preds = %land.end333, %for.end315
  %f1 = bitcast %union.U0* %l_1472 to i32*
  store i32 -19, i32* %f1, align 4
  br label %for.cond385

for.cond385:                                      ; preds = %for.inc392, %if.else384
  %f1386 = bitcast %union.U0* %l_1472 to i32*
  %147 = load i32* %f1386, align 4
  %cmp387 = icmp ne i32 %147, -17
  br i1 %cmp387, label %for.body389, label %for.end395

for.body389:                                      ; preds = %for.cond385
  store i64 -8, i64* %l_1507, align 8
  %148 = load volatile i32** @g_868, align 8
  %149 = load i32* %148, align 4
  %150 = load i32** @g_258, align 8
  store i32 %149, i32* %150, align 4
  %arrayidx390 = getelementptr inbounds [7 x %union.U1*]* %l_1505, i32 0, i64 6
  store %union.U1* null, %union.U1** %arrayidx390, align 8
  %151 = load i32* %l_1509, align 4
  %dec391 = add i32 %151, -1
  store i32 %dec391, i32* %l_1509, align 4
  br label %for.inc392

for.inc392:                                       ; preds = %for.body389
  %f1393 = bitcast %union.U0* %l_1472 to i32*
  %152 = load i32* %f1393, align 4
  %inc394 = add nsw i32 %152, 1
  store i32 %inc394, i32* %f1393, align 4
  br label %for.cond385

for.end395:                                       ; preds = %for.cond385
  %153 = load volatile i32* bitcast (%union.U1* @g_965 to i32*), align 4
  %conv396 = sext i32 %153 to i64
  store i64 %conv396, i64* %retval
  br label %return

if.end397:                                        ; preds = %for.end383
  store i32 -26, i32* %l_1502, align 4
  br label %for.cond398

for.cond398:                                      ; preds = %for.inc446, %if.end397
  %154 = load i32* %l_1502, align 4
  %cmp399 = icmp uge i32 %154, 9
  br i1 %cmp399, label %for.body401, label %for.end448

for.body401:                                      ; preds = %for.cond398
  store i32 -406842607, i32* %l_1516, align 4
  store i32 -1646461151, i32* %l_1520, align 4
  store i64 8, i64* getelementptr inbounds (%union.U1* @g_1050, i32 0, i32 0), align 8
  br label %for.cond402

for.cond402:                                      ; preds = %for.inc434, %for.body401
  %155 = load i64* getelementptr inbounds (%union.U1* @g_1050, i32 0, i32 0), align 8
  %cmp403 = icmp sge i64 %155, 0
  br i1 %cmp403, label %for.body405, label %for.end435

for.body405:                                      ; preds = %for.cond402
  store i8 -46, i8* %l_1517, align 1
  store i32* bitcast (%union.U1* @g_307 to i32*), i32** %l_1521, align 8
  %156 = load volatile i16**** @g_985, align 8
  %157 = load i16*** %156, align 8
  %158 = load i16** %157, align 8
  %159 = load i16* %158, align 2
  %conv406 = zext i16 %159 to i32
  %160 = load i32** %l_1463, align 8
  %161 = load i32* %160, align 4
  %162 = load i32* %l_1516, align 4
  %or407 = or i32 %162, %161
  store i32 %or407, i32* %l_1516, align 4
  %conv408 = trunc i32 %or407 to i16
  %call409 = call signext i16 @safe_rshift_func_int16_t_s_s(i16 signext %conv408, i32 8)
  %conv410 = sext i16 %call409 to i32
  %cmp411 = icmp sge i32 %conv406, %conv410
  %conv412 = zext i1 %cmp411 to i32
  %163 = load i8* %l_1517, align 1
  %164 = load i32*** %l_1470, align 8
  %165 = load i32** %164, align 8
  %166 = load i32* %165, align 4
  %tobool413 = icmp ne i32 %166, 0
  br i1 %tobool413, label %lor.end419, label %lor.rhs414

lor.rhs414:                                       ; preds = %for.body405
  %167 = load i16* @g_166, align 2
  %conv415 = trunc i16 %167 to i8
  %call416 = call signext i8 @safe_mul_func_int8_t_s_s(i8 signext %conv415, i8 signext -53)
  %conv417 = sext i8 %call416 to i32
  %tobool418 = icmp ne i32 %conv417, 0
  br label %lor.end419

lor.end419:                                       ; preds = %lor.rhs414, %for.body405
  %168 = phi i1 [ true, %for.body405 ], [ %tobool418, %lor.rhs414 ]
  %lor.ext420 = zext i1 %168 to i32
  %169 = load volatile i8* bitcast (%union.U1* @g_674 to i8*), align 1
  %170 = load i32* %l_1516, align 4
  %conv421 = sext i32 %170 to i64
  %cmp422 = icmp ne i64 16764, %conv421
  %conv423 = zext i1 %cmp422 to i32
  %171 = load i32* %l_1520, align 4
  %or424 = or i32 %conv423, %171
  %172 = load i8** %l_1475, align 8
  %173 = load i8* %172, align 1
  %conv425 = zext i8 %173 to i32
  %or426 = or i32 %conv425, %or424
  %conv427 = trunc i32 %or426 to i8
  store i8 %conv427, i8* %172, align 1
  %174 = load i32** @g_1127, align 8
  %175 = load i32* %174, align 4
  %176 = load i32* %l_1520, align 4
  %cmp428 = icmp eq i32 %175, %176
  %conv429 = zext i1 %cmp428 to i32
  %177 = load i16* bitcast (%union.U1* @g_536 to i16*), align 2
  %conv430 = sext i16 %177 to i32
  %cmp431 = icmp sle i32 %conv429, %conv430
  %conv432 = zext i1 %cmp431 to i32
  %178 = load i32** %l_1521, align 8
  %179 = load i32* %178, align 4
  %or433 = or i32 %179, %conv432
  store i32 %or433, i32* %178, align 4
  %180 = load volatile i64* getelementptr inbounds (%union.U1* @g_361, i32 0, i32 0), align 8
  %181 = load i8*** @g_1522, align 8
  %182 = load volatile i8**** @g_1524, align 8
  store i8** %181, i8*** %182, align 8
  br label %for.inc434

for.inc434:                                       ; preds = %lor.end419
  %183 = load i64* getelementptr inbounds (%union.U1* @g_1050, i32 0, i32 0), align 8
  %sub = sub nsw i64 %183, 1
  store i64 %sub, i64* getelementptr inbounds (%union.U1* @g_1050, i32 0, i32 0), align 8
  br label %for.cond402

for.end435:                                       ; preds = %for.cond402
  store i32 5, i32* bitcast (%union.U1* @g_965 to i32*), align 4
  br label %for.cond436

for.cond436:                                      ; preds = %for.inc443, %for.end435
  %184 = load i32* bitcast (%union.U1* @g_965 to i32*), align 4
  %cmp437 = icmp sge i32 %184, 1
  br i1 %cmp437, label %for.body439, label %for.end445

for.body439:                                      ; preds = %for.cond436
  %185 = load volatile i32* bitcast (%union.U1* @g_361 to i32*), align 4
  %186 = load i32*** %l_1470, align 8
  %187 = load i32** %186, align 8
  store i32 -6, i32* %187, align 4
  %188 = load i16* bitcast (%union.U1* @g_307 to i16*), align 2
  %tobool440 = icmp ne i16 %188, 0
  br i1 %tobool440, label %if.then441, label %if.end442

if.then441:                                       ; preds = %for.body439
  br label %lbl_1526

if.end442:                                        ; preds = %for.body439
  br label %for.inc443

for.inc443:                                       ; preds = %if.end442
  %189 = load i32* bitcast (%union.U1* @g_965 to i32*), align 4
  %sub444 = sub nsw i32 %189, 1
  store i32 %sub444, i32* bitcast (%union.U1* @g_965 to i32*), align 4
  br label %for.cond436

for.end445:                                       ; preds = %for.cond436
  %190 = load i64* getelementptr inbounds (%union.U1* @g_1050, i32 0, i32 0), align 8
  store i64 %190, i64* %retval
  br label %return

for.inc446:                                       ; No predecessors!
  %191 = load i32* %l_1502, align 4
  %call447 = call i32 @safe_add_func_int32_t_s_s(i32 %191, i32 2)
  store i32 %call447, i32* %l_1502, align 4
  br label %for.cond398

for.end448:                                       ; preds = %for.cond398
  br label %for.inc449

for.inc449:                                       ; preds = %for.end448
  %192 = load i32* bitcast (%union.U1* @g_815 to i32*), align 4
  %conv450 = trunc i32 %192 to i8
  %call451 = call signext i8 @safe_sub_func_int8_t_s_s(i8 signext %conv450, i8 signext 1)
  %conv452 = sext i8 %call451 to i32
  store i32 %conv452, i32* bitcast (%union.U1* @g_815 to i32*), align 4
  br label %for.cond225

for.end453:                                       ; preds = %for.cond225
  store i16 0, i16* bitcast (%union.U1* @g_130 to i16*), align 2
  br label %for.cond454

for.cond454:                                      ; preds = %for.inc459, %for.end453
  %193 = load i16* bitcast (%union.U1* @g_130 to i16*), align 2
  %conv455 = sext i16 %193 to i32
  %cmp456 = icmp sle i32 %conv455, 1
  br i1 %cmp456, label %for.body458, label %for.end463

for.body458:                                      ; preds = %for.cond454
  %194 = load i64* getelementptr inbounds (%union.U1* @g_1050, i32 0, i32 0), align 8
  store i64 %194, i64* %retval
  br label %return

for.inc459:                                       ; No predecessors!
  %195 = load i16* bitcast (%union.U1* @g_130 to i16*), align 2
  %conv460 = sext i16 %195 to i32
  %add461 = add nsw i32 %conv460, 1
  %conv462 = trunc i32 %add461 to i16
  store i16 %conv462, i16* bitcast (%union.U1* @g_130 to i16*), align 2
  br label %for.cond454

for.end463:                                       ; preds = %for.cond454
  br label %if.end464

if.end464:                                        ; preds = %for.end463, %if.end223
  %196 = load volatile i32** @g_65, align 8
  %197 = load i32* %196, align 4
  %198 = load i32** %l_1454, align 8
  store i32 %197, i32* %198, align 4
  %199 = load i32** @g_258, align 8
  %200 = load i32* %199, align 4
  %and465 = and i32 %200, %197
  store i32 %and465, i32* %199, align 4
  %201 = load volatile i8* bitcast (%union.U1* @g_361 to i8*), align 1
  %conv466 = sext i8 %201 to i64
  store i64 %conv466, i64* %retval
  br label %return

return:                                           ; preds = %if.end464, %for.body458, %for.end445, %for.end395, %for.body377, %if.then174
  %202 = load i64* %retval
  ret i64 %202
}

define internal void @transparent_crc(i64 %val, i8* %vname, i32 %flag) nounwind uwtable {
entry:
  %val.addr = alloca i64, align 8
  %vname.addr = alloca i8*, align 8
  %flag.addr = alloca i32, align 4
  store i64 %val, i64* %val.addr, align 8
  store i8* %vname, i8** %vname.addr, align 8
  store i32 %flag, i32* %flag.addr, align 4
  %0 = load i64* %val.addr, align 8
  call void @crc32_8bytes(i64 %0)
  %1 = load i32* %flag.addr, align 4
  %tobool = icmp ne i32 %1, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %2 = load i8** %vname.addr, align 8
  %3 = load i32* @crc32_context, align 4
  %conv = zext i32 %3 to i64
  %xor = xor i64 %conv, 4294967295
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([36 x i8]* @.str76, i32 0, i32 0), i8* %2, i64 %xor)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

declare i32 @printf(i8*, ...)

define internal void @platform_main_end(i32 %crc, i32 %flag) nounwind uwtable {
entry:
  %crc.addr = alloca i32, align 4
  %flag.addr = alloca i32, align 4
  store i32 %crc, i32* %crc.addr, align 4
  store i32 %flag, i32* %flag.addr, align 4
  %0 = load i32* %crc.addr, align 4
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([15 x i8]* @.str75, i32 0, i32 0), i32 %0)
  ret void
}

define internal void @crc32_8bytes(i64 %val) nounwind uwtable {
entry:
  %val.addr = alloca i64, align 8
  store i64 %val, i64* %val.addr, align 8
  %0 = load i64* %val.addr, align 8
  %shr = lshr i64 %0, 0
  %and = and i64 %shr, 255
  %conv = trunc i64 %and to i8
  call void @crc32_byte(i8 zeroext %conv)
  %1 = load i64* %val.addr, align 8
  %shr1 = lshr i64 %1, 8
  %and2 = and i64 %shr1, 255
  %conv3 = trunc i64 %and2 to i8
  call void @crc32_byte(i8 zeroext %conv3)
  %2 = load i64* %val.addr, align 8
  %shr4 = lshr i64 %2, 16
  %and5 = and i64 %shr4, 255
  %conv6 = trunc i64 %and5 to i8
  call void @crc32_byte(i8 zeroext %conv6)
  %3 = load i64* %val.addr, align 8
  %shr7 = lshr i64 %3, 24
  %and8 = and i64 %shr7, 255
  %conv9 = trunc i64 %and8 to i8
  call void @crc32_byte(i8 zeroext %conv9)
  %4 = load i64* %val.addr, align 8
  %shr10 = lshr i64 %4, 32
  %and11 = and i64 %shr10, 255
  %conv12 = trunc i64 %and11 to i8
  call void @crc32_byte(i8 zeroext %conv12)
  %5 = load i64* %val.addr, align 8
  %shr13 = lshr i64 %5, 40
  %and14 = and i64 %shr13, 255
  %conv15 = trunc i64 %and14 to i8
  call void @crc32_byte(i8 zeroext %conv15)
  %6 = load i64* %val.addr, align 8
  %shr16 = lshr i64 %6, 48
  %and17 = and i64 %shr16, 255
  %conv18 = trunc i64 %and17 to i8
  call void @crc32_byte(i8 zeroext %conv18)
  %7 = load i64* %val.addr, align 8
  %shr19 = lshr i64 %7, 56
  %and20 = and i64 %shr19, 255
  %conv21 = trunc i64 %and20 to i8
  call void @crc32_byte(i8 zeroext %conv21)
  ret void
}

define internal void @crc32_byte(i8 zeroext %b) nounwind uwtable {
entry:
  %b.addr = alloca i8, align 1
  store i8 %b, i8* %b.addr, align 1
  %0 = load i32* @crc32_context, align 4
  %shr = lshr i32 %0, 8
  %and = and i32 %shr, 16777215
  %1 = load i32* @crc32_context, align 4
  %2 = load i8* %b.addr, align 1
  %conv = zext i8 %2 to i32
  %xor = xor i32 %1, %conv
  %and1 = and i32 %xor, 255
  %idxprom = zext i32 %and1 to i64
  %arrayidx = getelementptr inbounds [256 x i32]* @crc32_tab, i32 0, i64 %idxprom
  %3 = load i32* %arrayidx, align 4
  %xor2 = xor i32 %and, %3
  store i32 %xor2, i32* @crc32_context, align 4
  ret void
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

define internal i32 @func_5(i32** %p_6) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %p_6.addr = alloca i32**, align 8
  %l_1374 = alloca i32, align 4
  %l_1375 = alloca i8*, align 8
  %l_1376 = alloca i64*, align 8
  %l_1377 = alloca [10 x [6 x i64*]], align 16
  %l_1378 = alloca [3 x i32], align 4
  %l_1383 = alloca i16*, align 8
  %l_1382 = alloca [8 x i16**], align 16
  %l_1386 = alloca %union.U0, align 8
  %l_1387 = alloca i32*, align 8
  %l_1388 = alloca i32*, align 8
  %l_1389 = alloca [6 x i32*], align 16
  %l_1390 = alloca i16, align 2
  %l_1393 = alloca i16, align 2
  %l_1394 = alloca i16, align 2
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %l_1381 = alloca i16**, align 8
  %l_1384 = alloca [10 x [10 x [2 x i16***]]], align 16
  %l_1385 = alloca i8*, align 8
  %i531 = alloca i32, align 4
  %j532 = alloca i32, align 4
  %k = alloca i32, align 4
  store i32** %p_6, i32*** %p_6.addr, align 8
  store i32 6, i32* %l_1374, align 4
  store i8* @g_182, i8** %l_1375, align 8
  store i64* getelementptr inbounds (%union.U0* @g_13, i32 0, i32 0), i64** %l_1376, align 8
  %0 = bitcast [10 x [6 x i64*]]* %l_1377 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* bitcast ([10 x [6 x i64*]]* @func_5.l_1377 to i8*), i64 480, i32 16, i1 false)
  store i16* getelementptr inbounds ([5 x i16]* @g_364, i32 0, i64 2), i16** %l_1383, align 8
  %1 = bitcast %union.U0* %l_1386 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %1, i8* bitcast (%union.U0* @func_5.l_1386 to i8*), i64 8, i32 8, i1 false)
  store i32* @g_471, i32** %l_1387, align 8
  store i32* @g_471, i32** %l_1388, align 8
  %2 = bitcast [6 x i32*]* %l_1389 to i8*
  call void @llvm.memset.p0i8.i64(i8* %2, i8 0, i64 48, i32 16, i1 false)
  store i16 25001, i16* %l_1390, align 2
  store i16 10042, i16* %l_1393, align 2
  store i16 -15264, i16* %l_1394, align 2
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i32* %i, align 4
  %cmp = icmp slt i32 %3, 3
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %4 = load i32* %i, align 4
  %idxprom = sext i32 %4 to i64
  %arrayidx = getelementptr inbounds [3 x i32]* %l_1378, i32 0, i64 %idxprom
  store i32 -1217320800, i32* %arrayidx, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %5 = load i32* %i, align 4
  %inc = add nsw i32 %5, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %i, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc6, %for.end
  %6 = load i32* %i, align 4
  %cmp2 = icmp slt i32 %6, 8
  br i1 %cmp2, label %for.body3, label %for.end8

for.body3:                                        ; preds = %for.cond1
  %7 = load i32* %i, align 4
  %idxprom4 = sext i32 %7 to i64
  %arrayidx5 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 %idxprom4
  store i16** %l_1383, i16*** %arrayidx5, align 8
  br label %for.inc6

for.inc6:                                         ; preds = %for.body3
  %8 = load i32* %i, align 4
  %inc7 = add nsw i32 %8, 1
  store i32 %inc7, i32* %i, align 4
  br label %for.cond1

for.end8:                                         ; preds = %for.cond1
  %9 = load i32* %l_1374, align 4
  %10 = load i8** %l_1375, align 8
  %11 = load i8* %10, align 1
  %conv = zext i8 %11 to i32
  %xor = xor i32 %conv, %9
  %conv9 = trunc i32 %xor to i8
  store i8 %conv9, i8* %10, align 1
  %call = call zeroext i8 @safe_lshift_func_uint8_t_u_u(i8 zeroext %conv9, i32 4)
  %conv10 = zext i8 %call to i32
  %arrayidx11 = getelementptr inbounds [3 x i32]* %l_1378, i32 0, i64 1
  %12 = load i32* %arrayidx11, align 4
  %xor12 = xor i32 %12, %conv10
  store i32 %xor12, i32* %arrayidx11, align 4
  %arrayidx13 = getelementptr inbounds [3 x i32]* %l_1378, i32 0, i64 0
  %13 = load i32* %arrayidx13, align 4
  %conv14 = sext i32 %13 to i64
  %and = and i64 %conv14, 3929433439
  %conv15 = trunc i64 %and to i32
  store i32 %conv15, i32* %arrayidx13, align 4
  %14 = load i32** @g_258, align 8
  store i32 %conv15, i32* %14, align 4
  %tobool = icmp ne i32 %conv15, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %for.end8
  %arrayidx16 = getelementptr inbounds [3 x i32]* %l_1378, i32 0, i64 0
  %15 = load i32* %arrayidx16, align 4
  %16 = load i32** @g_258, align 8
  store i32 %15, i32* %16, align 4
  %arrayidx17 = getelementptr inbounds [3 x i32]* %l_1378, i32 0, i64 1
  %17 = load i32**** @g_1250, align 8
  %18 = load i32*** %17, align 8
  store i32* %arrayidx17, i32** %18, align 8
  store i16 6, i16* bitcast (%union.U1* @g_536 to i16*), align 2
  br label %for.cond18

for.cond18:                                       ; preds = %for.inc542, %if.then
  %19 = load i16* bitcast (%union.U1* @g_536 to i16*), align 2
  %conv19 = sext i16 %19 to i32
  %cmp20 = icmp ne i32 %conv19, 0
  br i1 %cmp20, label %for.body22, label %for.end544

for.body22:                                       ; preds = %for.cond18
  store i16** null, i16*** %l_1381, align 8
  %arrayinit.begin = getelementptr inbounds [10 x [10 x [2 x i16***]]]* %l_1384, i64 0, i64 0
  %arrayinit.begin23 = getelementptr inbounds [10 x [2 x i16***]]* %arrayinit.begin, i64 0, i64 0
  %arrayinit.begin24 = getelementptr inbounds [2 x i16***]* %arrayinit.begin23, i64 0, i64 0
  %arrayidx25 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 2
  store i16*** %arrayidx25, i16**** %arrayinit.begin24
  %arrayinit.element = getelementptr inbounds i16**** %arrayinit.begin24, i64 1
  %arrayidx26 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 5
  store i16*** %arrayidx26, i16**** %arrayinit.element
  %arrayinit.element27 = getelementptr inbounds [2 x i16***]* %arrayinit.begin23, i64 1
  %arrayinit.begin28 = getelementptr inbounds [2 x i16***]* %arrayinit.element27, i64 0, i64 0
  %arrayidx29 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 2
  store i16*** %arrayidx29, i16**** %arrayinit.begin28
  %arrayinit.element30 = getelementptr inbounds i16**** %arrayinit.begin28, i64 1
  %arrayidx31 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 5
  store i16*** %arrayidx31, i16**** %arrayinit.element30
  %arrayinit.element32 = getelementptr inbounds [2 x i16***]* %arrayinit.element27, i64 1
  %arrayinit.begin33 = getelementptr inbounds [2 x i16***]* %arrayinit.element32, i64 0, i64 0
  %arrayidx34 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 2
  store i16*** %arrayidx34, i16**** %arrayinit.begin33
  %arrayinit.element35 = getelementptr inbounds i16**** %arrayinit.begin33, i64 1
  %arrayidx36 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 5
  store i16*** %arrayidx36, i16**** %arrayinit.element35
  %arrayinit.element37 = getelementptr inbounds [2 x i16***]* %arrayinit.element32, i64 1
  %arrayinit.begin38 = getelementptr inbounds [2 x i16***]* %arrayinit.element37, i64 0, i64 0
  %arrayidx39 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 2
  store i16*** %arrayidx39, i16**** %arrayinit.begin38
  %arrayinit.element40 = getelementptr inbounds i16**** %arrayinit.begin38, i64 1
  %arrayidx41 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 5
  store i16*** %arrayidx41, i16**** %arrayinit.element40
  %arrayinit.element42 = getelementptr inbounds [2 x i16***]* %arrayinit.element37, i64 1
  %arrayinit.begin43 = getelementptr inbounds [2 x i16***]* %arrayinit.element42, i64 0, i64 0
  %arrayidx44 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 2
  store i16*** %arrayidx44, i16**** %arrayinit.begin43
  %arrayinit.element45 = getelementptr inbounds i16**** %arrayinit.begin43, i64 1
  %arrayidx46 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 5
  store i16*** %arrayidx46, i16**** %arrayinit.element45
  %arrayinit.element47 = getelementptr inbounds [2 x i16***]* %arrayinit.element42, i64 1
  %arrayinit.begin48 = getelementptr inbounds [2 x i16***]* %arrayinit.element47, i64 0, i64 0
  %arrayidx49 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 2
  store i16*** %arrayidx49, i16**** %arrayinit.begin48
  %arrayinit.element50 = getelementptr inbounds i16**** %arrayinit.begin48, i64 1
  %arrayidx51 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 5
  store i16*** %arrayidx51, i16**** %arrayinit.element50
  %arrayinit.element52 = getelementptr inbounds [2 x i16***]* %arrayinit.element47, i64 1
  %arrayinit.begin53 = getelementptr inbounds [2 x i16***]* %arrayinit.element52, i64 0, i64 0
  %arrayidx54 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 2
  store i16*** %arrayidx54, i16**** %arrayinit.begin53
  %arrayinit.element55 = getelementptr inbounds i16**** %arrayinit.begin53, i64 1
  %arrayidx56 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 5
  store i16*** %arrayidx56, i16**** %arrayinit.element55
  %arrayinit.element57 = getelementptr inbounds [2 x i16***]* %arrayinit.element52, i64 1
  %arrayinit.begin58 = getelementptr inbounds [2 x i16***]* %arrayinit.element57, i64 0, i64 0
  %arrayidx59 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 2
  store i16*** %arrayidx59, i16**** %arrayinit.begin58
  %arrayinit.element60 = getelementptr inbounds i16**** %arrayinit.begin58, i64 1
  %arrayidx61 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 5
  store i16*** %arrayidx61, i16**** %arrayinit.element60
  %arrayinit.element62 = getelementptr inbounds [2 x i16***]* %arrayinit.element57, i64 1
  %arrayinit.begin63 = getelementptr inbounds [2 x i16***]* %arrayinit.element62, i64 0, i64 0
  %arrayidx64 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 2
  store i16*** %arrayidx64, i16**** %arrayinit.begin63
  %arrayinit.element65 = getelementptr inbounds i16**** %arrayinit.begin63, i64 1
  %arrayidx66 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 5
  store i16*** %arrayidx66, i16**** %arrayinit.element65
  %arrayinit.element67 = getelementptr inbounds [2 x i16***]* %arrayinit.element62, i64 1
  %arrayinit.begin68 = getelementptr inbounds [2 x i16***]* %arrayinit.element67, i64 0, i64 0
  %arrayidx69 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 2
  store i16*** %arrayidx69, i16**** %arrayinit.begin68
  %arrayinit.element70 = getelementptr inbounds i16**** %arrayinit.begin68, i64 1
  %arrayidx71 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 5
  store i16*** %arrayidx71, i16**** %arrayinit.element70
  %arrayinit.element72 = getelementptr inbounds [10 x [2 x i16***]]* %arrayinit.begin, i64 1
  %arrayinit.begin73 = getelementptr inbounds [10 x [2 x i16***]]* %arrayinit.element72, i64 0, i64 0
  %arrayinit.begin74 = getelementptr inbounds [2 x i16***]* %arrayinit.begin73, i64 0, i64 0
  %arrayidx75 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 2
  store i16*** %arrayidx75, i16**** %arrayinit.begin74
  %arrayinit.element76 = getelementptr inbounds i16**** %arrayinit.begin74, i64 1
  %arrayidx77 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 5
  store i16*** %arrayidx77, i16**** %arrayinit.element76
  %arrayinit.element78 = getelementptr inbounds [2 x i16***]* %arrayinit.begin73, i64 1
  %arrayinit.begin79 = getelementptr inbounds [2 x i16***]* %arrayinit.element78, i64 0, i64 0
  %arrayidx80 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 2
  store i16*** %arrayidx80, i16**** %arrayinit.begin79
  %arrayinit.element81 = getelementptr inbounds i16**** %arrayinit.begin79, i64 1
  %arrayidx82 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 5
  store i16*** %arrayidx82, i16**** %arrayinit.element81
  %arrayinit.element83 = getelementptr inbounds [2 x i16***]* %arrayinit.element78, i64 1
  %arrayinit.begin84 = getelementptr inbounds [2 x i16***]* %arrayinit.element83, i64 0, i64 0
  %arrayidx85 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 2
  store i16*** %arrayidx85, i16**** %arrayinit.begin84
  %arrayinit.element86 = getelementptr inbounds i16**** %arrayinit.begin84, i64 1
  %arrayidx87 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 5
  store i16*** %arrayidx87, i16**** %arrayinit.element86
  %arrayinit.element88 = getelementptr inbounds [2 x i16***]* %arrayinit.element83, i64 1
  %arrayinit.begin89 = getelementptr inbounds [2 x i16***]* %arrayinit.element88, i64 0, i64 0
  %arrayidx90 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 2
  store i16*** %arrayidx90, i16**** %arrayinit.begin89
  %arrayinit.element91 = getelementptr inbounds i16**** %arrayinit.begin89, i64 1
  %arrayidx92 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 5
  store i16*** %arrayidx92, i16**** %arrayinit.element91
  %arrayinit.element93 = getelementptr inbounds [2 x i16***]* %arrayinit.element88, i64 1
  %arrayinit.begin94 = getelementptr inbounds [2 x i16***]* %arrayinit.element93, i64 0, i64 0
  %arrayidx95 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 2
  store i16*** %arrayidx95, i16**** %arrayinit.begin94
  %arrayinit.element96 = getelementptr inbounds i16**** %arrayinit.begin94, i64 1
  %arrayidx97 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 5
  store i16*** %arrayidx97, i16**** %arrayinit.element96
  %arrayinit.element98 = getelementptr inbounds [2 x i16***]* %arrayinit.element93, i64 1
  %arrayinit.begin99 = getelementptr inbounds [2 x i16***]* %arrayinit.element98, i64 0, i64 0
  %arrayidx100 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 2
  store i16*** %arrayidx100, i16**** %arrayinit.begin99
  %arrayinit.element101 = getelementptr inbounds i16**** %arrayinit.begin99, i64 1
  %arrayidx102 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 5
  store i16*** %arrayidx102, i16**** %arrayinit.element101
  %arrayinit.element103 = getelementptr inbounds [2 x i16***]* %arrayinit.element98, i64 1
  %arrayinit.begin104 = getelementptr inbounds [2 x i16***]* %arrayinit.element103, i64 0, i64 0
  %arrayidx105 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 2
  store i16*** %arrayidx105, i16**** %arrayinit.begin104
  %arrayinit.element106 = getelementptr inbounds i16**** %arrayinit.begin104, i64 1
  %arrayidx107 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 5
  store i16*** %arrayidx107, i16**** %arrayinit.element106
  %arrayinit.element108 = getelementptr inbounds [2 x i16***]* %arrayinit.element103, i64 1
  %arrayinit.begin109 = getelementptr inbounds [2 x i16***]* %arrayinit.element108, i64 0, i64 0
  %arrayidx110 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 2
  store i16*** %arrayidx110, i16**** %arrayinit.begin109
  %arrayinit.element111 = getelementptr inbounds i16**** %arrayinit.begin109, i64 1
  %arrayidx112 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 5
  store i16*** %arrayidx112, i16**** %arrayinit.element111
  %arrayinit.element113 = getelementptr inbounds [2 x i16***]* %arrayinit.element108, i64 1
  %arrayinit.begin114 = getelementptr inbounds [2 x i16***]* %arrayinit.element113, i64 0, i64 0
  %arrayidx115 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 2
  store i16*** %arrayidx115, i16**** %arrayinit.begin114
  %arrayinit.element116 = getelementptr inbounds i16**** %arrayinit.begin114, i64 1
  %arrayidx117 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 5
  store i16*** %arrayidx117, i16**** %arrayinit.element116
  %arrayinit.element118 = getelementptr inbounds [2 x i16***]* %arrayinit.element113, i64 1
  %arrayinit.begin119 = getelementptr inbounds [2 x i16***]* %arrayinit.element118, i64 0, i64 0
  %arrayidx120 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 2
  store i16*** %arrayidx120, i16**** %arrayinit.begin119
  %arrayinit.element121 = getelementptr inbounds i16**** %arrayinit.begin119, i64 1
  %arrayidx122 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 5
  store i16*** %arrayidx122, i16**** %arrayinit.element121
  %arrayinit.element123 = getelementptr inbounds [10 x [2 x i16***]]* %arrayinit.element72, i64 1
  %arrayinit.begin124 = getelementptr inbounds [10 x [2 x i16***]]* %arrayinit.element123, i64 0, i64 0
  %arrayinit.begin125 = getelementptr inbounds [2 x i16***]* %arrayinit.begin124, i64 0, i64 0
  %arrayidx126 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 2
  store i16*** %arrayidx126, i16**** %arrayinit.begin125
  %arrayinit.element127 = getelementptr inbounds i16**** %arrayinit.begin125, i64 1
  %arrayidx128 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 5
  store i16*** %arrayidx128, i16**** %arrayinit.element127
  %arrayinit.element129 = getelementptr inbounds [2 x i16***]* %arrayinit.begin124, i64 1
  %arrayinit.begin130 = getelementptr inbounds [2 x i16***]* %arrayinit.element129, i64 0, i64 0
  %arrayidx131 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 2
  store i16*** %arrayidx131, i16**** %arrayinit.begin130
  %arrayinit.element132 = getelementptr inbounds i16**** %arrayinit.begin130, i64 1
  %arrayidx133 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 5
  store i16*** %arrayidx133, i16**** %arrayinit.element132
  %arrayinit.element134 = getelementptr inbounds [2 x i16***]* %arrayinit.element129, i64 1
  %arrayinit.begin135 = getelementptr inbounds [2 x i16***]* %arrayinit.element134, i64 0, i64 0
  %arrayidx136 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 2
  store i16*** %arrayidx136, i16**** %arrayinit.begin135
  %arrayinit.element137 = getelementptr inbounds i16**** %arrayinit.begin135, i64 1
  %arrayidx138 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 5
  store i16*** %arrayidx138, i16**** %arrayinit.element137
  %arrayinit.element139 = getelementptr inbounds [2 x i16***]* %arrayinit.element134, i64 1
  %arrayinit.begin140 = getelementptr inbounds [2 x i16***]* %arrayinit.element139, i64 0, i64 0
  %arrayidx141 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 2
  store i16*** %arrayidx141, i16**** %arrayinit.begin140
  %arrayinit.element142 = getelementptr inbounds i16**** %arrayinit.begin140, i64 1
  %arrayidx143 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 5
  store i16*** %arrayidx143, i16**** %arrayinit.element142
  %arrayinit.element144 = getelementptr inbounds [2 x i16***]* %arrayinit.element139, i64 1
  %arrayinit.begin145 = getelementptr inbounds [2 x i16***]* %arrayinit.element144, i64 0, i64 0
  %arrayidx146 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 2
  store i16*** %arrayidx146, i16**** %arrayinit.begin145
  %arrayinit.element147 = getelementptr inbounds i16**** %arrayinit.begin145, i64 1
  %arrayidx148 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 5
  store i16*** %arrayidx148, i16**** %arrayinit.element147
  %arrayinit.element149 = getelementptr inbounds [2 x i16***]* %arrayinit.element144, i64 1
  %arrayinit.begin150 = getelementptr inbounds [2 x i16***]* %arrayinit.element149, i64 0, i64 0
  %arrayidx151 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 2
  store i16*** %arrayidx151, i16**** %arrayinit.begin150
  %arrayinit.element152 = getelementptr inbounds i16**** %arrayinit.begin150, i64 1
  %arrayidx153 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 5
  store i16*** %arrayidx153, i16**** %arrayinit.element152
  %arrayinit.element154 = getelementptr inbounds [2 x i16***]* %arrayinit.element149, i64 1
  %arrayinit.begin155 = getelementptr inbounds [2 x i16***]* %arrayinit.element154, i64 0, i64 0
  %arrayidx156 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 2
  store i16*** %arrayidx156, i16**** %arrayinit.begin155
  %arrayinit.element157 = getelementptr inbounds i16**** %arrayinit.begin155, i64 1
  %arrayidx158 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 5
  store i16*** %arrayidx158, i16**** %arrayinit.element157
  %arrayinit.element159 = getelementptr inbounds [2 x i16***]* %arrayinit.element154, i64 1
  %arrayinit.begin160 = getelementptr inbounds [2 x i16***]* %arrayinit.element159, i64 0, i64 0
  %arrayidx161 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 2
  store i16*** %arrayidx161, i16**** %arrayinit.begin160
  %arrayinit.element162 = getelementptr inbounds i16**** %arrayinit.begin160, i64 1
  %arrayidx163 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 5
  store i16*** %arrayidx163, i16**** %arrayinit.element162
  %arrayinit.element164 = getelementptr inbounds [2 x i16***]* %arrayinit.element159, i64 1
  %arrayinit.begin165 = getelementptr inbounds [2 x i16***]* %arrayinit.element164, i64 0, i64 0
  %arrayidx166 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 2
  store i16*** %arrayidx166, i16**** %arrayinit.begin165
  %arrayinit.element167 = getelementptr inbounds i16**** %arrayinit.begin165, i64 1
  %arrayidx168 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 5
  store i16*** %arrayidx168, i16**** %arrayinit.element167
  %arrayinit.element169 = getelementptr inbounds [2 x i16***]* %arrayinit.element164, i64 1
  %arrayinit.begin170 = getelementptr inbounds [2 x i16***]* %arrayinit.element169, i64 0, i64 0
  %arrayidx171 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 2
  store i16*** %arrayidx171, i16**** %arrayinit.begin170
  %arrayinit.element172 = getelementptr inbounds i16**** %arrayinit.begin170, i64 1
  %arrayidx173 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 5
  store i16*** %arrayidx173, i16**** %arrayinit.element172
  %arrayinit.element174 = getelementptr inbounds [10 x [2 x i16***]]* %arrayinit.element123, i64 1
  %arrayinit.begin175 = getelementptr inbounds [10 x [2 x i16***]]* %arrayinit.element174, i64 0, i64 0
  %arrayinit.begin176 = getelementptr inbounds [2 x i16***]* %arrayinit.begin175, i64 0, i64 0
  %arrayidx177 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 2
  store i16*** %arrayidx177, i16**** %arrayinit.begin176
  %arrayinit.element178 = getelementptr inbounds i16**** %arrayinit.begin176, i64 1
  %arrayidx179 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 5
  store i16*** %arrayidx179, i16**** %arrayinit.element178
  %arrayinit.element180 = getelementptr inbounds [2 x i16***]* %arrayinit.begin175, i64 1
  %arrayinit.begin181 = getelementptr inbounds [2 x i16***]* %arrayinit.element180, i64 0, i64 0
  %arrayidx182 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 2
  store i16*** %arrayidx182, i16**** %arrayinit.begin181
  %arrayinit.element183 = getelementptr inbounds i16**** %arrayinit.begin181, i64 1
  %arrayidx184 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 5
  store i16*** %arrayidx184, i16**** %arrayinit.element183
  %arrayinit.element185 = getelementptr inbounds [2 x i16***]* %arrayinit.element180, i64 1
  %arrayinit.begin186 = getelementptr inbounds [2 x i16***]* %arrayinit.element185, i64 0, i64 0
  %arrayidx187 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 2
  store i16*** %arrayidx187, i16**** %arrayinit.begin186
  %arrayinit.element188 = getelementptr inbounds i16**** %arrayinit.begin186, i64 1
  %arrayidx189 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 5
  store i16*** %arrayidx189, i16**** %arrayinit.element188
  %arrayinit.element190 = getelementptr inbounds [2 x i16***]* %arrayinit.element185, i64 1
  %arrayinit.begin191 = getelementptr inbounds [2 x i16***]* %arrayinit.element190, i64 0, i64 0
  %arrayidx192 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 2
  store i16*** %arrayidx192, i16**** %arrayinit.begin191
  %arrayinit.element193 = getelementptr inbounds i16**** %arrayinit.begin191, i64 1
  %arrayidx194 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 5
  store i16*** %arrayidx194, i16**** %arrayinit.element193
  %arrayinit.element195 = getelementptr inbounds [2 x i16***]* %arrayinit.element190, i64 1
  %arrayinit.begin196 = getelementptr inbounds [2 x i16***]* %arrayinit.element195, i64 0, i64 0
  %arrayidx197 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 2
  store i16*** %arrayidx197, i16**** %arrayinit.begin196
  %arrayinit.element198 = getelementptr inbounds i16**** %arrayinit.begin196, i64 1
  %arrayidx199 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 5
  store i16*** %arrayidx199, i16**** %arrayinit.element198
  %arrayinit.element200 = getelementptr inbounds [2 x i16***]* %arrayinit.element195, i64 1
  %arrayinit.begin201 = getelementptr inbounds [2 x i16***]* %arrayinit.element200, i64 0, i64 0
  %arrayidx202 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 2
  store i16*** %arrayidx202, i16**** %arrayinit.begin201
  %arrayinit.element203 = getelementptr inbounds i16**** %arrayinit.begin201, i64 1
  %arrayidx204 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 5
  store i16*** %arrayidx204, i16**** %arrayinit.element203
  %arrayinit.element205 = getelementptr inbounds [2 x i16***]* %arrayinit.element200, i64 1
  %arrayinit.begin206 = getelementptr inbounds [2 x i16***]* %arrayinit.element205, i64 0, i64 0
  %arrayidx207 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 2
  store i16*** %arrayidx207, i16**** %arrayinit.begin206
  %arrayinit.element208 = getelementptr inbounds i16**** %arrayinit.begin206, i64 1
  %arrayidx209 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 5
  store i16*** %arrayidx209, i16**** %arrayinit.element208
  %arrayinit.element210 = getelementptr inbounds [2 x i16***]* %arrayinit.element205, i64 1
  %arrayinit.begin211 = getelementptr inbounds [2 x i16***]* %arrayinit.element210, i64 0, i64 0
  %arrayidx212 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 2
  store i16*** %arrayidx212, i16**** %arrayinit.begin211
  %arrayinit.element213 = getelementptr inbounds i16**** %arrayinit.begin211, i64 1
  %arrayidx214 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 5
  store i16*** %arrayidx214, i16**** %arrayinit.element213
  %arrayinit.element215 = getelementptr inbounds [2 x i16***]* %arrayinit.element210, i64 1
  %arrayinit.begin216 = getelementptr inbounds [2 x i16***]* %arrayinit.element215, i64 0, i64 0
  %arrayidx217 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 2
  store i16*** %arrayidx217, i16**** %arrayinit.begin216
  %arrayinit.element218 = getelementptr inbounds i16**** %arrayinit.begin216, i64 1
  %arrayidx219 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 5
  store i16*** %arrayidx219, i16**** %arrayinit.element218
  %arrayinit.element220 = getelementptr inbounds [2 x i16***]* %arrayinit.element215, i64 1
  %arrayinit.begin221 = getelementptr inbounds [2 x i16***]* %arrayinit.element220, i64 0, i64 0
  %arrayidx222 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 2
  store i16*** %arrayidx222, i16**** %arrayinit.begin221
  %arrayinit.element223 = getelementptr inbounds i16**** %arrayinit.begin221, i64 1
  %arrayidx224 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 5
  store i16*** %arrayidx224, i16**** %arrayinit.element223
  %arrayinit.element225 = getelementptr inbounds [10 x [2 x i16***]]* %arrayinit.element174, i64 1
  %arrayinit.begin226 = getelementptr inbounds [10 x [2 x i16***]]* %arrayinit.element225, i64 0, i64 0
  %arrayinit.begin227 = getelementptr inbounds [2 x i16***]* %arrayinit.begin226, i64 0, i64 0
  %arrayidx228 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 2
  store i16*** %arrayidx228, i16**** %arrayinit.begin227
  %arrayinit.element229 = getelementptr inbounds i16**** %arrayinit.begin227, i64 1
  %arrayidx230 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 5
  store i16*** %arrayidx230, i16**** %arrayinit.element229
  %arrayinit.element231 = getelementptr inbounds [2 x i16***]* %arrayinit.begin226, i64 1
  %arrayinit.begin232 = getelementptr inbounds [2 x i16***]* %arrayinit.element231, i64 0, i64 0
  %arrayidx233 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 2
  store i16*** %arrayidx233, i16**** %arrayinit.begin232
  %arrayinit.element234 = getelementptr inbounds i16**** %arrayinit.begin232, i64 1
  %arrayidx235 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 5
  store i16*** %arrayidx235, i16**** %arrayinit.element234
  %arrayinit.element236 = getelementptr inbounds [2 x i16***]* %arrayinit.element231, i64 1
  %arrayinit.begin237 = getelementptr inbounds [2 x i16***]* %arrayinit.element236, i64 0, i64 0
  %arrayidx238 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 2
  store i16*** %arrayidx238, i16**** %arrayinit.begin237
  %arrayinit.element239 = getelementptr inbounds i16**** %arrayinit.begin237, i64 1
  %arrayidx240 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 5
  store i16*** %arrayidx240, i16**** %arrayinit.element239
  %arrayinit.element241 = getelementptr inbounds [2 x i16***]* %arrayinit.element236, i64 1
  %arrayinit.begin242 = getelementptr inbounds [2 x i16***]* %arrayinit.element241, i64 0, i64 0
  %arrayidx243 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 2
  store i16*** %arrayidx243, i16**** %arrayinit.begin242
  %arrayinit.element244 = getelementptr inbounds i16**** %arrayinit.begin242, i64 1
  %arrayidx245 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 5
  store i16*** %arrayidx245, i16**** %arrayinit.element244
  %arrayinit.element246 = getelementptr inbounds [2 x i16***]* %arrayinit.element241, i64 1
  %arrayinit.begin247 = getelementptr inbounds [2 x i16***]* %arrayinit.element246, i64 0, i64 0
  %arrayidx248 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 2
  store i16*** %arrayidx248, i16**** %arrayinit.begin247
  %arrayinit.element249 = getelementptr inbounds i16**** %arrayinit.begin247, i64 1
  %arrayidx250 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 5
  store i16*** %arrayidx250, i16**** %arrayinit.element249
  %arrayinit.element251 = getelementptr inbounds [2 x i16***]* %arrayinit.element246, i64 1
  %arrayinit.begin252 = getelementptr inbounds [2 x i16***]* %arrayinit.element251, i64 0, i64 0
  %arrayidx253 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 2
  store i16*** %arrayidx253, i16**** %arrayinit.begin252
  %arrayinit.element254 = getelementptr inbounds i16**** %arrayinit.begin252, i64 1
  %arrayidx255 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 5
  store i16*** %arrayidx255, i16**** %arrayinit.element254
  %arrayinit.element256 = getelementptr inbounds [2 x i16***]* %arrayinit.element251, i64 1
  %arrayinit.begin257 = getelementptr inbounds [2 x i16***]* %arrayinit.element256, i64 0, i64 0
  %arrayidx258 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 2
  store i16*** %arrayidx258, i16**** %arrayinit.begin257
  %arrayinit.element259 = getelementptr inbounds i16**** %arrayinit.begin257, i64 1
  %arrayidx260 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 5
  store i16*** %arrayidx260, i16**** %arrayinit.element259
  %arrayinit.element261 = getelementptr inbounds [2 x i16***]* %arrayinit.element256, i64 1
  %arrayinit.begin262 = getelementptr inbounds [2 x i16***]* %arrayinit.element261, i64 0, i64 0
  %arrayidx263 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 2
  store i16*** %arrayidx263, i16**** %arrayinit.begin262
  %arrayinit.element264 = getelementptr inbounds i16**** %arrayinit.begin262, i64 1
  %arrayidx265 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 5
  store i16*** %arrayidx265, i16**** %arrayinit.element264
  %arrayinit.element266 = getelementptr inbounds [2 x i16***]* %arrayinit.element261, i64 1
  %arrayinit.begin267 = getelementptr inbounds [2 x i16***]* %arrayinit.element266, i64 0, i64 0
  %arrayidx268 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 2
  store i16*** %arrayidx268, i16**** %arrayinit.begin267
  %arrayinit.element269 = getelementptr inbounds i16**** %arrayinit.begin267, i64 1
  %arrayidx270 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 5
  store i16*** %arrayidx270, i16**** %arrayinit.element269
  %arrayinit.element271 = getelementptr inbounds [2 x i16***]* %arrayinit.element266, i64 1
  %arrayinit.begin272 = getelementptr inbounds [2 x i16***]* %arrayinit.element271, i64 0, i64 0
  %arrayidx273 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 2
  store i16*** %arrayidx273, i16**** %arrayinit.begin272
  %arrayinit.element274 = getelementptr inbounds i16**** %arrayinit.begin272, i64 1
  %arrayidx275 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 5
  store i16*** %arrayidx275, i16**** %arrayinit.element274
  %arrayinit.element276 = getelementptr inbounds [10 x [2 x i16***]]* %arrayinit.element225, i64 1
  %arrayinit.begin277 = getelementptr inbounds [10 x [2 x i16***]]* %arrayinit.element276, i64 0, i64 0
  %arrayinit.begin278 = getelementptr inbounds [2 x i16***]* %arrayinit.begin277, i64 0, i64 0
  %arrayidx279 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 2
  store i16*** %arrayidx279, i16**** %arrayinit.begin278
  %arrayinit.element280 = getelementptr inbounds i16**** %arrayinit.begin278, i64 1
  %arrayidx281 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 5
  store i16*** %arrayidx281, i16**** %arrayinit.element280
  %arrayinit.element282 = getelementptr inbounds [2 x i16***]* %arrayinit.begin277, i64 1
  %arrayinit.begin283 = getelementptr inbounds [2 x i16***]* %arrayinit.element282, i64 0, i64 0
  %arrayidx284 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 2
  store i16*** %arrayidx284, i16**** %arrayinit.begin283
  %arrayinit.element285 = getelementptr inbounds i16**** %arrayinit.begin283, i64 1
  %arrayidx286 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 5
  store i16*** %arrayidx286, i16**** %arrayinit.element285
  %arrayinit.element287 = getelementptr inbounds [2 x i16***]* %arrayinit.element282, i64 1
  %arrayinit.begin288 = getelementptr inbounds [2 x i16***]* %arrayinit.element287, i64 0, i64 0
  %arrayidx289 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 2
  store i16*** %arrayidx289, i16**** %arrayinit.begin288
  %arrayinit.element290 = getelementptr inbounds i16**** %arrayinit.begin288, i64 1
  %arrayidx291 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 5
  store i16*** %arrayidx291, i16**** %arrayinit.element290
  %arrayinit.element292 = getelementptr inbounds [2 x i16***]* %arrayinit.element287, i64 1
  %arrayinit.begin293 = getelementptr inbounds [2 x i16***]* %arrayinit.element292, i64 0, i64 0
  %arrayidx294 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 2
  store i16*** %arrayidx294, i16**** %arrayinit.begin293
  %arrayinit.element295 = getelementptr inbounds i16**** %arrayinit.begin293, i64 1
  %arrayidx296 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 5
  store i16*** %arrayidx296, i16**** %arrayinit.element295
  %arrayinit.element297 = getelementptr inbounds [2 x i16***]* %arrayinit.element292, i64 1
  %arrayinit.begin298 = getelementptr inbounds [2 x i16***]* %arrayinit.element297, i64 0, i64 0
  %arrayidx299 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 2
  store i16*** %arrayidx299, i16**** %arrayinit.begin298
  %arrayinit.element300 = getelementptr inbounds i16**** %arrayinit.begin298, i64 1
  %arrayidx301 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 5
  store i16*** %arrayidx301, i16**** %arrayinit.element300
  %arrayinit.element302 = getelementptr inbounds [2 x i16***]* %arrayinit.element297, i64 1
  %arrayinit.begin303 = getelementptr inbounds [2 x i16***]* %arrayinit.element302, i64 0, i64 0
  %arrayidx304 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 2
  store i16*** %arrayidx304, i16**** %arrayinit.begin303
  %arrayinit.element305 = getelementptr inbounds i16**** %arrayinit.begin303, i64 1
  %arrayidx306 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 5
  store i16*** %arrayidx306, i16**** %arrayinit.element305
  %arrayinit.element307 = getelementptr inbounds [2 x i16***]* %arrayinit.element302, i64 1
  %arrayinit.begin308 = getelementptr inbounds [2 x i16***]* %arrayinit.element307, i64 0, i64 0
  %arrayidx309 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 2
  store i16*** %arrayidx309, i16**** %arrayinit.begin308
  %arrayinit.element310 = getelementptr inbounds i16**** %arrayinit.begin308, i64 1
  %arrayidx311 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 5
  store i16*** %arrayidx311, i16**** %arrayinit.element310
  %arrayinit.element312 = getelementptr inbounds [2 x i16***]* %arrayinit.element307, i64 1
  %arrayinit.begin313 = getelementptr inbounds [2 x i16***]* %arrayinit.element312, i64 0, i64 0
  %arrayidx314 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 2
  store i16*** %arrayidx314, i16**** %arrayinit.begin313
  %arrayinit.element315 = getelementptr inbounds i16**** %arrayinit.begin313, i64 1
  %arrayidx316 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 5
  store i16*** %arrayidx316, i16**** %arrayinit.element315
  %arrayinit.element317 = getelementptr inbounds [2 x i16***]* %arrayinit.element312, i64 1
  %arrayinit.begin318 = getelementptr inbounds [2 x i16***]* %arrayinit.element317, i64 0, i64 0
  %arrayidx319 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 2
  store i16*** %arrayidx319, i16**** %arrayinit.begin318
  %arrayinit.element320 = getelementptr inbounds i16**** %arrayinit.begin318, i64 1
  %arrayidx321 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 5
  store i16*** %arrayidx321, i16**** %arrayinit.element320
  %arrayinit.element322 = getelementptr inbounds [2 x i16***]* %arrayinit.element317, i64 1
  %arrayinit.begin323 = getelementptr inbounds [2 x i16***]* %arrayinit.element322, i64 0, i64 0
  %arrayidx324 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 2
  store i16*** %arrayidx324, i16**** %arrayinit.begin323
  %arrayinit.element325 = getelementptr inbounds i16**** %arrayinit.begin323, i64 1
  %arrayidx326 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 5
  store i16*** %arrayidx326, i16**** %arrayinit.element325
  %arrayinit.element327 = getelementptr inbounds [10 x [2 x i16***]]* %arrayinit.element276, i64 1
  %arrayinit.begin328 = getelementptr inbounds [10 x [2 x i16***]]* %arrayinit.element327, i64 0, i64 0
  %arrayinit.begin329 = getelementptr inbounds [2 x i16***]* %arrayinit.begin328, i64 0, i64 0
  %arrayidx330 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 2
  store i16*** %arrayidx330, i16**** %arrayinit.begin329
  %arrayinit.element331 = getelementptr inbounds i16**** %arrayinit.begin329, i64 1
  %arrayidx332 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 5
  store i16*** %arrayidx332, i16**** %arrayinit.element331
  %arrayinit.element333 = getelementptr inbounds [2 x i16***]* %arrayinit.begin328, i64 1
  %arrayinit.begin334 = getelementptr inbounds [2 x i16***]* %arrayinit.element333, i64 0, i64 0
  %arrayidx335 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 2
  store i16*** %arrayidx335, i16**** %arrayinit.begin334
  %arrayinit.element336 = getelementptr inbounds i16**** %arrayinit.begin334, i64 1
  %arrayidx337 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 5
  store i16*** %arrayidx337, i16**** %arrayinit.element336
  %arrayinit.element338 = getelementptr inbounds [2 x i16***]* %arrayinit.element333, i64 1
  %arrayinit.begin339 = getelementptr inbounds [2 x i16***]* %arrayinit.element338, i64 0, i64 0
  %arrayidx340 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 2
  store i16*** %arrayidx340, i16**** %arrayinit.begin339
  %arrayinit.element341 = getelementptr inbounds i16**** %arrayinit.begin339, i64 1
  %arrayidx342 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 5
  store i16*** %arrayidx342, i16**** %arrayinit.element341
  %arrayinit.element343 = getelementptr inbounds [2 x i16***]* %arrayinit.element338, i64 1
  %arrayinit.begin344 = getelementptr inbounds [2 x i16***]* %arrayinit.element343, i64 0, i64 0
  %arrayidx345 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 2
  store i16*** %arrayidx345, i16**** %arrayinit.begin344
  %arrayinit.element346 = getelementptr inbounds i16**** %arrayinit.begin344, i64 1
  %arrayidx347 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 5
  store i16*** %arrayidx347, i16**** %arrayinit.element346
  %arrayinit.element348 = getelementptr inbounds [2 x i16***]* %arrayinit.element343, i64 1
  %arrayinit.begin349 = getelementptr inbounds [2 x i16***]* %arrayinit.element348, i64 0, i64 0
  %arrayidx350 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 2
  store i16*** %arrayidx350, i16**** %arrayinit.begin349
  %arrayinit.element351 = getelementptr inbounds i16**** %arrayinit.begin349, i64 1
  %arrayidx352 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 5
  store i16*** %arrayidx352, i16**** %arrayinit.element351
  %arrayinit.element353 = getelementptr inbounds [2 x i16***]* %arrayinit.element348, i64 1
  %arrayinit.begin354 = getelementptr inbounds [2 x i16***]* %arrayinit.element353, i64 0, i64 0
  %arrayidx355 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 2
  store i16*** %arrayidx355, i16**** %arrayinit.begin354
  %arrayinit.element356 = getelementptr inbounds i16**** %arrayinit.begin354, i64 1
  %arrayidx357 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 5
  store i16*** %arrayidx357, i16**** %arrayinit.element356
  %arrayinit.element358 = getelementptr inbounds [2 x i16***]* %arrayinit.element353, i64 1
  %arrayinit.begin359 = getelementptr inbounds [2 x i16***]* %arrayinit.element358, i64 0, i64 0
  %arrayidx360 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 2
  store i16*** %arrayidx360, i16**** %arrayinit.begin359
  %arrayinit.element361 = getelementptr inbounds i16**** %arrayinit.begin359, i64 1
  %arrayidx362 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 5
  store i16*** %arrayidx362, i16**** %arrayinit.element361
  %arrayinit.element363 = getelementptr inbounds [2 x i16***]* %arrayinit.element358, i64 1
  %arrayinit.begin364 = getelementptr inbounds [2 x i16***]* %arrayinit.element363, i64 0, i64 0
  %arrayidx365 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 2
  store i16*** %arrayidx365, i16**** %arrayinit.begin364
  %arrayinit.element366 = getelementptr inbounds i16**** %arrayinit.begin364, i64 1
  %arrayidx367 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 5
  store i16*** %arrayidx367, i16**** %arrayinit.element366
  %arrayinit.element368 = getelementptr inbounds [2 x i16***]* %arrayinit.element363, i64 1
  %arrayinit.begin369 = getelementptr inbounds [2 x i16***]* %arrayinit.element368, i64 0, i64 0
  %arrayidx370 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 2
  store i16*** %arrayidx370, i16**** %arrayinit.begin369
  %arrayinit.element371 = getelementptr inbounds i16**** %arrayinit.begin369, i64 1
  %arrayidx372 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 5
  store i16*** %arrayidx372, i16**** %arrayinit.element371
  %arrayinit.element373 = getelementptr inbounds [2 x i16***]* %arrayinit.element368, i64 1
  %arrayinit.begin374 = getelementptr inbounds [2 x i16***]* %arrayinit.element373, i64 0, i64 0
  %arrayidx375 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 2
  store i16*** %arrayidx375, i16**** %arrayinit.begin374
  %arrayinit.element376 = getelementptr inbounds i16**** %arrayinit.begin374, i64 1
  %arrayidx377 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 5
  store i16*** %arrayidx377, i16**** %arrayinit.element376
  %arrayinit.element378 = getelementptr inbounds [10 x [2 x i16***]]* %arrayinit.element327, i64 1
  %arrayinit.begin379 = getelementptr inbounds [10 x [2 x i16***]]* %arrayinit.element378, i64 0, i64 0
  %arrayinit.begin380 = getelementptr inbounds [2 x i16***]* %arrayinit.begin379, i64 0, i64 0
  %arrayidx381 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 2
  store i16*** %arrayidx381, i16**** %arrayinit.begin380
  %arrayinit.element382 = getelementptr inbounds i16**** %arrayinit.begin380, i64 1
  %arrayidx383 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 5
  store i16*** %arrayidx383, i16**** %arrayinit.element382
  %arrayinit.element384 = getelementptr inbounds [2 x i16***]* %arrayinit.begin379, i64 1
  %arrayinit.begin385 = getelementptr inbounds [2 x i16***]* %arrayinit.element384, i64 0, i64 0
  %arrayidx386 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 2
  store i16*** %arrayidx386, i16**** %arrayinit.begin385
  %arrayinit.element387 = getelementptr inbounds i16**** %arrayinit.begin385, i64 1
  %arrayidx388 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 5
  store i16*** %arrayidx388, i16**** %arrayinit.element387
  %arrayinit.element389 = getelementptr inbounds [2 x i16***]* %arrayinit.element384, i64 1
  %arrayinit.begin390 = getelementptr inbounds [2 x i16***]* %arrayinit.element389, i64 0, i64 0
  %arrayidx391 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 2
  store i16*** %arrayidx391, i16**** %arrayinit.begin390
  %arrayinit.element392 = getelementptr inbounds i16**** %arrayinit.begin390, i64 1
  %arrayidx393 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 5
  store i16*** %arrayidx393, i16**** %arrayinit.element392
  %arrayinit.element394 = getelementptr inbounds [2 x i16***]* %arrayinit.element389, i64 1
  %arrayinit.begin395 = getelementptr inbounds [2 x i16***]* %arrayinit.element394, i64 0, i64 0
  %arrayidx396 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 2
  store i16*** %arrayidx396, i16**** %arrayinit.begin395
  %arrayinit.element397 = getelementptr inbounds i16**** %arrayinit.begin395, i64 1
  %arrayidx398 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 5
  store i16*** %arrayidx398, i16**** %arrayinit.element397
  %arrayinit.element399 = getelementptr inbounds [2 x i16***]* %arrayinit.element394, i64 1
  %arrayinit.begin400 = getelementptr inbounds [2 x i16***]* %arrayinit.element399, i64 0, i64 0
  %arrayidx401 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 2
  store i16*** %arrayidx401, i16**** %arrayinit.begin400
  %arrayinit.element402 = getelementptr inbounds i16**** %arrayinit.begin400, i64 1
  %arrayidx403 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 5
  store i16*** %arrayidx403, i16**** %arrayinit.element402
  %arrayinit.element404 = getelementptr inbounds [2 x i16***]* %arrayinit.element399, i64 1
  %arrayinit.begin405 = getelementptr inbounds [2 x i16***]* %arrayinit.element404, i64 0, i64 0
  %arrayidx406 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 2
  store i16*** %arrayidx406, i16**** %arrayinit.begin405
  %arrayinit.element407 = getelementptr inbounds i16**** %arrayinit.begin405, i64 1
  %arrayidx408 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 5
  store i16*** %arrayidx408, i16**** %arrayinit.element407
  %arrayinit.element409 = getelementptr inbounds [2 x i16***]* %arrayinit.element404, i64 1
  %arrayinit.begin410 = getelementptr inbounds [2 x i16***]* %arrayinit.element409, i64 0, i64 0
  %arrayidx411 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 2
  store i16*** %arrayidx411, i16**** %arrayinit.begin410
  %arrayinit.element412 = getelementptr inbounds i16**** %arrayinit.begin410, i64 1
  %arrayidx413 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 5
  store i16*** %arrayidx413, i16**** %arrayinit.element412
  %arrayinit.element414 = getelementptr inbounds [2 x i16***]* %arrayinit.element409, i64 1
  %arrayinit.begin415 = getelementptr inbounds [2 x i16***]* %arrayinit.element414, i64 0, i64 0
  %arrayidx416 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 2
  store i16*** %arrayidx416, i16**** %arrayinit.begin415
  %arrayinit.element417 = getelementptr inbounds i16**** %arrayinit.begin415, i64 1
  %arrayidx418 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 5
  store i16*** %arrayidx418, i16**** %arrayinit.element417
  %arrayinit.element419 = getelementptr inbounds [2 x i16***]* %arrayinit.element414, i64 1
  %arrayinit.begin420 = getelementptr inbounds [2 x i16***]* %arrayinit.element419, i64 0, i64 0
  %arrayidx421 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 2
  store i16*** %arrayidx421, i16**** %arrayinit.begin420
  %arrayinit.element422 = getelementptr inbounds i16**** %arrayinit.begin420, i64 1
  %arrayidx423 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 5
  store i16*** %arrayidx423, i16**** %arrayinit.element422
  %arrayinit.element424 = getelementptr inbounds [2 x i16***]* %arrayinit.element419, i64 1
  %arrayinit.begin425 = getelementptr inbounds [2 x i16***]* %arrayinit.element424, i64 0, i64 0
  %arrayidx426 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 2
  store i16*** %arrayidx426, i16**** %arrayinit.begin425
  %arrayinit.element427 = getelementptr inbounds i16**** %arrayinit.begin425, i64 1
  %arrayidx428 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 5
  store i16*** %arrayidx428, i16**** %arrayinit.element427
  %arrayinit.element429 = getelementptr inbounds [10 x [2 x i16***]]* %arrayinit.element378, i64 1
  %arrayinit.begin430 = getelementptr inbounds [10 x [2 x i16***]]* %arrayinit.element429, i64 0, i64 0
  %arrayinit.begin431 = getelementptr inbounds [2 x i16***]* %arrayinit.begin430, i64 0, i64 0
  %arrayidx432 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 2
  store i16*** %arrayidx432, i16**** %arrayinit.begin431
  %arrayinit.element433 = getelementptr inbounds i16**** %arrayinit.begin431, i64 1
  %arrayidx434 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 5
  store i16*** %arrayidx434, i16**** %arrayinit.element433
  %arrayinit.element435 = getelementptr inbounds [2 x i16***]* %arrayinit.begin430, i64 1
  %arrayinit.begin436 = getelementptr inbounds [2 x i16***]* %arrayinit.element435, i64 0, i64 0
  %arrayidx437 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 2
  store i16*** %arrayidx437, i16**** %arrayinit.begin436
  %arrayinit.element438 = getelementptr inbounds i16**** %arrayinit.begin436, i64 1
  %arrayidx439 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 5
  store i16*** %arrayidx439, i16**** %arrayinit.element438
  %arrayinit.element440 = getelementptr inbounds [2 x i16***]* %arrayinit.element435, i64 1
  %arrayinit.begin441 = getelementptr inbounds [2 x i16***]* %arrayinit.element440, i64 0, i64 0
  %arrayidx442 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 2
  store i16*** %arrayidx442, i16**** %arrayinit.begin441
  %arrayinit.element443 = getelementptr inbounds i16**** %arrayinit.begin441, i64 1
  %arrayidx444 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 5
  store i16*** %arrayidx444, i16**** %arrayinit.element443
  %arrayinit.element445 = getelementptr inbounds [2 x i16***]* %arrayinit.element440, i64 1
  %arrayinit.begin446 = getelementptr inbounds [2 x i16***]* %arrayinit.element445, i64 0, i64 0
  %arrayidx447 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 2
  store i16*** %arrayidx447, i16**** %arrayinit.begin446
  %arrayinit.element448 = getelementptr inbounds i16**** %arrayinit.begin446, i64 1
  %arrayidx449 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 5
  store i16*** %arrayidx449, i16**** %arrayinit.element448
  %arrayinit.element450 = getelementptr inbounds [2 x i16***]* %arrayinit.element445, i64 1
  %arrayinit.begin451 = getelementptr inbounds [2 x i16***]* %arrayinit.element450, i64 0, i64 0
  %arrayidx452 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 2
  store i16*** %arrayidx452, i16**** %arrayinit.begin451
  %arrayinit.element453 = getelementptr inbounds i16**** %arrayinit.begin451, i64 1
  %arrayidx454 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 5
  store i16*** %arrayidx454, i16**** %arrayinit.element453
  %arrayinit.element455 = getelementptr inbounds [2 x i16***]* %arrayinit.element450, i64 1
  %arrayinit.begin456 = getelementptr inbounds [2 x i16***]* %arrayinit.element455, i64 0, i64 0
  %arrayidx457 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 2
  store i16*** %arrayidx457, i16**** %arrayinit.begin456
  %arrayinit.element458 = getelementptr inbounds i16**** %arrayinit.begin456, i64 1
  %arrayidx459 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 5
  store i16*** %arrayidx459, i16**** %arrayinit.element458
  %arrayinit.element460 = getelementptr inbounds [2 x i16***]* %arrayinit.element455, i64 1
  %arrayinit.begin461 = getelementptr inbounds [2 x i16***]* %arrayinit.element460, i64 0, i64 0
  %arrayidx462 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 2
  store i16*** %arrayidx462, i16**** %arrayinit.begin461
  %arrayinit.element463 = getelementptr inbounds i16**** %arrayinit.begin461, i64 1
  %arrayidx464 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 5
  store i16*** %arrayidx464, i16**** %arrayinit.element463
  %arrayinit.element465 = getelementptr inbounds [2 x i16***]* %arrayinit.element460, i64 1
  %arrayinit.begin466 = getelementptr inbounds [2 x i16***]* %arrayinit.element465, i64 0, i64 0
  %arrayidx467 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 2
  store i16*** %arrayidx467, i16**** %arrayinit.begin466
  %arrayinit.element468 = getelementptr inbounds i16**** %arrayinit.begin466, i64 1
  %arrayidx469 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 5
  store i16*** %arrayidx469, i16**** %arrayinit.element468
  %arrayinit.element470 = getelementptr inbounds [2 x i16***]* %arrayinit.element465, i64 1
  %arrayinit.begin471 = getelementptr inbounds [2 x i16***]* %arrayinit.element470, i64 0, i64 0
  %arrayidx472 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 2
  store i16*** %arrayidx472, i16**** %arrayinit.begin471
  %arrayinit.element473 = getelementptr inbounds i16**** %arrayinit.begin471, i64 1
  %arrayidx474 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 5
  store i16*** %arrayidx474, i16**** %arrayinit.element473
  %arrayinit.element475 = getelementptr inbounds [2 x i16***]* %arrayinit.element470, i64 1
  %arrayinit.begin476 = getelementptr inbounds [2 x i16***]* %arrayinit.element475, i64 0, i64 0
  %arrayidx477 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 2
  store i16*** %arrayidx477, i16**** %arrayinit.begin476
  %arrayinit.element478 = getelementptr inbounds i16**** %arrayinit.begin476, i64 1
  %arrayidx479 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 5
  store i16*** %arrayidx479, i16**** %arrayinit.element478
  %arrayinit.element480 = getelementptr inbounds [10 x [2 x i16***]]* %arrayinit.element429, i64 1
  %arrayinit.begin481 = getelementptr inbounds [10 x [2 x i16***]]* %arrayinit.element480, i64 0, i64 0
  %arrayinit.begin482 = getelementptr inbounds [2 x i16***]* %arrayinit.begin481, i64 0, i64 0
  %arrayidx483 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 2
  store i16*** %arrayidx483, i16**** %arrayinit.begin482
  %arrayinit.element484 = getelementptr inbounds i16**** %arrayinit.begin482, i64 1
  %arrayidx485 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 5
  store i16*** %arrayidx485, i16**** %arrayinit.element484
  %arrayinit.element486 = getelementptr inbounds [2 x i16***]* %arrayinit.begin481, i64 1
  %arrayinit.begin487 = getelementptr inbounds [2 x i16***]* %arrayinit.element486, i64 0, i64 0
  %arrayidx488 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 2
  store i16*** %arrayidx488, i16**** %arrayinit.begin487
  %arrayinit.element489 = getelementptr inbounds i16**** %arrayinit.begin487, i64 1
  %arrayidx490 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 5
  store i16*** %arrayidx490, i16**** %arrayinit.element489
  %arrayinit.element491 = getelementptr inbounds [2 x i16***]* %arrayinit.element486, i64 1
  %arrayinit.begin492 = getelementptr inbounds [2 x i16***]* %arrayinit.element491, i64 0, i64 0
  %arrayidx493 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 2
  store i16*** %arrayidx493, i16**** %arrayinit.begin492
  %arrayinit.element494 = getelementptr inbounds i16**** %arrayinit.begin492, i64 1
  %arrayidx495 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 5
  store i16*** %arrayidx495, i16**** %arrayinit.element494
  %arrayinit.element496 = getelementptr inbounds [2 x i16***]* %arrayinit.element491, i64 1
  %arrayinit.begin497 = getelementptr inbounds [2 x i16***]* %arrayinit.element496, i64 0, i64 0
  %arrayidx498 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 2
  store i16*** %arrayidx498, i16**** %arrayinit.begin497
  %arrayinit.element499 = getelementptr inbounds i16**** %arrayinit.begin497, i64 1
  %arrayidx500 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 5
  store i16*** %arrayidx500, i16**** %arrayinit.element499
  %arrayinit.element501 = getelementptr inbounds [2 x i16***]* %arrayinit.element496, i64 1
  %arrayinit.begin502 = getelementptr inbounds [2 x i16***]* %arrayinit.element501, i64 0, i64 0
  %arrayidx503 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 2
  store i16*** %arrayidx503, i16**** %arrayinit.begin502
  %arrayinit.element504 = getelementptr inbounds i16**** %arrayinit.begin502, i64 1
  %arrayidx505 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 5
  store i16*** %arrayidx505, i16**** %arrayinit.element504
  %arrayinit.element506 = getelementptr inbounds [2 x i16***]* %arrayinit.element501, i64 1
  %arrayinit.begin507 = getelementptr inbounds [2 x i16***]* %arrayinit.element506, i64 0, i64 0
  %arrayidx508 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 2
  store i16*** %arrayidx508, i16**** %arrayinit.begin507
  %arrayinit.element509 = getelementptr inbounds i16**** %arrayinit.begin507, i64 1
  %arrayidx510 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 5
  store i16*** %arrayidx510, i16**** %arrayinit.element509
  %arrayinit.element511 = getelementptr inbounds [2 x i16***]* %arrayinit.element506, i64 1
  %arrayinit.begin512 = getelementptr inbounds [2 x i16***]* %arrayinit.element511, i64 0, i64 0
  %arrayidx513 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 2
  store i16*** %arrayidx513, i16**** %arrayinit.begin512
  %arrayinit.element514 = getelementptr inbounds i16**** %arrayinit.begin512, i64 1
  %arrayidx515 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 5
  store i16*** %arrayidx515, i16**** %arrayinit.element514
  %arrayinit.element516 = getelementptr inbounds [2 x i16***]* %arrayinit.element511, i64 1
  %arrayinit.begin517 = getelementptr inbounds [2 x i16***]* %arrayinit.element516, i64 0, i64 0
  %arrayidx518 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 2
  store i16*** %arrayidx518, i16**** %arrayinit.begin517
  %arrayinit.element519 = getelementptr inbounds i16**** %arrayinit.begin517, i64 1
  %arrayidx520 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 5
  store i16*** %arrayidx520, i16**** %arrayinit.element519
  %arrayinit.element521 = getelementptr inbounds [2 x i16***]* %arrayinit.element516, i64 1
  %arrayinit.begin522 = getelementptr inbounds [2 x i16***]* %arrayinit.element521, i64 0, i64 0
  %arrayidx523 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 2
  store i16*** %arrayidx523, i16**** %arrayinit.begin522
  %arrayinit.element524 = getelementptr inbounds i16**** %arrayinit.begin522, i64 1
  %arrayidx525 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 5
  store i16*** %arrayidx525, i16**** %arrayinit.element524
  %arrayinit.element526 = getelementptr inbounds [2 x i16***]* %arrayinit.element521, i64 1
  %arrayinit.begin527 = getelementptr inbounds [2 x i16***]* %arrayinit.element526, i64 0, i64 0
  %arrayidx528 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 2
  store i16*** %arrayidx528, i16**** %arrayinit.begin527
  %arrayinit.element529 = getelementptr inbounds i16**** %arrayinit.begin527, i64 1
  %arrayidx530 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 5
  store i16*** %arrayidx530, i16**** %arrayinit.element529
  store i8* getelementptr inbounds ([1 x i8]* @g_1114, i32 0, i64 0), i8** %l_1385, align 8
  %20 = load i16*** %l_1381, align 8
  %arrayidx533 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 5
  %21 = load i16*** %arrayidx533, align 8
  %arrayidx534 = getelementptr inbounds [8 x i16**]* %l_1382, i32 0, i64 7
  store i16** %21, i16*** %arrayidx534, align 8
  %cmp535 = icmp ne i16** %20, %21
  %conv536 = zext i1 %cmp535 to i32
  %22 = load i8** %l_1385, align 8
  %23 = load i8* %22, align 1
  %conv537 = sext i8 %23 to i32
  %or = or i32 %conv537, %conv536
  %conv538 = trunc i32 %or to i8
  store i8 %conv538, i8* %22, align 1
  %conv539 = sext i8 %conv538 to i32
  %arrayidx540 = getelementptr inbounds [3 x i32]* %l_1378, i32 0, i64 1
  %24 = load i32* %arrayidx540, align 4
  %xor541 = xor i32 %conv539, %24
  %25 = load i32** @g_258, align 8
  store i32 %xor541, i32* %25, align 4
  br label %for.inc542

for.inc542:                                       ; preds = %for.body22
  %26 = load i16* bitcast (%union.U1* @g_536 to i16*), align 2
  %call543 = call signext i16 @safe_sub_func_int16_t_s_s(i16 signext %26, i16 signext 5)
  store i16 %call543, i16* bitcast (%union.U1* @g_536 to i16*), align 2
  br label %for.cond18

for.end544:                                       ; preds = %for.cond18
  br label %if.end

if.else:                                          ; preds = %for.end8
  %27 = load volatile i32** @g_65, align 8
  %28 = load i32* %27, align 4
  store i32 %28, i32* %retval
  br label %return

if.end:                                           ; preds = %for.end544
  %coerce.dive = getelementptr %union.U0* %l_1386, i32 0, i32 0
  %29 = load i64* %coerce.dive
  %call545 = call i32 @func_14(i64 %29)
  %30 = load i32** @g_258, align 8
  store i32 %call545, i32* %30, align 4
  %31 = load i16* %l_1390, align 2
  %inc546 = add i16 %31, 1
  store i16 %inc546, i16* %l_1390, align 2
  %32 = load i16* %l_1394, align 2
  %dec = add i16 %32, -1
  store i16 %dec, i16* %l_1394, align 2
  %33 = load volatile i32** @g_868, align 8
  %34 = load i32* %33, align 4
  store i32 %34, i32* %retval
  br label %return

return:                                           ; preds = %if.end, %if.else
  %35 = load i32* %retval
  ret i32 %35
}

define internal i32** @func_7(i64 %p_8.coerce, i32** %p_9, i32 %p_10, i32* %p_11, i32 %p_12) nounwind uwtable {
entry:
  %retval = alloca i32**, align 8
  %p_8 = alloca %union.U0, align 8
  %p_9.addr = alloca i32**, align 8
  %p_10.addr = alloca i32, align 4
  %p_11.addr = alloca i32*, align 8
  %p_12.addr = alloca i32, align 4
  %l_898 = alloca i16, align 2
  %l_899 = alloca [7 x [1 x i16*]], align 16
  %l_900 = alloca i32, align 4
  %l_901 = alloca i8*, align 8
  %l_902 = alloca i8*, align 8
  %l_903 = alloca i8*, align 8
  %l_905 = alloca i32, align 4
  %l_964 = alloca %union.U1*, align 8
  %l_972 = alloca [6 x %union.U0], align 16
  %l_987 = alloca i32, align 4
  %l_988 = alloca i32, align 4
  %l_991 = alloca i32, align 4
  %l_992 = alloca i32, align 4
  %l_993 = alloca [2 x i32], align 4
  %l_1010 = alloca i32**, align 8
  %l_1035 = alloca [3 x [8 x [5 x i32]]], align 16
  %l_1057 = alloca i8, align 1
  %l_1066 = alloca i32, align 4
  %l_1111 = alloca [6 x [1 x [2 x i32]]], align 16
  %l_1113 = alloca i32, align 4
  %l_1130 = alloca i64, align 8
  %l_1131 = alloca i32, align 4
  %l_1137 = alloca i32*, align 8
  %l_1140 = alloca i64*, align 8
  %l_1139 = alloca i64**, align 8
  %l_1138 = alloca i64***, align 8
  %l_1141 = alloca [2 x [1 x [3 x i64***]]], align 16
  %l_1144 = alloca [10 x [8 x [1 x i16]]], align 16
  %l_1217 = alloca [6 x [9 x i32*]], align 16
  %l_1238 = alloca i32*, align 8
  %l_1298 = alloca i32**, align 8
  %l_1308 = alloca i16, align 2
  %l_1342 = alloca i32, align 4
  %l_1348 = alloca i16, align 2
  %l_1371 = alloca i32**, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %l_925 = alloca i16, align 2
  %l_944 = alloca [8 x [4 x [2 x i32**]]], align 16
  %l_966 = alloca i32*, align 8
  %l_998 = alloca i32, align 4
  %l_1002 = alloca %union.U0****, align 8
  %l_1011 = alloca i64*, align 8
  %l_1045 = alloca i32, align 4
  %l_1059 = alloca [10 x i8], align 1
  %l_1081 = alloca i32*, align 8
  %l_1089 = alloca i64, align 8
  %l_1116 = alloca i16**, align 8
  %l_1129 = alloca i32*, align 8
  %i83 = alloca i32, align 4
  %j84 = alloca i32, align 4
  %k85 = alloca i32, align 4
  %l_921 = alloca i32, align 4
  %l_947 = alloca %union.U0, align 8
  %l_995 = alloca [1 x [7 x [6 x i32]]], align 16
  %l_997 = alloca i64, align 8
  %l_999 = alloca [4 x i32], align 16
  %l_1009 = alloca i64, align 8
  %i90 = alloca i32, align 4
  %j91 = alloca i32, align 4
  %k92 = alloca i32, align 4
  %l_906 = alloca i32*, align 8
  %l_907 = alloca i32*, align 8
  %l_908 = alloca i32*, align 8
  %l_909 = alloca i32*, align 8
  %l_910 = alloca i32*, align 8
  %l_911 = alloca i32*, align 8
  %l_912 = alloca i32*, align 8
  %l_913 = alloca i32*, align 8
  %l_914 = alloca i32, align 4
  %l_915 = alloca i32*, align 8
  %l_916 = alloca i32*, align 8
  %l_917 = alloca i32*, align 8
  %l_918 = alloca i32*, align 8
  %l_919 = alloca i32*, align 8
  %l_920 = alloca i32*, align 8
  %l_922 = alloca i32*, align 8
  %l_923 = alloca i32*, align 8
  %l_924 = alloca [9 x i32*], align 16
  %i97 = alloca i32, align 4
  %l_928 = alloca [3 x [5 x [7 x i8*]]], align 16
  %l_935 = alloca %union.U0*, align 8
  %l_934 = alloca %union.U0**, align 8
  %l_933 = alloca %union.U0***, align 8
  %l_932 = alloca %union.U0****, align 8
  %l_931 = alloca %union.U0*****, align 8
  %l_959 = alloca %union.U1*, align 8
  %i102 = alloca i32, align 4
  %j103 = alloca i32, align 4
  %k104 = alloca i32, align 4
  %l_948 = alloca [4 x %union.U0], align 16
  %l_949 = alloca i64*, align 8
  %l_958 = alloca i32**, align 8
  %l_960 = alloca %union.U1**, align 8
  %i119 = alloca i32, align 4
  %j120 = alloca i32, align 4
  %k121 = alloca i32, align 4
  %agg.tmp = alloca %union.U0, align 8
  %agg.tmp136 = alloca %union.U0, align 8
  %l_961 = alloca %union.U1**, align 8
  %l_963 = alloca [4 x [2 x %union.U1**]], align 16
  %i198 = alloca i32, align 4
  %j199 = alloca i32, align 4
  %l_971 = alloca %union.U0, align 8
  %l_990 = alloca [5 x [7 x [7 x i32]]], align 16
  %l_1007 = alloca i32, align 4
  %l_1008 = alloca i32*, align 8
  %i236 = alloca i32, align 4
  %j237 = alloca i32, align 4
  %k238 = alloca i32, align 4
  %l_1022 = alloca i32****, align 8
  %l_1042 = alloca i32, align 4
  %l_1051 = alloca i32, align 4
  %l_1052 = alloca i32, align 4
  %l_1054 = alloca i32, align 4
  %l_1055 = alloca i32, align 4
  %l_1056 = alloca [7 x i32], align 16
  %l_1082 = alloca [2 x i32**], align 16
  %l_1115 = alloca i16**, align 8
  %l_1117 = alloca %union.U0, align 8
  %l_1134 = alloca [8 x [5 x i32*]], align 16
  %i319 = alloca i32, align 4
  %j320 = alloca i32, align 4
  %l_1135 = alloca [5 x [4 x [9 x i32**]]], align 16
  %i334 = alloca i32, align 4
  %j335 = alloca i32, align 4
  %k336 = alloca i32, align 4
  %l_1145 = alloca i32, align 4
  %l_1146 = alloca %union.U0, align 8
  %l_1151 = alloca i32**, align 8
  %l_1177 = alloca i32*, align 8
  %l_1221 = alloca [1 x i16], align 2
  %l_1222 = alloca %union.U0, align 8
  %l_1246 = alloca i32**, align 8
  %l_1245 = alloca i32***, align 8
  %l_1244 = alloca i32****, align 8
  %i354 = alloca i32, align 4
  %l_1163 = alloca i16, align 2
  %l_1165 = alloca [10 x [5 x [5 x i32**]]], align 16
  %i386 = alloca i32, align 4
  %j387 = alloca i32, align 4
  %k388 = alloca i32, align 4
  %l_1158 = alloca %union.U0, align 8
  %l_1164 = alloca [10 x [1 x [4 x i32]]], align 16
  %i394 = alloca i32, align 4
  %j395 = alloca i32, align 4
  %k396 = alloca i32, align 4
  %l_1160 = alloca %union.U0***, align 8
  %l_1159 = alloca [8 x %union.U0****], align 16
  %l_1169 = alloca i32, align 4
  %i409 = alloca i32, align 4
  %i415 = alloca i32, align 4
  %j416 = alloca i32, align 4
  %k417 = alloca i32, align 4
  %l_1168 = alloca i32**, align 8
  %l_1170 = alloca i32**, align 8
  %l_1171 = alloca i64, align 8
  %l_1173 = alloca i32*, align 8
  %l_1172 = alloca i32, align 4
  %l_1176 = alloca [10 x [2 x i16]], align 16
  %l_1186 = alloca [5 x [5 x [8 x i32*]]], align 16
  %l_1228 = alloca i32, align 4
  %l_1258 = alloca i32, align 4
  %l_1264 = alloca [9 x i8], align 1
  %l_1268 = alloca [5 x i32**], align 16
  %l_1270 = alloca i32**, align 8
  %i913 = alloca i32, align 4
  %j914 = alloca i32, align 4
  %k915 = alloca i32, align 4
  %l_1187 = alloca %union.U1*, align 8
  %l_1212 = alloca i32, align 4
  %l_1241 = alloca i32****, align 8
  %l_1199 = alloca i32*, align 8
  %l_1204 = alloca [5 x i32*], align 16
  %l_1205 = alloca i32, align 4
  %l_1206 = alloca i32, align 4
  %i984 = alloca i32, align 4
  %l_1218 = alloca i32**, align 8
  %l_1227 = alloca i32, align 4
  %agg.tmp1025 = alloca %union.U0, align 8
  %l_1302 = alloca i16**, align 8
  %l_1323 = alloca i32, align 4
  %l_1325 = alloca i32, align 4
  %l_1352 = alloca [9 x i32], align 16
  %l_1367 = alloca [10 x [10 x [2 x i32*]]], align 16
  %l_1368 = alloca i8, align 1
  %i1478 = alloca i32, align 4
  %j1479 = alloca i32, align 4
  %k1480 = alloca i32, align 4
  %l_1294 = alloca i8, align 1
  %l_1299 = alloca i32**, align 8
  %l_1349 = alloca i32, align 4
  %l_1353 = alloca i32, align 4
  %l_1356 = alloca i32, align 4
  %l_1357 = alloca i32, align 4
  %l_1360 = alloca i32, align 4
  %l_1361 = alloca i32, align 4
  %l_1362 = alloca [10 x [10 x i32]], align 16
  %i1486 = alloca i32, align 4
  %j1487 = alloca i32, align 4
  %coerce.dive = getelementptr %union.U0* %p_8, i32 0, i32 0
  store i64 %p_8.coerce, i64* %coerce.dive
  store i32** %p_9, i32*** %p_9.addr, align 8
  store i32 %p_10, i32* %p_10.addr, align 4
  store i32* %p_11, i32** %p_11.addr, align 8
  store i32 %p_12, i32* %p_12.addr, align 4
  store i16 -1, i16* %l_898, align 2
  %0 = bitcast [7 x [1 x i16*]]* %l_899 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* bitcast ([7 x [1 x i16*]]* @func_7.l_899 to i8*), i64 56, i32 16, i1 false)
  store i32 1, i32* %l_900, align 4
  store i8* @g_682, i8** %l_901, align 8
  store i8* null, i8** %l_902, align 8
  store i8* @g_904, i8** %l_903, align 8
  store i32 -2113695510, i32* %l_905, align 4
  store %union.U1* @g_965, %union.U1** %l_964, align 8
  %1 = bitcast [6 x %union.U0]* %l_972 to i8*
  call void @llvm.memset.p0i8.i64(i8* %1, i8 0, i64 48, i32 16, i1 false)
  %2 = bitcast i8* %1 to [6 x %union.U0]*
  %3 = getelementptr [6 x %union.U0]* %2, i32 0, i32 0
  %4 = getelementptr %union.U0* %3, i32 0, i32 0
  store i64 -2825793045126170165, i64* %4
  %5 = getelementptr [6 x %union.U0]* %2, i32 0, i32 1
  %6 = getelementptr %union.U0* %5, i32 0, i32 0
  store i64 -2825793045126170165, i64* %6
  %7 = getelementptr [6 x %union.U0]* %2, i32 0, i32 2
  %8 = getelementptr %union.U0* %7, i32 0, i32 0
  store i64 -2825793045126170165, i64* %8
  %9 = getelementptr [6 x %union.U0]* %2, i32 0, i32 3
  %10 = getelementptr %union.U0* %9, i32 0, i32 0
  store i64 -2825793045126170165, i64* %10
  %11 = getelementptr [6 x %union.U0]* %2, i32 0, i32 4
  %12 = getelementptr %union.U0* %11, i32 0, i32 0
  store i64 -2825793045126170165, i64* %12
  %13 = getelementptr [6 x %union.U0]* %2, i32 0, i32 5
  %14 = getelementptr %union.U0* %13, i32 0, i32 0
  store i64 -2825793045126170165, i64* %14
  store i32 -863303803, i32* %l_987, align 4
  store i32 -696180141, i32* %l_988, align 4
  store i32 -2, i32* %l_991, align 4
  store i32 -1, i32* %l_992, align 4
  store i32** @g_258, i32*** %l_1010, align 8
  %15 = bitcast [3 x [8 x [5 x i32]]]* %l_1035 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %15, i8* bitcast ([3 x [8 x [5 x i32]]]* @func_7.l_1035 to i8*), i64 480, i32 16, i1 false)
  store i8 -1, i8* %l_1057, align 1
  store i32 7, i32* %l_1066, align 4
  %16 = bitcast [6 x [1 x [2 x i32]]]* %l_1111 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %16, i8* bitcast ([6 x [1 x [2 x i32]]]* @func_7.l_1111 to i8*), i64 48, i32 16, i1 false)
  store i32 8, i32* %l_1113, align 4
  store i64 -6275196005109548572, i64* %l_1130, align 8
  store i32 1, i32* %l_1131, align 4
  store i32* bitcast (%union.U1* @g_965 to i32*), i32** %l_1137, align 8
  store i64* getelementptr inbounds (%union.U1* @g_1037, i32 0, i32 0), i64** %l_1140, align 8
  store i64** %l_1140, i64*** %l_1139, align 8
  store i64*** %l_1139, i64**** %l_1138, align 8
  %17 = bitcast [10 x [8 x [1 x i16]]]* %l_1144 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %17, i8* bitcast ([10 x [8 x [1 x i16]]]* @func_7.l_1144 to i8*), i64 160, i32 16, i1 false)
  %arrayinit.begin = getelementptr inbounds [6 x [9 x i32*]]* %l_1217, i64 0, i64 0
  %arrayinit.begin1 = getelementptr inbounds [9 x i32*]* %arrayinit.begin, i64 0, i64 0
  store i32* getelementptr inbounds ([1 x [8 x [10 x i32]]]* @g_110, i32 0, i64 0, i64 2, i64 2), i32** %arrayinit.begin1
  %arrayinit.element = getelementptr inbounds i32** %arrayinit.begin1, i64 1
  store i32* %l_905, i32** %arrayinit.element
  %arrayinit.element2 = getelementptr inbounds i32** %arrayinit.element, i64 1
  store i32* getelementptr inbounds ([1 x [8 x [10 x i32]]]* @g_110, i32 0, i64 0, i64 7, i64 0), i32** %arrayinit.element2
  %arrayinit.element3 = getelementptr inbounds i32** %arrayinit.element2, i64 1
  store i32* %l_905, i32** %arrayinit.element3
  %arrayinit.element4 = getelementptr inbounds i32** %arrayinit.element3, i64 1
  store i32* getelementptr inbounds ([1 x [8 x [10 x i32]]]* @g_110, i32 0, i64 0, i64 2, i64 2), i32** %arrayinit.element4
  %arrayinit.element5 = getelementptr inbounds i32** %arrayinit.element4, i64 1
  store i32* %l_1066, i32** %arrayinit.element5
  %arrayinit.element6 = getelementptr inbounds i32** %arrayinit.element5, i64 1
  store i32* null, i32** %arrayinit.element6
  %arrayinit.element7 = getelementptr inbounds i32** %arrayinit.element6, i64 1
  store i32* %l_905, i32** %arrayinit.element7
  %arrayinit.element8 = getelementptr inbounds i32** %arrayinit.element7, i64 1
  store i32* %l_1066, i32** %arrayinit.element8
  %arrayinit.element9 = getelementptr inbounds [9 x i32*]* %arrayinit.begin, i64 1
  %arrayinit.begin10 = getelementptr inbounds [9 x i32*]* %arrayinit.element9, i64 0, i64 0
  store i32* getelementptr inbounds ([1 x [8 x [10 x i32]]]* @g_110, i32 0, i64 0, i64 2, i64 2), i32** %arrayinit.begin10
  %arrayinit.element11 = getelementptr inbounds i32** %arrayinit.begin10, i64 1
  store i32* %l_905, i32** %arrayinit.element11
  %arrayinit.element12 = getelementptr inbounds i32** %arrayinit.element11, i64 1
  store i32* getelementptr inbounds ([1 x [8 x [10 x i32]]]* @g_110, i32 0, i64 0, i64 7, i64 0), i32** %arrayinit.element12
  %arrayinit.element13 = getelementptr inbounds i32** %arrayinit.element12, i64 1
  store i32* %l_905, i32** %arrayinit.element13
  %arrayinit.element14 = getelementptr inbounds i32** %arrayinit.element13, i64 1
  store i32* getelementptr inbounds ([1 x [8 x [10 x i32]]]* @g_110, i32 0, i64 0, i64 2, i64 2), i32** %arrayinit.element14
  %arrayinit.element15 = getelementptr inbounds i32** %arrayinit.element14, i64 1
  store i32* %l_1066, i32** %arrayinit.element15
  %arrayinit.element16 = getelementptr inbounds i32** %arrayinit.element15, i64 1
  store i32* null, i32** %arrayinit.element16
  %arrayinit.element17 = getelementptr inbounds i32** %arrayinit.element16, i64 1
  store i32* %l_905, i32** %arrayinit.element17
  %arrayinit.element18 = getelementptr inbounds i32** %arrayinit.element17, i64 1
  store i32* %l_1066, i32** %arrayinit.element18
  %arrayinit.element19 = getelementptr inbounds [9 x i32*]* %arrayinit.element9, i64 1
  %arrayinit.begin20 = getelementptr inbounds [9 x i32*]* %arrayinit.element19, i64 0, i64 0
  store i32* getelementptr inbounds ([1 x [8 x [10 x i32]]]* @g_110, i32 0, i64 0, i64 2, i64 2), i32** %arrayinit.begin20
  %arrayinit.element21 = getelementptr inbounds i32** %arrayinit.begin20, i64 1
  store i32* %l_905, i32** %arrayinit.element21
  %arrayinit.element22 = getelementptr inbounds i32** %arrayinit.element21, i64 1
  store i32* getelementptr inbounds ([1 x [8 x [10 x i32]]]* @g_110, i32 0, i64 0, i64 7, i64 0), i32** %arrayinit.element22
  %arrayinit.element23 = getelementptr inbounds i32** %arrayinit.element22, i64 1
  store i32* %l_905, i32** %arrayinit.element23
  %arrayinit.element24 = getelementptr inbounds i32** %arrayinit.element23, i64 1
  store i32* getelementptr inbounds ([1 x [8 x [10 x i32]]]* @g_110, i32 0, i64 0, i64 2, i64 2), i32** %arrayinit.element24
  %arrayinit.element25 = getelementptr inbounds i32** %arrayinit.element24, i64 1
  store i32* %l_1066, i32** %arrayinit.element25
  %arrayinit.element26 = getelementptr inbounds i32** %arrayinit.element25, i64 1
  store i32* null, i32** %arrayinit.element26
  %arrayinit.element27 = getelementptr inbounds i32** %arrayinit.element26, i64 1
  store i32* %l_905, i32** %arrayinit.element27
  %arrayinit.element28 = getelementptr inbounds i32** %arrayinit.element27, i64 1
  store i32* %l_1066, i32** %arrayinit.element28
  %arrayinit.element29 = getelementptr inbounds [9 x i32*]* %arrayinit.element19, i64 1
  %arrayinit.begin30 = getelementptr inbounds [9 x i32*]* %arrayinit.element29, i64 0, i64 0
  store i32* getelementptr inbounds ([1 x [8 x [10 x i32]]]* @g_110, i32 0, i64 0, i64 2, i64 2), i32** %arrayinit.begin30
  %arrayinit.element31 = getelementptr inbounds i32** %arrayinit.begin30, i64 1
  store i32* %l_905, i32** %arrayinit.element31
  %arrayinit.element32 = getelementptr inbounds i32** %arrayinit.element31, i64 1
  store i32* getelementptr inbounds ([1 x [8 x [10 x i32]]]* @g_110, i32 0, i64 0, i64 7, i64 0), i32** %arrayinit.element32
  %arrayinit.element33 = getelementptr inbounds i32** %arrayinit.element32, i64 1
  store i32* %l_905, i32** %arrayinit.element33
  %arrayinit.element34 = getelementptr inbounds i32** %arrayinit.element33, i64 1
  store i32* getelementptr inbounds ([1 x [8 x [10 x i32]]]* @g_110, i32 0, i64 0, i64 2, i64 2), i32** %arrayinit.element34
  %arrayinit.element35 = getelementptr inbounds i32** %arrayinit.element34, i64 1
  store i32* %l_1066, i32** %arrayinit.element35
  %arrayinit.element36 = getelementptr inbounds i32** %arrayinit.element35, i64 1
  store i32* null, i32** %arrayinit.element36
  %arrayinit.element37 = getelementptr inbounds i32** %arrayinit.element36, i64 1
  store i32* %l_905, i32** %arrayinit.element37
  %arrayinit.element38 = getelementptr inbounds i32** %arrayinit.element37, i64 1
  store i32* %l_1066, i32** %arrayinit.element38
  %arrayinit.element39 = getelementptr inbounds [9 x i32*]* %arrayinit.element29, i64 1
  %arrayinit.begin40 = getelementptr inbounds [9 x i32*]* %arrayinit.element39, i64 0, i64 0
  store i32* getelementptr inbounds ([1 x [8 x [10 x i32]]]* @g_110, i32 0, i64 0, i64 2, i64 2), i32** %arrayinit.begin40
  %arrayinit.element41 = getelementptr inbounds i32** %arrayinit.begin40, i64 1
  store i32* %l_905, i32** %arrayinit.element41
  %arrayinit.element42 = getelementptr inbounds i32** %arrayinit.element41, i64 1
  store i32* getelementptr inbounds ([1 x [8 x [10 x i32]]]* @g_110, i32 0, i64 0, i64 7, i64 0), i32** %arrayinit.element42
  %arrayinit.element43 = getelementptr inbounds i32** %arrayinit.element42, i64 1
  store i32* %l_905, i32** %arrayinit.element43
  %arrayinit.element44 = getelementptr inbounds i32** %arrayinit.element43, i64 1
  store i32* getelementptr inbounds ([1 x [8 x [10 x i32]]]* @g_110, i32 0, i64 0, i64 2, i64 2), i32** %arrayinit.element44
  %arrayinit.element45 = getelementptr inbounds i32** %arrayinit.element44, i64 1
  store i32* %l_1066, i32** %arrayinit.element45
  %arrayinit.element46 = getelementptr inbounds i32** %arrayinit.element45, i64 1
  store i32* null, i32** %arrayinit.element46
  %arrayinit.element47 = getelementptr inbounds i32** %arrayinit.element46, i64 1
  store i32* %l_905, i32** %arrayinit.element47
  %arrayinit.element48 = getelementptr inbounds i32** %arrayinit.element47, i64 1
  store i32* %l_1066, i32** %arrayinit.element48
  %arrayinit.element49 = getelementptr inbounds [9 x i32*]* %arrayinit.element39, i64 1
  %arrayinit.begin50 = getelementptr inbounds [9 x i32*]* %arrayinit.element49, i64 0, i64 0
  store i32* getelementptr inbounds ([1 x [8 x [10 x i32]]]* @g_110, i32 0, i64 0, i64 2, i64 2), i32** %arrayinit.begin50
  %arrayinit.element51 = getelementptr inbounds i32** %arrayinit.begin50, i64 1
  store i32* %l_905, i32** %arrayinit.element51
  %arrayinit.element52 = getelementptr inbounds i32** %arrayinit.element51, i64 1
  store i32* getelementptr inbounds ([1 x [8 x [10 x i32]]]* @g_110, i32 0, i64 0, i64 7, i64 0), i32** %arrayinit.element52
  %arrayinit.element53 = getelementptr inbounds i32** %arrayinit.element52, i64 1
  store i32* %l_905, i32** %arrayinit.element53
  %arrayinit.element54 = getelementptr inbounds i32** %arrayinit.element53, i64 1
  store i32* getelementptr inbounds ([1 x [8 x [10 x i32]]]* @g_110, i32 0, i64 0, i64 2, i64 2), i32** %arrayinit.element54
  %arrayinit.element55 = getelementptr inbounds i32** %arrayinit.element54, i64 1
  store i32* %l_1066, i32** %arrayinit.element55
  %arrayinit.element56 = getelementptr inbounds i32** %arrayinit.element55, i64 1
  store i32* null, i32** %arrayinit.element56
  %arrayinit.element57 = getelementptr inbounds i32** %arrayinit.element56, i64 1
  store i32* %l_905, i32** %arrayinit.element57
  %arrayinit.element58 = getelementptr inbounds i32** %arrayinit.element57, i64 1
  store i32* %l_1066, i32** %arrayinit.element58
  store i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 3, i64 0, i64 2), i32** %l_1238, align 8
  store i32** %l_1238, i32*** %l_1298, align 8
  store i16 20810, i16* %l_1308, align 2
  store i32 -735241469, i32* %l_1342, align 4
  store i16 3, i16* %l_1348, align 2
  store i32** null, i32*** %l_1371, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %18 = load i32* %i, align 4
  %cmp = icmp slt i32 %18, 2
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %19 = load i32* %i, align 4
  %idxprom = sext i32 %19 to i64
  %arrayidx = getelementptr inbounds [2 x i32]* %l_993, i32 0, i64 %idxprom
  store i32 1576739541, i32* %arrayidx, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %20 = load i32* %i, align 4
  %inc = add nsw i32 %20, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %i, align 4
  br label %for.cond59

for.cond59:                                       ; preds = %for.inc80, %for.end
  %21 = load i32* %i, align 4
  %cmp60 = icmp slt i32 %21, 2
  br i1 %cmp60, label %for.body61, label %for.end82

for.body61:                                       ; preds = %for.cond59
  store i32 0, i32* %j, align 4
  br label %for.cond62

for.cond62:                                       ; preds = %for.inc77, %for.body61
  %22 = load i32* %j, align 4
  %cmp63 = icmp slt i32 %22, 1
  br i1 %cmp63, label %for.body64, label %for.end79

for.body64:                                       ; preds = %for.cond62
  store i32 0, i32* %k, align 4
  br label %for.cond65

for.cond65:                                       ; preds = %for.inc74, %for.body64
  %23 = load i32* %k, align 4
  %cmp66 = icmp slt i32 %23, 3
  br i1 %cmp66, label %for.body67, label %for.end76

for.body67:                                       ; preds = %for.cond65
  %24 = load i32* %k, align 4
  %idxprom68 = sext i32 %24 to i64
  %25 = load i32* %j, align 4
  %idxprom69 = sext i32 %25 to i64
  %26 = load i32* %i, align 4
  %idxprom70 = sext i32 %26 to i64
  %arrayidx71 = getelementptr inbounds [2 x [1 x [3 x i64***]]]* %l_1141, i32 0, i64 %idxprom70
  %arrayidx72 = getelementptr inbounds [1 x [3 x i64***]]* %arrayidx71, i32 0, i64 %idxprom69
  %arrayidx73 = getelementptr inbounds [3 x i64***]* %arrayidx72, i32 0, i64 %idxprom68
  store i64*** null, i64**** %arrayidx73, align 8
  br label %for.inc74

for.inc74:                                        ; preds = %for.body67
  %27 = load i32* %k, align 4
  %inc75 = add nsw i32 %27, 1
  store i32 %inc75, i32* %k, align 4
  br label %for.cond65

for.end76:                                        ; preds = %for.cond65
  br label %for.inc77

for.inc77:                                        ; preds = %for.end76
  %28 = load i32* %j, align 4
  %inc78 = add nsw i32 %28, 1
  store i32 %inc78, i32* %j, align 4
  br label %for.cond62

for.end79:                                        ; preds = %for.cond62
  br label %for.inc80

for.inc80:                                        ; preds = %for.end79
  %29 = load i32* %i, align 4
  %inc81 = add nsw i32 %29, 1
  store i32 %inc81, i32* %i, align 4
  br label %for.cond59

for.end82:                                        ; preds = %for.cond59
  %30 = load i32* %p_12.addr, align 4
  %conv = trunc i32 %30 to i8
  %call = call zeroext i8 @safe_unary_minus_func_uint8_t_u(i8 zeroext %conv)
  br i1 true, label %if.then, label %if.else333

if.then:                                          ; preds = %for.end82
  store i16 -14783, i16* %l_925, align 2
  %31 = bitcast [8 x [4 x [2 x i32**]]]* %l_944 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %31, i8* bitcast ([8 x [4 x [2 x i32**]]]* @func_7.l_944 to i8*), i64 512, i32 16, i1 false)
  store i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 2, i64 0, i64 3), i32** %l_966, align 8
  store i32 -133802099, i32* %l_998, align 4
  store %union.U0**** @g_618, %union.U0***** %l_1002, align 8
  store i64* @g_49, i64** %l_1011, align 8
  store i32 9, i32* %l_1045, align 4
  %32 = bitcast [10 x i8]* %l_1059 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %32, i8* getelementptr inbounds ([10 x i8]* @func_7.l_1059, i32 0, i32 0), i64 10, i32 1, i1 false)
  store i32* null, i32** %l_1081, align 8
  store i64 -2, i64* %l_1089, align 8
  store i16** null, i16*** %l_1116, align 8
  store i32* %l_992, i32** %l_1129, align 8
  store i32 0, i32* bitcast (%union.U1* @g_130 to i32*), align 4
  br label %for.cond86

for.cond86:                                       ; preds = %for.inc244, %if.then
  %33 = load i32* bitcast (%union.U1* @g_130 to i32*), align 4
  %cmp87 = icmp sle i32 %33, 0
  br i1 %cmp87, label %for.body89, label %for.end246

for.body89:                                       ; preds = %for.cond86
  store i32 -1, i32* %l_921, align 4
  %34 = bitcast %union.U0* %l_947 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %34, i8* bitcast (%union.U0* @func_7.l_947 to i8*), i64 8, i32 8, i1 false)
  %35 = bitcast [1 x [7 x [6 x i32]]]* %l_995 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %35, i8* bitcast ([1 x [7 x [6 x i32]]]* @func_7.l_995 to i8*), i64 168, i32 16, i1 false)
  store i64 -4, i64* %l_997, align 8
  %36 = bitcast [4 x i32]* %l_999 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %36, i8* bitcast ([4 x i32]* @func_7.l_999 to i8*), i64 16, i32 16, i1 false)
  store i64 0, i64* %l_1009, align 8
  store i32 0, i32* bitcast (%union.U0* @g_886 to i32*), align 4
  br label %for.cond93

for.cond93:                                       ; preds = %for.inc225, %for.body89
  %37 = load i32* bitcast (%union.U0* @g_886 to i32*), align 4
  %cmp94 = icmp sle i32 %37, 0
  br i1 %cmp94, label %for.body96, label %for.end227

for.body96:                                       ; preds = %for.cond93
  store i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 2, i64 0, i64 3), i32** %l_906, align 8
  store i32* @g_471, i32** %l_907, align 8
  store i32* null, i32** %l_908, align 8
  store i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 4, i64 0, i64 7), i32** %l_909, align 8
  store i32* @g_3, i32** %l_910, align 8
  store i32* @g_471, i32** %l_911, align 8
  store i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 2, i64 0, i64 3), i32** %l_912, align 8
  store i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 2, i64 0, i64 3), i32** %l_913, align 8
  store i32 0, i32* %l_914, align 4
  store i32* %l_914, i32** %l_915, align 8
  store i32* %l_914, i32** %l_916, align 8
  store i32* @g_3, i32** %l_917, align 8
  store i32* @g_471, i32** %l_918, align 8
  store i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 5, i64 0, i64 6), i32** %l_919, align 8
  store i32* %l_914, i32** %l_920, align 8
  store i32* @g_3, i32** %l_922, align 8
  store i32* @g_471, i32** %l_923, align 8
  %38 = bitcast [9 x i32*]* %l_924 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %38, i8* bitcast ([9 x i32*]* @func_7.l_924 to i8*), i64 72, i32 16, i1 false)
  %39 = load i16* %l_925, align 2
  %dec = add i16 %39, -1
  store i16 %dec, i16* %l_925, align 2
  store i32 4, i32* @g_3, align 4
  br label %for.cond98

for.cond98:                                       ; preds = %for.inc223, %for.body96
  %40 = load i32* @g_3, align 4
  %cmp99 = icmp sge i32 %40, 0
  br i1 %cmp99, label %for.body101, label %for.end224

for.body101:                                      ; preds = %for.cond98
  %41 = bitcast [3 x [5 x [7 x i8*]]]* %l_928 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %41, i8* bitcast ([3 x [5 x [7 x i8*]]]* @func_7.l_928 to i8*), i64 840, i32 16, i1 false)
  store %union.U0* @g_13, %union.U0** %l_935, align 8
  store %union.U0** %l_935, %union.U0*** %l_934, align 8
  store %union.U0*** %l_934, %union.U0**** %l_933, align 8
  store %union.U0**** %l_933, %union.U0***** %l_932, align 8
  store %union.U0***** %l_932, %union.U0****** %l_931, align 8
  store %union.U1* @g_307, %union.U1** %l_959, align 8
  %42 = load i32* bitcast (%union.U0* @g_886 to i32*), align 4
  %add = add nsw i32 %42, 2
  %idxprom105 = sext i32 %add to i64
  %arrayidx106 = getelementptr inbounds [5 x i16]* @g_364, i32 0, i64 %idxprom105
  %43 = load i16* %arrayidx106, align 2
  %conv107 = trunc i16 %43 to i8
  store i8 %conv107, i8* @g_200, align 1
  %44 = load i32* %p_10.addr, align 4
  %45 = load i16* %l_925, align 2
  %conv108 = zext i16 %45 to i32
  %xor = xor i32 %44, %conv108
  %conv109 = trunc i32 %xor to i16
  %46 = load i32* %p_12.addr, align 4
  %and = and i32 0, %46
  %conv110 = trunc i32 %and to i16
  %call111 = call signext i16 @safe_mul_func_int16_t_s_s(i16 signext %conv109, i16 signext %conv110)
  %conv112 = trunc i16 %call111 to i8
  %47 = load i8** %l_903, align 8
  store i8 %conv112, i8* %47, align 1
  %conv113 = sext i8 %conv112 to i32
  %48 = load i8** %l_901, align 8
  %49 = load i8* %48, align 1
  %conv114 = sext i8 %49 to i32
  %or = or i32 %conv114, %conv113
  %conv115 = trunc i32 %or to i8
  store i8 %conv115, i8* %48, align 1
  %50 = load %union.U0****** %l_931, align 8
  %cmp116 = icmp eq %union.U0***** %50, %l_932
  br i1 %cmp116, label %if.then118, label %if.else

if.then118:                                       ; preds = %for.body101
  %51 = bitcast [4 x %union.U0]* %l_948 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %51, i8* bitcast ([4 x %union.U0]* @func_7.l_948 to i8*), i64 32, i32 16, i1 false)
  store i64* getelementptr inbounds (%union.U1* @g_815, i32 0, i32 0), i64** %l_949, align 8
  store i32** %l_922, i32*** %l_958, align 8
  store %union.U1** @g_133, %union.U1*** %l_960, align 8
  %f1 = bitcast %union.U0* %p_8 to i32*
  %52 = load i32* %f1, align 4
  %conv122 = sext i32 %52 to i64
  %arrayidx123 = getelementptr inbounds [8 x [4 x [2 x i32**]]]* %l_944, i32 0, i64 6
  %arrayidx124 = getelementptr inbounds [4 x [2 x i32**]]* %arrayidx123, i32 0, i64 1
  %arrayidx125 = getelementptr inbounds [2 x i32**]* %arrayidx124, i32 0, i64 1
  %53 = load i32*** %arrayidx125, align 8
  %54 = load i32* bitcast (%union.U0* @g_886 to i32*), align 4
  %add126 = add nsw i32 %54, 2
  %idxprom127 = sext i32 %add126 to i64
  %arrayidx128 = getelementptr inbounds [5 x i16]* @g_364, i32 0, i64 %idxprom127
  %55 = load i16* %arrayidx128, align 2
  %conv129 = zext i16 %55 to i64
  %cmp130 = icmp sgt i64 %conv129, -6
  %conv131 = zext i1 %cmp130 to i32
  %conv132 = trunc i32 %conv131 to i8
  %call133 = call zeroext i8 @safe_lshift_func_uint8_t_u_u(i8 zeroext %conv132, i32 7)
  %call134 = call zeroext i16 @func_36(i32* %l_914, i32** %53, i8 zeroext %call133, i32* %l_900)
  %conv135 = trunc i16 %call134 to i8
  %arrayidx137 = getelementptr inbounds [4 x %union.U0]* %l_948, i32 0, i64 3
  %56 = bitcast %union.U0* %arrayidx137 to i8*
  %57 = bitcast %union.U0* %l_947 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %56, i8* %57, i64 8, i32 8, i1 false)
  %58 = bitcast %union.U0* %agg.tmp136 to i8*
  %59 = bitcast %union.U0* %arrayidx137 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %58, i8* %59, i64 8, i32 8, i1 false)
  %coerce.dive138 = getelementptr %union.U0* %agg.tmp136, i32 0, i32 0
  %60 = load i64* %coerce.dive138
  %call139 = call i32 @func_14(i64 %60)
  %conv140 = zext i32 %call139 to i64
  %cmp141 = icmp ne i64 %conv140, -8
  %conv142 = zext i1 %cmp141 to i32
  %conv143 = trunc i32 %conv142 to i8
  %call144 = call signext i8 @safe_sub_func_int8_t_s_s(i8 signext %conv135, i8 signext %conv143)
  %conv145 = sext i8 %call144 to i64
  %61 = load i64** %l_949, align 8
  store i64 %conv145, i64* %61, align 8
  %call146 = call i64 @safe_add_func_int64_t_s_s(i64 %conv122, i64 %conv145)
  %and147 = and i64 %call146, 250
  %62 = bitcast %union.U0* %agg.tmp to i8*
  %63 = bitcast %union.U0* %p_8 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %62, i8* %63, i64 8, i32 8, i1 false)
  %coerce.dive148 = getelementptr %union.U0* %agg.tmp, i32 0, i32 0
  %64 = load i64* %coerce.dive148
  %call149 = call i32 @func_14(i64 %64)
  %arrayidx150 = getelementptr inbounds [4 x %union.U0]* %l_948, i32 0, i64 3
  %f1151 = bitcast %union.U0* %arrayidx150 to i32*
  %65 = load i32* %f1151, align 4
  %conv152 = trunc i32 %65 to i16
  %call153 = call signext i16 @safe_rshift_func_int16_t_s_u(i16 signext %conv152, i32 6)
  %conv154 = trunc i16 %call153 to i8
  %66 = load i32* bitcast (%union.U0* @g_886 to i32*), align 4
  %add155 = add nsw i32 %66, 2
  %idxprom156 = sext i32 %add155 to i64
  %arrayidx157 = getelementptr inbounds [5 x i16]* @g_364, i32 0, i64 %idxprom156
  %67 = load i16* %arrayidx157, align 2
  %conv158 = trunc i16 %67 to i8
  %call159 = call zeroext i8 @safe_div_func_uint8_t_u_u(i8 zeroext %conv154, i8 zeroext %conv158)
  %conv160 = zext i8 %call159 to i32
  %68 = load i32* @g_471, align 4
  %cmp161 = icmp ne i32 %conv160, %68
  %conv162 = zext i1 %cmp161 to i32
  %69 = load i32* bitcast (%union.U1* @g_130 to i32*), align 4
  %add163 = add nsw i32 %69, 8
  %idxprom164 = sext i32 %add163 to i64
  %70 = load i32* bitcast (%union.U0* @g_886 to i32*), align 4
  %idxprom165 = sext i32 %70 to i64
  %71 = load i32* bitcast (%union.U1* @g_130 to i32*), align 4
  %add166 = add nsw i32 %71, 3
  %idxprom167 = sext i32 %add166 to i64
  %arrayidx168 = getelementptr inbounds [6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 %idxprom167
  %arrayidx169 = getelementptr inbounds [1 x [10 x i32]]* %arrayidx168, i32 0, i64 %idxprom165
  %arrayidx170 = getelementptr inbounds [10 x i32]* %arrayidx169, i32 0, i64 %idxprom164
  store i32 %conv162, i32* %arrayidx170, align 4
  %72 = load i32** @g_278, align 8
  %73 = load i32* %72, align 4
  %74 = load i32** %l_919, align 8
  store i32 %73, i32* %74, align 4
  %75 = load i32** %l_915, align 8
  store i32 %73, i32* %75, align 4
  %76 = load i32* %l_905, align 4
  %conv171 = trunc i32 %76 to i8
  %77 = load i32** %p_11.addr, align 8
  %78 = load i32*** %l_958, align 8
  %79 = load i32* bitcast (%union.U0* @g_886 to i32*), align 4
  %add172 = add nsw i32 %79, 2
  %idxprom173 = sext i32 %add172 to i64
  %arrayidx174 = getelementptr inbounds [5 x i16]* @g_364, i32 0, i64 %idxprom173
  %80 = load i16* %arrayidx174, align 2
  %conv175 = trunc i16 %80 to i8
  %81 = load i32** %p_11.addr, align 8
  %call176 = call zeroext i16 @func_36(i32* %77, i32** %78, i8 zeroext %conv175, i32* %81)
  %conv177 = trunc i16 %call176 to i8
  %call178 = call zeroext i8 @safe_mul_func_uint8_t_u_u(i8 zeroext %conv171, i8 zeroext %conv177)
  %conv179 = zext i8 %call178 to i64
  %82 = load i32* bitcast (%union.U0* @g_13 to i32*), align 4
  store i32 %82, i32* %l_921, align 4
  %83 = load i64* getelementptr inbounds (%union.U1* @g_815, i32 0, i32 0), align 8
  %cmp180 = icmp sgt i64 %conv179, %83
  %conv181 = zext i1 %cmp180 to i32
  %conv182 = trunc i32 %conv181 to i8
  %84 = load i32* %p_10.addr, align 4
  %call183 = call signext i8 @safe_lshift_func_int8_t_s_u(i8 signext %conv182, i32 %84)
  %85 = load i32** %l_915, align 8
  %86 = load i32* %85, align 4
  %conv184 = sext i32 %86 to i64
  %cmp185 = icmp sgt i64 224, %conv184
  %conv186 = zext i1 %cmp185 to i32
  %call187 = call i32 @safe_add_func_int32_t_s_s(i32 9, i32 1)
  %conv188 = trunc i32 %call187 to i16
  %call189 = call zeroext i16 @safe_lshift_func_uint16_t_u_s(i16 zeroext %conv188, i32 12)
  %conv190 = zext i16 %call189 to i64
  %cmp191 = icmp ne i64 %conv190, 189
  %conv192 = zext i1 %cmp191 to i32
  %87 = load i16* %l_898, align 2
  %conv193 = zext i16 %87 to i32
  %xor194 = xor i32 %conv192, %conv193
  %88 = load i32** @g_278, align 8
  %89 = load i32* %88, align 4
  %cmp195 = icmp sgt i32 %xor194, %89
  %conv196 = zext i1 %cmp195 to i32
  %90 = load i32** %l_918, align 8
  %91 = load i32* %90, align 4
  %and197 = and i32 %91, %conv196
  store i32 %and197, i32* %90, align 4
  %92 = load %union.U1** %l_959, align 8
  %93 = load %union.U1*** %l_960, align 8
  store %union.U1* %92, %union.U1** %93, align 8
  br label %if.end222

if.else:                                          ; preds = %for.body101
  store %union.U1** null, %union.U1*** %l_961, align 8
  store i32 0, i32* %i198, align 4
  br label %for.cond200

for.cond200:                                      ; preds = %for.inc215, %if.else
  %94 = load i32* %i198, align 4
  %cmp201 = icmp slt i32 %94, 4
  br i1 %cmp201, label %for.body203, label %for.end217

for.body203:                                      ; preds = %for.cond200
  store i32 0, i32* %j199, align 4
  br label %for.cond204

for.cond204:                                      ; preds = %for.inc212, %for.body203
  %95 = load i32* %j199, align 4
  %cmp205 = icmp slt i32 %95, 2
  br i1 %cmp205, label %for.body207, label %for.end214

for.body207:                                      ; preds = %for.cond204
  %96 = load i32* %j199, align 4
  %idxprom208 = sext i32 %96 to i64
  %97 = load i32* %i198, align 4
  %idxprom209 = sext i32 %97 to i64
  %arrayidx210 = getelementptr inbounds [4 x [2 x %union.U1**]]* %l_963, i32 0, i64 %idxprom209
  %arrayidx211 = getelementptr inbounds [2 x %union.U1**]* %arrayidx210, i32 0, i64 %idxprom208
  store %union.U1** @g_133, %union.U1*** %arrayidx211, align 8
  br label %for.inc212

for.inc212:                                       ; preds = %for.body207
  %98 = load i32* %j199, align 4
  %inc213 = add nsw i32 %98, 1
  store i32 %inc213, i32* %j199, align 4
  br label %for.cond204

for.end214:                                       ; preds = %for.cond204
  br label %for.inc215

for.inc215:                                       ; preds = %for.end214
  %99 = load i32* %i198, align 4
  %inc216 = add nsw i32 %99, 1
  store i32 %inc216, i32* %i198, align 4
  br label %for.cond200

for.end217:                                       ; preds = %for.cond200
  %100 = load volatile %union.U1*** @g_132, align 8
  %101 = load %union.U1** %100, align 8
  store %union.U1* %101, %union.U1** %l_964, align 8
  %102 = load i32** %l_920, align 8
  store i32 1, i32* %102, align 4
  %103 = load i32* bitcast (%union.U0* @g_886 to i32*), align 4
  %add218 = add nsw i32 %103, 2
  %idxprom219 = sext i32 %add218 to i64
  %arrayidx220 = getelementptr inbounds [5 x i16]* @g_364, i32 0, i64 %idxprom219
  %104 = load i16* %arrayidx220, align 2
  %tobool = icmp ne i16 %104, 0
  br i1 %tobool, label %if.then221, label %if.end

if.then221:                                       ; preds = %for.end217
  br label %for.end224

if.end:                                           ; preds = %for.end217
  br label %if.end222

if.end222:                                        ; preds = %if.end, %if.then118
  store i32* %l_900, i32** %l_966, align 8
  %105 = load volatile i32*** @g_55, align 8
  store i32* %l_900, i32** %105, align 8
  %106 = load i32** @g_278, align 8
  %107 = load i32* %106, align 4
  %108 = load i32** %l_923, align 8
  store i32 %107, i32* %108, align 4
  br label %for.inc223

for.inc223:                                       ; preds = %if.end222
  %109 = load i32* @g_3, align 4
  %sub = sub nsw i32 %109, 1
  store i32 %sub, i32* @g_3, align 4
  br label %for.cond98

for.end224:                                       ; preds = %if.then221, %for.cond98
  br label %for.inc225

for.inc225:                                       ; preds = %for.end224
  %110 = load i32* bitcast (%union.U0* @g_886 to i32*), align 4
  %add226 = add nsw i32 %110, 1
  store i32 %add226, i32* bitcast (%union.U0* @g_886 to i32*), align 4
  br label %for.cond93

for.end227:                                       ; preds = %for.cond93
  %111 = load i16* %l_898, align 2
  %conv228 = trunc i16 %111 to i8
  %call229 = call signext i8 @safe_rshift_func_int8_t_s_u(i8 signext %conv228, i32 3)
  %conv230 = sext i8 %call229 to i32
  %112 = load i32** @g_258, align 8
  store i32 %conv230, i32* %112, align 4
  store i8 0, i8* @g_200, align 1
  br label %for.cond231

for.cond231:                                      ; preds = %for.inc239, %for.end227
  %113 = load i8* @g_200, align 1
  %conv232 = zext i8 %113 to i32
  %cmp233 = icmp sle i32 %conv232, 9
  br i1 %cmp233, label %for.body235, label %for.end243

for.body235:                                      ; preds = %for.cond231
  %114 = bitcast %union.U0* %l_971 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %114, i8* bitcast (%union.U0* @func_7.l_971 to i8*), i64 8, i32 8, i1 false)
  %115 = bitcast [5 x [7 x [7 x i32]]]* %l_990 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %115, i8* bitcast ([5 x [7 x [7 x i32]]]* @func_7.l_990 to i8*), i64 980, i32 16, i1 false)
  store i32 -1, i32* %l_1007, align 4
  store i32* %l_991, i32** %l_1008, align 8
  br label %for.inc239

for.inc239:                                       ; preds = %for.body235
  %116 = load i8* @g_200, align 1
  %conv240 = zext i8 %116 to i32
  %call241 = call i32 @safe_add_func_uint32_t_u_u(i32 %conv240, i32 8)
  %conv242 = trunc i32 %call241 to i8
  store i8 %conv242, i8* @g_200, align 1
  br label %for.cond231

for.end243:                                       ; preds = %for.cond231
  br label %for.inc244

for.inc244:                                       ; preds = %for.end243
  %117 = load i32* bitcast (%union.U1* @g_130 to i32*), align 4
  %add245 = add nsw i32 %117, 1
  store i32 %add245, i32* bitcast (%union.U1* @g_130 to i32*), align 4
  br label %for.cond86

for.end246:                                       ; preds = %for.cond86
  %118 = load i32*** %l_1010, align 8
  %119 = load i32** %l_966, align 8
  %120 = load i32*** %l_1010, align 8
  %121 = load i32** %120, align 8
  %call247 = call i64 @func_18(i32** %118, i32* %119, i32* %121)
  %122 = load i64** %l_1011, align 8
  store i64 %call247, i64* %122, align 8
  %123 = load i32* %p_10.addr, align 4
  %conv248 = zext i32 %123 to i64
  %cmp249 = icmp eq i64 %call247, %conv248
  %conv250 = zext i1 %cmp249 to i32
  %124 = load i32** @g_258, align 8
  store i32 %conv250, i32* %124, align 4
  store i32 0, i32* @g_471, align 4
  br label %for.cond251

for.cond251:                                      ; preds = %for.inc330, %for.end246
  %125 = load i32* @g_471, align 4
  %cmp252 = icmp eq i32 %125, -15
  br i1 %cmp252, label %for.body254, label %for.end332

for.body254:                                      ; preds = %for.cond251
  store i32**** getelementptr inbounds ([7 x i32***]* @g_780, i32 0, i64 4), i32***** %l_1022, align 8
  store i32 -1767330465, i32* %l_1042, align 4
  store i32 -3, i32* %l_1051, align 4
  store i32 -1218360424, i32* %l_1052, align 4
  store i32 -1887594872, i32* %l_1054, align 4
  store i32 160696759, i32* %l_1055, align 4
  %126 = bitcast [7 x i32]* %l_1056 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %126, i8* bitcast ([7 x i32]* @func_7.l_1056 to i8*), i64 28, i32 16, i1 false)
  store i16** @g_417, i16*** %l_1115, align 8
  %127 = bitcast %union.U0* %l_1117 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %127, i8* bitcast (%union.U0* @func_7.l_1117 to i8*), i64 8, i32 8, i1 false)
  %arrayinit.begin255 = getelementptr inbounds [8 x [5 x i32*]]* %l_1134, i64 0, i64 0
  %arrayinit.begin256 = getelementptr inbounds [5 x i32*]* %arrayinit.begin255, i64 0, i64 0
  store i32* %l_1055, i32** %arrayinit.begin256
  %arrayinit.element257 = getelementptr inbounds i32** %arrayinit.begin256, i64 1
  store i32* %l_1055, i32** %arrayinit.element257
  %arrayinit.element258 = getelementptr inbounds i32** %arrayinit.element257, i64 1
  store i32* %l_991, i32** %arrayinit.element258
  %arrayinit.element259 = getelementptr inbounds i32** %arrayinit.element258, i64 1
  %arrayidx260 = getelementptr inbounds [2 x i32]* %l_993, i32 0, i64 0
  store i32* %arrayidx260, i32** %arrayinit.element259
  %arrayinit.element261 = getelementptr inbounds i32** %arrayinit.element259, i64 1
  %arrayidx262 = getelementptr inbounds [2 x i32]* %l_993, i32 0, i64 0
  store i32* %arrayidx262, i32** %arrayinit.element261
  %arrayinit.element263 = getelementptr inbounds [5 x i32*]* %arrayinit.begin255, i64 1
  %arrayinit.begin264 = getelementptr inbounds [5 x i32*]* %arrayinit.element263, i64 0, i64 0
  store i32* %l_1055, i32** %arrayinit.begin264
  %arrayinit.element265 = getelementptr inbounds i32** %arrayinit.begin264, i64 1
  store i32* %l_1055, i32** %arrayinit.element265
  %arrayinit.element266 = getelementptr inbounds i32** %arrayinit.element265, i64 1
  store i32* %l_991, i32** %arrayinit.element266
  %arrayinit.element267 = getelementptr inbounds i32** %arrayinit.element266, i64 1
  %arrayidx268 = getelementptr inbounds [2 x i32]* %l_993, i32 0, i64 0
  store i32* %arrayidx268, i32** %arrayinit.element267
  %arrayinit.element269 = getelementptr inbounds i32** %arrayinit.element267, i64 1
  %arrayidx270 = getelementptr inbounds [2 x i32]* %l_993, i32 0, i64 0
  store i32* %arrayidx270, i32** %arrayinit.element269
  %arrayinit.element271 = getelementptr inbounds [5 x i32*]* %arrayinit.element263, i64 1
  %arrayinit.begin272 = getelementptr inbounds [5 x i32*]* %arrayinit.element271, i64 0, i64 0
  store i32* %l_1055, i32** %arrayinit.begin272
  %arrayinit.element273 = getelementptr inbounds i32** %arrayinit.begin272, i64 1
  store i32* %l_1055, i32** %arrayinit.element273
  %arrayinit.element274 = getelementptr inbounds i32** %arrayinit.element273, i64 1
  store i32* %l_991, i32** %arrayinit.element274
  %arrayinit.element275 = getelementptr inbounds i32** %arrayinit.element274, i64 1
  %arrayidx276 = getelementptr inbounds [2 x i32]* %l_993, i32 0, i64 0
  store i32* %arrayidx276, i32** %arrayinit.element275
  %arrayinit.element277 = getelementptr inbounds i32** %arrayinit.element275, i64 1
  %arrayidx278 = getelementptr inbounds [2 x i32]* %l_993, i32 0, i64 0
  store i32* %arrayidx278, i32** %arrayinit.element277
  %arrayinit.element279 = getelementptr inbounds [5 x i32*]* %arrayinit.element271, i64 1
  %arrayinit.begin280 = getelementptr inbounds [5 x i32*]* %arrayinit.element279, i64 0, i64 0
  store i32* %l_1055, i32** %arrayinit.begin280
  %arrayinit.element281 = getelementptr inbounds i32** %arrayinit.begin280, i64 1
  store i32* %l_1055, i32** %arrayinit.element281
  %arrayinit.element282 = getelementptr inbounds i32** %arrayinit.element281, i64 1
  store i32* %l_991, i32** %arrayinit.element282
  %arrayinit.element283 = getelementptr inbounds i32** %arrayinit.element282, i64 1
  %arrayidx284 = getelementptr inbounds [2 x i32]* %l_993, i32 0, i64 0
  store i32* %arrayidx284, i32** %arrayinit.element283
  %arrayinit.element285 = getelementptr inbounds i32** %arrayinit.element283, i64 1
  %arrayidx286 = getelementptr inbounds [2 x i32]* %l_993, i32 0, i64 0
  store i32* %arrayidx286, i32** %arrayinit.element285
  %arrayinit.element287 = getelementptr inbounds [5 x i32*]* %arrayinit.element279, i64 1
  %arrayinit.begin288 = getelementptr inbounds [5 x i32*]* %arrayinit.element287, i64 0, i64 0
  store i32* %l_1055, i32** %arrayinit.begin288
  %arrayinit.element289 = getelementptr inbounds i32** %arrayinit.begin288, i64 1
  store i32* %l_1055, i32** %arrayinit.element289
  %arrayinit.element290 = getelementptr inbounds i32** %arrayinit.element289, i64 1
  store i32* %l_991, i32** %arrayinit.element290
  %arrayinit.element291 = getelementptr inbounds i32** %arrayinit.element290, i64 1
  %arrayidx292 = getelementptr inbounds [2 x i32]* %l_993, i32 0, i64 0
  store i32* %arrayidx292, i32** %arrayinit.element291
  %arrayinit.element293 = getelementptr inbounds i32** %arrayinit.element291, i64 1
  %arrayidx294 = getelementptr inbounds [2 x i32]* %l_993, i32 0, i64 0
  store i32* %arrayidx294, i32** %arrayinit.element293
  %arrayinit.element295 = getelementptr inbounds [5 x i32*]* %arrayinit.element287, i64 1
  %arrayinit.begin296 = getelementptr inbounds [5 x i32*]* %arrayinit.element295, i64 0, i64 0
  store i32* %l_1055, i32** %arrayinit.begin296
  %arrayinit.element297 = getelementptr inbounds i32** %arrayinit.begin296, i64 1
  store i32* %l_1055, i32** %arrayinit.element297
  %arrayinit.element298 = getelementptr inbounds i32** %arrayinit.element297, i64 1
  store i32* %l_991, i32** %arrayinit.element298
  %arrayinit.element299 = getelementptr inbounds i32** %arrayinit.element298, i64 1
  %arrayidx300 = getelementptr inbounds [2 x i32]* %l_993, i32 0, i64 0
  store i32* %arrayidx300, i32** %arrayinit.element299
  %arrayinit.element301 = getelementptr inbounds i32** %arrayinit.element299, i64 1
  %arrayidx302 = getelementptr inbounds [2 x i32]* %l_993, i32 0, i64 0
  store i32* %arrayidx302, i32** %arrayinit.element301
  %arrayinit.element303 = getelementptr inbounds [5 x i32*]* %arrayinit.element295, i64 1
  %arrayinit.begin304 = getelementptr inbounds [5 x i32*]* %arrayinit.element303, i64 0, i64 0
  store i32* %l_1055, i32** %arrayinit.begin304
  %arrayinit.element305 = getelementptr inbounds i32** %arrayinit.begin304, i64 1
  store i32* %l_1055, i32** %arrayinit.element305
  %arrayinit.element306 = getelementptr inbounds i32** %arrayinit.element305, i64 1
  store i32* %l_991, i32** %arrayinit.element306
  %arrayinit.element307 = getelementptr inbounds i32** %arrayinit.element306, i64 1
  %arrayidx308 = getelementptr inbounds [2 x i32]* %l_993, i32 0, i64 0
  store i32* %arrayidx308, i32** %arrayinit.element307
  %arrayinit.element309 = getelementptr inbounds i32** %arrayinit.element307, i64 1
  %arrayidx310 = getelementptr inbounds [2 x i32]* %l_993, i32 0, i64 0
  store i32* %arrayidx310, i32** %arrayinit.element309
  %arrayinit.element311 = getelementptr inbounds [5 x i32*]* %arrayinit.element303, i64 1
  %arrayinit.begin312 = getelementptr inbounds [5 x i32*]* %arrayinit.element311, i64 0, i64 0
  store i32* %l_1055, i32** %arrayinit.begin312
  %arrayinit.element313 = getelementptr inbounds i32** %arrayinit.begin312, i64 1
  store i32* %l_1055, i32** %arrayinit.element313
  %arrayinit.element314 = getelementptr inbounds i32** %arrayinit.element313, i64 1
  store i32* %l_991, i32** %arrayinit.element314
  %arrayinit.element315 = getelementptr inbounds i32** %arrayinit.element314, i64 1
  %arrayidx316 = getelementptr inbounds [2 x i32]* %l_993, i32 0, i64 0
  store i32* %arrayidx316, i32** %arrayinit.element315
  %arrayinit.element317 = getelementptr inbounds i32** %arrayinit.element315, i64 1
  %arrayidx318 = getelementptr inbounds [2 x i32]* %l_993, i32 0, i64 0
  store i32* %arrayidx318, i32** %arrayinit.element317
  store i32 0, i32* %i319, align 4
  br label %for.cond321

for.cond321:                                      ; preds = %for.inc327, %for.body254
  %128 = load i32* %i319, align 4
  %cmp322 = icmp slt i32 %128, 2
  br i1 %cmp322, label %for.body324, label %for.end329

for.body324:                                      ; preds = %for.cond321
  %129 = load i32* %i319, align 4
  %idxprom325 = sext i32 %129 to i64
  %arrayidx326 = getelementptr inbounds [2 x i32**]* %l_1082, i32 0, i64 %idxprom325
  store i32** %l_1081, i32*** %arrayidx326, align 8
  br label %for.inc327

for.inc327:                                       ; preds = %for.body324
  %130 = load i32* %i319, align 4
  %inc328 = add nsw i32 %130, 1
  store i32 %inc328, i32* %i319, align 4
  br label %for.cond321

for.end329:                                       ; preds = %for.cond321
  br label %for.inc330

for.inc330:                                       ; preds = %for.end329
  %131 = load i32* @g_471, align 4
  %dec331 = add nsw i32 %131, -1
  store i32 %dec331, i32* @g_471, align 4
  br label %for.cond251

for.end332:                                       ; preds = %for.cond251
  br label %if.end340

if.else333:                                       ; preds = %for.end82
  %132 = bitcast [5 x [4 x [9 x i32**]]]* %l_1135 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %132, i8* bitcast ([5 x [4 x [9 x i32**]]]* @func_7.l_1135 to i8*), i64 1440, i32 16, i1 false)
  %arrayidx337 = getelementptr inbounds [5 x [4 x [9 x i32**]]]* %l_1135, i32 0, i64 4
  %arrayidx338 = getelementptr inbounds [4 x [9 x i32**]]* %arrayidx337, i32 0, i64 3
  %arrayidx339 = getelementptr inbounds [9 x i32**]* %arrayidx338, i32 0, i64 8
  %133 = load i32*** %arrayidx339, align 8
  store i32** %133, i32*** %retval
  br label %return

if.end340:                                        ; preds = %for.end332
  %134 = load i32** @g_258, align 8
  %135 = load i32* %134, align 4
  %136 = load volatile i32** @g_1136, align 8
  %137 = load i32* %136, align 4
  %or341 = or i32 %137, %135
  store i32 %or341, i32* %136, align 4
  %138 = load i64**** %l_1138, align 8
  %arrayidx342 = getelementptr inbounds [2 x [1 x [3 x i64***]]]* %l_1141, i32 0, i64 1
  %arrayidx343 = getelementptr inbounds [1 x [3 x i64***]]* %arrayidx342, i32 0, i64 0
  %arrayidx344 = getelementptr inbounds [3 x i64***]* %arrayidx343, i32 0, i64 2
  %139 = load i64**** %arrayidx344, align 8
  %arrayidx345 = getelementptr inbounds [2 x [1 x [3 x i64***]]]* %l_1141, i32 0, i64 1
  %arrayidx346 = getelementptr inbounds [1 x [3 x i64***]]* %arrayidx345, i32 0, i64 0
  %arrayidx347 = getelementptr inbounds [3 x i64***]* %arrayidx346, i32 0, i64 2
  store i64*** %139, i64**** %arrayidx347, align 8
  %cmp348 = icmp eq i64*** %138, %139
  %conv349 = zext i1 %cmp348 to i32
  %140 = load i16* getelementptr inbounds ([5 x i16]* @g_364, i32 0, i64 2), align 2
  %141 = load volatile i16* bitcast (%union.U1* @g_1041 to i16*), align 2
  %conv350 = sext i16 %141 to i64
  %cmp351 = icmp ne i64 %conv350, -6
  br i1 %cmp351, label %if.then353, label %if.else1067

if.then353:                                       ; preds = %if.end340
  store i32 1, i32* %l_1145, align 4
  %142 = bitcast %union.U0* %l_1146 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %142, i8* bitcast (%union.U0* @func_7.l_1146 to i8*), i64 8, i32 8, i1 false)
  store i32** @g_278, i32*** %l_1151, align 8
  store i32* null, i32** %l_1177, align 8
  %143 = bitcast %union.U0* %l_1222 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %143, i8* bitcast (%union.U0* @func_7.l_1222 to i8*), i64 8, i32 8, i1 false)
  store i32** @g_56, i32*** %l_1246, align 8
  store i32*** %l_1246, i32**** %l_1245, align 8
  store i32**** %l_1245, i32***** %l_1244, align 8
  store i32 0, i32* %i354, align 4
  br label %for.cond355

for.cond355:                                      ; preds = %for.inc361, %if.then353
  %144 = load i32* %i354, align 4
  %cmp356 = icmp slt i32 %144, 1
  br i1 %cmp356, label %for.body358, label %for.end363

for.body358:                                      ; preds = %for.cond355
  %145 = load i32* %i354, align 4
  %idxprom359 = sext i32 %145 to i64
  %arrayidx360 = getelementptr inbounds [1 x i16]* %l_1221, i32 0, i64 %idxprom359
  store i16 -29242, i16* %arrayidx360, align 2
  br label %for.inc361

for.inc361:                                       ; preds = %for.body358
  %146 = load i32* %i354, align 4
  %inc362 = add nsw i32 %146, 1
  store i32 %inc362, i32* %i354, align 4
  br label %for.cond355

for.end363:                                       ; preds = %for.cond355
  %147 = load i32* %l_1145, align 4
  %coerce.dive364 = getelementptr %union.U0* %l_1146, i32 0, i32 0
  %148 = load i64* %coerce.dive364
  %call365 = call i32 @func_14(i64 %148)
  %tobool366 = icmp ne i32 %call365, 0
  br i1 %tobool366, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %for.end363
  %149 = load i32* %p_10.addr, align 4
  %conv367 = trunc i32 %149 to i16
  %150 = load volatile i32* @g_994, align 4
  %151 = load i8** %l_901, align 8
  %152 = load i8* %151, align 1
  %conv368 = sext i8 %152 to i32
  %or369 = or i32 %conv368, %150
  %conv370 = trunc i32 %or369 to i8
  store i8 %conv370, i8* %151, align 1
  %153 = load i32*** %l_1010, align 8
  %154 = load i32** %153, align 8
  %155 = load i32* %154, align 4
  %conv371 = trunc i32 %155 to i8
  %156 = load i32* %p_10.addr, align 4
  %call372 = call zeroext i8 @safe_rshift_func_uint8_t_u_s(i8 zeroext %conv371, i32 %156)
  %conv373 = zext i8 %call372 to i64
  %cmp374 = icmp ne i64 %conv373, 0
  %conv375 = zext i1 %cmp374 to i32
  %conv376 = trunc i32 %conv375 to i16
  %call377 = call zeroext i16 @safe_mul_func_uint16_t_u_u(i16 zeroext %conv367, i16 zeroext %conv376)
  %conv378 = zext i16 %call377 to i32
  %tobool379 = icmp ne i32 %conv378, 0
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %for.end363
  %157 = phi i1 [ true, %for.end363 ], [ %tobool379, %lor.rhs ]
  %lor.ext = zext i1 %157 to i32
  %158 = load i32*** %l_1010, align 8
  %159 = load i32** %158, align 8
  %160 = load i32* %159, align 4
  %and380 = and i32 %lor.ext, %160
  %161 = load i32*** @g_1006, align 8
  %162 = load i32** %161, align 8
  store i32 %and380, i32* %162, align 4
  %f1381 = bitcast %union.U0* %p_8 to i32*
  store i32 %and380, i32* %f1381, align 4
  store i32 0, i32* bitcast (%union.U1* @g_674 to i32*), align 4
  br label %for.cond382

for.cond382:                                      ; preds = %for.inc526, %lor.end
  %163 = load i32* bitcast (%union.U1* @g_674 to i32*), align 4
  %cmp383 = icmp sge i32 %163, 0
  br i1 %cmp383, label %for.body385, label %for.end528

for.body385:                                      ; preds = %for.cond382
  store i16 -23029, i16* %l_1163, align 2
  %164 = bitcast [10 x [5 x [5 x i32**]]]* %l_1165 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %164, i8* bitcast ([10 x [5 x [5 x i32**]]]* @func_7.l_1165 to i8*), i64 2000, i32 16, i1 false)
  %165 = load %union.U1** %l_964, align 8
  store %union.U1* %165, %union.U1** %l_964, align 8
  store i16 0, i16* bitcast (%union.U1* @g_1037 to i16*), align 2
  br label %for.cond389

for.cond389:                                      ; preds = %for.inc521, %for.body385
  %166 = load i16* bitcast (%union.U1* @g_1037 to i16*), align 2
  %conv390 = sext i16 %166 to i32
  %cmp391 = icmp sle i32 %conv390, 0
  br i1 %cmp391, label %for.body393, label %for.end525

for.body393:                                      ; preds = %for.cond389
  %167 = bitcast %union.U0* %l_1158 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %167, i8* bitcast (%union.U0* @func_7.l_1158 to i8*), i64 8, i32 8, i1 false)
  %168 = bitcast [10 x [1 x [4 x i32]]]* %l_1164 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %168, i8* bitcast ([10 x [1 x [4 x i32]]]* @func_7.l_1164 to i8*), i64 160, i32 16, i1 false)
  store i32 0, i32* %l_900, align 4
  br label %for.cond397

for.cond397:                                      ; preds = %for.inc491, %for.body393
  %169 = load i32* %l_900, align 4
  %cmp398 = icmp sle i32 %169, 0
  br i1 %cmp398, label %for.body400, label %for.end493

for.body400:                                      ; preds = %for.cond397
  store %union.U0*** @g_619, %union.U0**** %l_1160, align 8
  %arrayinit.begin401 = getelementptr inbounds [8 x %union.U0****]* %l_1159, i64 0, i64 0
  store %union.U0**** %l_1160, %union.U0***** %arrayinit.begin401
  %arrayinit.element402 = getelementptr inbounds %union.U0***** %arrayinit.begin401, i64 1
  store %union.U0**** %l_1160, %union.U0***** %arrayinit.element402
  %arrayinit.element403 = getelementptr inbounds %union.U0***** %arrayinit.element402, i64 1
  store %union.U0**** %l_1160, %union.U0***** %arrayinit.element403
  %arrayinit.element404 = getelementptr inbounds %union.U0***** %arrayinit.element403, i64 1
  store %union.U0**** %l_1160, %union.U0***** %arrayinit.element404
  %arrayinit.element405 = getelementptr inbounds %union.U0***** %arrayinit.element404, i64 1
  store %union.U0**** %l_1160, %union.U0***** %arrayinit.element405
  %arrayinit.element406 = getelementptr inbounds %union.U0***** %arrayinit.element405, i64 1
  store %union.U0**** %l_1160, %union.U0***** %arrayinit.element406
  %arrayinit.element407 = getelementptr inbounds %union.U0***** %arrayinit.element406, i64 1
  store %union.U0**** %l_1160, %union.U0***** %arrayinit.element407
  %arrayinit.element408 = getelementptr inbounds %union.U0***** %arrayinit.element407, i64 1
  store %union.U0**** %l_1160, %union.U0***** %arrayinit.element408
  store i32 1, i32* %l_1169, align 4
  %170 = load i32* bitcast (%union.U1* @g_674 to i32*), align 4
  %add410 = add nsw i32 %170, 4
  %idxprom411 = sext i32 %add410 to i64
  %arrayidx412 = getelementptr inbounds [7 x i32]* @g_213, i32 0, i64 %idxprom411
  %171 = load volatile i32* %arrayidx412, align 4
  %tobool413 = icmp ne i32 %171, 0
  br i1 %tobool413, label %if.then414, label %if.else472

if.then414:                                       ; preds = %for.body400
  %172 = load i32* bitcast (%union.U1* @g_674 to i32*), align 4
  %add418 = add nsw i32 %172, 2
  %idxprom419 = sext i32 %add418 to i64
  %173 = load i32* %l_900, align 4
  %add420 = add nsw i32 %173, 6
  %idxprom421 = sext i32 %add420 to i64
  %174 = load i32* bitcast (%union.U1* @g_674 to i32*), align 4
  %idxprom422 = sext i32 %174 to i64
  %arrayidx423 = getelementptr inbounds [1 x [8 x [10 x i32]]]* @g_110, i32 0, i64 %idxprom422
  %arrayidx424 = getelementptr inbounds [8 x [10 x i32]]* %arrayidx423, i32 0, i64 %idxprom421
  %arrayidx425 = getelementptr inbounds [10 x i32]* %arrayidx424, i32 0, i64 %idxprom419
  %175 = load i32* %arrayidx425, align 4
  %conv426 = trunc i32 %175 to i8
  %176 = load volatile i32* @g_994, align 4
  %conv427 = sext i32 %176 to i64
  %call428 = call i64 @safe_unary_minus_func_uint64_t_u(i64 %conv427)
  %conv429 = trunc i64 %call428 to i8
  %call430 = call zeroext i8 @safe_mul_func_uint8_t_u_u(i8 zeroext %conv426, i8 zeroext %conv429)
  %arrayidx431 = getelementptr inbounds [8 x %union.U0****]* %l_1159, i32 0, i64 5
  %177 = load %union.U0***** %arrayidx431, align 8
  %cmp432 = icmp ne %union.U0**** %177, @g_618
  %conv433 = zext i1 %cmp432 to i32
  %178 = load i16* bitcast (%union.U1* @g_674 to i16*), align 2
  %conv434 = trunc i16 %178 to i8
  %179 = load i8** %l_901, align 8
  store i8 %conv434, i8* %179, align 1
  %180 = load i32* bitcast (%union.U1* @g_965 to i32*), align 4
  %181 = load i32* %p_12.addr, align 4
  %conv435 = trunc i32 %181 to i16
  %182 = load i32* bitcast (%union.U1* @g_674 to i32*), align 4
  %add436 = add nsw i32 %182, 2
  %idxprom437 = sext i32 %add436 to i64
  %183 = load i32* %l_900, align 4
  %add438 = add nsw i32 %183, 6
  %idxprom439 = sext i32 %add438 to i64
  %184 = load i32* bitcast (%union.U1* @g_674 to i32*), align 4
  %idxprom440 = sext i32 %184 to i64
  %arrayidx441 = getelementptr inbounds [1 x [8 x [10 x i32]]]* @g_110, i32 0, i64 %idxprom440
  %arrayidx442 = getelementptr inbounds [8 x [10 x i32]]* %arrayidx441, i32 0, i64 %idxprom439
  %arrayidx443 = getelementptr inbounds [10 x i32]* %arrayidx442, i32 0, i64 %idxprom437
  %185 = load i32* %arrayidx443, align 4
  %conv444 = trunc i32 %185 to i16
  %call445 = call signext i16 @safe_add_func_int16_t_s_s(i16 signext %conv435, i16 signext %conv444)
  %conv446 = sext i16 %call445 to i32
  %tobool447 = icmp ne i32 %conv446, 0
  br i1 %tobool447, label %lor.end449, label %lor.rhs448

lor.rhs448:                                       ; preds = %if.then414
  br label %lor.end449

lor.end449:                                       ; preds = %lor.rhs448, %if.then414
  %186 = phi i1 [ true, %if.then414 ], [ true, %lor.rhs448 ]
  %lor.ext450 = zext i1 %186 to i32
  %cmp451 = icmp sge i32 %180, %lor.ext450
  br i1 %cmp451, label %lor.end456, label %lor.rhs453

lor.rhs453:                                       ; preds = %lor.end449
  %187 = load i16* %l_1163, align 2
  %conv454 = sext i16 %187 to i32
  %tobool455 = icmp ne i32 %conv454, 0
  br label %lor.end456

lor.end456:                                       ; preds = %lor.rhs453, %lor.end449
  %188 = phi i1 [ true, %lor.end449 ], [ %tobool455, %lor.rhs453 ]
  %lor.ext457 = zext i1 %188 to i32
  %189 = load i32* %p_12.addr, align 4
  %f1458 = bitcast %union.U0* %p_8 to i32*
  %190 = load i32* %f1458, align 4
  %conv459 = sext i32 %190 to i64
  %cmp460 = icmp sgt i64 129, %conv459
  %conv461 = zext i1 %cmp460 to i32
  %conv462 = trunc i32 %conv461 to i8
  %call463 = call signext i8 @safe_mul_func_int8_t_s_s(i8 signext %call430, i8 signext %conv462)
  %conv464 = sext i8 %call463 to i32
  %191 = load i32** @g_258, align 8
  store i32 %conv464, i32* %191, align 4
  %arrayidx465 = getelementptr inbounds [10 x [1 x [4 x i32]]]* %l_1164, i32 0, i64 6
  %arrayidx466 = getelementptr inbounds [1 x [4 x i32]]* %arrayidx465, i32 0, i64 0
  %arrayidx467 = getelementptr inbounds [4 x i32]* %arrayidx466, i32 0, i64 2
  %192 = load i32* %arrayidx467, align 4
  %and468 = and i32 %192, %conv464
  store i32 %and468, i32* %arrayidx467, align 4
  %arrayidx469 = getelementptr inbounds [10 x [5 x [5 x i32**]]]* %l_1165, i32 0, i64 4
  %arrayidx470 = getelementptr inbounds [5 x [5 x i32**]]* %arrayidx469, i32 0, i64 4
  %arrayidx471 = getelementptr inbounds [5 x i32**]* %arrayidx470, i32 0, i64 3
  %193 = load i32*** %arrayidx471, align 8
  store i32** %193, i32*** %retval
  br label %return

if.else472:                                       ; preds = %for.body400
  store i32** @g_258, i32*** %l_1168, align 8
  %194 = load i32** %p_11.addr, align 8
  %195 = load i32*** %l_1168, align 8
  store i32* %194, i32** %195, align 8
  %arrayidx473 = getelementptr inbounds [10 x [5 x [5 x i32**]]]* %l_1165, i32 0, i64 4
  %arrayidx474 = getelementptr inbounds [5 x [5 x i32**]]* %arrayidx473, i32 0, i64 4
  %arrayidx475 = getelementptr inbounds [5 x i32**]* %arrayidx474, i32 0, i64 3
  %196 = load i32*** %arrayidx475, align 8
  %197 = load i32* %p_10.addr, align 4
  %conv476 = trunc i32 %197 to i8
  %198 = load i32** %p_11.addr, align 8
  %199 = load i32*** %l_1151, align 8
  store i32* %198, i32** %199, align 8
  %call477 = call zeroext i16 @func_36(i32* %194, i32** %196, i8 zeroext %conv476, i32* %198)
  %conv478 = trunc i16 %call477 to i8
  %call479 = call zeroext i8 @safe_lshift_func_uint8_t_u_s(i8 zeroext %conv478, i32 2)
  %conv480 = zext i8 %call479 to i32
  %200 = load i32** %p_11.addr, align 8
  store i32 %conv480, i32* %200, align 4
  %f1481 = bitcast %union.U0* %p_8 to i32*
  store i32 %conv480, i32* %f1481, align 4
  %201 = load i32* %l_1169, align 4
  %or482 = or i32 %201, %conv480
  store i32 %or482, i32* %l_1169, align 4
  br label %if.end483

if.end483:                                        ; preds = %if.else472
  store i32 0, i32* %l_992, align 4
  br label %for.cond484

for.cond484:                                      ; preds = %for.inc488, %if.end483
  %202 = load i32* %l_992, align 4
  %cmp485 = icmp sle i32 %202, 0
  br i1 %cmp485, label %for.body487, label %for.end490

for.body487:                                      ; preds = %for.cond484
  store i32** @g_258, i32*** %l_1170, align 8
  %203 = load i32*** @g_1006, align 8
  %204 = load i32** %203, align 8
  %205 = load i32*** %l_1170, align 8
  store i32* %204, i32** %205, align 8
  br label %for.inc488

for.inc488:                                       ; preds = %for.body487
  %206 = load i32* %l_992, align 4
  %add489 = add nsw i32 %206, 1
  store i32 %add489, i32* %l_992, align 4
  br label %for.cond484

for.end490:                                       ; preds = %for.cond484
  %207 = load i32*** %l_1151, align 8
  store i32* null, i32** %207, align 8
  br label %for.inc491

for.inc491:                                       ; preds = %for.end490
  %208 = load i32* %l_900, align 4
  %add492 = add nsw i32 %208, 1
  store i32 %add492, i32* %l_900, align 4
  br label %for.cond397

for.end493:                                       ; preds = %for.cond397
  %209 = load i32* %p_12.addr, align 4
  %tobool494 = icmp ne i32 %209, 0
  br i1 %tobool494, label %if.then495, label %if.end496

if.then495:                                       ; preds = %for.end493
  br label %for.inc521

if.end496:                                        ; preds = %for.end493
  store i32 1, i32* %l_988, align 4
  br label %for.cond497

for.cond497:                                      ; preds = %for.inc518, %if.end496
  %210 = load i32* %l_988, align 4
  %cmp498 = icmp sge i32 %210, 0
  br i1 %cmp498, label %for.body500, label %for.end520

for.body500:                                      ; preds = %for.cond497
  store i64 1, i64* %l_1171, align 8
  store i32* %l_900, i32** %l_1173, align 8
  %211 = load i64* %l_1171, align 8
  %tobool501 = icmp ne i64 %211, 0
  br i1 %tobool501, label %if.then502, label %if.end503

if.then502:                                       ; preds = %for.body500
  br label %for.end520

if.end503:                                        ; preds = %for.body500
  store i64 0, i64* getelementptr inbounds (%union.U0* @g_886, i32 0, i32 0), align 8
  br label %for.cond504

for.cond504:                                      ; preds = %for.inc515, %if.end503
  %212 = load i64* getelementptr inbounds (%union.U0* @g_886, i32 0, i32 0), align 8
  %cmp505 = icmp sge i64 %212, 0
  br i1 %cmp505, label %for.body507, label %for.end517

for.body507:                                      ; preds = %for.cond504
  store i32 -1, i32* %l_1172, align 4
  %213 = load i32* %l_1172, align 4
  %tobool508 = icmp ne i32 %213, 0
  br i1 %tobool508, label %if.then509, label %if.end510

if.then509:                                       ; preds = %for.body507
  br label %for.end517

if.end510:                                        ; preds = %for.body507
  %214 = load i32*** %l_1010, align 8
  %215 = load i32** %214, align 8
  store i32 -7, i32* %215, align 4
  %216 = load i32** %l_1173, align 8
  %217 = load i32*** %l_1151, align 8
  %218 = load i32** %217, align 8
  %call511 = call i64 @func_18(i32** %p_11.addr, i32* %216, i32* %218)
  %219 = load i32** %p_11.addr, align 8
  %220 = load i32* %219, align 4
  %conv512 = sext i32 %220 to i64
  %and513 = and i64 %conv512, %call511
  %conv514 = trunc i64 %and513 to i32
  store i32 %conv514, i32* %219, align 4
  br label %for.inc515

for.inc515:                                       ; preds = %if.end510
  %221 = load i64* getelementptr inbounds (%union.U0* @g_886, i32 0, i32 0), align 8
  %sub516 = sub nsw i64 %221, 1
  store i64 %sub516, i64* getelementptr inbounds (%union.U0* @g_886, i32 0, i32 0), align 8
  br label %for.cond504

for.end517:                                       ; preds = %if.then509, %for.cond504
  br label %for.inc518

for.inc518:                                       ; preds = %for.end517
  %222 = load i32* %l_988, align 4
  %sub519 = sub nsw i32 %222, 1
  store i32 %sub519, i32* %l_988, align 4
  br label %for.cond497

for.end520:                                       ; preds = %if.then502, %for.cond497
  br label %for.inc521

for.inc521:                                       ; preds = %for.end520, %if.then495
  %223 = load i16* bitcast (%union.U1* @g_1037 to i16*), align 2
  %conv522 = sext i16 %223 to i32
  %add523 = add nsw i32 %conv522, 1
  %conv524 = trunc i32 %add523 to i16
  store i16 %conv524, i16* bitcast (%union.U1* @g_1037 to i16*), align 2
  br label %for.cond389

for.end525:                                       ; preds = %for.cond389
  br label %for.inc526

for.inc526:                                       ; preds = %for.end525
  %224 = load i32* bitcast (%union.U1* @g_674 to i32*), align 4
  %sub527 = sub nsw i32 %224, 1
  store i32 %sub527, i32* bitcast (%union.U1* @g_674 to i32*), align 4
  br label %for.cond382

for.end528:                                       ; preds = %for.cond382
  store i32 2, i32* bitcast (%union.U1* @g_307 to i32*), align 4
  br label %for.cond529

for.cond529:                                      ; preds = %for.inc1064, %for.end528
  %225 = load i32* bitcast (%union.U1* @g_307 to i32*), align 4
  %cmp530 = icmp ne i32 %225, 22
  br i1 %cmp530, label %for.body532, label %for.end1066

for.body532:                                      ; preds = %for.cond529
  %226 = bitcast [10 x [2 x i16]]* %l_1176 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %226, i8* bitcast ([10 x [2 x i16]]* @func_7.l_1176 to i8*), i64 40, i32 16, i1 false)
  %arrayinit.begin533 = getelementptr inbounds [5 x [5 x [8 x i32*]]]* %l_1186, i64 0, i64 0
  %arrayinit.begin534 = getelementptr inbounds [5 x [8 x i32*]]* %arrayinit.begin533, i64 0, i64 0
  %arrayinit.begin535 = getelementptr inbounds [8 x i32*]* %arrayinit.begin534, i64 0, i64 0
  store i32* @g_353, i32** %arrayinit.begin535
  %arrayinit.element536 = getelementptr inbounds i32** %arrayinit.begin535, i64 1
  %arrayidx537 = getelementptr inbounds [6 x [1 x [2 x i32]]]* %l_1111, i32 0, i64 4
  %arrayidx538 = getelementptr inbounds [1 x [2 x i32]]* %arrayidx537, i32 0, i64 0
  %arrayidx539 = getelementptr inbounds [2 x i32]* %arrayidx538, i32 0, i64 1
  store i32* %arrayidx539, i32** %arrayinit.element536
  %arrayinit.element540 = getelementptr inbounds i32** %arrayinit.element536, i64 1
  store i32* @g_353, i32** %arrayinit.element540
  %arrayinit.element541 = getelementptr inbounds i32** %arrayinit.element540, i64 1
  %arrayidx542 = getelementptr inbounds [6 x [1 x [2 x i32]]]* %l_1111, i32 0, i64 5
  %arrayidx543 = getelementptr inbounds [1 x [2 x i32]]* %arrayidx542, i32 0, i64 0
  %arrayidx544 = getelementptr inbounds [2 x i32]* %arrayidx543, i32 0, i64 0
  store i32* %arrayidx544, i32** %arrayinit.element541
  %arrayinit.element545 = getelementptr inbounds i32** %arrayinit.element541, i64 1
  store i32* @g_353, i32** %arrayinit.element545
  %arrayinit.element546 = getelementptr inbounds i32** %arrayinit.element545, i64 1
  store i32* @g_353, i32** %arrayinit.element546
  %arrayinit.element547 = getelementptr inbounds i32** %arrayinit.element546, i64 1
  store i32* %l_1145, i32** %arrayinit.element547
  %arrayinit.element548 = getelementptr inbounds i32** %arrayinit.element547, i64 1
  store i32* @g_353, i32** %arrayinit.element548
  %arrayinit.element549 = getelementptr inbounds [8 x i32*]* %arrayinit.begin534, i64 1
  %arrayinit.begin550 = getelementptr inbounds [8 x i32*]* %arrayinit.element549, i64 0, i64 0
  store i32* @g_353, i32** %arrayinit.begin550
  %arrayinit.element551 = getelementptr inbounds i32** %arrayinit.begin550, i64 1
  %arrayidx552 = getelementptr inbounds [6 x [1 x [2 x i32]]]* %l_1111, i32 0, i64 4
  %arrayidx553 = getelementptr inbounds [1 x [2 x i32]]* %arrayidx552, i32 0, i64 0
  %arrayidx554 = getelementptr inbounds [2 x i32]* %arrayidx553, i32 0, i64 1
  store i32* %arrayidx554, i32** %arrayinit.element551
  %arrayinit.element555 = getelementptr inbounds i32** %arrayinit.element551, i64 1
  store i32* @g_353, i32** %arrayinit.element555
  %arrayinit.element556 = getelementptr inbounds i32** %arrayinit.element555, i64 1
  %arrayidx557 = getelementptr inbounds [6 x [1 x [2 x i32]]]* %l_1111, i32 0, i64 5
  %arrayidx558 = getelementptr inbounds [1 x [2 x i32]]* %arrayidx557, i32 0, i64 0
  %arrayidx559 = getelementptr inbounds [2 x i32]* %arrayidx558, i32 0, i64 0
  store i32* %arrayidx559, i32** %arrayinit.element556
  %arrayinit.element560 = getelementptr inbounds i32** %arrayinit.element556, i64 1
  store i32* @g_353, i32** %arrayinit.element560
  %arrayinit.element561 = getelementptr inbounds i32** %arrayinit.element560, i64 1
  store i32* @g_353, i32** %arrayinit.element561
  %arrayinit.element562 = getelementptr inbounds i32** %arrayinit.element561, i64 1
  store i32* %l_1145, i32** %arrayinit.element562
  %arrayinit.element563 = getelementptr inbounds i32** %arrayinit.element562, i64 1
  store i32* @g_353, i32** %arrayinit.element563
  %arrayinit.element564 = getelementptr inbounds [8 x i32*]* %arrayinit.element549, i64 1
  %arrayinit.begin565 = getelementptr inbounds [8 x i32*]* %arrayinit.element564, i64 0, i64 0
  store i32* @g_353, i32** %arrayinit.begin565
  %arrayinit.element566 = getelementptr inbounds i32** %arrayinit.begin565, i64 1
  %arrayidx567 = getelementptr inbounds [6 x [1 x [2 x i32]]]* %l_1111, i32 0, i64 4
  %arrayidx568 = getelementptr inbounds [1 x [2 x i32]]* %arrayidx567, i32 0, i64 0
  %arrayidx569 = getelementptr inbounds [2 x i32]* %arrayidx568, i32 0, i64 1
  store i32* %arrayidx569, i32** %arrayinit.element566
  %arrayinit.element570 = getelementptr inbounds i32** %arrayinit.element566, i64 1
  store i32* @g_353, i32** %arrayinit.element570
  %arrayinit.element571 = getelementptr inbounds i32** %arrayinit.element570, i64 1
  %arrayidx572 = getelementptr inbounds [6 x [1 x [2 x i32]]]* %l_1111, i32 0, i64 5
  %arrayidx573 = getelementptr inbounds [1 x [2 x i32]]* %arrayidx572, i32 0, i64 0
  %arrayidx574 = getelementptr inbounds [2 x i32]* %arrayidx573, i32 0, i64 0
  store i32* %arrayidx574, i32** %arrayinit.element571
  %arrayinit.element575 = getelementptr inbounds i32** %arrayinit.element571, i64 1
  store i32* @g_353, i32** %arrayinit.element575
  %arrayinit.element576 = getelementptr inbounds i32** %arrayinit.element575, i64 1
  store i32* @g_353, i32** %arrayinit.element576
  %arrayinit.element577 = getelementptr inbounds i32** %arrayinit.element576, i64 1
  store i32* %l_1145, i32** %arrayinit.element577
  %arrayinit.element578 = getelementptr inbounds i32** %arrayinit.element577, i64 1
  store i32* @g_353, i32** %arrayinit.element578
  %arrayinit.element579 = getelementptr inbounds [8 x i32*]* %arrayinit.element564, i64 1
  %arrayinit.begin580 = getelementptr inbounds [8 x i32*]* %arrayinit.element579, i64 0, i64 0
  store i32* @g_353, i32** %arrayinit.begin580
  %arrayinit.element581 = getelementptr inbounds i32** %arrayinit.begin580, i64 1
  %arrayidx582 = getelementptr inbounds [6 x [1 x [2 x i32]]]* %l_1111, i32 0, i64 4
  %arrayidx583 = getelementptr inbounds [1 x [2 x i32]]* %arrayidx582, i32 0, i64 0
  %arrayidx584 = getelementptr inbounds [2 x i32]* %arrayidx583, i32 0, i64 1
  store i32* %arrayidx584, i32** %arrayinit.element581
  %arrayinit.element585 = getelementptr inbounds i32** %arrayinit.element581, i64 1
  store i32* @g_353, i32** %arrayinit.element585
  %arrayinit.element586 = getelementptr inbounds i32** %arrayinit.element585, i64 1
  %arrayidx587 = getelementptr inbounds [6 x [1 x [2 x i32]]]* %l_1111, i32 0, i64 5
  %arrayidx588 = getelementptr inbounds [1 x [2 x i32]]* %arrayidx587, i32 0, i64 0
  %arrayidx589 = getelementptr inbounds [2 x i32]* %arrayidx588, i32 0, i64 0
  store i32* %arrayidx589, i32** %arrayinit.element586
  %arrayinit.element590 = getelementptr inbounds i32** %arrayinit.element586, i64 1
  store i32* @g_353, i32** %arrayinit.element590
  %arrayinit.element591 = getelementptr inbounds i32** %arrayinit.element590, i64 1
  store i32* @g_353, i32** %arrayinit.element591
  %arrayinit.element592 = getelementptr inbounds i32** %arrayinit.element591, i64 1
  store i32* %l_1145, i32** %arrayinit.element592
  %arrayinit.element593 = getelementptr inbounds i32** %arrayinit.element592, i64 1
  store i32* @g_353, i32** %arrayinit.element593
  %arrayinit.element594 = getelementptr inbounds [8 x i32*]* %arrayinit.element579, i64 1
  %arrayinit.begin595 = getelementptr inbounds [8 x i32*]* %arrayinit.element594, i64 0, i64 0
  store i32* @g_353, i32** %arrayinit.begin595
  %arrayinit.element596 = getelementptr inbounds i32** %arrayinit.begin595, i64 1
  %arrayidx597 = getelementptr inbounds [6 x [1 x [2 x i32]]]* %l_1111, i32 0, i64 4
  %arrayidx598 = getelementptr inbounds [1 x [2 x i32]]* %arrayidx597, i32 0, i64 0
  %arrayidx599 = getelementptr inbounds [2 x i32]* %arrayidx598, i32 0, i64 1
  store i32* %arrayidx599, i32** %arrayinit.element596
  %arrayinit.element600 = getelementptr inbounds i32** %arrayinit.element596, i64 1
  store i32* @g_353, i32** %arrayinit.element600
  %arrayinit.element601 = getelementptr inbounds i32** %arrayinit.element600, i64 1
  %arrayidx602 = getelementptr inbounds [6 x [1 x [2 x i32]]]* %l_1111, i32 0, i64 5
  %arrayidx603 = getelementptr inbounds [1 x [2 x i32]]* %arrayidx602, i32 0, i64 0
  %arrayidx604 = getelementptr inbounds [2 x i32]* %arrayidx603, i32 0, i64 0
  store i32* %arrayidx604, i32** %arrayinit.element601
  %arrayinit.element605 = getelementptr inbounds i32** %arrayinit.element601, i64 1
  store i32* @g_353, i32** %arrayinit.element605
  %arrayinit.element606 = getelementptr inbounds i32** %arrayinit.element605, i64 1
  store i32* @g_353, i32** %arrayinit.element606
  %arrayinit.element607 = getelementptr inbounds i32** %arrayinit.element606, i64 1
  store i32* %l_1145, i32** %arrayinit.element607
  %arrayinit.element608 = getelementptr inbounds i32** %arrayinit.element607, i64 1
  store i32* @g_353, i32** %arrayinit.element608
  %arrayinit.element609 = getelementptr inbounds [5 x [8 x i32*]]* %arrayinit.begin533, i64 1
  %arrayinit.begin610 = getelementptr inbounds [5 x [8 x i32*]]* %arrayinit.element609, i64 0, i64 0
  %arrayinit.begin611 = getelementptr inbounds [8 x i32*]* %arrayinit.begin610, i64 0, i64 0
  store i32* @g_353, i32** %arrayinit.begin611
  %arrayinit.element612 = getelementptr inbounds i32** %arrayinit.begin611, i64 1
  %arrayidx613 = getelementptr inbounds [6 x [1 x [2 x i32]]]* %l_1111, i32 0, i64 4
  %arrayidx614 = getelementptr inbounds [1 x [2 x i32]]* %arrayidx613, i32 0, i64 0
  %arrayidx615 = getelementptr inbounds [2 x i32]* %arrayidx614, i32 0, i64 1
  store i32* %arrayidx615, i32** %arrayinit.element612
  %arrayinit.element616 = getelementptr inbounds i32** %arrayinit.element612, i64 1
  store i32* @g_353, i32** %arrayinit.element616
  %arrayinit.element617 = getelementptr inbounds i32** %arrayinit.element616, i64 1
  %arrayidx618 = getelementptr inbounds [6 x [1 x [2 x i32]]]* %l_1111, i32 0, i64 5
  %arrayidx619 = getelementptr inbounds [1 x [2 x i32]]* %arrayidx618, i32 0, i64 0
  %arrayidx620 = getelementptr inbounds [2 x i32]* %arrayidx619, i32 0, i64 0
  store i32* %arrayidx620, i32** %arrayinit.element617
  %arrayinit.element621 = getelementptr inbounds i32** %arrayinit.element617, i64 1
  store i32* @g_353, i32** %arrayinit.element621
  %arrayinit.element622 = getelementptr inbounds i32** %arrayinit.element621, i64 1
  store i32* @g_353, i32** %arrayinit.element622
  %arrayinit.element623 = getelementptr inbounds i32** %arrayinit.element622, i64 1
  store i32* %l_1145, i32** %arrayinit.element623
  %arrayinit.element624 = getelementptr inbounds i32** %arrayinit.element623, i64 1
  store i32* @g_353, i32** %arrayinit.element624
  %arrayinit.element625 = getelementptr inbounds [8 x i32*]* %arrayinit.begin610, i64 1
  %arrayinit.begin626 = getelementptr inbounds [8 x i32*]* %arrayinit.element625, i64 0, i64 0
  store i32* @g_353, i32** %arrayinit.begin626
  %arrayinit.element627 = getelementptr inbounds i32** %arrayinit.begin626, i64 1
  %arrayidx628 = getelementptr inbounds [6 x [1 x [2 x i32]]]* %l_1111, i32 0, i64 4
  %arrayidx629 = getelementptr inbounds [1 x [2 x i32]]* %arrayidx628, i32 0, i64 0
  %arrayidx630 = getelementptr inbounds [2 x i32]* %arrayidx629, i32 0, i64 1
  store i32* %arrayidx630, i32** %arrayinit.element627
  %arrayinit.element631 = getelementptr inbounds i32** %arrayinit.element627, i64 1
  store i32* @g_353, i32** %arrayinit.element631
  %arrayinit.element632 = getelementptr inbounds i32** %arrayinit.element631, i64 1
  %arrayidx633 = getelementptr inbounds [6 x [1 x [2 x i32]]]* %l_1111, i32 0, i64 5
  %arrayidx634 = getelementptr inbounds [1 x [2 x i32]]* %arrayidx633, i32 0, i64 0
  %arrayidx635 = getelementptr inbounds [2 x i32]* %arrayidx634, i32 0, i64 0
  store i32* %arrayidx635, i32** %arrayinit.element632
  %arrayinit.element636 = getelementptr inbounds i32** %arrayinit.element632, i64 1
  store i32* @g_353, i32** %arrayinit.element636
  %arrayinit.element637 = getelementptr inbounds i32** %arrayinit.element636, i64 1
  store i32* @g_353, i32** %arrayinit.element637
  %arrayinit.element638 = getelementptr inbounds i32** %arrayinit.element637, i64 1
  store i32* %l_1145, i32** %arrayinit.element638
  %arrayinit.element639 = getelementptr inbounds i32** %arrayinit.element638, i64 1
  store i32* @g_353, i32** %arrayinit.element639
  %arrayinit.element640 = getelementptr inbounds [8 x i32*]* %arrayinit.element625, i64 1
  %arrayinit.begin641 = getelementptr inbounds [8 x i32*]* %arrayinit.element640, i64 0, i64 0
  store i32* @g_353, i32** %arrayinit.begin641
  %arrayinit.element642 = getelementptr inbounds i32** %arrayinit.begin641, i64 1
  %arrayidx643 = getelementptr inbounds [6 x [1 x [2 x i32]]]* %l_1111, i32 0, i64 4
  %arrayidx644 = getelementptr inbounds [1 x [2 x i32]]* %arrayidx643, i32 0, i64 0
  %arrayidx645 = getelementptr inbounds [2 x i32]* %arrayidx644, i32 0, i64 1
  store i32* %arrayidx645, i32** %arrayinit.element642
  %arrayinit.element646 = getelementptr inbounds i32** %arrayinit.element642, i64 1
  store i32* @g_353, i32** %arrayinit.element646
  %arrayinit.element647 = getelementptr inbounds i32** %arrayinit.element646, i64 1
  %arrayidx648 = getelementptr inbounds [6 x [1 x [2 x i32]]]* %l_1111, i32 0, i64 5
  %arrayidx649 = getelementptr inbounds [1 x [2 x i32]]* %arrayidx648, i32 0, i64 0
  %arrayidx650 = getelementptr inbounds [2 x i32]* %arrayidx649, i32 0, i64 0
  store i32* %arrayidx650, i32** %arrayinit.element647
  %arrayinit.element651 = getelementptr inbounds i32** %arrayinit.element647, i64 1
  store i32* @g_353, i32** %arrayinit.element651
  %arrayinit.element652 = getelementptr inbounds i32** %arrayinit.element651, i64 1
  store i32* @g_353, i32** %arrayinit.element652
  %arrayinit.element653 = getelementptr inbounds i32** %arrayinit.element652, i64 1
  store i32* %l_1145, i32** %arrayinit.element653
  %arrayinit.element654 = getelementptr inbounds i32** %arrayinit.element653, i64 1
  store i32* @g_353, i32** %arrayinit.element654
  %arrayinit.element655 = getelementptr inbounds [8 x i32*]* %arrayinit.element640, i64 1
  %arrayinit.begin656 = getelementptr inbounds [8 x i32*]* %arrayinit.element655, i64 0, i64 0
  store i32* @g_353, i32** %arrayinit.begin656
  %arrayinit.element657 = getelementptr inbounds i32** %arrayinit.begin656, i64 1
  %arrayidx658 = getelementptr inbounds [6 x [1 x [2 x i32]]]* %l_1111, i32 0, i64 4
  %arrayidx659 = getelementptr inbounds [1 x [2 x i32]]* %arrayidx658, i32 0, i64 0
  %arrayidx660 = getelementptr inbounds [2 x i32]* %arrayidx659, i32 0, i64 1
  store i32* %arrayidx660, i32** %arrayinit.element657
  %arrayinit.element661 = getelementptr inbounds i32** %arrayinit.element657, i64 1
  store i32* @g_353, i32** %arrayinit.element661
  %arrayinit.element662 = getelementptr inbounds i32** %arrayinit.element661, i64 1
  %arrayidx663 = getelementptr inbounds [6 x [1 x [2 x i32]]]* %l_1111, i32 0, i64 5
  %arrayidx664 = getelementptr inbounds [1 x [2 x i32]]* %arrayidx663, i32 0, i64 0
  %arrayidx665 = getelementptr inbounds [2 x i32]* %arrayidx664, i32 0, i64 0
  store i32* %arrayidx665, i32** %arrayinit.element662
  %arrayinit.element666 = getelementptr inbounds i32** %arrayinit.element662, i64 1
  store i32* @g_353, i32** %arrayinit.element666
  %arrayinit.element667 = getelementptr inbounds i32** %arrayinit.element666, i64 1
  store i32* @g_353, i32** %arrayinit.element667
  %arrayinit.element668 = getelementptr inbounds i32** %arrayinit.element667, i64 1
  store i32* %l_1145, i32** %arrayinit.element668
  %arrayinit.element669 = getelementptr inbounds i32** %arrayinit.element668, i64 1
  store i32* @g_353, i32** %arrayinit.element669
  %arrayinit.element670 = getelementptr inbounds [8 x i32*]* %arrayinit.element655, i64 1
  %arrayinit.begin671 = getelementptr inbounds [8 x i32*]* %arrayinit.element670, i64 0, i64 0
  store i32* @g_353, i32** %arrayinit.begin671
  %arrayinit.element672 = getelementptr inbounds i32** %arrayinit.begin671, i64 1
  %arrayidx673 = getelementptr inbounds [6 x [1 x [2 x i32]]]* %l_1111, i32 0, i64 4
  %arrayidx674 = getelementptr inbounds [1 x [2 x i32]]* %arrayidx673, i32 0, i64 0
  %arrayidx675 = getelementptr inbounds [2 x i32]* %arrayidx674, i32 0, i64 1
  store i32* %arrayidx675, i32** %arrayinit.element672
  %arrayinit.element676 = getelementptr inbounds i32** %arrayinit.element672, i64 1
  store i32* @g_353, i32** %arrayinit.element676
  %arrayinit.element677 = getelementptr inbounds i32** %arrayinit.element676, i64 1
  %arrayidx678 = getelementptr inbounds [6 x [1 x [2 x i32]]]* %l_1111, i32 0, i64 5
  %arrayidx679 = getelementptr inbounds [1 x [2 x i32]]* %arrayidx678, i32 0, i64 0
  %arrayidx680 = getelementptr inbounds [2 x i32]* %arrayidx679, i32 0, i64 0
  store i32* %arrayidx680, i32** %arrayinit.element677
  %arrayinit.element681 = getelementptr inbounds i32** %arrayinit.element677, i64 1
  store i32* @g_353, i32** %arrayinit.element681
  %arrayinit.element682 = getelementptr inbounds i32** %arrayinit.element681, i64 1
  store i32* @g_353, i32** %arrayinit.element682
  %arrayinit.element683 = getelementptr inbounds i32** %arrayinit.element682, i64 1
  store i32* %l_1145, i32** %arrayinit.element683
  %arrayinit.element684 = getelementptr inbounds i32** %arrayinit.element683, i64 1
  store i32* @g_353, i32** %arrayinit.element684
  %arrayinit.element685 = getelementptr inbounds [5 x [8 x i32*]]* %arrayinit.element609, i64 1
  %arrayinit.begin686 = getelementptr inbounds [5 x [8 x i32*]]* %arrayinit.element685, i64 0, i64 0
  %arrayinit.begin687 = getelementptr inbounds [8 x i32*]* %arrayinit.begin686, i64 0, i64 0
  store i32* @g_353, i32** %arrayinit.begin687
  %arrayinit.element688 = getelementptr inbounds i32** %arrayinit.begin687, i64 1
  %arrayidx689 = getelementptr inbounds [6 x [1 x [2 x i32]]]* %l_1111, i32 0, i64 4
  %arrayidx690 = getelementptr inbounds [1 x [2 x i32]]* %arrayidx689, i32 0, i64 0
  %arrayidx691 = getelementptr inbounds [2 x i32]* %arrayidx690, i32 0, i64 1
  store i32* %arrayidx691, i32** %arrayinit.element688
  %arrayinit.element692 = getelementptr inbounds i32** %arrayinit.element688, i64 1
  store i32* @g_353, i32** %arrayinit.element692
  %arrayinit.element693 = getelementptr inbounds i32** %arrayinit.element692, i64 1
  %arrayidx694 = getelementptr inbounds [6 x [1 x [2 x i32]]]* %l_1111, i32 0, i64 5
  %arrayidx695 = getelementptr inbounds [1 x [2 x i32]]* %arrayidx694, i32 0, i64 0
  %arrayidx696 = getelementptr inbounds [2 x i32]* %arrayidx695, i32 0, i64 0
  store i32* %arrayidx696, i32** %arrayinit.element693
  %arrayinit.element697 = getelementptr inbounds i32** %arrayinit.element693, i64 1
  store i32* @g_353, i32** %arrayinit.element697
  %arrayinit.element698 = getelementptr inbounds i32** %arrayinit.element697, i64 1
  store i32* @g_353, i32** %arrayinit.element698
  %arrayinit.element699 = getelementptr inbounds i32** %arrayinit.element698, i64 1
  store i32* %l_1145, i32** %arrayinit.element699
  %arrayinit.element700 = getelementptr inbounds i32** %arrayinit.element699, i64 1
  store i32* @g_353, i32** %arrayinit.element700
  %arrayinit.element701 = getelementptr inbounds [8 x i32*]* %arrayinit.begin686, i64 1
  %arrayinit.begin702 = getelementptr inbounds [8 x i32*]* %arrayinit.element701, i64 0, i64 0
  store i32* @g_353, i32** %arrayinit.begin702
  %arrayinit.element703 = getelementptr inbounds i32** %arrayinit.begin702, i64 1
  %arrayidx704 = getelementptr inbounds [6 x [1 x [2 x i32]]]* %l_1111, i32 0, i64 4
  %arrayidx705 = getelementptr inbounds [1 x [2 x i32]]* %arrayidx704, i32 0, i64 0
  %arrayidx706 = getelementptr inbounds [2 x i32]* %arrayidx705, i32 0, i64 1
  store i32* %arrayidx706, i32** %arrayinit.element703
  %arrayinit.element707 = getelementptr inbounds i32** %arrayinit.element703, i64 1
  store i32* @g_353, i32** %arrayinit.element707
  %arrayinit.element708 = getelementptr inbounds i32** %arrayinit.element707, i64 1
  %arrayidx709 = getelementptr inbounds [6 x [1 x [2 x i32]]]* %l_1111, i32 0, i64 5
  %arrayidx710 = getelementptr inbounds [1 x [2 x i32]]* %arrayidx709, i32 0, i64 0
  %arrayidx711 = getelementptr inbounds [2 x i32]* %arrayidx710, i32 0, i64 0
  store i32* %arrayidx711, i32** %arrayinit.element708
  %arrayinit.element712 = getelementptr inbounds i32** %arrayinit.element708, i64 1
  store i32* @g_353, i32** %arrayinit.element712
  %arrayinit.element713 = getelementptr inbounds i32** %arrayinit.element712, i64 1
  store i32* @g_353, i32** %arrayinit.element713
  %arrayinit.element714 = getelementptr inbounds i32** %arrayinit.element713, i64 1
  store i32* %l_1145, i32** %arrayinit.element714
  %arrayinit.element715 = getelementptr inbounds i32** %arrayinit.element714, i64 1
  store i32* @g_353, i32** %arrayinit.element715
  %arrayinit.element716 = getelementptr inbounds [8 x i32*]* %arrayinit.element701, i64 1
  %arrayinit.begin717 = getelementptr inbounds [8 x i32*]* %arrayinit.element716, i64 0, i64 0
  store i32* @g_353, i32** %arrayinit.begin717
  %arrayinit.element718 = getelementptr inbounds i32** %arrayinit.begin717, i64 1
  %arrayidx719 = getelementptr inbounds [6 x [1 x [2 x i32]]]* %l_1111, i32 0, i64 4
  %arrayidx720 = getelementptr inbounds [1 x [2 x i32]]* %arrayidx719, i32 0, i64 0
  %arrayidx721 = getelementptr inbounds [2 x i32]* %arrayidx720, i32 0, i64 1
  store i32* %arrayidx721, i32** %arrayinit.element718
  %arrayinit.element722 = getelementptr inbounds i32** %arrayinit.element718, i64 1
  store i32* @g_353, i32** %arrayinit.element722
  %arrayinit.element723 = getelementptr inbounds i32** %arrayinit.element722, i64 1
  %arrayidx724 = getelementptr inbounds [6 x [1 x [2 x i32]]]* %l_1111, i32 0, i64 5
  %arrayidx725 = getelementptr inbounds [1 x [2 x i32]]* %arrayidx724, i32 0, i64 0
  %arrayidx726 = getelementptr inbounds [2 x i32]* %arrayidx725, i32 0, i64 0
  store i32* %arrayidx726, i32** %arrayinit.element723
  %arrayinit.element727 = getelementptr inbounds i32** %arrayinit.element723, i64 1
  store i32* @g_353, i32** %arrayinit.element727
  %arrayinit.element728 = getelementptr inbounds i32** %arrayinit.element727, i64 1
  store i32* @g_353, i32** %arrayinit.element728
  %arrayinit.element729 = getelementptr inbounds i32** %arrayinit.element728, i64 1
  store i32* %l_1145, i32** %arrayinit.element729
  %arrayinit.element730 = getelementptr inbounds i32** %arrayinit.element729, i64 1
  store i32* @g_353, i32** %arrayinit.element730
  %arrayinit.element731 = getelementptr inbounds [8 x i32*]* %arrayinit.element716, i64 1
  %arrayinit.begin732 = getelementptr inbounds [8 x i32*]* %arrayinit.element731, i64 0, i64 0
  store i32* @g_353, i32** %arrayinit.begin732
  %arrayinit.element733 = getelementptr inbounds i32** %arrayinit.begin732, i64 1
  %arrayidx734 = getelementptr inbounds [6 x [1 x [2 x i32]]]* %l_1111, i32 0, i64 4
  %arrayidx735 = getelementptr inbounds [1 x [2 x i32]]* %arrayidx734, i32 0, i64 0
  %arrayidx736 = getelementptr inbounds [2 x i32]* %arrayidx735, i32 0, i64 1
  store i32* %arrayidx736, i32** %arrayinit.element733
  %arrayinit.element737 = getelementptr inbounds i32** %arrayinit.element733, i64 1
  store i32* @g_353, i32** %arrayinit.element737
  %arrayinit.element738 = getelementptr inbounds i32** %arrayinit.element737, i64 1
  %arrayidx739 = getelementptr inbounds [6 x [1 x [2 x i32]]]* %l_1111, i32 0, i64 5
  %arrayidx740 = getelementptr inbounds [1 x [2 x i32]]* %arrayidx739, i32 0, i64 0
  %arrayidx741 = getelementptr inbounds [2 x i32]* %arrayidx740, i32 0, i64 0
  store i32* %arrayidx741, i32** %arrayinit.element738
  %arrayinit.element742 = getelementptr inbounds i32** %arrayinit.element738, i64 1
  store i32* @g_353, i32** %arrayinit.element742
  %arrayinit.element743 = getelementptr inbounds i32** %arrayinit.element742, i64 1
  store i32* @g_353, i32** %arrayinit.element743
  %arrayinit.element744 = getelementptr inbounds i32** %arrayinit.element743, i64 1
  store i32* %l_1145, i32** %arrayinit.element744
  %arrayinit.element745 = getelementptr inbounds i32** %arrayinit.element744, i64 1
  store i32* @g_353, i32** %arrayinit.element745
  %arrayinit.element746 = getelementptr inbounds [8 x i32*]* %arrayinit.element731, i64 1
  %arrayinit.begin747 = getelementptr inbounds [8 x i32*]* %arrayinit.element746, i64 0, i64 0
  store i32* @g_353, i32** %arrayinit.begin747
  %arrayinit.element748 = getelementptr inbounds i32** %arrayinit.begin747, i64 1
  %arrayidx749 = getelementptr inbounds [6 x [1 x [2 x i32]]]* %l_1111, i32 0, i64 4
  %arrayidx750 = getelementptr inbounds [1 x [2 x i32]]* %arrayidx749, i32 0, i64 0
  %arrayidx751 = getelementptr inbounds [2 x i32]* %arrayidx750, i32 0, i64 1
  store i32* %arrayidx751, i32** %arrayinit.element748
  %arrayinit.element752 = getelementptr inbounds i32** %arrayinit.element748, i64 1
  store i32* @g_353, i32** %arrayinit.element752
  %arrayinit.element753 = getelementptr inbounds i32** %arrayinit.element752, i64 1
  %arrayidx754 = getelementptr inbounds [6 x [1 x [2 x i32]]]* %l_1111, i32 0, i64 5
  %arrayidx755 = getelementptr inbounds [1 x [2 x i32]]* %arrayidx754, i32 0, i64 0
  %arrayidx756 = getelementptr inbounds [2 x i32]* %arrayidx755, i32 0, i64 0
  store i32* %arrayidx756, i32** %arrayinit.element753
  %arrayinit.element757 = getelementptr inbounds i32** %arrayinit.element753, i64 1
  store i32* @g_353, i32** %arrayinit.element757
  %arrayinit.element758 = getelementptr inbounds i32** %arrayinit.element757, i64 1
  store i32* @g_353, i32** %arrayinit.element758
  %arrayinit.element759 = getelementptr inbounds i32** %arrayinit.element758, i64 1
  store i32* %l_1145, i32** %arrayinit.element759
  %arrayinit.element760 = getelementptr inbounds i32** %arrayinit.element759, i64 1
  store i32* @g_353, i32** %arrayinit.element760
  %arrayinit.element761 = getelementptr inbounds [5 x [8 x i32*]]* %arrayinit.element685, i64 1
  %arrayinit.begin762 = getelementptr inbounds [5 x [8 x i32*]]* %arrayinit.element761, i64 0, i64 0
  %arrayinit.begin763 = getelementptr inbounds [8 x i32*]* %arrayinit.begin762, i64 0, i64 0
  store i32* @g_353, i32** %arrayinit.begin763
  %arrayinit.element764 = getelementptr inbounds i32** %arrayinit.begin763, i64 1
  %arrayidx765 = getelementptr inbounds [6 x [1 x [2 x i32]]]* %l_1111, i32 0, i64 4
  %arrayidx766 = getelementptr inbounds [1 x [2 x i32]]* %arrayidx765, i32 0, i64 0
  %arrayidx767 = getelementptr inbounds [2 x i32]* %arrayidx766, i32 0, i64 1
  store i32* %arrayidx767, i32** %arrayinit.element764
  %arrayinit.element768 = getelementptr inbounds i32** %arrayinit.element764, i64 1
  store i32* @g_353, i32** %arrayinit.element768
  %arrayinit.element769 = getelementptr inbounds i32** %arrayinit.element768, i64 1
  %arrayidx770 = getelementptr inbounds [6 x [1 x [2 x i32]]]* %l_1111, i32 0, i64 5
  %arrayidx771 = getelementptr inbounds [1 x [2 x i32]]* %arrayidx770, i32 0, i64 0
  %arrayidx772 = getelementptr inbounds [2 x i32]* %arrayidx771, i32 0, i64 0
  store i32* %arrayidx772, i32** %arrayinit.element769
  %arrayinit.element773 = getelementptr inbounds i32** %arrayinit.element769, i64 1
  store i32* @g_353, i32** %arrayinit.element773
  %arrayinit.element774 = getelementptr inbounds i32** %arrayinit.element773, i64 1
  store i32* @g_353, i32** %arrayinit.element774
  %arrayinit.element775 = getelementptr inbounds i32** %arrayinit.element774, i64 1
  store i32* %l_1145, i32** %arrayinit.element775
  %arrayinit.element776 = getelementptr inbounds i32** %arrayinit.element775, i64 1
  store i32* @g_353, i32** %arrayinit.element776
  %arrayinit.element777 = getelementptr inbounds [8 x i32*]* %arrayinit.begin762, i64 1
  %arrayinit.begin778 = getelementptr inbounds [8 x i32*]* %arrayinit.element777, i64 0, i64 0
  store i32* @g_353, i32** %arrayinit.begin778
  %arrayinit.element779 = getelementptr inbounds i32** %arrayinit.begin778, i64 1
  %arrayidx780 = getelementptr inbounds [6 x [1 x [2 x i32]]]* %l_1111, i32 0, i64 4
  %arrayidx781 = getelementptr inbounds [1 x [2 x i32]]* %arrayidx780, i32 0, i64 0
  %arrayidx782 = getelementptr inbounds [2 x i32]* %arrayidx781, i32 0, i64 1
  store i32* %arrayidx782, i32** %arrayinit.element779
  %arrayinit.element783 = getelementptr inbounds i32** %arrayinit.element779, i64 1
  store i32* @g_353, i32** %arrayinit.element783
  %arrayinit.element784 = getelementptr inbounds i32** %arrayinit.element783, i64 1
  %arrayidx785 = getelementptr inbounds [6 x [1 x [2 x i32]]]* %l_1111, i32 0, i64 5
  %arrayidx786 = getelementptr inbounds [1 x [2 x i32]]* %arrayidx785, i32 0, i64 0
  %arrayidx787 = getelementptr inbounds [2 x i32]* %arrayidx786, i32 0, i64 0
  store i32* %arrayidx787, i32** %arrayinit.element784
  %arrayinit.element788 = getelementptr inbounds i32** %arrayinit.element784, i64 1
  store i32* @g_353, i32** %arrayinit.element788
  %arrayinit.element789 = getelementptr inbounds i32** %arrayinit.element788, i64 1
  store i32* @g_353, i32** %arrayinit.element789
  %arrayinit.element790 = getelementptr inbounds i32** %arrayinit.element789, i64 1
  store i32* %l_1145, i32** %arrayinit.element790
  %arrayinit.element791 = getelementptr inbounds i32** %arrayinit.element790, i64 1
  store i32* @g_353, i32** %arrayinit.element791
  %arrayinit.element792 = getelementptr inbounds [8 x i32*]* %arrayinit.element777, i64 1
  %arrayinit.begin793 = getelementptr inbounds [8 x i32*]* %arrayinit.element792, i64 0, i64 0
  store i32* @g_353, i32** %arrayinit.begin793
  %arrayinit.element794 = getelementptr inbounds i32** %arrayinit.begin793, i64 1
  %arrayidx795 = getelementptr inbounds [6 x [1 x [2 x i32]]]* %l_1111, i32 0, i64 4
  %arrayidx796 = getelementptr inbounds [1 x [2 x i32]]* %arrayidx795, i32 0, i64 0
  %arrayidx797 = getelementptr inbounds [2 x i32]* %arrayidx796, i32 0, i64 1
  store i32* %arrayidx797, i32** %arrayinit.element794
  %arrayinit.element798 = getelementptr inbounds i32** %arrayinit.element794, i64 1
  store i32* @g_353, i32** %arrayinit.element798
  %arrayinit.element799 = getelementptr inbounds i32** %arrayinit.element798, i64 1
  %arrayidx800 = getelementptr inbounds [6 x [1 x [2 x i32]]]* %l_1111, i32 0, i64 5
  %arrayidx801 = getelementptr inbounds [1 x [2 x i32]]* %arrayidx800, i32 0, i64 0
  %arrayidx802 = getelementptr inbounds [2 x i32]* %arrayidx801, i32 0, i64 0
  store i32* %arrayidx802, i32** %arrayinit.element799
  %arrayinit.element803 = getelementptr inbounds i32** %arrayinit.element799, i64 1
  store i32* @g_353, i32** %arrayinit.element803
  %arrayinit.element804 = getelementptr inbounds i32** %arrayinit.element803, i64 1
  store i32* @g_353, i32** %arrayinit.element804
  %arrayinit.element805 = getelementptr inbounds i32** %arrayinit.element804, i64 1
  store i32* %l_1145, i32** %arrayinit.element805
  %arrayinit.element806 = getelementptr inbounds i32** %arrayinit.element805, i64 1
  store i32* @g_353, i32** %arrayinit.element806
  %arrayinit.element807 = getelementptr inbounds [8 x i32*]* %arrayinit.element792, i64 1
  %arrayinit.begin808 = getelementptr inbounds [8 x i32*]* %arrayinit.element807, i64 0, i64 0
  store i32* @g_353, i32** %arrayinit.begin808
  %arrayinit.element809 = getelementptr inbounds i32** %arrayinit.begin808, i64 1
  %arrayidx810 = getelementptr inbounds [6 x [1 x [2 x i32]]]* %l_1111, i32 0, i64 4
  %arrayidx811 = getelementptr inbounds [1 x [2 x i32]]* %arrayidx810, i32 0, i64 0
  %arrayidx812 = getelementptr inbounds [2 x i32]* %arrayidx811, i32 0, i64 1
  store i32* %arrayidx812, i32** %arrayinit.element809
  %arrayinit.element813 = getelementptr inbounds i32** %arrayinit.element809, i64 1
  store i32* @g_353, i32** %arrayinit.element813
  %arrayinit.element814 = getelementptr inbounds i32** %arrayinit.element813, i64 1
  %arrayidx815 = getelementptr inbounds [6 x [1 x [2 x i32]]]* %l_1111, i32 0, i64 5
  %arrayidx816 = getelementptr inbounds [1 x [2 x i32]]* %arrayidx815, i32 0, i64 0
  %arrayidx817 = getelementptr inbounds [2 x i32]* %arrayidx816, i32 0, i64 0
  store i32* %arrayidx817, i32** %arrayinit.element814
  %arrayinit.element818 = getelementptr inbounds i32** %arrayinit.element814, i64 1
  store i32* @g_353, i32** %arrayinit.element818
  %arrayinit.element819 = getelementptr inbounds i32** %arrayinit.element818, i64 1
  store i32* @g_353, i32** %arrayinit.element819
  %arrayinit.element820 = getelementptr inbounds i32** %arrayinit.element819, i64 1
  store i32* %l_1145, i32** %arrayinit.element820
  %arrayinit.element821 = getelementptr inbounds i32** %arrayinit.element820, i64 1
  store i32* @g_353, i32** %arrayinit.element821
  %arrayinit.element822 = getelementptr inbounds [8 x i32*]* %arrayinit.element807, i64 1
  %arrayinit.begin823 = getelementptr inbounds [8 x i32*]* %arrayinit.element822, i64 0, i64 0
  store i32* @g_353, i32** %arrayinit.begin823
  %arrayinit.element824 = getelementptr inbounds i32** %arrayinit.begin823, i64 1
  %arrayidx825 = getelementptr inbounds [6 x [1 x [2 x i32]]]* %l_1111, i32 0, i64 4
  %arrayidx826 = getelementptr inbounds [1 x [2 x i32]]* %arrayidx825, i32 0, i64 0
  %arrayidx827 = getelementptr inbounds [2 x i32]* %arrayidx826, i32 0, i64 1
  store i32* %arrayidx827, i32** %arrayinit.element824
  %arrayinit.element828 = getelementptr inbounds i32** %arrayinit.element824, i64 1
  store i32* @g_353, i32** %arrayinit.element828
  %arrayinit.element829 = getelementptr inbounds i32** %arrayinit.element828, i64 1
  %arrayidx830 = getelementptr inbounds [6 x [1 x [2 x i32]]]* %l_1111, i32 0, i64 5
  %arrayidx831 = getelementptr inbounds [1 x [2 x i32]]* %arrayidx830, i32 0, i64 0
  %arrayidx832 = getelementptr inbounds [2 x i32]* %arrayidx831, i32 0, i64 0
  store i32* %arrayidx832, i32** %arrayinit.element829
  %arrayinit.element833 = getelementptr inbounds i32** %arrayinit.element829, i64 1
  store i32* @g_353, i32** %arrayinit.element833
  %arrayinit.element834 = getelementptr inbounds i32** %arrayinit.element833, i64 1
  store i32* @g_353, i32** %arrayinit.element834
  %arrayinit.element835 = getelementptr inbounds i32** %arrayinit.element834, i64 1
  store i32* %l_1145, i32** %arrayinit.element835
  %arrayinit.element836 = getelementptr inbounds i32** %arrayinit.element835, i64 1
  store i32* @g_353, i32** %arrayinit.element836
  %arrayinit.element837 = getelementptr inbounds [5 x [8 x i32*]]* %arrayinit.element761, i64 1
  %arrayinit.begin838 = getelementptr inbounds [5 x [8 x i32*]]* %arrayinit.element837, i64 0, i64 0
  %arrayinit.begin839 = getelementptr inbounds [8 x i32*]* %arrayinit.begin838, i64 0, i64 0
  store i32* @g_353, i32** %arrayinit.begin839
  %arrayinit.element840 = getelementptr inbounds i32** %arrayinit.begin839, i64 1
  %arrayidx841 = getelementptr inbounds [6 x [1 x [2 x i32]]]* %l_1111, i32 0, i64 4
  %arrayidx842 = getelementptr inbounds [1 x [2 x i32]]* %arrayidx841, i32 0, i64 0
  %arrayidx843 = getelementptr inbounds [2 x i32]* %arrayidx842, i32 0, i64 1
  store i32* %arrayidx843, i32** %arrayinit.element840
  %arrayinit.element844 = getelementptr inbounds i32** %arrayinit.element840, i64 1
  store i32* @g_353, i32** %arrayinit.element844
  %arrayinit.element845 = getelementptr inbounds i32** %arrayinit.element844, i64 1
  %arrayidx846 = getelementptr inbounds [6 x [1 x [2 x i32]]]* %l_1111, i32 0, i64 5
  %arrayidx847 = getelementptr inbounds [1 x [2 x i32]]* %arrayidx846, i32 0, i64 0
  %arrayidx848 = getelementptr inbounds [2 x i32]* %arrayidx847, i32 0, i64 0
  store i32* %arrayidx848, i32** %arrayinit.element845
  %arrayinit.element849 = getelementptr inbounds i32** %arrayinit.element845, i64 1
  store i32* @g_353, i32** %arrayinit.element849
  %arrayinit.element850 = getelementptr inbounds i32** %arrayinit.element849, i64 1
  store i32* @g_353, i32** %arrayinit.element850
  %arrayinit.element851 = getelementptr inbounds i32** %arrayinit.element850, i64 1
  store i32* %l_1145, i32** %arrayinit.element851
  %arrayinit.element852 = getelementptr inbounds i32** %arrayinit.element851, i64 1
  store i32* @g_353, i32** %arrayinit.element852
  %arrayinit.element853 = getelementptr inbounds [8 x i32*]* %arrayinit.begin838, i64 1
  %arrayinit.begin854 = getelementptr inbounds [8 x i32*]* %arrayinit.element853, i64 0, i64 0
  store i32* @g_353, i32** %arrayinit.begin854
  %arrayinit.element855 = getelementptr inbounds i32** %arrayinit.begin854, i64 1
  %arrayidx856 = getelementptr inbounds [6 x [1 x [2 x i32]]]* %l_1111, i32 0, i64 4
  %arrayidx857 = getelementptr inbounds [1 x [2 x i32]]* %arrayidx856, i32 0, i64 0
  %arrayidx858 = getelementptr inbounds [2 x i32]* %arrayidx857, i32 0, i64 1
  store i32* %arrayidx858, i32** %arrayinit.element855
  %arrayinit.element859 = getelementptr inbounds i32** %arrayinit.element855, i64 1
  store i32* @g_353, i32** %arrayinit.element859
  %arrayinit.element860 = getelementptr inbounds i32** %arrayinit.element859, i64 1
  %arrayidx861 = getelementptr inbounds [6 x [1 x [2 x i32]]]* %l_1111, i32 0, i64 5
  %arrayidx862 = getelementptr inbounds [1 x [2 x i32]]* %arrayidx861, i32 0, i64 0
  %arrayidx863 = getelementptr inbounds [2 x i32]* %arrayidx862, i32 0, i64 0
  store i32* %arrayidx863, i32** %arrayinit.element860
  %arrayinit.element864 = getelementptr inbounds i32** %arrayinit.element860, i64 1
  store i32* @g_353, i32** %arrayinit.element864
  %arrayinit.element865 = getelementptr inbounds i32** %arrayinit.element864, i64 1
  store i32* @g_353, i32** %arrayinit.element865
  %arrayinit.element866 = getelementptr inbounds i32** %arrayinit.element865, i64 1
  store i32* %l_1145, i32** %arrayinit.element866
  %arrayinit.element867 = getelementptr inbounds i32** %arrayinit.element866, i64 1
  store i32* @g_353, i32** %arrayinit.element867
  %arrayinit.element868 = getelementptr inbounds [8 x i32*]* %arrayinit.element853, i64 1
  %arrayinit.begin869 = getelementptr inbounds [8 x i32*]* %arrayinit.element868, i64 0, i64 0
  store i32* @g_353, i32** %arrayinit.begin869
  %arrayinit.element870 = getelementptr inbounds i32** %arrayinit.begin869, i64 1
  %arrayidx871 = getelementptr inbounds [6 x [1 x [2 x i32]]]* %l_1111, i32 0, i64 4
  %arrayidx872 = getelementptr inbounds [1 x [2 x i32]]* %arrayidx871, i32 0, i64 0
  %arrayidx873 = getelementptr inbounds [2 x i32]* %arrayidx872, i32 0, i64 1
  store i32* %arrayidx873, i32** %arrayinit.element870
  %arrayinit.element874 = getelementptr inbounds i32** %arrayinit.element870, i64 1
  store i32* @g_353, i32** %arrayinit.element874
  %arrayinit.element875 = getelementptr inbounds i32** %arrayinit.element874, i64 1
  %arrayidx876 = getelementptr inbounds [6 x [1 x [2 x i32]]]* %l_1111, i32 0, i64 5
  %arrayidx877 = getelementptr inbounds [1 x [2 x i32]]* %arrayidx876, i32 0, i64 0
  %arrayidx878 = getelementptr inbounds [2 x i32]* %arrayidx877, i32 0, i64 0
  store i32* %arrayidx878, i32** %arrayinit.element875
  %arrayinit.element879 = getelementptr inbounds i32** %arrayinit.element875, i64 1
  store i32* @g_353, i32** %arrayinit.element879
  %arrayinit.element880 = getelementptr inbounds i32** %arrayinit.element879, i64 1
  store i32* @g_353, i32** %arrayinit.element880
  %arrayinit.element881 = getelementptr inbounds i32** %arrayinit.element880, i64 1
  store i32* %l_1145, i32** %arrayinit.element881
  %arrayinit.element882 = getelementptr inbounds i32** %arrayinit.element881, i64 1
  store i32* @g_353, i32** %arrayinit.element882
  %arrayinit.element883 = getelementptr inbounds [8 x i32*]* %arrayinit.element868, i64 1
  %arrayinit.begin884 = getelementptr inbounds [8 x i32*]* %arrayinit.element883, i64 0, i64 0
  store i32* @g_353, i32** %arrayinit.begin884
  %arrayinit.element885 = getelementptr inbounds i32** %arrayinit.begin884, i64 1
  %arrayidx886 = getelementptr inbounds [6 x [1 x [2 x i32]]]* %l_1111, i32 0, i64 4
  %arrayidx887 = getelementptr inbounds [1 x [2 x i32]]* %arrayidx886, i32 0, i64 0
  %arrayidx888 = getelementptr inbounds [2 x i32]* %arrayidx887, i32 0, i64 1
  store i32* %arrayidx888, i32** %arrayinit.element885
  %arrayinit.element889 = getelementptr inbounds i32** %arrayinit.element885, i64 1
  store i32* @g_353, i32** %arrayinit.element889
  %arrayinit.element890 = getelementptr inbounds i32** %arrayinit.element889, i64 1
  %arrayidx891 = getelementptr inbounds [6 x [1 x [2 x i32]]]* %l_1111, i32 0, i64 5
  %arrayidx892 = getelementptr inbounds [1 x [2 x i32]]* %arrayidx891, i32 0, i64 0
  %arrayidx893 = getelementptr inbounds [2 x i32]* %arrayidx892, i32 0, i64 0
  store i32* %arrayidx893, i32** %arrayinit.element890
  %arrayinit.element894 = getelementptr inbounds i32** %arrayinit.element890, i64 1
  store i32* @g_353, i32** %arrayinit.element894
  %arrayinit.element895 = getelementptr inbounds i32** %arrayinit.element894, i64 1
  store i32* @g_353, i32** %arrayinit.element895
  %arrayinit.element896 = getelementptr inbounds i32** %arrayinit.element895, i64 1
  store i32* %l_1145, i32** %arrayinit.element896
  %arrayinit.element897 = getelementptr inbounds i32** %arrayinit.element896, i64 1
  store i32* @g_353, i32** %arrayinit.element897
  %arrayinit.element898 = getelementptr inbounds [8 x i32*]* %arrayinit.element883, i64 1
  %arrayinit.begin899 = getelementptr inbounds [8 x i32*]* %arrayinit.element898, i64 0, i64 0
  store i32* @g_353, i32** %arrayinit.begin899
  %arrayinit.element900 = getelementptr inbounds i32** %arrayinit.begin899, i64 1
  %arrayidx901 = getelementptr inbounds [6 x [1 x [2 x i32]]]* %l_1111, i32 0, i64 4
  %arrayidx902 = getelementptr inbounds [1 x [2 x i32]]* %arrayidx901, i32 0, i64 0
  %arrayidx903 = getelementptr inbounds [2 x i32]* %arrayidx902, i32 0, i64 1
  store i32* %arrayidx903, i32** %arrayinit.element900
  %arrayinit.element904 = getelementptr inbounds i32** %arrayinit.element900, i64 1
  store i32* @g_353, i32** %arrayinit.element904
  %arrayinit.element905 = getelementptr inbounds i32** %arrayinit.element904, i64 1
  %arrayidx906 = getelementptr inbounds [6 x [1 x [2 x i32]]]* %l_1111, i32 0, i64 5
  %arrayidx907 = getelementptr inbounds [1 x [2 x i32]]* %arrayidx906, i32 0, i64 0
  %arrayidx908 = getelementptr inbounds [2 x i32]* %arrayidx907, i32 0, i64 0
  store i32* %arrayidx908, i32** %arrayinit.element905
  %arrayinit.element909 = getelementptr inbounds i32** %arrayinit.element905, i64 1
  store i32* @g_353, i32** %arrayinit.element909
  %arrayinit.element910 = getelementptr inbounds i32** %arrayinit.element909, i64 1
  store i32* @g_353, i32** %arrayinit.element910
  %arrayinit.element911 = getelementptr inbounds i32** %arrayinit.element910, i64 1
  store i32* %l_1145, i32** %arrayinit.element911
  %arrayinit.element912 = getelementptr inbounds i32** %arrayinit.element911, i64 1
  store i32* @g_353, i32** %arrayinit.element912
  store i32 -1, i32* %l_1228, align 4
  store i32 4, i32* %l_1258, align 4
  %227 = bitcast [9 x i8]* %l_1264 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %227, i8* getelementptr inbounds ([9 x i8]* @func_7.l_1264, i32 0, i32 0), i64 9, i32 1, i1 false)
  store i32** @g_258, i32*** %l_1270, align 8
  store i32 0, i32* %i913, align 4
  br label %for.cond916

for.cond916:                                      ; preds = %for.inc922, %for.body532
  %228 = load i32* %i913, align 4
  %cmp917 = icmp slt i32 %228, 5
  br i1 %cmp917, label %for.body919, label %for.end924

for.body919:                                      ; preds = %for.cond916
  %229 = load i32* %i913, align 4
  %idxprom920 = sext i32 %229 to i64
  %arrayidx921 = getelementptr inbounds [5 x i32**]* %l_1268, i32 0, i64 %idxprom920
  store i32** %l_1177, i32*** %arrayidx921, align 8
  br label %for.inc922

for.inc922:                                       ; preds = %for.body919
  %230 = load i32* %i913, align 4
  %inc923 = add nsw i32 %230, 1
  store i32 %inc923, i32* %i913, align 4
  br label %for.cond916

for.end924:                                       ; preds = %for.cond916
  %arrayidx925 = getelementptr inbounds [10 x [2 x i16]]* %l_1176, i32 0, i64 6
  %arrayidx926 = getelementptr inbounds [2 x i16]* %arrayidx925, i32 0, i64 0
  %231 = load i16* %arrayidx926, align 2
  %tobool927 = icmp ne i16 %231, 0
  br i1 %tobool927, label %if.then928, label %if.end929

if.then928:                                       ; preds = %for.end924
  br label %for.end1066

if.end929:                                        ; preds = %for.end924
  %232 = load i32** %l_1177, align 8
  %233 = load i32*** %l_1151, align 8
  store i32* %232, i32** %233, align 8
  store i32 -29, i32* bitcast (%union.U0* @g_13 to i32*), align 4
  br label %for.cond930

for.cond930:                                      ; preds = %for.inc1059, %if.end929
  %234 = load i32* bitcast (%union.U0* @g_13 to i32*), align 4
  %cmp931 = icmp sge i32 %234, 9
  br i1 %cmp931, label %for.body933, label %for.end1063

for.body933:                                      ; preds = %for.cond930
  store %union.U1* null, %union.U1** %l_1187, align 8
  store i32 -845429518, i32* %l_1212, align 4
  store i32**** getelementptr inbounds ([7 x i32***]* @g_780, i32 0, i64 0), i32***** %l_1241, align 8
  %235 = load i32** %p_11.addr, align 8
  %236 = load i32* %235, align 4
  %tobool934 = icmp ne i32 %236, 0
  br i1 %tobool934, label %if.then935, label %if.else951

if.then935:                                       ; preds = %for.body933
  %call936 = call zeroext i16 @safe_mul_func_uint16_t_u_u(i16 zeroext 24371, i16 zeroext -1)
  %conv937 = zext i16 %call936 to i32
  %neg = xor i32 %conv937, -1
  %237 = load volatile i8* getelementptr inbounds ([3 x [6 x [1 x i8]]]* @g_880, i32 0, i64 1, i64 4, i64 0), align 1
  %conv938 = sext i8 %237 to i32
  %call939 = call zeroext i8 @safe_lshift_func_uint8_t_u_s(i8 zeroext -88, i32 %conv938)
  %238 = load i32* %p_12.addr, align 4
  %arrayidx940 = getelementptr inbounds [5 x [5 x [8 x i32*]]]* %l_1186, i32 0, i64 3
  %arrayidx941 = getelementptr inbounds [5 x [8 x i32*]]* %arrayidx940, i32 0, i64 4
  %arrayidx942 = getelementptr inbounds [8 x i32*]* %arrayidx941, i32 0, i64 1
  %239 = load i32** %arrayidx942, align 8
  %cmp943 = icmp ne i32* @g_353, %239
  %conv944 = zext i1 %cmp943 to i32
  %conv945 = trunc i32 %conv944 to i8
  %call946 = call signext i8 @safe_sub_func_int8_t_s_s(i8 signext %call939, i8 signext %conv945)
  %conv947 = sext i8 %call946 to i32
  %cmp948 = icmp sle i32 %neg, %conv947
  %conv949 = zext i1 %cmp948 to i32
  %f1950 = bitcast %union.U0* %p_8 to i32*
  store i32 %conv949, i32* %f1950, align 4
  %240 = load %union.U1** %l_1187, align 8
  store %union.U1* %240, %union.U1** %l_964, align 8
  br label %if.end1058

if.else951:                                       ; preds = %for.body933
  store i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 2, i64 0, i64 6), i32** %l_1199, align 8
  %241 = load i32* %p_10.addr, align 4
  %conv952 = trunc i32 %241 to i8
  %call953 = call zeroext i8 @safe_mul_func_uint8_t_u_u(i8 zeroext %conv952, i8 zeroext 1)
  %242 = load i32* %p_10.addr, align 4
  %call954 = call signext i8 @safe_rshift_func_int8_t_s_u(i8 signext %call953, i32 %242)
  %conv955 = sext i8 %call954 to i32
  %243 = load volatile i32** @g_65, align 8
  %244 = load i32* %243, align 4
  %and956 = and i32 %244, %conv955
  store i32 %and956, i32* %243, align 4
  %cmp957 = icmp ne i32** null, %l_1177
  %conv958 = zext i1 %cmp957 to i32
  %conv959 = trunc i32 %conv958 to i8
  %arrayidx960 = getelementptr inbounds [5 x [5 x [8 x i32*]]]* %l_1186, i32 0, i64 0
  %arrayidx961 = getelementptr inbounds [5 x [8 x i32*]]* %arrayidx960, i32 0, i64 0
  %arrayidx962 = getelementptr inbounds [8 x i32*]* %arrayidx961, i32 0, i64 1
  %245 = load i32** %arrayidx962, align 8
  %f1963 = bitcast %union.U0* %p_8 to i32*
  %246 = load i32* %f1963, align 4
  %conv964 = trunc i32 %246 to i8
  %247 = load i32** %l_1199, align 8
  %call965 = call zeroext i16 @func_36(i32* %245, i32** %l_1177, i8 zeroext %conv964, i32* %247)
  %conv966 = trunc i16 %call965 to i8
  %call967 = call zeroext i8 @safe_div_func_uint8_t_u_u(i8 zeroext %conv959, i8 zeroext %conv966)
  %conv968 = zext i8 %call967 to i32
  %248 = load %union.U0*** @g_619, align 8
  %249 = load %union.U0** %248, align 8
  %cmp969 = icmp ne %union.U0* %249, %p_8
  %conv970 = zext i1 %cmp969 to i32
  %cmp971 = icmp eq i32 %conv968, %conv970
  %conv972 = zext i1 %cmp971 to i32
  %conv973 = trunc i32 %conv972 to i8
  %250 = load i32* %p_10.addr, align 4
  %call974 = call zeroext i8 @safe_lshift_func_uint8_t_u_u(i8 zeroext %conv973, i32 %250)
  %conv975 = zext i8 %call974 to i32
  %251 = load i32** %p_11.addr, align 8
  %252 = load i32* %251, align 4
  %call976 = call i32 @safe_div_func_uint32_t_u_u(i32 %conv975, i32 %252)
  %tobool977 = icmp ne i32 %call976, 0
  br i1 %tobool977, label %if.then978, label %if.else1010

if.then978:                                       ; preds = %if.else951
  %arrayinit.begin979 = getelementptr inbounds [5 x i32*]* %l_1204, i64 0, i64 0
  store i32* %l_905, i32** %arrayinit.begin979
  %arrayinit.element980 = getelementptr inbounds i32** %arrayinit.begin979, i64 1
  store i32* getelementptr inbounds ([1 x [8 x [10 x i32]]]* @g_110, i32 0, i64 0, i64 2, i64 2), i32** %arrayinit.element980
  %arrayinit.element981 = getelementptr inbounds i32** %arrayinit.element980, i64 1
  store i32* %l_905, i32** %arrayinit.element981
  %arrayinit.element982 = getelementptr inbounds i32** %arrayinit.element981, i64 1
  store i32* getelementptr inbounds ([1 x [8 x [10 x i32]]]* @g_110, i32 0, i64 0, i64 2, i64 2), i32** %arrayinit.element982
  %arrayinit.element983 = getelementptr inbounds i32** %arrayinit.element982, i64 1
  store i32* %l_905, i32** %arrayinit.element983
  store i32 1, i32* %l_1205, align 4
  store i32 -1, i32* %l_1206, align 4
  %253 = load i32* %l_1206, align 4
  %conv985 = trunc i32 %253 to i16
  %call986 = call zeroext i16 @safe_mul_func_uint16_t_u_u(i16 zeroext 0, i16 zeroext %conv985)
  %conv987 = zext i16 %call986 to i32
  %254 = load volatile i32** @g_868, align 8
  %255 = load i32* %254, align 4
  %cmp988 = icmp sge i32 %conv987, %255
  %conv989 = zext i1 %cmp988 to i32
  %256 = load i16*** @g_416, align 8
  %257 = load i16** %256, align 8
  %258 = load i16* %257, align 2
  %conv990 = zext i16 %258 to i32
  %cmp991 = icmp sge i32 %conv989, %conv990
  %conv992 = zext i1 %cmp991 to i32
  %conv993 = trunc i32 %conv992 to i16
  %259 = load i32* bitcast (%union.U0* @g_886 to i32*), align 4
  %conv994 = trunc i32 %259 to i16
  %call995 = call signext i16 @safe_sub_func_int16_t_s_s(i16 signext %conv993, i16 signext %conv994)
  %conv996 = sext i16 %call995 to i32
  %260 = load i32** %l_1199, align 8
  store i32 %conv996, i32* %260, align 4
  %261 = load i32** %l_1199, align 8
  %262 = load i32* %261, align 4
  %conv997 = sext i32 %262 to i64
  %or998 = or i64 %conv997, 1
  %conv999 = trunc i64 %or998 to i32
  store i32 %conv999, i32* %261, align 4
  %call1000 = call zeroext i8 @safe_unary_minus_func_uint8_t_u(i8 zeroext 17)
  %263 = load i32** %l_1199, align 8
  %264 = load i32* %263, align 4
  %265 = load volatile i64* getelementptr inbounds (%union.U1* @g_1041, i32 0, i32 0), align 8
  %conv1001 = trunc i64 %265 to i8
  %call1002 = call zeroext i8 @safe_sub_func_uint8_t_u_u(i8 zeroext %call1000, i8 zeroext %conv1001)
  %conv1003 = zext i8 %call1002 to i32
  %266 = load i32* %l_1212, align 4
  %cmp1004 = icmp ne i32 %conv1003, %266
  %conv1005 = zext i1 %cmp1004 to i32
  %conv1006 = trunc i32 %conv1005 to i8
  %267 = load i32* %p_12.addr, align 4
  %conv1007 = trunc i32 %267 to i8
  %268 = load i8** %l_903, align 8
  store i8 %conv1007, i8* %268, align 1
  %call1008 = call signext i8 @safe_div_func_int8_t_s_s(i8 signext %conv1006, i8 signext %conv1007)
  %conv1009 = sext i8 %call1008 to i32
  %269 = load i32** %l_1199, align 8
  store i32 %conv1009, i32* %269, align 4
  br label %if.end1054

if.else1010:                                      ; preds = %if.else951
  %arrayidx1011 = getelementptr inbounds [6 x [9 x i32*]]* %l_1217, i32 0, i64 5
  %arrayidx1012 = getelementptr inbounds [9 x i32*]* %arrayidx1011, i32 0, i64 6
  store i32** %arrayidx1012, i32*** %l_1218, align 8
  store i32 -1, i32* %l_1227, align 4
  %270 = load i32** %l_1199, align 8
  %271 = load i32* %270, align 4
  %arrayidx1013 = getelementptr inbounds [3 x [8 x [5 x i32]]]* %l_1035, i32 0, i64 1
  %arrayidx1014 = getelementptr inbounds [8 x [5 x i32]]* %arrayidx1013, i32 0, i64 1
  %arrayidx1015 = getelementptr inbounds [5 x i32]* %arrayidx1014, i32 0, i64 4
  %272 = load i32* %arrayidx1015, align 4
  %xor1016 = xor i32 %272, %271
  store i32 %xor1016, i32* %arrayidx1015, align 4
  %273 = load i32* %p_10.addr, align 4
  %conv1017 = trunc i32 %273 to i8
  %call1018 = call signext i8 @safe_lshift_func_int8_t_s_u(i8 signext %conv1017, i32 2)
  %274 = load i32** %p_11.addr, align 8
  %arrayidx1019 = getelementptr inbounds [6 x [9 x i32*]]* %l_1217, i32 0, i64 5
  %arrayidx1020 = getelementptr inbounds [9 x i32*]* %arrayidx1019, i32 0, i64 6
  %275 = load i32** %arrayidx1020, align 8
  %276 = load i32*** %l_1218, align 8
  store i32* %275, i32** %276, align 8
  %cmp1021 = icmp eq i32* %274, %275
  %conv1022 = zext i1 %cmp1021 to i32
  %call1023 = call signext i8 @safe_rshift_func_int8_t_s_u(i8 signext %call1018, i32 %conv1022)
  %conv1024 = sext i8 %call1023 to i32
  %277 = load i32** %l_1199, align 8
  store i32 %conv1024, i32* %277, align 4
  %arrayidx1026 = getelementptr inbounds [1 x i16]* %l_1221, i32 0, i64 0
  %278 = load i16* %arrayidx1026, align 2
  %279 = bitcast %union.U0* %agg.tmp1025 to i8*
  %280 = bitcast %union.U0* %l_1222 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %279, i8* %280, i64 8, i32 8, i1 false)
  %coerce.dive1027 = getelementptr %union.U0* %agg.tmp1025, i32 0, i32 0
  %281 = load i64* %coerce.dive1027
  %call1028 = call i32 @func_14(i64 %281)
  %282 = load i32** %l_1199, align 8
  %283 = load i32* %282, align 4
  %conv1029 = trunc i32 %283 to i8
  %284 = load i32* %p_10.addr, align 4
  %conv1030 = trunc i32 %284 to i16
  %285 = load volatile i16**** @g_985, align 8
  %286 = load i16*** %285, align 8
  %287 = load i16** %286, align 8
  %288 = load i16* %287, align 2
  %conv1031 = zext i16 %288 to i64
  %cmp1032 = icmp eq i64 %conv1031, 10230
  %conv1033 = zext i1 %cmp1032 to i32
  %289 = load i32* %p_10.addr, align 4
  %conv1034 = zext i32 %289 to i64
  %or1035 = or i64 1, %conv1034
  %290 = load i32* %l_1227, align 4
  %conv1036 = sext i32 %290 to i64
  %cmp1037 = icmp ne i64 %or1035, %conv1036
  %conv1038 = zext i1 %cmp1037 to i32
  %call1039 = call signext i16 @safe_rshift_func_int16_t_s_u(i16 signext %conv1030, i32 %conv1038)
  %conv1040 = sext i16 %call1039 to i32
  %call1041 = call zeroext i8 @safe_lshift_func_uint8_t_u_u(i8 zeroext %conv1029, i32 %conv1040)
  %conv1042 = zext i8 %call1041 to i64
  %call1043 = call i64 @safe_mod_func_uint64_t_u_u(i64 %conv1042, i64 2505488590288482307)
  %tobool1044 = icmp ne i64 %call1043, 0
  br i1 %tobool1044, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %if.else1010
  %291 = load i32** %l_1199, align 8
  %292 = load i32* %291, align 4
  %tobool1045 = icmp ne i32 %292, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %if.else1010
  %293 = phi i1 [ false, %if.else1010 ], [ %tobool1045, %land.rhs ]
  %land.ext = zext i1 %293 to i32
  %294 = load i32** %l_1199, align 8
  store i32 %land.ext, i32* %294, align 4
  %295 = load i32** %l_1199, align 8
  %296 = load i32* %295, align 4
  %tobool1046 = icmp ne i32 %296, 0
  br i1 %tobool1046, label %land.rhs1047, label %land.end1051

land.rhs1047:                                     ; preds = %land.end
  %297 = load i32* %l_1212, align 4
  %conv1048 = sext i32 %297 to i64
  %cmp1049 = icmp sle i64 3252812336729887384, %conv1048
  br label %land.end1051

land.end1051:                                     ; preds = %land.rhs1047, %land.end
  %298 = phi i1 [ false, %land.end ], [ %cmp1049, %land.rhs1047 ]
  %land.ext1052 = zext i1 %298 to i32
  %299 = load i32* %l_1228, align 4
  %and1053 = and i32 %299, %land.ext1052
  store i32 %and1053, i32* %l_1228, align 4
  br label %if.end1054

if.end1054:                                       ; preds = %land.end1051, %if.then978
  %300 = load i32** %p_11.addr, align 8
  %301 = load i32* %300, align 4
  %tobool1055 = icmp ne i32 %301, 0
  br i1 %tobool1055, label %if.then1056, label %if.end1057

if.then1056:                                      ; preds = %if.end1054
  br label %for.end1063

if.end1057:                                       ; preds = %if.end1054
  br label %if.end1058

if.end1058:                                       ; preds = %if.end1057, %if.then935
  br label %for.inc1059

for.inc1059:                                      ; preds = %if.end1058
  %302 = load i32* bitcast (%union.U0* @g_13 to i32*), align 4
  %conv1060 = trunc i32 %302 to i8
  %call1061 = call zeroext i8 @safe_add_func_uint8_t_u_u(i8 zeroext %conv1060, i8 zeroext 5)
  %conv1062 = zext i8 %call1061 to i32
  store i32 %conv1062, i32* bitcast (%union.U0* @g_13 to i32*), align 4
  br label %for.cond930

for.end1063:                                      ; preds = %if.then1056, %for.cond930
  br label %for.inc1064

for.inc1064:                                      ; preds = %for.end1063
  %303 = load i32* bitcast (%union.U1* @g_307 to i32*), align 4
  %inc1065 = add nsw i32 %303, 1
  store i32 %inc1065, i32* bitcast (%union.U1* @g_307 to i32*), align 4
  br label %for.cond529

for.end1066:                                      ; preds = %if.then928, %for.cond529
  br label %if.end1492

if.else1067:                                      ; preds = %if.end340
  store i16** getelementptr inbounds ([4 x i16*]* @g_489, i32 0, i64 1), i16*** %l_1302, align 8
  store i32 1, i32* %l_1323, align 4
  store i32 -442791786, i32* %l_1325, align 4
  %304 = bitcast [9 x i32]* %l_1352 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %304, i8* bitcast ([9 x i32]* @func_7.l_1352 to i8*), i64 36, i32 16, i1 false)
  %arrayinit.begin1068 = getelementptr inbounds [10 x [10 x [2 x i32*]]]* %l_1367, i64 0, i64 0
  %arrayinit.begin1069 = getelementptr inbounds [10 x [2 x i32*]]* %arrayinit.begin1068, i64 0, i64 0
  %arrayinit.begin1070 = getelementptr inbounds [2 x i32*]* %arrayinit.begin1069, i64 0, i64 0
  store i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 4, i64 0, i64 1), i32** %arrayinit.begin1070
  %arrayinit.element1071 = getelementptr inbounds i32** %arrayinit.begin1070, i64 1
  %arrayidx1072 = getelementptr inbounds [9 x i32]* %l_1352, i32 0, i64 7
  store i32* %arrayidx1072, i32** %arrayinit.element1071
  %arrayinit.element1073 = getelementptr inbounds [2 x i32*]* %arrayinit.begin1069, i64 1
  %arrayinit.begin1074 = getelementptr inbounds [2 x i32*]* %arrayinit.element1073, i64 0, i64 0
  store i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 4, i64 0, i64 1), i32** %arrayinit.begin1074
  %arrayinit.element1075 = getelementptr inbounds i32** %arrayinit.begin1074, i64 1
  %arrayidx1076 = getelementptr inbounds [9 x i32]* %l_1352, i32 0, i64 7
  store i32* %arrayidx1076, i32** %arrayinit.element1075
  %arrayinit.element1077 = getelementptr inbounds [2 x i32*]* %arrayinit.element1073, i64 1
  %arrayinit.begin1078 = getelementptr inbounds [2 x i32*]* %arrayinit.element1077, i64 0, i64 0
  store i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 4, i64 0, i64 1), i32** %arrayinit.begin1078
  %arrayinit.element1079 = getelementptr inbounds i32** %arrayinit.begin1078, i64 1
  %arrayidx1080 = getelementptr inbounds [9 x i32]* %l_1352, i32 0, i64 7
  store i32* %arrayidx1080, i32** %arrayinit.element1079
  %arrayinit.element1081 = getelementptr inbounds [2 x i32*]* %arrayinit.element1077, i64 1
  %arrayinit.begin1082 = getelementptr inbounds [2 x i32*]* %arrayinit.element1081, i64 0, i64 0
  store i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 4, i64 0, i64 1), i32** %arrayinit.begin1082
  %arrayinit.element1083 = getelementptr inbounds i32** %arrayinit.begin1082, i64 1
  %arrayidx1084 = getelementptr inbounds [9 x i32]* %l_1352, i32 0, i64 7
  store i32* %arrayidx1084, i32** %arrayinit.element1083
  %arrayinit.element1085 = getelementptr inbounds [2 x i32*]* %arrayinit.element1081, i64 1
  %arrayinit.begin1086 = getelementptr inbounds [2 x i32*]* %arrayinit.element1085, i64 0, i64 0
  store i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 4, i64 0, i64 1), i32** %arrayinit.begin1086
  %arrayinit.element1087 = getelementptr inbounds i32** %arrayinit.begin1086, i64 1
  %arrayidx1088 = getelementptr inbounds [9 x i32]* %l_1352, i32 0, i64 7
  store i32* %arrayidx1088, i32** %arrayinit.element1087
  %arrayinit.element1089 = getelementptr inbounds [2 x i32*]* %arrayinit.element1085, i64 1
  %arrayinit.begin1090 = getelementptr inbounds [2 x i32*]* %arrayinit.element1089, i64 0, i64 0
  store i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 4, i64 0, i64 1), i32** %arrayinit.begin1090
  %arrayinit.element1091 = getelementptr inbounds i32** %arrayinit.begin1090, i64 1
  %arrayidx1092 = getelementptr inbounds [9 x i32]* %l_1352, i32 0, i64 7
  store i32* %arrayidx1092, i32** %arrayinit.element1091
  %arrayinit.element1093 = getelementptr inbounds [2 x i32*]* %arrayinit.element1089, i64 1
  %arrayinit.begin1094 = getelementptr inbounds [2 x i32*]* %arrayinit.element1093, i64 0, i64 0
  store i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 4, i64 0, i64 1), i32** %arrayinit.begin1094
  %arrayinit.element1095 = getelementptr inbounds i32** %arrayinit.begin1094, i64 1
  %arrayidx1096 = getelementptr inbounds [9 x i32]* %l_1352, i32 0, i64 7
  store i32* %arrayidx1096, i32** %arrayinit.element1095
  %arrayinit.element1097 = getelementptr inbounds [2 x i32*]* %arrayinit.element1093, i64 1
  %arrayinit.begin1098 = getelementptr inbounds [2 x i32*]* %arrayinit.element1097, i64 0, i64 0
  store i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 4, i64 0, i64 1), i32** %arrayinit.begin1098
  %arrayinit.element1099 = getelementptr inbounds i32** %arrayinit.begin1098, i64 1
  %arrayidx1100 = getelementptr inbounds [9 x i32]* %l_1352, i32 0, i64 7
  store i32* %arrayidx1100, i32** %arrayinit.element1099
  %arrayinit.element1101 = getelementptr inbounds [2 x i32*]* %arrayinit.element1097, i64 1
  %arrayinit.begin1102 = getelementptr inbounds [2 x i32*]* %arrayinit.element1101, i64 0, i64 0
  store i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 4, i64 0, i64 1), i32** %arrayinit.begin1102
  %arrayinit.element1103 = getelementptr inbounds i32** %arrayinit.begin1102, i64 1
  %arrayidx1104 = getelementptr inbounds [9 x i32]* %l_1352, i32 0, i64 7
  store i32* %arrayidx1104, i32** %arrayinit.element1103
  %arrayinit.element1105 = getelementptr inbounds [2 x i32*]* %arrayinit.element1101, i64 1
  %arrayinit.begin1106 = getelementptr inbounds [2 x i32*]* %arrayinit.element1105, i64 0, i64 0
  store i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 4, i64 0, i64 1), i32** %arrayinit.begin1106
  %arrayinit.element1107 = getelementptr inbounds i32** %arrayinit.begin1106, i64 1
  %arrayidx1108 = getelementptr inbounds [9 x i32]* %l_1352, i32 0, i64 7
  store i32* %arrayidx1108, i32** %arrayinit.element1107
  %arrayinit.element1109 = getelementptr inbounds [10 x [2 x i32*]]* %arrayinit.begin1068, i64 1
  %arrayinit.begin1110 = getelementptr inbounds [10 x [2 x i32*]]* %arrayinit.element1109, i64 0, i64 0
  %arrayinit.begin1111 = getelementptr inbounds [2 x i32*]* %arrayinit.begin1110, i64 0, i64 0
  store i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 4, i64 0, i64 1), i32** %arrayinit.begin1111
  %arrayinit.element1112 = getelementptr inbounds i32** %arrayinit.begin1111, i64 1
  %arrayidx1113 = getelementptr inbounds [9 x i32]* %l_1352, i32 0, i64 7
  store i32* %arrayidx1113, i32** %arrayinit.element1112
  %arrayinit.element1114 = getelementptr inbounds [2 x i32*]* %arrayinit.begin1110, i64 1
  %arrayinit.begin1115 = getelementptr inbounds [2 x i32*]* %arrayinit.element1114, i64 0, i64 0
  store i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 4, i64 0, i64 1), i32** %arrayinit.begin1115
  %arrayinit.element1116 = getelementptr inbounds i32** %arrayinit.begin1115, i64 1
  %arrayidx1117 = getelementptr inbounds [9 x i32]* %l_1352, i32 0, i64 7
  store i32* %arrayidx1117, i32** %arrayinit.element1116
  %arrayinit.element1118 = getelementptr inbounds [2 x i32*]* %arrayinit.element1114, i64 1
  %arrayinit.begin1119 = getelementptr inbounds [2 x i32*]* %arrayinit.element1118, i64 0, i64 0
  store i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 4, i64 0, i64 1), i32** %arrayinit.begin1119
  %arrayinit.element1120 = getelementptr inbounds i32** %arrayinit.begin1119, i64 1
  %arrayidx1121 = getelementptr inbounds [9 x i32]* %l_1352, i32 0, i64 7
  store i32* %arrayidx1121, i32** %arrayinit.element1120
  %arrayinit.element1122 = getelementptr inbounds [2 x i32*]* %arrayinit.element1118, i64 1
  %arrayinit.begin1123 = getelementptr inbounds [2 x i32*]* %arrayinit.element1122, i64 0, i64 0
  store i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 4, i64 0, i64 1), i32** %arrayinit.begin1123
  %arrayinit.element1124 = getelementptr inbounds i32** %arrayinit.begin1123, i64 1
  %arrayidx1125 = getelementptr inbounds [9 x i32]* %l_1352, i32 0, i64 7
  store i32* %arrayidx1125, i32** %arrayinit.element1124
  %arrayinit.element1126 = getelementptr inbounds [2 x i32*]* %arrayinit.element1122, i64 1
  %arrayinit.begin1127 = getelementptr inbounds [2 x i32*]* %arrayinit.element1126, i64 0, i64 0
  store i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 4, i64 0, i64 1), i32** %arrayinit.begin1127
  %arrayinit.element1128 = getelementptr inbounds i32** %arrayinit.begin1127, i64 1
  %arrayidx1129 = getelementptr inbounds [9 x i32]* %l_1352, i32 0, i64 7
  store i32* %arrayidx1129, i32** %arrayinit.element1128
  %arrayinit.element1130 = getelementptr inbounds [2 x i32*]* %arrayinit.element1126, i64 1
  %arrayinit.begin1131 = getelementptr inbounds [2 x i32*]* %arrayinit.element1130, i64 0, i64 0
  store i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 4, i64 0, i64 1), i32** %arrayinit.begin1131
  %arrayinit.element1132 = getelementptr inbounds i32** %arrayinit.begin1131, i64 1
  %arrayidx1133 = getelementptr inbounds [9 x i32]* %l_1352, i32 0, i64 7
  store i32* %arrayidx1133, i32** %arrayinit.element1132
  %arrayinit.element1134 = getelementptr inbounds [2 x i32*]* %arrayinit.element1130, i64 1
  %arrayinit.begin1135 = getelementptr inbounds [2 x i32*]* %arrayinit.element1134, i64 0, i64 0
  store i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 4, i64 0, i64 1), i32** %arrayinit.begin1135
  %arrayinit.element1136 = getelementptr inbounds i32** %arrayinit.begin1135, i64 1
  %arrayidx1137 = getelementptr inbounds [9 x i32]* %l_1352, i32 0, i64 7
  store i32* %arrayidx1137, i32** %arrayinit.element1136
  %arrayinit.element1138 = getelementptr inbounds [2 x i32*]* %arrayinit.element1134, i64 1
  %arrayinit.begin1139 = getelementptr inbounds [2 x i32*]* %arrayinit.element1138, i64 0, i64 0
  store i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 4, i64 0, i64 1), i32** %arrayinit.begin1139
  %arrayinit.element1140 = getelementptr inbounds i32** %arrayinit.begin1139, i64 1
  %arrayidx1141 = getelementptr inbounds [9 x i32]* %l_1352, i32 0, i64 7
  store i32* %arrayidx1141, i32** %arrayinit.element1140
  %arrayinit.element1142 = getelementptr inbounds [2 x i32*]* %arrayinit.element1138, i64 1
  %arrayinit.begin1143 = getelementptr inbounds [2 x i32*]* %arrayinit.element1142, i64 0, i64 0
  store i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 4, i64 0, i64 1), i32** %arrayinit.begin1143
  %arrayinit.element1144 = getelementptr inbounds i32** %arrayinit.begin1143, i64 1
  %arrayidx1145 = getelementptr inbounds [9 x i32]* %l_1352, i32 0, i64 7
  store i32* %arrayidx1145, i32** %arrayinit.element1144
  %arrayinit.element1146 = getelementptr inbounds [2 x i32*]* %arrayinit.element1142, i64 1
  %arrayinit.begin1147 = getelementptr inbounds [2 x i32*]* %arrayinit.element1146, i64 0, i64 0
  store i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 4, i64 0, i64 1), i32** %arrayinit.begin1147
  %arrayinit.element1148 = getelementptr inbounds i32** %arrayinit.begin1147, i64 1
  %arrayidx1149 = getelementptr inbounds [9 x i32]* %l_1352, i32 0, i64 7
  store i32* %arrayidx1149, i32** %arrayinit.element1148
  %arrayinit.element1150 = getelementptr inbounds [10 x [2 x i32*]]* %arrayinit.element1109, i64 1
  %arrayinit.begin1151 = getelementptr inbounds [10 x [2 x i32*]]* %arrayinit.element1150, i64 0, i64 0
  %arrayinit.begin1152 = getelementptr inbounds [2 x i32*]* %arrayinit.begin1151, i64 0, i64 0
  store i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 4, i64 0, i64 1), i32** %arrayinit.begin1152
  %arrayinit.element1153 = getelementptr inbounds i32** %arrayinit.begin1152, i64 1
  %arrayidx1154 = getelementptr inbounds [9 x i32]* %l_1352, i32 0, i64 7
  store i32* %arrayidx1154, i32** %arrayinit.element1153
  %arrayinit.element1155 = getelementptr inbounds [2 x i32*]* %arrayinit.begin1151, i64 1
  %arrayinit.begin1156 = getelementptr inbounds [2 x i32*]* %arrayinit.element1155, i64 0, i64 0
  store i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 4, i64 0, i64 1), i32** %arrayinit.begin1156
  %arrayinit.element1157 = getelementptr inbounds i32** %arrayinit.begin1156, i64 1
  %arrayidx1158 = getelementptr inbounds [9 x i32]* %l_1352, i32 0, i64 7
  store i32* %arrayidx1158, i32** %arrayinit.element1157
  %arrayinit.element1159 = getelementptr inbounds [2 x i32*]* %arrayinit.element1155, i64 1
  %arrayinit.begin1160 = getelementptr inbounds [2 x i32*]* %arrayinit.element1159, i64 0, i64 0
  store i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 4, i64 0, i64 1), i32** %arrayinit.begin1160
  %arrayinit.element1161 = getelementptr inbounds i32** %arrayinit.begin1160, i64 1
  %arrayidx1162 = getelementptr inbounds [9 x i32]* %l_1352, i32 0, i64 7
  store i32* %arrayidx1162, i32** %arrayinit.element1161
  %arrayinit.element1163 = getelementptr inbounds [2 x i32*]* %arrayinit.element1159, i64 1
  %arrayinit.begin1164 = getelementptr inbounds [2 x i32*]* %arrayinit.element1163, i64 0, i64 0
  store i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 4, i64 0, i64 1), i32** %arrayinit.begin1164
  %arrayinit.element1165 = getelementptr inbounds i32** %arrayinit.begin1164, i64 1
  %arrayidx1166 = getelementptr inbounds [9 x i32]* %l_1352, i32 0, i64 7
  store i32* %arrayidx1166, i32** %arrayinit.element1165
  %arrayinit.element1167 = getelementptr inbounds [2 x i32*]* %arrayinit.element1163, i64 1
  %arrayinit.begin1168 = getelementptr inbounds [2 x i32*]* %arrayinit.element1167, i64 0, i64 0
  store i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 4, i64 0, i64 1), i32** %arrayinit.begin1168
  %arrayinit.element1169 = getelementptr inbounds i32** %arrayinit.begin1168, i64 1
  %arrayidx1170 = getelementptr inbounds [9 x i32]* %l_1352, i32 0, i64 7
  store i32* %arrayidx1170, i32** %arrayinit.element1169
  %arrayinit.element1171 = getelementptr inbounds [2 x i32*]* %arrayinit.element1167, i64 1
  %arrayinit.begin1172 = getelementptr inbounds [2 x i32*]* %arrayinit.element1171, i64 0, i64 0
  store i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 4, i64 0, i64 1), i32** %arrayinit.begin1172
  %arrayinit.element1173 = getelementptr inbounds i32** %arrayinit.begin1172, i64 1
  %arrayidx1174 = getelementptr inbounds [9 x i32]* %l_1352, i32 0, i64 7
  store i32* %arrayidx1174, i32** %arrayinit.element1173
  %arrayinit.element1175 = getelementptr inbounds [2 x i32*]* %arrayinit.element1171, i64 1
  %arrayinit.begin1176 = getelementptr inbounds [2 x i32*]* %arrayinit.element1175, i64 0, i64 0
  store i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 4, i64 0, i64 1), i32** %arrayinit.begin1176
  %arrayinit.element1177 = getelementptr inbounds i32** %arrayinit.begin1176, i64 1
  %arrayidx1178 = getelementptr inbounds [9 x i32]* %l_1352, i32 0, i64 7
  store i32* %arrayidx1178, i32** %arrayinit.element1177
  %arrayinit.element1179 = getelementptr inbounds [2 x i32*]* %arrayinit.element1175, i64 1
  %arrayinit.begin1180 = getelementptr inbounds [2 x i32*]* %arrayinit.element1179, i64 0, i64 0
  store i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 4, i64 0, i64 1), i32** %arrayinit.begin1180
  %arrayinit.element1181 = getelementptr inbounds i32** %arrayinit.begin1180, i64 1
  %arrayidx1182 = getelementptr inbounds [9 x i32]* %l_1352, i32 0, i64 7
  store i32* %arrayidx1182, i32** %arrayinit.element1181
  %arrayinit.element1183 = getelementptr inbounds [2 x i32*]* %arrayinit.element1179, i64 1
  %arrayinit.begin1184 = getelementptr inbounds [2 x i32*]* %arrayinit.element1183, i64 0, i64 0
  store i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 4, i64 0, i64 1), i32** %arrayinit.begin1184
  %arrayinit.element1185 = getelementptr inbounds i32** %arrayinit.begin1184, i64 1
  %arrayidx1186 = getelementptr inbounds [9 x i32]* %l_1352, i32 0, i64 7
  store i32* %arrayidx1186, i32** %arrayinit.element1185
  %arrayinit.element1187 = getelementptr inbounds [2 x i32*]* %arrayinit.element1183, i64 1
  %arrayinit.begin1188 = getelementptr inbounds [2 x i32*]* %arrayinit.element1187, i64 0, i64 0
  store i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 4, i64 0, i64 1), i32** %arrayinit.begin1188
  %arrayinit.element1189 = getelementptr inbounds i32** %arrayinit.begin1188, i64 1
  %arrayidx1190 = getelementptr inbounds [9 x i32]* %l_1352, i32 0, i64 7
  store i32* %arrayidx1190, i32** %arrayinit.element1189
  %arrayinit.element1191 = getelementptr inbounds [10 x [2 x i32*]]* %arrayinit.element1150, i64 1
  %arrayinit.begin1192 = getelementptr inbounds [10 x [2 x i32*]]* %arrayinit.element1191, i64 0, i64 0
  %arrayinit.begin1193 = getelementptr inbounds [2 x i32*]* %arrayinit.begin1192, i64 0, i64 0
  store i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 4, i64 0, i64 1), i32** %arrayinit.begin1193
  %arrayinit.element1194 = getelementptr inbounds i32** %arrayinit.begin1193, i64 1
  %arrayidx1195 = getelementptr inbounds [9 x i32]* %l_1352, i32 0, i64 7
  store i32* %arrayidx1195, i32** %arrayinit.element1194
  %arrayinit.element1196 = getelementptr inbounds [2 x i32*]* %arrayinit.begin1192, i64 1
  %arrayinit.begin1197 = getelementptr inbounds [2 x i32*]* %arrayinit.element1196, i64 0, i64 0
  store i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 4, i64 0, i64 1), i32** %arrayinit.begin1197
  %arrayinit.element1198 = getelementptr inbounds i32** %arrayinit.begin1197, i64 1
  %arrayidx1199 = getelementptr inbounds [9 x i32]* %l_1352, i32 0, i64 7
  store i32* %arrayidx1199, i32** %arrayinit.element1198
  %arrayinit.element1200 = getelementptr inbounds [2 x i32*]* %arrayinit.element1196, i64 1
  %arrayinit.begin1201 = getelementptr inbounds [2 x i32*]* %arrayinit.element1200, i64 0, i64 0
  store i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 4, i64 0, i64 1), i32** %arrayinit.begin1201
  %arrayinit.element1202 = getelementptr inbounds i32** %arrayinit.begin1201, i64 1
  %arrayidx1203 = getelementptr inbounds [9 x i32]* %l_1352, i32 0, i64 7
  store i32* %arrayidx1203, i32** %arrayinit.element1202
  %arrayinit.element1204 = getelementptr inbounds [2 x i32*]* %arrayinit.element1200, i64 1
  %arrayinit.begin1205 = getelementptr inbounds [2 x i32*]* %arrayinit.element1204, i64 0, i64 0
  store i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 4, i64 0, i64 1), i32** %arrayinit.begin1205
  %arrayinit.element1206 = getelementptr inbounds i32** %arrayinit.begin1205, i64 1
  %arrayidx1207 = getelementptr inbounds [9 x i32]* %l_1352, i32 0, i64 7
  store i32* %arrayidx1207, i32** %arrayinit.element1206
  %arrayinit.element1208 = getelementptr inbounds [2 x i32*]* %arrayinit.element1204, i64 1
  %arrayinit.begin1209 = getelementptr inbounds [2 x i32*]* %arrayinit.element1208, i64 0, i64 0
  store i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 4, i64 0, i64 1), i32** %arrayinit.begin1209
  %arrayinit.element1210 = getelementptr inbounds i32** %arrayinit.begin1209, i64 1
  %arrayidx1211 = getelementptr inbounds [9 x i32]* %l_1352, i32 0, i64 7
  store i32* %arrayidx1211, i32** %arrayinit.element1210
  %arrayinit.element1212 = getelementptr inbounds [2 x i32*]* %arrayinit.element1208, i64 1
  %arrayinit.begin1213 = getelementptr inbounds [2 x i32*]* %arrayinit.element1212, i64 0, i64 0
  store i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 4, i64 0, i64 1), i32** %arrayinit.begin1213
  %arrayinit.element1214 = getelementptr inbounds i32** %arrayinit.begin1213, i64 1
  %arrayidx1215 = getelementptr inbounds [9 x i32]* %l_1352, i32 0, i64 7
  store i32* %arrayidx1215, i32** %arrayinit.element1214
  %arrayinit.element1216 = getelementptr inbounds [2 x i32*]* %arrayinit.element1212, i64 1
  %arrayinit.begin1217 = getelementptr inbounds [2 x i32*]* %arrayinit.element1216, i64 0, i64 0
  store i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 4, i64 0, i64 1), i32** %arrayinit.begin1217
  %arrayinit.element1218 = getelementptr inbounds i32** %arrayinit.begin1217, i64 1
  %arrayidx1219 = getelementptr inbounds [9 x i32]* %l_1352, i32 0, i64 7
  store i32* %arrayidx1219, i32** %arrayinit.element1218
  %arrayinit.element1220 = getelementptr inbounds [2 x i32*]* %arrayinit.element1216, i64 1
  %arrayinit.begin1221 = getelementptr inbounds [2 x i32*]* %arrayinit.element1220, i64 0, i64 0
  store i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 4, i64 0, i64 1), i32** %arrayinit.begin1221
  %arrayinit.element1222 = getelementptr inbounds i32** %arrayinit.begin1221, i64 1
  %arrayidx1223 = getelementptr inbounds [9 x i32]* %l_1352, i32 0, i64 7
  store i32* %arrayidx1223, i32** %arrayinit.element1222
  %arrayinit.element1224 = getelementptr inbounds [2 x i32*]* %arrayinit.element1220, i64 1
  %arrayinit.begin1225 = getelementptr inbounds [2 x i32*]* %arrayinit.element1224, i64 0, i64 0
  store i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 4, i64 0, i64 1), i32** %arrayinit.begin1225
  %arrayinit.element1226 = getelementptr inbounds i32** %arrayinit.begin1225, i64 1
  %arrayidx1227 = getelementptr inbounds [9 x i32]* %l_1352, i32 0, i64 7
  store i32* %arrayidx1227, i32** %arrayinit.element1226
  %arrayinit.element1228 = getelementptr inbounds [2 x i32*]* %arrayinit.element1224, i64 1
  %arrayinit.begin1229 = getelementptr inbounds [2 x i32*]* %arrayinit.element1228, i64 0, i64 0
  store i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 4, i64 0, i64 1), i32** %arrayinit.begin1229
  %arrayinit.element1230 = getelementptr inbounds i32** %arrayinit.begin1229, i64 1
  %arrayidx1231 = getelementptr inbounds [9 x i32]* %l_1352, i32 0, i64 7
  store i32* %arrayidx1231, i32** %arrayinit.element1230
  %arrayinit.element1232 = getelementptr inbounds [10 x [2 x i32*]]* %arrayinit.element1191, i64 1
  %arrayinit.begin1233 = getelementptr inbounds [10 x [2 x i32*]]* %arrayinit.element1232, i64 0, i64 0
  %arrayinit.begin1234 = getelementptr inbounds [2 x i32*]* %arrayinit.begin1233, i64 0, i64 0
  store i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 4, i64 0, i64 1), i32** %arrayinit.begin1234
  %arrayinit.element1235 = getelementptr inbounds i32** %arrayinit.begin1234, i64 1
  %arrayidx1236 = getelementptr inbounds [9 x i32]* %l_1352, i32 0, i64 7
  store i32* %arrayidx1236, i32** %arrayinit.element1235
  %arrayinit.element1237 = getelementptr inbounds [2 x i32*]* %arrayinit.begin1233, i64 1
  %arrayinit.begin1238 = getelementptr inbounds [2 x i32*]* %arrayinit.element1237, i64 0, i64 0
  store i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 4, i64 0, i64 1), i32** %arrayinit.begin1238
  %arrayinit.element1239 = getelementptr inbounds i32** %arrayinit.begin1238, i64 1
  %arrayidx1240 = getelementptr inbounds [9 x i32]* %l_1352, i32 0, i64 7
  store i32* %arrayidx1240, i32** %arrayinit.element1239
  %arrayinit.element1241 = getelementptr inbounds [2 x i32*]* %arrayinit.element1237, i64 1
  %arrayinit.begin1242 = getelementptr inbounds [2 x i32*]* %arrayinit.element1241, i64 0, i64 0
  store i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 4, i64 0, i64 1), i32** %arrayinit.begin1242
  %arrayinit.element1243 = getelementptr inbounds i32** %arrayinit.begin1242, i64 1
  %arrayidx1244 = getelementptr inbounds [9 x i32]* %l_1352, i32 0, i64 7
  store i32* %arrayidx1244, i32** %arrayinit.element1243
  %arrayinit.element1245 = getelementptr inbounds [2 x i32*]* %arrayinit.element1241, i64 1
  %arrayinit.begin1246 = getelementptr inbounds [2 x i32*]* %arrayinit.element1245, i64 0, i64 0
  store i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 4, i64 0, i64 1), i32** %arrayinit.begin1246
  %arrayinit.element1247 = getelementptr inbounds i32** %arrayinit.begin1246, i64 1
  %arrayidx1248 = getelementptr inbounds [9 x i32]* %l_1352, i32 0, i64 7
  store i32* %arrayidx1248, i32** %arrayinit.element1247
  %arrayinit.element1249 = getelementptr inbounds [2 x i32*]* %arrayinit.element1245, i64 1
  %arrayinit.begin1250 = getelementptr inbounds [2 x i32*]* %arrayinit.element1249, i64 0, i64 0
  store i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 4, i64 0, i64 1), i32** %arrayinit.begin1250
  %arrayinit.element1251 = getelementptr inbounds i32** %arrayinit.begin1250, i64 1
  %arrayidx1252 = getelementptr inbounds [9 x i32]* %l_1352, i32 0, i64 7
  store i32* %arrayidx1252, i32** %arrayinit.element1251
  %arrayinit.element1253 = getelementptr inbounds [2 x i32*]* %arrayinit.element1249, i64 1
  %arrayinit.begin1254 = getelementptr inbounds [2 x i32*]* %arrayinit.element1253, i64 0, i64 0
  store i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 4, i64 0, i64 1), i32** %arrayinit.begin1254
  %arrayinit.element1255 = getelementptr inbounds i32** %arrayinit.begin1254, i64 1
  %arrayidx1256 = getelementptr inbounds [9 x i32]* %l_1352, i32 0, i64 7
  store i32* %arrayidx1256, i32** %arrayinit.element1255
  %arrayinit.element1257 = getelementptr inbounds [2 x i32*]* %arrayinit.element1253, i64 1
  %arrayinit.begin1258 = getelementptr inbounds [2 x i32*]* %arrayinit.element1257, i64 0, i64 0
  store i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 4, i64 0, i64 1), i32** %arrayinit.begin1258
  %arrayinit.element1259 = getelementptr inbounds i32** %arrayinit.begin1258, i64 1
  %arrayidx1260 = getelementptr inbounds [9 x i32]* %l_1352, i32 0, i64 7
  store i32* %arrayidx1260, i32** %arrayinit.element1259
  %arrayinit.element1261 = getelementptr inbounds [2 x i32*]* %arrayinit.element1257, i64 1
  %arrayinit.begin1262 = getelementptr inbounds [2 x i32*]* %arrayinit.element1261, i64 0, i64 0
  store i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 4, i64 0, i64 1), i32** %arrayinit.begin1262
  %arrayinit.element1263 = getelementptr inbounds i32** %arrayinit.begin1262, i64 1
  %arrayidx1264 = getelementptr inbounds [9 x i32]* %l_1352, i32 0, i64 7
  store i32* %arrayidx1264, i32** %arrayinit.element1263
  %arrayinit.element1265 = getelementptr inbounds [2 x i32*]* %arrayinit.element1261, i64 1
  %arrayinit.begin1266 = getelementptr inbounds [2 x i32*]* %arrayinit.element1265, i64 0, i64 0
  store i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 4, i64 0, i64 1), i32** %arrayinit.begin1266
  %arrayinit.element1267 = getelementptr inbounds i32** %arrayinit.begin1266, i64 1
  %arrayidx1268 = getelementptr inbounds [9 x i32]* %l_1352, i32 0, i64 7
  store i32* %arrayidx1268, i32** %arrayinit.element1267
  %arrayinit.element1269 = getelementptr inbounds [2 x i32*]* %arrayinit.element1265, i64 1
  %arrayinit.begin1270 = getelementptr inbounds [2 x i32*]* %arrayinit.element1269, i64 0, i64 0
  store i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 4, i64 0, i64 1), i32** %arrayinit.begin1270
  %arrayinit.element1271 = getelementptr inbounds i32** %arrayinit.begin1270, i64 1
  %arrayidx1272 = getelementptr inbounds [9 x i32]* %l_1352, i32 0, i64 7
  store i32* %arrayidx1272, i32** %arrayinit.element1271
  %arrayinit.element1273 = getelementptr inbounds [10 x [2 x i32*]]* %arrayinit.element1232, i64 1
  %arrayinit.begin1274 = getelementptr inbounds [10 x [2 x i32*]]* %arrayinit.element1273, i64 0, i64 0
  %arrayinit.begin1275 = getelementptr inbounds [2 x i32*]* %arrayinit.begin1274, i64 0, i64 0
  store i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 4, i64 0, i64 1), i32** %arrayinit.begin1275
  %arrayinit.element1276 = getelementptr inbounds i32** %arrayinit.begin1275, i64 1
  %arrayidx1277 = getelementptr inbounds [9 x i32]* %l_1352, i32 0, i64 7
  store i32* %arrayidx1277, i32** %arrayinit.element1276
  %arrayinit.element1278 = getelementptr inbounds [2 x i32*]* %arrayinit.begin1274, i64 1
  %arrayinit.begin1279 = getelementptr inbounds [2 x i32*]* %arrayinit.element1278, i64 0, i64 0
  store i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 4, i64 0, i64 1), i32** %arrayinit.begin1279
  %arrayinit.element1280 = getelementptr inbounds i32** %arrayinit.begin1279, i64 1
  %arrayidx1281 = getelementptr inbounds [9 x i32]* %l_1352, i32 0, i64 7
  store i32* %arrayidx1281, i32** %arrayinit.element1280
  %arrayinit.element1282 = getelementptr inbounds [2 x i32*]* %arrayinit.element1278, i64 1
  %arrayinit.begin1283 = getelementptr inbounds [2 x i32*]* %arrayinit.element1282, i64 0, i64 0
  store i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 4, i64 0, i64 1), i32** %arrayinit.begin1283
  %arrayinit.element1284 = getelementptr inbounds i32** %arrayinit.begin1283, i64 1
  %arrayidx1285 = getelementptr inbounds [9 x i32]* %l_1352, i32 0, i64 7
  store i32* %arrayidx1285, i32** %arrayinit.element1284
  %arrayinit.element1286 = getelementptr inbounds [2 x i32*]* %arrayinit.element1282, i64 1
  %arrayinit.begin1287 = getelementptr inbounds [2 x i32*]* %arrayinit.element1286, i64 0, i64 0
  store i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 4, i64 0, i64 1), i32** %arrayinit.begin1287
  %arrayinit.element1288 = getelementptr inbounds i32** %arrayinit.begin1287, i64 1
  %arrayidx1289 = getelementptr inbounds [9 x i32]* %l_1352, i32 0, i64 7
  store i32* %arrayidx1289, i32** %arrayinit.element1288
  %arrayinit.element1290 = getelementptr inbounds [2 x i32*]* %arrayinit.element1286, i64 1
  %arrayinit.begin1291 = getelementptr inbounds [2 x i32*]* %arrayinit.element1290, i64 0, i64 0
  store i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 4, i64 0, i64 1), i32** %arrayinit.begin1291
  %arrayinit.element1292 = getelementptr inbounds i32** %arrayinit.begin1291, i64 1
  %arrayidx1293 = getelementptr inbounds [9 x i32]* %l_1352, i32 0, i64 7
  store i32* %arrayidx1293, i32** %arrayinit.element1292
  %arrayinit.element1294 = getelementptr inbounds [2 x i32*]* %arrayinit.element1290, i64 1
  %arrayinit.begin1295 = getelementptr inbounds [2 x i32*]* %arrayinit.element1294, i64 0, i64 0
  store i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 4, i64 0, i64 1), i32** %arrayinit.begin1295
  %arrayinit.element1296 = getelementptr inbounds i32** %arrayinit.begin1295, i64 1
  %arrayidx1297 = getelementptr inbounds [9 x i32]* %l_1352, i32 0, i64 7
  store i32* %arrayidx1297, i32** %arrayinit.element1296
  %arrayinit.element1298 = getelementptr inbounds [2 x i32*]* %arrayinit.element1294, i64 1
  %arrayinit.begin1299 = getelementptr inbounds [2 x i32*]* %arrayinit.element1298, i64 0, i64 0
  store i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 4, i64 0, i64 1), i32** %arrayinit.begin1299
  %arrayinit.element1300 = getelementptr inbounds i32** %arrayinit.begin1299, i64 1
  %arrayidx1301 = getelementptr inbounds [9 x i32]* %l_1352, i32 0, i64 7
  store i32* %arrayidx1301, i32** %arrayinit.element1300
  %arrayinit.element1302 = getelementptr inbounds [2 x i32*]* %arrayinit.element1298, i64 1
  %arrayinit.begin1303 = getelementptr inbounds [2 x i32*]* %arrayinit.element1302, i64 0, i64 0
  store i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 4, i64 0, i64 1), i32** %arrayinit.begin1303
  %arrayinit.element1304 = getelementptr inbounds i32** %arrayinit.begin1303, i64 1
  %arrayidx1305 = getelementptr inbounds [9 x i32]* %l_1352, i32 0, i64 7
  store i32* %arrayidx1305, i32** %arrayinit.element1304
  %arrayinit.element1306 = getelementptr inbounds [2 x i32*]* %arrayinit.element1302, i64 1
  %arrayinit.begin1307 = getelementptr inbounds [2 x i32*]* %arrayinit.element1306, i64 0, i64 0
  store i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 4, i64 0, i64 1), i32** %arrayinit.begin1307
  %arrayinit.element1308 = getelementptr inbounds i32** %arrayinit.begin1307, i64 1
  %arrayidx1309 = getelementptr inbounds [9 x i32]* %l_1352, i32 0, i64 7
  store i32* %arrayidx1309, i32** %arrayinit.element1308
  %arrayinit.element1310 = getelementptr inbounds [2 x i32*]* %arrayinit.element1306, i64 1
  %arrayinit.begin1311 = getelementptr inbounds [2 x i32*]* %arrayinit.element1310, i64 0, i64 0
  store i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 4, i64 0, i64 1), i32** %arrayinit.begin1311
  %arrayinit.element1312 = getelementptr inbounds i32** %arrayinit.begin1311, i64 1
  %arrayidx1313 = getelementptr inbounds [9 x i32]* %l_1352, i32 0, i64 7
  store i32* %arrayidx1313, i32** %arrayinit.element1312
  %arrayinit.element1314 = getelementptr inbounds [10 x [2 x i32*]]* %arrayinit.element1273, i64 1
  %arrayinit.begin1315 = getelementptr inbounds [10 x [2 x i32*]]* %arrayinit.element1314, i64 0, i64 0
  %arrayinit.begin1316 = getelementptr inbounds [2 x i32*]* %arrayinit.begin1315, i64 0, i64 0
  store i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 4, i64 0, i64 1), i32** %arrayinit.begin1316
  %arrayinit.element1317 = getelementptr inbounds i32** %arrayinit.begin1316, i64 1
  %arrayidx1318 = getelementptr inbounds [9 x i32]* %l_1352, i32 0, i64 7
  store i32* %arrayidx1318, i32** %arrayinit.element1317
  %arrayinit.element1319 = getelementptr inbounds [2 x i32*]* %arrayinit.begin1315, i64 1
  %arrayinit.begin1320 = getelementptr inbounds [2 x i32*]* %arrayinit.element1319, i64 0, i64 0
  store i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 4, i64 0, i64 1), i32** %arrayinit.begin1320
  %arrayinit.element1321 = getelementptr inbounds i32** %arrayinit.begin1320, i64 1
  %arrayidx1322 = getelementptr inbounds [9 x i32]* %l_1352, i32 0, i64 7
  store i32* %arrayidx1322, i32** %arrayinit.element1321
  %arrayinit.element1323 = getelementptr inbounds [2 x i32*]* %arrayinit.element1319, i64 1
  %arrayinit.begin1324 = getelementptr inbounds [2 x i32*]* %arrayinit.element1323, i64 0, i64 0
  store i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 4, i64 0, i64 1), i32** %arrayinit.begin1324
  %arrayinit.element1325 = getelementptr inbounds i32** %arrayinit.begin1324, i64 1
  %arrayidx1326 = getelementptr inbounds [9 x i32]* %l_1352, i32 0, i64 7
  store i32* %arrayidx1326, i32** %arrayinit.element1325
  %arrayinit.element1327 = getelementptr inbounds [2 x i32*]* %arrayinit.element1323, i64 1
  %arrayinit.begin1328 = getelementptr inbounds [2 x i32*]* %arrayinit.element1327, i64 0, i64 0
  store i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 4, i64 0, i64 1), i32** %arrayinit.begin1328
  %arrayinit.element1329 = getelementptr inbounds i32** %arrayinit.begin1328, i64 1
  %arrayidx1330 = getelementptr inbounds [9 x i32]* %l_1352, i32 0, i64 7
  store i32* %arrayidx1330, i32** %arrayinit.element1329
  %arrayinit.element1331 = getelementptr inbounds [2 x i32*]* %arrayinit.element1327, i64 1
  %arrayinit.begin1332 = getelementptr inbounds [2 x i32*]* %arrayinit.element1331, i64 0, i64 0
  store i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 4, i64 0, i64 1), i32** %arrayinit.begin1332
  %arrayinit.element1333 = getelementptr inbounds i32** %arrayinit.begin1332, i64 1
  %arrayidx1334 = getelementptr inbounds [9 x i32]* %l_1352, i32 0, i64 7
  store i32* %arrayidx1334, i32** %arrayinit.element1333
  %arrayinit.element1335 = getelementptr inbounds [2 x i32*]* %arrayinit.element1331, i64 1
  %arrayinit.begin1336 = getelementptr inbounds [2 x i32*]* %arrayinit.element1335, i64 0, i64 0
  store i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 4, i64 0, i64 1), i32** %arrayinit.begin1336
  %arrayinit.element1337 = getelementptr inbounds i32** %arrayinit.begin1336, i64 1
  %arrayidx1338 = getelementptr inbounds [9 x i32]* %l_1352, i32 0, i64 7
  store i32* %arrayidx1338, i32** %arrayinit.element1337
  %arrayinit.element1339 = getelementptr inbounds [2 x i32*]* %arrayinit.element1335, i64 1
  %arrayinit.begin1340 = getelementptr inbounds [2 x i32*]* %arrayinit.element1339, i64 0, i64 0
  store i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 4, i64 0, i64 1), i32** %arrayinit.begin1340
  %arrayinit.element1341 = getelementptr inbounds i32** %arrayinit.begin1340, i64 1
  %arrayidx1342 = getelementptr inbounds [9 x i32]* %l_1352, i32 0, i64 7
  store i32* %arrayidx1342, i32** %arrayinit.element1341
  %arrayinit.element1343 = getelementptr inbounds [2 x i32*]* %arrayinit.element1339, i64 1
  %arrayinit.begin1344 = getelementptr inbounds [2 x i32*]* %arrayinit.element1343, i64 0, i64 0
  store i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 4, i64 0, i64 1), i32** %arrayinit.begin1344
  %arrayinit.element1345 = getelementptr inbounds i32** %arrayinit.begin1344, i64 1
  %arrayidx1346 = getelementptr inbounds [9 x i32]* %l_1352, i32 0, i64 7
  store i32* %arrayidx1346, i32** %arrayinit.element1345
  %arrayinit.element1347 = getelementptr inbounds [2 x i32*]* %arrayinit.element1343, i64 1
  %arrayinit.begin1348 = getelementptr inbounds [2 x i32*]* %arrayinit.element1347, i64 0, i64 0
  store i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 4, i64 0, i64 1), i32** %arrayinit.begin1348
  %arrayinit.element1349 = getelementptr inbounds i32** %arrayinit.begin1348, i64 1
  %arrayidx1350 = getelementptr inbounds [9 x i32]* %l_1352, i32 0, i64 7
  store i32* %arrayidx1350, i32** %arrayinit.element1349
  %arrayinit.element1351 = getelementptr inbounds [2 x i32*]* %arrayinit.element1347, i64 1
  %arrayinit.begin1352 = getelementptr inbounds [2 x i32*]* %arrayinit.element1351, i64 0, i64 0
  store i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 4, i64 0, i64 1), i32** %arrayinit.begin1352
  %arrayinit.element1353 = getelementptr inbounds i32** %arrayinit.begin1352, i64 1
  %arrayidx1354 = getelementptr inbounds [9 x i32]* %l_1352, i32 0, i64 7
  store i32* %arrayidx1354, i32** %arrayinit.element1353
  %arrayinit.element1355 = getelementptr inbounds [10 x [2 x i32*]]* %arrayinit.element1314, i64 1
  %arrayinit.begin1356 = getelementptr inbounds [10 x [2 x i32*]]* %arrayinit.element1355, i64 0, i64 0
  %arrayinit.begin1357 = getelementptr inbounds [2 x i32*]* %arrayinit.begin1356, i64 0, i64 0
  store i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 4, i64 0, i64 1), i32** %arrayinit.begin1357
  %arrayinit.element1358 = getelementptr inbounds i32** %arrayinit.begin1357, i64 1
  %arrayidx1359 = getelementptr inbounds [9 x i32]* %l_1352, i32 0, i64 7
  store i32* %arrayidx1359, i32** %arrayinit.element1358
  %arrayinit.element1360 = getelementptr inbounds [2 x i32*]* %arrayinit.begin1356, i64 1
  %arrayinit.begin1361 = getelementptr inbounds [2 x i32*]* %arrayinit.element1360, i64 0, i64 0
  store i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 4, i64 0, i64 1), i32** %arrayinit.begin1361
  %arrayinit.element1362 = getelementptr inbounds i32** %arrayinit.begin1361, i64 1
  %arrayidx1363 = getelementptr inbounds [9 x i32]* %l_1352, i32 0, i64 7
  store i32* %arrayidx1363, i32** %arrayinit.element1362
  %arrayinit.element1364 = getelementptr inbounds [2 x i32*]* %arrayinit.element1360, i64 1
  %arrayinit.begin1365 = getelementptr inbounds [2 x i32*]* %arrayinit.element1364, i64 0, i64 0
  store i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 4, i64 0, i64 1), i32** %arrayinit.begin1365
  %arrayinit.element1366 = getelementptr inbounds i32** %arrayinit.begin1365, i64 1
  %arrayidx1367 = getelementptr inbounds [9 x i32]* %l_1352, i32 0, i64 7
  store i32* %arrayidx1367, i32** %arrayinit.element1366
  %arrayinit.element1368 = getelementptr inbounds [2 x i32*]* %arrayinit.element1364, i64 1
  %arrayinit.begin1369 = getelementptr inbounds [2 x i32*]* %arrayinit.element1368, i64 0, i64 0
  store i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 4, i64 0, i64 1), i32** %arrayinit.begin1369
  %arrayinit.element1370 = getelementptr inbounds i32** %arrayinit.begin1369, i64 1
  %arrayidx1371 = getelementptr inbounds [9 x i32]* %l_1352, i32 0, i64 7
  store i32* %arrayidx1371, i32** %arrayinit.element1370
  %arrayinit.element1372 = getelementptr inbounds [2 x i32*]* %arrayinit.element1368, i64 1
  %arrayinit.begin1373 = getelementptr inbounds [2 x i32*]* %arrayinit.element1372, i64 0, i64 0
  store i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 4, i64 0, i64 1), i32** %arrayinit.begin1373
  %arrayinit.element1374 = getelementptr inbounds i32** %arrayinit.begin1373, i64 1
  %arrayidx1375 = getelementptr inbounds [9 x i32]* %l_1352, i32 0, i64 7
  store i32* %arrayidx1375, i32** %arrayinit.element1374
  %arrayinit.element1376 = getelementptr inbounds [2 x i32*]* %arrayinit.element1372, i64 1
  %arrayinit.begin1377 = getelementptr inbounds [2 x i32*]* %arrayinit.element1376, i64 0, i64 0
  store i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 4, i64 0, i64 1), i32** %arrayinit.begin1377
  %arrayinit.element1378 = getelementptr inbounds i32** %arrayinit.begin1377, i64 1
  %arrayidx1379 = getelementptr inbounds [9 x i32]* %l_1352, i32 0, i64 7
  store i32* %arrayidx1379, i32** %arrayinit.element1378
  %arrayinit.element1380 = getelementptr inbounds [2 x i32*]* %arrayinit.element1376, i64 1
  %arrayinit.begin1381 = getelementptr inbounds [2 x i32*]* %arrayinit.element1380, i64 0, i64 0
  store i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 4, i64 0, i64 1), i32** %arrayinit.begin1381
  %arrayinit.element1382 = getelementptr inbounds i32** %arrayinit.begin1381, i64 1
  %arrayidx1383 = getelementptr inbounds [9 x i32]* %l_1352, i32 0, i64 7
  store i32* %arrayidx1383, i32** %arrayinit.element1382
  %arrayinit.element1384 = getelementptr inbounds [2 x i32*]* %arrayinit.element1380, i64 1
  %arrayinit.begin1385 = getelementptr inbounds [2 x i32*]* %arrayinit.element1384, i64 0, i64 0
  store i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 4, i64 0, i64 1), i32** %arrayinit.begin1385
  %arrayinit.element1386 = getelementptr inbounds i32** %arrayinit.begin1385, i64 1
  %arrayidx1387 = getelementptr inbounds [9 x i32]* %l_1352, i32 0, i64 7
  store i32* %arrayidx1387, i32** %arrayinit.element1386
  %arrayinit.element1388 = getelementptr inbounds [2 x i32*]* %arrayinit.element1384, i64 1
  %arrayinit.begin1389 = getelementptr inbounds [2 x i32*]* %arrayinit.element1388, i64 0, i64 0
  store i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 4, i64 0, i64 1), i32** %arrayinit.begin1389
  %arrayinit.element1390 = getelementptr inbounds i32** %arrayinit.begin1389, i64 1
  %arrayidx1391 = getelementptr inbounds [9 x i32]* %l_1352, i32 0, i64 7
  store i32* %arrayidx1391, i32** %arrayinit.element1390
  %arrayinit.element1392 = getelementptr inbounds [2 x i32*]* %arrayinit.element1388, i64 1
  %arrayinit.begin1393 = getelementptr inbounds [2 x i32*]* %arrayinit.element1392, i64 0, i64 0
  store i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 4, i64 0, i64 1), i32** %arrayinit.begin1393
  %arrayinit.element1394 = getelementptr inbounds i32** %arrayinit.begin1393, i64 1
  %arrayidx1395 = getelementptr inbounds [9 x i32]* %l_1352, i32 0, i64 7
  store i32* %arrayidx1395, i32** %arrayinit.element1394
  %arrayinit.element1396 = getelementptr inbounds [10 x [2 x i32*]]* %arrayinit.element1355, i64 1
  %arrayinit.begin1397 = getelementptr inbounds [10 x [2 x i32*]]* %arrayinit.element1396, i64 0, i64 0
  %arrayinit.begin1398 = getelementptr inbounds [2 x i32*]* %arrayinit.begin1397, i64 0, i64 0
  store i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 4, i64 0, i64 1), i32** %arrayinit.begin1398
  %arrayinit.element1399 = getelementptr inbounds i32** %arrayinit.begin1398, i64 1
  %arrayidx1400 = getelementptr inbounds [9 x i32]* %l_1352, i32 0, i64 7
  store i32* %arrayidx1400, i32** %arrayinit.element1399
  %arrayinit.element1401 = getelementptr inbounds [2 x i32*]* %arrayinit.begin1397, i64 1
  %arrayinit.begin1402 = getelementptr inbounds [2 x i32*]* %arrayinit.element1401, i64 0, i64 0
  store i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 4, i64 0, i64 1), i32** %arrayinit.begin1402
  %arrayinit.element1403 = getelementptr inbounds i32** %arrayinit.begin1402, i64 1
  %arrayidx1404 = getelementptr inbounds [9 x i32]* %l_1352, i32 0, i64 7
  store i32* %arrayidx1404, i32** %arrayinit.element1403
  %arrayinit.element1405 = getelementptr inbounds [2 x i32*]* %arrayinit.element1401, i64 1
  %arrayinit.begin1406 = getelementptr inbounds [2 x i32*]* %arrayinit.element1405, i64 0, i64 0
  store i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 4, i64 0, i64 1), i32** %arrayinit.begin1406
  %arrayinit.element1407 = getelementptr inbounds i32** %arrayinit.begin1406, i64 1
  %arrayidx1408 = getelementptr inbounds [9 x i32]* %l_1352, i32 0, i64 7
  store i32* %arrayidx1408, i32** %arrayinit.element1407
  %arrayinit.element1409 = getelementptr inbounds [2 x i32*]* %arrayinit.element1405, i64 1
  %arrayinit.begin1410 = getelementptr inbounds [2 x i32*]* %arrayinit.element1409, i64 0, i64 0
  store i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 4, i64 0, i64 1), i32** %arrayinit.begin1410
  %arrayinit.element1411 = getelementptr inbounds i32** %arrayinit.begin1410, i64 1
  %arrayidx1412 = getelementptr inbounds [9 x i32]* %l_1352, i32 0, i64 7
  store i32* %arrayidx1412, i32** %arrayinit.element1411
  %arrayinit.element1413 = getelementptr inbounds [2 x i32*]* %arrayinit.element1409, i64 1
  %arrayinit.begin1414 = getelementptr inbounds [2 x i32*]* %arrayinit.element1413, i64 0, i64 0
  store i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 4, i64 0, i64 1), i32** %arrayinit.begin1414
  %arrayinit.element1415 = getelementptr inbounds i32** %arrayinit.begin1414, i64 1
  %arrayidx1416 = getelementptr inbounds [9 x i32]* %l_1352, i32 0, i64 7
  store i32* %arrayidx1416, i32** %arrayinit.element1415
  %arrayinit.element1417 = getelementptr inbounds [2 x i32*]* %arrayinit.element1413, i64 1
  %arrayinit.begin1418 = getelementptr inbounds [2 x i32*]* %arrayinit.element1417, i64 0, i64 0
  store i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 4, i64 0, i64 1), i32** %arrayinit.begin1418
  %arrayinit.element1419 = getelementptr inbounds i32** %arrayinit.begin1418, i64 1
  %arrayidx1420 = getelementptr inbounds [9 x i32]* %l_1352, i32 0, i64 7
  store i32* %arrayidx1420, i32** %arrayinit.element1419
  %arrayinit.element1421 = getelementptr inbounds [2 x i32*]* %arrayinit.element1417, i64 1
  %arrayinit.begin1422 = getelementptr inbounds [2 x i32*]* %arrayinit.element1421, i64 0, i64 0
  store i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 4, i64 0, i64 1), i32** %arrayinit.begin1422
  %arrayinit.element1423 = getelementptr inbounds i32** %arrayinit.begin1422, i64 1
  %arrayidx1424 = getelementptr inbounds [9 x i32]* %l_1352, i32 0, i64 7
  store i32* %arrayidx1424, i32** %arrayinit.element1423
  %arrayinit.element1425 = getelementptr inbounds [2 x i32*]* %arrayinit.element1421, i64 1
  %arrayinit.begin1426 = getelementptr inbounds [2 x i32*]* %arrayinit.element1425, i64 0, i64 0
  store i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 4, i64 0, i64 1), i32** %arrayinit.begin1426
  %arrayinit.element1427 = getelementptr inbounds i32** %arrayinit.begin1426, i64 1
  %arrayidx1428 = getelementptr inbounds [9 x i32]* %l_1352, i32 0, i64 7
  store i32* %arrayidx1428, i32** %arrayinit.element1427
  %arrayinit.element1429 = getelementptr inbounds [2 x i32*]* %arrayinit.element1425, i64 1
  %arrayinit.begin1430 = getelementptr inbounds [2 x i32*]* %arrayinit.element1429, i64 0, i64 0
  store i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 4, i64 0, i64 1), i32** %arrayinit.begin1430
  %arrayinit.element1431 = getelementptr inbounds i32** %arrayinit.begin1430, i64 1
  %arrayidx1432 = getelementptr inbounds [9 x i32]* %l_1352, i32 0, i64 7
  store i32* %arrayidx1432, i32** %arrayinit.element1431
  %arrayinit.element1433 = getelementptr inbounds [2 x i32*]* %arrayinit.element1429, i64 1
  %arrayinit.begin1434 = getelementptr inbounds [2 x i32*]* %arrayinit.element1433, i64 0, i64 0
  store i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 4, i64 0, i64 1), i32** %arrayinit.begin1434
  %arrayinit.element1435 = getelementptr inbounds i32** %arrayinit.begin1434, i64 1
  %arrayidx1436 = getelementptr inbounds [9 x i32]* %l_1352, i32 0, i64 7
  store i32* %arrayidx1436, i32** %arrayinit.element1435
  %arrayinit.element1437 = getelementptr inbounds [10 x [2 x i32*]]* %arrayinit.element1396, i64 1
  %arrayinit.begin1438 = getelementptr inbounds [10 x [2 x i32*]]* %arrayinit.element1437, i64 0, i64 0
  %arrayinit.begin1439 = getelementptr inbounds [2 x i32*]* %arrayinit.begin1438, i64 0, i64 0
  store i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 4, i64 0, i64 1), i32** %arrayinit.begin1439
  %arrayinit.element1440 = getelementptr inbounds i32** %arrayinit.begin1439, i64 1
  %arrayidx1441 = getelementptr inbounds [9 x i32]* %l_1352, i32 0, i64 7
  store i32* %arrayidx1441, i32** %arrayinit.element1440
  %arrayinit.element1442 = getelementptr inbounds [2 x i32*]* %arrayinit.begin1438, i64 1
  %arrayinit.begin1443 = getelementptr inbounds [2 x i32*]* %arrayinit.element1442, i64 0, i64 0
  store i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 4, i64 0, i64 1), i32** %arrayinit.begin1443
  %arrayinit.element1444 = getelementptr inbounds i32** %arrayinit.begin1443, i64 1
  %arrayidx1445 = getelementptr inbounds [9 x i32]* %l_1352, i32 0, i64 7
  store i32* %arrayidx1445, i32** %arrayinit.element1444
  %arrayinit.element1446 = getelementptr inbounds [2 x i32*]* %arrayinit.element1442, i64 1
  %arrayinit.begin1447 = getelementptr inbounds [2 x i32*]* %arrayinit.element1446, i64 0, i64 0
  store i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 4, i64 0, i64 1), i32** %arrayinit.begin1447
  %arrayinit.element1448 = getelementptr inbounds i32** %arrayinit.begin1447, i64 1
  %arrayidx1449 = getelementptr inbounds [9 x i32]* %l_1352, i32 0, i64 7
  store i32* %arrayidx1449, i32** %arrayinit.element1448
  %arrayinit.element1450 = getelementptr inbounds [2 x i32*]* %arrayinit.element1446, i64 1
  %arrayinit.begin1451 = getelementptr inbounds [2 x i32*]* %arrayinit.element1450, i64 0, i64 0
  store i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 4, i64 0, i64 1), i32** %arrayinit.begin1451
  %arrayinit.element1452 = getelementptr inbounds i32** %arrayinit.begin1451, i64 1
  %arrayidx1453 = getelementptr inbounds [9 x i32]* %l_1352, i32 0, i64 7
  store i32* %arrayidx1453, i32** %arrayinit.element1452
  %arrayinit.element1454 = getelementptr inbounds [2 x i32*]* %arrayinit.element1450, i64 1
  %arrayinit.begin1455 = getelementptr inbounds [2 x i32*]* %arrayinit.element1454, i64 0, i64 0
  store i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 4, i64 0, i64 1), i32** %arrayinit.begin1455
  %arrayinit.element1456 = getelementptr inbounds i32** %arrayinit.begin1455, i64 1
  %arrayidx1457 = getelementptr inbounds [9 x i32]* %l_1352, i32 0, i64 7
  store i32* %arrayidx1457, i32** %arrayinit.element1456
  %arrayinit.element1458 = getelementptr inbounds [2 x i32*]* %arrayinit.element1454, i64 1
  %arrayinit.begin1459 = getelementptr inbounds [2 x i32*]* %arrayinit.element1458, i64 0, i64 0
  store i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 4, i64 0, i64 1), i32** %arrayinit.begin1459
  %arrayinit.element1460 = getelementptr inbounds i32** %arrayinit.begin1459, i64 1
  %arrayidx1461 = getelementptr inbounds [9 x i32]* %l_1352, i32 0, i64 7
  store i32* %arrayidx1461, i32** %arrayinit.element1460
  %arrayinit.element1462 = getelementptr inbounds [2 x i32*]* %arrayinit.element1458, i64 1
  %arrayinit.begin1463 = getelementptr inbounds [2 x i32*]* %arrayinit.element1462, i64 0, i64 0
  store i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 4, i64 0, i64 1), i32** %arrayinit.begin1463
  %arrayinit.element1464 = getelementptr inbounds i32** %arrayinit.begin1463, i64 1
  %arrayidx1465 = getelementptr inbounds [9 x i32]* %l_1352, i32 0, i64 7
  store i32* %arrayidx1465, i32** %arrayinit.element1464
  %arrayinit.element1466 = getelementptr inbounds [2 x i32*]* %arrayinit.element1462, i64 1
  %arrayinit.begin1467 = getelementptr inbounds [2 x i32*]* %arrayinit.element1466, i64 0, i64 0
  store i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 4, i64 0, i64 1), i32** %arrayinit.begin1467
  %arrayinit.element1468 = getelementptr inbounds i32** %arrayinit.begin1467, i64 1
  %arrayidx1469 = getelementptr inbounds [9 x i32]* %l_1352, i32 0, i64 7
  store i32* %arrayidx1469, i32** %arrayinit.element1468
  %arrayinit.element1470 = getelementptr inbounds [2 x i32*]* %arrayinit.element1466, i64 1
  %arrayinit.begin1471 = getelementptr inbounds [2 x i32*]* %arrayinit.element1470, i64 0, i64 0
  store i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 4, i64 0, i64 1), i32** %arrayinit.begin1471
  %arrayinit.element1472 = getelementptr inbounds i32** %arrayinit.begin1471, i64 1
  %arrayidx1473 = getelementptr inbounds [9 x i32]* %l_1352, i32 0, i64 7
  store i32* %arrayidx1473, i32** %arrayinit.element1472
  %arrayinit.element1474 = getelementptr inbounds [2 x i32*]* %arrayinit.element1470, i64 1
  %arrayinit.begin1475 = getelementptr inbounds [2 x i32*]* %arrayinit.element1474, i64 0, i64 0
  store i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 4, i64 0, i64 1), i32** %arrayinit.begin1475
  %arrayinit.element1476 = getelementptr inbounds i32** %arrayinit.begin1475, i64 1
  %arrayidx1477 = getelementptr inbounds [9 x i32]* %l_1352, i32 0, i64 7
  store i32* %arrayidx1477, i32** %arrayinit.element1476
  store i8 -6, i8* %l_1368, align 1
  %305 = load volatile i32*** @g_976, align 8
  %306 = load i32** %305, align 8
  %307 = load i32* %306, align 4
  %308 = load i32** %l_1238, align 8
  %309 = load i32* %308, align 4
  %xor1481 = xor i32 %309, %307
  store i32 %xor1481, i32* %308, align 4
  store i32 29, i32* %l_988, align 4
  br label %for.cond1482

for.cond1482:                                     ; preds = %for.inc1488, %if.else1067
  %310 = load i32* %l_988, align 4
  %cmp1483 = icmp sge i32 %310, -13
  br i1 %cmp1483, label %for.body1485, label %for.end1490

for.body1485:                                     ; preds = %for.cond1482
  store i8 -9, i8* %l_1294, align 1
  store i32** @g_278, i32*** %l_1299, align 8
  store i32 -5, i32* %l_1349, align 4
  store i32 6, i32* %l_1353, align 4
  store i32 -522505215, i32* %l_1356, align 4
  store i32 531421152, i32* %l_1357, align 4
  store i32 -6, i32* %l_1360, align 4
  store i32 400681971, i32* %l_1361, align 4
  %311 = bitcast [10 x [10 x i32]]* %l_1362 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %311, i8* bitcast ([10 x [10 x i32]]* @func_7.l_1362 to i8*), i64 400, i32 16, i1 false)
  br label %for.inc1488

for.inc1488:                                      ; preds = %for.body1485
  %312 = load i32* %l_988, align 4
  %dec1489 = add nsw i32 %312, -1
  store i32 %dec1489, i32* %l_988, align 4
  br label %for.cond1482

for.end1490:                                      ; preds = %for.cond1482
  %313 = load i8* %l_1368, align 1
  %inc1491 = add i8 %313, 1
  store i8 %inc1491, i8* %l_1368, align 1
  br label %if.end1492

if.end1492:                                       ; preds = %for.end1490, %for.end1066
  %314 = load i32*** %l_1371, align 8
  store i32** %314, i32*** %retval
  br label %return

return:                                           ; preds = %if.end1492, %lor.end456, %if.else333
  %315 = load i32*** %retval
  ret i32** %315
}

define internal i32 @func_14(i64 %p_15.coerce) nounwind uwtable {
entry:
  %p_15 = alloca %union.U0, align 8
  %l_887 = alloca i32*, align 8
  %l_888 = alloca i32**, align 8
  %coerce.dive = getelementptr %union.U0* %p_15, i32 0, i32 0
  store i64 %p_15.coerce, i64* %coerce.dive
  store i32* bitcast (%union.U0* @g_13 to i32*), i32** %l_887, align 8
  store i32** @g_56, i32*** %l_888, align 8
  %0 = load i32** %l_887, align 8
  %1 = load i32*** %l_888, align 8
  store i32* %0, i32** %1, align 8
  %f0 = bitcast %union.U0* %p_15 to i64*
  %2 = load i64* %f0, align 8
  %conv = trunc i64 %2 to i32
  ret i32 %conv
}

define internal i64 @func_16(i32 %p_17) nounwind uwtable {
entry:
  %retval = alloca %union.U0, align 8
  %p_17.addr = alloca i32, align 4
  %l_578 = alloca i32, align 4
  %l_579 = alloca i32*, align 8
  %l_602 = alloca i8*, align 8
  %l_610 = alloca i32**, align 8
  %l_616 = alloca [5 x [8 x %union.U0**]], align 16
  %l_615 = alloca %union.U0***, align 8
  %l_620 = alloca [3 x [10 x %union.U0***]], align 16
  %l_649 = alloca %union.U1**, align 8
  %l_723 = alloca [10 x [8 x i32]], align 16
  %l_748 = alloca i8*, align 8
  %l_747 = alloca i8**, align 8
  %l_761 = alloca i16*, align 8
  %l_830 = alloca i32, align 4
  %l_845 = alloca [10 x [2 x [8 x %union.U1*]]], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %l_580 = alloca i32, align 4
  %l_612 = alloca %union.U0, align 8
  %l_640 = alloca i64, align 8
  %l_650 = alloca i32*, align 8
  %l_689 = alloca [4 x i32], align 16
  %l_709 = alloca i8*, align 8
  %i75 = alloca i32, align 4
  %l_587 = alloca i32*, align 8
  %l_603 = alloca i8*, align 8
  %l_604 = alloca i64*, align 8
  %l_605 = alloca i64*, align 8
  %l_606 = alloca i64*, align 8
  %l_622 = alloca [3 x i32], align 4
  %l_724 = alloca i8, align 1
  %l_732 = alloca [10 x %union.U0], align 16
  %l_758 = alloca i32*, align 8
  %l_768 = alloca i8, align 1
  %l_773 = alloca i64, align 8
  %i83 = alloca i32, align 4
  %l_611 = alloca i32*, align 8
  %l_617 = alloca %union.U0****, align 8
  %l_621 = alloca [4 x i64*], align 16
  %l_623 = alloca [8 x i32], align 16
  %i130 = alloca i32, align 4
  %l_609 = alloca i16, align 2
  %l_628 = alloca i32**, align 8
  %l_630 = alloca %union.U0*, align 8
  %l_638 = alloca i32*, align 8
  %l_637 = alloca i32**, align 8
  %l_645 = alloca i64, align 8
  %l_646 = alloca i16*, align 8
  %l_683 = alloca i32, align 4
  %l_687 = alloca i32, align 4
  %l_688 = alloca i32, align 4
  %l_733 = alloca i32**, align 8
  %l_668 = alloca i32, align 4
  %l_670 = alloca [10 x i32], align 16
  %l_671 = alloca i32, align 4
  %l_679 = alloca [1 x [6 x [10 x i32**]]], align 16
  %i281 = alloca i32, align 4
  %j282 = alloca i32, align 4
  %k283 = alloca i32, align 4
  %l_663 = alloca i32*, align 8
  %l_664 = alloca i8*, align 8
  %l_667 = alloca i16*, align 8
  %l_669 = alloca i32, align 4
  %l_680 = alloca i8*, align 8
  %l_681 = alloca [5 x [1 x i8*]], align 16
  %l_684 = alloca [1 x [7 x [2 x i16*]]], align 16
  %i307 = alloca i32, align 4
  %j308 = alloca i32, align 4
  %k309 = alloca i32, align 4
  %l_718 = alloca i32, align 4
  %l_719 = alloca [7 x i16], align 2
  %l_720 = alloca [4 x [8 x i32*]], align 16
  %i440 = alloca i32, align 4
  %j441 = alloca i32, align 4
  %l_725 = alloca [6 x [4 x i32]], align 16
  %i482 = alloca i32, align 4
  %j483 = alloca i32, align 4
  %l_740 = alloca i64*, align 8
  %l_749 = alloca i8***, align 8
  %l_750 = alloca i8***, align 8
  %l_762 = alloca i16*, align 8
  %l_765 = alloca i32*, align 8
  %l_783 = alloca %union.U0****, align 8
  %l_794 = alloca i32, align 4
  %l_795 = alloca %union.U0, align 8
  %l_799 = alloca i32*, align 8
  %l_798 = alloca i32**, align 8
  %l_808 = alloca [6 x [8 x i16*]], align 16
  %i552 = alloca i32, align 4
  %j553 = alloca i32, align 4
  %l_757 = alloca i32*, align 8
  %l_777 = alloca i32**, align 8
  %l_776 = alloca i32***, align 8
  %l_784 = alloca [1 x [5 x %union.U0]], align 16
  %i561 = alloca i32, align 4
  %j562 = alloca i32, align 4
  %l_756 = alloca [8 x i8***], align 16
  %i576 = alloca i32, align 4
  %l_779 = alloca i32***, align 8
  %l_778 = alloca [4 x i32****], align 16
  %i643 = alloca i32, align 4
  %l_785 = alloca %union.U0*****, align 8
  %l_786 = alloca %union.U0*****, align 8
  %l_789 = alloca [3 x [10 x i64*]], align 16
  %i725 = alloca i32, align 4
  %j726 = alloca i32, align 4
  %l_814 = alloca i32*, align 8
  %l_823 = alloca i32, align 4
  %l_824 = alloca i32, align 4
  %l_825 = alloca i32, align 4
  %l_826 = alloca [5 x i8], align 1
  %l_827 = alloca i32, align 4
  %l_828 = alloca i8, align 1
  %l_831 = alloca [5 x i8], align 1
  %i777 = alloca i32, align 4
  %l_812 = alloca i32*, align 8
  %l_813 = alloca i32*, align 8
  %l_818 = alloca i32*, align 8
  %l_819 = alloca i32*, align 8
  %l_820 = alloca i32*, align 8
  %l_821 = alloca i32*, align 8
  %l_822 = alloca [4 x i32*], align 16
  %l_829 = alloca i16, align 2
  %l_836 = alloca i32, align 4
  %i800 = alloca i32, align 4
  %l_846 = alloca %union.U1*, align 8
  %l_847 = alloca %union.U1**, align 8
  %l_848 = alloca [2 x [5 x i16*]], align 16
  %l_849 = alloca i32, align 4
  %l_850 = alloca i64*, align 8
  %l_851 = alloca i32, align 4
  %l_859 = alloca %union.U0***, align 8
  %l_873 = alloca i32, align 4
  %l_875 = alloca i32, align 4
  %l_876 = alloca i32, align 4
  %l_877 = alloca i32, align 4
  %l_878 = alloca i32, align 4
  %l_879 = alloca i32, align 4
  %l_881 = alloca i32, align 4
  %l_882 = alloca i64, align 8
  %i829 = alloca i32, align 4
  %j830 = alloca i32, align 4
  store i32 %p_17, i32* %p_17.addr, align 4
  store i32 -6, i32* %l_578, align 4
  store i32* @g_353, i32** %l_579, align 8
  store i8* @g_182, i8** %l_602, align 8
  store i32** @g_278, i32*** %l_610, align 8
  %0 = bitcast [5 x [8 x %union.U0**]]* %l_616 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* bitcast ([5 x [8 x %union.U0**]]* @func_16.l_616 to i8*), i64 320, i32 16, i1 false)
  %arrayidx = getelementptr inbounds [5 x [8 x %union.U0**]]* %l_616, i32 0, i64 4
  %arrayidx1 = getelementptr inbounds [8 x %union.U0**]* %arrayidx, i32 0, i64 0
  store %union.U0*** %arrayidx1, %union.U0**** %l_615, align 8
  %arrayinit.begin = getelementptr inbounds [3 x [10 x %union.U0***]]* %l_620, i64 0, i64 0
  %arrayinit.begin2 = getelementptr inbounds [10 x %union.U0***]* %arrayinit.begin, i64 0, i64 0
  store %union.U0*** @g_619, %union.U0**** %arrayinit.begin2
  %arrayinit.element = getelementptr inbounds %union.U0**** %arrayinit.begin2, i64 1
  %arrayidx3 = getelementptr inbounds [5 x [8 x %union.U0**]]* %l_616, i32 0, i64 4
  %arrayidx4 = getelementptr inbounds [8 x %union.U0**]* %arrayidx3, i32 0, i64 7
  store %union.U0*** %arrayidx4, %union.U0**** %arrayinit.element
  %arrayinit.element5 = getelementptr inbounds %union.U0**** %arrayinit.element, i64 1
  %arrayidx6 = getelementptr inbounds [5 x [8 x %union.U0**]]* %l_616, i32 0, i64 3
  %arrayidx7 = getelementptr inbounds [8 x %union.U0**]* %arrayidx6, i32 0, i64 0
  store %union.U0*** %arrayidx7, %union.U0**** %arrayinit.element5
  %arrayinit.element8 = getelementptr inbounds %union.U0**** %arrayinit.element5, i64 1
  %arrayidx9 = getelementptr inbounds [5 x [8 x %union.U0**]]* %l_616, i32 0, i64 4
  %arrayidx10 = getelementptr inbounds [8 x %union.U0**]* %arrayidx9, i32 0, i64 7
  store %union.U0*** %arrayidx10, %union.U0**** %arrayinit.element8
  %arrayinit.element11 = getelementptr inbounds %union.U0**** %arrayinit.element8, i64 1
  store %union.U0*** @g_619, %union.U0**** %arrayinit.element11
  %arrayinit.element12 = getelementptr inbounds %union.U0**** %arrayinit.element11, i64 1
  %arrayidx13 = getelementptr inbounds [5 x [8 x %union.U0**]]* %l_616, i32 0, i64 4
  %arrayidx14 = getelementptr inbounds [8 x %union.U0**]* %arrayidx13, i32 0, i64 7
  store %union.U0*** %arrayidx14, %union.U0**** %arrayinit.element12
  %arrayinit.element15 = getelementptr inbounds %union.U0**** %arrayinit.element12, i64 1
  %arrayidx16 = getelementptr inbounds [5 x [8 x %union.U0**]]* %l_616, i32 0, i64 3
  %arrayidx17 = getelementptr inbounds [8 x %union.U0**]* %arrayidx16, i32 0, i64 0
  store %union.U0*** %arrayidx17, %union.U0**** %arrayinit.element15
  %arrayinit.element18 = getelementptr inbounds %union.U0**** %arrayinit.element15, i64 1
  %arrayidx19 = getelementptr inbounds [5 x [8 x %union.U0**]]* %l_616, i32 0, i64 4
  %arrayidx20 = getelementptr inbounds [8 x %union.U0**]* %arrayidx19, i32 0, i64 7
  store %union.U0*** %arrayidx20, %union.U0**** %arrayinit.element18
  %arrayinit.element21 = getelementptr inbounds %union.U0**** %arrayinit.element18, i64 1
  store %union.U0*** @g_619, %union.U0**** %arrayinit.element21
  %arrayinit.element22 = getelementptr inbounds %union.U0**** %arrayinit.element21, i64 1
  %arrayidx23 = getelementptr inbounds [5 x [8 x %union.U0**]]* %l_616, i32 0, i64 4
  %arrayidx24 = getelementptr inbounds [8 x %union.U0**]* %arrayidx23, i32 0, i64 7
  store %union.U0*** %arrayidx24, %union.U0**** %arrayinit.element22
  %arrayinit.element25 = getelementptr inbounds [10 x %union.U0***]* %arrayinit.begin, i64 1
  %arrayinit.begin26 = getelementptr inbounds [10 x %union.U0***]* %arrayinit.element25, i64 0, i64 0
  store %union.U0*** @g_619, %union.U0**** %arrayinit.begin26
  %arrayinit.element27 = getelementptr inbounds %union.U0**** %arrayinit.begin26, i64 1
  %arrayidx28 = getelementptr inbounds [5 x [8 x %union.U0**]]* %l_616, i32 0, i64 4
  %arrayidx29 = getelementptr inbounds [8 x %union.U0**]* %arrayidx28, i32 0, i64 7
  store %union.U0*** %arrayidx29, %union.U0**** %arrayinit.element27
  %arrayinit.element30 = getelementptr inbounds %union.U0**** %arrayinit.element27, i64 1
  %arrayidx31 = getelementptr inbounds [5 x [8 x %union.U0**]]* %l_616, i32 0, i64 3
  %arrayidx32 = getelementptr inbounds [8 x %union.U0**]* %arrayidx31, i32 0, i64 0
  store %union.U0*** %arrayidx32, %union.U0**** %arrayinit.element30
  %arrayinit.element33 = getelementptr inbounds %union.U0**** %arrayinit.element30, i64 1
  %arrayidx34 = getelementptr inbounds [5 x [8 x %union.U0**]]* %l_616, i32 0, i64 4
  %arrayidx35 = getelementptr inbounds [8 x %union.U0**]* %arrayidx34, i32 0, i64 7
  store %union.U0*** %arrayidx35, %union.U0**** %arrayinit.element33
  %arrayinit.element36 = getelementptr inbounds %union.U0**** %arrayinit.element33, i64 1
  store %union.U0*** @g_619, %union.U0**** %arrayinit.element36
  %arrayinit.element37 = getelementptr inbounds %union.U0**** %arrayinit.element36, i64 1
  %arrayidx38 = getelementptr inbounds [5 x [8 x %union.U0**]]* %l_616, i32 0, i64 4
  %arrayidx39 = getelementptr inbounds [8 x %union.U0**]* %arrayidx38, i32 0, i64 7
  store %union.U0*** %arrayidx39, %union.U0**** %arrayinit.element37
  %arrayinit.element40 = getelementptr inbounds %union.U0**** %arrayinit.element37, i64 1
  %arrayidx41 = getelementptr inbounds [5 x [8 x %union.U0**]]* %l_616, i32 0, i64 3
  %arrayidx42 = getelementptr inbounds [8 x %union.U0**]* %arrayidx41, i32 0, i64 0
  store %union.U0*** %arrayidx42, %union.U0**** %arrayinit.element40
  %arrayinit.element43 = getelementptr inbounds %union.U0**** %arrayinit.element40, i64 1
  %arrayidx44 = getelementptr inbounds [5 x [8 x %union.U0**]]* %l_616, i32 0, i64 4
  %arrayidx45 = getelementptr inbounds [8 x %union.U0**]* %arrayidx44, i32 0, i64 7
  store %union.U0*** %arrayidx45, %union.U0**** %arrayinit.element43
  %arrayinit.element46 = getelementptr inbounds %union.U0**** %arrayinit.element43, i64 1
  store %union.U0*** @g_619, %union.U0**** %arrayinit.element46
  %arrayinit.element47 = getelementptr inbounds %union.U0**** %arrayinit.element46, i64 1
  %arrayidx48 = getelementptr inbounds [5 x [8 x %union.U0**]]* %l_616, i32 0, i64 4
  %arrayidx49 = getelementptr inbounds [8 x %union.U0**]* %arrayidx48, i32 0, i64 7
  store %union.U0*** %arrayidx49, %union.U0**** %arrayinit.element47
  %arrayinit.element50 = getelementptr inbounds [10 x %union.U0***]* %arrayinit.element25, i64 1
  %arrayinit.begin51 = getelementptr inbounds [10 x %union.U0***]* %arrayinit.element50, i64 0, i64 0
  store %union.U0*** @g_619, %union.U0**** %arrayinit.begin51
  %arrayinit.element52 = getelementptr inbounds %union.U0**** %arrayinit.begin51, i64 1
  %arrayidx53 = getelementptr inbounds [5 x [8 x %union.U0**]]* %l_616, i32 0, i64 4
  %arrayidx54 = getelementptr inbounds [8 x %union.U0**]* %arrayidx53, i32 0, i64 7
  store %union.U0*** %arrayidx54, %union.U0**** %arrayinit.element52
  %arrayinit.element55 = getelementptr inbounds %union.U0**** %arrayinit.element52, i64 1
  %arrayidx56 = getelementptr inbounds [5 x [8 x %union.U0**]]* %l_616, i32 0, i64 3
  %arrayidx57 = getelementptr inbounds [8 x %union.U0**]* %arrayidx56, i32 0, i64 0
  store %union.U0*** %arrayidx57, %union.U0**** %arrayinit.element55
  %arrayinit.element58 = getelementptr inbounds %union.U0**** %arrayinit.element55, i64 1
  %arrayidx59 = getelementptr inbounds [5 x [8 x %union.U0**]]* %l_616, i32 0, i64 4
  %arrayidx60 = getelementptr inbounds [8 x %union.U0**]* %arrayidx59, i32 0, i64 7
  store %union.U0*** %arrayidx60, %union.U0**** %arrayinit.element58
  %arrayinit.element61 = getelementptr inbounds %union.U0**** %arrayinit.element58, i64 1
  store %union.U0*** @g_619, %union.U0**** %arrayinit.element61
  %arrayinit.element62 = getelementptr inbounds %union.U0**** %arrayinit.element61, i64 1
  %arrayidx63 = getelementptr inbounds [5 x [8 x %union.U0**]]* %l_616, i32 0, i64 4
  %arrayidx64 = getelementptr inbounds [8 x %union.U0**]* %arrayidx63, i32 0, i64 7
  store %union.U0*** %arrayidx64, %union.U0**** %arrayinit.element62
  %arrayinit.element65 = getelementptr inbounds %union.U0**** %arrayinit.element62, i64 1
  %arrayidx66 = getelementptr inbounds [5 x [8 x %union.U0**]]* %l_616, i32 0, i64 3
  %arrayidx67 = getelementptr inbounds [8 x %union.U0**]* %arrayidx66, i32 0, i64 0
  store %union.U0*** %arrayidx67, %union.U0**** %arrayinit.element65
  %arrayinit.element68 = getelementptr inbounds %union.U0**** %arrayinit.element65, i64 1
  %arrayidx69 = getelementptr inbounds [5 x [8 x %union.U0**]]* %l_616, i32 0, i64 4
  %arrayidx70 = getelementptr inbounds [8 x %union.U0**]* %arrayidx69, i32 0, i64 7
  store %union.U0*** %arrayidx70, %union.U0**** %arrayinit.element68
  %arrayinit.element71 = getelementptr inbounds %union.U0**** %arrayinit.element68, i64 1
  store %union.U0*** @g_619, %union.U0**** %arrayinit.element71
  %arrayinit.element72 = getelementptr inbounds %union.U0**** %arrayinit.element71, i64 1
  %arrayidx73 = getelementptr inbounds [5 x [8 x %union.U0**]]* %l_616, i32 0, i64 4
  %arrayidx74 = getelementptr inbounds [8 x %union.U0**]* %arrayidx73, i32 0, i64 7
  store %union.U0*** %arrayidx74, %union.U0**** %arrayinit.element72
  store %union.U1** @g_133, %union.U1*** %l_649, align 8
  %1 = bitcast [10 x [8 x i32]]* %l_723 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %1, i8* bitcast ([10 x [8 x i32]]* @func_16.l_723 to i8*), i64 320, i32 16, i1 false)
  store i8* @g_682, i8** %l_748, align 8
  store i8** %l_748, i8*** %l_747, align 8
  store i16* getelementptr inbounds ([5 x i16]* @g_364, i32 0, i64 2), i16** %l_761, align 8
  store i32 1112174683, i32* %l_830, align 4
  %2 = bitcast [10 x [2 x [8 x %union.U1*]]]* %l_845 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* bitcast ([10 x [2 x [8 x %union.U1*]]]* @func_16.l_845 to i8*), i64 1280, i32 16, i1 false)
  %call = call signext i8 @safe_mul_func_int8_t_s_s(i8 signext -27, i8 signext 122)
  %conv = sext i8 %call to i32
  %3 = load i32* %l_578, align 4
  %4 = load i32** %l_579, align 8
  %5 = load i32* %4, align 4
  %and = and i32 %5, %3
  store i32 %and, i32* %4, align 4
  %or = or i32 %conv, %and
  %tobool = icmp ne i32 %or, 0
  br i1 %tobool, label %if.then, label %if.else776

if.then:                                          ; preds = %entry
  store i32 -1, i32* %l_580, align 4
  %6 = bitcast %union.U0* %l_612 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %6, i8* bitcast (%union.U0* @func_16.l_612 to i8*), i64 8, i32 8, i1 false)
  store i64 7386444667468926215, i64* %l_640, align 8
  store i32* @g_471, i32** %l_650, align 8
  store i8* null, i8** %l_709, align 8
  store i32 0, i32* %i75, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then
  %7 = load i32* %i75, align 4
  %cmp = icmp slt i32 %7, 4
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %8 = load i32* %i75, align 4
  %idxprom = sext i32 %8 to i64
  %arrayidx77 = getelementptr inbounds [4 x i32]* %l_689, i32 0, i64 %idxprom
  store i32 1, i32* %arrayidx77, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %9 = load i32* %i75, align 4
  %inc = add nsw i32 %9, 1
  store i32 %inc, i32* %i75, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %10 = load i32* %l_580, align 4
  %inc78 = add i32 %10, 1
  store i32 %inc78, i32* %l_580, align 4
  store i64 0, i64* getelementptr inbounds (%union.U1* @g_307, i32 0, i32 0), align 8
  br label %for.cond79

for.cond79:                                       ; preds = %for.inc773, %for.end
  %11 = load i64* getelementptr inbounds (%union.U1* @g_307, i32 0, i32 0), align 8
  %cmp80 = icmp ne i64 %11, -6
  br i1 %cmp80, label %for.body82, label %for.end775

for.body82:                                       ; preds = %for.cond79
  store i32* @g_3, i32** %l_587, align 8
  store i8* @g_182, i8** %l_603, align 8
  store i64* null, i64** %l_604, align 8
  store i64* getelementptr inbounds (%union.U1* @g_130, i32 0, i32 0), i64** %l_605, align 8
  store i64* getelementptr inbounds (%union.U1* @g_130, i32 0, i32 0), i64** %l_606, align 8
  store i8 0, i8* %l_724, align 1
  %12 = bitcast [10 x %union.U0]* %l_732 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %12, i8* bitcast ([10 x %union.U0]* @func_16.l_732 to i8*), i64 80, i32 16, i1 false)
  store i32* null, i32** %l_758, align 8
  store i8 -7, i8* %l_768, align 1
  store i64 -822956217700969849, i64* %l_773, align 8
  store i32 0, i32* %i83, align 4
  br label %for.cond84

for.cond84:                                       ; preds = %for.inc90, %for.body82
  %13 = load i32* %i83, align 4
  %cmp85 = icmp slt i32 %13, 3
  br i1 %cmp85, label %for.body87, label %for.end92

for.body87:                                       ; preds = %for.cond84
  %14 = load i32* %i83, align 4
  %idxprom88 = sext i32 %14 to i64
  %arrayidx89 = getelementptr inbounds [3 x i32]* %l_622, i32 0, i64 %idxprom88
  store i32 -2135849516, i32* %arrayidx89, align 4
  br label %for.inc90

for.inc90:                                        ; preds = %for.body87
  %15 = load i32* %i83, align 4
  %inc91 = add nsw i32 %15, 1
  store i32 %inc91, i32* %i83, align 4
  br label %for.cond84

for.end92:                                        ; preds = %for.cond84
  %16 = load volatile i16* bitcast (%union.U1* @g_361 to i16*), align 2
  %conv93 = sext i16 %16 to i32
  %17 = load i32* %p_17.addr, align 4
  %cmp94 = icmp slt i32 %conv93, %17
  %conv95 = zext i1 %cmp94 to i32
  %18 = load i32** %l_579, align 8
  %19 = load i32* %18, align 4
  %dec = add i32 %19, -1
  store i32 %dec, i32* %18, align 4
  %cmp96 = icmp uge i32 %conv95, %19
  %conv97 = zext i1 %cmp96 to i32
  %20 = load i32** %l_587, align 8
  %21 = load i32* %20, align 4
  %and98 = and i32 %21, %conv97
  store i32 %and98, i32* %20, align 4
  %22 = load i32* %p_17.addr, align 4
  %conv99 = sext i32 %22 to i64
  %call100 = call i64 @safe_sub_func_int64_t_s_s(i64 %conv99, i64 5357148063398035743)
  %conv101 = trunc i64 %call100 to i16
  %call102 = call zeroext i16 @safe_unary_minus_func_uint16_t_u(i16 zeroext %conv101)
  %23 = load i32* %l_580, align 4
  %24 = load i8* @g_200, align 1
  %25 = load i32* %p_17.addr, align 4
  %26 = load i32* %l_580, align 4
  %conv103 = trunc i32 %26 to i16
  %call104 = call signext i16 @safe_lshift_func_int16_t_s_u(i16 signext %conv103, i32 3)
  %conv105 = trunc i16 %call104 to i8
  %27 = load i32* %p_17.addr, align 4
  %call106 = call zeroext i8 @safe_lshift_func_uint8_t_u_u(i8 zeroext %conv105, i32 %27)
  %28 = load i8** %l_602, align 8
  store i8* %28, i8** %l_603, align 8
  %cmp107 = icmp ne i8* @g_182, %28
  %conv108 = zext i1 %cmp107 to i32
  %conv109 = trunc i32 %conv108 to i16
  %29 = load i32* %p_17.addr, align 4
  %conv110 = trunc i32 %29 to i16
  %call111 = call signext i16 @safe_sub_func_int16_t_s_s(i16 signext %conv109, i16 signext %conv110)
  %conv112 = sext i16 %call111 to i32
  %cmp113 = icmp ule i32 %23, %conv112
  %conv114 = zext i1 %cmp113 to i32
  %conv115 = trunc i32 %conv114 to i8
  %call116 = call signext i8 @safe_mul_func_int8_t_s_s(i8 signext %conv115, i8 signext -85)
  %conv117 = sext i8 %call116 to i32
  %30 = load i32* %p_17.addr, align 4
  %and118 = and i32 %conv117, %30
  %conv119 = trunc i32 %and118 to i16
  %call120 = call signext i16 @safe_sub_func_int16_t_s_s(i16 signext %conv119, i16 signext 18243)
  %conv121 = sext i16 %call120 to i64
  %31 = load i64* getelementptr inbounds (%union.U1* @g_536, i32 0, i32 0), align 8
  %and122 = and i64 %31, %conv121
  store i64 %and122, i64* getelementptr inbounds (%union.U1* @g_536, i32 0, i32 0), align 8
  %32 = load i32* %p_17.addr, align 4
  %conv123 = sext i32 %32 to i64
  %cmp124 = icmp slt i64 %and122, %conv123
  %conv125 = zext i1 %cmp124 to i32
  %conv126 = trunc i32 %conv125 to i8
  %call127 = call zeroext i8 @safe_unary_minus_func_uint8_t_u(i8 zeroext %conv126)
  %tobool128 = icmp ne i8 %call127, 0
  br i1 %tobool128, label %if.then129, label %if.else

if.then129:                                       ; preds = %for.end92
  store i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 2, i64 0, i64 3), i32** %l_611, align 8
  store %union.U0**** %l_615, %union.U0***** %l_617, align 8
  %33 = bitcast [4 x i64*]* %l_621 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %33, i8* bitcast ([4 x i64*]* @func_16.l_621 to i8*), i64 32, i32 16, i1 false)
  %34 = bitcast [8 x i32]* %l_623 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %34, i8* bitcast ([8 x i32]* @func_16.l_623 to i8*), i64 32, i32 16, i1 false)
  %35 = load i32* %l_578, align 4
  %tobool131 = icmp ne i32 %35, 0
  br i1 %tobool131, label %if.then132, label %if.end

if.then132:                                       ; preds = %if.then129
  br label %for.end775

if.end:                                           ; preds = %if.then129
  store i16 0, i16* @g_193, align 2
  br label %for.cond133

for.cond133:                                      ; preds = %for.inc146, %if.end
  %36 = load i16* @g_193, align 2
  %conv134 = zext i16 %36 to i32
  %cmp135 = icmp sle i32 %conv134, 4
  br i1 %cmp135, label %for.body137, label %for.end149

for.body137:                                      ; preds = %for.cond133
  store i16 -27615, i16* %l_609, align 2
  %37 = load i16* bitcast (%union.U1* @g_307 to i16*), align 2
  %conv138 = sext i16 %37 to i32
  %38 = load i16* %l_609, align 2
  %conv139 = zext i16 %38 to i32
  %or140 = or i32 %conv139, %conv138
  %conv141 = trunc i32 %or140 to i16
  store i16 %conv141, i16* %l_609, align 2
  %conv142 = trunc i16 %conv141 to i8
  %39 = load i32* %p_17.addr, align 4
  %conv143 = trunc i32 %39 to i8
  %call144 = call zeroext i8 @safe_mul_func_uint8_t_u_u(i8 zeroext %conv142, i8 zeroext %conv143)
  %conv145 = zext i8 %call144 to i32
  %40 = load i32** %l_587, align 8
  store i32 %conv145, i32* %40, align 4
  %41 = bitcast %union.U0* %retval to i8*
  %42 = bitcast %union.U0* %l_612 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %41, i8* %42, i64 8, i32 8, i1 false)
  br label %return

for.inc146:                                       ; No predecessors!
  %43 = load i16* @g_193, align 2
  %conv147 = zext i16 %43 to i32
  %add = add nsw i32 %conv147, 1
  %conv148 = trunc i32 %add to i16
  store i16 %conv148, i16* @g_193, align 2
  br label %for.cond133

for.end149:                                       ; preds = %for.cond133
  %44 = load i32* bitcast (%union.U1* @g_307 to i32*), align 4
  %45 = load %union.U0**** %l_615, align 8
  %46 = load %union.U0***** %l_617, align 8
  store %union.U0*** %45, %union.U0**** %46, align 8
  %47 = load %union.U0**** @g_618, align 8
  %arrayidx150 = getelementptr inbounds [3 x [10 x %union.U0***]]* %l_620, i32 0, i64 2
  %arrayidx151 = getelementptr inbounds [10 x %union.U0***]* %arrayidx150, i32 0, i64 8
  store %union.U0*** %47, %union.U0**** %arrayidx151, align 8
  %cmp152 = icmp eq %union.U0*** %45, %47
  %conv153 = zext i1 %cmp152 to i32
  %48 = load i32* %p_17.addr, align 4
  %conv154 = sext i32 %48 to i64
  %49 = load i64* getelementptr inbounds (%union.U1* @g_536, i32 0, i32 0), align 8
  %call155 = call i64 @safe_sub_func_uint64_t_u_u(i64 %conv154, i64 %49)
  %50 = load i64* @g_49, align 8
  %dec156 = add i64 %50, -1
  store i64 %dec156, i64* @g_49, align 8
  %or157 = or i64 %call155, %50
  %f1 = bitcast %union.U0* %l_612 to i32*
  %51 = load i32* %f1, align 4
  %conv158 = sext i32 %51 to i64
  %and159 = and i64 %conv158, %or157
  %conv160 = trunc i64 %and159 to i32
  store i32 %conv160, i32* %f1, align 4
  %f0 = bitcast %union.U0* %l_612 to i64*
  store i64 0, i64* %f0, align 8
  br label %for.cond161

for.cond161:                                      ; preds = %for.inc183, %for.end149
  %f0162 = bitcast %union.U0* %l_612 to i64*
  %52 = load i64* %f0162, align 8
  %cmp163 = icmp slt i64 %52, -30
  br i1 %cmp163, label %for.body165, label %for.end187

for.body165:                                      ; preds = %for.cond161
  store i32** @g_278, i32*** %l_628, align 8
  store %union.U0* null, %union.U0** %l_630, align 8
  %arrayidx166 = getelementptr inbounds [8 x i32]* %l_623, i32 0, i64 7
  %53 = load i32*** @g_134, align 8
  store i32* %arrayidx166, i32** %53, align 8
  %54 = load i32* %p_17.addr, align 4
  %55 = load i32** %l_611, align 8
  store i32 %54, i32* %55, align 4
  %56 = load i32*** %l_610, align 8
  %57 = load i32** %56, align 8
  %58 = load i32* %57, align 4
  %59 = load i32*** @g_134, align 8
  store i32* null, i32** %59, align 8
  store i16 0, i16* @g_193, align 2
  br label %for.cond167

for.cond167:                                      ; preds = %for.inc178, %for.body165
  %60 = load i16* @g_193, align 2
  %conv168 = zext i16 %60 to i32
  %cmp169 = icmp sle i32 %conv168, 4
  br i1 %cmp169, label %for.body171, label %for.end182

for.body171:                                      ; preds = %for.cond167
  %61 = load i32** @g_258, align 8
  %62 = load i32* %61, align 4
  %tobool172 = icmp ne i32 %62, 0
  br i1 %tobool172, label %if.then173, label %if.end174

if.then173:                                       ; preds = %for.body171
  br label %for.end182

if.end174:                                        ; preds = %for.body171
  %63 = load i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 3, i64 0, i64 0), align 4
  %64 = load i32* %p_17.addr, align 4
  %cmp175 = icmp sle i32 %63, %64
  %conv176 = zext i1 %cmp175 to i32
  %65 = load i32** %l_587, align 8
  %66 = load i32* %65, align 4
  %and177 = and i32 %66, %conv176
  store i32 %and177, i32* %65, align 4
  br label %for.inc178

for.inc178:                                       ; preds = %if.end174
  %67 = load i16* @g_193, align 2
  %conv179 = zext i16 %67 to i32
  %add180 = add nsw i32 %conv179, 1
  %conv181 = trunc i32 %add180 to i16
  store i16 %conv181, i16* @g_193, align 2
  br label %for.cond167

for.end182:                                       ; preds = %if.then173, %for.cond167
  br label %for.inc183

for.inc183:                                       ; preds = %for.end182
  %f0184 = bitcast %union.U0* %l_612 to i64*
  %68 = load i64* %f0184, align 8
  %call185 = call i64 @safe_sub_func_int64_t_s_s(i64 %68, i64 1)
  %f0186 = bitcast %union.U0* %l_612 to i64*
  store i64 %call185, i64* %f0186, align 8
  br label %for.cond161

for.end187:                                       ; preds = %for.cond161
  br label %if.end547

if.else:                                          ; preds = %for.end92
  store i32* @g_639, i32** %l_638, align 8
  store i32** %l_638, i32*** %l_637, align 8
  store i64 -1, i64* %l_645, align 8
  store i16* @g_193, i16** %l_646, align 8
  store i32 -1, i32* %l_683, align 4
  store i32 1, i32* %l_687, align 4
  store i32 1, i32* %l_688, align 4
  store i32** null, i32*** %l_733, align 8
  %69 = load i32* %p_17.addr, align 4
  %70 = load volatile %union.U0*** @g_83, align 8
  %71 = load %union.U0** %70, align 8
  %72 = load i32* %p_17.addr, align 4
  %conv188 = trunc i32 %72 to i16
  %73 = load i16** @g_417, align 8
  store i16 %conv188, i16* %73, align 2
  %74 = load i32*** %l_637, align 8
  store i32* @g_322, i32** %74, align 8
  %75 = load i64* %l_640, align 8
  %xor = xor i64 %75, 0
  store i64 %xor, i64* %l_640, align 8
  %conv189 = trunc i64 %xor to i16
  %call190 = call zeroext i16 @safe_mul_func_uint16_t_u_u(i16 zeroext %conv188, i16 zeroext %conv189)
  %76 = load i32* %p_17.addr, align 4
  %conv191 = trunc i32 %76 to i16
  %call192 = call zeroext i16 @safe_rshift_func_uint16_t_u_s(i16 zeroext %conv191, i32 11)
  %77 = load i8** %l_602, align 8
  %cmp193 = icmp ne i8* %77, @g_434
  %conv194 = zext i1 %cmp193 to i32
  %78 = load i16* bitcast (%union.U1* @g_307 to i16*), align 2
  %conv195 = sext i16 %78 to i64
  %79 = load i64* %l_645, align 8
  %and196 = and i64 %conv195, %79
  %conv197 = trunc i64 %and196 to i8
  %80 = load i32* %p_17.addr, align 4
  %call198 = call signext i8 @safe_rshift_func_int8_t_s_s(i8 signext %conv197, i32 %80)
  %conv199 = sext i8 %call198 to i64
  %cmp200 = icmp slt i64 %conv199, -1
  %conv201 = zext i1 %cmp200 to i32
  %cmp202 = icmp ne i32 %conv194, %conv201
  %conv203 = zext i1 %cmp202 to i32
  %81 = load i32* %p_17.addr, align 4
  %conv204 = sext i32 %81 to i64
  %82 = load i64* getelementptr inbounds (%union.U0* @g_13, i32 0, i32 0), align 8
  %cmp205 = icmp sle i64 %conv204, %82
  %conv206 = zext i1 %cmp205 to i32
  %neg = xor i32 %conv206, -1
  %conv207 = trunc i32 %neg to i16
  %call208 = call signext i16 @safe_div_func_int16_t_s_s(i16 signext %call190, i16 signext %conv207)
  %83 = load i16** %l_646, align 8
  store i16 %call208, i16* %83, align 2
  %conv209 = zext i16 %call208 to i32
  %tobool210 = icmp ne i32 %conv209, 0
  br i1 %tobool210, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %if.else
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %if.else
  %84 = phi i1 [ true, %if.else ], [ true, %lor.rhs ]
  %lor.ext = zext i1 %84 to i32
  %85 = load i32* %p_17.addr, align 4
  %call211 = call i32 @safe_div_func_int32_t_s_s(i32 %lor.ext, i32 %85)
  %tobool212 = icmp ne i32 %call211, 0
  br i1 %tobool212, label %if.then213, label %if.else439

if.then213:                                       ; preds = %lor.end
  store i32 9, i32* %l_668, align 4
  %86 = bitcast [10 x i32]* %l_670 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %86, i8* bitcast ([10 x i32]* @func_16.l_670 to i8*), i64 40, i32 16, i1 false)
  store i32 -3, i32* %l_671, align 4
  %arrayinit.begin214 = getelementptr inbounds [1 x [6 x [10 x i32**]]]* %l_679, i64 0, i64 0
  %arrayinit.begin215 = getelementptr inbounds [6 x [10 x i32**]]* %arrayinit.begin214, i64 0, i64 0
  %arrayinit.begin216 = getelementptr inbounds [10 x i32**]* %arrayinit.begin215, i64 0, i64 0
  store i32** %l_650, i32*** %arrayinit.begin216
  %arrayinit.element217 = getelementptr inbounds i32*** %arrayinit.begin216, i64 1
  store i32** @g_278, i32*** %arrayinit.element217
  %arrayinit.element218 = getelementptr inbounds i32*** %arrayinit.element217, i64 1
  store i32** %l_650, i32*** %arrayinit.element218
  %arrayinit.element219 = getelementptr inbounds i32*** %arrayinit.element218, i64 1
  store i32** @g_278, i32*** %arrayinit.element219
  %arrayinit.element220 = getelementptr inbounds i32*** %arrayinit.element219, i64 1
  store i32** %l_587, i32*** %arrayinit.element220
  %arrayinit.element221 = getelementptr inbounds i32*** %arrayinit.element220, i64 1
  store i32** %l_650, i32*** %arrayinit.element221
  %arrayinit.element222 = getelementptr inbounds i32*** %arrayinit.element221, i64 1
  store i32** @g_278, i32*** %arrayinit.element222
  %arrayinit.element223 = getelementptr inbounds i32*** %arrayinit.element222, i64 1
  store i32** @g_278, i32*** %arrayinit.element223
  %arrayinit.element224 = getelementptr inbounds i32*** %arrayinit.element223, i64 1
  store i32** %l_650, i32*** %arrayinit.element224
  %arrayinit.element225 = getelementptr inbounds i32*** %arrayinit.element224, i64 1
  store i32** %l_587, i32*** %arrayinit.element225
  %arrayinit.element226 = getelementptr inbounds [10 x i32**]* %arrayinit.begin215, i64 1
  %arrayinit.begin227 = getelementptr inbounds [10 x i32**]* %arrayinit.element226, i64 0, i64 0
  store i32** %l_650, i32*** %arrayinit.begin227
  %arrayinit.element228 = getelementptr inbounds i32*** %arrayinit.begin227, i64 1
  store i32** @g_278, i32*** %arrayinit.element228
  %arrayinit.element229 = getelementptr inbounds i32*** %arrayinit.element228, i64 1
  store i32** %l_650, i32*** %arrayinit.element229
  %arrayinit.element230 = getelementptr inbounds i32*** %arrayinit.element229, i64 1
  store i32** @g_278, i32*** %arrayinit.element230
  %arrayinit.element231 = getelementptr inbounds i32*** %arrayinit.element230, i64 1
  store i32** %l_587, i32*** %arrayinit.element231
  %arrayinit.element232 = getelementptr inbounds i32*** %arrayinit.element231, i64 1
  store i32** %l_650, i32*** %arrayinit.element232
  %arrayinit.element233 = getelementptr inbounds i32*** %arrayinit.element232, i64 1
  store i32** @g_278, i32*** %arrayinit.element233
  %arrayinit.element234 = getelementptr inbounds i32*** %arrayinit.element233, i64 1
  store i32** @g_278, i32*** %arrayinit.element234
  %arrayinit.element235 = getelementptr inbounds i32*** %arrayinit.element234, i64 1
  store i32** %l_650, i32*** %arrayinit.element235
  %arrayinit.element236 = getelementptr inbounds i32*** %arrayinit.element235, i64 1
  store i32** %l_587, i32*** %arrayinit.element236
  %arrayinit.element237 = getelementptr inbounds [10 x i32**]* %arrayinit.element226, i64 1
  %arrayinit.begin238 = getelementptr inbounds [10 x i32**]* %arrayinit.element237, i64 0, i64 0
  store i32** %l_650, i32*** %arrayinit.begin238
  %arrayinit.element239 = getelementptr inbounds i32*** %arrayinit.begin238, i64 1
  store i32** @g_278, i32*** %arrayinit.element239
  %arrayinit.element240 = getelementptr inbounds i32*** %arrayinit.element239, i64 1
  store i32** %l_650, i32*** %arrayinit.element240
  %arrayinit.element241 = getelementptr inbounds i32*** %arrayinit.element240, i64 1
  store i32** @g_278, i32*** %arrayinit.element241
  %arrayinit.element242 = getelementptr inbounds i32*** %arrayinit.element241, i64 1
  store i32** %l_587, i32*** %arrayinit.element242
  %arrayinit.element243 = getelementptr inbounds i32*** %arrayinit.element242, i64 1
  store i32** %l_650, i32*** %arrayinit.element243
  %arrayinit.element244 = getelementptr inbounds i32*** %arrayinit.element243, i64 1
  store i32** @g_278, i32*** %arrayinit.element244
  %arrayinit.element245 = getelementptr inbounds i32*** %arrayinit.element244, i64 1
  store i32** @g_278, i32*** %arrayinit.element245
  %arrayinit.element246 = getelementptr inbounds i32*** %arrayinit.element245, i64 1
  store i32** %l_650, i32*** %arrayinit.element246
  %arrayinit.element247 = getelementptr inbounds i32*** %arrayinit.element246, i64 1
  store i32** %l_587, i32*** %arrayinit.element247
  %arrayinit.element248 = getelementptr inbounds [10 x i32**]* %arrayinit.element237, i64 1
  %arrayinit.begin249 = getelementptr inbounds [10 x i32**]* %arrayinit.element248, i64 0, i64 0
  store i32** %l_650, i32*** %arrayinit.begin249
  %arrayinit.element250 = getelementptr inbounds i32*** %arrayinit.begin249, i64 1
  store i32** @g_278, i32*** %arrayinit.element250
  %arrayinit.element251 = getelementptr inbounds i32*** %arrayinit.element250, i64 1
  store i32** %l_650, i32*** %arrayinit.element251
  %arrayinit.element252 = getelementptr inbounds i32*** %arrayinit.element251, i64 1
  store i32** @g_278, i32*** %arrayinit.element252
  %arrayinit.element253 = getelementptr inbounds i32*** %arrayinit.element252, i64 1
  store i32** %l_587, i32*** %arrayinit.element253
  %arrayinit.element254 = getelementptr inbounds i32*** %arrayinit.element253, i64 1
  store i32** %l_650, i32*** %arrayinit.element254
  %arrayinit.element255 = getelementptr inbounds i32*** %arrayinit.element254, i64 1
  store i32** @g_278, i32*** %arrayinit.element255
  %arrayinit.element256 = getelementptr inbounds i32*** %arrayinit.element255, i64 1
  store i32** @g_278, i32*** %arrayinit.element256
  %arrayinit.element257 = getelementptr inbounds i32*** %arrayinit.element256, i64 1
  store i32** %l_650, i32*** %arrayinit.element257
  %arrayinit.element258 = getelementptr inbounds i32*** %arrayinit.element257, i64 1
  store i32** %l_587, i32*** %arrayinit.element258
  %arrayinit.element259 = getelementptr inbounds [10 x i32**]* %arrayinit.element248, i64 1
  %arrayinit.begin260 = getelementptr inbounds [10 x i32**]* %arrayinit.element259, i64 0, i64 0
  store i32** %l_650, i32*** %arrayinit.begin260
  %arrayinit.element261 = getelementptr inbounds i32*** %arrayinit.begin260, i64 1
  store i32** @g_278, i32*** %arrayinit.element261
  %arrayinit.element262 = getelementptr inbounds i32*** %arrayinit.element261, i64 1
  store i32** %l_650, i32*** %arrayinit.element262
  %arrayinit.element263 = getelementptr inbounds i32*** %arrayinit.element262, i64 1
  store i32** @g_278, i32*** %arrayinit.element263
  %arrayinit.element264 = getelementptr inbounds i32*** %arrayinit.element263, i64 1
  store i32** %l_587, i32*** %arrayinit.element264
  %arrayinit.element265 = getelementptr inbounds i32*** %arrayinit.element264, i64 1
  store i32** %l_650, i32*** %arrayinit.element265
  %arrayinit.element266 = getelementptr inbounds i32*** %arrayinit.element265, i64 1
  store i32** @g_278, i32*** %arrayinit.element266
  %arrayinit.element267 = getelementptr inbounds i32*** %arrayinit.element266, i64 1
  store i32** @g_278, i32*** %arrayinit.element267
  %arrayinit.element268 = getelementptr inbounds i32*** %arrayinit.element267, i64 1
  store i32** %l_650, i32*** %arrayinit.element268
  %arrayinit.element269 = getelementptr inbounds i32*** %arrayinit.element268, i64 1
  store i32** %l_587, i32*** %arrayinit.element269
  %arrayinit.element270 = getelementptr inbounds [10 x i32**]* %arrayinit.element259, i64 1
  %arrayinit.begin271 = getelementptr inbounds [10 x i32**]* %arrayinit.element270, i64 0, i64 0
  store i32** %l_650, i32*** %arrayinit.begin271
  %arrayinit.element272 = getelementptr inbounds i32*** %arrayinit.begin271, i64 1
  store i32** @g_278, i32*** %arrayinit.element272
  %arrayinit.element273 = getelementptr inbounds i32*** %arrayinit.element272, i64 1
  store i32** %l_650, i32*** %arrayinit.element273
  %arrayinit.element274 = getelementptr inbounds i32*** %arrayinit.element273, i64 1
  store i32** @g_278, i32*** %arrayinit.element274
  %arrayinit.element275 = getelementptr inbounds i32*** %arrayinit.element274, i64 1
  store i32** %l_587, i32*** %arrayinit.element275
  %arrayinit.element276 = getelementptr inbounds i32*** %arrayinit.element275, i64 1
  store i32** %l_650, i32*** %arrayinit.element276
  %arrayinit.element277 = getelementptr inbounds i32*** %arrayinit.element276, i64 1
  store i32** @g_278, i32*** %arrayinit.element277
  %arrayinit.element278 = getelementptr inbounds i32*** %arrayinit.element277, i64 1
  store i32** @g_278, i32*** %arrayinit.element278
  %arrayinit.element279 = getelementptr inbounds i32*** %arrayinit.element278, i64 1
  store i32** %l_650, i32*** %arrayinit.element279
  %arrayinit.element280 = getelementptr inbounds i32*** %arrayinit.element279, i64 1
  store i32** %l_587, i32*** %arrayinit.element280
  %87 = load i32* %p_17.addr, align 4
  %88 = load %union.U1*** %l_649, align 8
  %cmp284 = icmp ne %union.U1** @g_133, %88
  %conv285 = zext i1 %cmp284 to i32
  %conv286 = trunc i32 %conv285 to i8
  %89 = load i32* %p_17.addr, align 4
  %90 = load i16* bitcast (%union.U1* @g_130 to i16*), align 2
  %conv287 = sext i16 %90 to i32
  %or288 = or i32 %conv287, %89
  %conv289 = trunc i32 %or288 to i16
  store i16 %conv289, i16* bitcast (%union.U1* @g_130 to i16*), align 2
  %91 = load i32*** %l_610, align 8
  %92 = load i32** %91, align 8
  %93 = load i32* %92, align 4
  %conv290 = trunc i32 %93 to i8
  %call291 = call i32** @func_45(i8 zeroext %conv286, i16 signext %conv289, i8 signext %conv290)
  %arrayidx292 = getelementptr inbounds [3 x i32]* %l_622, i32 0, i64 0
  %arrayidx293 = getelementptr inbounds [3 x i32]* %l_622, i32 0, i64 1
  %call294 = call i64 @func_18(i32** %call291, i32* %arrayidx292, i32* %arrayidx293)
  %94 = load i32* %p_17.addr, align 4
  %conv295 = trunc i32 %94 to i16
  %call296 = call zeroext i16 @safe_add_func_uint16_t_u_u(i16 zeroext 12164, i16 zeroext %conv295)
  %conv297 = zext i16 %call296 to i32
  %cmp298 = icmp sgt i32 %87, %conv297
  %conv299 = zext i1 %cmp298 to i32
  %95 = load i64* %l_645, align 8
  %96 = load i32** %l_650, align 8
  %97 = load i32* %96, align 4
  %conv300 = sext i32 %97 to i64
  %xor301 = xor i64 %conv300, %95
  %conv302 = trunc i64 %xor301 to i32
  store i32 %conv302, i32* %96, align 4
  store i32 0, i32* @g_322, align 4
  br label %for.cond303

for.cond303:                                      ; preds = %for.inc423, %if.then213
  %98 = load i32* @g_322, align 4
  %cmp304 = icmp sge i32 %98, -11
  br i1 %cmp304, label %for.body306, label %for.end425

for.body306:                                      ; preds = %for.cond303
  store i32* bitcast (%union.U0* @g_13 to i32*), i32** %l_663, align 8
  store i8* @g_200, i8** %l_664, align 8
  store i16* null, i16** %l_667, align 8
  store i32 -1547421830, i32* %l_669, align 4
  store i8* null, i8** %l_680, align 8
  store i32 0, i32* %i307, align 4
  br label %for.cond310

for.cond310:                                      ; preds = %for.inc325, %for.body306
  %99 = load i32* %i307, align 4
  %cmp311 = icmp slt i32 %99, 5
  br i1 %cmp311, label %for.body313, label %for.end327

for.body313:                                      ; preds = %for.cond310
  store i32 0, i32* %j308, align 4
  br label %for.cond314

for.cond314:                                      ; preds = %for.inc322, %for.body313
  %100 = load i32* %j308, align 4
  %cmp315 = icmp slt i32 %100, 1
  br i1 %cmp315, label %for.body317, label %for.end324

for.body317:                                      ; preds = %for.cond314
  %101 = load i32* %j308, align 4
  %idxprom318 = sext i32 %101 to i64
  %102 = load i32* %i307, align 4
  %idxprom319 = sext i32 %102 to i64
  %arrayidx320 = getelementptr inbounds [5 x [1 x i8*]]* %l_681, i32 0, i64 %idxprom319
  %arrayidx321 = getelementptr inbounds [1 x i8*]* %arrayidx320, i32 0, i64 %idxprom318
  store i8* @g_682, i8** %arrayidx321, align 8
  br label %for.inc322

for.inc322:                                       ; preds = %for.body317
  %103 = load i32* %j308, align 4
  %inc323 = add nsw i32 %103, 1
  store i32 %inc323, i32* %j308, align 4
  br label %for.cond314

for.end324:                                       ; preds = %for.cond314
  br label %for.inc325

for.inc325:                                       ; preds = %for.end324
  %104 = load i32* %i307, align 4
  %inc326 = add nsw i32 %104, 1
  store i32 %inc326, i32* %i307, align 4
  br label %for.cond310

for.end327:                                       ; preds = %for.cond310
  store i32 0, i32* %i307, align 4
  br label %for.cond328

for.cond328:                                      ; preds = %for.inc352, %for.end327
  %105 = load i32* %i307, align 4
  %cmp329 = icmp slt i32 %105, 1
  br i1 %cmp329, label %for.body331, label %for.end354

for.body331:                                      ; preds = %for.cond328
  store i32 0, i32* %j308, align 4
  br label %for.cond332

for.cond332:                                      ; preds = %for.inc349, %for.body331
  %106 = load i32* %j308, align 4
  %cmp333 = icmp slt i32 %106, 7
  br i1 %cmp333, label %for.body335, label %for.end351

for.body335:                                      ; preds = %for.cond332
  store i32 0, i32* %k309, align 4
  br label %for.cond336

for.cond336:                                      ; preds = %for.inc346, %for.body335
  %107 = load i32* %k309, align 4
  %cmp337 = icmp slt i32 %107, 2
  br i1 %cmp337, label %for.body339, label %for.end348

for.body339:                                      ; preds = %for.cond336
  %108 = load i32* %k309, align 4
  %idxprom340 = sext i32 %108 to i64
  %109 = load i32* %j308, align 4
  %idxprom341 = sext i32 %109 to i64
  %110 = load i32* %i307, align 4
  %idxprom342 = sext i32 %110 to i64
  %arrayidx343 = getelementptr inbounds [1 x [7 x [2 x i16*]]]* %l_684, i32 0, i64 %idxprom342
  %arrayidx344 = getelementptr inbounds [7 x [2 x i16*]]* %arrayidx343, i32 0, i64 %idxprom341
  %arrayidx345 = getelementptr inbounds [2 x i16*]* %arrayidx344, i32 0, i64 %idxprom340
  store i16* @g_166, i16** %arrayidx345, align 8
  br label %for.inc346

for.inc346:                                       ; preds = %for.body339
  %111 = load i32* %k309, align 4
  %inc347 = add nsw i32 %111, 1
  store i32 %inc347, i32* %k309, align 4
  br label %for.cond336

for.end348:                                       ; preds = %for.cond336
  br label %for.inc349

for.inc349:                                       ; preds = %for.end348
  %112 = load i32* %j308, align 4
  %inc350 = add nsw i32 %112, 1
  store i32 %inc350, i32* %j308, align 4
  br label %for.cond332

for.end351:                                       ; preds = %for.cond332
  br label %for.inc352

for.inc352:                                       ; preds = %for.end351
  %113 = load i32* %i307, align 4
  %inc353 = add nsw i32 %113, 1
  store i32 %inc353, i32* %i307, align 4
  br label %for.cond328

for.end354:                                       ; preds = %for.cond328
  %114 = load i32* %p_17.addr, align 4
  %115 = load i32* %p_17.addr, align 4
  %116 = load volatile %union.U0*** @g_83, align 8
  %117 = load %union.U0** %116, align 8
  %118 = load i32** %l_587, align 8
  %119 = load i32* %118, align 4
  %conv355 = sext i32 %119 to i64
  %xor356 = xor i64 %conv355, 3449250333
  %conv357 = trunc i64 %xor356 to i32
  store i32 %conv357, i32* %118, align 4
  %conv358 = sext i32 %conv357 to i64
  %cmp359 = icmp sle i64 995709056, %conv358
  %conv360 = zext i1 %cmp359 to i32
  %cmp361 = icmp ne i32 %115, %conv360
  %conv362 = zext i1 %cmp361 to i32
  %cmp363 = icmp sge i32 %114, %conv362
  %conv364 = zext i1 %cmp363 to i32
  %120 = load i8** %l_602, align 8
  %121 = load i8* %120, align 1
  %inc365 = add i8 %121, 1
  store i8 %inc365, i8* %120, align 1
  %conv366 = zext i8 %121 to i32
  %122 = load i32* %p_17.addr, align 4
  %conv367 = trunc i32 %122 to i8
  %call368 = call zeroext i8 @safe_mul_func_uint8_t_u_u(i8 zeroext %conv367, i8 zeroext -7)
  %conv369 = zext i8 %call368 to i64
  %cmp370 = icmp ule i64 %conv369, -8
  %conv371 = zext i1 %cmp370 to i32
  %conv372 = trunc i32 %conv371 to i8
  %123 = load volatile i16* bitcast (%union.U1* @g_361 to i16*), align 2
  %conv373 = trunc i16 %123 to i8
  %call374 = call zeroext i8 @safe_add_func_uint8_t_u_u(i8 zeroext %conv372, i8 zeroext %conv373)
  %conv375 = zext i8 %call374 to i32
  %124 = load i32* %p_17.addr, align 4
  %cmp376 = icmp eq i32 %conv375, %124
  %land.ext = zext i1 %cmp376 to i32
  %125 = load i32** %l_579, align 8
  %126 = load i32* %125, align 4
  %or378 = or i32 %126, %land.ext
  store i32 %or378, i32* %125, align 4
  %tobool379 = icmp ne i32 %or378, 0
  br i1 %tobool379, label %lor.end382, label %lor.rhs380

lor.rhs380:                                       ; preds = %for.end354
  %127 = load i64* %l_645, align 8
  %tobool381 = icmp ne i64 %127, 0
  br label %lor.end382

lor.end382:                                       ; preds = %lor.rhs380, %for.end354
  %128 = phi i1 [ true, %for.end354 ], [ %tobool381, %lor.rhs380 ]
  %lor.ext383 = zext i1 %128 to i32
  %conv384 = sext i32 %lor.ext383 to i64
  %cmp385 = icmp ugt i64 %conv384, 1
  %conv386 = zext i1 %cmp385 to i32
  %and387 = and i32 %conv366, %conv386
  %129 = load i32* %l_668, align 4
  %xor388 = xor i32 %129, %and387
  store i32 %xor388, i32* %l_668, align 4
  %conv389 = trunc i32 %xor388 to i16
  %call390 = call signext i16 @safe_rshift_func_int16_t_s_u(i16 signext %conv389, i32 5)
  %conv391 = sext i16 %call390 to i32
  %neg392 = xor i32 %conv391, -1
  store i32 %neg392, i32* %l_669, align 4
  %130 = load i64* %l_645, align 8
  %conv393 = trunc i64 %130 to i32
  %arrayidx394 = getelementptr inbounds [10 x i32]* %l_670, i32 0, i64 0
  store i32 %conv393, i32* %arrayidx394, align 4
  %131 = load i32* %l_671, align 4
  %or395 = or i32 %131, %conv393
  store i32 %or395, i32* %l_671, align 4
  %132 = load i32* getelementptr inbounds ([1 x [8 x [10 x i32]]]* @g_110, i32 0, i64 0, i64 2, i64 2), align 4
  %133 = load volatile %union.U0*** @g_106, align 8
  %134 = load %union.U0** %133, align 8
  %135 = load i16** @g_417, align 8
  %136 = load i16* %135, align 2
  %conv396 = zext i16 %136 to i32
  %137 = load i32* %p_17.addr, align 4
  %conv397 = trunc i32 %137 to i8
  %arrayidx398 = getelementptr inbounds [1 x [6 x [10 x i32**]]]* %l_679, i32 0, i64 0
  %arrayidx399 = getelementptr inbounds [6 x [10 x i32**]]* %arrayidx398, i32 0, i64 3
  %arrayidx400 = getelementptr inbounds [10 x i32**]* %arrayidx399, i32 0, i64 0
  store i32** null, i32*** %arrayidx400, align 8
  %call401 = call i64 @func_18(i32** null, i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 3, i64 0, i64 1), i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 2, i64 0, i64 3))
  %138 = load i32* %p_17.addr, align 4
  %conv402 = sext i32 %138 to i64
  %xor403 = xor i64 1, %conv402
  %tobool404 = icmp ne i64 %xor403, 0
  %land.ext405 = zext i1 %tobool404 to i32
  %139 = load i32** %l_587, align 8
  %140 = load i32* %139, align 4
  %or406 = or i32 %140, %land.ext405
  store i32 %or406, i32* %139, align 4
  store i32 %or406, i32* %l_683, align 4
  %conv407 = trunc i32 %or406 to i8
  %call408 = call signext i8 @safe_div_func_int8_t_s_s(i8 signext %conv397, i8 signext %conv407)
  %141 = load i8* @g_182, align 1
  %conv409 = zext i8 %141 to i32
  %call410 = call signext i8 @safe_lshift_func_int8_t_s_s(i8 signext %call408, i32 %conv409)
  %conv411 = sext i8 %call410 to i16
  store i16 %conv411, i16* bitcast (%union.U1* @g_536 to i16*), align 2
  %conv412 = sext i16 %conv411 to i32
  %142 = load i32* %p_17.addr, align 4
  %cmp413 = icmp slt i32 %conv412, %142
  %conv414 = zext i1 %cmp413 to i32
  %conv415 = trunc i32 %conv414 to i8
  %arrayidx416 = getelementptr inbounds [10 x i32]* %l_670, i32 0, i64 3
  %143 = load i32* %arrayidx416, align 4
  %conv417 = trunc i32 %143 to i8
  %call418 = call signext i8 @safe_add_func_int8_t_s_s(i8 signext %conv415, i8 signext %conv417)
  %144 = load i32*** %l_610, align 8
  %145 = load i32** %144, align 8
  %146 = load i32* %145, align 4
  %147 = load i32* %l_671, align 4
  %xor419 = xor i32 %147, %146
  store i32 %xor419, i32* %l_671, align 4
  %cmp420 = icmp sge i32 %conv396, %xor419
  %conv421 = zext i1 %cmp420 to i32
  %or422 = or i32 %132, %conv421
  %148 = load i32** %l_650, align 8
  store i32 %or422, i32* %148, align 4
  %149 = load i32* %p_17.addr, align 4
  %150 = load i32** %l_650, align 8
  store i32 %149, i32* %150, align 4
  br label %for.inc423

for.inc423:                                       ; preds = %lor.end382
  %151 = load i32* @g_322, align 4
  %call424 = call i32 @safe_sub_func_int32_t_s_s(i32 %151, i32 5)
  store i32 %call424, i32* @g_322, align 4
  br label %for.cond303

for.end425:                                       ; preds = %for.cond303
  store i16 0, i16* bitcast (%union.U1* @g_674 to i16*), align 2
  br label %for.cond426

for.cond426:                                      ; preds = %for.inc434, %for.end425
  %152 = load i16* bitcast (%union.U1* @g_674 to i16*), align 2
  %conv427 = sext i16 %152 to i32
  %cmp428 = icmp slt i32 %conv427, 17
  br i1 %cmp428, label %for.body430, label %for.end438

for.body430:                                      ; preds = %for.cond426
  %153 = load i32* %p_17.addr, align 4
  %154 = load i32** %l_650, align 8
  %155 = load i32* %154, align 4
  %and431 = and i32 %155, %153
  store i32 %and431, i32* %154, align 4
  %arrayidx432 = getelementptr inbounds [4 x i32]* %l_689, i32 0, i64 2
  %156 = load i32* %arrayidx432, align 4
  %inc433 = add i32 %156, 1
  store i32 %inc433, i32* %arrayidx432, align 4
  br label %for.inc434

for.inc434:                                       ; preds = %for.body430
  %157 = load i16* bitcast (%union.U1* @g_674 to i16*), align 2
  %conv435 = sext i16 %157 to i64
  %call436 = call i64 @safe_add_func_int64_t_s_s(i64 %conv435, i64 6)
  %conv437 = trunc i64 %call436 to i16
  store i16 %conv437, i16* bitcast (%union.U1* @g_674 to i16*), align 2
  br label %for.cond426

for.end438:                                       ; preds = %for.cond426
  %158 = load %union.U0*** @g_619, align 8
  %159 = load %union.U0** %158, align 8
  %160 = bitcast %union.U0* %retval to i8*
  %161 = bitcast %union.U0* %159 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %160, i8* %161, i64 8, i32 8, i1 false)
  br label %return

if.else439:                                       ; preds = %lor.end
  store i32 1403394741, i32* %l_718, align 4
  %162 = bitcast [7 x i16]* %l_719 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %162, i8* bitcast ([7 x i16]* @func_16.l_719 to i8*), i64 14, i32 2, i1 false)
  store i32 0, i32* %i440, align 4
  br label %for.cond442

for.cond442:                                      ; preds = %for.inc457, %if.else439
  %163 = load i32* %i440, align 4
  %cmp443 = icmp slt i32 %163, 4
  br i1 %cmp443, label %for.body445, label %for.end459

for.body445:                                      ; preds = %for.cond442
  store i32 0, i32* %j441, align 4
  br label %for.cond446

for.cond446:                                      ; preds = %for.inc454, %for.body445
  %164 = load i32* %j441, align 4
  %cmp447 = icmp slt i32 %164, 8
  br i1 %cmp447, label %for.body449, label %for.end456

for.body449:                                      ; preds = %for.cond446
  %165 = load i32* %j441, align 4
  %idxprom450 = sext i32 %165 to i64
  %166 = load i32* %i440, align 4
  %idxprom451 = sext i32 %166 to i64
  %arrayidx452 = getelementptr inbounds [4 x [8 x i32*]]* %l_720, i32 0, i64 %idxprom451
  %arrayidx453 = getelementptr inbounds [8 x i32*]* %arrayidx452, i32 0, i64 %idxprom450
  store i32* bitcast (%union.U0* @g_13 to i32*), i32** %arrayidx453, align 8
  br label %for.inc454

for.inc454:                                       ; preds = %for.body449
  %167 = load i32* %j441, align 4
  %inc455 = add nsw i32 %167, 1
  store i32 %inc455, i32* %j441, align 4
  br label %for.cond446

for.end456:                                       ; preds = %for.cond446
  br label %for.inc457

for.inc457:                                       ; preds = %for.end456
  %168 = load i32* %i440, align 4
  %inc458 = add nsw i32 %168, 1
  store i32 %inc458, i32* %i440, align 4
  br label %for.cond442

for.end459:                                       ; preds = %for.cond442
  %169 = load i32*** %l_610, align 8
  %170 = load i32** %169, align 8
  %171 = load i32* %170, align 4
  %conv460 = trunc i32 %171 to i16
  %call461 = call zeroext i16 @safe_sub_func_uint16_t_u_u(i16 zeroext %conv460, i16 zeroext -14810)
  %conv462 = zext i16 %call461 to i32
  %172 = load i32** %l_587, align 8
  %173 = load i32* %172, align 4
  %conv463 = trunc i32 %173 to i8
  %174 = load volatile i32* getelementptr inbounds ([7 x i32]* @g_213, i32 0, i64 6), align 4
  %conv464 = trunc i32 %174 to i8
  %call465 = call signext i8 @safe_mul_func_int8_t_s_s(i8 signext %conv464, i8 signext -88)
  %conv466 = sext i8 %call465 to i32
  %call467 = call i32 @safe_unary_minus_func_int32_t_s(i32 %conv466)
  %conv468 = trunc i32 %call467 to i8
  %175 = load i32** %l_587, align 8
  %176 = load i32* %175, align 4
  %conv469 = trunc i32 %176 to i8
  %call470 = call signext i8 @safe_div_func_int8_t_s_s(i8 signext %conv468, i8 signext %conv469)
  %conv471 = sext i8 %call470 to i32
  %177 = load i32* %p_17.addr, align 4
  %xor472 = xor i32 %conv471, %177
  %conv473 = trunc i32 %xor472 to i8
  %call474 = call zeroext i8 @safe_mul_func_uint8_t_u_u(i8 zeroext %conv463, i8 zeroext %conv473)
  %conv475 = zext i8 %call474 to i32
  %cmp476 = icmp slt i32 %conv462, %conv475
  %conv477 = zext i1 %cmp476 to i32
  %178 = load i32** %l_650, align 8
  %179 = load i32* %178, align 4
  %or478 = or i32 %179, %conv477
  store i32 %or478, i32* %178, align 4
  %180 = load i16*** @g_416, align 8
  %181 = load i16** %180, align 8
  %182 = load i16* %181, align 2
  %call479 = call zeroext i16 @safe_rshift_func_uint16_t_u_u(i16 zeroext %182, i32 0)
  %tobool480 = icmp ne i16 %call479, 0
  br i1 %tobool480, label %if.then481, label %if.else497

if.then481:                                       ; preds = %for.end459
  %183 = bitcast [6 x [4 x i32]]* %l_725 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %183, i8* bitcast ([6 x [4 x i32]]* @func_16.l_725 to i8*), i64 96, i32 16, i1 false)
  %arrayidx484 = getelementptr inbounds [4 x [8 x i32*]]* %l_720, i32 0, i64 3
  %arrayidx485 = getelementptr inbounds [8 x i32*]* %arrayidx484, i32 0, i64 7
  %184 = load i32** %arrayidx485, align 8
  %185 = load i32*** %l_610, align 8
  store i32* %184, i32** %185, align 8
  %arrayidx486 = getelementptr inbounds [6 x [4 x i32]]* %l_725, i32 0, i64 3
  %arrayidx487 = getelementptr inbounds [4 x i32]* %arrayidx486, i32 0, i64 2
  %186 = load i32* %arrayidx487, align 4
  %dec488 = add i32 %186, -1
  store i32 %dec488, i32* %arrayidx487, align 4
  %187 = load i32* %p_17.addr, align 4
  %conv489 = sext i32 %187 to i64
  %call490 = call i64 @safe_mod_func_uint64_t_u_u(i64 %conv489, i64 -7309801776478932180)
  %conv491 = trunc i64 %call490 to i32
  %call492 = call i32 @safe_mod_func_int32_t_s_s(i32 1, i32 %conv491)
  %conv493 = sext i32 %call492 to i64
  %arrayidx494 = getelementptr inbounds [10 x %union.U0]* %l_732, i32 0, i64 6
  %cmp495 = icmp uge i64 %conv493, 1
  %conv496 = zext i1 %cmp495 to i32
  %188 = load i32** %l_650, align 8
  store i32 %conv496, i32* %188, align 4
  br label %if.end529

if.else497:                                       ; preds = %for.end459
  store i64* @g_49, i64** %l_740, align 8
  %189 = load volatile i32** @g_65, align 8
  %190 = load i32* %189, align 4
  %191 = load i32** %l_650, align 8
  store i32 %190, i32* %191, align 4
  %192 = load i32* %p_17.addr, align 4
  %tobool498 = icmp ne i32 %192, 0
  br i1 %tobool498, label %if.then499, label %if.end500

if.then499:                                       ; preds = %if.else497
  br label %for.inc773

if.end500:                                        ; preds = %if.else497
  %193 = load i32** %l_650, align 8
  %194 = load i32* %193, align 4
  %conv501 = sext i32 %194 to i64
  %cmp502 = icmp ne i64 %conv501, 621117889
  br i1 %cmp502, label %lor.end521, label %lor.rhs504

lor.rhs504:                                       ; preds = %if.end500
  %195 = load i32*** %l_610, align 8
  %196 = load i32** %195, align 8
  %197 = load i32* %196, align 4
  %198 = load i32** %l_650, align 8
  %199 = load i32* %198, align 4
  %call505 = call i32 @safe_add_func_uint32_t_u_u(i32 %197, i32 %199)
  %conv506 = zext i32 %call505 to i64
  %cmp507 = icmp eq i64 29697, %conv506
  %conv508 = zext i1 %cmp507 to i32
  %200 = load i32** @g_278, align 8
  %201 = load i32* %200, align 4
  %cmp509 = icmp sle i32 %conv508, %201
  %conv510 = zext i1 %cmp509 to i32
  %202 = load i32** %l_650, align 8
  %203 = load i32* %202, align 4
  %conv511 = sext i32 %203 to i64
  %or512 = or i64 %conv511, 3040382295
  %204 = load i32* %p_17.addr, align 4
  %conv513 = sext i32 %204 to i64
  %and514 = and i64 %or512, %conv513
  %205 = load i64** %l_740, align 8
  %206 = load i64* %205, align 8
  %or515 = or i64 %206, %and514
  store i64 %or515, i64* %205, align 8
  %cmp516 = icmp ne i32** getelementptr inbounds ([5 x [9 x i32*]]* @g_81, i32 0, i64 0, i64 0), %l_650
  %conv517 = zext i1 %cmp516 to i32
  %conv518 = sext i32 %conv517 to i64
  %cmp519 = icmp eq i64 %conv518, 0
  br label %lor.end521

lor.end521:                                       ; preds = %lor.rhs504, %if.end500
  %207 = phi i1 [ true, %if.end500 ], [ %cmp519, %lor.rhs504 ]
  %lor.ext522 = zext i1 %207 to i32
  %conv523 = sext i32 %lor.ext522 to i64
  %xor524 = xor i64 1524909388, %conv523
  %conv525 = trunc i64 %xor524 to i32
  %208 = load i32** %l_587, align 8
  store i32 %conv525, i32* %208, align 4
  %209 = load i32* %p_17.addr, align 4
  %tobool526 = icmp ne i32 %209, 0
  br i1 %tobool526, label %if.then527, label %if.end528

if.then527:                                       ; preds = %lor.end521
  br label %for.inc773

if.end528:                                        ; preds = %lor.end521
  br label %if.end529

if.end529:                                        ; preds = %if.end528, %if.then481
  %210 = load i32** @g_258, align 8
  %211 = load i32* %210, align 4
  %tobool530 = icmp ne i32 %211, 0
  br i1 %tobool530, label %if.then531, label %if.end532

if.then531:                                       ; preds = %if.end529
  br label %for.inc773

if.end532:                                        ; preds = %if.end529
  store i16 -7, i16* @g_166, align 2
  br label %for.cond533

for.cond533:                                      ; preds = %for.inc539, %if.end532
  %212 = load i16* @g_166, align 2
  %conv534 = sext i16 %212 to i32
  %cmp535 = icmp sge i32 %conv534, -30
  br i1 %cmp535, label %for.body537, label %for.end541

for.body537:                                      ; preds = %for.cond533
  %213 = load i32** @g_278, align 8
  %214 = load i32* %213, align 4
  %215 = load i32** %l_587, align 8
  %216 = load i32* %215, align 4
  %and538 = and i32 %216, %214
  store i32 %and538, i32* %215, align 4
  br label %for.inc539

for.inc539:                                       ; preds = %for.body537
  %217 = load i16* @g_166, align 2
  %dec540 = add i16 %217, -1
  store i16 %dec540, i16* @g_166, align 2
  br label %for.cond533

for.end541:                                       ; preds = %for.cond533
  br label %if.end542

if.end542:                                        ; preds = %for.end541
  %218 = load i32** %l_587, align 8
  %219 = load i32* %218, align 4
  %conv543 = sext i32 %219 to i64
  %or544 = or i64 %conv543, 3620196558
  %conv545 = trunc i64 %or544 to i32
  store i32 %conv545, i32* %218, align 4
  %220 = load i32** @g_278, align 8
  %221 = load i32* %220, align 4
  %call546 = call i32 @safe_div_func_int32_t_s_s(i32 %conv545, i32 %221)
  %222 = load i32** %l_650, align 8
  store i32 %call546, i32* %222, align 4
  br label %if.end547

if.end547:                                        ; preds = %if.end542, %for.end187
  store i64 28, i64* getelementptr inbounds (%union.U1* @g_536, i32 0, i32 0), align 8
  br label %for.cond548

for.cond548:                                      ; preds = %for.inc770, %if.end547
  %223 = load i64* getelementptr inbounds (%union.U1* @g_536, i32 0, i32 0), align 8
  %cmp549 = icmp sle i64 %223, -10
  br i1 %cmp549, label %for.body551, label %for.end772

for.body551:                                      ; preds = %for.cond548
  store i8*** null, i8**** %l_749, align 8
  store i8*** %l_747, i8**** %l_750, align 8
  store i16* @g_193, i16** %l_762, align 8
  store i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 2, i64 0, i64 3), i32** %l_765, align 8
  store %union.U0**** @g_618, %union.U0***** %l_783, align 8
  store i32 -1088988201, i32* %l_794, align 4
  %224 = bitcast %union.U0* %l_795 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %224, i8* bitcast (%union.U0* @func_16.l_795 to i8*), i64 8, i32 8, i1 false)
  store i32* null, i32** %l_799, align 8
  store i32** %l_799, i32*** %l_798, align 8
  %225 = bitcast [6 x [8 x i16*]]* %l_808 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %225, i8* bitcast ([6 x [8 x i16*]]* @func_16.l_808 to i8*), i64 384, i32 16, i1 false)
  %226 = load i8*** %l_747, align 8
  %227 = load i8**** %l_750, align 8
  store i8** %226, i8*** %227, align 8
  store i16 0, i16* bitcast (%union.U1* @g_130 to i16*), align 2
  br label %for.cond554

for.cond554:                                      ; preds = %for.inc735, %for.body551
  %228 = load i16* bitcast (%union.U1* @g_130 to i16*), align 2
  %conv555 = sext i16 %228 to i32
  %cmp556 = icmp sle i32 %conv555, 13
  br i1 %cmp556, label %for.body558, label %for.end737

for.body558:                                      ; preds = %for.cond554
  %arrayidx559 = getelementptr inbounds [10 x [8 x i32]]* %l_723, i32 0, i64 4
  %arrayidx560 = getelementptr inbounds [8 x i32]* %arrayidx559, i32 0, i64 5
  store i32* %arrayidx560, i32** %l_757, align 8
  store i32** @g_56, i32*** %l_777, align 8
  store i32*** %l_777, i32**** %l_776, align 8
  %229 = bitcast [1 x [5 x %union.U0]]* %l_784 to i8*
  call void @llvm.memset.p0i8.i64(i8* %229, i8 0, i64 40, i32 16, i1 false)
  %230 = bitcast i8* %229 to [1 x [5 x %union.U0]]*
  %231 = getelementptr [1 x [5 x %union.U0]]* %230, i32 0, i32 0
  %232 = getelementptr [5 x %union.U0]* %231, i32 0, i32 0
  %233 = getelementptr %union.U0* %232, i32 0, i32 0
  store i64 1764025790984637927, i64* %233
  %234 = getelementptr [5 x %union.U0]* %231, i32 0, i32 1
  %235 = getelementptr %union.U0* %234, i32 0, i32 0
  store i64 1764025790984637927, i64* %235
  %236 = getelementptr [5 x %union.U0]* %231, i32 0, i32 2
  %237 = getelementptr %union.U0* %236, i32 0, i32 0
  store i64 1764025790984637927, i64* %237
  %238 = getelementptr [5 x %union.U0]* %231, i32 0, i32 3
  %239 = getelementptr %union.U0* %238, i32 0, i32 0
  store i64 1764025790984637927, i64* %239
  %240 = getelementptr [5 x %union.U0]* %231, i32 0, i32 4
  %241 = getelementptr %union.U0* %240, i32 0, i32 0
  store i64 1764025790984637927, i64* %241
  store i16 0, i16* bitcast (%union.U1* @g_674 to i16*), align 2
  br label %for.cond563

for.cond563:                                      ; preds = %for.inc594, %for.body558
  %242 = load i16* bitcast (%union.U1* @g_674 to i16*), align 2
  %conv564 = sext i16 %242 to i32
  %cmp565 = icmp slt i32 %conv564, 19
  br i1 %cmp565, label %for.body567, label %for.end598

for.body567:                                      ; preds = %for.cond563
  %arrayinit.begin568 = getelementptr inbounds [8 x i8***]* %l_756, i64 0, i64 0
  store i8*** %l_747, i8**** %arrayinit.begin568
  %arrayinit.element569 = getelementptr inbounds i8**** %arrayinit.begin568, i64 1
  store i8*** %l_747, i8**** %arrayinit.element569
  %arrayinit.element570 = getelementptr inbounds i8**** %arrayinit.element569, i64 1
  store i8*** %l_747, i8**** %arrayinit.element570
  %arrayinit.element571 = getelementptr inbounds i8**** %arrayinit.element570, i64 1
  store i8*** %l_747, i8**** %arrayinit.element571
  %arrayinit.element572 = getelementptr inbounds i8**** %arrayinit.element571, i64 1
  store i8*** %l_747, i8**** %arrayinit.element572
  %arrayinit.element573 = getelementptr inbounds i8**** %arrayinit.element572, i64 1
  store i8*** %l_747, i8**** %arrayinit.element573
  %arrayinit.element574 = getelementptr inbounds i8**** %arrayinit.element573, i64 1
  store i8*** %l_747, i8**** %arrayinit.element574
  %arrayinit.element575 = getelementptr inbounds i8**** %arrayinit.element574, i64 1
  store i8*** %l_747, i8**** %arrayinit.element575
  %arrayidx577 = getelementptr inbounds [8 x i8***]* %l_756, i32 0, i64 2
  %243 = load i8**** %arrayidx577, align 8
  %cmp578 = icmp eq i8*** null, %243
  %conv579 = zext i1 %cmp578 to i32
  %conv580 = trunc i32 %conv579 to i16
  %call581 = call zeroext i16 @safe_unary_minus_func_uint16_t_u(i16 zeroext %conv580)
  %244 = load i32** %l_587, align 8
  store i32 354010782, i32* %244, align 4
  %245 = load i32** %l_587, align 8
  %246 = load i32* %245, align 4
  %247 = load i16** %l_761, align 8
  %248 = load i16** %l_762, align 8
  %249 = load i16*** @g_416, align 8
  store i16* %248, i16** %249, align 8
  %cmp582 = icmp eq i16* %247, %248
  %conv583 = zext i1 %cmp582 to i32
  %250 = load i32* %p_17.addr, align 4
  %call584 = call i32 @safe_div_func_int32_t_s_s(i32 -282743340, i32 -9)
  %cmp585 = icmp sgt i32 %250, %call584
  %conv586 = zext i1 %cmp585 to i32
  %cmp587 = icmp sle i32 %conv583, %conv586
  %conv588 = zext i1 %cmp587 to i32
  %conv589 = trunc i32 %conv588 to i8
  %call590 = call zeroext i8 @safe_sub_func_uint8_t_u_u(i8 zeroext %conv589, i8 zeroext 9)
  %conv591 = zext i8 %call590 to i64
  %cmp592 = icmp eq i64 %conv591, 1
  %conv593 = zext i1 %cmp592 to i32
  %251 = load i32*** %l_610, align 8
  store i32* null, i32** %251, align 8
  %252 = load i32** %l_765, align 8
  %253 = load i32*** %l_610, align 8
  store i32* %252, i32** %253, align 8
  br label %for.inc594

for.inc594:                                       ; preds = %for.body567
  %254 = load i16* bitcast (%union.U1* @g_674 to i16*), align 2
  %conv595 = sext i16 %254 to i64
  %call596 = call i64 @safe_add_func_int64_t_s_s(i64 %conv595, i64 4)
  %conv597 = trunc i64 %call596 to i16
  store i16 %conv597, i16* bitcast (%union.U1* @g_674 to i16*), align 2
  br label %for.cond563

for.end598:                                       ; preds = %for.cond563
  %255 = load volatile i8* @g_462, align 1
  %conv599 = sext i8 %255 to i32
  %256 = load i32*** %l_610, align 8
  %257 = load i32** %256, align 8
  %258 = load i32* %257, align 4
  %conv600 = sext i32 %258 to i64
  %259 = load i8*** %l_747, align 8
  %260 = load i8** %259, align 8
  %cmp601 = icmp ne i8* null, %260
  %conv602 = zext i1 %cmp601 to i32
  %conv603 = trunc i32 %conv602 to i8
  %261 = load i8* %l_768, align 1
  %conv604 = sext i8 %261 to i32
  %262 = load i32* bitcast (%union.U0* @g_13 to i32*), align 4
  %263 = load i32* %p_17.addr, align 4
  %conv605 = trunc i32 %263 to i16
  %call606 = call zeroext i16 @safe_mod_func_uint16_t_u_u(i16 zeroext %conv605, i16 zeroext -6)
  %264 = load i32* %p_17.addr, align 4
  %conv607 = sext i32 %264 to i64
  %cmp608 = icmp slt i64 %conv607, 0
  %conv609 = zext i1 %cmp608 to i32
  %conv610 = trunc i32 %conv609 to i8
  %265 = load i64* %l_773, align 8
  %conv611 = trunc i64 %265 to i8
  %call612 = call signext i8 @safe_sub_func_int8_t_s_s(i8 signext %conv610, i8 signext %conv611)
  %conv613 = sext i8 %call612 to i32
  %266 = load i32** %l_765, align 8
  %267 = load i32* %266, align 4
  %cmp614 = icmp ne i32 %conv613, %267
  br i1 %cmp614, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %for.end598
  %268 = load i32* %p_17.addr, align 4
  %tobool616 = icmp ne i32 %268, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.end598
  %269 = phi i1 [ false, %for.end598 ], [ %tobool616, %land.rhs ]
  %land.ext617 = zext i1 %269 to i32
  %270 = load i16** @g_417, align 8
  %271 = load i16* %270, align 2
  %conv618 = zext i16 %271 to i32
  %cmp619 = icmp slt i32 %land.ext617, %conv618
  %conv620 = zext i1 %cmp619 to i32
  %conv621 = sext i32 %conv620 to i64
  %272 = load i64* getelementptr inbounds (%union.U1* @g_536, i32 0, i32 0), align 8
  %and622 = and i64 %conv621, %272
  %273 = load i32** %l_587, align 8
  %274 = load i32* %273, align 4
  %conv623 = sext i32 %274 to i64
  %cmp624 = icmp eq i64 %and622, %conv623
  %conv625 = zext i1 %cmp624 to i32
  %275 = load i32** %l_650, align 8
  store i32 %conv625, i32* %275, align 4
  %cmp626 = icmp ne i32 %conv604, %conv625
  %conv627 = zext i1 %cmp626 to i32
  %call628 = call zeroext i8 @safe_lshift_func_uint8_t_u_u(i8 zeroext %conv603, i32 %conv627)
  %conv629 = zext i8 %call628 to i64
  %xor630 = xor i64 %conv629, 32826
  %xor631 = xor i64 %conv600, %xor630
  %276 = load i8** %l_748, align 8
  %277 = load i8* %276, align 1
  %conv632 = sext i8 %277 to i64
  %xor633 = xor i64 %conv632, %xor631
  %conv634 = trunc i64 %xor633 to i8
  store i8 %conv634, i8* %276, align 1
  %conv635 = sext i8 %conv634 to i32
  %xor636 = xor i32 %conv599, %conv635
  %tobool637 = icmp ne i32 %xor636, 0
  br i1 %tobool637, label %if.then638, label %if.else661

if.then638:                                       ; preds = %land.end
  store i32*** @g_134, i32**** %l_779, align 8
  %arrayinit.begin639 = getelementptr inbounds [4 x i32****]* %l_778, i64 0, i64 0
  store i32**** %l_779, i32***** %arrayinit.begin639
  %arrayinit.element640 = getelementptr inbounds i32***** %arrayinit.begin639, i64 1
  store i32**** %l_779, i32***** %arrayinit.element640
  %arrayinit.element641 = getelementptr inbounds i32***** %arrayinit.element640, i64 1
  store i32**** %l_779, i32***** %arrayinit.element641
  %arrayinit.element642 = getelementptr inbounds i32***** %arrayinit.element641, i64 1
  store i32**** %l_779, i32***** %arrayinit.element642
  %278 = load i32** %l_650, align 8
  %279 = load i32* %278, align 4
  %280 = load i32* %p_17.addr, align 4
  %cmp644 = icmp sle i32 %279, %280
  %conv645 = zext i1 %cmp644 to i32
  %281 = load i32**** %l_776, align 8
  store i32*** null, i32**** getelementptr inbounds ([7 x i32***]* @g_780, i32 0, i64 0), align 8
  %cmp646 = icmp ne i32*** %281, null
  %conv647 = zext i1 %cmp646 to i32
  %conv648 = sext i32 %conv647 to i64
  %282 = load i32* %p_17.addr, align 4
  %conv649 = sext i32 %282 to i64
  %call650 = call i64 @safe_mod_func_int64_t_s_s(i64 %conv648, i64 %conv649)
  %283 = load %union.U0***** %l_783, align 8
  %cmp651 = icmp ne %union.U0**** @g_618, %283
  %conv652 = zext i1 %cmp651 to i32
  %284 = load i32** %l_650, align 8
  %285 = load i32* %284, align 4
  %xor653 = xor i32 %conv652, %285
  %286 = load i32* bitcast (%union.U0* @g_13 to i32*), align 4
  %cmp654 = icmp ne i32 %xor653, %286
  %conv655 = zext i1 %cmp654 to i32
  %cmp656 = icmp sgt i32 %conv645, %conv655
  %conv657 = zext i1 %cmp656 to i32
  %287 = load i32** %l_757, align 8
  %288 = load i32* %287, align 4
  %xor658 = xor i32 %288, %conv657
  store i32 %xor658, i32* %287, align 4
  %289 = load i32*** %l_610, align 8
  %290 = load i32** %289, align 8
  %291 = load i32**** %l_779, align 8
  %292 = load i32*** %291, align 8
  store i32* %290, i32** %292, align 8
  %293 = load i32** %l_650, align 8
  %294 = load i32* %293, align 4
  %295 = load i32*** @g_134, align 8
  %296 = load i32** %295, align 8
  %297 = load i32**** %l_776, align 8
  %298 = load i32*** %297, align 8
  store i32* %296, i32** %298, align 8
  %arrayidx659 = getelementptr inbounds [1 x [5 x %union.U0]]* %l_784, i32 0, i64 0
  %arrayidx660 = getelementptr inbounds [5 x %union.U0]* %arrayidx659, i32 0, i64 0
  %299 = bitcast %union.U0* %retval to i8*
  %300 = bitcast %union.U0* %arrayidx660 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %299, i8* %300, i64 8, i32 8, i1 false)
  br label %return

if.else661:                                       ; preds = %land.end
  store %union.U0***** null, %union.U0****** %l_785, align 8
  store %union.U0***** %l_783, %union.U0****** %l_786, align 8
  %arrayinit.begin662 = getelementptr inbounds [3 x [10 x i64*]]* %l_789, i64 0, i64 0
  %arrayinit.begin663 = getelementptr inbounds [10 x i64*]* %arrayinit.begin662, i64 0, i64 0
  store i64* getelementptr inbounds (%union.U1* @g_674, i32 0, i32 0), i64** %arrayinit.begin663
  %arrayinit.element664 = getelementptr inbounds i64** %arrayinit.begin663, i64 1
  %arrayidx665 = getelementptr inbounds [10 x %union.U0]* %l_732, i32 0, i64 6
  %f0666 = bitcast %union.U0* %arrayidx665 to i64*
  store i64* %f0666, i64** %arrayinit.element664
  %arrayinit.element667 = getelementptr inbounds i64** %arrayinit.element664, i64 1
  store i64* getelementptr inbounds (%union.U1* @g_674, i32 0, i32 0), i64** %arrayinit.element667
  %arrayinit.element668 = getelementptr inbounds i64** %arrayinit.element667, i64 1
  %arrayidx669 = getelementptr inbounds [10 x %union.U0]* %l_732, i32 0, i64 6
  %f0670 = bitcast %union.U0* %arrayidx669 to i64*
  store i64* %f0670, i64** %arrayinit.element668
  %arrayinit.element671 = getelementptr inbounds i64** %arrayinit.element668, i64 1
  store i64* getelementptr inbounds (%union.U1* @g_674, i32 0, i32 0), i64** %arrayinit.element671
  %arrayinit.element672 = getelementptr inbounds i64** %arrayinit.element671, i64 1
  %arrayidx673 = getelementptr inbounds [10 x %union.U0]* %l_732, i32 0, i64 6
  %f0674 = bitcast %union.U0* %arrayidx673 to i64*
  store i64* %f0674, i64** %arrayinit.element672
  %arrayinit.element675 = getelementptr inbounds i64** %arrayinit.element672, i64 1
  store i64* getelementptr inbounds (%union.U1* @g_674, i32 0, i32 0), i64** %arrayinit.element675
  %arrayinit.element676 = getelementptr inbounds i64** %arrayinit.element675, i64 1
  %arrayidx677 = getelementptr inbounds [10 x %union.U0]* %l_732, i32 0, i64 6
  %f0678 = bitcast %union.U0* %arrayidx677 to i64*
  store i64* %f0678, i64** %arrayinit.element676
  %arrayinit.element679 = getelementptr inbounds i64** %arrayinit.element676, i64 1
  store i64* getelementptr inbounds (%union.U1* @g_674, i32 0, i32 0), i64** %arrayinit.element679
  %arrayinit.element680 = getelementptr inbounds i64** %arrayinit.element679, i64 1
  %arrayidx681 = getelementptr inbounds [10 x %union.U0]* %l_732, i32 0, i64 6
  %f0682 = bitcast %union.U0* %arrayidx681 to i64*
  store i64* %f0682, i64** %arrayinit.element680
  %arrayinit.element683 = getelementptr inbounds [10 x i64*]* %arrayinit.begin662, i64 1
  %arrayinit.begin684 = getelementptr inbounds [10 x i64*]* %arrayinit.element683, i64 0, i64 0
  store i64* getelementptr inbounds (%union.U1* @g_674, i32 0, i32 0), i64** %arrayinit.begin684
  %arrayinit.element685 = getelementptr inbounds i64** %arrayinit.begin684, i64 1
  %arrayidx686 = getelementptr inbounds [10 x %union.U0]* %l_732, i32 0, i64 6
  %f0687 = bitcast %union.U0* %arrayidx686 to i64*
  store i64* %f0687, i64** %arrayinit.element685
  %arrayinit.element688 = getelementptr inbounds i64** %arrayinit.element685, i64 1
  store i64* getelementptr inbounds (%union.U1* @g_674, i32 0, i32 0), i64** %arrayinit.element688
  %arrayinit.element689 = getelementptr inbounds i64** %arrayinit.element688, i64 1
  %arrayidx690 = getelementptr inbounds [10 x %union.U0]* %l_732, i32 0, i64 6
  %f0691 = bitcast %union.U0* %arrayidx690 to i64*
  store i64* %f0691, i64** %arrayinit.element689
  %arrayinit.element692 = getelementptr inbounds i64** %arrayinit.element689, i64 1
  store i64* getelementptr inbounds (%union.U1* @g_674, i32 0, i32 0), i64** %arrayinit.element692
  %arrayinit.element693 = getelementptr inbounds i64** %arrayinit.element692, i64 1
  %arrayidx694 = getelementptr inbounds [10 x %union.U0]* %l_732, i32 0, i64 6
  %f0695 = bitcast %union.U0* %arrayidx694 to i64*
  store i64* %f0695, i64** %arrayinit.element693
  %arrayinit.element696 = getelementptr inbounds i64** %arrayinit.element693, i64 1
  store i64* getelementptr inbounds (%union.U1* @g_674, i32 0, i32 0), i64** %arrayinit.element696
  %arrayinit.element697 = getelementptr inbounds i64** %arrayinit.element696, i64 1
  %arrayidx698 = getelementptr inbounds [10 x %union.U0]* %l_732, i32 0, i64 6
  %f0699 = bitcast %union.U0* %arrayidx698 to i64*
  store i64* %f0699, i64** %arrayinit.element697
  %arrayinit.element700 = getelementptr inbounds i64** %arrayinit.element697, i64 1
  store i64* getelementptr inbounds (%union.U1* @g_674, i32 0, i32 0), i64** %arrayinit.element700
  %arrayinit.element701 = getelementptr inbounds i64** %arrayinit.element700, i64 1
  %arrayidx702 = getelementptr inbounds [10 x %union.U0]* %l_732, i32 0, i64 6
  %f0703 = bitcast %union.U0* %arrayidx702 to i64*
  store i64* %f0703, i64** %arrayinit.element701
  %arrayinit.element704 = getelementptr inbounds [10 x i64*]* %arrayinit.element683, i64 1
  %arrayinit.begin705 = getelementptr inbounds [10 x i64*]* %arrayinit.element704, i64 0, i64 0
  store i64* getelementptr inbounds (%union.U1* @g_674, i32 0, i32 0), i64** %arrayinit.begin705
  %arrayinit.element706 = getelementptr inbounds i64** %arrayinit.begin705, i64 1
  %arrayidx707 = getelementptr inbounds [10 x %union.U0]* %l_732, i32 0, i64 6
  %f0708 = bitcast %union.U0* %arrayidx707 to i64*
  store i64* %f0708, i64** %arrayinit.element706
  %arrayinit.element709 = getelementptr inbounds i64** %arrayinit.element706, i64 1
  store i64* getelementptr inbounds (%union.U1* @g_674, i32 0, i32 0), i64** %arrayinit.element709
  %arrayinit.element710 = getelementptr inbounds i64** %arrayinit.element709, i64 1
  %arrayidx711 = getelementptr inbounds [10 x %union.U0]* %l_732, i32 0, i64 6
  %f0712 = bitcast %union.U0* %arrayidx711 to i64*
  store i64* %f0712, i64** %arrayinit.element710
  %arrayinit.element713 = getelementptr inbounds i64** %arrayinit.element710, i64 1
  store i64* getelementptr inbounds (%union.U1* @g_674, i32 0, i32 0), i64** %arrayinit.element713
  %arrayinit.element714 = getelementptr inbounds i64** %arrayinit.element713, i64 1
  %arrayidx715 = getelementptr inbounds [10 x %union.U0]* %l_732, i32 0, i64 6
  %f0716 = bitcast %union.U0* %arrayidx715 to i64*
  store i64* %f0716, i64** %arrayinit.element714
  %arrayinit.element717 = getelementptr inbounds i64** %arrayinit.element714, i64 1
  store i64* getelementptr inbounds (%union.U1* @g_674, i32 0, i32 0), i64** %arrayinit.element717
  %arrayinit.element718 = getelementptr inbounds i64** %arrayinit.element717, i64 1
  %arrayidx719 = getelementptr inbounds [10 x %union.U0]* %l_732, i32 0, i64 6
  %f0720 = bitcast %union.U0* %arrayidx719 to i64*
  store i64* %f0720, i64** %arrayinit.element718
  %arrayinit.element721 = getelementptr inbounds i64** %arrayinit.element718, i64 1
  store i64* getelementptr inbounds (%union.U1* @g_674, i32 0, i32 0), i64** %arrayinit.element721
  %arrayinit.element722 = getelementptr inbounds i64** %arrayinit.element721, i64 1
  %arrayidx723 = getelementptr inbounds [10 x %union.U0]* %l_732, i32 0, i64 6
  %f0724 = bitcast %union.U0* %arrayidx723 to i64*
  store i64* %f0724, i64** %arrayinit.element722
  %301 = load i32* %p_17.addr, align 4
  %302 = load %union.U0****** %l_786, align 8
  store %union.U0**** @g_618, %union.U0***** %302, align 8
  %303 = load i32** %l_765, align 8
  store i32 1, i32* %303, align 4
  store i64 1906634879873325217, i64* getelementptr inbounds (%union.U1* @g_674, i32 0, i32 0), align 8
  %304 = load i32* %p_17.addr, align 4
  %conv727 = sext i32 %304 to i64
  %call728 = call i64 @safe_sub_func_int64_t_s_s(i64 1906634879873325217, i64 %conv727)
  %305 = load i32** %l_757, align 8
  %306 = load i32* %305, align 4
  %conv729 = trunc i32 %306 to i8
  %call730 = call signext i8 @safe_mul_func_int8_t_s_s(i8 signext 10, i8 signext %conv729)
  %call731 = call zeroext i8 @safe_lshift_func_uint8_t_u_s(i8 zeroext %call730, i32 1)
  %conv732 = zext i8 %call731 to i64
  %cmp733 = icmp sle i64 %call728, %conv732
  %conv734 = zext i1 %cmp733 to i32
  %307 = load i32** %l_765, align 8
  store i32 %conv734, i32* %307, align 4
  store i32 %conv734, i32* %l_794, align 4
  %308 = load volatile %union.U0*** @g_106, align 8
  %309 = load %union.U0** %308, align 8
  %310 = bitcast %union.U0* %retval to i8*
  %311 = bitcast %union.U0* %309 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %310, i8* %311, i64 8, i32 8, i1 false)
  br label %return

for.inc735:                                       ; No predecessors!
  %312 = load i16* bitcast (%union.U1* @g_130 to i16*), align 2
  %inc736 = add i16 %312, 1
  store i16 %inc736, i16* bitcast (%union.U1* @g_130 to i16*), align 2
  br label %for.cond554

for.end737:                                       ; preds = %for.cond554
  %313 = load i32** %l_765, align 8
  %314 = load i32*** %l_798, align 8
  store i32* %313, i32** %314, align 8
  %cmp738 = icmp eq i32* @g_322, %313
  %conv739 = zext i1 %cmp738 to i32
  %315 = load i16*** @g_416, align 8
  %316 = load i16** %315, align 8
  %317 = load i16* %316, align 2
  %conv740 = zext i16 %317 to i32
  %318 = load i32** %l_765, align 8
  %319 = load i32* %318, align 4
  %320 = load i32** %l_650, align 8
  %321 = load i32* %320, align 4
  %322 = load i16* @g_193, align 2
  %conv741 = zext i16 %322 to i32
  %cmp742 = icmp ne i32 %321, %conv741
  %conv743 = zext i1 %cmp742 to i32
  %conv744 = trunc i32 %conv743 to i16
  %323 = load i32** %l_650, align 8
  %324 = load i32* %323, align 4
  %arrayidx745 = getelementptr inbounds [10 x [8 x i32]]* %l_723, i32 0, i64 6
  %arrayidx746 = getelementptr inbounds [8 x i32]* %arrayidx745, i32 0, i64 4
  %325 = load i32* %arrayidx746, align 4
  %and747 = and i32 %325, %324
  store i32 %and747, i32* %arrayidx746, align 4
  %conv748 = trunc i32 %and747 to i16
  %call749 = call zeroext i16 @safe_mul_func_uint16_t_u_u(i16 zeroext %conv744, i16 zeroext %conv748)
  %conv750 = zext i16 %call749 to i32
  %call751 = call i32 @safe_sub_func_int32_t_s_s(i32 %319, i32 %conv750)
  %326 = load i32* %p_17.addr, align 4
  %and752 = and i32 %call751, %326
  %327 = load i32* %p_17.addr, align 4
  %cmp753 = icmp slt i32 %and752, %327
  %conv754 = zext i1 %cmp753 to i32
  %cmp755 = icmp sgt i32 %conv740, %conv754
  %conv756 = zext i1 %cmp755 to i32
  %conv757 = trunc i32 %conv756 to i16
  %328 = load i32* %p_17.addr, align 4
  %conv758 = trunc i32 %328 to i16
  %call759 = call signext i16 @safe_sub_func_int16_t_s_s(i16 signext %conv757, i16 signext %conv758)
  %conv760 = sext i16 %call759 to i64
  %cmp761 = icmp ne i64 %conv760, 45513
  %conv762 = zext i1 %cmp761 to i32
  %329 = load i32** %l_765, align 8
  %330 = load i32* %329, align 4
  %and763 = and i32 %conv762, %330
  %conv764 = sext i32 %and763 to i64
  %call765 = call i64 @safe_sub_func_uint64_t_u_u(i64 %conv764, i64 -5051406470533887536)
  %331 = load i64** %l_606, align 8
  store i64 %call765, i64* %331, align 8
  %332 = load volatile i8* bitcast (%union.U1* @g_536 to i8*), align 1
  %conv766 = sext i8 %332 to i64
  %cmp767 = icmp sle i64 %call765, %conv766
  %conv768 = zext i1 %cmp767 to i32
  %333 = load i32** %l_650, align 8
  store i32 %conv768, i32* %333, align 4
  %334 = load i32** %l_587, align 8
  %335 = load i32* %334, align 4
  %or769 = or i32 %335, %conv768
  store i32 %or769, i32* %334, align 4
  br label %for.inc770

for.inc770:                                       ; preds = %for.end737
  %336 = load i64* getelementptr inbounds (%union.U1* @g_536, i32 0, i32 0), align 8
  %dec771 = add nsw i64 %336, -1
  store i64 %dec771, i64* getelementptr inbounds (%union.U1* @g_536, i32 0, i32 0), align 8
  br label %for.cond548

for.end772:                                       ; preds = %for.cond548
  br label %for.inc773

for.inc773:                                       ; preds = %for.end772, %if.then531, %if.then527, %if.then499
  %337 = load i64* getelementptr inbounds (%union.U1* @g_307, i32 0, i32 0), align 8
  %dec774 = add nsw i64 %337, -1
  store i64 %dec774, i64* getelementptr inbounds (%union.U1* @g_307, i32 0, i32 0), align 8
  br label %for.cond79

for.end775:                                       ; preds = %if.then132, %for.cond79
  br label %if.end823

if.else776:                                       ; preds = %entry
  store i32* @g_3, i32** %l_814, align 8
  store i32 0, i32* %l_823, align 4
  store i32 0, i32* %l_824, align 4
  store i32 -5, i32* %l_825, align 4
  %338 = bitcast [5 x i8]* %l_826 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %338, i8* getelementptr inbounds ([5 x i8]* @func_16.l_826, i32 0, i32 0), i64 5, i32 1, i1 false)
  store i32 1139644671, i32* %l_827, align 4
  store i8 69, i8* %l_828, align 1
  store i32 0, i32* %i777, align 4
  br label %for.cond778

for.cond778:                                      ; preds = %for.inc784, %if.else776
  %339 = load i32* %i777, align 4
  %cmp779 = icmp slt i32 %339, 5
  br i1 %cmp779, label %for.body781, label %for.end786

for.body781:                                      ; preds = %for.cond778
  %340 = load i32* %i777, align 4
  %idxprom782 = sext i32 %340 to i64
  %arrayidx783 = getelementptr inbounds [5 x i8]* %l_831, i32 0, i64 %idxprom782
  store i8 86, i8* %arrayidx783, align 1
  br label %for.inc784

for.inc784:                                       ; preds = %for.body781
  %341 = load i32* %i777, align 4
  %inc785 = add nsw i32 %341, 1
  store i32 %inc785, i32* %i777, align 4
  br label %for.cond778

for.end786:                                       ; preds = %for.cond778
  store i64 -5, i64* getelementptr inbounds (%union.U1* @g_674, i32 0, i32 0), align 8
  br label %for.cond787

for.cond787:                                      ; preds = %for.inc791, %for.end786
  %342 = load i64* getelementptr inbounds (%union.U1* @g_674, i32 0, i32 0), align 8
  %cmp788 = icmp sgt i64 %342, -2
  br i1 %cmp788, label %for.body790, label %for.end793

for.body790:                                      ; preds = %for.cond787
  store i32* null, i32** %l_812, align 8
  store i32* @g_471, i32** %l_813, align 8
  %343 = load i32* %p_17.addr, align 4
  %344 = load i32** %l_813, align 8
  store i32 %343, i32* %344, align 4
  br label %for.inc791

for.inc791:                                       ; preds = %for.body790
  %345 = load i64* getelementptr inbounds (%union.U1* @g_674, i32 0, i32 0), align 8
  %inc792 = add nsw i64 %345, 1
  store i64 %inc792, i64* getelementptr inbounds (%union.U1* @g_674, i32 0, i32 0), align 8
  br label %for.cond787

for.end793:                                       ; preds = %for.cond787
  %346 = load i32*** %l_610, align 8
  %347 = load i32*** %l_610, align 8
  %348 = load i32** %347, align 8
  %349 = load i32* %348, align 4
  %350 = load i32** %l_814, align 8
  %351 = load i32*** %l_610, align 8
  %352 = load i32** %351, align 8
  %call794 = call i64 @func_18(i32** %346, i32* %350, i32* %352)
  %conv795 = trunc i64 %call794 to i32
  %353 = load i32** %l_814, align 8
  store i32 %conv795, i32* %353, align 4
  store i32 0, i32* bitcast (%union.U1* @g_536 to i32*), align 4
  br label %for.cond796

for.cond796:                                      ; preds = %for.inc818, %for.end793
  %354 = load i32* bitcast (%union.U1* @g_536 to i32*), align 4
  %cmp797 = icmp eq i32 %354, 2
  br i1 %cmp797, label %for.body799, label %for.end822

for.body799:                                      ; preds = %for.cond796
  store i32* null, i32** %l_818, align 8
  store i32* @g_3, i32** %l_819, align 8
  store i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 2, i64 0, i64 3), i32** %l_820, align 8
  store i32* @g_3, i32** %l_821, align 8
  store i16 30819, i16* %l_829, align 2
  store i32 2124607890, i32* %l_836, align 4
  store i32 0, i32* %i800, align 4
  br label %for.cond801

for.cond801:                                      ; preds = %for.inc809, %for.body799
  %355 = load i32* %i800, align 4
  %cmp802 = icmp slt i32 %355, 4
  br i1 %cmp802, label %for.body804, label %for.end811

for.body804:                                      ; preds = %for.cond801
  %arrayidx805 = getelementptr inbounds [10 x [8 x i32]]* %l_723, i32 0, i64 6
  %arrayidx806 = getelementptr inbounds [8 x i32]* %arrayidx805, i32 0, i64 0
  %356 = load i32* %i800, align 4
  %idxprom807 = sext i32 %356 to i64
  %arrayidx808 = getelementptr inbounds [4 x i32*]* %l_822, i32 0, i64 %idxprom807
  store i32* %arrayidx806, i32** %arrayidx808, align 8
  br label %for.inc809

for.inc809:                                       ; preds = %for.body804
  %357 = load i32* %i800, align 4
  %inc810 = add nsw i32 %357, 1
  store i32 %inc810, i32* %i800, align 4
  br label %for.cond801

for.end811:                                       ; preds = %for.cond801
  %arrayidx812 = getelementptr inbounds [5 x i8]* %l_831, i32 0, i64 3
  %358 = load i8* %arrayidx812, align 1
  %dec813 = add i8 %358, -1
  store i8 %dec813, i8* %arrayidx812, align 1
  %359 = load i16*** @g_416, align 8
  %360 = load i16** %359, align 8
  %361 = load i16* %360, align 2
  %362 = load i32* %p_17.addr, align 4
  %call814 = call zeroext i16 @safe_rshift_func_uint16_t_u_s(i16 zeroext %361, i32 %362)
  %conv815 = zext i16 %call814 to i32
  %363 = load i32* %p_17.addr, align 4
  %cmp816 = icmp sge i32 %conv815, %363
  %conv817 = zext i1 %cmp816 to i32
  store i32 %conv817, i32* %l_836, align 4
  %364 = load i32*** %l_610, align 8
  %365 = load i32** %364, align 8
  %366 = load i32*** %l_610, align 8
  store i32* %365, i32** %366, align 8
  %367 = load i32*** @g_134, align 8
  store i32* %365, i32** %367, align 8
  br label %for.inc818

for.inc818:                                       ; preds = %for.end811
  %368 = load i32* bitcast (%union.U1* @g_536 to i32*), align 4
  %conv819 = trunc i32 %368 to i8
  %call820 = call signext i8 @safe_add_func_int8_t_s_s(i8 signext %conv819, i8 signext 9)
  %conv821 = sext i8 %call820 to i32
  store i32 %conv821, i32* bitcast (%union.U1* @g_536 to i32*), align 4
  br label %for.cond796

for.end822:                                       ; preds = %for.cond796
  br label %if.end823

if.end823:                                        ; preds = %for.end822, %for.end775
  store i16 0, i16* @g_193, align 2
  br label %for.cond824

for.cond824:                                      ; preds = %for.inc831, %if.end823
  %369 = load i16* @g_193, align 2
  %conv825 = zext i16 %369 to i32
  %cmp826 = icmp sle i32 %conv825, 4
  br i1 %cmp826, label %for.body828, label %for.end835

for.body828:                                      ; preds = %for.cond824
  store %union.U1* @g_815, %union.U1** %l_846, align 8
  store %union.U1** %l_846, %union.U1*** %l_847, align 8
  %370 = bitcast [2 x [5 x i16*]]* %l_848 to i8*
  call void @llvm.memset.p0i8.i64(i8* %370, i8 0, i64 80, i32 16, i1 false)
  store i32 657740449, i32* %l_849, align 4
  store i64* getelementptr inbounds (%union.U1* @g_130, i32 0, i32 0), i64** %l_850, align 8
  store i32 9, i32* %l_851, align 4
  store %union.U0*** null, %union.U0**** %l_859, align 8
  store i32 1183633355, i32* %l_873, align 4
  store i32 0, i32* %l_875, align 4
  store i32 2, i32* %l_876, align 4
  store i32 1177997124, i32* %l_877, align 4
  store i32 -1, i32* %l_878, align 4
  store i32 -1846570020, i32* %l_879, align 4
  store i32 -1479080390, i32* %l_881, align 4
  store i64 -4687677850562450535, i64* %l_882, align 8
  br label %for.inc831

for.inc831:                                       ; preds = %for.body828
  %371 = load i16* @g_193, align 2
  %conv832 = zext i16 %371 to i32
  %add833 = add nsw i32 %conv832, 1
  %conv834 = trunc i32 %add833 to i16
  store i16 %conv834, i16* @g_193, align 2
  br label %for.cond824

for.end835:                                       ; preds = %for.cond824
  %372 = load %union.U0**** @g_618, align 8
  %373 = load %union.U0*** %372, align 8
  store %union.U0* null, %union.U0** %373, align 8
  %374 = bitcast %union.U0* %retval to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %374, i8* bitcast (%union.U0* @g_13 to i8*), i64 8, i32 8, i1 false)
  br label %return

return:                                           ; preds = %for.end835, %if.else661, %if.then638, %for.end438, %for.body137
  %coerce.dive = getelementptr %union.U0* %retval, i32 0, i32 0
  %375 = load i64* %coerce.dive
  ret i64 %375
}

define internal i64 @func_18(i32** %p_19, i32* %p_20, i32* %p_21) nounwind uwtable {
entry:
  %p_19.addr = alloca i32**, align 8
  %p_20.addr = alloca i32*, align 8
  %p_21.addr = alloca i32*, align 8
  %l_571 = alloca i32*, align 8
  %l_572 = alloca [7 x [9 x i32*]], align 16
  %l_573 = alloca i8, align 1
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32** %p_19, i32*** %p_19.addr, align 8
  store i32* %p_20, i32** %p_20.addr, align 8
  store i32* %p_21, i32** %p_21.addr, align 8
  store i32* null, i32** %l_571, align 8
  %0 = bitcast [7 x [9 x i32*]]* %l_572 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* bitcast ([7 x [9 x i32*]]* @func_18.l_572 to i8*), i64 504, i32 16, i1 false)
  store i8 2, i8* %l_573, align 1
  %1 = load i32** %p_20.addr, align 8
  %2 = load i32* %1, align 4
  %conv = sext i32 %2 to i64
  %conv1 = trunc i64 %conv to i32
  store i32 %conv1, i32* %1, align 4
  %3 = load i8* %l_573, align 1
  %inc = add i8 %3, 1
  store i8 %inc, i8* %l_573, align 1
  %4 = load volatile i64* @g_163, align 8
  ret i64 %4
}

define internal i32** @func_22(i32** %p_23, i32* %p_24, i64 %p_25.coerce, i32* %p_26) nounwind uwtable {
entry:
  %p_23.addr = alloca i32**, align 8
  %p_24.addr = alloca i32*, align 8
  %p_25 = alloca %union.U0, align 8
  %p_26.addr = alloca i32*, align 8
  %l_279 = alloca i8, align 1
  %l_343 = alloca i32*, align 8
  %l_346 = alloca i32*, align 8
  %l_351 = alloca i32*, align 8
  %l_379 = alloca i32, align 4
  %l_398 = alloca [8 x i16], align 16
  %l_402 = alloca i32, align 4
  %l_420 = alloca i16**, align 8
  %l_428 = alloca i8, align 1
  %l_456 = alloca i32*, align 8
  %l_459 = alloca i32, align 4
  %l_460 = alloca i32, align 4
  %l_464 = alloca [4 x i32], align 16
  %l_468 = alloca i16, align 2
  %l_535 = alloca %union.U1*, align 8
  %l_560 = alloca i16, align 2
  %i = alloca i32, align 4
  %l_269 = alloca i32, align 4
  %l_273 = alloca i16*, align 8
  %l_281 = alloca i8, align 1
  %l_292 = alloca i32, align 4
  %l_301 = alloca i32**, align 8
  %l_306 = alloca i16, align 2
  %l_314 = alloca i64, align 8
  %l_337 = alloca %union.U0**, align 8
  %l_442 = alloca i32*, align 8
  %l_458 = alloca [7 x i32], align 16
  %l_463 = alloca i16, align 2
  %i13 = alloca i32, align 4
  %l_271 = alloca i16*, align 8
  %l_277 = alloca i32*, align 8
  %l_342 = alloca i64, align 8
  %l_344 = alloca i32*, align 8
  %l_354 = alloca [2 x [6 x i32]], align 16
  %l_399 = alloca %union.U1**, align 8
  %i19 = alloca i32, align 4
  %j = alloca i32, align 4
  %l_490 = alloca i64*, align 8
  %l_517 = alloca i32, align 4
  %l_521 = alloca i32, align 4
  %l_554 = alloca i32, align 4
  %l_555 = alloca i32, align 4
  %l_556 = alloca i32, align 4
  %l_557 = alloca i32, align 4
  %l_558 = alloca [6 x [6 x [3 x i32]]], align 16
  %i31 = alloca i32, align 4
  %j32 = alloca i32, align 4
  %k = alloca i32, align 4
  %l_484 = alloca i16*, align 8
  %l_518 = alloca i32, align 4
  %l_519 = alloca i32, align 4
  %l_520 = alloca i32, align 4
  %l_522 = alloca i32, align 4
  %l_537 = alloca i16, align 2
  %l_548 = alloca i32*, align 8
  %l_549 = alloca i32*, align 8
  %l_550 = alloca i32*, align 8
  %l_551 = alloca i32*, align 8
  %l_552 = alloca i32*, align 8
  %l_553 = alloca [5 x i32*], align 16
  %l_559 = alloca i64, align 8
  %l_565 = alloca [7 x i16], align 2
  %l_566 = alloca i16, align 2
  %i43 = alloca i32, align 4
  %l_472 = alloca i32, align 4
  %l_514 = alloca i32, align 4
  %l_523 = alloca i32, align 4
  %l_524 = alloca i32, align 4
  %l_525 = alloca i32, align 4
  %l_540 = alloca [7 x i32*], align 16
  %i61 = alloca i32, align 4
  %i75 = alloca i32, align 4
  %j76 = alloca i32, align 4
  %k77 = alloca i32, align 4
  store i32** %p_23, i32*** %p_23.addr, align 8
  store i32* %p_24, i32** %p_24.addr, align 8
  %coerce.dive = getelementptr %union.U0* %p_25, i32 0, i32 0
  store i64 %p_25.coerce, i64* %coerce.dive
  store i32* %p_26, i32** %p_26.addr, align 8
  store i8 -31, i8* %l_279, align 1
  store i32* bitcast (%union.U0* @g_13 to i32*), i32** %l_343, align 8
  store i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 0, i64 0, i64 9), i32** %l_346, align 8
  store i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 2, i64 0, i64 3), i32** %l_351, align 8
  store i32 1, i32* %l_379, align 4
  store i32 -2081881088, i32* %l_402, align 4
  store i16** null, i16*** %l_420, align 8
  store i8 112, i8* %l_428, align 1
  store i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 3, i64 0, i64 7), i32** %l_456, align 8
  store i32 -1588151702, i32* %l_459, align 4
  store i32 1, i32* %l_460, align 4
  store i16 1, i16* %l_468, align 2
  store %union.U1* @g_536, %union.U1** %l_535, align 8
  store i16 18591, i16* %l_560, align 2
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4
  %cmp = icmp slt i32 %0, 8
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32* %i, align 4
  %idxprom = sext i32 %1 to i64
  %arrayidx = getelementptr inbounds [8 x i16]* %l_398, i32 0, i64 %idxprom
  store i16 -10, i16* %arrayidx, align 2
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %2 = load i32* %i, align 4
  %inc = add nsw i32 %2, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %i, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc6, %for.end
  %3 = load i32* %i, align 4
  %cmp2 = icmp slt i32 %3, 4
  br i1 %cmp2, label %for.body3, label %for.end8

for.body3:                                        ; preds = %for.cond1
  %4 = load i32* %i, align 4
  %idxprom4 = sext i32 %4 to i64
  %arrayidx5 = getelementptr inbounds [4 x i32]* %l_464, i32 0, i64 %idxprom4
  store i32 -125595851, i32* %arrayidx5, align 4
  br label %for.inc6

for.inc6:                                         ; preds = %for.body3
  %5 = load i32* %i, align 4
  %inc7 = add nsw i32 %5, 1
  store i32 %inc7, i32* %i, align 4
  br label %for.cond1

for.end8:                                         ; preds = %for.cond1
  store i8 0, i8* @g_182, align 1
  br label %for.cond9

for.cond9:                                        ; preds = %for.inc23, %for.end8
  %6 = load i8* @g_182, align 1
  %conv = zext i8 %6 to i32
  %cmp10 = icmp sle i32 %conv, 48
  br i1 %cmp10, label %for.body12, label %for.end25

for.body12:                                       ; preds = %for.cond9
  store i32 168621101, i32* %l_269, align 4
  store i16* @g_193, i16** %l_273, align 8
  store i8 -1, i8* %l_281, align 1
  store i32 5, i32* %l_292, align 4
  store i32** null, i32*** %l_301, align 8
  store i16 6483, i16* %l_306, align 2
  store i64 -1, i64* %l_314, align 8
  store %union.U0** @g_84, %union.U0*** %l_337, align 8
  store i32* bitcast (%union.U1* @g_307 to i32*), i32** %l_442, align 8
  %7 = bitcast [7 x i32]* %l_458 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %7, i8* bitcast ([7 x i32]* @func_22.l_458 to i8*), i64 28, i32 16, i1 false)
  store i16 0, i16* %l_463, align 2
  %8 = load i32*** @g_134, align 8
  %9 = load i32** %8, align 8
  %10 = load i32* %9, align 4
  %tobool = icmp ne i32 %10, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %for.body12
  br label %for.end25

if.end:                                           ; preds = %for.body12
  store i16 0, i16* @g_166, align 2
  br label %for.cond14

for.cond14:                                       ; preds = %for.inc20, %if.end
  %11 = load i16* @g_166, align 2
  %conv15 = sext i16 %11 to i32
  %cmp16 = icmp ne i32 %conv15, 10
  br i1 %cmp16, label %for.body18, label %for.end22

for.body18:                                       ; preds = %for.cond14
  store i16* @g_193, i16** %l_271, align 8
  store i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 2, i64 0, i64 3), i32** %l_277, align 8
  store i64 8208311421431050192, i64* %l_342, align 8
  store i32* %l_292, i32** %l_344, align 8
  %12 = bitcast [2 x [6 x i32]]* %l_354 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %12, i8* bitcast ([2 x [6 x i32]]* @func_22.l_354 to i8*), i64 48, i32 16, i1 false)
  store %union.U1** null, %union.U1*** %l_399, align 8
  br label %for.inc20

for.inc20:                                        ; preds = %for.body18
  %13 = load i16* @g_166, align 2
  %inc21 = add i16 %13, 1
  store i16 %inc21, i16* @g_166, align 2
  br label %for.cond14

for.end22:                                        ; preds = %for.cond14
  br label %for.inc23

for.inc23:                                        ; preds = %for.end22
  %14 = load i8* @g_182, align 1
  %inc24 = add i8 %14, 1
  store i8 %inc24, i8* @g_182, align 1
  br label %for.cond9

for.end25:                                        ; preds = %if.then, %for.cond9
  %f1 = bitcast %union.U0* %p_25 to i32*
  store i32 3, i32* %f1, align 4
  br label %for.cond26

for.cond26:                                       ; preds = %for.inc100, %for.end25
  %f127 = bitcast %union.U0* %p_25 to i32*
  %15 = load i32* %f127, align 4
  %cmp28 = icmp sge i32 %15, 0
  br i1 %cmp28, label %for.body30, label %for.end103

for.body30:                                       ; preds = %for.cond26
  store i64* getelementptr inbounds (%union.U0* @g_13, i32 0, i32 0), i64** %l_490, align 8
  store i32 -1832327068, i32* %l_517, align 4
  store i32 0, i32* %l_521, align 4
  store i32 5, i32* %l_554, align 4
  store i32 -2011456204, i32* %l_555, align 4
  store i32 -897509621, i32* %l_556, align 4
  store i32 -818117693, i32* %l_557, align 4
  %16 = bitcast [6 x [6 x [3 x i32]]]* %l_558 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %16, i8* bitcast ([6 x [6 x [3 x i32]]]* @func_22.l_558 to i8*), i64 432, i32 16, i1 false)
  store i8 0, i8* %l_428, align 1
  br label %for.cond33

for.cond33:                                       ; preds = %for.inc95, %for.body30
  %17 = load i8* %l_428, align 1
  %conv34 = zext i8 %17 to i32
  %cmp35 = icmp sle i32 %conv34, 0
  br i1 %cmp35, label %for.body37, label %for.end99

for.body37:                                       ; preds = %for.cond33
  store i16* @g_166, i16** %l_484, align 8
  store i32 138958998, i32* %l_518, align 4
  store i32 0, i32* %l_519, align 4
  store i32 6, i32* %l_520, align 4
  store i32 -652834150, i32* %l_522, align 4
  store i16 -14336, i16* %l_537, align 2
  store i32* @g_3, i32** %l_548, align 8
  store i32* %l_520, i32** %l_549, align 8
  %arrayidx38 = getelementptr inbounds [4 x i32]* %l_464, i32 0, i64 0
  store i32* %arrayidx38, i32** %l_550, align 8
  store i32* %l_522, i32** %l_551, align 8
  %arrayidx39 = getelementptr inbounds [4 x i32]* %l_464, i32 0, i64 2
  store i32* %arrayidx39, i32** %l_552, align 8
  %arrayinit.begin = getelementptr inbounds [5 x i32*]* %l_553, i64 0, i64 0
  store i32* %l_522, i32** %arrayinit.begin
  %arrayinit.element = getelementptr inbounds i32** %arrayinit.begin, i64 1
  store i32* %l_522, i32** %arrayinit.element
  %arrayinit.element40 = getelementptr inbounds i32** %arrayinit.element, i64 1
  store i32* %l_522, i32** %arrayinit.element40
  %arrayinit.element41 = getelementptr inbounds i32** %arrayinit.element40, i64 1
  store i32* %l_522, i32** %arrayinit.element41
  %arrayinit.element42 = getelementptr inbounds i32** %arrayinit.element41, i64 1
  store i32* %l_522, i32** %arrayinit.element42
  store i64 0, i64* %l_559, align 8
  store i16 27065, i16* %l_566, align 2
  store i32 0, i32* %i43, align 4
  br label %for.cond44

for.cond44:                                       ; preds = %for.inc50, %for.body37
  %18 = load i32* %i43, align 4
  %cmp45 = icmp slt i32 %18, 7
  br i1 %cmp45, label %for.body47, label %for.end52

for.body47:                                       ; preds = %for.cond44
  %19 = load i32* %i43, align 4
  %idxprom48 = sext i32 %19 to i64
  %arrayidx49 = getelementptr inbounds [7 x i16]* %l_565, i32 0, i64 %idxprom48
  store i16 26738, i16* %arrayidx49, align 2
  br label %for.inc50

for.inc50:                                        ; preds = %for.body47
  %20 = load i32* %i43, align 4
  %inc51 = add nsw i32 %20, 1
  store i32 %inc51, i32* %i43, align 4
  br label %for.cond44

for.end52:                                        ; preds = %for.cond44
  %f153 = bitcast %union.U0* %p_25 to i32*
  %21 = load i32* %f153, align 4
  %idxprom54 = sext i32 %21 to i64
  %arrayidx55 = getelementptr inbounds [4 x i32]* %l_464, i32 0, i64 %idxprom54
  %22 = load i32*** @g_134, align 8
  store i32* %arrayidx55, i32** %22, align 8
  store i16 2, i16* @g_193, align 2
  br label %for.cond56

for.cond56:                                       ; preds = %for.inc62, %for.end52
  %23 = load i16* @g_193, align 2
  %conv57 = zext i16 %23 to i32
  %cmp58 = icmp sle i32 %conv57, 7
  br i1 %cmp58, label %for.body60, label %for.end65

for.body60:                                       ; preds = %for.cond56
  store i32 0, i32* %l_472, align 4
  store i32 -9, i32* %l_514, align 4
  store i32 2047135426, i32* %l_523, align 4
  store i32 -7, i32* %l_524, align 4
  store i32 0, i32* %l_525, align 4
  %24 = bitcast [7 x i32*]* %l_540 to i8*
  call void @llvm.memset.p0i8.i64(i8* %24, i8 0, i64 56, i32 16, i1 false)
  %25 = bitcast i8* %24 to [7 x i32*]*
  %26 = getelementptr [7 x i32*]* %25, i32 0, i32 0
  %27 = getelementptr [7 x i32*]* %25, i32 0, i32 1
  %28 = getelementptr [7 x i32*]* %25, i32 0, i32 2
  store i32* bitcast (i8* getelementptr (i8* bitcast ([6 x [1 x [10 x i32]]]* @g_66 to i8*), i64 92) to i32*), i32** %28
  %29 = getelementptr [7 x i32*]* %25, i32 0, i32 3
  %30 = getelementptr [7 x i32*]* %25, i32 0, i32 4
  %31 = getelementptr [7 x i32*]* %25, i32 0, i32 5
  store i32* bitcast (i8* getelementptr (i8* bitcast ([6 x [1 x [10 x i32]]]* @g_66 to i8*), i64 92) to i32*), i32** %31
  %32 = getelementptr [7 x i32*]* %25, i32 0, i32 6
  br label %for.inc62

for.inc62:                                        ; preds = %for.body60
  %33 = load i16* @g_193, align 2
  %conv63 = zext i16 %33 to i32
  %add = add nsw i32 %conv63, 1
  %conv64 = trunc i32 %add to i16
  store i16 %conv64, i16* @g_193, align 2
  br label %for.cond56

for.end65:                                        ; preds = %for.cond56
  %34 = load i16* %l_560, align 2
  %inc66 = add i16 %34, 1
  store i16 %inc66, i16* %l_560, align 2
  %f167 = bitcast %union.U0* %p_25 to i32*
  %35 = load i32* %f167, align 4
  %conv68 = trunc i32 %35 to i16
  %36 = load i16** %l_484, align 8
  store i16 %conv68, i16* %36, align 2
  %arrayidx69 = getelementptr inbounds [7 x i16]* %l_565, i32 0, i64 0
  %37 = load i16* %arrayidx69, align 2
  %call = call signext i16 @safe_mul_func_int16_t_s_s(i16 signext %conv68, i16 signext %37)
  store i16 %call, i16* %l_566, align 2
  store i16 6, i16* %l_566, align 2
  br label %for.cond70

for.cond70:                                       ; preds = %for.inc91, %for.end65
  %38 = load i16* %l_566, align 2
  %conv71 = sext i16 %38 to i32
  %cmp72 = icmp sge i32 %conv71, 0
  br i1 %cmp72, label %for.body74, label %for.end94

for.body74:                                       ; preds = %for.cond70
  %39 = load i32*** %p_23.addr, align 8
  %40 = load i32** %39, align 8
  %41 = load i32*** %p_23.addr, align 8
  store i32* %40, i32** %41, align 8
  %f178 = bitcast %union.U0* %p_25 to i32*
  %42 = load i32* %f178, align 4
  %conv79 = trunc i32 %42 to i8
  %call80 = call signext i8 @safe_mul_func_int8_t_s_s(i8 signext 7, i8 signext %conv79)
  %conv81 = sext i8 %call80 to i32
  %f182 = bitcast %union.U0* %p_25 to i32*
  %43 = load i32* %f182, align 4
  %add83 = add nsw i32 %43, 3
  %idxprom84 = sext i32 %add83 to i64
  %44 = load i8* %l_428, align 1
  %idxprom85 = zext i8 %44 to i64
  %f186 = bitcast %union.U0* %p_25 to i32*
  %45 = load i32* %f186, align 4
  %idxprom87 = sext i32 %45 to i64
  %arrayidx88 = getelementptr inbounds [6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 %idxprom87
  %arrayidx89 = getelementptr inbounds [1 x [10 x i32]]* %arrayidx88, i32 0, i64 %idxprom85
  %arrayidx90 = getelementptr inbounds [10 x i32]* %arrayidx89, i32 0, i64 %idxprom84
  %46 = load i32* %arrayidx90, align 4
  %xor = xor i32 %46, %conv81
  store i32 %xor, i32* %arrayidx90, align 4
  %47 = load i32** %l_552, align 8
  store i32 %xor, i32* %47, align 4
  %48 = load i32** %p_26.addr, align 8
  %49 = load i32* %48, align 4
  %or = or i32 %49, %xor
  store i32 %or, i32* %48, align 4
  br label %for.inc91

for.inc91:                                        ; preds = %for.body74
  %50 = load i16* %l_566, align 2
  %conv92 = sext i16 %50 to i32
  %sub = sub nsw i32 %conv92, 1
  %conv93 = trunc i32 %sub to i16
  store i16 %conv93, i16* %l_566, align 2
  br label %for.cond70

for.end94:                                        ; preds = %for.cond70
  br label %for.inc95

for.inc95:                                        ; preds = %for.end94
  %51 = load i8* %l_428, align 1
  %conv96 = zext i8 %51 to i32
  %add97 = add nsw i32 %conv96, 1
  %conv98 = trunc i32 %add97 to i8
  store i8 %conv98, i8* %l_428, align 1
  br label %for.cond33

for.end99:                                        ; preds = %for.cond33
  br label %for.inc100

for.inc100:                                       ; preds = %for.end99
  %f1101 = bitcast %union.U0* %p_25 to i32*
  %52 = load i32* %f1101, align 4
  %sub102 = sub nsw i32 %52, 1
  store i32 %sub102, i32* %f1101, align 4
  br label %for.cond26

for.end103:                                       ; preds = %for.cond26
  ret i32** @g_278
}

define internal i32** @func_27(i32** %p_28) nounwind uwtable {
entry:
  %p_28.addr = alloca i32**, align 8
  %l_33 = alloca i32, align 4
  %l_41 = alloca i32*, align 8
  %l_42 = alloca i32**, align 8
  %l_44 = alloca i32*, align 8
  %l_43 = alloca i32**, align 8
  store i32** %p_28, i32*** %p_28.addr, align 8
  store i32 733825700, i32* %l_33, align 4
  store i32* null, i32** %l_41, align 8
  store i32** null, i32*** %l_42, align 8
  store i32* bitcast (%union.U0* @g_13 to i32*), i32** %l_44, align 8
  store i32** %l_44, i32*** %l_43, align 8
  %0 = load i32* %l_33, align 4
  %1 = load i32* @g_3, align 4
  %conv = trunc i32 %1 to i16
  %2 = load i32*** %p_28.addr, align 8
  %cmp = icmp ne i32** %2, null
  %conv1 = zext i1 %cmp to i32
  %conv2 = trunc i32 %conv1 to i16
  %call = call zeroext i16 @safe_sub_func_uint16_t_u_u(i16 zeroext %conv, i16 zeroext %conv2)
  %conv3 = zext i16 %call to i32
  %call4 = call i32 @safe_sub_func_uint32_t_u_u(i32 %0, i32 %conv3)
  %conv5 = zext i32 %call4 to i64
  %or = or i64 1130749603, %conv5
  %conv6 = trunc i64 %or to i16
  %3 = load i32** %l_41, align 8
  %4 = load i32*** %l_43, align 8
  store i32* %3, i32** %4, align 8
  %5 = load i32* %l_33, align 4
  %conv7 = zext i32 %5 to i64
  %6 = load i32* bitcast (%union.U0* @g_13 to i32*), align 4
  %cmp8 = icmp ne i64 %conv7, 155
  %conv9 = zext i1 %cmp8 to i32
  %conv10 = sext i32 %conv9 to i64
  store i64 %conv10, i64* @g_49, align 8
  %7 = load i32* @g_3, align 4
  %conv11 = sext i32 %7 to i64
  %cmp12 = icmp ult i64 %conv10, %conv11
  %conv13 = zext i1 %cmp12 to i32
  %conv14 = trunc i32 %conv13 to i8
  %8 = load i32* bitcast (%union.U0* @g_13 to i32*), align 4
  %conv15 = trunc i32 %8 to i16
  %9 = load i32* %l_33, align 4
  %conv16 = trunc i32 %9 to i8
  %call17 = call i32** @func_45(i8 zeroext %conv14, i16 signext %conv15, i8 signext %conv16)
  %10 = load i64* getelementptr inbounds (%union.U0* @g_13, i32 0, i32 0), align 8
  %conv18 = trunc i64 %10 to i8
  %11 = load i32*** %p_28.addr, align 8
  %12 = load i32** %11, align 8
  %call19 = call zeroext i16 @func_36(i32* %3, i32** %call17, i8 zeroext %conv18, i32* %12)
  %conv20 = zext i16 %call19 to i32
  %call21 = call signext i16 @safe_rshift_func_int16_t_s_u(i16 signext %conv6, i32 %conv20)
  %13 = load i32*** %p_28.addr, align 8
  store i32** %13, i32*** @g_134, align 8
  %14 = load i32*** %p_28.addr, align 8
  %cmp22 = icmp eq i32** %13, %14
  %conv23 = zext i1 %cmp22 to i32
  %15 = load i32*** %p_28.addr, align 8
  %16 = load i32** %15, align 8
  store i32 %conv23, i32* %16, align 4
  %17 = load i32*** @g_134, align 8
  ret i32** %17
}

define internal zeroext i16 @safe_div_func_uint16_t_u_u(i16 zeroext %ui1, i16 zeroext %ui2) nounwind uwtable {
entry:
  %ui1.addr = alloca i16, align 2
  %ui2.addr = alloca i16, align 2
  store i16 %ui1, i16* %ui1.addr, align 2
  store i16 %ui2, i16* %ui2.addr, align 2
  %0 = load i16* %ui2.addr, align 2
  %conv = zext i16 %0 to i32
  %cmp = icmp eq i32 %conv, 0
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %1 = load i16* %ui1.addr, align 2
  %conv2 = zext i16 %1 to i32
  br label %cond.end

cond.false:                                       ; preds = %entry
  %2 = load i16* %ui1.addr, align 2
  %conv3 = zext i16 %2 to i32
  %3 = load i16* %ui2.addr, align 2
  %conv4 = zext i16 %3 to i32
  %div = sdiv i32 %conv3, %conv4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv2, %cond.true ], [ %div, %cond.false ]
  %conv5 = trunc i32 %cond to i16
  ret i16 %conv5
}

define internal zeroext i16 @safe_lshift_func_uint16_t_u_s(i16 zeroext %left, i32 %right) nounwind uwtable {
entry:
  %left.addr = alloca i16, align 2
  %right.addr = alloca i32, align 4
  store i16 %left, i16* %left.addr, align 2
  store i32 %right, i32* %right.addr, align 4
  %0 = load i32* %right.addr, align 4
  %cmp = icmp slt i32 %0, 0
  br i1 %cmp, label %cond.true, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i32* %right.addr, align 4
  %cmp1 = icmp sge i32 %1, 32
  br i1 %cmp1, label %cond.true, label %lor.lhs.false2

lor.lhs.false2:                                   ; preds = %lor.lhs.false
  %2 = load i16* %left.addr, align 2
  %conv = zext i16 %2 to i32
  %3 = load i32* %right.addr, align 4
  %shr = ashr i32 65535, %3
  %cmp3 = icmp sgt i32 %conv, %shr
  br i1 %cmp3, label %cond.true, label %cond.false

cond.true:                                        ; preds = %lor.lhs.false2, %lor.lhs.false, %entry
  %4 = load i16* %left.addr, align 2
  %conv5 = zext i16 %4 to i32
  br label %cond.end

cond.false:                                       ; preds = %lor.lhs.false2
  %5 = load i16* %left.addr, align 2
  %conv6 = zext i16 %5 to i32
  %6 = load i32* %right.addr, align 4
  %shl = shl i32 %conv6, %6
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv5, %cond.true ], [ %shl, %cond.false ]
  %conv7 = trunc i32 %cond to i16
  ret i16 %conv7
}

define internal zeroext i8 @safe_lshift_func_uint8_t_u_u(i8 zeroext %left, i32 %right) nounwind uwtable {
entry:
  %left.addr = alloca i8, align 1
  %right.addr = alloca i32, align 4
  store i8 %left, i8* %left.addr, align 1
  store i32 %right, i32* %right.addr, align 4
  %0 = load i32* %right.addr, align 4
  %cmp = icmp uge i32 %0, 32
  br i1 %cmp, label %cond.true, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i8* %left.addr, align 1
  %conv = zext i8 %1 to i32
  %2 = load i32* %right.addr, align 4
  %shr = ashr i32 255, %2
  %cmp1 = icmp sgt i32 %conv, %shr
  br i1 %cmp1, label %cond.true, label %cond.false

cond.true:                                        ; preds = %lor.lhs.false, %entry
  %3 = load i8* %left.addr, align 1
  %conv3 = zext i8 %3 to i32
  br label %cond.end

cond.false:                                       ; preds = %lor.lhs.false
  %4 = load i8* %left.addr, align 1
  %conv4 = zext i8 %4 to i32
  %5 = load i32* %right.addr, align 4
  %shl = shl i32 %conv4, %5
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv3, %cond.true ], [ %shl, %cond.false ]
  %conv5 = trunc i32 %cond to i8
  ret i8 %conv5
}

define internal zeroext i16 @safe_mul_func_uint16_t_u_u(i16 zeroext %ui1, i16 zeroext %ui2) nounwind uwtable {
entry:
  %ui1.addr = alloca i16, align 2
  %ui2.addr = alloca i16, align 2
  store i16 %ui1, i16* %ui1.addr, align 2
  store i16 %ui2, i16* %ui2.addr, align 2
  %0 = load i16* %ui1.addr, align 2
  %conv = zext i16 %0 to i32
  %1 = load i16* %ui2.addr, align 2
  %conv1 = zext i16 %1 to i32
  %mul = mul i32 %conv, %conv1
  %conv2 = trunc i32 %mul to i16
  ret i16 %conv2
}

define internal zeroext i16 @safe_add_func_uint16_t_u_u(i16 zeroext %ui1, i16 zeroext %ui2) nounwind uwtable {
entry:
  %ui1.addr = alloca i16, align 2
  %ui2.addr = alloca i16, align 2
  store i16 %ui1, i16* %ui1.addr, align 2
  store i16 %ui2, i16* %ui2.addr, align 2
  %0 = load i16* %ui1.addr, align 2
  %conv = zext i16 %0 to i32
  %1 = load i16* %ui2.addr, align 2
  %conv1 = zext i16 %1 to i32
  %add = add nsw i32 %conv, %conv1
  %conv2 = trunc i32 %add to i16
  ret i16 %conv2
}

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

define internal signext i16 @safe_lshift_func_int16_t_s_u(i16 signext %left, i32 %right) nounwind uwtable {
entry:
  %left.addr = alloca i16, align 2
  %right.addr = alloca i32, align 4
  store i16 %left, i16* %left.addr, align 2
  store i32 %right, i32* %right.addr, align 4
  %0 = load i16* %left.addr, align 2
  %conv = sext i16 %0 to i32
  %cmp = icmp slt i32 %conv, 0
  br i1 %cmp, label %cond.true, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i32* %right.addr, align 4
  %cmp2 = icmp uge i32 %1, 32
  br i1 %cmp2, label %cond.true, label %lor.lhs.false4

lor.lhs.false4:                                   ; preds = %lor.lhs.false
  %2 = load i16* %left.addr, align 2
  %conv5 = sext i16 %2 to i32
  %3 = load i32* %right.addr, align 4
  %shr = ashr i32 32767, %3
  %cmp6 = icmp sgt i32 %conv5, %shr
  br i1 %cmp6, label %cond.true, label %cond.false

cond.true:                                        ; preds = %lor.lhs.false4, %lor.lhs.false, %entry
  %4 = load i16* %left.addr, align 2
  %conv8 = sext i16 %4 to i32
  br label %cond.end

cond.false:                                       ; preds = %lor.lhs.false4
  %5 = load i16* %left.addr, align 2
  %conv9 = sext i16 %5 to i32
  %6 = load i32* %right.addr, align 4
  %shl = shl i32 %conv9, %6
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv8, %cond.true ], [ %shl, %cond.false ]
  %conv10 = trunc i32 %cond to i16
  ret i16 %conv10
}

define internal signext i16 @safe_rshift_func_int16_t_s_u(i16 signext %left, i32 %right) nounwind uwtable {
entry:
  %left.addr = alloca i16, align 2
  %right.addr = alloca i32, align 4
  store i16 %left, i16* %left.addr, align 2
  store i32 %right, i32* %right.addr, align 4
  %0 = load i16* %left.addr, align 2
  %conv = sext i16 %0 to i32
  %cmp = icmp slt i32 %conv, 0
  br i1 %cmp, label %cond.true, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i32* %right.addr, align 4
  %cmp2 = icmp uge i32 %1, 32
  br i1 %cmp2, label %cond.true, label %cond.false

cond.true:                                        ; preds = %lor.lhs.false, %entry
  %2 = load i16* %left.addr, align 2
  %conv4 = sext i16 %2 to i32
  br label %cond.end

cond.false:                                       ; preds = %lor.lhs.false
  %3 = load i16* %left.addr, align 2
  %conv5 = sext i16 %3 to i32
  %4 = load i32* %right.addr, align 4
  %shr = ashr i32 %conv5, %4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv4, %cond.true ], [ %shr, %cond.false ]
  %conv6 = trunc i32 %cond to i16
  ret i16 %conv6
}

define internal signext i16 @safe_mul_func_int16_t_s_s(i16 signext %si1, i16 signext %si2) nounwind uwtable {
entry:
  %si1.addr = alloca i16, align 2
  %si2.addr = alloca i16, align 2
  store i16 %si1, i16* %si1.addr, align 2
  store i16 %si2, i16* %si2.addr, align 2
  %0 = load i16* %si1.addr, align 2
  %conv = sext i16 %0 to i32
  %1 = load i16* %si2.addr, align 2
  %conv1 = sext i16 %1 to i32
  %mul = mul nsw i32 %conv, %conv1
  %conv2 = trunc i32 %mul to i16
  ret i16 %conv2
}

define internal i32 @safe_sub_func_int32_t_s_s(i32 %si1, i32 %si2) nounwind uwtable {
entry:
  %si1.addr = alloca i32, align 4
  %si2.addr = alloca i32, align 4
  store i32 %si1, i32* %si1.addr, align 4
  store i32 %si2, i32* %si2.addr, align 4
  %0 = load i32* %si1.addr, align 4
  %1 = load i32* %si2.addr, align 4
  %xor = xor i32 %0, %1
  %2 = load i32* %si1.addr, align 4
  %3 = load i32* %si1.addr, align 4
  %4 = load i32* %si2.addr, align 4
  %xor1 = xor i32 %3, %4
  %and = and i32 %xor1, -2147483648
  %xor2 = xor i32 %2, %and
  %5 = load i32* %si2.addr, align 4
  %sub = sub nsw i32 %xor2, %5
  %6 = load i32* %si2.addr, align 4
  %xor3 = xor i32 %sub, %6
  %and4 = and i32 %xor, %xor3
  %cmp = icmp slt i32 %and4, 0
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %7 = load i32* %si1.addr, align 4
  br label %cond.end

cond.false:                                       ; preds = %entry
  %8 = load i32* %si1.addr, align 4
  %9 = load i32* %si2.addr, align 4
  %sub5 = sub nsw i32 %8, %9
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %7, %cond.true ], [ %sub5, %cond.false ]
  ret i32 %cond
}

define internal signext i16 @safe_mod_func_int16_t_s_s(i16 signext %si1, i16 signext %si2) nounwind uwtable {
entry:
  %si1.addr = alloca i16, align 2
  %si2.addr = alloca i16, align 2
  store i16 %si1, i16* %si1.addr, align 2
  store i16 %si2, i16* %si2.addr, align 2
  %0 = load i16* %si2.addr, align 2
  %conv = sext i16 %0 to i32
  %cmp = icmp eq i32 %conv, 0
  br i1 %cmp, label %cond.true, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i16* %si1.addr, align 2
  %conv2 = sext i16 %1 to i32
  %cmp3 = icmp eq i32 %conv2, -32768
  br i1 %cmp3, label %land.lhs.true, label %cond.false

land.lhs.true:                                    ; preds = %lor.lhs.false
  %2 = load i16* %si2.addr, align 2
  %conv5 = sext i16 %2 to i32
  %cmp6 = icmp eq i32 %conv5, -1
  br i1 %cmp6, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true, %entry
  %3 = load i16* %si1.addr, align 2
  %conv8 = sext i16 %3 to i32
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true, %lor.lhs.false
  %4 = load i16* %si1.addr, align 2
  %conv9 = sext i16 %4 to i32
  %5 = load i16* %si2.addr, align 2
  %conv10 = sext i16 %5 to i32
  %rem = srem i32 %conv9, %conv10
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv8, %cond.true ], [ %rem, %cond.false ]
  %conv11 = trunc i32 %cond to i16
  ret i16 %conv11
}

define internal signext i16 @safe_rshift_func_int16_t_s_s(i16 signext %left, i32 %right) nounwind uwtable {
entry:
  %left.addr = alloca i16, align 2
  %right.addr = alloca i32, align 4
  store i16 %left, i16* %left.addr, align 2
  store i32 %right, i32* %right.addr, align 4
  %0 = load i16* %left.addr, align 2
  %conv = sext i16 %0 to i32
  %cmp = icmp slt i32 %conv, 0
  br i1 %cmp, label %cond.true, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i32* %right.addr, align 4
  %cmp2 = icmp slt i32 %1, 0
  br i1 %cmp2, label %cond.true, label %lor.lhs.false4

lor.lhs.false4:                                   ; preds = %lor.lhs.false
  %2 = load i32* %right.addr, align 4
  %cmp5 = icmp sge i32 %2, 32
  br i1 %cmp5, label %cond.true, label %cond.false

cond.true:                                        ; preds = %lor.lhs.false4, %lor.lhs.false, %entry
  %3 = load i16* %left.addr, align 2
  %conv7 = sext i16 %3 to i32
  br label %cond.end

cond.false:                                       ; preds = %lor.lhs.false4
  %4 = load i16* %left.addr, align 2
  %conv8 = sext i16 %4 to i32
  %5 = load i32* %right.addr, align 4
  %shr = ashr i32 %conv8, %5
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv7, %cond.true ], [ %shr, %cond.false ]
  %conv9 = trunc i32 %cond to i16
  ret i16 %conv9
}

define internal signext i8 @safe_mul_func_int8_t_s_s(i8 signext %si1, i8 signext %si2) nounwind uwtable {
entry:
  %si1.addr = alloca i8, align 1
  %si2.addr = alloca i8, align 1
  store i8 %si1, i8* %si1.addr, align 1
  store i8 %si2, i8* %si2.addr, align 1
  %0 = load i8* %si1.addr, align 1
  %conv = sext i8 %0 to i32
  %1 = load i8* %si2.addr, align 1
  %conv1 = sext i8 %1 to i32
  %mul = mul nsw i32 %conv, %conv1
  %conv2 = trunc i32 %mul to i8
  ret i8 %conv2
}

define internal i32 @safe_add_func_int32_t_s_s(i32 %si1, i32 %si2) nounwind uwtable {
entry:
  %si1.addr = alloca i32, align 4
  %si2.addr = alloca i32, align 4
  store i32 %si1, i32* %si1.addr, align 4
  store i32 %si2, i32* %si2.addr, align 4
  %0 = load i32* %si1.addr, align 4
  %cmp = icmp sgt i32 %0, 0
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false

land.lhs.true:                                    ; preds = %entry
  %1 = load i32* %si2.addr, align 4
  %cmp1 = icmp sgt i32 %1, 0
  br i1 %cmp1, label %land.lhs.true2, label %lor.lhs.false

land.lhs.true2:                                   ; preds = %land.lhs.true
  %2 = load i32* %si1.addr, align 4
  %3 = load i32* %si2.addr, align 4
  %sub = sub nsw i32 2147483647, %3
  %cmp3 = icmp sgt i32 %2, %sub
  br i1 %cmp3, label %cond.true, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true2, %land.lhs.true, %entry
  %4 = load i32* %si1.addr, align 4
  %cmp4 = icmp slt i32 %4, 0
  br i1 %cmp4, label %land.lhs.true5, label %cond.false

land.lhs.true5:                                   ; preds = %lor.lhs.false
  %5 = load i32* %si2.addr, align 4
  %cmp6 = icmp slt i32 %5, 0
  br i1 %cmp6, label %land.lhs.true7, label %cond.false

land.lhs.true7:                                   ; preds = %land.lhs.true5
  %6 = load i32* %si1.addr, align 4
  %7 = load i32* %si2.addr, align 4
  %sub8 = sub nsw i32 -2147483648, %7
  %cmp9 = icmp slt i32 %6, %sub8
  br i1 %cmp9, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true7, %land.lhs.true2
  %8 = load i32* %si1.addr, align 4
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true7, %land.lhs.true5, %lor.lhs.false
  %9 = load i32* %si1.addr, align 4
  %10 = load i32* %si2.addr, align 4
  %add = add nsw i32 %9, %10
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %8, %cond.true ], [ %add, %cond.false ]
  ret i32 %cond
}

define internal signext i8 @safe_sub_func_int8_t_s_s(i8 signext %si1, i8 signext %si2) nounwind uwtable {
entry:
  %si1.addr = alloca i8, align 1
  %si2.addr = alloca i8, align 1
  store i8 %si1, i8* %si1.addr, align 1
  store i8 %si2, i8* %si2.addr, align 1
  %0 = load i8* %si1.addr, align 1
  %conv = sext i8 %0 to i32
  %1 = load i8* %si2.addr, align 1
  %conv1 = sext i8 %1 to i32
  %sub = sub nsw i32 %conv, %conv1
  %conv2 = trunc i32 %sub to i8
  ret i8 %conv2
}

define internal i32 @safe_sub_func_uint32_t_u_u(i32 %ui1, i32 %ui2) nounwind uwtable {
entry:
  %ui1.addr = alloca i32, align 4
  %ui2.addr = alloca i32, align 4
  store i32 %ui1, i32* %ui1.addr, align 4
  store i32 %ui2, i32* %ui2.addr, align 4
  %0 = load i32* %ui1.addr, align 4
  %1 = load i32* %ui2.addr, align 4
  %sub = sub i32 %0, %1
  ret i32 %sub
}

define internal zeroext i16 @safe_sub_func_uint16_t_u_u(i16 zeroext %ui1, i16 zeroext %ui2) nounwind uwtable {
entry:
  %ui1.addr = alloca i16, align 2
  %ui2.addr = alloca i16, align 2
  store i16 %ui1, i16* %ui1.addr, align 2
  store i16 %ui2, i16* %ui2.addr, align 2
  %0 = load i16* %ui1.addr, align 2
  %conv = zext i16 %0 to i32
  %1 = load i16* %ui2.addr, align 2
  %conv1 = zext i16 %1 to i32
  %sub = sub nsw i32 %conv, %conv1
  %conv2 = trunc i32 %sub to i16
  ret i16 %conv2
}

define internal zeroext i16 @func_36(i32* %p_37, i32** %p_38, i8 zeroext %p_39, i32* %p_40) nounwind uwtable {
entry:
  %p_37.addr = alloca i32*, align 8
  %p_38.addr = alloca i32**, align 8
  %p_39.addr = alloca i8, align 1
  %p_40.addr = alloca i32*, align 8
  %l_246 = alloca i32, align 4
  %l_249 = alloca i16*, align 8
  %l_250 = alloca i64*, align 8
  %l_251 = alloca i32, align 4
  %l_254 = alloca i32, align 4
  %l_257 = alloca i32*, align 8
  store i32* %p_37, i32** %p_37.addr, align 8
  store i32** %p_38, i32*** %p_38.addr, align 8
  store i8 %p_39, i8* %p_39.addr, align 1
  store i32* %p_40, i32** %p_40.addr, align 8
  store i32 -6, i32* %l_246, align 4
  store i16* @g_193, i16** %l_249, align 8
  store i64* getelementptr inbounds (%union.U1* @g_130, i32 0, i32 0), i64** %l_250, align 8
  store i32 -1188307763, i32* %l_251, align 4
  store i32 1959041785, i32* %l_254, align 4
  store i32* %l_246, i32** %l_257, align 8
  %0 = load i32* %l_246, align 4
  %1 = load volatile i32* getelementptr inbounds ([7 x i32]* @g_213, i32 0, i64 4), align 4
  %conv = trunc i32 %1 to i16
  %2 = load i8* %p_39.addr, align 1
  %conv1 = zext i8 %2 to i16
  %3 = load i16** %l_249, align 8
  store i16 %conv1, i16* %3, align 2
  %4 = load i32* getelementptr inbounds ([1 x [8 x [10 x i32]]]* @g_110, i32 0, i64 0, i64 2, i64 2), align 4
  %5 = load i32* bitcast (%union.U1* @g_130 to i32*), align 4
  store i32 %5, i32* %l_251, align 4
  %xor = xor i32 %4, %5
  %conv2 = trunc i32 %xor to i16
  %call = call zeroext i16 @safe_add_func_uint16_t_u_u(i16 zeroext %conv1, i16 zeroext %conv2)
  %call3 = call signext i16 @safe_sub_func_int16_t_s_s(i16 signext %conv, i16 signext %call)
  %conv4 = sext i16 %call3 to i32
  %6 = load i8* %p_39.addr, align 1
  %7 = load i64* @g_49, align 8
  %conv5 = trunc i64 %7 to i32
  store i32 %conv5, i32* %l_254, align 4
  %conv6 = trunc i32 %conv5 to i8
  %call7 = call zeroext i8 @safe_add_func_uint8_t_u_u(i8 zeroext %6, i8 zeroext %conv6)
  %conv8 = zext i8 %call7 to i64
  %8 = load i32* %l_246, align 4
  %conv9 = sext i32 %8 to i64
  %9 = load i8* %p_39.addr, align 1
  %conv10 = zext i8 %9 to i64
  %call11 = call i64 @safe_sub_func_int64_t_s_s(i64 %conv9, i64 %conv10)
  %cmp = icmp sge i64 %conv8, %call11
  br i1 %cmp, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %entry
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %entry
  %10 = phi i1 [ true, %entry ], [ true, %lor.rhs ]
  %lor.ext = zext i1 %10 to i32
  %call13 = call i32 @safe_add_func_int32_t_s_s(i32 %conv4, i32 %lor.ext)
  %11 = load i32** %l_257, align 8
  store i32 %call13, i32* %11, align 4
  %12 = load volatile i32* getelementptr inbounds ([7 x i32]* @g_213, i32 0, i64 4), align 4
  %conv14 = trunc i32 %12 to i16
  ret i16 %conv14
}

define internal i32** @func_45(i8 zeroext %p_46, i16 signext %p_47, i8 signext %p_48) nounwind uwtable {
entry:
  %retval = alloca i32**, align 8
  %p_46.addr = alloca i8, align 1
  %p_47.addr = alloca i16, align 2
  %p_48.addr = alloca i8, align 1
  %l_54 = alloca [8 x [8 x [2 x i32*]]], align 16
  %l_80 = alloca i32, align 4
  %l_91 = alloca i32, align 4
  %l_94 = alloca i32, align 4
  %l_99 = alloca i32, align 4
  %l_146 = alloca i64, align 8
  %l_147 = alloca i64, align 8
  %l_149 = alloca [10 x i32], align 16
  %l_197 = alloca i64, align 8
  %l_201 = alloca i32, align 4
  %l_223 = alloca %union.U1*, align 8
  %l_241 = alloca i32*, align 8
  %l_240 = alloca [2 x [2 x [9 x i32**]]], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %l_78 = alloca i32*, align 8
  %l_87 = alloca i32, align 4
  %l_88 = alloca i32, align 4
  %l_100 = alloca i32, align 4
  %l_109 = alloca i16, align 2
  %l_113 = alloca i8, align 1
  %l_114 = alloca i64, align 8
  %l_125 = alloca i8, align 1
  %l_126 = alloca i32, align 4
  %l_135 = alloca i32, align 4
  %l_144 = alloca i32, align 4
  %l_145 = alloca [3 x [2 x i32]], align 16
  %l_148 = alloca i32, align 4
  %l_180 = alloca %union.U1*, align 8
  %l_196 = alloca i32, align 4
  %l_198 = alloca [9 x %union.U0**], align 16
  %l_207 = alloca [4 x i32], align 16
  %l_210 = alloca i8, align 1
  %l_214 = alloca i64, align 8
  %i42 = alloca i32, align 4
  %j43 = alloca i32, align 4
  %l_57 = alloca i32, align 4
  %l_92 = alloca [6 x i32], align 16
  %l_150 = alloca i16, align 2
  %l_169 = alloca i32, align 4
  %l_237 = alloca %union.U1**, align 8
  %i62 = alloca i32, align 4
  %l_73 = alloca i32, align 4
  %l_90 = alloca i32, align 4
  %l_93 = alloca i32, align 4
  %l_95 = alloca i32, align 4
  %l_96 = alloca [6 x i32], align 16
  %l_137 = alloca i32*, align 8
  %l_138 = alloca i32*, align 8
  %l_139 = alloca i32*, align 8
  %l_140 = alloca i32*, align 8
  %l_141 = alloca i32*, align 8
  %l_142 = alloca i32*, align 8
  %l_143 = alloca [2 x i32*], align 16
  %l_167 = alloca %union.U0**, align 8
  %l_234 = alloca %union.U1*, align 8
  %i79 = alloca i32, align 4
  %l_64 = alloca i64, align 8
  %l_97 = alloca i32, align 4
  %l_98 = alloca i32, align 4
  %l_101 = alloca i8, align 1
  %l_136 = alloca i32*, align 8
  %l_62 = alloca [6 x [8 x i64]], align 16
  %l_68 = alloca [2 x [4 x i32]], align 16
  %l_79 = alloca i32**, align 8
  %l_82 = alloca i32*, align 8
  %i101 = alloca i32, align 4
  %j102 = alloca i32, align 4
  %k103 = alloca i32, align 4
  %l_85 = alloca i32*, align 8
  %l_86 = alloca [10 x [6 x [4 x i32*]]], align 16
  %l_89 = alloca i64, align 8
  %l_102 = alloca i32, align 4
  %i146 = alloca i32, align 4
  %j147 = alloca i32, align 4
  %k148 = alloca i32, align 4
  %l_105 = alloca i32*, align 8
  %l_121 = alloca i32*, align 8
  %l_122 = alloca i32*, align 8
  %l_123 = alloca i32*, align 8
  %l_124 = alloca [2 x [4 x i32*]], align 16
  %l_129 = alloca %union.U1*, align 8
  %l_131 = alloca %union.U1**, align 8
  %i197 = alloca i32, align 4
  %j198 = alloca i32, align 4
  %k199 = alloca i32, align 4
  %l_155 = alloca i32**, align 8
  %l_168 = alloca [3 x i32], align 4
  %i222 = alloca i32, align 4
  %l_162 = alloca i32, align 4
  %l_164 = alloca i32*, align 8
  %l_165 = alloca i32*, align 8
  %l_181 = alloca i8*, align 8
  %l_199 = alloca i8*, align 8
  %l_203 = alloca i32, align 4
  %l_204 = alloca [2 x [6 x i32]], align 16
  %l_217 = alloca i32**, align 8
  %l_238 = alloca %union.U1**, align 8
  %i268 = alloca i32, align 4
  %j269 = alloca i32, align 4
  %l_202 = alloca i32, align 4
  %l_205 = alloca i32, align 4
  %l_206 = alloca i32, align 4
  %l_211 = alloca i32, align 4
  %l_212 = alloca [9 x [10 x [2 x i32]]], align 16
  %i344 = alloca i32, align 4
  %j345 = alloca i32, align 4
  %k346 = alloca i32, align 4
  %l_232 = alloca i16*, align 8
  %l_239 = alloca %union.U0**, align 8
  %i392 = alloca i32, align 4
  %j393 = alloca i32, align 4
  store i8 %p_46, i8* %p_46.addr, align 1
  store i16 %p_47, i16* %p_47.addr, align 2
  store i8 %p_48, i8* %p_48.addr, align 1
  %0 = bitcast [8 x [8 x [2 x i32*]]]* %l_54 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* bitcast ([8 x [8 x [2 x i32*]]]* @func_45.l_54 to i8*), i64 1024, i32 16, i1 false)
  store i32 -657797276, i32* %l_80, align 4
  store i32 1956200888, i32* %l_91, align 4
  store i32 -1, i32* %l_94, align 4
  store i32 532592039, i32* %l_99, align 4
  store i64 -5119825680882257126, i64* %l_146, align 8
  store i64 -5935077631650078079, i64* %l_147, align 8
  %1 = bitcast [10 x i32]* %l_149 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %1, i8* bitcast ([10 x i32]* @func_45.l_149 to i8*), i64 40, i32 16, i1 false)
  store i64 -1, i64* %l_197, align 8
  store i32 -1210965032, i32* %l_201, align 4
  store %union.U1* @g_130, %union.U1** %l_223, align 8
  store i32* %l_80, i32** %l_241, align 8
  %arrayinit.begin = getelementptr inbounds [2 x [2 x [9 x i32**]]]* %l_240, i64 0, i64 0
  %arrayinit.begin1 = getelementptr inbounds [2 x [9 x i32**]]* %arrayinit.begin, i64 0, i64 0
  %arrayinit.begin2 = getelementptr inbounds [9 x i32**]* %arrayinit.begin1, i64 0, i64 0
  store i32** %l_241, i32*** %arrayinit.begin2
  %arrayinit.element = getelementptr inbounds i32*** %arrayinit.begin2, i64 1
  store i32** %l_241, i32*** %arrayinit.element
  %arrayinit.element3 = getelementptr inbounds i32*** %arrayinit.element, i64 1
  store i32** %l_241, i32*** %arrayinit.element3
  %arrayinit.element4 = getelementptr inbounds i32*** %arrayinit.element3, i64 1
  store i32** %l_241, i32*** %arrayinit.element4
  %arrayinit.element5 = getelementptr inbounds i32*** %arrayinit.element4, i64 1
  store i32** %l_241, i32*** %arrayinit.element5
  %arrayinit.element6 = getelementptr inbounds i32*** %arrayinit.element5, i64 1
  store i32** %l_241, i32*** %arrayinit.element6
  %arrayinit.element7 = getelementptr inbounds i32*** %arrayinit.element6, i64 1
  store i32** %l_241, i32*** %arrayinit.element7
  %arrayinit.element8 = getelementptr inbounds i32*** %arrayinit.element7, i64 1
  store i32** %l_241, i32*** %arrayinit.element8
  %arrayinit.element9 = getelementptr inbounds i32*** %arrayinit.element8, i64 1
  store i32** %l_241, i32*** %arrayinit.element9
  %arrayinit.element10 = getelementptr inbounds [9 x i32**]* %arrayinit.begin1, i64 1
  %arrayinit.begin11 = getelementptr inbounds [9 x i32**]* %arrayinit.element10, i64 0, i64 0
  store i32** %l_241, i32*** %arrayinit.begin11
  %arrayinit.element12 = getelementptr inbounds i32*** %arrayinit.begin11, i64 1
  store i32** %l_241, i32*** %arrayinit.element12
  %arrayinit.element13 = getelementptr inbounds i32*** %arrayinit.element12, i64 1
  store i32** %l_241, i32*** %arrayinit.element13
  %arrayinit.element14 = getelementptr inbounds i32*** %arrayinit.element13, i64 1
  store i32** %l_241, i32*** %arrayinit.element14
  %arrayinit.element15 = getelementptr inbounds i32*** %arrayinit.element14, i64 1
  store i32** %l_241, i32*** %arrayinit.element15
  %arrayinit.element16 = getelementptr inbounds i32*** %arrayinit.element15, i64 1
  store i32** %l_241, i32*** %arrayinit.element16
  %arrayinit.element17 = getelementptr inbounds i32*** %arrayinit.element16, i64 1
  store i32** %l_241, i32*** %arrayinit.element17
  %arrayinit.element18 = getelementptr inbounds i32*** %arrayinit.element17, i64 1
  store i32** %l_241, i32*** %arrayinit.element18
  %arrayinit.element19 = getelementptr inbounds i32*** %arrayinit.element18, i64 1
  store i32** %l_241, i32*** %arrayinit.element19
  %arrayinit.element20 = getelementptr inbounds [2 x [9 x i32**]]* %arrayinit.begin, i64 1
  %arrayinit.begin21 = getelementptr inbounds [2 x [9 x i32**]]* %arrayinit.element20, i64 0, i64 0
  %arrayinit.begin22 = getelementptr inbounds [9 x i32**]* %arrayinit.begin21, i64 0, i64 0
  store i32** %l_241, i32*** %arrayinit.begin22
  %arrayinit.element23 = getelementptr inbounds i32*** %arrayinit.begin22, i64 1
  store i32** %l_241, i32*** %arrayinit.element23
  %arrayinit.element24 = getelementptr inbounds i32*** %arrayinit.element23, i64 1
  store i32** %l_241, i32*** %arrayinit.element24
  %arrayinit.element25 = getelementptr inbounds i32*** %arrayinit.element24, i64 1
  store i32** %l_241, i32*** %arrayinit.element25
  %arrayinit.element26 = getelementptr inbounds i32*** %arrayinit.element25, i64 1
  store i32** %l_241, i32*** %arrayinit.element26
  %arrayinit.element27 = getelementptr inbounds i32*** %arrayinit.element26, i64 1
  store i32** %l_241, i32*** %arrayinit.element27
  %arrayinit.element28 = getelementptr inbounds i32*** %arrayinit.element27, i64 1
  store i32** %l_241, i32*** %arrayinit.element28
  %arrayinit.element29 = getelementptr inbounds i32*** %arrayinit.element28, i64 1
  store i32** %l_241, i32*** %arrayinit.element29
  %arrayinit.element30 = getelementptr inbounds i32*** %arrayinit.element29, i64 1
  store i32** %l_241, i32*** %arrayinit.element30
  %arrayinit.element31 = getelementptr inbounds [9 x i32**]* %arrayinit.begin21, i64 1
  %arrayinit.begin32 = getelementptr inbounds [9 x i32**]* %arrayinit.element31, i64 0, i64 0
  store i32** %l_241, i32*** %arrayinit.begin32
  %arrayinit.element33 = getelementptr inbounds i32*** %arrayinit.begin32, i64 1
  store i32** %l_241, i32*** %arrayinit.element33
  %arrayinit.element34 = getelementptr inbounds i32*** %arrayinit.element33, i64 1
  store i32** %l_241, i32*** %arrayinit.element34
  %arrayinit.element35 = getelementptr inbounds i32*** %arrayinit.element34, i64 1
  store i32** %l_241, i32*** %arrayinit.element35
  %arrayinit.element36 = getelementptr inbounds i32*** %arrayinit.element35, i64 1
  store i32** %l_241, i32*** %arrayinit.element36
  %arrayinit.element37 = getelementptr inbounds i32*** %arrayinit.element36, i64 1
  store i32** %l_241, i32*** %arrayinit.element37
  %arrayinit.element38 = getelementptr inbounds i32*** %arrayinit.element37, i64 1
  store i32** %l_241, i32*** %arrayinit.element38
  %arrayinit.element39 = getelementptr inbounds i32*** %arrayinit.element38, i64 1
  store i32** %l_241, i32*** %arrayinit.element39
  %arrayinit.element40 = getelementptr inbounds i32*** %arrayinit.element39, i64 1
  store i32** %l_241, i32*** %arrayinit.element40
  store i16 -9, i16* %p_47.addr, align 2
  br label %for.cond

for.cond:                                         ; preds = %for.inc421, %entry
  %2 = load i16* %p_47.addr, align 2
  %conv = sext i16 %2 to i32
  %cmp = icmp sle i32 %conv, 16
  br i1 %cmp, label %for.body, label %for.end423

for.body:                                         ; preds = %for.cond
  store i32* null, i32** %l_78, align 8
  store i32 239066951, i32* %l_87, align 4
  store i32 1324638694, i32* %l_88, align 4
  store i32 1163305769, i32* %l_100, align 4
  store i16 30839, i16* %l_109, align 2
  store i8 -115, i8* %l_113, align 1
  store i64 -6, i64* %l_114, align 8
  store i8 -5, i8* %l_125, align 1
  store i32 -1, i32* %l_126, align 4
  store i32 -1967287735, i32* %l_135, align 4
  store i32 -1, i32* %l_144, align 4
  %3 = bitcast [3 x [2 x i32]]* %l_145 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %3, i8* bitcast ([3 x [2 x i32]]* @func_45.l_145 to i8*), i64 24, i32 16, i1 false)
  store i32 -1723457641, i32* %l_148, align 4
  store %union.U1* @g_130, %union.U1** %l_180, align 8
  store i32 -6, i32* %l_196, align 4
  store i8 -6, i8* %l_210, align 1
  store i64 6786213923576437957, i64* %l_214, align 8
  store i32 0, i32* %i42, align 4
  br label %for.cond44

for.cond44:                                       ; preds = %for.inc, %for.body
  %4 = load i32* %i42, align 4
  %cmp45 = icmp slt i32 %4, 9
  br i1 %cmp45, label %for.body47, label %for.end

for.body47:                                       ; preds = %for.cond44
  %5 = load i32* %i42, align 4
  %idxprom = sext i32 %5 to i64
  %arrayidx = getelementptr inbounds [9 x %union.U0**]* %l_198, i32 0, i64 %idxprom
  store %union.U0** @g_84, %union.U0*** %arrayidx, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body47
  %6 = load i32* %i42, align 4
  %inc = add nsw i32 %6, 1
  store i32 %inc, i32* %i42, align 4
  br label %for.cond44

for.end:                                          ; preds = %for.cond44
  store i32 0, i32* %i42, align 4
  br label %for.cond48

for.cond48:                                       ; preds = %for.inc54, %for.end
  %7 = load i32* %i42, align 4
  %cmp49 = icmp slt i32 %7, 4
  br i1 %cmp49, label %for.body51, label %for.end56

for.body51:                                       ; preds = %for.cond48
  %8 = load i32* %i42, align 4
  %idxprom52 = sext i32 %8 to i64
  %arrayidx53 = getelementptr inbounds [4 x i32]* %l_207, i32 0, i64 %idxprom52
  store i32 -2120609646, i32* %arrayidx53, align 4
  br label %for.inc54

for.inc54:                                        ; preds = %for.body51
  %9 = load i32* %i42, align 4
  %inc55 = add nsw i32 %9, 1
  store i32 %inc55, i32* %i42, align 4
  br label %for.cond48

for.end56:                                        ; preds = %for.cond48
  store i8 -23, i8* %p_46.addr, align 1
  br label %for.cond57

for.cond57:                                       ; preds = %for.inc418, %for.end56
  %10 = load i8* %p_46.addr, align 1
  %conv58 = zext i8 %10 to i32
  %cmp59 = icmp sgt i32 %conv58, 39
  br i1 %cmp59, label %for.body61, label %for.end420

for.body61:                                       ; preds = %for.cond57
  store i32 -8, i32* %l_57, align 4
  store i16 -6, i16* %l_150, align 2
  store i32 1, i32* %l_169, align 4
  store %union.U1** %l_223, %union.U1*** %l_237, align 8
  store i32 0, i32* %i62, align 4
  br label %for.cond63

for.cond63:                                       ; preds = %for.inc69, %for.body61
  %11 = load i32* %i62, align 4
  %cmp64 = icmp slt i32 %11, 6
  br i1 %cmp64, label %for.body66, label %for.end71

for.body66:                                       ; preds = %for.cond63
  %12 = load i32* %i62, align 4
  %idxprom67 = sext i32 %12 to i64
  %arrayidx68 = getelementptr inbounds [6 x i32]* %l_92, i32 0, i64 %idxprom67
  store i32 540044300, i32* %arrayidx68, align 4
  br label %for.inc69

for.inc69:                                        ; preds = %for.body66
  %13 = load i32* %i62, align 4
  %inc70 = add nsw i32 %13, 1
  store i32 %inc70, i32* %i62, align 4
  br label %for.cond63

for.end71:                                        ; preds = %for.cond63
  %arrayidx72 = getelementptr inbounds [8 x [8 x [2 x i32*]]]* %l_54, i32 0, i64 4
  %arrayidx73 = getelementptr inbounds [8 x [2 x i32*]]* %arrayidx72, i32 0, i64 4
  %arrayidx74 = getelementptr inbounds [2 x i32*]* %arrayidx73, i32 0, i64 0
  %14 = load i32** %arrayidx74, align 8
  %15 = load volatile i32*** @g_55, align 8
  store i32* %14, i32** %15, align 8
  %16 = load i32* %l_57, align 4
  %tobool = icmp ne i32 %16, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %for.end71
  br label %for.end420

if.end:                                           ; preds = %for.end71
  store i32 0, i32* %l_57, align 4
  br label %for.cond75

for.cond75:                                       ; preds = %for.inc415, %if.end
  %17 = load i32* %l_57, align 4
  %cmp76 = icmp sge i32 %17, -1
  br i1 %cmp76, label %for.body78, label %for.end417

for.body78:                                       ; preds = %for.cond75
  store i32 2, i32* %l_73, align 4
  store i32 37488515, i32* %l_90, align 4
  store i32 1417351871, i32* %l_93, align 4
  store i32 0, i32* %l_95, align 4
  %18 = bitcast [6 x i32]* %l_96 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %18, i8* bitcast ([6 x i32]* @func_45.l_96 to i8*), i64 24, i32 16, i1 false)
  store i32* %l_87, i32** %l_137, align 8
  store i32* %l_99, i32** %l_138, align 8
  store i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 2, i64 0, i64 3), i32** %l_139, align 8
  store i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 3, i64 0, i64 3), i32** %l_140, align 8
  store i32* %l_90, i32** %l_141, align 8
  store i32* %l_80, i32** %l_142, align 8
  store %union.U0** @g_84, %union.U0*** %l_167, align 8
  store %union.U1* null, %union.U1** %l_234, align 8
  store i32 0, i32* %i79, align 4
  br label %for.cond80

for.cond80:                                       ; preds = %for.inc87, %for.body78
  %19 = load i32* %i79, align 4
  %cmp81 = icmp slt i32 %19, 2
  br i1 %cmp81, label %for.body83, label %for.end89

for.body83:                                       ; preds = %for.cond80
  %arrayidx84 = getelementptr inbounds [6 x i32]* %l_96, i32 0, i64 2
  %20 = load i32* %i79, align 4
  %idxprom85 = sext i32 %20 to i64
  %arrayidx86 = getelementptr inbounds [2 x i32*]* %l_143, i32 0, i64 %idxprom85
  store i32* %arrayidx84, i32** %arrayidx86, align 8
  br label %for.inc87

for.inc87:                                        ; preds = %for.body83
  %21 = load i32* %i79, align 4
  %inc88 = add nsw i32 %21, 1
  store i32 %inc88, i32* %i79, align 4
  br label %for.cond80

for.end89:                                        ; preds = %for.cond80
  store i8 1, i8* %p_48.addr, align 1
  br label %for.cond90

for.cond90:                                       ; preds = %for.inc213, %for.end89
  %22 = load i8* %p_48.addr, align 1
  %conv91 = sext i8 %22 to i32
  %cmp92 = icmp sge i32 %conv91, 0
  br i1 %cmp92, label %for.body94, label %for.end216

for.body94:                                       ; preds = %for.cond90
  store i64 -1, i64* %l_64, align 8
  store i32 -1666938534, i32* %l_97, align 4
  store i32 0, i32* %l_98, align 4
  store i8 1, i8* %l_101, align 1
  store i32* %l_90, i32** %l_136, align 8
  store i64 0, i64* @g_49, align 8
  br label %for.cond95

for.cond95:                                       ; preds = %for.inc140, %for.body94
  %23 = load i64* @g_49, align 8
  %cmp96 = icmp ule i64 %23, 1
  br i1 %cmp96, label %for.body98, label %for.end141

for.body98:                                       ; preds = %for.cond95
  %24 = bitcast [6 x [8 x i64]]* %l_62 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %24, i8* bitcast ([6 x [8 x i64]]* @func_45.l_62 to i8*), i64 384, i32 16, i1 false)
  %25 = bitcast [2 x [4 x i32]]* %l_68 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %25, i8* bitcast ([2 x [4 x i32]]* @func_45.l_68 to i8*), i64 32, i32 16, i1 false)
  store i32** %l_78, i32*** %l_79, align 8
  %arrayidx99 = getelementptr inbounds [2 x [4 x i32]]* %l_68, i32 0, i64 0
  %arrayidx100 = getelementptr inbounds [4 x i32]* %arrayidx99, i32 0, i64 0
  store i32* %arrayidx100, i32** %l_82, align 8
  %arrayidx104 = getelementptr inbounds [6 x [8 x i64]]* %l_62, i32 0, i64 4
  %arrayidx105 = getelementptr inbounds [8 x i64]* %arrayidx104, i32 0, i64 3
  %26 = load i64* %arrayidx105, align 8
  %conv106 = trunc i64 %26 to i16
  %27 = load i64* %l_64, align 8
  %call = call i64 @safe_unary_minus_func_int64_t_s(i64 %27)
  %tobool107 = icmp ne i64 %call, 0
  br i1 %tobool107, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %for.body98
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %for.body98
  %28 = phi i1 [ true, %for.body98 ], [ true, %lor.rhs ]
  %lor.ext = zext i1 %28 to i32
  %conv108 = trunc i32 %lor.ext to i16
  %call109 = call zeroext i16 @safe_div_func_uint16_t_u_u(i16 zeroext %conv106, i16 zeroext %conv108)
  %conv110 = zext i16 %call109 to i32
  %29 = load volatile i32** @g_65, align 8
  store i32 %conv110, i32* %29, align 4
  %30 = load i8* %p_48.addr, align 1
  %conv111 = sext i8 %30 to i32
  %arrayidx112 = getelementptr inbounds [2 x [4 x i32]]* %l_68, i32 0, i64 0
  %arrayidx113 = getelementptr inbounds [4 x i32]* %arrayidx112, i32 0, i64 0
  store i32 %conv111, i32* %arrayidx113, align 4
  %31 = load i32* @g_3, align 4
  %tobool114 = icmp ne i32 %31, 0
  br i1 %tobool114, label %lor.end116, label %lor.rhs115

lor.rhs115:                                       ; preds = %lor.end
  br label %lor.end116

lor.end116:                                       ; preds = %lor.rhs115, %lor.end
  %32 = phi i1 [ true, %lor.end ], [ true, %lor.rhs115 ]
  %lor.ext117 = zext i1 %32 to i32
  %conv118 = trunc i32 %lor.ext117 to i16
  %33 = load i32* %l_73, align 4
  %conv119 = trunc i32 %33 to i16
  %call120 = call zeroext i16 @safe_mul_func_uint16_t_u_u(i16 zeroext %conv118, i16 zeroext %conv119)
  %conv121 = trunc i16 %call120 to i8
  %34 = load i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 3, i64 0, i64 9), align 4
  %conv122 = trunc i32 %34 to i8
  %call123 = call signext i8 @safe_mul_func_int8_t_s_s(i8 signext %conv121, i8 signext %conv122)
  %conv124 = sext i8 %call123 to i32
  %35 = load i32** %l_78, align 8
  %36 = load i32*** %l_79, align 8
  store i32* %35, i32** %36, align 8
  %cmp125 = icmp eq i32* %35, null
  %conv126 = zext i1 %cmp125 to i32
  %37 = load i8* %p_48.addr, align 1
  %conv127 = sext i8 %37 to i32
  %cmp128 = icmp ne i32 %conv126, %conv127
  %conv129 = zext i1 %cmp128 to i32
  %conv130 = trunc i32 %conv129 to i8
  %call131 = call zeroext i8 @safe_lshift_func_uint8_t_u_s(i8 zeroext %conv130, i32 1)
  %conv132 = zext i8 %call131 to i32
  store i32 %conv132, i32* %l_80, align 4
  %38 = load i16* %p_47.addr, align 2
  %conv133 = sext i16 %38 to i32
  %call134 = call i32 @safe_mod_func_int32_t_s_s(i32 %conv132, i32 %conv133)
  %conv135 = sext i32 %call134 to i64
  %cmp136 = icmp ult i64 %conv135, 4294967291
  %conv137 = zext i1 %cmp136 to i32
  %cmp138 = icmp slt i32 %conv124, %conv137
  %conv139 = zext i1 %cmp138 to i32
  %39 = load i32** %l_82, align 8
  %40 = load i32* %39, align 4
  %and = and i32 %40, %conv139
  store i32 %and, i32* %39, align 4
  %41 = load volatile %union.U0*** @g_83, align 8
  store %union.U0* @g_13, %union.U0** %41, align 8
  br label %for.inc140

for.inc140:                                       ; preds = %lor.end116
  %42 = load i64* @g_49, align 8
  %add = add i64 %42, 1
  store i64 %add, i64* @g_49, align 8
  br label %for.cond95

for.end141:                                       ; preds = %for.cond95
  %43 = load i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 2, i64 0, i64 3), align 4
  %conv142 = sext i32 %43 to i64
  %44 = load i64* %l_64, align 8
  %cmp143 = icmp sge i64 %conv142, %44
  br i1 %cmp143, label %if.then145, label %if.else

if.then145:                                       ; preds = %for.end141
  store i32* %l_80, i32** %l_85, align 8
  %45 = bitcast [10 x [6 x [4 x i32*]]]* %l_86 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %45, i8* bitcast ([10 x [6 x [4 x i32*]]]* @func_45.l_86 to i8*), i64 1920, i32 16, i1 false)
  store i64 0, i64* %l_89, align 8
  store i32 -1445693661, i32* %l_102, align 4
  %46 = load i32* %l_102, align 4
  %dec = add i32 %46, -1
  store i32 %dec, i32* %l_102, align 4
  %47 = load i16* %p_47.addr, align 2
  %tobool149 = icmp ne i16 %47, 0
  br i1 %tobool149, label %if.then150, label %if.end151

if.then150:                                       ; preds = %if.then145
  br label %for.end216

if.end151:                                        ; preds = %if.then145
  br label %if.end156

if.else:                                          ; preds = %for.end141
  %arrayidx152 = getelementptr inbounds [6 x i32]* %l_96, i32 0, i64 4
  store i32* %arrayidx152, i32** %l_105, align 8
  %48 = load i8* %p_46.addr, align 1
  %conv153 = zext i8 %48 to i32
  %49 = load i32** %l_105, align 8
  store i32 %conv153, i32* %49, align 4
  %50 = load volatile %union.U0*** @g_83, align 8
  %51 = load %union.U0** %50, align 8
  %52 = load volatile %union.U0*** @g_106, align 8
  store %union.U0* %51, %union.U0** %52, align 8
  %53 = load i8* %p_48.addr, align 1
  %conv154 = sext i8 %53 to i32
  %54 = load i32** %l_105, align 8
  %55 = load i32* %54, align 4
  %and155 = and i32 %55, %conv154
  store i32 %and155, i32* %54, align 4
  br label %if.end156

if.end156:                                        ; preds = %if.else, %if.end151
  %56 = load i8* %p_48.addr, align 1
  %conv157 = sext i8 %56 to i32
  %tobool158 = icmp ne i32 %conv157, 0
  br i1 %tobool158, label %land.lhs.true, label %if.else211

land.lhs.true:                                    ; preds = %if.end156
  %57 = load i16* %l_109, align 2
  %conv159 = sext i16 %57 to i32
  store i32 %conv159, i32* getelementptr inbounds ([1 x [8 x [10 x i32]]]* @g_110, i32 0, i64 0, i64 2, i64 2), align 4
  %58 = load i32* %l_97, align 4
  %cmp160 = icmp uge i32 %conv159, %58
  %conv161 = zext i1 %cmp160 to i32
  %59 = load i32* bitcast (%union.U0* @g_13 to i32*), align 4
  %conv162 = trunc i32 %59 to i16
  %60 = load i8* %l_113, align 1
  %conv163 = sext i8 %60 to i32
  %conv164 = sext i32 %conv163 to i64
  %61 = load i64* %l_114, align 8
  %cmp165 = icmp ult i64 %conv164, %61
  %land.ext = zext i1 %cmp165 to i32
  %conv167 = trunc i32 %land.ext to i16
  %call168 = call zeroext i16 @safe_sub_func_uint16_t_u_u(i16 zeroext %conv162, i16 zeroext %conv167)
  %conv169 = zext i16 %call168 to i32
  %and170 = and i32 %conv161, %conv169
  %tobool171 = icmp ne i32 %and170, 0
  %lnot = xor i1 %tobool171, true
  %lnot.ext = zext i1 %lnot to i32
  %62 = load i32* %l_73, align 4
  %63 = load i16* %p_47.addr, align 2
  %conv172 = sext i16 %63 to i32
  %64 = load i64* @g_49, align 8
  %conv173 = trunc i64 %64 to i32
  %call174 = call i32 @safe_add_func_int32_t_s_s(i32 %conv172, i32 %conv173)
  %conv175 = sext i32 %call174 to i64
  %xor = xor i64 %conv175, 4
  %conv176 = trunc i64 %xor to i8
  %65 = load i32* getelementptr inbounds ([1 x [8 x [10 x i32]]]* @g_110, i32 0, i64 0, i64 6, i64 7), align 4
  %call177 = call signext i8 @safe_rshift_func_int8_t_s_u(i8 signext %conv176, i32 %65)
  %conv178 = sext i8 %call177 to i32
  %66 = load i8* %p_48.addr, align 1
  %conv179 = sext i8 %66 to i32
  %xor180 = xor i32 %conv178, %conv179
  %67 = load i32* bitcast (%union.U0* @g_13 to i32*), align 4
  %xor181 = xor i32 %62, %67
  %tobool182 = icmp ne i32 %xor181, 0
  br i1 %tobool182, label %land.rhs, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true
  %68 = load i32* bitcast (%union.U0* @g_13 to i32*), align 4
  %tobool183 = icmp ne i32 %68, 0
  br i1 %tobool183, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %lor.lhs.false, %land.lhs.true
  %69 = load i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 2, i64 0, i64 9), align 4
  %tobool184 = icmp ne i32 %69, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %lor.lhs.false
  %70 = phi i1 [ false, %lor.lhs.false ], [ %tobool184, %land.rhs ]
  %land.ext185 = zext i1 %70 to i32
  %conv186 = trunc i32 %land.ext185 to i16
  %71 = load i8* %p_46.addr, align 1
  %conv187 = zext i8 %71 to i32
  %call188 = call signext i16 @safe_lshift_func_int16_t_s_s(i16 signext %conv186, i32 %conv187)
  %conv189 = sext i16 %call188 to i64
  %cmp190 = icmp slt i64 %conv189, 209
  %conv191 = zext i1 %cmp190 to i32
  %conv192 = trunc i32 %conv191 to i16
  %call193 = call zeroext i16 @safe_sub_func_uint16_t_u_u(i16 zeroext %conv192, i16 zeroext 0)
  %conv194 = zext i16 %call193 to i32
  %tobool195 = icmp ne i32 %conv194, 0
  br i1 %tobool195, label %if.then196, label %if.else211

if.then196:                                       ; preds = %land.end
  store i32* %l_99, i32** %l_121, align 8
  store i32* null, i32** %l_122, align 8
  store i32* %l_80, i32** %l_123, align 8
  %72 = bitcast [2 x [4 x i32*]]* %l_124 to i8*
  call void @llvm.memset.p0i8.i64(i8* %72, i8 0, i64 64, i32 16, i1 false)
  %73 = bitcast i8* %72 to [2 x [4 x i32*]]*
  %74 = getelementptr [2 x [4 x i32*]]* %73, i32 0, i32 0
  %75 = getelementptr [4 x i32*]* %74, i32 0, i32 0
  %76 = getelementptr [4 x i32*]* %74, i32 0, i32 1
  store i32* bitcast (%union.U0* @g_13 to i32*), i32** %76
  %77 = getelementptr [4 x i32*]* %74, i32 0, i32 2
  %78 = getelementptr [4 x i32*]* %74, i32 0, i32 3
  store i32* bitcast (%union.U0* @g_13 to i32*), i32** %78
  %79 = getelementptr [2 x [4 x i32*]]* %73, i32 0, i32 1
  %80 = getelementptr [4 x i32*]* %79, i32 0, i32 0
  %81 = getelementptr [4 x i32*]* %79, i32 0, i32 1
  store i32* bitcast (%union.U0* @g_13 to i32*), i32** %81
  %82 = getelementptr [4 x i32*]* %79, i32 0, i32 2
  %83 = getelementptr [4 x i32*]* %79, i32 0, i32 3
  store i32* bitcast (%union.U0* @g_13 to i32*), i32** %83
  store %union.U1* @g_130, %union.U1** %l_129, align 8
  store %union.U1** null, %union.U1*** %l_131, align 8
  %84 = load i32* %l_126, align 4
  %inc200 = add i32 %84, 1
  store i32 %inc200, i32* %l_126, align 4
  %85 = load i8* %p_48.addr, align 1
  %idxprom201 = sext i8 %85 to i64
  %86 = load i8* %p_48.addr, align 1
  %conv202 = sext i8 %86 to i32
  %add203 = add nsw i32 %conv202, 4
  %idxprom204 = sext i32 %add203 to i64
  %87 = load i8* %p_48.addr, align 1
  %conv205 = sext i8 %87 to i32
  %add206 = add nsw i32 %conv205, 6
  %idxprom207 = sext i32 %add206 to i64
  %arrayidx208 = getelementptr inbounds [8 x [8 x [2 x i32*]]]* %l_54, i32 0, i64 %idxprom207
  %arrayidx209 = getelementptr inbounds [8 x [2 x i32*]]* %arrayidx208, i32 0, i64 %idxprom204
  %arrayidx210 = getelementptr inbounds [2 x i32*]* %arrayidx209, i32 0, i64 %idxprom201
  store i32* %l_97, i32** %arrayidx210, align 8
  %88 = load %union.U1** %l_129, align 8
  %89 = load volatile %union.U1*** @g_132, align 8
  store %union.U1* %88, %union.U1** %89, align 8
  br label %if.end212

if.else211:                                       ; preds = %land.end, %if.end156
  %90 = load i32*** @g_134, align 8
  store i32** %90, i32*** %retval
  br label %return

if.end212:                                        ; preds = %if.then196
  %91 = load i32* %l_135, align 4
  %92 = load i32** %l_136, align 8
  %93 = load i32* %92, align 4
  %or = or i32 %93, %91
  store i32 %or, i32* %92, align 4
  br label %for.inc213

for.inc213:                                       ; preds = %if.end212
  %94 = load i8* %p_48.addr, align 1
  %conv214 = sext i8 %94 to i32
  %sub = sub nsw i32 %conv214, 1
  %conv215 = trunc i32 %sub to i8
  store i8 %conv215, i8* %p_48.addr, align 1
  br label %for.cond90

for.end216:                                       ; preds = %if.then150, %for.cond90
  %95 = load i16* %l_150, align 2
  %inc217 = add i16 %95, 1
  store i16 %inc217, i16* %l_150, align 2
  store i32 7, i32* %l_95, align 4
  br label %for.cond218

for.cond218:                                      ; preds = %for.inc260, %for.end216
  %96 = load i32* %l_95, align 4
  %cmp219 = icmp sge i32 %96, -18
  br i1 %cmp219, label %for.body221, label %for.end262

for.body221:                                      ; preds = %for.cond218
  store i32** @g_56, i32*** %l_155, align 8
  store i32 0, i32* %i222, align 4
  br label %for.cond223

for.cond223:                                      ; preds = %for.inc229, %for.body221
  %97 = load i32* %i222, align 4
  %cmp224 = icmp slt i32 %97, 3
  br i1 %cmp224, label %for.body226, label %for.end231

for.body226:                                      ; preds = %for.cond223
  %98 = load i32* %i222, align 4
  %idxprom227 = sext i32 %98 to i64
  %arrayidx228 = getelementptr inbounds [3 x i32]* %l_168, i32 0, i64 %idxprom227
  store i32 989340277, i32* %arrayidx228, align 4
  br label %for.inc229

for.inc229:                                       ; preds = %for.body226
  %99 = load i32* %i222, align 4
  %inc230 = add nsw i32 %99, 1
  store i32 %inc230, i32* %i222, align 4
  br label %for.cond223

for.end231:                                       ; preds = %for.cond223
  %100 = load volatile i32*** @g_55, align 8
  %101 = load i32** %100, align 8
  %102 = load i32*** %l_155, align 8
  store i32* %101, i32** %102, align 8
  %arrayidx232 = getelementptr inbounds [6 x i32]* %l_92, i32 0, i64 1
  %103 = load i32* %arrayidx232, align 4
  %conv233 = sext i32 %103 to i64
  %cmp234 = icmp ult i64 %conv233, -7192982555041606366
  br i1 %cmp234, label %if.then236, label %if.else248

if.then236:                                       ; preds = %for.end231
  store i32 -420921484, i32* %l_162, align 4
  store i32* null, i32** %l_164, align 8
  store i32* bitcast (%union.U1* @g_130 to i32*), i32** %l_165, align 8
  %104 = load i16* bitcast (%union.U1* @g_130 to i16*), align 2
  %conv237 = sext i16 %104 to i32
  %call238 = call signext i16 @safe_rshift_func_int16_t_s_s(i16 signext 1, i32 %conv237)
  %conv239 = trunc i16 %call238 to i8
  store i8 %conv239, i8* %p_48.addr, align 1
  %conv240 = sext i8 %conv239 to i32
  %arrayidx241 = getelementptr inbounds [6 x i32]* %l_92, i32 0, i64 0
  %105 = load i32* %arrayidx241, align 4
  %cmp242 = icmp sge i32 %conv240, %105
  %conv243 = zext i1 %cmp242 to i32
  %106 = load i32** %l_165, align 8
  store i32 %conv243, i32* %106, align 4
  %conv244 = trunc i32 %conv243 to i16
  store i16 %conv244, i16* @g_166, align 2
  %107 = load %union.U0*** %l_167, align 8
  store volatile %union.U0** %107, %union.U0*** @g_83, align 8
  %108 = load i32* %l_162, align 4
  %tobool245 = icmp ne i32 %108, 0
  br i1 %tobool245, label %if.then246, label %if.end247

if.then246:                                       ; preds = %if.then236
  br label %for.inc260

if.end247:                                        ; preds = %if.then236
  %109 = load i32*** %l_155, align 8
  store i32* %l_57, i32** %109, align 8
  br label %if.end249

if.else248:                                       ; preds = %for.end231
  %110 = load i32*** @g_134, align 8
  store i32** %110, i32*** %retval
  br label %return

if.end249:                                        ; preds = %if.end247
  %111 = load i32* %l_169, align 4
  %inc250 = add i32 %111, 1
  store i32 %inc250, i32* %l_169, align 4
  store i32 0, i32* %l_93, align 4
  br label %for.cond251

for.cond251:                                      ; preds = %for.inc255, %if.end249
  %112 = load i32* %l_93, align 4
  %cmp252 = icmp eq i32 %112, 25
  br i1 %cmp252, label %for.body254, label %for.end259

for.body254:                                      ; preds = %for.cond251
  %113 = load i32*** @g_134, align 8
  store i32** %113, i32*** %retval
  br label %return

for.inc255:                                       ; No predecessors!
  %114 = load i32* %l_93, align 4
  %conv256 = sext i32 %114 to i64
  %call257 = call i64 @safe_add_func_uint64_t_u_u(i64 %conv256, i64 5)
  %conv258 = trunc i64 %call257 to i32
  store i32 %conv258, i32* %l_93, align 4
  br label %for.cond251

for.end259:                                       ; preds = %for.cond251
  br label %for.inc260

for.inc260:                                       ; preds = %for.end259, %if.then246
  %115 = load i32* %l_95, align 4
  %dec261 = add nsw i32 %115, -1
  store i32 %dec261, i32* %l_95, align 4
  br label %for.cond218

for.end262:                                       ; preds = %for.cond218
  store i8 6, i8* %p_48.addr, align 1
  br label %for.cond263

for.cond263:                                      ; preds = %for.inc410, %for.end262
  %116 = load i8* %p_48.addr, align 1
  %conv264 = sext i8 %116 to i32
  %cmp265 = icmp sge i32 %conv264, 1
  br i1 %cmp265, label %for.body267, label %for.end414

for.body267:                                      ; preds = %for.cond263
  store i8* @g_182, i8** %l_181, align 8
  store i8* @g_200, i8** %l_199, align 8
  store i32 0, i32* %l_203, align 4
  %117 = bitcast [2 x [6 x i32]]* %l_204 to i8*
  call void @llvm.memset.p0i8.i64(i8* %117, i8 0, i64 48, i32 16, i1 false)
  %118 = bitcast i8* %117 to [2 x [6 x i32]]*
  %119 = getelementptr [2 x [6 x i32]]* %118, i32 0, i32 0
  %120 = getelementptr [6 x i32]* %119, i32 0, i32 0
  %121 = getelementptr [6 x i32]* %119, i32 0, i32 1
  store i32 -9, i32* %121
  %122 = getelementptr [6 x i32]* %119, i32 0, i32 2
  %123 = getelementptr [6 x i32]* %119, i32 0, i32 3
  store i32 -9, i32* %123
  %124 = getelementptr [6 x i32]* %119, i32 0, i32 4
  %125 = getelementptr [6 x i32]* %119, i32 0, i32 5
  store i32 -9, i32* %125
  %126 = getelementptr [2 x [6 x i32]]* %118, i32 0, i32 1
  %127 = getelementptr [6 x i32]* %126, i32 0, i32 0
  %128 = getelementptr [6 x i32]* %126, i32 0, i32 1
  store i32 -9, i32* %128
  %129 = getelementptr [6 x i32]* %126, i32 0, i32 2
  %130 = getelementptr [6 x i32]* %126, i32 0, i32 3
  store i32 -9, i32* %130
  %131 = getelementptr [6 x i32]* %126, i32 0, i32 4
  %132 = getelementptr [6 x i32]* %126, i32 0, i32 5
  store i32 -9, i32* %132
  store i32** %l_137, i32*** %l_217, align 8
  store %union.U1** %l_180, %union.U1*** %l_238, align 8
  %133 = load i64* getelementptr inbounds (%union.U0* @g_13, i32 0, i32 0), align 8
  %conv270 = trunc i64 %133 to i32
  %call271 = call i32 @safe_unary_minus_func_uint32_t_u(i32 %conv270)
  %conv272 = trunc i32 %call271 to i16
  %134 = load %union.U1** %l_180, align 8
  %cmp273 = icmp ne %union.U1* %134, null
  br i1 %cmp273, label %lor.end278, label %lor.rhs275

lor.rhs275:                                       ; preds = %for.body267
  %135 = load i8* %p_48.addr, align 1
  %conv276 = sext i8 %135 to i32
  %tobool277 = icmp ne i32 %conv276, 0
  br label %lor.end278

lor.end278:                                       ; preds = %lor.rhs275, %for.body267
  %136 = phi i1 [ true, %for.body267 ], [ %tobool277, %lor.rhs275 ]
  %lor.ext279 = zext i1 %136 to i32
  %conv280 = trunc i32 %lor.ext279 to i8
  %137 = load i8** %l_181, align 8
  store i8 %conv280, i8* %137, align 1
  %conv281 = zext i8 %conv280 to i32
  %138 = load i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 2, i64 0, i64 3), align 4
  %conv282 = trunc i32 %138 to i8
  %call283 = call zeroext i8 @safe_rshift_func_uint8_t_u_u(i8 zeroext %conv282, i32 1)
  %conv284 = zext i8 %call283 to i32
  %139 = load i8* %p_48.addr, align 1
  %conv285 = sext i8 %139 to i32
  %140 = load i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 2, i64 0, i64 3), align 4
  %cmp286 = icmp sle i32 %conv285, %140
  %conv287 = zext i1 %cmp286 to i32
  %141 = load i16* @g_193, align 2
  %dec288 = add i16 %141, -1
  store i16 %dec288, i16* @g_193, align 2
  %conv289 = trunc i16 %141 to i8
  %call290 = call signext i8 @safe_mul_func_int8_t_s_s(i8 signext 1, i8 signext %conv289)
  %conv291 = sext i8 %call290 to i32
  %142 = load i16* %p_47.addr, align 2
  %143 = load i32* %l_196, align 4
  %conv292 = sext i32 %143 to i64
  %and293 = and i64 %conv292, -6941934766672940743
  %144 = load i16* bitcast (%union.U1* @g_130 to i16*), align 2
  %conv294 = sext i16 %144 to i64
  %cmp295 = icmp sle i64 %conv294, 7
  %conv296 = zext i1 %cmp295 to i32
  %145 = load i8* %p_46.addr, align 1
  %conv297 = zext i8 %145 to i32
  %and298 = and i32 %conv296, %conv297
  %tobool299 = icmp ne i32 %and298, 0
  br i1 %tobool299, label %land.rhs300, label %land.end303

land.rhs300:                                      ; preds = %lor.end278
  %146 = load i16* @g_166, align 2
  %conv301 = sext i16 %146 to i32
  %tobool302 = icmp ne i32 %conv301, 0
  br label %land.end303

land.end303:                                      ; preds = %land.rhs300, %lor.end278
  %147 = phi i1 [ false, %lor.end278 ], [ %tobool302, %land.rhs300 ]
  %land.ext304 = zext i1 %147 to i32
  %arrayidx305 = getelementptr inbounds [6 x i32]* %l_92, i32 0, i64 4
  %148 = load i32* %arrayidx305, align 4
  %cmp306 = icmp slt i32 %land.ext304, %148
  %conv307 = zext i1 %cmp306 to i32
  %cmp308 = icmp sle i32 %conv291, %conv307
  %conv309 = zext i1 %cmp308 to i32
  %149 = load i16* @g_166, align 2
  %conv310 = sext i16 %149 to i32
  %xor311 = xor i32 %conv309, %conv310
  %150 = bitcast i32** %l_78 to i8*
  %cmp312 = icmp ne i8* null, %150
  %conv313 = zext i1 %cmp312 to i32
  %cmp314 = icmp sgt i32 %conv284, %conv313
  %conv315 = zext i1 %cmp314 to i32
  %conv316 = trunc i32 %conv315 to i16
  %151 = load i64* %l_197, align 8
  %conv317 = trunc i64 %151 to i16
  %call318 = call signext i16 @safe_add_func_int16_t_s_s(i16 signext %conv316, i16 signext %conv317)
  %conv319 = sext i16 %call318 to i32
  %152 = load volatile i8* bitcast (%union.U1* @g_130 to i8*), align 1
  %conv320 = sext i8 %152 to i32
  %cmp321 = icmp sgt i32 %conv319, %conv320
  %conv322 = zext i1 %cmp321 to i32
  %arrayidx323 = getelementptr inbounds [9 x %union.U0**]* %l_198, i32 0, i64 4
  %153 = load %union.U0*** %arrayidx323, align 8
  %154 = bitcast %union.U0** %153 to i8*
  %cmp324 = icmp ne i8* null, %154
  %conv325 = zext i1 %cmp324 to i32
  %call326 = call signext i16 @safe_rshift_func_int16_t_s_s(i16 signext 32699, i32 13)
  %155 = load i32* bitcast (%union.U0* @g_13 to i32*), align 4
  %conv327 = trunc i32 %155 to i16
  %call328 = call zeroext i16 @safe_div_func_uint16_t_u_u(i16 zeroext %call326, i16 zeroext %conv327)
  %156 = load i16* %p_47.addr, align 2
  %conv329 = trunc i16 %156 to i8
  %157 = load i8** %l_199, align 8
  store i8 %conv329, i8* %157, align 1
  %conv330 = zext i8 %conv329 to i32
  %158 = load i8* %p_46.addr, align 1
  %conv331 = zext i8 %158 to i32
  %cmp332 = icmp ne i32 %conv330, %conv331
  %conv333 = zext i1 %cmp332 to i32
  %cmp334 = icmp ne i32 %conv281, %conv333
  %conv335 = zext i1 %cmp334 to i32
  %conv336 = trunc i32 %conv335 to i16
  %call337 = call zeroext i16 @safe_unary_minus_func_uint16_t_u(i16 zeroext %conv336)
  %conv338 = zext i16 %call337 to i32
  %159 = load i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 3, i64 0, i64 1), align 4
  %cmp339 = icmp slt i32 %conv338, %159
  %conv340 = zext i1 %cmp339 to i32
  %call341 = call signext i16 @safe_rshift_func_int16_t_s_s(i16 signext %conv272, i32 %conv340)
  %tobool342 = icmp ne i16 %call341, 0
  br i1 %tobool342, label %if.then343, label %if.else350

if.then343:                                       ; preds = %land.end303
  store i32 -1848208573, i32* %l_202, align 4
  store i32 -391985392, i32* %l_205, align 4
  store i32 1449219261, i32* %l_206, align 4
  store i32 -770769982, i32* %l_211, align 4
  %160 = bitcast [9 x [10 x [2 x i32]]]* %l_212 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %160, i8* bitcast ([9 x [10 x [2 x i32]]]* @func_45.l_212 to i8*), i64 720, i32 16, i1 false)
  %arrayidx347 = getelementptr inbounds [4 x i32]* %l_207, i32 0, i64 2
  %161 = load i32* %arrayidx347, align 4
  %dec348 = add i32 %161, -1
  store i32 %dec348, i32* %arrayidx347, align 4
  %162 = load i64* %l_214, align 8
  %dec349 = add i64 %162, -1
  store i64 %dec349, i64* %l_214, align 8
  %163 = load i32*** @g_134, align 8
  store i32** %163, i32*** %retval
  br label %return

if.else350:                                       ; preds = %land.end303
  store i16* %l_150, i16** %l_232, align 8
  %164 = load %union.U1** %l_180, align 8
  %165 = load volatile %union.U1*** @g_220, align 8
  store %union.U1* %164, %union.U1** %165, align 8
  %166 = load i32** %l_138, align 8
  %167 = load i32* %166, align 4
  %conv351 = sext i32 %167 to i64
  %cmp352 = icmp ne i64 3132538037, %conv351
  %conv353 = zext i1 %cmp352 to i32
  %conv354 = trunc i32 %conv353 to i16
  %168 = load %union.U1** %l_223, align 8
  %cmp355 = icmp ne %union.U1* null, %168
  %conv356 = zext i1 %cmp355 to i32
  %169 = load volatile i8* bitcast (%union.U1* @g_130 to i8*), align 1
  %conv357 = sext i8 %169 to i32
  %170 = load i8* %p_48.addr, align 1
  %conv358 = sext i8 %170 to i32
  %171 = load i8* %p_46.addr, align 1
  %conv359 = zext i8 %171 to i16
  %172 = load i8* %p_46.addr, align 1
  %conv360 = zext i8 %172 to i64
  %173 = load i32* getelementptr inbounds ([6 x [1 x [10 x i32]]]* @g_66, i32 0, i64 2, i64 0, i64 3), align 4
  %conv361 = trunc i32 %173 to i8
  %call362 = call signext i8 @safe_rshift_func_int8_t_s_u(i8 signext %conv361, i32 7)
  %conv363 = sext i8 %call362 to i64
  %call364 = call i64 @safe_div_func_int64_t_s_s(i64 %conv360, i64 %conv363)
  %conv365 = trunc i64 %call364 to i16
  %call366 = call zeroext i16 @safe_add_func_uint16_t_u_u(i16 zeroext %conv359, i16 zeroext %conv365)
  %conv367 = zext i16 %call366 to i32
  %call368 = call i32 @safe_add_func_int32_t_s_s(i32 %conv358, i32 %conv367)
  %and369 = and i32 %conv357, %call368
  %cmp370 = icmp sge i32 %conv356, %and369
  %conv371 = zext i1 %cmp370 to i32
  %conv372 = trunc i32 %conv371 to i16
  %174 = load i16** %l_232, align 8
  store i16 %conv372, i16* %174, align 2
  %conv373 = zext i16 %conv372 to i32
  %call374 = call signext i16 @safe_lshift_func_int16_t_s_u(i16 signext %conv354, i32 %conv373)
  %conv375 = sext i16 %call374 to i32
  %175 = load i32** %l_137, align 8
  %176 = load i32* %175, align 4
  %xor376 = xor i32 %176, %conv375
  store i32 %xor376, i32* %175, align 4
  br label %if.end377

if.end377:                                        ; preds = %if.else350
  store i16 0, i16* @g_193, align 2
  br label %for.cond378

for.cond378:                                      ; preds = %for.inc383, %if.end377
  %177 = load i16* @g_193, align 2
  %conv379 = zext i16 %177 to i32
  %cmp380 = icmp sle i32 %conv379, 1
  br i1 %cmp380, label %for.body382, label %for.end387

for.body382:                                      ; preds = %for.cond378
  %178 = load volatile %union.U1*** @g_132, align 8
  %179 = load %union.U1** %178, align 8
  store %union.U1* %179, %union.U1** %l_234, align 8
  br label %for.inc383

for.inc383:                                       ; preds = %for.body382
  %180 = load i16* @g_193, align 2
  %conv384 = zext i16 %180 to i32
  %add385 = add nsw i32 %conv384, 1
  %conv386 = trunc i32 %add385 to i16
  store i16 %conv386, i16* @g_193, align 2
  br label %for.cond378

for.end387:                                       ; preds = %for.cond378
  store i32 0, i32* %l_91, align 4
  br label %for.cond388

for.cond388:                                      ; preds = %for.inc407, %for.end387
  %181 = load i32* %l_91, align 4
  %cmp389 = icmp sle i32 %181, 1
  br i1 %cmp389, label %for.body391, label %for.end409

for.body391:                                      ; preds = %for.cond388
  store %union.U0** @g_84, %union.U0*** %l_239, align 8
  %182 = load %union.U1*** %l_237, align 8
  %183 = load %union.U1*** %l_238, align 8
  %cmp394 = icmp ne %union.U1** %182, %183
  %conv395 = zext i1 %cmp394 to i32
  %conv396 = trunc i32 %conv395 to i16
  %184 = load %union.U0*** %l_239, align 8
  %cmp397 = icmp ne %union.U0** null, %184
  %conv398 = zext i1 %cmp397 to i32
  %call399 = call zeroext i16 @safe_lshift_func_uint16_t_u_u(i16 zeroext %conv396, i32 %conv398)
  %conv400 = zext i16 %call399 to i32
  %185 = load i32* %l_91, align 4
  %idxprom401 = sext i32 %185 to i64
  %186 = load i32* %l_91, align 4
  %add402 = add nsw i32 %186, 1
  %idxprom403 = sext i32 %add402 to i64
  %arrayidx404 = getelementptr inbounds [3 x [2 x i32]]* %l_145, i32 0, i64 %idxprom403
  %arrayidx405 = getelementptr inbounds [2 x i32]* %arrayidx404, i32 0, i64 %idxprom401
  %187 = load i32* %arrayidx405, align 4
  %or406 = or i32 %187, %conv400
  store i32 %or406, i32* %arrayidx405, align 4
  br label %for.inc407

for.inc407:                                       ; preds = %for.body391
  %188 = load i32* %l_91, align 4
  %add408 = add nsw i32 %188, 1
  store i32 %add408, i32* %l_91, align 4
  br label %for.cond388

for.end409:                                       ; preds = %for.cond388
  br label %for.inc410

for.inc410:                                       ; preds = %for.end409
  %189 = load i8* %p_48.addr, align 1
  %conv411 = sext i8 %189 to i32
  %sub412 = sub nsw i32 %conv411, 1
  %conv413 = trunc i32 %sub412 to i8
  store i8 %conv413, i8* %p_48.addr, align 1
  br label %for.cond263

for.end414:                                       ; preds = %for.cond263
  br label %for.inc415

for.inc415:                                       ; preds = %for.end414
  %190 = load i32* %l_57, align 4
  %dec416 = add nsw i32 %190, -1
  store i32 %dec416, i32* %l_57, align 4
  br label %for.cond75

for.end417:                                       ; preds = %for.cond75
  %191 = load i32*** @g_134, align 8
  store i32** %191, i32*** %retval
  br label %return

for.inc418:                                       ; No predecessors!
  %192 = load i8* %p_46.addr, align 1
  %inc419 = add i8 %192, 1
  store i8 %inc419, i8* %p_46.addr, align 1
  br label %for.cond57

for.end420:                                       ; preds = %if.then, %for.cond57
  br label %for.inc421

for.inc421:                                       ; preds = %for.end420
  %193 = load i16* %p_47.addr, align 2
  %inc422 = add i16 %193, 1
  store i16 %inc422, i16* %p_47.addr, align 2
  br label %for.cond

for.end423:                                       ; preds = %for.cond
  %194 = load i32*** @g_134, align 8
  store i32** %194, i32*** %retval
  br label %return

return:                                           ; preds = %for.end423, %for.end417, %if.then343, %for.body254, %if.else248, %if.else211
  %195 = load i32*** %retval
  ret i32** %195
}

define internal i64 @safe_unary_minus_func_int64_t_s(i64 %si) nounwind uwtable {
entry:
  %si.addr = alloca i64, align 8
  store i64 %si, i64* %si.addr, align 8
  %0 = load i64* %si.addr, align 8
  %cmp = icmp eq i64 %0, -9223372036854775808
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %1 = load i64* %si.addr, align 8
  br label %cond.end

cond.false:                                       ; preds = %entry
  %2 = load i64* %si.addr, align 8
  %sub = sub nsw i64 0, %2
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i64 [ %1, %cond.true ], [ %sub, %cond.false ]
  ret i64 %cond
}

define internal i32 @safe_mod_func_int32_t_s_s(i32 %si1, i32 %si2) nounwind uwtable {
entry:
  %si1.addr = alloca i32, align 4
  %si2.addr = alloca i32, align 4
  store i32 %si1, i32* %si1.addr, align 4
  store i32 %si2, i32* %si2.addr, align 4
  %0 = load i32* %si2.addr, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %cond.true, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i32* %si1.addr, align 4
  %cmp1 = icmp eq i32 %1, -2147483648
  br i1 %cmp1, label %land.lhs.true, label %cond.false

land.lhs.true:                                    ; preds = %lor.lhs.false
  %2 = load i32* %si2.addr, align 4
  %cmp2 = icmp eq i32 %2, -1
  br i1 %cmp2, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true, %entry
  %3 = load i32* %si1.addr, align 4
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true, %lor.lhs.false
  %4 = load i32* %si1.addr, align 4
  %5 = load i32* %si2.addr, align 4
  %rem = srem i32 %4, %5
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %3, %cond.true ], [ %rem, %cond.false ]
  ret i32 %cond
}

define internal zeroext i8 @safe_lshift_func_uint8_t_u_s(i8 zeroext %left, i32 %right) nounwind uwtable {
entry:
  %left.addr = alloca i8, align 1
  %right.addr = alloca i32, align 4
  store i8 %left, i8* %left.addr, align 1
  store i32 %right, i32* %right.addr, align 4
  %0 = load i32* %right.addr, align 4
  %cmp = icmp slt i32 %0, 0
  br i1 %cmp, label %cond.true, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i32* %right.addr, align 4
  %cmp1 = icmp sge i32 %1, 32
  br i1 %cmp1, label %cond.true, label %lor.lhs.false2

lor.lhs.false2:                                   ; preds = %lor.lhs.false
  %2 = load i8* %left.addr, align 1
  %conv = zext i8 %2 to i32
  %3 = load i32* %right.addr, align 4
  %shr = ashr i32 255, %3
  %cmp3 = icmp sgt i32 %conv, %shr
  br i1 %cmp3, label %cond.true, label %cond.false

cond.true:                                        ; preds = %lor.lhs.false2, %lor.lhs.false, %entry
  %4 = load i8* %left.addr, align 1
  %conv5 = zext i8 %4 to i32
  br label %cond.end

cond.false:                                       ; preds = %lor.lhs.false2
  %5 = load i8* %left.addr, align 1
  %conv6 = zext i8 %5 to i32
  %6 = load i32* %right.addr, align 4
  %shl = shl i32 %conv6, %6
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv5, %cond.true ], [ %shl, %cond.false ]
  %conv7 = trunc i32 %cond to i8
  ret i8 %conv7
}

define internal signext i16 @safe_lshift_func_int16_t_s_s(i16 signext %left, i32 %right) nounwind uwtable {
entry:
  %left.addr = alloca i16, align 2
  %right.addr = alloca i32, align 4
  store i16 %left, i16* %left.addr, align 2
  store i32 %right, i32* %right.addr, align 4
  %0 = load i16* %left.addr, align 2
  %conv = sext i16 %0 to i32
  %cmp = icmp slt i32 %conv, 0
  br i1 %cmp, label %cond.true, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i32* %right.addr, align 4
  %cmp2 = icmp slt i32 %1, 0
  br i1 %cmp2, label %cond.true, label %lor.lhs.false4

lor.lhs.false4:                                   ; preds = %lor.lhs.false
  %2 = load i32* %right.addr, align 4
  %cmp5 = icmp sge i32 %2, 32
  br i1 %cmp5, label %cond.true, label %lor.lhs.false7

lor.lhs.false7:                                   ; preds = %lor.lhs.false4
  %3 = load i16* %left.addr, align 2
  %conv8 = sext i16 %3 to i32
  %4 = load i32* %right.addr, align 4
  %shr = ashr i32 32767, %4
  %cmp9 = icmp sgt i32 %conv8, %shr
  br i1 %cmp9, label %cond.true, label %cond.false

cond.true:                                        ; preds = %lor.lhs.false7, %lor.lhs.false4, %lor.lhs.false, %entry
  %5 = load i16* %left.addr, align 2
  %conv11 = sext i16 %5 to i32
  br label %cond.end

cond.false:                                       ; preds = %lor.lhs.false7
  %6 = load i16* %left.addr, align 2
  %conv12 = sext i16 %6 to i32
  %7 = load i32* %right.addr, align 4
  %shl = shl i32 %conv12, %7
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv11, %cond.true ], [ %shl, %cond.false ]
  %conv13 = trunc i32 %cond to i16
  ret i16 %conv13
}

define internal signext i8 @safe_rshift_func_int8_t_s_u(i8 signext %left, i32 %right) nounwind uwtable {
entry:
  %left.addr = alloca i8, align 1
  %right.addr = alloca i32, align 4
  store i8 %left, i8* %left.addr, align 1
  store i32 %right, i32* %right.addr, align 4
  %0 = load i8* %left.addr, align 1
  %conv = sext i8 %0 to i32
  %cmp = icmp slt i32 %conv, 0
  br i1 %cmp, label %cond.true, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i32* %right.addr, align 4
  %cmp2 = icmp uge i32 %1, 32
  br i1 %cmp2, label %cond.true, label %cond.false

cond.true:                                        ; preds = %lor.lhs.false, %entry
  %2 = load i8* %left.addr, align 1
  %conv4 = sext i8 %2 to i32
  br label %cond.end

cond.false:                                       ; preds = %lor.lhs.false
  %3 = load i8* %left.addr, align 1
  %conv5 = sext i8 %3 to i32
  %4 = load i32* %right.addr, align 4
  %shr = ashr i32 %conv5, %4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv4, %cond.true ], [ %shr, %cond.false ]
  %conv6 = trunc i32 %cond to i8
  ret i8 %conv6
}

define internal i64 @safe_add_func_uint64_t_u_u(i64 %ui1, i64 %ui2) nounwind uwtable {
entry:
  %ui1.addr = alloca i64, align 8
  %ui2.addr = alloca i64, align 8
  store i64 %ui1, i64* %ui1.addr, align 8
  store i64 %ui2, i64* %ui2.addr, align 8
  %0 = load i64* %ui1.addr, align 8
  %1 = load i64* %ui2.addr, align 8
  %add = add i64 %0, %1
  ret i64 %add
}

define internal i32 @safe_unary_minus_func_uint32_t_u(i32 %ui) nounwind uwtable {
entry:
  %ui.addr = alloca i32, align 4
  store i32 %ui, i32* %ui.addr, align 4
  %0 = load i32* %ui.addr, align 4
  %sub = sub i32 0, %0
  ret i32 %sub
}

define internal zeroext i16 @safe_unary_minus_func_uint16_t_u(i16 zeroext %ui) nounwind uwtable {
entry:
  %ui.addr = alloca i16, align 2
  store i16 %ui, i16* %ui.addr, align 2
  %0 = load i16* %ui.addr, align 2
  %conv = zext i16 %0 to i32
  %sub = sub nsw i32 0, %conv
  %conv1 = trunc i32 %sub to i16
  ret i16 %conv1
}

define internal signext i16 @safe_add_func_int16_t_s_s(i16 signext %si1, i16 signext %si2) nounwind uwtable {
entry:
  %si1.addr = alloca i16, align 2
  %si2.addr = alloca i16, align 2
  store i16 %si1, i16* %si1.addr, align 2
  store i16 %si2, i16* %si2.addr, align 2
  %0 = load i16* %si1.addr, align 2
  %conv = sext i16 %0 to i32
  %1 = load i16* %si2.addr, align 2
  %conv1 = sext i16 %1 to i32
  %add = add nsw i32 %conv, %conv1
  %conv2 = trunc i32 %add to i16
  ret i16 %conv2
}

define internal zeroext i8 @safe_rshift_func_uint8_t_u_u(i8 zeroext %left, i32 %right) nounwind uwtable {
entry:
  %left.addr = alloca i8, align 1
  %right.addr = alloca i32, align 4
  store i8 %left, i8* %left.addr, align 1
  store i32 %right, i32* %right.addr, align 4
  %0 = load i32* %right.addr, align 4
  %cmp = icmp uge i32 %0, 32
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %1 = load i8* %left.addr, align 1
  %conv = zext i8 %1 to i32
  br label %cond.end

cond.false:                                       ; preds = %entry
  %2 = load i8* %left.addr, align 1
  %conv1 = zext i8 %2 to i32
  %3 = load i32* %right.addr, align 4
  %shr = ashr i32 %conv1, %3
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv, %cond.true ], [ %shr, %cond.false ]
  %conv2 = trunc i32 %cond to i8
  ret i8 %conv2
}

define internal i64 @safe_div_func_int64_t_s_s(i64 %si1, i64 %si2) nounwind uwtable {
entry:
  %si1.addr = alloca i64, align 8
  %si2.addr = alloca i64, align 8
  store i64 %si1, i64* %si1.addr, align 8
  store i64 %si2, i64* %si2.addr, align 8
  %0 = load i64* %si2.addr, align 8
  %cmp = icmp eq i64 %0, 0
  br i1 %cmp, label %cond.true, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i64* %si1.addr, align 8
  %cmp1 = icmp eq i64 %1, -9223372036854775808
  br i1 %cmp1, label %land.lhs.true, label %cond.false

land.lhs.true:                                    ; preds = %lor.lhs.false
  %2 = load i64* %si2.addr, align 8
  %cmp2 = icmp eq i64 %2, -1
  br i1 %cmp2, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true, %entry
  %3 = load i64* %si1.addr, align 8
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true, %lor.lhs.false
  %4 = load i64* %si1.addr, align 8
  %5 = load i64* %si2.addr, align 8
  %div = sdiv i64 %4, %5
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i64 [ %3, %cond.true ], [ %div, %cond.false ]
  ret i64 %cond
}

define internal zeroext i16 @safe_lshift_func_uint16_t_u_u(i16 zeroext %left, i32 %right) nounwind uwtable {
entry:
  %left.addr = alloca i16, align 2
  %right.addr = alloca i32, align 4
  store i16 %left, i16* %left.addr, align 2
  store i32 %right, i32* %right.addr, align 4
  %0 = load i32* %right.addr, align 4
  %cmp = icmp uge i32 %0, 32
  br i1 %cmp, label %cond.true, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i16* %left.addr, align 2
  %conv = zext i16 %1 to i32
  %2 = load i32* %right.addr, align 4
  %shr = ashr i32 65535, %2
  %cmp1 = icmp sgt i32 %conv, %shr
  br i1 %cmp1, label %cond.true, label %cond.false

cond.true:                                        ; preds = %lor.lhs.false, %entry
  %3 = load i16* %left.addr, align 2
  %conv3 = zext i16 %3 to i32
  br label %cond.end

cond.false:                                       ; preds = %lor.lhs.false
  %4 = load i16* %left.addr, align 2
  %conv4 = zext i16 %4 to i32
  %5 = load i32* %right.addr, align 4
  %shl = shl i32 %conv4, %5
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv3, %cond.true ], [ %shl, %cond.false ]
  %conv5 = trunc i32 %cond to i16
  ret i16 %conv5
}

define internal signext i16 @safe_sub_func_int16_t_s_s(i16 signext %si1, i16 signext %si2) nounwind uwtable {
entry:
  %si1.addr = alloca i16, align 2
  %si2.addr = alloca i16, align 2
  store i16 %si1, i16* %si1.addr, align 2
  store i16 %si2, i16* %si2.addr, align 2
  %0 = load i16* %si1.addr, align 2
  %conv = sext i16 %0 to i32
  %1 = load i16* %si2.addr, align 2
  %conv1 = sext i16 %1 to i32
  %sub = sub nsw i32 %conv, %conv1
  %conv2 = trunc i32 %sub to i16
  ret i16 %conv2
}

define internal zeroext i8 @safe_add_func_uint8_t_u_u(i8 zeroext %ui1, i8 zeroext %ui2) nounwind uwtable {
entry:
  %ui1.addr = alloca i8, align 1
  %ui2.addr = alloca i8, align 1
  store i8 %ui1, i8* %ui1.addr, align 1
  store i8 %ui2, i8* %ui2.addr, align 1
  %0 = load i8* %ui1.addr, align 1
  %conv = zext i8 %0 to i32
  %1 = load i8* %ui2.addr, align 1
  %conv1 = zext i8 %1 to i32
  %add = add nsw i32 %conv, %conv1
  %conv2 = trunc i32 %add to i8
  ret i8 %conv2
}

define internal i64 @safe_sub_func_int64_t_s_s(i64 %si1, i64 %si2) nounwind uwtable {
entry:
  %si1.addr = alloca i64, align 8
  %si2.addr = alloca i64, align 8
  store i64 %si1, i64* %si1.addr, align 8
  store i64 %si2, i64* %si2.addr, align 8
  %0 = load i64* %si1.addr, align 8
  %1 = load i64* %si2.addr, align 8
  %xor = xor i64 %0, %1
  %2 = load i64* %si1.addr, align 8
  %3 = load i64* %si1.addr, align 8
  %4 = load i64* %si2.addr, align 8
  %xor1 = xor i64 %3, %4
  %and = and i64 %xor1, -9223372036854775808
  %xor2 = xor i64 %2, %and
  %5 = load i64* %si2.addr, align 8
  %sub = sub nsw i64 %xor2, %5
  %6 = load i64* %si2.addr, align 8
  %xor3 = xor i64 %sub, %6
  %and4 = and i64 %xor, %xor3
  %cmp = icmp slt i64 %and4, 0
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %7 = load i64* %si1.addr, align 8
  br label %cond.end

cond.false:                                       ; preds = %entry
  %8 = load i64* %si1.addr, align 8
  %9 = load i64* %si2.addr, align 8
  %sub5 = sub nsw i64 %8, %9
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i64 [ %7, %cond.true ], [ %sub5, %cond.false ]
  ret i64 %cond
}

define internal zeroext i8 @safe_unary_minus_func_uint8_t_u(i8 zeroext %ui) nounwind uwtable {
entry:
  %ui.addr = alloca i8, align 1
  store i8 %ui, i8* %ui.addr, align 1
  %0 = load i8* %ui.addr, align 1
  %conv = zext i8 %0 to i32
  %sub = sub nsw i32 0, %conv
  %conv1 = trunc i32 %sub to i8
  ret i8 %conv1
}

define internal zeroext i8 @safe_mul_func_uint8_t_u_u(i8 zeroext %ui1, i8 zeroext %ui2) nounwind uwtable {
entry:
  %ui1.addr = alloca i8, align 1
  %ui2.addr = alloca i8, align 1
  store i8 %ui1, i8* %ui1.addr, align 1
  store i8 %ui2, i8* %ui2.addr, align 1
  %0 = load i8* %ui1.addr, align 1
  %conv = zext i8 %0 to i32
  %1 = load i8* %ui2.addr, align 1
  %conv1 = zext i8 %1 to i32
  %mul = mul i32 %conv, %conv1
  %conv2 = trunc i32 %mul to i8
  ret i8 %conv2
}

define internal i64 @safe_sub_func_uint64_t_u_u(i64 %ui1, i64 %ui2) nounwind uwtable {
entry:
  %ui1.addr = alloca i64, align 8
  %ui2.addr = alloca i64, align 8
  store i64 %ui1, i64* %ui1.addr, align 8
  store i64 %ui2, i64* %ui2.addr, align 8
  %0 = load i64* %ui1.addr, align 8
  %1 = load i64* %ui2.addr, align 8
  %sub = sub i64 %0, %1
  ret i64 %sub
}

define internal i32 @safe_div_func_int32_t_s_s(i32 %si1, i32 %si2) nounwind uwtable {
entry:
  %si1.addr = alloca i32, align 4
  %si2.addr = alloca i32, align 4
  store i32 %si1, i32* %si1.addr, align 4
  store i32 %si2, i32* %si2.addr, align 4
  %0 = load i32* %si2.addr, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %cond.true, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i32* %si1.addr, align 4
  %cmp1 = icmp eq i32 %1, -2147483648
  br i1 %cmp1, label %land.lhs.true, label %cond.false

land.lhs.true:                                    ; preds = %lor.lhs.false
  %2 = load i32* %si2.addr, align 4
  %cmp2 = icmp eq i32 %2, -1
  br i1 %cmp2, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true, %entry
  %3 = load i32* %si1.addr, align 4
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true, %lor.lhs.false
  %4 = load i32* %si1.addr, align 4
  %5 = load i32* %si2.addr, align 4
  %div = sdiv i32 %4, %5
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %3, %cond.true ], [ %div, %cond.false ]
  ret i32 %cond
}

define internal signext i16 @safe_div_func_int16_t_s_s(i16 signext %si1, i16 signext %si2) nounwind uwtable {
entry:
  %si1.addr = alloca i16, align 2
  %si2.addr = alloca i16, align 2
  store i16 %si1, i16* %si1.addr, align 2
  store i16 %si2, i16* %si2.addr, align 2
  %0 = load i16* %si2.addr, align 2
  %conv = sext i16 %0 to i32
  %cmp = icmp eq i32 %conv, 0
  br i1 %cmp, label %cond.true, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i16* %si1.addr, align 2
  %conv2 = sext i16 %1 to i32
  %cmp3 = icmp eq i32 %conv2, -32768
  br i1 %cmp3, label %land.lhs.true, label %cond.false

land.lhs.true:                                    ; preds = %lor.lhs.false
  %2 = load i16* %si2.addr, align 2
  %conv5 = sext i16 %2 to i32
  %cmp6 = icmp eq i32 %conv5, -1
  br i1 %cmp6, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true, %entry
  %3 = load i16* %si1.addr, align 2
  %conv8 = sext i16 %3 to i32
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true, %lor.lhs.false
  %4 = load i16* %si1.addr, align 2
  %conv9 = sext i16 %4 to i32
  %5 = load i16* %si2.addr, align 2
  %conv10 = sext i16 %5 to i32
  %div = sdiv i32 %conv9, %conv10
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv8, %cond.true ], [ %div, %cond.false ]
  %conv11 = trunc i32 %cond to i16
  ret i16 %conv11
}

define internal zeroext i16 @safe_rshift_func_uint16_t_u_s(i16 zeroext %left, i32 %right) nounwind uwtable {
entry:
  %left.addr = alloca i16, align 2
  %right.addr = alloca i32, align 4
  store i16 %left, i16* %left.addr, align 2
  store i32 %right, i32* %right.addr, align 4
  %0 = load i32* %right.addr, align 4
  %cmp = icmp slt i32 %0, 0
  br i1 %cmp, label %cond.true, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i32* %right.addr, align 4
  %cmp1 = icmp sge i32 %1, 32
  br i1 %cmp1, label %cond.true, label %cond.false

cond.true:                                        ; preds = %lor.lhs.false, %entry
  %2 = load i16* %left.addr, align 2
  %conv = zext i16 %2 to i32
  br label %cond.end

cond.false:                                       ; preds = %lor.lhs.false
  %3 = load i16* %left.addr, align 2
  %conv2 = zext i16 %3 to i32
  %4 = load i32* %right.addr, align 4
  %shr = ashr i32 %conv2, %4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv, %cond.true ], [ %shr, %cond.false ]
  %conv3 = trunc i32 %cond to i16
  ret i16 %conv3
}

define internal signext i8 @safe_rshift_func_int8_t_s_s(i8 signext %left, i32 %right) nounwind uwtable {
entry:
  %left.addr = alloca i8, align 1
  %right.addr = alloca i32, align 4
  store i8 %left, i8* %left.addr, align 1
  store i32 %right, i32* %right.addr, align 4
  %0 = load i8* %left.addr, align 1
  %conv = sext i8 %0 to i32
  %cmp = icmp slt i32 %conv, 0
  br i1 %cmp, label %cond.true, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i32* %right.addr, align 4
  %cmp2 = icmp slt i32 %1, 0
  br i1 %cmp2, label %cond.true, label %lor.lhs.false4

lor.lhs.false4:                                   ; preds = %lor.lhs.false
  %2 = load i32* %right.addr, align 4
  %cmp5 = icmp sge i32 %2, 32
  br i1 %cmp5, label %cond.true, label %cond.false

cond.true:                                        ; preds = %lor.lhs.false4, %lor.lhs.false, %entry
  %3 = load i8* %left.addr, align 1
  %conv7 = sext i8 %3 to i32
  br label %cond.end

cond.false:                                       ; preds = %lor.lhs.false4
  %4 = load i8* %left.addr, align 1
  %conv8 = sext i8 %4 to i32
  %5 = load i32* %right.addr, align 4
  %shr = ashr i32 %conv8, %5
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv7, %cond.true ], [ %shr, %cond.false ]
  %conv9 = trunc i32 %cond to i8
  ret i8 %conv9
}

define internal signext i8 @safe_add_func_int8_t_s_s(i8 signext %si1, i8 signext %si2) nounwind uwtable {
entry:
  %si1.addr = alloca i8, align 1
  %si2.addr = alloca i8, align 1
  store i8 %si1, i8* %si1.addr, align 1
  store i8 %si2, i8* %si2.addr, align 1
  %0 = load i8* %si1.addr, align 1
  %conv = sext i8 %0 to i32
  %1 = load i8* %si2.addr, align 1
  %conv1 = sext i8 %1 to i32
  %add = add nsw i32 %conv, %conv1
  %conv2 = trunc i32 %add to i8
  ret i8 %conv2
}

define internal signext i8 @safe_lshift_func_int8_t_s_s(i8 signext %left, i32 %right) nounwind uwtable {
entry:
  %left.addr = alloca i8, align 1
  %right.addr = alloca i32, align 4
  store i8 %left, i8* %left.addr, align 1
  store i32 %right, i32* %right.addr, align 4
  %0 = load i8* %left.addr, align 1
  %conv = sext i8 %0 to i32
  %cmp = icmp slt i32 %conv, 0
  br i1 %cmp, label %cond.true, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i32* %right.addr, align 4
  %cmp2 = icmp slt i32 %1, 0
  br i1 %cmp2, label %cond.true, label %lor.lhs.false4

lor.lhs.false4:                                   ; preds = %lor.lhs.false
  %2 = load i32* %right.addr, align 4
  %cmp5 = icmp sge i32 %2, 32
  br i1 %cmp5, label %cond.true, label %lor.lhs.false7

lor.lhs.false7:                                   ; preds = %lor.lhs.false4
  %3 = load i8* %left.addr, align 1
  %conv8 = sext i8 %3 to i32
  %4 = load i32* %right.addr, align 4
  %shr = ashr i32 127, %4
  %cmp9 = icmp sgt i32 %conv8, %shr
  br i1 %cmp9, label %cond.true, label %cond.false

cond.true:                                        ; preds = %lor.lhs.false7, %lor.lhs.false4, %lor.lhs.false, %entry
  %5 = load i8* %left.addr, align 1
  %conv11 = sext i8 %5 to i32
  br label %cond.end

cond.false:                                       ; preds = %lor.lhs.false7
  %6 = load i8* %left.addr, align 1
  %conv12 = sext i8 %6 to i32
  %7 = load i32* %right.addr, align 4
  %shl = shl i32 %conv12, %7
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv11, %cond.true ], [ %shl, %cond.false ]
  %conv13 = trunc i32 %cond to i8
  ret i8 %conv13
}

define internal signext i8 @safe_div_func_int8_t_s_s(i8 signext %si1, i8 signext %si2) nounwind uwtable {
entry:
  %si1.addr = alloca i8, align 1
  %si2.addr = alloca i8, align 1
  store i8 %si1, i8* %si1.addr, align 1
  store i8 %si2, i8* %si2.addr, align 1
  %0 = load i8* %si2.addr, align 1
  %conv = sext i8 %0 to i32
  %cmp = icmp eq i32 %conv, 0
  br i1 %cmp, label %cond.true, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i8* %si1.addr, align 1
  %conv2 = sext i8 %1 to i32
  %cmp3 = icmp eq i32 %conv2, -128
  br i1 %cmp3, label %land.lhs.true, label %cond.false

land.lhs.true:                                    ; preds = %lor.lhs.false
  %2 = load i8* %si2.addr, align 1
  %conv5 = sext i8 %2 to i32
  %cmp6 = icmp eq i32 %conv5, -1
  br i1 %cmp6, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true, %entry
  %3 = load i8* %si1.addr, align 1
  %conv8 = sext i8 %3 to i32
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true, %lor.lhs.false
  %4 = load i8* %si1.addr, align 1
  %conv9 = sext i8 %4 to i32
  %5 = load i8* %si2.addr, align 1
  %conv10 = sext i8 %5 to i32
  %div = sdiv i32 %conv9, %conv10
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv8, %cond.true ], [ %div, %cond.false ]
  %conv11 = trunc i32 %cond to i8
  ret i8 %conv11
}

define internal i64 @safe_add_func_int64_t_s_s(i64 %si1, i64 %si2) nounwind uwtable {
entry:
  %si1.addr = alloca i64, align 8
  %si2.addr = alloca i64, align 8
  store i64 %si1, i64* %si1.addr, align 8
  store i64 %si2, i64* %si2.addr, align 8
  %0 = load i64* %si1.addr, align 8
  %cmp = icmp sgt i64 %0, 0
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false

land.lhs.true:                                    ; preds = %entry
  %1 = load i64* %si2.addr, align 8
  %cmp1 = icmp sgt i64 %1, 0
  br i1 %cmp1, label %land.lhs.true2, label %lor.lhs.false

land.lhs.true2:                                   ; preds = %land.lhs.true
  %2 = load i64* %si1.addr, align 8
  %3 = load i64* %si2.addr, align 8
  %sub = sub nsw i64 9223372036854775807, %3
  %cmp3 = icmp sgt i64 %2, %sub
  br i1 %cmp3, label %cond.true, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true2, %land.lhs.true, %entry
  %4 = load i64* %si1.addr, align 8
  %cmp4 = icmp slt i64 %4, 0
  br i1 %cmp4, label %land.lhs.true5, label %cond.false

land.lhs.true5:                                   ; preds = %lor.lhs.false
  %5 = load i64* %si2.addr, align 8
  %cmp6 = icmp slt i64 %5, 0
  br i1 %cmp6, label %land.lhs.true7, label %cond.false

land.lhs.true7:                                   ; preds = %land.lhs.true5
  %6 = load i64* %si1.addr, align 8
  %7 = load i64* %si2.addr, align 8
  %sub8 = sub nsw i64 -9223372036854775808, %7
  %cmp9 = icmp slt i64 %6, %sub8
  br i1 %cmp9, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true7, %land.lhs.true2
  %8 = load i64* %si1.addr, align 8
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true7, %land.lhs.true5, %lor.lhs.false
  %9 = load i64* %si1.addr, align 8
  %10 = load i64* %si2.addr, align 8
  %add = add nsw i64 %9, %10
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i64 [ %8, %cond.true ], [ %add, %cond.false ]
  ret i64 %cond
}

define internal i32 @safe_unary_minus_func_int32_t_s(i32 %si) nounwind uwtable {
entry:
  %si.addr = alloca i32, align 4
  store i32 %si, i32* %si.addr, align 4
  %0 = load i32* %si.addr, align 4
  %cmp = icmp eq i32 %0, -2147483648
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %1 = load i32* %si.addr, align 4
  br label %cond.end

cond.false:                                       ; preds = %entry
  %2 = load i32* %si.addr, align 4
  %sub = sub nsw i32 0, %2
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %1, %cond.true ], [ %sub, %cond.false ]
  ret i32 %cond
}

define internal zeroext i16 @safe_rshift_func_uint16_t_u_u(i16 zeroext %left, i32 %right) nounwind uwtable {
entry:
  %left.addr = alloca i16, align 2
  %right.addr = alloca i32, align 4
  store i16 %left, i16* %left.addr, align 2
  store i32 %right, i32* %right.addr, align 4
  %0 = load i32* %right.addr, align 4
  %cmp = icmp uge i32 %0, 32
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %1 = load i16* %left.addr, align 2
  %conv = zext i16 %1 to i32
  br label %cond.end

cond.false:                                       ; preds = %entry
  %2 = load i16* %left.addr, align 2
  %conv1 = zext i16 %2 to i32
  %3 = load i32* %right.addr, align 4
  %shr = ashr i32 %conv1, %3
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv, %cond.true ], [ %shr, %cond.false ]
  %conv2 = trunc i32 %cond to i16
  ret i16 %conv2
}

define internal i64 @safe_mod_func_uint64_t_u_u(i64 %ui1, i64 %ui2) nounwind uwtable {
entry:
  %ui1.addr = alloca i64, align 8
  %ui2.addr = alloca i64, align 8
  store i64 %ui1, i64* %ui1.addr, align 8
  store i64 %ui2, i64* %ui2.addr, align 8
  %0 = load i64* %ui2.addr, align 8
  %cmp = icmp eq i64 %0, 0
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %1 = load i64* %ui1.addr, align 8
  br label %cond.end

cond.false:                                       ; preds = %entry
  %2 = load i64* %ui1.addr, align 8
  %3 = load i64* %ui2.addr, align 8
  %rem = urem i64 %2, %3
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i64 [ %1, %cond.true ], [ %rem, %cond.false ]
  ret i64 %cond
}

define internal i32 @safe_add_func_uint32_t_u_u(i32 %ui1, i32 %ui2) nounwind uwtable {
entry:
  %ui1.addr = alloca i32, align 4
  %ui2.addr = alloca i32, align 4
  store i32 %ui1, i32* %ui1.addr, align 4
  store i32 %ui2, i32* %ui2.addr, align 4
  %0 = load i32* %ui1.addr, align 4
  %1 = load i32* %ui2.addr, align 4
  %add = add i32 %0, %1
  ret i32 %add
}

define internal zeroext i8 @safe_sub_func_uint8_t_u_u(i8 zeroext %ui1, i8 zeroext %ui2) nounwind uwtable {
entry:
  %ui1.addr = alloca i8, align 1
  %ui2.addr = alloca i8, align 1
  store i8 %ui1, i8* %ui1.addr, align 1
  store i8 %ui2, i8* %ui2.addr, align 1
  %0 = load i8* %ui1.addr, align 1
  %conv = zext i8 %0 to i32
  %1 = load i8* %ui2.addr, align 1
  %conv1 = zext i8 %1 to i32
  %sub = sub nsw i32 %conv, %conv1
  %conv2 = trunc i32 %sub to i8
  ret i8 %conv2
}

define internal zeroext i16 @safe_mod_func_uint16_t_u_u(i16 zeroext %ui1, i16 zeroext %ui2) nounwind uwtable {
entry:
  %ui1.addr = alloca i16, align 2
  %ui2.addr = alloca i16, align 2
  store i16 %ui1, i16* %ui1.addr, align 2
  store i16 %ui2, i16* %ui2.addr, align 2
  %0 = load i16* %ui2.addr, align 2
  %conv = zext i16 %0 to i32
  %cmp = icmp eq i32 %conv, 0
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %1 = load i16* %ui1.addr, align 2
  %conv2 = zext i16 %1 to i32
  br label %cond.end

cond.false:                                       ; preds = %entry
  %2 = load i16* %ui1.addr, align 2
  %conv3 = zext i16 %2 to i32
  %3 = load i16* %ui2.addr, align 2
  %conv4 = zext i16 %3 to i32
  %rem = srem i32 %conv3, %conv4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv2, %cond.true ], [ %rem, %cond.false ]
  %conv5 = trunc i32 %cond to i16
  ret i16 %conv5
}

define internal i64 @safe_mod_func_int64_t_s_s(i64 %si1, i64 %si2) nounwind uwtable {
entry:
  %si1.addr = alloca i64, align 8
  %si2.addr = alloca i64, align 8
  store i64 %si1, i64* %si1.addr, align 8
  store i64 %si2, i64* %si2.addr, align 8
  %0 = load i64* %si2.addr, align 8
  %cmp = icmp eq i64 %0, 0
  br i1 %cmp, label %cond.true, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i64* %si1.addr, align 8
  %cmp1 = icmp eq i64 %1, -9223372036854775808
  br i1 %cmp1, label %land.lhs.true, label %cond.false

land.lhs.true:                                    ; preds = %lor.lhs.false
  %2 = load i64* %si2.addr, align 8
  %cmp2 = icmp eq i64 %2, -1
  br i1 %cmp2, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true, %entry
  %3 = load i64* %si1.addr, align 8
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true, %lor.lhs.false
  %4 = load i64* %si1.addr, align 8
  %5 = load i64* %si2.addr, align 8
  %rem = srem i64 %4, %5
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i64 [ %3, %cond.true ], [ %rem, %cond.false ]
  ret i64 %cond
}

define internal zeroext i8 @safe_div_func_uint8_t_u_u(i8 zeroext %ui1, i8 zeroext %ui2) nounwind uwtable {
entry:
  %ui1.addr = alloca i8, align 1
  %ui2.addr = alloca i8, align 1
  store i8 %ui1, i8* %ui1.addr, align 1
  store i8 %ui2, i8* %ui2.addr, align 1
  %0 = load i8* %ui2.addr, align 1
  %conv = zext i8 %0 to i32
  %cmp = icmp eq i32 %conv, 0
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %1 = load i8* %ui1.addr, align 1
  %conv2 = zext i8 %1 to i32
  br label %cond.end

cond.false:                                       ; preds = %entry
  %2 = load i8* %ui1.addr, align 1
  %conv3 = zext i8 %2 to i32
  %3 = load i8* %ui2.addr, align 1
  %conv4 = zext i8 %3 to i32
  %div = sdiv i32 %conv3, %conv4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv2, %cond.true ], [ %div, %cond.false ]
  %conv5 = trunc i32 %cond to i8
  ret i8 %conv5
}

define internal signext i8 @safe_lshift_func_int8_t_s_u(i8 signext %left, i32 %right) nounwind uwtable {
entry:
  %left.addr = alloca i8, align 1
  %right.addr = alloca i32, align 4
  store i8 %left, i8* %left.addr, align 1
  store i32 %right, i32* %right.addr, align 4
  %0 = load i8* %left.addr, align 1
  %conv = sext i8 %0 to i32
  %cmp = icmp slt i32 %conv, 0
  br i1 %cmp, label %cond.true, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i32* %right.addr, align 4
  %cmp2 = icmp uge i32 %1, 32
  br i1 %cmp2, label %cond.true, label %lor.lhs.false4

lor.lhs.false4:                                   ; preds = %lor.lhs.false
  %2 = load i8* %left.addr, align 1
  %conv5 = sext i8 %2 to i32
  %3 = load i32* %right.addr, align 4
  %shr = ashr i32 127, %3
  %cmp6 = icmp sgt i32 %conv5, %shr
  br i1 %cmp6, label %cond.true, label %cond.false

cond.true:                                        ; preds = %lor.lhs.false4, %lor.lhs.false, %entry
  %4 = load i8* %left.addr, align 1
  %conv8 = sext i8 %4 to i32
  br label %cond.end

cond.false:                                       ; preds = %lor.lhs.false4
  %5 = load i8* %left.addr, align 1
  %conv9 = sext i8 %5 to i32
  %6 = load i32* %right.addr, align 4
  %shl = shl i32 %conv9, %6
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv8, %cond.true ], [ %shl, %cond.false ]
  %conv10 = trunc i32 %cond to i8
  ret i8 %conv10
}

define internal zeroext i8 @safe_rshift_func_uint8_t_u_s(i8 zeroext %left, i32 %right) nounwind uwtable {
entry:
  %left.addr = alloca i8, align 1
  %right.addr = alloca i32, align 4
  store i8 %left, i8* %left.addr, align 1
  store i32 %right, i32* %right.addr, align 4
  %0 = load i32* %right.addr, align 4
  %cmp = icmp slt i32 %0, 0
  br i1 %cmp, label %cond.true, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i32* %right.addr, align 4
  %cmp1 = icmp sge i32 %1, 32
  br i1 %cmp1, label %cond.true, label %cond.false

cond.true:                                        ; preds = %lor.lhs.false, %entry
  %2 = load i8* %left.addr, align 1
  %conv = zext i8 %2 to i32
  br label %cond.end

cond.false:                                       ; preds = %lor.lhs.false
  %3 = load i8* %left.addr, align 1
  %conv2 = zext i8 %3 to i32
  %4 = load i32* %right.addr, align 4
  %shr = ashr i32 %conv2, %4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv, %cond.true ], [ %shr, %cond.false ]
  %conv3 = trunc i32 %cond to i8
  ret i8 %conv3
}

define internal i64 @safe_unary_minus_func_uint64_t_u(i64 %ui) nounwind uwtable {
entry:
  %ui.addr = alloca i64, align 8
  store i64 %ui, i64* %ui.addr, align 8
  %0 = load i64* %ui.addr, align 8
  %sub = sub i64 0, %0
  ret i64 %sub
}

define internal i32 @safe_div_func_uint32_t_u_u(i32 %ui1, i32 %ui2) nounwind uwtable {
entry:
  %ui1.addr = alloca i32, align 4
  %ui2.addr = alloca i32, align 4
  store i32 %ui1, i32* %ui1.addr, align 4
  store i32 %ui2, i32* %ui2.addr, align 4
  %0 = load i32* %ui2.addr, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %1 = load i32* %ui1.addr, align 4
  br label %cond.end

cond.false:                                       ; preds = %entry
  %2 = load i32* %ui1.addr, align 4
  %3 = load i32* %ui2.addr, align 4
  %div = udiv i32 %2, %3
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %1, %cond.true ], [ %div, %cond.false ]
  ret i32 %cond
}
