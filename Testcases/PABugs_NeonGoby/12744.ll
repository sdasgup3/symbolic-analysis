; ModuleID = 'gpasswd.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

;Reason:
;commonio_close: %12 = load i32 ()** %11, align 8, !dbg !2325 and function group_close_hook should alias
; revision 160292 from ds-aa’s SVN repo
;http://llvm.org/bugs/show_bug.cgi?id=12744

%struct.FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct.FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct.FILE*, i32 }
%struct.termios = type { i32, i32, i32, i32, i8, [32 x i8], i32, i32 }
%struct.option = type { i8*, i32, i32*, i32 }
%struct.itemdef = type { i8*, i8* }
%struct.commonio_ops = type { i8* (i8*)*, void (i8*)*, i8* (i8*)*, i8* (i8*)*, i32 (i8*, %struct.FILE*)*, i8* (i8*, i32, %struct.FILE*)*, i32 (i8*, %struct.FILE*)*, i32 ()*, i32 ()* }
%struct.commonio_db = type { [1024 x i8], %struct.commonio_ops*, %struct.FILE*, %struct.commonio_entry*, %struct.commonio_entry*, %struct.commonio_entry*, i8 }
%struct.commonio_entry = type { i8*, i8*, %struct.commonio_entry*, %struct.commonio_entry*, i8 }
%struct.sgrp = type { i8*, i8*, i8**, i8** }
%struct.group = type { i8*, i8*, i32, i8** }
%struct._getopt_data = type { i32, i32, i32, i8*, i32, i8*, i32, i32, i32, i32 }
%struct.passwd = type { i8*, i8*, i32, i32, i8*, i8*, i8* }
%struct.rlimit = type { i64, i64 }
%struct.__mbstate_t = type { i32, i32 }
%struct.stat = type { i64, i64, i64, i32, i32, i32, i32, i64, i64, i64, i64, %struct.rlimit, %struct.rlimit, %struct.rlimit, [3 x i64] }

@aflg.b = internal global i1 false
@Aflg.b = internal global i1 false
@dflg.b = internal global i1 false
@Mflg.b = internal global i1 false
@rflg.b = internal global i1 false
@Rflg.b = internal global i1 false
@group = internal global i8* null
@user = internal global i8* null
@members = internal global i8* null
@admins = internal global i8* null
@myname = internal global i8* null
@stderr = external global %struct.FILE*
@stdout = external global %struct.FILE*
@Prog = internal global i8* null
@.str = private constant [36 x i8] c"Usage: %s [option] GROUP\0A\0AOptions:\0A\00", align 8
@.str1 = private constant [51 x i8] c"  -a, --add USER                add USER to GROUP\0A\00", align 8
@.str2 = private constant [56 x i8] c"  -d, --delete USER             remove USER from GROUP\0A\00", align 8
@.str3 = private constant [68 x i8] c"  -h, --help                    display this help message and exit\0A\00", align 8
@.str4 = private constant [58 x i8] c"  -Q, --root CHROOT_DIR         directory to chroot into\0A\00", align 8
@.str5 = private constant [61 x i8] c"  -r, --remove-password         remove the GROUP's password\0A\00", align 8
@.str6 = private constant [73 x i8] c"  -R, --restrict                restrict access to GROUP to its members\0A\00", align 8
@.str7 = private constant [66 x i8] c"  -M, --members USER,...        set the list of members of GROUP\0A\00", align 8
@.str8 = private constant [107 x i8] c"  -A, --administrators ADMIN,...\0A                                set the list of administrators for GROUP\0A\00", align 8
@.str9 = private constant [67 x i8] c"Except for the -A and -M options, the options cannot be combined.\0A\00", align 8
@sgtty.5395 = internal global %struct.termios zeroinitializer
@.str10 = private constant [30 x i8] c"%s: user '%s' does not exist\0A\00", align 1
@.str11 = private constant [24 x i8] c"%s: Permission denied.\0A\00", align 1
@.str12 = private constant [20 x i8] c": Permission denied\00", align 1
@.str13 = private constant [44 x i8] c"%s: shadow group passwords required for -A\0A\00", align 8
@.str14 = private constant [15 x i8] c"a:A:d:ghM:Q:rR\00", align 1
@long_options.5435 = internal global [9 x %struct.option] [%struct.option { i8* getelementptr inbounds ([4 x i8]* @.str15, i64 0, i64 0), i32 1, i32* null, i32 97 }, %struct.option { i8* getelementptr inbounds ([15 x i8]* @.str16, i64 0, i64 0), i32 1, i32* null, i32 65 }, %struct.option { i8* getelementptr inbounds ([7 x i8]* @.str17, i64 0, i64 0), i32 1, i32* null, i32 100 }, %struct.option { i8* getelementptr inbounds ([5 x i8]* @.str18, i64 0, i64 0), i32 0, i32* null, i32 104 }, %struct.option { i8* getelementptr inbounds ([8 x i8]* @.str19, i64 0, i64 0), i32 1, i32* null, i32 77 }, %struct.option { i8* getelementptr inbounds ([5 x i8]* @.str20, i64 0, i64 0), i32 1, i32* null, i32 81 }, %struct.option { i8* getelementptr inbounds ([16 x i8]* @.str21, i64 0, i64 0), i32 0, i32* null, i32 114 }, %struct.option { i8* getelementptr inbounds ([9 x i8]* @.str22, i64 0, i64 0), i32 0, i32* null, i32 82 }, %struct.option zeroinitializer]
@.str15 = private constant [4 x i8] c"add\00", align 1
@.str16 = private constant [15 x i8] c"administrators\00", align 1
@.str17 = private constant [7 x i8] c"delete\00", align 1
@.str18 = private constant [5 x i8] c"help\00", align 1
@.str19 = private constant [8 x i8] c"members\00", align 1
@.str20 = private constant [5 x i8] c"root\00", align 1
@.str21 = private constant [16 x i8] c"remove-password\00", align 1
@.str22 = private constant [9 x i8] c"restrict\00", align 1
@.str23 = private constant [38 x i8] c"%s: cannot lock %s; try again later.\0A\00", align 8
@.str24 = private constant [20 x i8] c"%s: cannot open %s\0A\00", align 1
@.str25 = private constant [2 x i8] c"C\00", align 1
@.str26 = private constant [15 x i8] c"cannot open %s\00", align 1
@.str27 = private constant [39 x i8] c"%s failed to add user %s to group %s%s\00", align 8
@.str28 = private constant [44 x i8] c"%s failed to remove user %s from group %s%s\00", align 8
@.str29 = private constant [43 x i8] c"%s failed to remove password of group %s%s\00", align 8
@.str30 = private constant [43 x i8] c"%s failed to restrict access to group %s%s\00", align 8
@.str31 = private constant [56 x i8] c"%s failed to set the administrators of group %s to %s%s\00", align 8
@.str32 = private constant [49 x i8] c"%s failed to set the members of group %s to %s%s\00", align 8
@.str33 = private constant [43 x i8] c"%s failed to change password of group %s%s\00", align 8
@.str34 = private constant [1 x i8] zeroinitializer, align 1
@.str35 = private constant [7 x i8] c" in %s\00", align 1
@.str36 = private constant [34 x i8] c"user %s added by %s to group %s%s\00", align 8
@.str37 = private constant [38 x i8] c"user %s removed by %s from group %s%s\00", align 8
@.str38 = private constant [37 x i8] c"password of group %s removed by %s%s\00", align 8
@.str39 = private constant [38 x i8] c"access to group %s restricted by %s%s\00", align 8
@.str40 = private constant [45 x i8] c"administrators of group %s set by %s to %s%s\00", align 8
@.str41 = private constant [38 x i8] c"members of group %s set by %s to %s%s\00", align 8
@.str42 = private constant [37 x i8] c"password of group %s changed by %s%s\00", align 8
@.str43 = private constant [41 x i8] c"%s: failure while writing changes to %s\0A\00", align 8
@.str44 = private constant [45 x i8] c"%s: failed to prepare the new %s entry '%s'\0A\00", align 8
@.str45 = private constant [37 x i8] c"%s: group '%s' does not exist in %s\0A\00", align 8
@.str46 = private constant [40 x i8] c"%s: failure while closing read-only %s\0A\00", align 8
@.str47 = private constant [35 x i8] c"failure while closing read-only %s\00", align 8
@.str48 = private constant [2 x i8] c"x\00", align 1
@.str49 = private constant [36 x i8] c"Changing the password for group %s\0A\00", align 8
@.str50 = private constant [15 x i8] c"New Password: \00", align 1
@pass.6010 = internal global [8192 x i8] zeroinitializer
@.str51 = private constant [24 x i8] c"Re-enter new password: \00", align 1
@.str52 = private constant [28 x i8] c"They don't match; try again\00", align 1
@.str53 = private constant [21 x i8] c"%s: Try again later\0A\00", align 1
@.str54 = private constant [7 x i8] c"shadow\00", align 1
@.str55 = private constant [78 x i8] c"/home/heming/rcs/direct-sym/apps/shadow/shadow-4.1.5/obj/install/share/locale\00", align 8
@.str56 = private constant [8 x i8] c"gpasswd\00", align 1
@.str57 = private constant [3 x i8] c"-Q\00", align 1
@.str58 = private constant [38 x i8] c"%s: Cannot determine your user name.\0A\00", align 8
@.str59 = private constant [55 x i8] c"Cannot determine the user name of the caller (UID %lu)\00", align 8
@.str60 = private constant [30 x i8] c"%s: cannot set exit function\0A\00", align 1
@.str61 = private constant [2 x i8] c"!\00", align 1
@.str62 = private constant [28 x i8] c"Adding user %s to group %s\0A\00", align 1
@.str63 = private constant [32 x i8] c"Removing user %s from group %s\0A\00", align 8
@.str64 = private constant [39 x i8] c"%s: user '%s' is not a member of '%s'\0A\00", align 8
@.str65 = private constant [15 x i8] c"%s: Not a tty\0A\00", align 1
@.str66 = private constant [27 x i8] c"Cannot change ID to root.\0A\00", align 1
@.str67 = private constant [16 x i8] c"can't setuid(0)\00", align 1
@.str68 = private constant [6 x i8] c"group\00", align 1
@cleanup_pid = internal global i32 0
@cleanup_functions = internal global [10 x void (i8*)*] zeroinitializer, align 32
@.str69 = private constant [39 x i8] c"((void *)0) == cleanup_functions[10-1]\00", align 8
@.str170 = private constant [24 x i8] c"../../libmisc/cleanup.c\00", align 1
@__PRETTY_FUNCTION__.5178 = internal constant [12 x i8] c"do_cleanups\00"
@cleanup_function_args = internal global [10 x i8*] zeroinitializer, align 32
@.str271 = private constant [19 x i8] c"((void *)0) != pcf\00", align 1
@__PRETTY_FUNCTION__.5201 = internal constant [12 x i8] c"add_cleanup\00"
@.str372 = private constant [39 x i8] c"((void *)0) == cleanup_functions[10-2]\00", align 8
@__PRETTY_FUNCTION__.5222 = internal constant [12 x i8] c"del_cleanup\00"
@.str473 = private constant [5 x i8] c"i<10\00", align 1
@.str574 = private constant [50 x i8] c"(i == (10 -1)) || (cleanup_functions[i+1] != pcf)\00", align 8
@.str79 = private constant [22 x i8] c"((void *)0) != member\00", align 1
@.str180 = private constant [21 x i8] c"../../libmisc/list.c\00", align 1
@__PRETTY_FUNCTION__.5176 = internal constant [9 x i8] c"add_list\00"
@.str281 = private constant [20 x i8] c"((void *)0) != list\00", align 1
@__PRETTY_FUNCTION__.5210 = internal constant [9 x i8] c"del_list\00"
@__PRETTY_FUNCTION__.5246 = internal constant [9 x i8] c"dup_list\00"
@__PRETTY_FUNCTION__.5270 = internal constant [11 x i8] c"is_on_list\00"
@.str382 = private constant [21 x i8] c"((void *)0) != comma\00", align 1
@__PRETTY_FUNCTION__.5295 = internal constant [14 x i8] c"comma_to_list\00"
@.str694 = private constant [25 x i8] c"%s: failed to unlock %s\0A\00", align 1
@.str795 = private constant [20 x i8] c"failed to unlock %s\00", align 1
@seeded.5201.b = internal global i1 false
@.str98 = private constant [21 x i8] c"SHA_CRYPT_MIN_ROUNDS\00", align 1
@.str199 = private constant [21 x i8] c"SHA_CRYPT_MAX_ROUNDS\00", align 1
@rounds_prefix.5226 = internal global [18 x i8] zeroinitializer
@.str3101 = private constant [12 x i8] c"rounds=%ld$\00", align 1
@salt.5266 = internal global [32 x i8] zeroinitializer
@.str4102 = private constant [34 x i8] c"salt_size >= 8 && salt_size <= 16\00", align 8
@.str5103 = private constant [21 x i8] c"../../libmisc/salt.c\00", align 1
@__PRETTY_FUNCTION__.5267 = internal constant [8 x i8] c"gensalt\00"
@result.5285 = internal global [40 x i8] zeroinitializer
@.str6104 = private constant [15 x i8] c"ENCRYPT_METHOD\00", align 1
@.str7105 = private constant [15 x i8] c"MD5_CRYPT_ENAB\00", align 1
@.str8106 = private constant [4 x i8] c"MD5\00", align 1
@.str9107 = private constant [4 x i8] c"DES\00", align 1
@.str10108 = private constant [7 x i8] c"SHA256\00", align 1
@.str11109 = private constant [7 x i8] c"SHA512\00", align 1
@.str12110 = private constant [56 x i8] c"Invalid ENCRYPT_METHOD value: '%s'.\0ADefaulting to DES.\0A\00", align 8
@.str13111 = private constant [45 x i8] c"sizeof (result) > strlen (result) + salt_len\00", align 8
@__PRETTY_FUNCTION__.5288 = internal constant [16 x i8] c"crypt_make_salt\00"
@.str114 = private constant [7 x i8] c"--root\00", align 1
@.str1115 = private constant [29 x i8] c"%s: multiple --root options\0A\00", align 1
@.str2116 = private constant [38 x i8] c"%s: option '%s' requires an argument\0A\00", align 8
@.str3117 = private constant [36 x i8] c"%s: failed to drop privileges (%s)\0A\00", align 8
@.str4118 = private constant [30 x i8] c"%s: invalid chroot path '%s'\0A\00", align 1
@.str5119 = private constant [43 x i8] c"%s: cannot access chroot directory %s: %s\0A\00", align 8
@.str6120 = private constant [42 x i8] c"%s: unable to chroot to directory %s: %s\0A\00", align 8
@forbid = internal constant [14 x i8*] [i8* getelementptr inbounds ([7 x i8]* @.str123, i64 0, i64 0), i8* getelementptr inbounds ([10 x i8]* @.str1124, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8]* @.str2125, i64 0, i64 0), i8* getelementptr inbounds ([6 x i8]* @.str3126, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8]* @.str4127, i64 0, i64 0), i8* getelementptr inbounds ([10 x i8]* @.str5128, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8]* @.str6129, i64 0, i64 0), i8* getelementptr inbounds ([9 x i8]* @.str7130, i64 0, i64 0), i8* getelementptr inbounds ([6 x i8]* @.str8131, i64 0, i64 0), i8* getelementptr inbounds ([9 x i8]* @.str9132, i64 0, i64 0), i8* getelementptr inbounds ([6 x i8]* @.str10133, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8]* @.str11134, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8]* @.str12135, i64 0, i64 0), i8* null], align 32
@.str123 = private constant [7 x i8] c"_RLD_=\00", align 1
@.str1124 = private constant [10 x i8] c"BASH_ENV=\00", align 1
@.str2125 = private constant [5 x i8] c"ENV=\00", align 1
@.str3126 = private constant [6 x i8] c"HOME=\00", align 1
@.str4127 = private constant [5 x i8] c"IFS=\00", align 1
@.str5128 = private constant [10 x i8] c"KRB_CONF=\00", align 1
@.str6129 = private constant [4 x i8] c"LD_\00", align 1
@.str7130 = private constant [9 x i8] c"LIBPATH=\00", align 1
@.str8131 = private constant [6 x i8] c"MAIL=\00", align 1
@.str9132 = private constant [9 x i8] c"NLSPATH=\00", align 1
@.str10133 = private constant [6 x i8] c"PATH=\00", align 1
@.str11134 = private constant [7 x i8] c"SHELL=\00", align 1
@.str12135 = private constant [12 x i8] c"SHLIB_PATH=\00", align 1
@noslash = internal constant [4 x i8*] [i8* getelementptr inbounds ([6 x i8]* @.str13136, i64 0, i64 0), i8* getelementptr inbounds ([10 x i8]* @.str14137, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8]* @.str15138, i64 0, i64 0), i8* null], align 32
@.str13136 = private constant [6 x i8] c"LANG=\00", align 1
@.str14137 = private constant [10 x i8] c"LANGUAGE=\00", align 1
@.str15138 = private constant [4 x i8] c"LC_\00", align 1
@environ = external global i8**
@.str147 = private constant [35 x i8] c"%s: failed to allocate memory: %s\0A\00", align 8
@.str150 = private constant [19 x i8] c"%s: out of memory\0A\00", align 1
@.str1151 = private constant [10 x i8] c"xgetpwnam\00", align 1
@.str1154 = private constant [10 x i8] c"xgetpwuid\00", align 1
@def_table = internal global [68 x %struct.itemdef] [%struct.itemdef { i8* getelementptr inbounds ([14 x i8]* @.str157, i64 0, i64 0), i8* null }, %struct.itemdef { i8* getelementptr inbounds ([15 x i8]* @.str1158, i64 0, i64 0), i8* null }, %struct.itemdef { i8* getelementptr inbounds ([8 x i8]* @.str2159, i64 0, i64 0), i8* null }, %struct.itemdef { i8* getelementptr inbounds ([12 x i8]* @.str3160, i64 0, i64 0), i8* null }, %struct.itemdef { i8* getelementptr inbounds ([13 x i8]* @.str4161, i64 0, i64 0), i8* null }, %struct.itemdef { i8* getelementptr inbounds ([15 x i8]* @.str6104, i64 0, i64 0), i8* null }, %struct.itemdef { i8* getelementptr inbounds ([9 x i8]* @.str6163, i64 0, i64 0), i8* null }, %struct.itemdef { i8* getelementptr inbounds ([11 x i8]* @.str7164, i64 0, i64 0), i8* null }, %struct.itemdef { i8* getelementptr inbounds ([10 x i8]* @.str8165, i64 0, i64 0), i8* null }, %struct.itemdef { i8* getelementptr inbounds ([11 x i8]* @.str9166, i64 0, i64 0), i8* null }, %struct.itemdef { i8* getelementptr inbounds ([11 x i8]* @.str10167, i64 0, i64 0), i8* null }, %struct.itemdef { i8* getelementptr inbounds ([8 x i8]* @.str11168, i64 0, i64 0), i8* null }, %struct.itemdef { i8* getelementptr inbounds ([8 x i8]* @.str12169, i64 0, i64 0), i8* null }, %struct.itemdef { i8* getelementptr inbounds ([15 x i8]* @.str13170, i64 0, i64 0), i8* null }, %struct.itemdef { i8* getelementptr inbounds ([9 x i8]* @.str14171, i64 0, i64 0), i8* null }, %struct.itemdef { i8* getelementptr inbounds ([14 x i8]* @.str15172, i64 0, i64 0), i8* null }, %struct.itemdef { i8* getelementptr inbounds ([14 x i8]* @.str16173, i64 0, i64 0), i8* null }, %struct.itemdef { i8* getelementptr inbounds ([14 x i8]* @.str17174, i64 0, i64 0), i8* null }, %struct.itemdef { i8* getelementptr inbounds ([17 x i8]* @.str18175, i64 0, i64 0), i8* null }, %struct.itemdef { i8* getelementptr inbounds ([9 x i8]* @.str19176, i64 0, i64 0), i8* null }, %struct.itemdef { i8* getelementptr inbounds ([10 x i8]* @.str20177, i64 0, i64 0), i8* null }, %struct.itemdef { i8* getelementptr inbounds ([22 x i8]* @.str21178, i64 0, i64 0), i8* null }, %struct.itemdef { i8* getelementptr inbounds ([15 x i8]* @.str7105, i64 0, i64 0), i8* null }, %struct.itemdef { i8* getelementptr inbounds ([14 x i8]* @.str23180, i64 0, i64 0), i8* null }, %struct.itemdef { i8* getelementptr inbounds ([14 x i8]* @.str24181, i64 0, i64 0), i8* null }, %struct.itemdef { i8* getelementptr inbounds ([14 x i8]* @.str25182, i64 0, i64 0), i8* null }, %struct.itemdef { i8* getelementptr inbounds ([21 x i8]* @.str199, i64 0, i64 0), i8* null }, %struct.itemdef { i8* getelementptr inbounds ([21 x i8]* @.str98, i64 0, i64 0), i8* null }, %struct.itemdef { i8* getelementptr inbounds ([11 x i8]* @.str28185, i64 0, i64 0), i8* null }, %struct.itemdef { i8* getelementptr inbounds ([8 x i8]* @.str29186, i64 0, i64 0), i8* null }, %struct.itemdef { i8* getelementptr inbounds ([12 x i8]* @.str30187, i64 0, i64 0), i8* null }, %struct.itemdef { i8* getelementptr inbounds ([12 x i8]* @.str31188, i64 0, i64 0), i8* null }, %struct.itemdef { i8* getelementptr inbounds ([12 x i8]* @.str32189, i64 0, i64 0), i8* null }, %struct.itemdef { i8* getelementptr inbounds ([12 x i8]* @.str33190, i64 0, i64 0), i8* null }, %struct.itemdef { i8* getelementptr inbounds ([9 x i8]* @.str34191, i64 0, i64 0), i8* null }, %struct.itemdef { i8* getelementptr inbounds ([8 x i8]* @.str35192, i64 0, i64 0), i8* null }, %struct.itemdef { i8* getelementptr inbounds ([13 x i8]* @.str36193, i64 0, i64 0), i8* null }, %struct.itemdef { i8* getelementptr inbounds ([8 x i8]* @.str37194, i64 0, i64 0), i8* null }, %struct.itemdef { i8* getelementptr inbounds ([8 x i8]* @.str38195, i64 0, i64 0), i8* null }, %struct.itemdef { i8* getelementptr inbounds ([6 x i8]* @.str39196, i64 0, i64 0), i8* null }, %struct.itemdef { i8* getelementptr inbounds ([12 x i8]* @.str40197, i64 0, i64 0), i8* null }, %struct.itemdef { i8* getelementptr inbounds ([16 x i8]* @.str41198, i64 0, i64 0), i8* null }, %struct.itemdef { i8* getelementptr inbounds ([10 x i8]* @.str42199, i64 0, i64 0), i8* null }, %struct.itemdef { i8* getelementptr inbounds ([10 x i8]* @.str43200, i64 0, i64 0), i8* null }, %struct.itemdef { i8* getelementptr inbounds ([18 x i8]* @.str44201, i64 0, i64 0), i8* null }, %struct.itemdef { i8* getelementptr inbounds ([7 x i8]* @.str45202, i64 0, i64 0), i8* null }, %struct.itemdef { i8* getelementptr inbounds ([13 x i8]* @.str46203, i64 0, i64 0), i8* null }, %struct.itemdef { i8* getelementptr inbounds ([7 x i8]* @.str47204, i64 0, i64 0), i8* null }, %struct.itemdef { i8* getelementptr inbounds ([13 x i8]* @.str48205, i64 0, i64 0), i8* null }, %struct.itemdef { i8* getelementptr inbounds ([10 x i8]* @.str49206, i64 0, i64 0), i8* null }, %struct.itemdef { i8* getelementptr inbounds ([11 x i8]* @.str50207, i64 0, i64 0), i8* null }, %struct.itemdef { i8* getelementptr inbounds ([13 x i8]* @.str51208, i64 0, i64 0), i8* null }, %struct.itemdef { i8* getelementptr inbounds ([13 x i8]* @.str52209, i64 0, i64 0), i8* null }, %struct.itemdef { i8* getelementptr inbounds ([16 x i8]* @.str53210, i64 0, i64 0), i8* null }, %struct.itemdef { i8* getelementptr inbounds ([10 x i8]* @.str54211, i64 0, i64 0), i8* null }, %struct.itemdef { i8* getelementptr inbounds ([14 x i8]* @.str55212, i64 0, i64 0), i8* null }, %struct.itemdef { i8* getelementptr inbounds ([20 x i8]* @.str56213, i64 0, i64 0), i8* null }, %struct.itemdef { i8* getelementptr inbounds ([17 x i8]* @.str57214, i64 0, i64 0), i8* null }, %struct.itemdef { i8* getelementptr inbounds ([18 x i8]* @.str58215, i64 0, i64 0), i8* null }, %struct.itemdef { i8* getelementptr inbounds ([13 x i8]* @.str59216, i64 0, i64 0), i8* null }, %struct.itemdef { i8* getelementptr inbounds ([13 x i8]* @.str60217, i64 0, i64 0), i8* null }, %struct.itemdef { i8* getelementptr inbounds ([21 x i8]* @.str61218, i64 0, i64 0), i8* null }, %struct.itemdef { i8* getelementptr inbounds ([12 x i8]* @.str62219, i64 0, i64 0), i8* null }, %struct.itemdef { i8* getelementptr inbounds ([14 x i8]* @.str63220, i64 0, i64 0), i8* null }, %struct.itemdef { i8* getelementptr inbounds ([7 x i8]* @.str64221, i64 0, i64 0), i8* null }, %struct.itemdef { i8* getelementptr inbounds ([15 x i8]* @.str65222, i64 0, i64 0), i8* null }, %struct.itemdef { i8* getelementptr inbounds ([15 x i8]* @.str66223, i64 0, i64 0), i8* null }, %struct.itemdef zeroinitializer], align 32
@.str157 = private constant [14 x i8] c"CHFN_RESTRICT\00", align 1
@.str1158 = private constant [15 x i8] c"CONSOLE_GROUPS\00", align 1
@.str2159 = private constant [8 x i8] c"CONSOLE\00", align 1
@.str3160 = private constant [12 x i8] c"CREATE_HOME\00", align 1
@.str4161 = private constant [13 x i8] c"DEFAULT_HOME\00", align 1
@.str6163 = private constant [9 x i8] c"ENV_PATH\00", align 1
@.str7164 = private constant [11 x i8] c"ENV_SUPATH\00", align 1
@.str8165 = private constant [10 x i8] c"ERASECHAR\00", align 1
@.str9166 = private constant [11 x i8] c"FAIL_DELAY\00", align 1
@.str10167 = private constant [11 x i8] c"FAKE_SHELL\00", align 1
@.str11168 = private constant [8 x i8] c"GID_MAX\00", align 1
@.str12169 = private constant [8 x i8] c"GID_MIN\00", align 1
@.str13170 = private constant [15 x i8] c"HUSHLOGIN_FILE\00", align 1
@.str14171 = private constant [9 x i8] c"KILLCHAR\00", align 1
@.str15172 = private constant [14 x i8] c"LOGIN_RETRIES\00", align 1
@.str16173 = private constant [14 x i8] c"LOGIN_TIMEOUT\00", align 1
@.str17174 = private constant [14 x i8] c"LOG_OK_LOGINS\00", align 1
@.str18175 = private constant [17 x i8] c"LOG_UNKFAIL_ENAB\00", align 1
@.str19176 = private constant [9 x i8] c"MAIL_DIR\00", align 1
@.str20177 = private constant [10 x i8] c"MAIL_FILE\00", align 1
@.str21178 = private constant [22 x i8] c"MAX_MEMBERS_PER_GROUP\00", align 1
@.str23180 = private constant [14 x i8] c"PASS_MAX_DAYS\00", align 1
@.str24181 = private constant [14 x i8] c"PASS_MIN_DAYS\00", align 1
@.str25182 = private constant [14 x i8] c"PASS_WARN_AGE\00", align 1
@.str28185 = private constant [11 x i8] c"SULOG_FILE\00", align 1
@.str29186 = private constant [8 x i8] c"SU_NAME\00", align 1
@.str30187 = private constant [12 x i8] c"SYS_GID_MAX\00", align 1
@.str31188 = private constant [12 x i8] c"SYS_GID_MIN\00", align 1
@.str32189 = private constant [12 x i8] c"SYS_UID_MAX\00", align 1
@.str33190 = private constant [12 x i8] c"SYS_UID_MIN\00", align 1
@.str34191 = private constant [9 x i8] c"TTYGROUP\00", align 1
@.str35192 = private constant [8 x i8] c"TTYPERM\00", align 1
@.str36193 = private constant [13 x i8] c"TTYTYPE_FILE\00", align 1
@.str37194 = private constant [8 x i8] c"UID_MAX\00", align 1
@.str38195 = private constant [8 x i8] c"UID_MIN\00", align 1
@.str39196 = private constant [6 x i8] c"UMASK\00", align 1
@.str40197 = private constant [12 x i8] c"USERDEL_CMD\00", align 1
@.str41198 = private constant [16 x i8] c"USERGROUPS_ENAB\00", align 1
@.str42199 = private constant [10 x i8] c"CHFN_AUTH\00", align 1
@.str43200 = private constant [10 x i8] c"CHSH_AUTH\00", align 1
@.str44201 = private constant [18 x i8] c"CRACKLIB_DICTPATH\00", align 1
@.str45202 = private constant [7 x i8] c"ENV_HZ\00", align 1
@.str46203 = private constant [13 x i8] c"ENVIRON_FILE\00", align 1
@.str47204 = private constant [7 x i8] c"ENV_TZ\00", align 1
@.str48205 = private constant [13 x i8] c"FAILLOG_ENAB\00", align 1
@.str49206 = private constant [10 x i8] c"FTMP_FILE\00", align 1
@.str50207 = private constant [11 x i8] c"ISSUE_FILE\00", align 1
@.str51208 = private constant [13 x i8] c"LASTLOG_ENAB\00", align 1
@.str52209 = private constant [13 x i8] c"LOGIN_STRING\00", align 1
@.str53210 = private constant [16 x i8] c"MAIL_CHECK_ENAB\00", align 1
@.str54211 = private constant [10 x i8] c"MOTD_FILE\00", align 1
@.str55212 = private constant [14 x i8] c"NOLOGINS_FILE\00", align 1
@.str56213 = private constant [20 x i8] c"OBSCURE_CHECKS_ENAB\00", align 1
@.str57214 = private constant [17 x i8] c"PASS_ALWAYS_WARN\00", align 1
@.str58215 = private constant [18 x i8] c"PASS_CHANGE_TRIES\00", align 1
@.str59216 = private constant [13 x i8] c"PASS_MAX_LEN\00", align 1
@.str60217 = private constant [13 x i8] c"PASS_MIN_LEN\00", align 1
@.str61218 = private constant [21 x i8] c"PORTTIME_CHECKS_ENAB\00", align 1
@.str62219 = private constant [12 x i8] c"QUOTAS_ENAB\00", align 1
@.str63220 = private constant [14 x i8] c"SU_WHEEL_ONLY\00", align 1
@.str64221 = private constant [7 x i8] c"ULIMIT\00", align 1
@.str65222 = private constant [15 x i8] c"SYSLOG_SG_ENAB\00", align 1
@.str66223 = private constant [15 x i8] c"SYSLOG_SU_ENAB\00", align 1
@def_fname = internal global [16 x i8] c"/etc/login.defs\00", align 16
@def_loaded.b = internal global i1 false
@.str67224 = private constant [4 x i8] c"yes\00", align 1
@.str68225 = private constant [50 x i8] c"configuration error - cannot parse %s value: '%s'\00", align 8
@.str69226 = private constant [43 x i8] c"Could not allocate space for config info.\0A\00", align 8
@.str71 = private constant [41 x i8] c"could not allocate space for config info\00", align 8
@.str72 = private constant [64 x i8] c"configuration error - unknown item '%s' (notify administrator)\0A\00", align 8
@.str73 = private constant [32 x i8] c"unknown configuration item `%s'\00", align 8
@.str74 = private constant [2 x i8] c"r\00", align 1
@.str75 = private constant [38 x i8] c"cannot open login definitions %s [%s]\00", align 8
@.str76 = private constant [3 x i8] c" \09\00", align 1
@.str77 = private constant [4 x i8] c" \22\09\00", align 1
@.str78 = private constant [2 x i8] c"\22\00", align 1
@.str79227 = private constant [38 x i8] c"cannot read login definitions %s [%s]\00", align 8
@.str231 = private constant [3 x i8] c":\0A\00", align 1
@.str1232 = private constant [4 x i8] c",:\0A\00", align 1
@group_ops = internal global %struct.commonio_ops { i8* (i8*)* @group_dup, void (i8*)* @group_free, i8* (i8*)* @group_getname, i8* (i8*)* @group_parse, i32 (i8*, %struct.FILE*)* @group_put, i8* (i8*, i32, %struct.FILE*)* @fgetsx, i32 (i8*, %struct.FILE*)* @fputsx, i32 ()* @group_open_hook, i32 ()* @group_close_hook }, align 32
@group_db = internal global %struct.commonio_db { [1024 x i8] c"/etc/group\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", %struct.commonio_ops* @group_ops, %struct.FILE* null, %struct.commonio_entry* null, %struct.commonio_entry* null, %struct.commonio_entry* null, i8 0 }, align 32
@.str3234 = private constant [25 x i8] c"((void *)0) != gr2->prev\00", align 1
@.str4235 = private constant [20 x i8] c"../../lib/groupio.c\00", align 1
@__PRETTY_FUNCTION__.5431 = internal constant [16 x i8] c"group_open_hook\00"
@.str6237 = private constant [6 x i8] c"%s\0A%s\00", align 1
@.str245 = private constant [15 x i8] c"/usr/sbin/nscd\00", align 1
@.str1246 = private constant [5 x i8] c"nscd\00", align 1
@.str2247 = private constant [3 x i8] c"-i\00", align 1
@.str3248 = private constant [37 x i8] c"%s: Failed to flush the nscd cache.\0A\00", align 8
@.str4249 = private constant [49 x i8] c"%s: nscd did not terminate normally (signal %d)\0A\00", align 8
@.str5250 = private constant [31 x i8] c"%s: nscd exited with status %d\00", align 8
@.str252 = private constant [6 x i8] c"crypt\00", align 1
@nummethod.5168 = internal global [4 x i8] c"$x$\00"
@.str4256 = private constant [46 x i8] c"crypt method not supported by libcrypt? (%s)\0A\00", align 8
@cipher.5160 = internal global [128 x i8] zeroinitializer
@gshadow_ops = internal global %struct.commonio_ops { i8* (i8*)* @gshadow_dup, void (i8*)* @gshadow_free, i8* (i8*)* @gshadow_getname, i8* (i8*)* @gshadow_parse, i32 (i8*, %struct.FILE*)* @gshadow_put, i8* (i8*, i32, %struct.FILE*)* @fgetsx, i32 (i8*, %struct.FILE*)* @fputsx, i32 ()* null, i32 ()* null }, align 32
@gshadow_db = internal global %struct.commonio_db { [1024 x i8] c"/etc/gshadow\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", %struct.commonio_ops* @gshadow_ops, %struct.FILE* null, %struct.commonio_entry* null, %struct.commonio_entry* null, %struct.commonio_entry* null, i8 0 }, align 32
@lock_count = internal global i32 0
@nscd_need_reload.b = internal global i1 false
@.str270 = private constant [22 x i8] c"realpath in lrename()\00", align 1
@.str1271 = private constant [12 x i8] c"%s: %s: %s\0A\00", align 1
@.str2272 = private constant [4 x i8] c"%lu\00", align 1
@.str3273 = private constant [32 x i8] c"%s: %s: lock file already used\0A\00", align 8
@.str4274 = private constant [41 x i8] c"%s: existing lock file %s without a PID\0A\00", align 8
@.str5275 = private constant [52 x i8] c"%s: existing lock file %s with an invalid PID '%s'\0A\00", align 8
@.str6276 = private constant [37 x i8] c"%s: lock %s already used by PID %lu\0A\00", align 8
@.str7277 = private constant [28 x i8] c"%s: cannot get lock %s: %s\0A\00", align 1
@.str8278 = private constant [2 x i8] c"w\00", align 1
@.str10280 = private constant [7 x i8] c"%s.%lu\00", align 1
@.str11281 = private constant [8 x i8] c"%s.lock\00", align 1
@.str13283 = private constant [7 x i8] c"passwd\00", align 1
@.str16286 = private constant [3 x i8] c"r+\00", align 1
@.str17287 = private constant [20 x i8] c"((void *)0) != eptr\00", align 1
@.str18288 = private constant [21 x i8] c"../../lib/commonio.c\00", align 1
@__PRETTY_FUNCTION__.5934 = internal constant [10 x i8] c"write_all\00"
@.str19289 = private constant [4 x i8] c"%s-\00", align 1
@.str20290 = private constant [4 x i8] c"%s+\00", align 1
@.str21291 = private constant [72 x i8] c"Multiple entries named '%s' in %s. Please fix this with pwck or grpck.\0A\00", align 8
@members310 = internal global i8** null
@nmembers = internal global i64 0
@admins311 = internal global i8** null
@nadmins = internal global i64 0
@sgrbuflen.5209 = internal global i64 0
@sgrbuf.5208 = internal global i8* null
@sgroup = internal global %struct.sgrp zeroinitializer, align 32
@.str316 = private constant [27 x i8] c"%s: cannot execute %s: %s\0A\00", align 1
@.str1317 = private constant [30 x i8] c"%s: waitpid (status: %d): %s\0A\00", align 1
@size.5160 = internal global i32 0
@members.5159 = internal global i8** null
@size.5208 = internal global i64 0
@grpbuf.5207 = internal global i8* null
@grpfields.5209 = internal global [4 x i8*] zeroinitializer
@grent.5210 = internal global %struct.group zeroinitializer
@.str70 = private constant [16 x i8] c"POSIXLY_CORRECT\00", align 1
@.str171 = private constant [3 x i8] c"--\00", align 1
@.str272 = private constant [30 x i8] c"%s: option `%s' is ambiguous\0A\00", align 1
@.str373 = private constant [45 x i8] c"%s: option `--%s' doesn't allow an argument\0A\00", align 8
@.str474 = private constant [45 x i8] c"%s: option `%c%s' doesn't allow an argument\0A\00", align 8
@.str575 = private constant [38 x i8] c"%s: option `%s' requires an argument\0A\00", align 8
@.str676 = private constant [32 x i8] c"%s: unrecognized option `--%s'\0A\00", align 8
@.str777 = private constant [32 x i8] c"%s: unrecognized option `%c%s'\0A\00", align 8
@.str979 = private constant [26 x i8] c"%s: illegal option -- %c\0A\00", align 1
@.str1080 = private constant [26 x i8] c"%s: invalid option -- %c\0A\00", align 1
@.str1181 = private constant [39 x i8] c"%s: option requires an argument -- %c\0A\00", align 8
@getopt_data = internal global %struct._getopt_data zeroinitializer, align 32

define internal fastcc void @usage(i32 %status) noreturn nounwind {
entry:
  %0 = icmp eq i32 %status, 0, !dbg !548
  %stdout.val = load %struct.FILE** @stdout, align 8
  %stderr.val = load %struct.FILE** @stderr, align 8
  %storemerge = select i1 %0, %struct.FILE* %stdout.val, %struct.FILE* %stderr.val
  %1 = load i8** @Prog, align 8, !dbg !551
  %2 = call i32 (%struct.FILE*, i8*, ...)* @fprintf(%struct.FILE* noalias %storemerge, i8* noalias getelementptr inbounds ([36 x i8]* @.str, i64 0, i64 0), i8* %1) nounwind, !dbg !551
  %3 = bitcast %struct.FILE* %storemerge to i8*, !dbg !552
  %4 = call i64 @fwrite(i8* getelementptr inbounds ([51 x i8]* @.str1, i64 0, i64 0), i64 1, i64 50, i8* %3) nounwind, !dbg !552
  %5 = call i64 @fwrite(i8* getelementptr inbounds ([56 x i8]* @.str2, i64 0, i64 0), i64 1, i64 55, i8* %3) nounwind, !dbg !553
  %6 = call i64 @fwrite(i8* getelementptr inbounds ([68 x i8]* @.str3, i64 0, i64 0), i64 1, i64 67, i8* %3) nounwind, !dbg !554
  %7 = call i64 @fwrite(i8* getelementptr inbounds ([58 x i8]* @.str4, i64 0, i64 0), i64 1, i64 57, i8* %3) nounwind, !dbg !555
  %8 = call i64 @fwrite(i8* getelementptr inbounds ([61 x i8]* @.str5, i64 0, i64 0), i64 1, i64 60, i8* %3) nounwind, !dbg !556
  %9 = call i64 @fwrite(i8* getelementptr inbounds ([73 x i8]* @.str6, i64 0, i64 0), i64 1, i64 72, i8* %3) nounwind, !dbg !557
  %10 = call i64 @fwrite(i8* getelementptr inbounds ([66 x i8]* @.str7, i64 0, i64 0), i64 1, i64 65, i8* %3) nounwind, !dbg !558
  %11 = call i64 @fwrite(i8* getelementptr inbounds ([107 x i8]* @.str8, i64 0, i64 0), i64 1, i64 106, i8* %3) nounwind, !dbg !559
  %12 = call i64 @fwrite(i8* getelementptr inbounds ([67 x i8]* @.str9, i64 0, i64 0), i64 1, i64 66, i8* %3) nounwind, !dbg !560
  call void @exit(i32 %status) noreturn nounwind, !dbg !561
  unreachable, !dbg !561
}

declare i32 @fprintf(%struct.FILE* noalias, i8* noalias, ...) nounwind

declare i64 @fwrite(i8*, i64, i64, i8*)

declare void @exit(i32) noreturn nounwind

define internal void @catch_signals(i32 %killed) nounwind {
entry:
  %0 = icmp eq i32 %killed, 0, !dbg !562
  br i1 %0, label %bb1, label %bb, !dbg !562

bb:                                               ; preds = %entry
  %1 = call i32 @tcsetattr(i32 0, i32 0, %struct.termios* @sgtty.5395) nounwind, !dbg !564
  br label %bb2, !dbg !564

bb1:                                              ; preds = %entry
  %2 = call i32 @tcgetattr(i32 0, %struct.termios* @sgtty.5395) nounwind, !dbg !565
  br label %bb2, !dbg !565

bb2:                                              ; preds = %bb1, %bb
  br i1 %0, label %return, label %bb3, !dbg !566

bb3:                                              ; preds = %bb2
  %3 = call i32 @putchar(i32 10) nounwind, !dbg !567
  %4 = load %struct.FILE** @stdout, align 8, !dbg !568
  %5 = call i32 @fflush(%struct.FILE* %4) nounwind, !dbg !568
  call void @exit(i32 %killed) noreturn nounwind, !dbg !569
  unreachable, !dbg !569

return:                                           ; preds = %bb2
  ret void, !dbg !570
}

declare i32 @tcsetattr(i32, i32, %struct.termios*) nounwind

declare i32 @tcgetattr(i32, %struct.termios*) nounwind

declare i32 @putchar(i32)

declare i32 @fflush(%struct.FILE*)

define internal fastcc zeroext i8 @is_valid_user_list(i8* %users) nounwind {
entry:
  %0 = call i64 @strlen(i8* %users) nounwind readonly, !dbg !571
  %1 = add i64 %0, 1, !dbg !571
  %2 = call noalias i8* @malloc(i64 %1) nounwind, !dbg !586
  %3 = icmp eq i8* %2, null, !dbg !593
  br i1 %3, label %bb.i, label %xmalloc.exit, !dbg !593

bb.i:                                             ; preds = %entry
  %4 = call i32* @__errno_location() nounwind readnone, !dbg !594
  %5 = load i32* %4, align 4, !dbg !594
  %6 = call i8* @strerror(i32 %5) nounwind, !dbg !594
  %7 = load i8** @Prog, align 8, !dbg !594
  %8 = load %struct.FILE** @stderr, align 8, !dbg !594
  %9 = call i32 (%struct.FILE*, i8*, ...)* @fprintf(%struct.FILE* noalias %8, i8* noalias getelementptr inbounds ([35 x i8]* @.str147, i64 0, i64 0), i8* %7, i8* %6) nounwind, !dbg !594
  call void @exit(i32 13) noreturn nounwind, !dbg !595
  unreachable, !dbg !595

xmalloc.exit:                                     ; preds = %entry
  %10 = call i8* @strcpy(i8* noalias %2, i8* noalias %users) nounwind, !dbg !571
  br label %bb5.outer, !dbg !596

bb:                                               ; preds = %bb6
  %11 = call i8* @strchr(i8* %storemerge, i32 44) nounwind readonly, !dbg !597
  %12 = icmp eq i8* %11, null, !dbg !598
  br i1 %12, label %bb2, label %bb1, !dbg !598

bb1:                                              ; preds = %bb
  store i8 0, i8* %11, align 1, !dbg !599
  %13 = getelementptr inbounds i8* %11, i64 1, !dbg !600
  br label %bb2, !dbg !600

bb2:                                              ; preds = %bb1, %bb
  %end.0 = phi i8* [ %11, %bb ], [ %13, %bb1 ]
  %14 = call %struct.passwd* @getpwnam(i8* %storemerge) nounwind, !dbg !601
  %15 = icmp eq %struct.passwd* %14, null, !dbg !601
  br i1 %15, label %bb3, label %bb5, !dbg !601

bb3:                                              ; preds = %bb2
  %16 = load i8** @Prog, align 8, !dbg !602
  %17 = load %struct.FILE** @stderr, align 8, !dbg !602
  %18 = call i32 (%struct.FILE*, i8*, ...)* @fprintf(%struct.FILE* noalias %17, i8* noalias getelementptr inbounds ([30 x i8]* @.str10, i64 0, i64 0), i8* %16, i8* %storemerge) nounwind, !dbg !602
  br label %bb5.outer, !dbg !603

bb5.outer:                                        ; preds = %bb3, %xmalloc.exit
  %is_valid.1.ph = phi i8 [ 1, %xmalloc.exit ], [ 0, %bb3 ]
  %storemerge.ph = phi i8* [ %10, %xmalloc.exit ], [ %end.0, %bb3 ]
  br label %bb5

bb5:                                              ; preds = %bb5.outer, %bb2
  %storemerge = phi i8* [ %end.0, %bb2 ], [ %storemerge.ph, %bb5.outer ]
  %19 = icmp eq i8* %storemerge, null, !dbg !604
  br i1 %19, label %return, label %bb6, !dbg !604

bb6:                                              ; preds = %bb5
  %20 = load i8* %storemerge, align 1, !dbg !604
  %21 = icmp eq i8 %20, 0, !dbg !604
  br i1 %21, label %return, label %bb, !dbg !604

return:                                           ; preds = %bb6, %bb5
  call void @free(i8* %10) nounwind, !dbg !605
  ret i8 %is_valid.1.ph, !dbg !606
}

declare i8* @strchr(i8*, i32) nounwind readonly

declare %struct.passwd* @getpwnam(i8*)

declare void @free(i8*) nounwind

declare i8* @setlocale(i32, i8*) nounwind

declare noalias i8* @strdup(i8*) nounwind

declare void @syslog(i32, i8*, ...)

define internal fastcc void @log_gpasswd_failure(i8* %suffix) nounwind {
entry:
  %.b = load i1* @aflg.b
  br i1 %.b, label %bb, label %bb7, !dbg !607

bb:                                               ; preds = %entry
  %0 = call i8* @setlocale(i32 6, i8* null) nounwind, !dbg !612
  %1 = icmp eq i8* %0, null, !dbg !612
  br i1 %1, label %bb4, label %bb2, !dbg !612

bb2:                                              ; preds = %bb
  %2 = call noalias i8* @strdup(i8* %0) nounwind, !dbg !612
  %3 = icmp eq i8* %2, null, !dbg !612
  br i1 %3, label %bb4, label %bb3, !dbg !612

bb3:                                              ; preds = %bb2
  %4 = call i8* @setlocale(i32 6, i8* getelementptr inbounds ([2 x i8]* @.str25, i64 0, i64 0)) nounwind, !dbg !612
  br label %bb4, !dbg !612

bb4:                                              ; preds = %bb3, %bb2, %bb
  %saved_locale.0 = phi i8* [ null, %bb ], [ %2, %bb2 ], [ %2, %bb3 ]
  %5 = load i8** @group, align 8, !dbg !612
  %6 = load i8** @user, align 8, !dbg !612
  %7 = load i8** @myname, align 8, !dbg !612
  call void (i32, i8*, ...)* @syslog(i32 3, i8* getelementptr inbounds ([39 x i8]* @.str27, i64 0, i64 0), i8* %7, i8* %6, i8* %5, i8* %suffix) nounwind, !dbg !612
  %8 = icmp eq i8* %saved_locale.0, null, !dbg !612
  br i1 %8, label %return, label %bb5, !dbg !612

bb5:                                              ; preds = %bb4
  %9 = call i8* @setlocale(i32 6, i8* %saved_locale.0) nounwind, !dbg !612
  call void @free(i8* %saved_locale.0) nounwind, !dbg !612
  ret void, !dbg !614

bb7:                                              ; preds = %entry
  %.b3 = load i1* @dflg.b
  br i1 %.b3, label %bb9, label %bb18, !dbg !616

bb9:                                              ; preds = %bb7
  %10 = call i8* @setlocale(i32 6, i8* null) nounwind, !dbg !617
  %11 = icmp eq i8* %10, null, !dbg !617
  br i1 %11, label %bb15, label %bb13, !dbg !617

bb13:                                             ; preds = %bb9
  %12 = call noalias i8* @strdup(i8* %10) nounwind, !dbg !617
  %13 = icmp eq i8* %12, null, !dbg !617
  br i1 %13, label %bb15, label %bb14, !dbg !617

bb14:                                             ; preds = %bb13
  %14 = call i8* @setlocale(i32 6, i8* getelementptr inbounds ([2 x i8]* @.str25, i64 0, i64 0)) nounwind, !dbg !617
  br label %bb15, !dbg !617

bb15:                                             ; preds = %bb14, %bb13, %bb9
  %saved_locale11.0 = phi i8* [ null, %bb9 ], [ %12, %bb13 ], [ %12, %bb14 ]
  %15 = load i8** @group, align 8, !dbg !617
  %16 = load i8** @user, align 8, !dbg !617
  %17 = load i8** @myname, align 8, !dbg !617
  call void (i32, i8*, ...)* @syslog(i32 3, i8* getelementptr inbounds ([44 x i8]* @.str28, i64 0, i64 0), i8* %17, i8* %16, i8* %15, i8* %suffix) nounwind, !dbg !617
  %18 = icmp eq i8* %saved_locale11.0, null, !dbg !617
  br i1 %18, label %return, label %bb16, !dbg !617

bb16:                                             ; preds = %bb15
  %19 = call i8* @setlocale(i32 6, i8* %saved_locale11.0) nounwind, !dbg !617
  call void @free(i8* %saved_locale11.0) nounwind, !dbg !617
  ret void, !dbg !614

bb18:                                             ; preds = %bb7
  %.b6 = load i1* @rflg.b
  br i1 %.b6, label %bb20, label %bb29, !dbg !619

bb20:                                             ; preds = %bb18
  %20 = call i8* @setlocale(i32 6, i8* null) nounwind, !dbg !620
  %21 = icmp eq i8* %20, null, !dbg !620
  br i1 %21, label %bb26, label %bb24, !dbg !620

bb24:                                             ; preds = %bb20
  %22 = call noalias i8* @strdup(i8* %20) nounwind, !dbg !620
  %23 = icmp eq i8* %22, null, !dbg !620
  br i1 %23, label %bb26, label %bb25, !dbg !620

bb25:                                             ; preds = %bb24
  %24 = call i8* @setlocale(i32 6, i8* getelementptr inbounds ([2 x i8]* @.str25, i64 0, i64 0)) nounwind, !dbg !620
  br label %bb26, !dbg !620

bb26:                                             ; preds = %bb25, %bb24, %bb20
  %saved_locale22.0 = phi i8* [ null, %bb20 ], [ %22, %bb24 ], [ %22, %bb25 ]
  %25 = load i8** @group, align 8, !dbg !620
  %26 = load i8** @myname, align 8, !dbg !620
  call void (i32, i8*, ...)* @syslog(i32 3, i8* getelementptr inbounds ([43 x i8]* @.str29, i64 0, i64 0), i8* %26, i8* %25, i8* %suffix) nounwind, !dbg !620
  %27 = icmp eq i8* %saved_locale22.0, null, !dbg !620
  br i1 %27, label %return, label %bb27, !dbg !620

bb27:                                             ; preds = %bb26
  %28 = call i8* @setlocale(i32 6, i8* %saved_locale22.0) nounwind, !dbg !620
  call void @free(i8* %saved_locale22.0) nounwind, !dbg !620
  ret void, !dbg !614

bb29:                                             ; preds = %bb18
  %.b7 = load i1* @Rflg.b
  br i1 %.b7, label %bb31, label %bb40, !dbg !622

bb31:                                             ; preds = %bb29
  %29 = call i8* @setlocale(i32 6, i8* null) nounwind, !dbg !623
  %30 = icmp eq i8* %29, null, !dbg !623
  br i1 %30, label %bb37, label %bb35, !dbg !623

bb35:                                             ; preds = %bb31
  %31 = call noalias i8* @strdup(i8* %29) nounwind, !dbg !623
  %32 = icmp eq i8* %31, null, !dbg !623
  br i1 %32, label %bb37, label %bb36, !dbg !623

bb36:                                             ; preds = %bb35
  %33 = call i8* @setlocale(i32 6, i8* getelementptr inbounds ([2 x i8]* @.str25, i64 0, i64 0)) nounwind, !dbg !623
  br label %bb37, !dbg !623

bb37:                                             ; preds = %bb36, %bb35, %bb31
  %saved_locale33.0 = phi i8* [ null, %bb31 ], [ %31, %bb35 ], [ %31, %bb36 ]
  %34 = load i8** @group, align 8, !dbg !623
  %35 = load i8** @myname, align 8, !dbg !623
  call void (i32, i8*, ...)* @syslog(i32 3, i8* getelementptr inbounds ([43 x i8]* @.str30, i64 0, i64 0), i8* %35, i8* %34, i8* %suffix) nounwind, !dbg !623
  %36 = icmp eq i8* %saved_locale33.0, null, !dbg !623
  br i1 %36, label %return, label %bb38, !dbg !623

bb38:                                             ; preds = %bb37
  %37 = call i8* @setlocale(i32 6, i8* %saved_locale33.0) nounwind, !dbg !623
  call void @free(i8* %saved_locale33.0) nounwind, !dbg !623
  ret void, !dbg !614

bb40:                                             ; preds = %bb29
  %.b2 = load i1* @Aflg.b
  br i1 %.b2, label %bb46, label %bb42, !dbg !625

bb42:                                             ; preds = %bb40
  %.b5 = load i1* @Mflg.b
  br i1 %.b5, label %bb44thread-pre-split, label %bb65, !dbg !625

bb44thread-pre-split:                             ; preds = %bb42
  br i1 %.b2, label %bb46, label %bb54, !dbg !626

bb46:                                             ; preds = %bb44thread-pre-split, %bb40
  %38 = call i8* @setlocale(i32 6, i8* null) nounwind, !dbg !627
  %39 = icmp eq i8* %38, null, !dbg !627
  br i1 %39, label %bb52, label %bb50, !dbg !627

bb50:                                             ; preds = %bb46
  %40 = call noalias i8* @strdup(i8* %38) nounwind, !dbg !627
  %41 = icmp eq i8* %40, null, !dbg !627
  br i1 %41, label %bb52, label %bb51, !dbg !627

bb51:                                             ; preds = %bb50
  %42 = call i8* @setlocale(i32 6, i8* getelementptr inbounds ([2 x i8]* @.str25, i64 0, i64 0)) nounwind, !dbg !627
  br label %bb52, !dbg !627

bb52:                                             ; preds = %bb51, %bb50, %bb46
  %saved_locale48.0 = phi i8* [ null, %bb46 ], [ %40, %bb50 ], [ %40, %bb51 ]
  %43 = load i8** @admins, align 8, !dbg !627
  %44 = load i8** @group, align 8, !dbg !627
  %45 = load i8** @myname, align 8, !dbg !627
  call void (i32, i8*, ...)* @syslog(i32 3, i8* getelementptr inbounds ([56 x i8]* @.str31, i64 0, i64 0), i8* %45, i8* %44, i8* %43, i8* %suffix) nounwind, !dbg !627
  %46 = icmp eq i8* %saved_locale48.0, null, !dbg !627
  br i1 %46, label %bb54, label %bb53, !dbg !627

bb53:                                             ; preds = %bb52
  %47 = call i8* @setlocale(i32 6, i8* %saved_locale48.0) nounwind, !dbg !627
  call void @free(i8* %saved_locale48.0) nounwind, !dbg !627
  br label %bb54, !dbg !627

bb54:                                             ; preds = %bb53, %bb52, %bb44thread-pre-split
  %.b4 = load i1* @Mflg.b
  br i1 %.b4, label %bb56, label %return, !dbg !629

bb56:                                             ; preds = %bb54
  %48 = call i8* @setlocale(i32 6, i8* null) nounwind, !dbg !630
  %49 = icmp eq i8* %48, null, !dbg !630
  br i1 %49, label %bb62, label %bb60, !dbg !630

bb60:                                             ; preds = %bb56
  %50 = call noalias i8* @strdup(i8* %48) nounwind, !dbg !630
  %51 = icmp eq i8* %50, null, !dbg !630
  br i1 %51, label %bb62, label %bb61, !dbg !630

bb61:                                             ; preds = %bb60
  %52 = call i8* @setlocale(i32 6, i8* getelementptr inbounds ([2 x i8]* @.str25, i64 0, i64 0)) nounwind, !dbg !630
  br label %bb62, !dbg !630

bb62:                                             ; preds = %bb61, %bb60, %bb56
  %saved_locale58.0 = phi i8* [ null, %bb56 ], [ %50, %bb60 ], [ %50, %bb61 ]
  %53 = load i8** @members, align 8, !dbg !630
  %54 = load i8** @group, align 8, !dbg !630
  %55 = load i8** @myname, align 8, !dbg !630
  call void (i32, i8*, ...)* @syslog(i32 3, i8* getelementptr inbounds ([49 x i8]* @.str32, i64 0, i64 0), i8* %55, i8* %54, i8* %53, i8* %suffix) nounwind, !dbg !630
  %56 = icmp eq i8* %saved_locale58.0, null, !dbg !630
  br i1 %56, label %return, label %bb63, !dbg !630

bb63:                                             ; preds = %bb62
  %57 = call i8* @setlocale(i32 6, i8* %saved_locale58.0) nounwind, !dbg !630
  call void @free(i8* %saved_locale58.0) nounwind, !dbg !630
  ret void, !dbg !614

bb65:                                             ; preds = %bb42
  %58 = call i8* @setlocale(i32 6, i8* null) nounwind, !dbg !632
  %59 = icmp eq i8* %58, null, !dbg !632
  br i1 %59, label %bb71, label %bb69, !dbg !632

bb69:                                             ; preds = %bb65
  %60 = call noalias i8* @strdup(i8* %58) nounwind, !dbg !632
  %61 = icmp eq i8* %60, null, !dbg !632
  br i1 %61, label %bb71, label %bb70, !dbg !632

bb70:                                             ; preds = %bb69
  %62 = call i8* @setlocale(i32 6, i8* getelementptr inbounds ([2 x i8]* @.str25, i64 0, i64 0)) nounwind, !dbg !632
  br label %bb71, !dbg !632

bb71:                                             ; preds = %bb70, %bb69, %bb65
  %saved_locale67.0 = phi i8* [ null, %bb65 ], [ %60, %bb69 ], [ %60, %bb70 ]
  %63 = load i8** @group, align 8, !dbg !632
  %64 = load i8** @myname, align 8, !dbg !632
  call void (i32, i8*, ...)* @syslog(i32 3, i8* getelementptr inbounds ([43 x i8]* @.str33, i64 0, i64 0), i8* %64, i8* %63, i8* %suffix) nounwind, !dbg !632
  %65 = icmp eq i8* %saved_locale67.0, null, !dbg !632
  br i1 %65, label %return, label %bb72, !dbg !632

bb72:                                             ; preds = %bb71
  %66 = call i8* @setlocale(i32 6, i8* %saved_locale67.0) nounwind, !dbg !632
  call void @free(i8* %saved_locale67.0) nounwind, !dbg !632
  ret void, !dbg !614

return:                                           ; preds = %bb71, %bb62, %bb54, %bb37, %bb26, %bb15, %bb4
  ret void, !dbg !614
}

define internal void @log_gpasswd_failure_system(i8* nocapture %arg) nounwind {
return:
  call fastcc void @log_gpasswd_failure(i8* getelementptr inbounds ([1 x i8]* @.str34, i64 0, i64 0)) nounwind, !dbg !633
  ret void, !dbg !639
}

define internal void @log_gpasswd_failure_group(i8* nocapture %arg) nounwind {
return:
  %buf = alloca [1024 x i8], align 1
  %buf1 = getelementptr inbounds [1024 x i8]* %buf, i64 0, i64 0
  %0 = call i32 (i8*, i64, i8*, ...)* @snprintf(i8* noalias %buf1, i64 1023, i8* noalias getelementptr inbounds ([7 x i8]* @.str35, i64 0, i64 0), i8* getelementptr inbounds (%struct.commonio_db* @group_db, i64 0, i32 0, i64 0)) nounwind, !dbg !640
  %1 = getelementptr inbounds [1024 x i8]* %buf, i64 0, i64 1023, !dbg !643
  store i8 0, i8* %1, align 1, !dbg !643
  call fastcc void @log_gpasswd_failure(i8* %buf1) nounwind, !dbg !644
  ret void, !dbg !645
}

declare i32 @snprintf(i8* noalias, i64, i8* noalias, ...) nounwind

define internal void @log_gpasswd_failure_gshadow(i8* nocapture %arg) nounwind {
return:
  %buf = alloca [1024 x i8], align 1
  %buf1 = getelementptr inbounds [1024 x i8]* %buf, i64 0, i64 0
  %0 = call i32 (i8*, i64, i8*, ...)* @snprintf(i8* noalias %buf1, i64 1023, i8* noalias getelementptr inbounds ([7 x i8]* @.str35, i64 0, i64 0), i8* getelementptr inbounds (%struct.commonio_db* @gshadow_db, i64 0, i32 0, i64 0)) nounwind, !dbg !646
  %1 = getelementptr inbounds [1024 x i8]* %buf, i64 0, i64 1023, !dbg !649
  store i8 0, i8* %1, align 1, !dbg !649
  call fastcc void @log_gpasswd_failure(i8* %buf1) nounwind, !dbg !650
  ret void, !dbg !651
}

define internal fastcc void @log_gpasswd_success(i8* %suffix) nounwind {
entry:
  %.b = load i1* @aflg.b
  br i1 %.b, label %bb, label %bb7, !dbg !652

bb:                                               ; preds = %entry
  %0 = call i8* @setlocale(i32 6, i8* null) nounwind, !dbg !655
  %1 = icmp eq i8* %0, null, !dbg !655
  br i1 %1, label %bb4, label %bb2, !dbg !655

bb2:                                              ; preds = %bb
  %2 = call noalias i8* @strdup(i8* %0) nounwind, !dbg !655
  %3 = icmp eq i8* %2, null, !dbg !655
  br i1 %3, label %bb4, label %bb3, !dbg !655

bb3:                                              ; preds = %bb2
  %4 = call i8* @setlocale(i32 6, i8* getelementptr inbounds ([2 x i8]* @.str25, i64 0, i64 0)) nounwind, !dbg !655
  br label %bb4, !dbg !655

bb4:                                              ; preds = %bb3, %bb2, %bb
  %saved_locale.0 = phi i8* [ null, %bb ], [ %2, %bb2 ], [ %2, %bb3 ]
  %5 = load i8** @group, align 8, !dbg !655
  %6 = load i8** @myname, align 8, !dbg !655
  %7 = load i8** @user, align 8, !dbg !655
  call void (i32, i8*, ...)* @syslog(i32 6, i8* getelementptr inbounds ([34 x i8]* @.str36, i64 0, i64 0), i8* %7, i8* %6, i8* %5, i8* %suffix) nounwind, !dbg !655
  %8 = icmp eq i8* %saved_locale.0, null, !dbg !655
  br i1 %8, label %return, label %bb5, !dbg !655

bb5:                                              ; preds = %bb4
  %9 = call i8* @setlocale(i32 6, i8* %saved_locale.0) nounwind, !dbg !655
  call void @free(i8* %saved_locale.0) nounwind, !dbg !655
  ret void, !dbg !657

bb7:                                              ; preds = %entry
  %.b3 = load i1* @dflg.b
  br i1 %.b3, label %bb9, label %bb18, !dbg !659

bb9:                                              ; preds = %bb7
  %10 = call i8* @setlocale(i32 6, i8* null) nounwind, !dbg !660
  %11 = icmp eq i8* %10, null, !dbg !660
  br i1 %11, label %bb15, label %bb13, !dbg !660

bb13:                                             ; preds = %bb9
  %12 = call noalias i8* @strdup(i8* %10) nounwind, !dbg !660
  %13 = icmp eq i8* %12, null, !dbg !660
  br i1 %13, label %bb15, label %bb14, !dbg !660

bb14:                                             ; preds = %bb13
  %14 = call i8* @setlocale(i32 6, i8* getelementptr inbounds ([2 x i8]* @.str25, i64 0, i64 0)) nounwind, !dbg !660
  br label %bb15, !dbg !660

bb15:                                             ; preds = %bb14, %bb13, %bb9
  %saved_locale11.0 = phi i8* [ null, %bb9 ], [ %12, %bb13 ], [ %12, %bb14 ]
  %15 = load i8** @group, align 8, !dbg !660
  %16 = load i8** @myname, align 8, !dbg !660
  %17 = load i8** @user, align 8, !dbg !660
  call void (i32, i8*, ...)* @syslog(i32 6, i8* getelementptr inbounds ([38 x i8]* @.str37, i64 0, i64 0), i8* %17, i8* %16, i8* %15, i8* %suffix) nounwind, !dbg !660
  %18 = icmp eq i8* %saved_locale11.0, null, !dbg !660
  br i1 %18, label %return, label %bb16, !dbg !660

bb16:                                             ; preds = %bb15
  %19 = call i8* @setlocale(i32 6, i8* %saved_locale11.0) nounwind, !dbg !660
  call void @free(i8* %saved_locale11.0) nounwind, !dbg !660
  ret void, !dbg !657

bb18:                                             ; preds = %bb7
  %.b6 = load i1* @rflg.b
  br i1 %.b6, label %bb20, label %bb29, !dbg !662

bb20:                                             ; preds = %bb18
  %20 = call i8* @setlocale(i32 6, i8* null) nounwind, !dbg !663
  %21 = icmp eq i8* %20, null, !dbg !663
  br i1 %21, label %bb26, label %bb24, !dbg !663

bb24:                                             ; preds = %bb20
  %22 = call noalias i8* @strdup(i8* %20) nounwind, !dbg !663
  %23 = icmp eq i8* %22, null, !dbg !663
  br i1 %23, label %bb26, label %bb25, !dbg !663

bb25:                                             ; preds = %bb24
  %24 = call i8* @setlocale(i32 6, i8* getelementptr inbounds ([2 x i8]* @.str25, i64 0, i64 0)) nounwind, !dbg !663
  br label %bb26, !dbg !663

bb26:                                             ; preds = %bb25, %bb24, %bb20
  %saved_locale22.0 = phi i8* [ null, %bb20 ], [ %22, %bb24 ], [ %22, %bb25 ]
  %25 = load i8** @myname, align 8, !dbg !663
  %26 = load i8** @group, align 8, !dbg !663
  call void (i32, i8*, ...)* @syslog(i32 6, i8* getelementptr inbounds ([37 x i8]* @.str38, i64 0, i64 0), i8* %26, i8* %25, i8* %suffix) nounwind, !dbg !663
  %27 = icmp eq i8* %saved_locale22.0, null, !dbg !663
  br i1 %27, label %return, label %bb27, !dbg !663

bb27:                                             ; preds = %bb26
  %28 = call i8* @setlocale(i32 6, i8* %saved_locale22.0) nounwind, !dbg !663
  call void @free(i8* %saved_locale22.0) nounwind, !dbg !663
  ret void, !dbg !657

bb29:                                             ; preds = %bb18
  %.b7 = load i1* @Rflg.b
  br i1 %.b7, label %bb31, label %bb40, !dbg !665

bb31:                                             ; preds = %bb29
  %29 = call i8* @setlocale(i32 6, i8* null) nounwind, !dbg !666
  %30 = icmp eq i8* %29, null, !dbg !666
  br i1 %30, label %bb37, label %bb35, !dbg !666

bb35:                                             ; preds = %bb31
  %31 = call noalias i8* @strdup(i8* %29) nounwind, !dbg !666
  %32 = icmp eq i8* %31, null, !dbg !666
  br i1 %32, label %bb37, label %bb36, !dbg !666

bb36:                                             ; preds = %bb35
  %33 = call i8* @setlocale(i32 6, i8* getelementptr inbounds ([2 x i8]* @.str25, i64 0, i64 0)) nounwind, !dbg !666
  br label %bb37, !dbg !666

bb37:                                             ; preds = %bb36, %bb35, %bb31
  %saved_locale33.0 = phi i8* [ null, %bb31 ], [ %31, %bb35 ], [ %31, %bb36 ]
  %34 = load i8** @myname, align 8, !dbg !666
  %35 = load i8** @group, align 8, !dbg !666
  call void (i32, i8*, ...)* @syslog(i32 6, i8* getelementptr inbounds ([38 x i8]* @.str39, i64 0, i64 0), i8* %35, i8* %34, i8* %suffix) nounwind, !dbg !666
  %36 = icmp eq i8* %saved_locale33.0, null, !dbg !666
  br i1 %36, label %return, label %bb38, !dbg !666

bb38:                                             ; preds = %bb37
  %37 = call i8* @setlocale(i32 6, i8* %saved_locale33.0) nounwind, !dbg !666
  call void @free(i8* %saved_locale33.0) nounwind, !dbg !666
  ret void, !dbg !657

bb40:                                             ; preds = %bb29
  %.b2 = load i1* @Aflg.b
  br i1 %.b2, label %bb46, label %bb42, !dbg !668

bb42:                                             ; preds = %bb40
  %.b5 = load i1* @Mflg.b
  br i1 %.b5, label %bb44thread-pre-split, label %bb65, !dbg !668

bb44thread-pre-split:                             ; preds = %bb42
  br i1 %.b2, label %bb46, label %bb54, !dbg !669

bb46:                                             ; preds = %bb44thread-pre-split, %bb40
  %38 = call i8* @setlocale(i32 6, i8* null) nounwind, !dbg !670
  %39 = icmp eq i8* %38, null, !dbg !670
  br i1 %39, label %bb52, label %bb50, !dbg !670

bb50:                                             ; preds = %bb46
  %40 = call noalias i8* @strdup(i8* %38) nounwind, !dbg !670
  %41 = icmp eq i8* %40, null, !dbg !670
  br i1 %41, label %bb52, label %bb51, !dbg !670

bb51:                                             ; preds = %bb50
  %42 = call i8* @setlocale(i32 6, i8* getelementptr inbounds ([2 x i8]* @.str25, i64 0, i64 0)) nounwind, !dbg !670
  br label %bb52, !dbg !670

bb52:                                             ; preds = %bb51, %bb50, %bb46
  %saved_locale48.0 = phi i8* [ null, %bb46 ], [ %40, %bb50 ], [ %40, %bb51 ]
  %43 = load i8** @admins, align 8, !dbg !670
  %44 = load i8** @myname, align 8, !dbg !670
  %45 = load i8** @group, align 8, !dbg !670
  call void (i32, i8*, ...)* @syslog(i32 6, i8* getelementptr inbounds ([45 x i8]* @.str40, i64 0, i64 0), i8* %45, i8* %44, i8* %43, i8* %suffix) nounwind, !dbg !670
  %46 = icmp eq i8* %saved_locale48.0, null, !dbg !670
  br i1 %46, label %bb54, label %bb53, !dbg !670

bb53:                                             ; preds = %bb52
  %47 = call i8* @setlocale(i32 6, i8* %saved_locale48.0) nounwind, !dbg !670
  call void @free(i8* %saved_locale48.0) nounwind, !dbg !670
  br label %bb54, !dbg !670

bb54:                                             ; preds = %bb53, %bb52, %bb44thread-pre-split
  %.b4 = load i1* @Mflg.b
  br i1 %.b4, label %bb56, label %return, !dbg !672

bb56:                                             ; preds = %bb54
  %48 = call i8* @setlocale(i32 6, i8* null) nounwind, !dbg !673
  %49 = icmp eq i8* %48, null, !dbg !673
  br i1 %49, label %bb62, label %bb60, !dbg !673

bb60:                                             ; preds = %bb56
  %50 = call noalias i8* @strdup(i8* %48) nounwind, !dbg !673
  %51 = icmp eq i8* %50, null, !dbg !673
  br i1 %51, label %bb62, label %bb61, !dbg !673

bb61:                                             ; preds = %bb60
  %52 = call i8* @setlocale(i32 6, i8* getelementptr inbounds ([2 x i8]* @.str25, i64 0, i64 0)) nounwind, !dbg !673
  br label %bb62, !dbg !673

bb62:                                             ; preds = %bb61, %bb60, %bb56
  %saved_locale58.0 = phi i8* [ null, %bb56 ], [ %50, %bb60 ], [ %50, %bb61 ]
  %53 = load i8** @members, align 8, !dbg !673
  %54 = load i8** @myname, align 8, !dbg !673
  %55 = load i8** @group, align 8, !dbg !673
  call void (i32, i8*, ...)* @syslog(i32 6, i8* getelementptr inbounds ([38 x i8]* @.str41, i64 0, i64 0), i8* %55, i8* %54, i8* %53, i8* %suffix) nounwind, !dbg !673
  %56 = icmp eq i8* %saved_locale58.0, null, !dbg !673
  br i1 %56, label %return, label %bb63, !dbg !673

bb63:                                             ; preds = %bb62
  %57 = call i8* @setlocale(i32 6, i8* %saved_locale58.0) nounwind, !dbg !673
  call void @free(i8* %saved_locale58.0) nounwind, !dbg !673
  ret void, !dbg !657

bb65:                                             ; preds = %bb42
  %58 = call i8* @setlocale(i32 6, i8* null) nounwind, !dbg !675
  %59 = icmp eq i8* %58, null, !dbg !675
  br i1 %59, label %bb71, label %bb69, !dbg !675

bb69:                                             ; preds = %bb65
  %60 = call noalias i8* @strdup(i8* %58) nounwind, !dbg !675
  %61 = icmp eq i8* %60, null, !dbg !675
  br i1 %61, label %bb71, label %bb70, !dbg !675

bb70:                                             ; preds = %bb69
  %62 = call i8* @setlocale(i32 6, i8* getelementptr inbounds ([2 x i8]* @.str25, i64 0, i64 0)) nounwind, !dbg !675
  br label %bb71, !dbg !675

bb71:                                             ; preds = %bb70, %bb69, %bb65
  %saved_locale67.0 = phi i8* [ null, %bb65 ], [ %60, %bb69 ], [ %60, %bb70 ]
  %63 = load i8** @myname, align 8, !dbg !675
  %64 = load i8** @group, align 8, !dbg !675
  call void (i32, i8*, ...)* @syslog(i32 6, i8* getelementptr inbounds ([37 x i8]* @.str42, i64 0, i64 0), i8* %64, i8* %63, i8* %suffix) nounwind, !dbg !675
  %65 = icmp eq i8* %saved_locale67.0, null, !dbg !675
  br i1 %65, label %return, label %bb72, !dbg !675

bb72:                                             ; preds = %bb71
  %66 = call i8* @setlocale(i32 6, i8* %saved_locale67.0) nounwind, !dbg !675
  call void @free(i8* %saved_locale67.0) nounwind, !dbg !675
  ret void, !dbg !657

return:                                           ; preds = %bb71, %bb62, %bb54, %bb37, %bb26, %bb15, %bb4
  ret void, !dbg !657
}

define internal void @log_gpasswd_success_group(i8* nocapture %arg) nounwind {
return:
  %buf = alloca [1024 x i8], align 1
  %buf1 = getelementptr inbounds [1024 x i8]* %buf, i64 0, i64 0
  %0 = call i32 (i8*, i64, i8*, ...)* @snprintf(i8* noalias %buf1, i64 1023, i8* noalias getelementptr inbounds ([7 x i8]* @.str35, i64 0, i64 0), i8* getelementptr inbounds (%struct.commonio_db* @group_db, i64 0, i32 0, i64 0)) nounwind, !dbg !676
  %1 = getelementptr inbounds [1024 x i8]* %buf, i64 0, i64 1023, !dbg !679
  store i8 0, i8* %1, align 1, !dbg !679
  call fastcc void @log_gpasswd_success(i8* %buf1) nounwind, !dbg !680
  ret void, !dbg !681
}

declare i32 @printf(i8* noalias, ...) nounwind

declare i8* @getpass(i8*)

declare i8* @strncpy(i8* noalias, i8* noalias, i64) nounwind

declare i64 @strlen(i8*) nounwind readonly

declare i32 @strcmp(i8*, i8*) nounwind readonly

declare i32 @puts(i8*)

define i32 @main(i32 %argc, i8** %argv) noreturn nounwind {
entry:
  %tv.i48 = alloca %struct.rlimit, align 8
  %tv.i = alloca %struct.rlimit, align 8
  %resbuf.i5.i = alloca %struct.passwd*, align 8
  %resbuf.i.i = alloca %struct.passwd*, align 8
  %tv.i.i.i.i = alloca %struct.rlimit, align 8
  %rlim.i = alloca %struct.rlimit, align 8
  %grent = alloca %struct.group, align 8
  %sgent = alloca %struct.sgrp, align 8
  %0 = load i8*** @environ, align 8, !dbg !682
  br label %bb9.i, !dbg !691

bb1.i:                                            ; preds = %bb7.i
  %1 = call i64 @strlen(i8* %10) nounwind readonly, !dbg !692
  %2 = call i32 @strncmp(i8* %13, i8* %10, i64 %1) nounwind readonly, !dbg !692
  %3 = icmp eq i32 %2, 0, !dbg !692
  br i1 %3, label %bb4.i, label %bb6.i, !dbg !692

bb3.i:                                            ; preds = %bb4.i
  %4 = getelementptr inbounds i8** %storemerge5.i, i64 1, !dbg !693
  %5 = load i8** %4, align 1, !dbg !693
  store i8* %5, i8** %storemerge5.i, align 8, !dbg !693
  br label %bb4.i, !dbg !694

bb4.i:                                            ; preds = %bb3.i, %bb1.i
  %6 = phi i8* [ %5, %bb3.i ], [ %13, %bb1.i ]
  %storemerge5.i = phi i8** [ %4, %bb3.i ], [ %storemerge.i, %bb1.i ]
  %7 = icmp eq i8* %6, null, !dbg !694
  br i1 %7, label %bb5.i, label %bb3.i, !dbg !694

bb5.i:                                            ; preds = %bb4.i
  %8 = getelementptr inbounds i8** %storemerge.i, i64 -1, !dbg !695
  br label %bb8.i, !dbg !695

bb6.i:                                            ; preds = %bb1.i
  %9 = getelementptr inbounds i8** %storemerge4.i, i64 1, !dbg !696
  br label %bb7.i, !dbg !696

bb7.i:                                            ; preds = %bb9.i, %bb6.i
  %storemerge4.i = phi i8** [ %9, %bb6.i ], [ getelementptr inbounds ([14 x i8*]* @forbid, i64 0, i64 0), %bb9.i ]
  %10 = load i8** %storemerge4.i, align 8, !dbg !696
  %11 = icmp eq i8* %10, null, !dbg !696
  br i1 %11, label %bb8.i, label %bb1.i, !dbg !696

bb8.i:                                            ; preds = %bb7.i, %bb5.i
  %cur.i.0 = phi i8** [ %8, %bb5.i ], [ %storemerge.i, %bb7.i ]
  %12 = getelementptr inbounds i8** %cur.i.0, i64 1, !dbg !691
  br label %bb9.i, !dbg !691

bb9.i:                                            ; preds = %bb8.i, %entry
  %storemerge.i = phi i8** [ %0, %entry ], [ %12, %bb8.i ]
  %13 = load i8** %storemerge.i, align 8, !dbg !691
  %14 = icmp eq i8* %13, null, !dbg !691
  br i1 %14, label %bb21.i, label %bb7.i, !dbg !691

bb12.i:                                           ; preds = %bb19.i
  %15 = call i64 @strlen(i8* %26) nounwind readonly, !dbg !697
  %16 = call i32 @strncmp(i8* %29, i8* %26, i64 %15) nounwind readonly, !dbg !697
  %17 = icmp eq i32 %16, 0, !dbg !697
  br i1 %17, label %bb13.i, label %bb18.i, !dbg !697

bb13.i:                                           ; preds = %bb12.i
  %18 = call i8* @strchr(i8* %29, i32 47) nounwind readonly, !dbg !698
  %19 = icmp eq i8* %18, null, !dbg !698
  br i1 %19, label %bb18.i, label %bb16.i, !dbg !698

bb15.i:                                           ; preds = %bb16.i
  %20 = getelementptr inbounds i8** %storemerge3.i, i64 1, !dbg !699
  %21 = load i8** %20, align 1, !dbg !699
  store i8* %21, i8** %storemerge3.i, align 8, !dbg !699
  br label %bb16.i, !dbg !700

bb16.i:                                           ; preds = %bb15.i, %bb13.i
  %22 = phi i8* [ %21, %bb15.i ], [ %29, %bb13.i ]
  %storemerge3.i = phi i8** [ %20, %bb15.i ], [ %storemerge1.i, %bb13.i ]
  %23 = icmp eq i8* %22, null, !dbg !700
  br i1 %23, label %bb17.i, label %bb15.i, !dbg !700

bb17.i:                                           ; preds = %bb16.i
  %24 = getelementptr inbounds i8** %storemerge1.i, i64 -1, !dbg !701
  br label %bb20.i, !dbg !701

bb18.i:                                           ; preds = %bb13.i, %bb12.i
  %25 = getelementptr inbounds i8** %storemerge2.i, i64 1, !dbg !702
  br label %bb19.i, !dbg !702

bb19.i:                                           ; preds = %bb21.i, %bb18.i
  %storemerge2.i = phi i8** [ %25, %bb18.i ], [ getelementptr inbounds ([4 x i8*]* @noslash, i64 0, i64 0), %bb21.i ]
  %26 = load i8** %storemerge2.i, align 8, !dbg !702
  %27 = icmp eq i8* %26, null, !dbg !702
  br i1 %27, label %bb20.i, label %bb12.i, !dbg !702

bb20.i:                                           ; preds = %bb19.i, %bb17.i
  %cur.i.1 = phi i8** [ %24, %bb17.i ], [ %storemerge1.i, %bb19.i ]
  %28 = getelementptr inbounds i8** %cur.i.1, i64 1, !dbg !703
  br label %bb21.i, !dbg !703

bb21.i:                                           ; preds = %bb20.i, %bb9.i
  %storemerge1.i = phi i8** [ %28, %bb20.i ], [ %0, %bb9.i ]
  %29 = load i8** %storemerge1.i, align 8, !dbg !703
  %30 = icmp eq i8* %29, null, !dbg !703
  br i1 %30, label %sanitize_env.exit, label %bb19.i, !dbg !703

sanitize_env.exit:                                ; preds = %bb21.i
  %31 = call i8* @setlocale(i32 6, i8* getelementptr inbounds ([1 x i8]* @.str34, i64 0, i64 0)) nounwind, !dbg !704
  %32 = call i8* @bindtextdomain(i8* getelementptr inbounds ([7 x i8]* @.str54, i64 0, i64 0), i8* getelementptr inbounds ([78 x i8]* @.str55, i64 0, i64 0)) nounwind, !dbg !705
  %33 = call i8* @textdomain(i8* getelementptr inbounds ([7 x i8]* @.str54, i64 0, i64 0)) nounwind, !dbg !706
  %34 = call i32 @getuid() nounwind, !dbg !707
  %35 = load i8** %argv, align 1, !dbg !708
  %36 = call i8* @strrchr(i8* %35, i32 47) nounwind readonly, !dbg !709
  %37 = icmp eq i8* %36, null, !dbg !718
  br i1 %37, label %Basename.exit, label %bb.i7, !dbg !718

bb.i7:                                            ; preds = %sanitize_env.exit
  %38 = getelementptr inbounds i8* %36, i64 1, !dbg !718
  br label %Basename.exit, !dbg !718

Basename.exit:                                    ; preds = %bb.i7, %sanitize_env.exit
  %storemerge.i9 = phi i8* [ %38, %bb.i7 ], [ %35, %sanitize_env.exit ]
  store i8* %storemerge.i9, i8** @Prog, align 8, !dbg !708
  call void @openlog(i8* getelementptr inbounds ([8 x i8]* @.str56, i64 0, i64 0), i32 1, i32 80) nounwind, !dbg !719
  %39 = load %struct.FILE** @stdout, align 8, !dbg !720
  call void @setbuf(%struct.FILE* noalias %39, i8* noalias null) nounwind, !dbg !720
  %40 = load %struct.FILE** @stderr, align 8, !dbg !721
  call void @setbuf(%struct.FILE* noalias %40, i8* noalias null) nounwind, !dbg !721
  br label %bb8.i91

bb.i82:                                           ; preds = %bb8.i91
  %41 = sext i32 %storemerge.i90 to i64
  %42 = getelementptr inbounds i8** %argv, i64 %41
  %43 = load i8** %42, align 1
  %44 = call i32 @strcmp(i8* %43, i8* getelementptr inbounds ([7 x i8]* @.str114, i64 0, i64 0)) nounwind readonly
  %45 = icmp eq i32 %44, 0
  br i1 %45, label %bb2.i84, label %bb1.i83

bb1.i83:                                          ; preds = %bb.i82
  %46 = call i32 @strcmp(i8* %43, i8* getelementptr inbounds ([3 x i8]* @.str57, i64 0, i64 0)) nounwind readonly
  %47 = icmp eq i32 %46, 0
  br i1 %47, label %bb2.i84, label %bb7.i89

bb2.i84:                                          ; preds = %bb1.i83, %bb.i82
  %48 = icmp eq i8* %newroot.i.1, null
  br i1 %48, label %bb4.i86, label %bb3.i85

bb3.i85:                                          ; preds = %bb2.i84
  %49 = load i8** @Prog, align 8
  %50 = load %struct.FILE** @stderr, align 8
  %51 = call i32 (%struct.FILE*, i8*, ...)* @fprintf(%struct.FILE* noalias %50, i8* noalias getelementptr inbounds ([29 x i8]* @.str1115, i64 0, i64 0), i8* %49) nounwind
  call void @exit(i32 3) noreturn nounwind
  unreachable

bb4.i86:                                          ; preds = %bb2.i84
  %52 = add nsw i32 %storemerge.i90, 1
  %53 = icmp eq i32 %52, %argc
  br i1 %53, label %bb5.i87, label %bb6.i88

bb5.i87:                                          ; preds = %bb4.i86
  %54 = load i8** @Prog, align 8
  %55 = load %struct.FILE** @stderr, align 8
  %56 = call i32 (%struct.FILE*, i8*, ...)* @fprintf(%struct.FILE* noalias %55, i8* noalias getelementptr inbounds ([38 x i8]* @.str2116, i64 0, i64 0), i8* %54, i8* %43) nounwind
  call void @exit(i32 3) noreturn nounwind
  unreachable

bb6.i88:                                          ; preds = %bb4.i86
  %57 = sext i32 %52 to i64
  %58 = getelementptr inbounds i8** %argv, i64 %57
  %59 = load i8** %58, align 1
  br label %bb7.i89

bb7.i89:                                          ; preds = %bb6.i88, %bb1.i83
  %newroot.i.0 = phi i8* [ %59, %bb6.i88 ], [ %newroot.i.1, %bb1.i83 ]
  %60 = add nsw i32 %storemerge.i90, 1
  br label %bb8.i91

bb8.i91:                                          ; preds = %bb7.i89, %Basename.exit
  %newroot.i.1 = phi i8* [ null, %Basename.exit ], [ %newroot.i.0, %bb7.i89 ]
  %storemerge.i90 = phi i32 [ 0, %Basename.exit ], [ %60, %bb7.i89 ]
  %61 = icmp slt i32 %storemerge.i90, %argc
  br i1 %61, label %bb.i82, label %bb9.i92

bb9.i92:                                          ; preds = %bb8.i91
  %62 = icmp eq i8* %newroot.i.1, null
  br i1 %62, label %process_root_flag.exit, label %bb10.i93

bb10.i93:                                         ; preds = %bb9.i92
  %63 = call i32 @getgid() nounwind
  %64 = call i32 @getgid() nounwind
  %65 = call i32 @setregid(i32 %64, i32 %63) nounwind
  %66 = icmp eq i32 %65, 0
  br i1 %66, label %bb.i.i94, label %bb1.i.i95

bb.i.i94:                                         ; preds = %bb10.i93
  %67 = call i32 @getuid() nounwind
  %68 = call i32 @getuid() nounwind
  %69 = call i32 @setreuid(i32 %68, i32 %67) nounwind
  %70 = icmp eq i32 %69, 0
  br i1 %70, label %bb2.i.i96, label %bb1.i.i95

bb1.i.i95:                                        ; preds = %bb.i.i94, %bb10.i93
  %71 = call i32* @__errno_location() nounwind readnone
  %72 = load i32* %71, align 4
  %73 = call i8* @strerror(i32 %72) nounwind
  %74 = load i8** @Prog, align 8
  %75 = load %struct.FILE** @stderr, align 8
  %76 = call i32 (%struct.FILE*, i8*, ...)* @fprintf(%struct.FILE* noalias %75, i8* noalias getelementptr inbounds ([36 x i8]* @.str3117, i64 0, i64 0), i8* %74, i8* %73) nounwind
  call void @exit(i32 1) noreturn nounwind
  unreachable

bb2.i.i96:                                        ; preds = %bb.i.i94
  %77 = load i8* %newroot.i.1, align 1
  %78 = icmp eq i8 %77, 47
  br i1 %78, label %bb4.i.i98, label %bb3.i.i97

bb3.i.i97:                                        ; preds = %bb2.i.i96
  %79 = load i8** @Prog, align 8
  %80 = load %struct.FILE** @stderr, align 8
  %81 = call i32 (%struct.FILE*, i8*, ...)* @fprintf(%struct.FILE* noalias %80, i8* noalias getelementptr inbounds ([30 x i8]* @.str4118, i64 0, i64 0), i8* %79, i8* %newroot.i.1) nounwind
  call void @exit(i32 3) noreturn nounwind
  unreachable

bb4.i.i98:                                        ; preds = %bb2.i.i96
  %82 = call i32 @access(i8* %newroot.i.1, i32 0) nounwind
  %83 = icmp eq i32 %82, 0
  br i1 %83, label %bb6.i.i100, label %bb5.i.i99

bb5.i.i99:                                        ; preds = %bb4.i.i98
  %84 = call i32* @__errno_location() nounwind readnone
  %85 = load i32* %84, align 4
  %86 = call i8* @strerror(i32 %85) nounwind
  %87 = load i8** @Prog, align 8
  %88 = load %struct.FILE** @stderr, align 8
  %89 = call i32 (%struct.FILE*, i8*, ...)* @fprintf(%struct.FILE* noalias %88, i8* noalias getelementptr inbounds ([43 x i8]* @.str5119, i64 0, i64 0), i8* %87, i8* %newroot.i.1, i8* %86) nounwind
  call void @exit(i32 3) noreturn nounwind
  unreachable

bb6.i.i100:                                       ; preds = %bb4.i.i98
  %90 = call i32 @chroot(i8* %newroot.i.1) nounwind
  %91 = icmp eq i32 %90, 0
  br i1 %91, label %process_root_flag.exit, label %bb7.i.i101

bb7.i.i101:                                       ; preds = %bb6.i.i100
  %92 = call i32* @__errno_location() nounwind readnone
  %93 = load i32* %92, align 4
  %94 = call i8* @strerror(i32 %93) nounwind
  %95 = load i8** @Prog, align 8
  %96 = load %struct.FILE** @stderr, align 8
  %97 = call i32 (%struct.FILE*, i8*, ...)* @fprintf(%struct.FILE* noalias %96, i8* noalias getelementptr inbounds ([42 x i8]* @.str6120, i64 0, i64 0), i8* %95, i8* %newroot.i.1, i8* %94) nounwind
  call void @exit(i32 3) noreturn nounwind
  unreachable

process_root_flag.exit:                           ; preds = %bb6.i.i100, %bb9.i92
  %98 = call i32 @access(i8* getelementptr inbounds (%struct.commonio_db* @gshadow_db, i64 0, i32 0, i64 0), i32 0) nounwind
  %99 = icmp eq i32 %98, 0
  %100 = call i8* @getlogin() nounwind, !dbg !722
  %101 = call i32 @getuid() nounwind, !dbg !745
  %102 = icmp eq i8* %100, null, !dbg !746
  br i1 %102, label %bb4.i129, label %bb.i110, !dbg !746

bb.i110:                                          ; preds = %process_root_flag.exit
  %103 = load i8* %100, align 1, !dbg !746
  %104 = icmp eq i8 %103, 0, !dbg !746
  br i1 %104, label %bb4.i129, label %bb1.i111, !dbg !746

bb1.i111:                                         ; preds = %bb.i110
  %105 = call noalias i8* @malloc(i64 48) nounwind, !dbg !747
  %106 = bitcast i8* %105 to %struct.passwd*, !dbg !747
  %107 = icmp eq i8* %105, null
  br i1 %107, label %bb.i.i112, label %bb1.i.i113, !dbg !772

bb.i.i112:                                        ; preds = %bb1.i111
  %108 = load %struct.FILE** @stderr, align 8, !dbg !773
  %109 = call i32 (%struct.FILE*, i8*, ...)* @fprintf(%struct.FILE* noalias %108, i8* noalias getelementptr inbounds ([19 x i8]* @.str150, i64 0, i64 0), i8* getelementptr inbounds ([10 x i8]* @.str1151, i64 0, i64 0)) nounwind, !dbg !773
  call void @exit(i32 13) noreturn nounwind, !dbg !774
  unreachable, !dbg !774

bb1.i.i113:                                       ; preds = %bb10.i.i122, %bb9.i.i121, %bb1.i111
  %buffer.i.i.0 = phi i8* [ null, %bb1.i111 ], [ %110, %bb9.i.i121 ], [ %110, %bb10.i.i122 ]
  %length.i.i.0 = phi i64 [ 256, %bb1.i111 ], [ %122, %bb9.i.i121 ], [ -1, %bb10.i.i122 ]
  store %struct.passwd* null, %struct.passwd** %resbuf.i.i, align 8, !dbg !775
  %110 = call i8* @realloc(i8* %buffer.i.i.0, i64 %length.i.i.0) nounwind, !dbg !777
  %111 = icmp eq i8* %110, null, !dbg !778
  br i1 %111, label %bb2.i.i114, label %bb3.i.i115, !dbg !778

bb2.i.i114:                                       ; preds = %bb1.i.i113
  %112 = load %struct.FILE** @stderr, align 8, !dbg !779
  %113 = call i32 (%struct.FILE*, i8*, ...)* @fprintf(%struct.FILE* noalias %112, i8* noalias getelementptr inbounds ([19 x i8]* @.str150, i64 0, i64 0), i8* getelementptr inbounds ([10 x i8]* @.str1151, i64 0, i64 0)) nounwind, !dbg !779
  call void @exit(i32 13) noreturn nounwind, !dbg !780
  unreachable, !dbg !780

bb3.i.i115:                                       ; preds = %bb1.i.i113
  %114 = call i32* @__errno_location() nounwind readnone, !dbg !781
  store i32 0, i32* %114, align 4, !dbg !781
  %115 = call i32 @getpwnam_r(i8* noalias %100, %struct.passwd* noalias %106, i8* noalias %110, i64 %length.i.i.0, %struct.passwd** noalias %resbuf.i.i) nounwind, !dbg !782
  %116 = icmp eq i32 %115, 0, !dbg !783
  br i1 %116, label %bb4.i.i116, label %bb6.i.i118, !dbg !783

bb4.i.i116:                                       ; preds = %bb3.i.i115
  %117 = load %struct.passwd** %resbuf.i.i, align 8, !dbg !783
  %118 = icmp eq %struct.passwd* %117, %106, !dbg !783
  br i1 %118, label %xgetpwnam.exit.i, label %bb6.i.i118, !dbg !783

bb6.i.i118:                                       ; preds = %bb4.i.i116, %bb3.i.i115
  %119 = load i32* %114, align 4, !dbg !784
  %120 = icmp eq i32 %119, 34, !dbg !784
  br i1 %120, label %bb8.i.i120, label %bb7.i.i119, !dbg !784

bb7.i.i119:                                       ; preds = %bb6.i.i118
  call void @free(i8* %110) nounwind, !dbg !785
  call void @free(i8* %105) nounwind, !dbg !786
  br label %bb4.i129, !dbg !787

bb8.i.i120:                                       ; preds = %bb6.i.i118
  %121 = icmp ult i64 %length.i.i.0, 4611686018427387904
  br i1 %121, label %bb9.i.i121, label %bb10.i.i122, !dbg !788

bb9.i.i121:                                       ; preds = %bb8.i.i120
  %122 = shl i64 %length.i.i.0, 2
  br label %bb1.i.i113, !dbg !789

bb10.i.i122:                                      ; preds = %bb8.i.i120
  %123 = icmp eq i64 %length.i.i.0, -1, !dbg !790
  br i1 %123, label %bb13.i.i126, label %bb1.i.i113, !dbg !790

bb13.i.i126:                                      ; preds = %bb10.i.i122
  call void @free(i8* %110) nounwind, !dbg !791
  call void @free(i8* %105) nounwind, !dbg !792
  br label %bb4.i129, !dbg !793

xgetpwnam.exit.i:                                 ; preds = %bb4.i.i116
  %124 = call fastcc %struct.passwd* @__pw_dup(%struct.passwd* %106) nounwind, !dbg !794
  call void @free(i8* %110) nounwind, !dbg !796
  call void @free(i8* %105) nounwind, !dbg !797
  %125 = icmp eq %struct.passwd* %124, null, !dbg !798
  br i1 %125, label %bb4.i129, label %bb2.i127, !dbg !798

bb2.i127:                                         ; preds = %xgetpwnam.exit.i
  %126 = getelementptr inbounds %struct.passwd* %124, i64 0, i32 2, !dbg !798
  %127 = load i32* %126, align 8, !dbg !798
  %128 = icmp eq i32 %127, %101, !dbg !798
  br i1 %128, label %get_my_pwent.exit, label %bb4.i129, !dbg !798

bb4.i129:                                         ; preds = %bb2.i127, %xgetpwnam.exit.i, %bb13.i.i126, %bb7.i.i119, %bb.i110, %process_root_flag.exit
  %129 = call noalias i8* @malloc(i64 48) nounwind, !dbg !799
  %130 = bitcast i8* %129 to %struct.passwd*, !dbg !799
  %131 = icmp eq i8* %129, null
  br i1 %131, label %bb.i7.i, label %bb1.i8.i, !dbg !822

bb.i7.i:                                          ; preds = %bb4.i129
  %132 = load %struct.FILE** @stderr, align 8, !dbg !823
  %133 = call i32 (%struct.FILE*, i8*, ...)* @fprintf(%struct.FILE* noalias %132, i8* noalias getelementptr inbounds ([19 x i8]* @.str150, i64 0, i64 0), i8* getelementptr inbounds ([10 x i8]* @.str1154, i64 0, i64 0)) nounwind, !dbg !823
  call void @exit(i32 13) noreturn nounwind, !dbg !824
  unreachable, !dbg !824

bb1.i8.i:                                         ; preds = %bb10.i17.i, %bb9.i16.i, %bb4.i129
  %length.i4.i.0 = phi i64 [ 256, %bb4.i129 ], [ %147, %bb9.i16.i ], [ -1, %bb10.i17.i ]
  %buffer.i3.i.0 = phi i8* [ null, %bb4.i129 ], [ %134, %bb9.i16.i ], [ %134, %bb10.i17.i ]
  store %struct.passwd* null, %struct.passwd** %resbuf.i5.i, align 8, !dbg !825
  %134 = call i8* @realloc(i8* %buffer.i3.i.0, i64 %length.i4.i.0) nounwind, !dbg !827
  %135 = icmp eq i8* %134, null, !dbg !828
  br i1 %135, label %bb2.i9.i, label %bb3.i10.i, !dbg !828

bb2.i9.i:                                         ; preds = %bb1.i8.i
  %136 = load %struct.FILE** @stderr, align 8, !dbg !829
  %137 = call i32 (%struct.FILE*, i8*, ...)* @fprintf(%struct.FILE* noalias %136, i8* noalias getelementptr inbounds ([19 x i8]* @.str150, i64 0, i64 0), i8* getelementptr inbounds ([10 x i8]* @.str1154, i64 0, i64 0)) nounwind, !dbg !829
  call void @exit(i32 13) noreturn nounwind, !dbg !830
  unreachable, !dbg !830

bb3.i10.i:                                        ; preds = %bb1.i8.i
  %138 = call i32* @__errno_location() nounwind readnone, !dbg !831
  store i32 0, i32* %138, align 4, !dbg !831
  %139 = call i32 @getpwuid_r(i32 %101, %struct.passwd* noalias %130, i8* noalias %134, i64 %length.i4.i.0, %struct.passwd** noalias %resbuf.i5.i) nounwind, !dbg !832
  %140 = icmp eq i32 %139, 0, !dbg !833
  br i1 %140, label %bb4.i11.i, label %bb6.i13.i, !dbg !833

bb4.i11.i:                                        ; preds = %bb3.i10.i
  %141 = load %struct.passwd** %resbuf.i5.i, align 8, !dbg !833
  %142 = icmp eq %struct.passwd* %141, %130, !dbg !833
  br i1 %142, label %bb5.i12.i, label %bb6.i13.i, !dbg !833

bb5.i12.i:                                        ; preds = %bb4.i11.i
  %143 = call fastcc %struct.passwd* @__pw_dup(%struct.passwd* %130) nounwind, !dbg !834
  call void @free(i8* %134) nounwind, !dbg !836
  call void @free(i8* %129) nounwind, !dbg !837
  br label %get_my_pwent.exit, !dbg !838

bb6.i13.i:                                        ; preds = %bb4.i11.i, %bb3.i10.i
  %144 = load i32* %138, align 4, !dbg !839
  %145 = icmp eq i32 %144, 34, !dbg !839
  br i1 %145, label %bb8.i15.i, label %bb7.i14.i, !dbg !839

bb7.i14.i:                                        ; preds = %bb6.i13.i
  call void @free(i8* %134) nounwind, !dbg !840
  call void @free(i8* %129) nounwind, !dbg !841
  br label %bb, !dbg !842

bb8.i15.i:                                        ; preds = %bb6.i13.i
  %146 = icmp ult i64 %length.i4.i.0, 4611686018427387904
  br i1 %146, label %bb9.i16.i, label %bb10.i17.i, !dbg !843

bb9.i16.i:                                        ; preds = %bb8.i15.i
  %147 = shl i64 %length.i4.i.0, 2
  br label %bb1.i8.i, !dbg !844

bb10.i17.i:                                       ; preds = %bb8.i15.i
  %148 = icmp eq i64 %length.i4.i.0, -1, !dbg !845
  br i1 %148, label %bb13.i21.i, label %bb1.i8.i, !dbg !845

bb13.i21.i:                                       ; preds = %bb10.i17.i
  call void @free(i8* %134) nounwind, !dbg !846
  call void @free(i8* %129) nounwind, !dbg !847
  br label %bb, !dbg !848

get_my_pwent.exit:                                ; preds = %bb5.i12.i, %bb2.i127
  %storemerge.i130 = phi %struct.passwd* [ %124, %bb2.i127 ], [ %143, %bb5.i12.i ]
  %149 = icmp eq %struct.passwd* %storemerge.i130, null, !dbg !849
  br i1 %149, label %bb, label %bb7, !dbg !849

bb:                                               ; preds = %get_my_pwent.exit, %bb13.i21.i, %bb7.i14.i
  %150 = load i8** @Prog, align 8, !dbg !850
  %151 = load %struct.FILE** @stderr, align 8, !dbg !850
  %152 = call i32 (%struct.FILE*, i8*, ...)* @fprintf(%struct.FILE* noalias %151, i8* noalias getelementptr inbounds ([38 x i8]* @.str58, i64 0, i64 0), i8* %150) nounwind, !dbg !850
  %153 = call i8* @setlocale(i32 6, i8* null) nounwind, !dbg !851
  %154 = icmp eq i8* %153, null, !dbg !851
  br i1 %154, label %bb4, label %bb2, !dbg !851

bb2:                                              ; preds = %bb
  %155 = call noalias i8* @strdup(i8* %153) nounwind, !dbg !851
  %156 = icmp eq i8* %155, null, !dbg !851
  br i1 %156, label %bb4, label %bb3, !dbg !851

bb3:                                              ; preds = %bb2
  %157 = call i8* @setlocale(i32 6, i8* getelementptr inbounds ([2 x i8]* @.str25, i64 0, i64 0)) nounwind, !dbg !851
  br label %bb4, !dbg !851

bb4:                                              ; preds = %bb3, %bb2, %bb
  %saved_locale.0 = phi i8* [ null, %bb ], [ %155, %bb2 ], [ %155, %bb3 ]
  %158 = call i32 @getuid() nounwind, !dbg !851
  %159 = zext i32 %158 to i64, !dbg !851
  call void (i32, i8*, ...)* @syslog(i32 4, i8* getelementptr inbounds ([55 x i8]* @.str59, i64 0, i64 0), i64 %159) nounwind, !dbg !851
  %160 = icmp eq i8* %saved_locale.0, null, !dbg !851
  br i1 %160, label %bb6, label %bb5, !dbg !851

bb5:                                              ; preds = %bb4
  %161 = call i8* @setlocale(i32 6, i8* %saved_locale.0) nounwind, !dbg !851
  call void @free(i8* %saved_locale.0) nounwind, !dbg !851
  br label %bb6, !dbg !851

bb6:                                              ; preds = %bb5, %bb4
  call void @exit(i32 1) noreturn nounwind, !dbg !853
  unreachable, !dbg !853

bb7:                                              ; preds = %get_my_pwent.exit
  %162 = getelementptr inbounds %struct.passwd* %storemerge.i130, i64 0, i32 0, !dbg !854
  %163 = load i8** %162, align 8, !dbg !854
  %164 = call i64 @strlen(i8* %163) nounwind readonly, !dbg !855
  %165 = add i64 %164, 1, !dbg !855
  %166 = call fastcc i8* @xmalloc(i64 %165) nounwind, !dbg !855
  %167 = call i8* @strcpy(i8* noalias %166, i8* noalias %163) nounwind, !dbg !855
  store i8* %167, i8** @myname, align 8, !dbg !854
  %168 = call i32 @atexit(void ()* @do_cleanups) nounwind, !dbg !856
  %169 = icmp eq i32 %168, 0, !dbg !856
  br i1 %169, label %bb30.i.preheader, label %bb8, !dbg !856

bb30.i.preheader:                                 ; preds = %bb7
  %170 = icmp slt i32 %argc, 1
  br label %bb1.i.i.i2

bb8:                                              ; preds = %bb7
  %171 = load i8** @Prog, align 8, !dbg !857
  %172 = load %struct.FILE** @stderr, align 8, !dbg !857
  %173 = call i32 (%struct.FILE*, i8*, ...)* @fprintf(%struct.FILE* noalias %172, i8* noalias getelementptr inbounds ([30 x i8]* @.str60, i64 0, i64 0), i8* %171) nounwind, !dbg !857
  call void @exit(i32 1) noreturn nounwind, !dbg !858
  unreachable, !dbg !858

bb1.i138:                                         ; preds = %LeafBlock15
  store i1 true, i1* @aflg.b
  store i8* %415, i8** @user, align 8, !dbg !859
  %174 = call %struct.passwd* @getpwnam(i8* %415) nounwind, !dbg !862
  %175 = icmp eq %struct.passwd* %174, null, !dbg !862
  br i1 %175, label %bb2.i139, label %bb1.i.i.i2, !dbg !862

bb2.i139:                                         ; preds = %bb1.i138
  %176 = load i8** @user, align 8, !dbg !863
  %177 = load i8** @Prog, align 8, !dbg !863
  %178 = load %struct.FILE** @stderr, align 8, !dbg !863
  %179 = call i32 (%struct.FILE*, i8*, ...)* @fprintf(%struct.FILE* noalias %178, i8* noalias getelementptr inbounds ([30 x i8]* @.str10, i64 0, i64 0), i8* %177, i8* %176) nounwind, !dbg !863
  call void @exit(i32 3) noreturn nounwind, !dbg !864
  unreachable, !dbg !864

bb4.i141:                                         ; preds = %LeafBlock1
  br i1 %99, label %bb9.i143, label %bb8.i142, !dbg !865

bb8.i142:                                         ; preds = %bb4.i141
  %180 = load i8** @Prog, align 8, !dbg !866
  %181 = load %struct.FILE** @stderr, align 8, !dbg !866
  %182 = call i32 (%struct.FILE*, i8*, ...)* @fprintf(%struct.FILE* noalias %181, i8* noalias getelementptr inbounds ([44 x i8]* @.str13, i64 0, i64 0), i8* %180) nounwind, !dbg !866
  call void @exit(i32 17) noreturn nounwind, !dbg !867
  unreachable, !dbg !867

bb9.i143:                                         ; preds = %bb4.i141
  store i8* %optarg.0, i8** @admins, align 8, !dbg !868
  %183 = call fastcc zeroext i8 @is_valid_user_list(i8* %optarg.0) nounwind, !dbg !869
  %toBool10not.i = icmp eq i8 %183, 0
  br i1 %toBool10not.i, label %bb14.i144, label %bb15.i145, !dbg !869

bb14.i144:                                        ; preds = %bb9.i143
  call void @exit(i32 3) noreturn nounwind, !dbg !870
  unreachable, !dbg !870

bb15.i145:                                        ; preds = %bb9.i143
  store i1 true, i1* @Aflg.b
  br label %bb1.i.i.i2, !dbg !871

bb16.i146:                                        ; preds = %LeafBlock17
  store i1 true, i1* @dflg.b
  store i8* %415, i8** @user, align 8, !dbg !872
  br label %bb1.i.i.i2, !dbg !872

bb18.i148:                                        ; preds = %LeafBlock23
  call fastcc void @usage(i32 0) nounwind, !dbg !873
  unreachable

bb19.i149:                                        ; preds = %LeafBlock3
  store i8* %optarg.0, i8** @members, align 8, !dbg !874
  %184 = call fastcc zeroext i8 @is_valid_user_list(i8* %optarg.0) nounwind, !dbg !875
  %toBool20not.i = icmp eq i8 %184, 0
  br i1 %toBool20not.i, label %bb24.i150, label %bb25.i151, !dbg !875

bb24.i150:                                        ; preds = %bb19.i149
  call void @exit(i32 3) noreturn nounwind, !dbg !876
  unreachable, !dbg !876

bb25.i151:                                        ; preds = %bb19.i149
  store i1 true, i1* @Mflg.b
  br label %bb1.i.i.i2, !dbg !877

bb27.i:                                           ; preds = %LeafBlock25
  store i1 true, i1* @rflg.b
  br label %bb1.i.i.i2, !dbg !878

bb28.i:                                           ; preds = %LeafBlock7
  store i1 true, i1* @Rflg.b
  br label %bb1.i.i.i2, !dbg !879

bb29.i:                                           ; preds = %LeafBlock, %LeafBlock1, %LeafBlock3, %LeafBlock5, %LeafBlock7, %LeafBlock15, %LeafBlock17, %LeafBlock21, %LeafBlock23, %LeafBlock25
  call fastcc void @usage(i32 2) nounwind, !dbg !880
  unreachable

bb1.i.i.i2:                                       ; preds = %LeafBlock5, %LeafBlock21, %bb28.i, %bb27.i, %bb25.i151, %bb16.i146, %bb15.i145, %bb1.i138, %bb30.i.preheader
  %185 = phi i32 [ 1, %bb30.i.preheader ], [ %optind.1, %bb15.i145 ], [ %optind.1, %bb25.i151 ], [ %optind.1, %LeafBlock5 ], [ %optind.1, %bb28.i ], [ %414, %bb1.i138 ], [ %414, %bb16.i146 ], [ %414, %LeafBlock21 ], [ %414, %bb27.i ]
  store i32 %185, i32* getelementptr inbounds (%struct._getopt_data* @getopt_data, i64 0, i32 0), align 32
  store i32 1, i32* getelementptr inbounds (%struct._getopt_data* @getopt_data, i64 0, i32 1), align 4
  br i1 %170, label %getopt_long.exit.thread, label %bb3.i.i.i4

bb3.i.i.i4:                                       ; preds = %bb1.i.i.i2
  store i8* null, i8** getelementptr inbounds (%struct._getopt_data* @getopt_data, i64 0, i32 3), align 16
  %186 = icmp eq i32 %185, 0
  br i1 %186, label %bb6.i.i.i, label %bb4.i.i.i5

bb4.i.i.i5:                                       ; preds = %bb3.i.i.i4
  %187 = load i32* getelementptr inbounds (%struct._getopt_data* @getopt_data, i64 0, i32 4), align 8
  %188 = icmp eq i32 %187, 0
  br i1 %188, label %bb5.i.i.i, label %bb8.i.i.i

bb5.i.i.i:                                        ; preds = %bb4.i.i.i5
  br i1 %186, label %bb6.i.i.i, label %bb3.i.i.i.i

bb6.i.i.i:                                        ; preds = %bb5.i.i.i, %bb3.i.i.i4
  store i32 1, i32* getelementptr inbounds (%struct._getopt_data* @getopt_data, i64 0, i32 0), align 32
  br label %bb3.i.i.i.i

bb3.i.i.i.i:                                      ; preds = %bb6.i.i.i, %bb5.i.i.i
  %189 = phi i32 [ 1, %bb6.i.i.i ], [ %185, %bb5.i.i.i ]
  store i32 %189, i32* getelementptr inbounds (%struct._getopt_data* @getopt_data, i64 0, i32 9), align 4
  store i32 %189, i32* getelementptr inbounds (%struct._getopt_data* @getopt_data, i64 0, i32 8), align 16
  store i8* null, i8** getelementptr inbounds (%struct._getopt_data* @getopt_data, i64 0, i32 5), align 32
  %190 = call i8* @getenv(i8* getelementptr inbounds ([16 x i8]* @.str70, i64 0, i64 0)) nounwind
  %191 = icmp ne i8* %190, null
  %192 = zext i1 %191 to i32
  store i32 %192, i32* getelementptr inbounds (%struct._getopt_data* @getopt_data, i64 0, i32 7), align 4
  %storemerge = select i1 %191, i32 0, i32 1
  store i32 %storemerge, i32* getelementptr inbounds (%struct._getopt_data* @getopt_data, i64 0, i32 6), align 8
  store i32 1, i32* getelementptr inbounds (%struct._getopt_data* @getopt_data, i64 0, i32 4), align 8
  br label %bb8.i.i.i

bb8.i.i.i:                                        ; preds = %bb3.i.i.i.i, %bb4.i.i.i5
  %193 = load i8** getelementptr inbounds (%struct._getopt_data* @getopt_data, i64 0, i32 5), align 32
  %194 = icmp eq i8* %193, null
  br i1 %194, label %bb10.i.i.i, label %bb9.i.i.i

bb9.i.i.i:                                        ; preds = %bb8.i.i.i
  %195 = load i8* %193, align 1
  %196 = icmp eq i8 %195, 0
  br i1 %196, label %bb10.i.i.i, label %bb49.i.i.i

bb10.i.i.i:                                       ; preds = %bb9.i.i.i, %bb8.i.i.i
  %197 = load i32* getelementptr inbounds (%struct._getopt_data* @getopt_data, i64 0, i32 9), align 4
  %198 = load i32* getelementptr inbounds (%struct._getopt_data* @getopt_data, i64 0, i32 0), align 32
  %199 = icmp sgt i32 %197, %198
  br i1 %199, label %bb11.i.i.i, label %bb12.i.i.i

bb11.i.i.i:                                       ; preds = %bb10.i.i.i
  store i32 %198, i32* getelementptr inbounds (%struct._getopt_data* @getopt_data, i64 0, i32 9), align 4
  br label %bb12.i.i.i

bb12.i.i.i:                                       ; preds = %bb11.i.i.i, %bb10.i.i.i
  %200 = phi i32 [ %198, %bb11.i.i.i ], [ %197, %bb10.i.i.i ]
  %201 = load i32* getelementptr inbounds (%struct._getopt_data* @getopt_data, i64 0, i32 8), align 16
  %202 = icmp sgt i32 %201, %198
  br i1 %202, label %bb13.i.i.i, label %bb14.i.i.i

bb13.i.i.i:                                       ; preds = %bb12.i.i.i
  store i32 %198, i32* getelementptr inbounds (%struct._getopt_data* @getopt_data, i64 0, i32 8), align 16
  br label %bb14.i.i.i

bb14.i.i.i:                                       ; preds = %bb13.i.i.i, %bb12.i.i.i
  %203 = phi i32 [ %198, %bb13.i.i.i ], [ %201, %bb12.i.i.i ]
  %204 = load i32* getelementptr inbounds (%struct._getopt_data* @getopt_data, i64 0, i32 6), align 8
  %205 = icmp eq i32 %204, 1
  br i1 %205, label %bb15.i.i.i, label %bb26.i.i.i

bb15.i.i.i:                                       ; preds = %bb14.i.i.i
  %206 = icmp eq i32 %203, %200
  %207 = icmp eq i32 %200, %198
  br i1 %206, label %bb18.i.i.i, label %bb16.i.i.i

bb16.i.i.i:                                       ; preds = %bb15.i.i.i
  br i1 %207, label %bb22.i.i.i, label %bb17.i.i.i

bb17.i.i.i:                                       ; preds = %bb16.i.i.i
  call fastcc void @exchange(i8** %argv, %struct._getopt_data* @getopt_data) nounwind
  %.pre.pre = load i32* getelementptr inbounds (%struct._getopt_data* @getopt_data, i64 0, i32 0), align 32
  br label %bb22.i.i.i

bb18.i.i.i:                                       ; preds = %bb15.i.i.i
  br i1 %207, label %bb22.i.i.i, label %bb19.i.i.i

bb19.i.i.i:                                       ; preds = %bb18.i.i.i
  store i32 %198, i32* getelementptr inbounds (%struct._getopt_data* @getopt_data, i64 0, i32 8), align 16
  br label %bb22.i.i.i

bb21.i.i.i:                                       ; preds = %bb24.i.i.i, %bb23.i.i.i
  %208 = add nsw i32 %209, 1
  store i32 %208, i32* getelementptr inbounds (%struct._getopt_data* @getopt_data, i64 0, i32 0), align 32
  br label %bb22.i.i.i

bb22.i.i.i:                                       ; preds = %bb21.i.i.i, %bb19.i.i.i, %bb18.i.i.i, %bb17.i.i.i, %bb16.i.i.i
  %209 = phi i32 [ %208, %bb21.i.i.i ], [ %198, %bb19.i.i.i ], [ %198, %bb18.i.i.i ], [ %.pre.pre, %bb17.i.i.i ], [ %198, %bb16.i.i.i ]
  %210 = icmp slt i32 %209, %argc
  br i1 %210, label %bb23.i.i.i, label %bb25.i.i.i

bb23.i.i.i:                                       ; preds = %bb22.i.i.i
  %211 = sext i32 %209 to i64
  %212 = getelementptr inbounds i8** %argv, i64 %211
  %213 = load i8** %212, align 1
  %214 = load i8* %213, align 1
  %215 = icmp eq i8 %214, 45
  br i1 %215, label %bb24.i.i.i, label %bb21.i.i.i

bb24.i.i.i:                                       ; preds = %bb23.i.i.i
  %216 = getelementptr inbounds i8* %213, i64 1
  %217 = load i8* %216, align 1
  %218 = icmp eq i8 %217, 0
  br i1 %218, label %bb21.i.i.i, label %bb25.i.i.i

bb25.i.i.i:                                       ; preds = %bb24.i.i.i, %bb22.i.i.i
  store i32 %209, i32* getelementptr inbounds (%struct._getopt_data* @getopt_data, i64 0, i32 9), align 4
  br label %bb26.i.i.i

bb26.i.i.i:                                       ; preds = %bb25.i.i.i, %bb14.i.i.i
  %219 = phi i32 [ %209, %bb25.i.i.i ], [ %200, %bb14.i.i.i ]
  %220 = phi i32 [ %209, %bb25.i.i.i ], [ %198, %bb14.i.i.i ]
  %221 = icmp eq i32 %220, %argc
  br i1 %221, label %bb35.i.i.i, label %bb27.i.i.i

bb27.i.i.i:                                       ; preds = %bb26.i.i.i
  %222 = sext i32 %220 to i64
  %223 = getelementptr inbounds i8** %argv, i64 %222
  %224 = load i8** %223, align 1
  %225 = call i32 @strcmp(i8* %224, i8* getelementptr inbounds ([3 x i8]* @.str171, i64 0, i64 0)) nounwind readonly
  %226 = icmp eq i32 %225, 0
  br i1 %226, label %bb28.i.i.i, label %bb34.i.i.i

bb28.i.i.i:                                       ; preds = %bb27.i.i.i
  %227 = add nsw i32 %220, 1
  store i32 %227, i32* getelementptr inbounds (%struct._getopt_data* @getopt_data, i64 0, i32 0), align 32
  %228 = load i32* getelementptr inbounds (%struct._getopt_data* @getopt_data, i64 0, i32 8), align 16
  %229 = icmp eq i32 %228, %219
  br i1 %229, label %bb32.i.i.i, label %bb29.i.i.i

bb29.i.i.i:                                       ; preds = %bb28.i.i.i
  %230 = icmp eq i32 %219, %227
  br i1 %230, label %bb31.i.i.i, label %bb30.i.i.i

bb30.i.i.i:                                       ; preds = %bb29.i.i.i
  call fastcc void @exchange(i8** %argv, %struct._getopt_data* @getopt_data) nounwind
  br label %bb34.i.i.i.thread

bb31.i.i.i:                                       ; preds = %bb29.i.i.i
  br i1 %229, label %bb32.i.i.i, label %bb34.i.i.i.thread

bb32.i.i.i:                                       ; preds = %bb31.i.i.i, %bb28.i.i.i
  store i32 %227, i32* getelementptr inbounds (%struct._getopt_data* @getopt_data, i64 0, i32 8), align 16
  br label %bb34.i.i.i.thread

bb34.i.i.i.thread:                                ; preds = %bb32.i.i.i, %bb31.i.i.i, %bb30.i.i.i
  store i32 %argc, i32* getelementptr inbounds (%struct._getopt_data* @getopt_data, i64 0, i32 9), align 4
  store i32 %argc, i32* getelementptr inbounds (%struct._getopt_data* @getopt_data, i64 0, i32 0), align 32
  br label %bb35.i.i.i

bb34.i.i.i:                                       ; preds = %bb27.i.i.i
  %231 = icmp eq i32 %220, %argc
  br i1 %231, label %bb35.i.i.i, label %bb38.i.i.i

bb35.i.i.i:                                       ; preds = %bb34.i.i.i, %bb34.i.i.i.thread, %bb26.i.i.i
  %232 = phi i32 [ %argc, %bb34.i.i.i.thread ], [ %219, %bb34.i.i.i ], [ %219, %bb26.i.i.i ]
  %233 = load i32* getelementptr inbounds (%struct._getopt_data* @getopt_data, i64 0, i32 8), align 16
  %234 = icmp eq i32 %233, %232
  br i1 %234, label %getopt_long.exit.thread, label %bb36.i.i.i

bb36.i.i.i:                                       ; preds = %bb35.i.i.i
  store i32 %233, i32* getelementptr inbounds (%struct._getopt_data* @getopt_data, i64 0, i32 0), align 32
  br label %getopt_long.exit.thread

bb38.i.i.i:                                       ; preds = %bb34.i.i.i
  %235 = sext i32 %220 to i64
  %236 = getelementptr inbounds i8** %argv, i64 %235
  %237 = load i8** %236, align 1
  %238 = load i8* %237, align 1
  %239 = icmp eq i8 %238, 45
  br i1 %239, label %bb39.i.i.i, label %bb40.i.i.i

bb39.i.i.i:                                       ; preds = %bb38.i.i.i
  %240 = getelementptr inbounds i8* %237, i64 1
  %241 = load i8* %240, align 1
  %Pivot7 = icmp slt i8 %241, 45
  br i1 %Pivot7, label %LeafBlock2, label %LeafBlock4

LeafBlock4:                                       ; preds = %bb39.i.i.i
  %SwitchLeaf5 = icmp eq i8 %241, 45
  br i1 %SwitchLeaf5, label %bb47.i.i.i, label %bb46.i.i.i

LeafBlock2:                                       ; preds = %bb39.i.i.i
  %SwitchLeaf3 = icmp eq i8 %241, 0
  br i1 %SwitchLeaf3, label %bb40.i.i.i, label %bb46.i.i.i

bb40.i.i.i:                                       ; preds = %LeafBlock2, %bb38.i.i.i
  %242 = load i32* getelementptr inbounds (%struct._getopt_data* @getopt_data, i64 0, i32 6), align 8
  %243 = icmp eq i32 %242, 0
  br i1 %243, label %getopt_long.exit.thread, label %bb42.i.i.i

bb42.i.i.i:                                       ; preds = %bb40.i.i.i
  store i8* %237, i8** getelementptr inbounds (%struct._getopt_data* @getopt_data, i64 0, i32 3), align 16
  %244 = add nsw i32 %220, 1
  store i32 %244, i32* getelementptr inbounds (%struct._getopt_data* @getopt_data, i64 0, i32 0), align 32
  br label %getopt_long.exit.thread

bb46.i.i.i:                                       ; preds = %LeafBlock2, %LeafBlock4
  br label %bb47.i.i.i

bb47.i.i.i:                                       ; preds = %bb46.i.i.i, %LeafBlock4
  %storemerge4.i.i.i = phi i64 [ 1, %bb46.i.i.i ], [ 2, %LeafBlock4 ]
  %245 = getelementptr inbounds i8* %237, i64 %storemerge4.i.i.i
  store i8* %245, i8** getelementptr inbounds (%struct._getopt_data* @getopt_data, i64 0, i32 5), align 32
  br label %bb49.i.i.i

bb49.i.i.i:                                       ; preds = %bb47.i.i.i, %bb9.i.i.i
  %246 = phi i8* [ %245, %bb47.i.i.i ], [ %193, %bb9.i.i.i ]
  %247 = load i32* getelementptr inbounds (%struct._getopt_data* @getopt_data, i64 0, i32 0), align 32
  %248 = sext i32 %247 to i64
  %249 = getelementptr inbounds i8** %argv, i64 %248
  %250 = load i8** %249, align 1
  %251 = getelementptr inbounds i8* %250, i64 1
  %252 = load i8* %251, align 1
  %253 = icmp eq i8 %252, 45
  br i1 %253, label %bb55.i.i.i, label %bb106.i.i.i

bb54.i.i.i:                                       ; preds = %LeafBlock9, %LeafBlock11
  %254 = getelementptr inbounds i8* %storemerge1.i.i.i, i64 1
  br label %bb55.i.i.i

bb55.i.i.i:                                       ; preds = %bb54.i.i.i, %bb49.i.i.i
  %storemerge1.i.i.i = phi i8* [ %254, %bb54.i.i.i ], [ %246, %bb49.i.i.i ]
  %255 = load i8* %storemerge1.i.i.i, align 1
  %Pivot15 = icmp slt i8 %255, 61
  br i1 %Pivot15, label %LeafBlock9, label %LeafBlock11

LeafBlock11:                                      ; preds = %bb55.i.i.i
  %SwitchLeaf12 = icmp eq i8 %255, 61
  br i1 %SwitchLeaf12, label %bb57.i.i.i, label %bb54.i.i.i

LeafBlock9:                                       ; preds = %bb55.i.i.i
  %SwitchLeaf10 = icmp eq i8 %255, 0
  br i1 %SwitchLeaf10, label %bb57.i.i.i, label %bb54.i.i.i

bb57.i.i.i:                                       ; preds = %LeafBlock9, %LeafBlock11
  %256 = ptrtoint i8* %storemerge1.i.i.i to i64
  %257 = trunc i64 %256 to i32
  br label %bb69.i.i.i

bb58.i.i.i:                                       ; preds = %bb69.i.i.i
  %258 = ptrtoint i8* %286 to i64
  %259 = sub nsw i64 %256, %258
  %260 = call i32 @strncmp(i8* %288, i8* %286, i64 %259) nounwind readonly
  %261 = icmp eq i32 %260, 0
  br i1 %261, label %bb59.i.i.i, label %bb68.i.i.i

bb59.i.i.i:                                       ; preds = %bb58.i.i.i
  %262 = ptrtoint i8* %246 to i64
  %263 = trunc i64 %262 to i32
  %264 = sub i32 %257, %263
  %265 = call i64 @strlen(i8* %288) nounwind readonly
  %266 = trunc i64 %265 to i32
  %267 = icmp eq i32 %264, %266
  br i1 %267, label %bb70.i.i.i, label %bb61.i.i.i

bb61.i.i.i:                                       ; preds = %bb59.i.i.i
  %268 = icmp eq %struct.option* %pfound.i.i.i.2, null
  br i1 %268, label %bb68.i.i.i, label %bb64.i.i.i

bb64.i.i.i:                                       ; preds = %bb61.i.i.i
  %269 = getelementptr inbounds %struct.option* %pfound.i.i.i.2, i64 0, i32 1
  %270 = load i32* %269, align 8
  %271 = getelementptr inbounds %struct.option* %p.i.i.i.0, i64 0, i32 1
  %272 = load i32* %271, align 8
  %273 = icmp eq i32 %270, %272
  br i1 %273, label %bb65.i.i.i, label %bb67.i.i.i

bb65.i.i.i:                                       ; preds = %bb64.i.i.i
  %274 = getelementptr inbounds %struct.option* %pfound.i.i.i.2, i64 0, i32 2
  %275 = load i32** %274, align 8
  %276 = getelementptr inbounds %struct.option* %p.i.i.i.0, i64 0, i32 2
  %277 = load i32** %276, align 8
  %278 = icmp eq i32* %275, %277
  br i1 %278, label %bb66.i.i.i, label %bb67.i.i.i

bb66.i.i.i:                                       ; preds = %bb65.i.i.i
  %279 = getelementptr inbounds %struct.option* %pfound.i.i.i.2, i64 0, i32 3
  %280 = load i32* %279, align 8
  %281 = getelementptr inbounds %struct.option* %p.i.i.i.0, i64 0, i32 3
  %282 = load i32* %281, align 8
  %283 = icmp eq i32 %280, %282
  br i1 %283, label %bb68.i.i.i, label %bb67.i.i.i

bb67.i.i.i:                                       ; preds = %bb66.i.i.i, %bb65.i.i.i, %bb64.i.i.i
  br label %bb68.i.i.i

bb68.i.i.i:                                       ; preds = %bb67.i.i.i, %bb66.i.i.i, %bb61.i.i.i, %bb58.i.i.i
  %284 = phi i8* [ %246, %bb66.i.i.i ], [ %246, %bb67.i.i.i ], [ %286, %bb58.i.i.i ], [ %246, %bb61.i.i.i ]
  %pfound.i.i.i.1 = phi %struct.option* [ %pfound.i.i.i.2, %bb66.i.i.i ], [ %pfound.i.i.i.2, %bb67.i.i.i ], [ %pfound.i.i.i.2, %bb58.i.i.i ], [ %p.i.i.i.0, %bb61.i.i.i ]
  %ambig.i.i.i.0 = phi i32 [ %ambig.i.i.i.1, %bb66.i.i.i ], [ 1, %bb67.i.i.i ], [ %ambig.i.i.i.1, %bb58.i.i.i ], [ %ambig.i.i.i.1, %bb61.i.i.i ]
  %285 = getelementptr inbounds %struct.option* %p.i.i.i.0, i64 1
  br label %bb69.i.i.i

bb69.i.i.i:                                       ; preds = %bb68.i.i.i, %bb57.i.i.i
  %286 = phi i8* [ %246, %bb57.i.i.i ], [ %284, %bb68.i.i.i ]
  %p.i.i.i.0 = phi %struct.option* [ getelementptr inbounds ([9 x %struct.option]* @long_options.5435, i64 0, i64 0), %bb57.i.i.i ], [ %285, %bb68.i.i.i ]
  %pfound.i.i.i.2 = phi %struct.option* [ null, %bb57.i.i.i ], [ %pfound.i.i.i.1, %bb68.i.i.i ]
  %ambig.i.i.i.1 = phi i32 [ 0, %bb57.i.i.i ], [ %ambig.i.i.i.0, %bb68.i.i.i ]
  %287 = getelementptr inbounds %struct.option* %p.i.i.i.0, i64 0, i32 0
  %288 = load i8** %287, align 8
  %289 = icmp eq i8* %288, null
  br i1 %289, label %bb70.i.i.i, label %bb58.i.i.i

bb70.i.i.i:                                       ; preds = %bb69.i.i.i, %bb59.i.i.i
  %290 = phi i8* [ %246, %bb59.i.i.i ], [ %286, %bb69.i.i.i ]
  %pfound.i.i.i.0 = phi %struct.option* [ %p.i.i.i.0, %bb59.i.i.i ], [ %pfound.i.i.i.2, %bb69.i.i.i ]
  %exact.i.i.i.0 = phi i1 [ false, %bb59.i.i.i ], [ true, %bb69.i.i.i ]
  %.not62 = icmp ne i32 %ambig.i.i.i.1, 0
  %or.cond63 = and i1 %.not62, %exact.i.i.i.0
  br i1 %or.cond63, label %bb73.i.i.i, label %bb75.i.i.i

bb73.i.i.i:                                       ; preds = %bb70.i.i.i
  %291 = sext i32 %247 to i64
  %292 = getelementptr inbounds i8** %argv, i64 %291
  %293 = load i8** %292, align 1
  %294 = load i8** %argv, align 1
  %295 = load %struct.FILE** @stderr, align 8
  %296 = call i32 (%struct.FILE*, i8*, ...)* @fprintf(%struct.FILE* noalias %295, i8* noalias getelementptr inbounds ([30 x i8]* @.str272, i64 0, i64 0), i8* %294, i8* %293) nounwind
  %.pre55 = load i8** getelementptr inbounds (%struct._getopt_data* @getopt_data, i64 0, i32 5), align 32
  %.pre56 = load i32* getelementptr inbounds (%struct._getopt_data* @getopt_data, i64 0, i32 0), align 32
  %297 = call i64 @strlen(i8* %.pre55) nounwind readonly
  %298 = getelementptr inbounds i8* %.pre55, i64 %297
  store i8* %298, i8** getelementptr inbounds (%struct._getopt_data* @getopt_data, i64 0, i32 5), align 32
  %299 = add nsw i32 %.pre56, 1
  store i32 %299, i32* getelementptr inbounds (%struct._getopt_data* @getopt_data, i64 0, i32 0), align 32
  store i32 0, i32* getelementptr inbounds (%struct._getopt_data* @getopt_data, i64 0, i32 2), align 8
  br label %getopt_long.exit.thread

bb75.i.i.i:                                       ; preds = %bb70.i.i.i
  %300 = icmp eq %struct.option* %pfound.i.i.i.0, null
  br i1 %300, label %bb102.i.i.i, label %bb76.i.i.i

bb76.i.i.i:                                       ; preds = %bb75.i.i.i
  %301 = add nsw i32 %247, 1
  store i32 %301, i32* getelementptr inbounds (%struct._getopt_data* @getopt_data, i64 0, i32 0), align 32
  %302 = load i8* %storemerge1.i.i.i, align 1
  %303 = icmp eq i8 %302, 0
  %304 = getelementptr inbounds %struct.option* %pfound.i.i.i.0, i64 0, i32 1
  %305 = load i32* %304, align 8
  br i1 %303, label %bb84.i.i.i, label %bb77.i.i.i

bb77.i.i.i:                                       ; preds = %bb76.i.i.i
  %306 = icmp eq i32 %305, 0
  br i1 %306, label %bb80.i.i.i, label %bb78.i.i.i

bb78.i.i.i:                                       ; preds = %bb77.i.i.i
  %307 = getelementptr inbounds i8* %storemerge1.i.i.i, i64 1
  store i8* %307, i8** getelementptr inbounds (%struct._getopt_data* @getopt_data, i64 0, i32 3), align 16
  br label %bb95.i.i.i

bb80.i.i.i:                                       ; preds = %bb77.i.i.i
  %308 = sext i32 %247 to i64
  %309 = getelementptr inbounds i8** %argv, i64 %308
  %310 = load i8** %309, align 1
  %311 = getelementptr inbounds i8* %310, i64 1
  %312 = load i8* %311, align 1
  %313 = icmp eq i8 %312, 45
  %314 = getelementptr inbounds %struct.option* %pfound.i.i.i.0, i64 0, i32 0
  %315 = load i8** %314, align 8
  br i1 %313, label %bb81.i.i.i, label %bb82.i.i.i

bb81.i.i.i:                                       ; preds = %bb80.i.i.i
  %316 = load i8** %argv, align 1
  %317 = load %struct.FILE** @stderr, align 8
  %318 = call i32 (%struct.FILE*, i8*, ...)* @fprintf(%struct.FILE* noalias %317, i8* noalias getelementptr inbounds ([45 x i8]* @.str373, i64 0, i64 0), i8* %316, i8* %315) nounwind
  br label %bb83.i.i.i

bb82.i.i.i:                                       ; preds = %bb80.i.i.i
  %319 = load i8* %310, align 1
  %320 = sext i8 %319 to i32
  %321 = load i8** %argv, align 1
  %322 = load %struct.FILE** @stderr, align 8
  %323 = call i32 (%struct.FILE*, i8*, ...)* @fprintf(%struct.FILE* noalias %322, i8* noalias getelementptr inbounds ([45 x i8]* @.str474, i64 0, i64 0), i8* %321, i32 %320, i8* %315) nounwind
  br label %bb83.i.i.i

bb83.i.i.i:                                       ; preds = %bb82.i.i.i, %bb81.i.i.i
  %324 = load i8** getelementptr inbounds (%struct._getopt_data* @getopt_data, i64 0, i32 5), align 32
  %325 = call i64 @strlen(i8* %324) nounwind readonly
  %326 = getelementptr inbounds i8* %324, i64 %325
  store i8* %326, i8** getelementptr inbounds (%struct._getopt_data* @getopt_data, i64 0, i32 5), align 32
  %327 = getelementptr inbounds %struct.option* %pfound.i.i.i.0, i64 0, i32 3
  %328 = load i32* %327, align 8
  store i32 %328, i32* getelementptr inbounds (%struct._getopt_data* @getopt_data, i64 0, i32 2), align 8
  br label %getopt_long.exit.thread

bb84.i.i.i:                                       ; preds = %bb76.i.i.i
  %329 = icmp eq i32 %305, 1
  br i1 %329, label %bb85.i.i.i, label %bb95.i.i.i

bb85.i.i.i:                                       ; preds = %bb84.i.i.i
  %330 = icmp slt i32 %301, %argc
  br i1 %330, label %bb86.i.i.i, label %bb88.i.i.i

bb86.i.i.i:                                       ; preds = %bb85.i.i.i
  %331 = sext i32 %301 to i64
  %332 = getelementptr inbounds i8** %argv, i64 %331
  %333 = load i8** %332, align 1
  store i8* %333, i8** getelementptr inbounds (%struct._getopt_data* @getopt_data, i64 0, i32 3), align 16
  %334 = add nsw i32 %247, 2
  store i32 %334, i32* getelementptr inbounds (%struct._getopt_data* @getopt_data, i64 0, i32 0), align 32
  br label %bb95.i.i.i

bb88.i.i.i:                                       ; preds = %bb85.i.i.i
  %335 = sext i32 %247 to i64
  %336 = getelementptr inbounds i8** %argv, i64 %335
  %337 = load i8** %336, align 1
  %338 = load i8** %argv, align 1
  %339 = load %struct.FILE** @stderr, align 8
  %340 = call i32 (%struct.FILE*, i8*, ...)* @fprintf(%struct.FILE* noalias %339, i8* noalias getelementptr inbounds ([38 x i8]* @.str575, i64 0, i64 0), i8* %338, i8* %337) nounwind
  %.pre54 = load i8** getelementptr inbounds (%struct._getopt_data* @getopt_data, i64 0, i32 5), align 32
  %341 = call i64 @strlen(i8* %.pre54) nounwind readonly
  %342 = getelementptr inbounds i8* %.pre54, i64 %341
  store i8* %342, i8** getelementptr inbounds (%struct._getopt_data* @getopt_data, i64 0, i32 5), align 32
  %343 = getelementptr inbounds %struct.option* %pfound.i.i.i.0, i64 0, i32 3
  %344 = load i32* %343, align 8
  store i32 %344, i32* getelementptr inbounds (%struct._getopt_data* @getopt_data, i64 0, i32 2), align 8
  %345 = load i32* getelementptr inbounds (%struct._getopt_data* @getopt_data, i64 0, i32 0), align 32
  %346 = load i8** getelementptr inbounds (%struct._getopt_data* @getopt_data, i64 0, i32 3), align 16
  br label %NodeBlock13

bb95.i.i.i:                                       ; preds = %bb86.i.i.i, %bb84.i.i.i, %bb78.i.i.i
  %347 = call i64 @strlen(i8* %290) nounwind readonly
  %348 = getelementptr inbounds i8* %290, i64 %347
  store i8* %348, i8** getelementptr inbounds (%struct._getopt_data* @getopt_data, i64 0, i32 5), align 32
  %349 = getelementptr inbounds %struct.option* %pfound.i.i.i.0, i64 0, i32 2
  %350 = load i32** %349, align 8
  %351 = icmp eq i32* %350, null
  %352 = getelementptr inbounds %struct.option* %pfound.i.i.i.0, i64 0, i32 3
  %353 = load i32* %352, align 8
  br i1 %351, label %getopt_long.exit, label %bb96.i.i.i

bb96.i.i.i:                                       ; preds = %bb95.i.i.i
  store i32 %353, i32* %350, align 4
  br label %getopt_long.exit.thread

bb102.i.i.i:                                      ; preds = %bb75.i.i.i
  %354 = sext i32 %247 to i64
  %355 = getelementptr inbounds i8** %argv, i64 %354
  %356 = load i8** %355, align 1
  %357 = getelementptr inbounds i8* %356, i64 1
  %358 = load i8* %357, align 1
  %359 = icmp eq i8 %358, 45
  br i1 %359, label %bb103.i.i.i, label %bb104.i.i.i

bb103.i.i.i:                                      ; preds = %bb102.i.i.i
  %360 = load i8** %argv, align 1
  %361 = load %struct.FILE** @stderr, align 8
  %362 = call i32 (%struct.FILE*, i8*, ...)* @fprintf(%struct.FILE* noalias %361, i8* noalias getelementptr inbounds ([32 x i8]* @.str676, i64 0, i64 0), i8* %360, i8* %290) nounwind
  br label %bb105.i.i.i

bb104.i.i.i:                                      ; preds = %bb102.i.i.i
  %363 = sext i32 %247 to i64
  %364 = getelementptr inbounds i8** %argv, i64 %363
  %365 = load i8** %364, align 1
  %366 = load i8* %365, align 1
  %367 = sext i8 %366 to i32
  %368 = load i8** %argv, align 1
  %369 = load %struct.FILE** @stderr, align 8
  %370 = call i32 (%struct.FILE*, i8*, ...)* @fprintf(%struct.FILE* noalias %369, i8* noalias getelementptr inbounds ([32 x i8]* @.str777, i64 0, i64 0), i8* %368, i32 %367, i8* %290) nounwind
  br label %bb105.i.i.i

bb105.i.i.i:                                      ; preds = %bb104.i.i.i, %bb103.i.i.i
  store i8* getelementptr inbounds ([1 x i8]* @.str34, i64 0, i64 0), i8** getelementptr inbounds (%struct._getopt_data* @getopt_data, i64 0, i32 5), align 32
  %371 = load i32* getelementptr inbounds (%struct._getopt_data* @getopt_data, i64 0, i32 0), align 32
  %372 = add nsw i32 %371, 1
  store i32 %372, i32* getelementptr inbounds (%struct._getopt_data* @getopt_data, i64 0, i32 0), align 32
  store i32 0, i32* getelementptr inbounds (%struct._getopt_data* @getopt_data, i64 0, i32 2), align 8
  br label %getopt_long.exit.thread

bb106.i.i.i:                                      ; preds = %bb49.i.i.i
  %373 = load i8* %246, align 1
  %374 = getelementptr inbounds i8* %246, i64 1
  store i8* %374, i8** getelementptr inbounds (%struct._getopt_data* @getopt_data, i64 0, i32 5), align 32
  %375 = sext i8 %373 to i32
  %376 = call i8* @strchr(i8* getelementptr inbounds ([15 x i8]* @.str14, i64 0, i64 0), i32 %375) nounwind readonly
  %377 = load i8* %374, align 1
  %378 = icmp eq i8 %377, 0
  br i1 %378, label %bb107.i.i.i, label %bb108.i.i.i

bb107.i.i.i:                                      ; preds = %bb106.i.i.i
  %379 = load i32* getelementptr inbounds (%struct._getopt_data* @getopt_data, i64 0, i32 0), align 32
  %380 = add nsw i32 %379, 1
  store i32 %380, i32* getelementptr inbounds (%struct._getopt_data* @getopt_data, i64 0, i32 0), align 32
  br label %bb108.i.i.i

bb108.i.i.i:                                      ; preds = %bb107.i.i.i, %bb106.i.i.i
  %381 = icmp eq i8* %376, null
  %382 = icmp eq i8 %373, 58
  %or.cond64 = or i1 %381, %382
  br i1 %or.cond64, label %bb111.i.i.i, label %bb115.i.i.i

bb111.i.i.i:                                      ; preds = %bb108.i.i.i
  %383 = load i32* getelementptr inbounds (%struct._getopt_data* @getopt_data, i64 0, i32 7), align 4
  %384 = icmp eq i32 %383, 0
  %385 = load i8** %argv, align 1
  %386 = load %struct.FILE** @stderr, align 8
  br i1 %384, label %bb113.i.i.i, label %bb112.i.i.i

bb112.i.i.i:                                      ; preds = %bb111.i.i.i
  %387 = call i32 (%struct.FILE*, i8*, ...)* @fprintf(%struct.FILE* noalias %386, i8* noalias getelementptr inbounds ([26 x i8]* @.str979, i64 0, i64 0), i8* %385, i32 %375) nounwind
  br label %bb114.i.i.i

bb113.i.i.i:                                      ; preds = %bb111.i.i.i
  %388 = call i32 (%struct.FILE*, i8*, ...)* @fprintf(%struct.FILE* noalias %386, i8* noalias getelementptr inbounds ([26 x i8]* @.str1080, i64 0, i64 0), i8* %385, i32 %375) nounwind
  br label %bb114.i.i.i

bb114.i.i.i:                                      ; preds = %bb113.i.i.i, %bb112.i.i.i
  store i32 %375, i32* getelementptr inbounds (%struct._getopt_data* @getopt_data, i64 0, i32 2), align 8
  br label %getopt_long.exit.thread

bb115.i.i.i:                                      ; preds = %bb108.i.i.i
  %389 = getelementptr inbounds i8* %376, i64 1
  %390 = load i8* %389, align 1
  %391 = icmp eq i8 %390, 58
  br i1 %391, label %bb116.i.i.i, label %bb132.i.i.i

bb116.i.i.i:                                      ; preds = %bb115.i.i.i
  %392 = getelementptr inbounds i8* %376, i64 2
  %393 = load i8* %392, align 1
  %394 = icmp eq i8 %393, 58
  %395 = load i8* %374, align 1
  %396 = icmp eq i8 %395, 0
  br i1 %394, label %bb117.i.i.i, label %bb121.i.i.i

bb117.i.i.i:                                      ; preds = %bb116.i.i.i
  br i1 %396, label %bb119.i.i.i, label %bb118.i.i.i

bb118.i.i.i:                                      ; preds = %bb117.i.i.i
  store i8* %374, i8** getelementptr inbounds (%struct._getopt_data* @getopt_data, i64 0, i32 3), align 16
  %397 = load i32* getelementptr inbounds (%struct._getopt_data* @getopt_data, i64 0, i32 0), align 32
  %398 = add nsw i32 %397, 1
  store i32 %398, i32* getelementptr inbounds (%struct._getopt_data* @getopt_data, i64 0, i32 0), align 32
  br label %bb120.i.i.i

bb119.i.i.i:                                      ; preds = %bb117.i.i.i
  store i8* null, i8** getelementptr inbounds (%struct._getopt_data* @getopt_data, i64 0, i32 3), align 16
  br label %bb120.i.i.i

bb120.i.i.i:                                      ; preds = %bb119.i.i.i, %bb118.i.i.i
  store i8* null, i8** getelementptr inbounds (%struct._getopt_data* @getopt_data, i64 0, i32 5), align 32
  br label %bb132.i.i.i

bb121.i.i.i:                                      ; preds = %bb116.i.i.i
  br i1 %396, label %bb123.i.i.i, label %bb122.i.i.i

bb122.i.i.i:                                      ; preds = %bb121.i.i.i
  store i8* %374, i8** getelementptr inbounds (%struct._getopt_data* @getopt_data, i64 0, i32 3), align 16
  %399 = load i32* getelementptr inbounds (%struct._getopt_data* @getopt_data, i64 0, i32 0), align 32
  %400 = add nsw i32 %399, 1
  store i32 %400, i32* getelementptr inbounds (%struct._getopt_data* @getopt_data, i64 0, i32 0), align 32
  br label %bb131.i.i.i

bb123.i.i.i:                                      ; preds = %bb121.i.i.i
  %401 = load i32* getelementptr inbounds (%struct._getopt_data* @getopt_data, i64 0, i32 0), align 32
  %402 = icmp eq i32 %401, %argc
  br i1 %402, label %bb125.i.i.i, label %bb130.i.i.i

bb125.i.i.i:                                      ; preds = %bb123.i.i.i
  %403 = load i8** %argv, align 1
  %404 = load %struct.FILE** @stderr, align 8
  %405 = call i32 (%struct.FILE*, i8*, ...)* @fprintf(%struct.FILE* noalias %404, i8* noalias getelementptr inbounds ([39 x i8]* @.str1181, i64 0, i64 0), i8* %403, i32 %375) nounwind
  store i32 %375, i32* getelementptr inbounds (%struct._getopt_data* @getopt_data, i64 0, i32 2), align 8
  br label %bb131.i.i.i

bb130.i.i.i:                                      ; preds = %bb123.i.i.i
  %406 = sext i32 %401 to i64
  %407 = getelementptr inbounds i8** %argv, i64 %406
  %408 = load i8** %407, align 1
  store i8* %408, i8** getelementptr inbounds (%struct._getopt_data* @getopt_data, i64 0, i32 3), align 16
  %409 = add nsw i32 %401, 1
  store i32 %409, i32* getelementptr inbounds (%struct._getopt_data* @getopt_data, i64 0, i32 0), align 32
  br label %bb131.i.i.i

bb131.i.i.i:                                      ; preds = %bb130.i.i.i, %bb125.i.i.i, %bb122.i.i.i
  %c.i.i.i.0 = phi i8 [ %373, %bb130.i.i.i ], [ %373, %bb122.i.i.i ], [ 63, %bb125.i.i.i ]
  store i8* null, i8** getelementptr inbounds (%struct._getopt_data* @getopt_data, i64 0, i32 5), align 32
  br label %bb132.i.i.i

bb132.i.i.i:                                      ; preds = %bb131.i.i.i, %bb120.i.i.i, %bb115.i.i.i
  %c.i.i.i.1 = phi i8 [ %373, %bb120.i.i.i ], [ %c.i.i.i.0, %bb131.i.i.i ], [ %373, %bb115.i.i.i ]
  %410 = sext i8 %c.i.i.i.1 to i32
  br label %getopt_long.exit

getopt_long.exit.thread:                          ; preds = %bb114.i.i.i, %bb105.i.i.i, %bb96.i.i.i, %bb83.i.i.i, %bb73.i.i.i, %bb42.i.i.i, %bb40.i.i.i, %bb36.i.i.i, %bb35.i.i.i, %bb1.i.i.i2
  %.ph = phi i32 [ 1, %bb42.i.i.i ], [ 63, %bb73.i.i.i ], [ 63, %bb83.i.i.i ], [ 0, %bb96.i.i.i ], [ 63, %bb105.i.i.i ], [ 63, %bb114.i.i.i ], [ -1, %bb1.i.i.i2 ], [ -1, %bb36.i.i.i ], [ -1, %bb35.i.i.i ], [ -1, %bb40.i.i.i ]
  %411 = load i32* getelementptr inbounds (%struct._getopt_data* @getopt_data, i64 0, i32 0), align 32
  %412 = load i8** getelementptr inbounds (%struct._getopt_data* @getopt_data, i64 0, i32 3), align 16
  br label %NodeBlock13

getopt_long.exit:                                 ; preds = %bb132.i.i.i, %bb95.i.i.i
  %413 = phi i32 [ %410, %bb132.i.i.i ], [ %353, %bb95.i.i.i ]
  %414 = load i32* getelementptr inbounds (%struct._getopt_data* @getopt_data, i64 0, i32 0), align 32
  %415 = load i8** getelementptr inbounds (%struct._getopt_data* @getopt_data, i64 0, i32 3), align 16
  %Pivot34 = icmp slt i32 %413, 97
  br i1 %Pivot34, label %NodeBlock13, label %NodeBlock31

NodeBlock31:                                      ; preds = %getopt_long.exit
  %Pivot32 = icmp slt i32 %413, 103
  br i1 %Pivot32, label %NodeBlock19, label %NodeBlock29

NodeBlock29:                                      ; preds = %NodeBlock31
  %Pivot30 = icmp slt i32 %413, 104
  br i1 %Pivot30, label %LeafBlock21, label %NodeBlock27

NodeBlock27:                                      ; preds = %NodeBlock29
  %Pivot28 = icmp slt i32 %413, 114
  br i1 %Pivot28, label %LeafBlock23, label %LeafBlock25

LeafBlock25:                                      ; preds = %NodeBlock27
  %SwitchLeaf26 = icmp eq i32 %413, 114
  br i1 %SwitchLeaf26, label %bb27.i, label %bb29.i

LeafBlock23:                                      ; preds = %NodeBlock27
  %SwitchLeaf24 = icmp eq i32 %413, 104
  br i1 %SwitchLeaf24, label %bb18.i148, label %bb29.i

LeafBlock21:                                      ; preds = %NodeBlock29
  %SwitchLeaf22 = icmp eq i32 %413, 103
  br i1 %SwitchLeaf22, label %bb1.i.i.i2, label %bb29.i

NodeBlock19:                                      ; preds = %NodeBlock31
  %Pivot20 = icmp slt i32 %413, 100
  br i1 %Pivot20, label %LeafBlock15, label %LeafBlock17

LeafBlock17:                                      ; preds = %NodeBlock19
  %SwitchLeaf18 = icmp eq i32 %413, 100
  br i1 %SwitchLeaf18, label %bb16.i146, label %bb29.i

LeafBlock15:                                      ; preds = %NodeBlock19
  %SwitchLeaf16 = icmp eq i32 %413, 97
  br i1 %SwitchLeaf16, label %bb1.i138, label %bb29.i

NodeBlock13:                                      ; preds = %getopt_long.exit, %getopt_long.exit.thread, %bb88.i.i.i
  %optind.1 = phi i32 [ %411, %getopt_long.exit.thread ], [ %414, %getopt_long.exit ], [ %345, %bb88.i.i.i ]
  %optarg.0 = phi i8* [ %412, %getopt_long.exit.thread ], [ %415, %getopt_long.exit ], [ %346, %bb88.i.i.i ]
  %416 = phi i32 [ %.ph, %getopt_long.exit.thread ], [ %413, %getopt_long.exit ], [ 63, %bb88.i.i.i ]
  %Pivot14 = icmp slt i32 %416, 77
  br i1 %Pivot14, label %NodeBlock, label %NodeBlock11

NodeBlock11:                                      ; preds = %NodeBlock13
  %Pivot12 = icmp slt i32 %416, 81
  br i1 %Pivot12, label %LeafBlock3, label %NodeBlock9

NodeBlock9:                                       ; preds = %NodeBlock11
  %Pivot10 = icmp slt i32 %416, 82
  br i1 %Pivot10, label %LeafBlock5, label %LeafBlock7

LeafBlock7:                                       ; preds = %NodeBlock9
  %SwitchLeaf8 = icmp eq i32 %416, 82
  br i1 %SwitchLeaf8, label %bb28.i, label %bb29.i

LeafBlock5:                                       ; preds = %NodeBlock9
  %SwitchLeaf6 = icmp eq i32 %416, 81
  br i1 %SwitchLeaf6, label %bb1.i.i.i2, label %bb29.i

LeafBlock3:                                       ; preds = %NodeBlock11
  %SwitchLeaf4 = icmp eq i32 %416, 77
  br i1 %SwitchLeaf4, label %bb19.i149, label %bb29.i

NodeBlock:                                        ; preds = %NodeBlock13
  %Pivot = icmp slt i32 %416, 65
  br i1 %Pivot, label %LeafBlock, label %LeafBlock1

LeafBlock1:                                       ; preds = %NodeBlock
  %SwitchLeaf2 = icmp eq i32 %416, 65
  br i1 %SwitchLeaf2, label %bb4.i141, label %bb29.i

LeafBlock:                                        ; preds = %NodeBlock
  %SwitchLeaf = icmp eq i32 %416, -1
  br i1 %SwitchLeaf, label %bb31.i, label %bb29.i

bb31.i:                                           ; preds = %LeafBlock
  %417 = sext i32 %optind.1 to i64, !dbg !881
  %418 = getelementptr inbounds i8** %argv, i64 %417, !dbg !881
  %419 = load i8** %418, align 1, !dbg !881
  store i8* %419, i8** @group, align 8, !dbg !881
  %.b.i.i = load i1* @aflg.b
  %exclusive.i.i.0 = zext i1 %.b.i.i to i32
  %.b2.i.i = load i1* @dflg.b
  %420 = select i1 %.b.i.i, i32 2, i32 1
  %exclusive.i.i.1 = select i1 %.b2.i.i, i32 %420, i32 %exclusive.i.i.0
  %.b4.i.i = load i1* @rflg.b
  %421 = zext i1 %.b4.i.i to i32
  %exclusive.i.i.2 = add i32 %exclusive.i.i.1, %421
  %.b5.i.i = load i1* @Rflg.b
  %422 = zext i1 %.b5.i.i to i32
  %exclusive.i.i.3 = add i32 %exclusive.i.i.2, %422
  %.b1.i.i = load i1* @Aflg.b
  br i1 %.b1.i.i, label %bb14.i.i161, label %bb12.i.i160, !dbg !882

bb12.i.i160:                                      ; preds = %bb31.i
  %.b3.i.i = load i1* @Mflg.b
  br i1 %.b3.i.i, label %bb14.i.i161, label %bb15.i.i162, !dbg !882

bb14.i.i161:                                      ; preds = %bb12.i.i160, %bb31.i
  %423 = add nsw i32 %exclusive.i.i.3, 1, !dbg !888
  br label %bb15.i.i162, !dbg !888

bb15.i.i162:                                      ; preds = %bb14.i.i161, %bb12.i.i160
  %424 = phi i32 [ %423, %bb14.i.i161 ], [ %exclusive.i.i.3, %bb12.i.i160 ]
  %425 = icmp sgt i32 %424, 1, !dbg !889
  br i1 %425, label %bb16.i.i163, label %bb17.i.i, !dbg !889

bb16.i.i163:                                      ; preds = %bb15.i.i162
  call fastcc void @usage(i32 2) nounwind, !dbg !890
  unreachable

bb17.i.i:                                         ; preds = %bb15.i.i162
  %426 = add nsw i32 %optind.1, 1, !dbg !891
  %.not = icmp ne i32 %426, %argc
  %427 = icmp eq i8* %419, null, !dbg !891
  %or.cond = or i1 %.not, %427
  br i1 %or.cond, label %bb19.i.i, label %process_flags.exit, !dbg !891

bb19.i.i:                                         ; preds = %bb17.i.i
  call fastcc void @usage(i32 2) nounwind, !dbg !892
  unreachable

process_flags.exit:                               ; preds = %bb17.i.i
  %428 = call fastcc i32 @commonio_open(%struct.commonio_db* @group_db, i32 0) nounwind, !dbg !893
  %429 = icmp eq i32 %428, 0, !dbg !898
  br i1 %429, label %bb.i179, label %bb7.i188, !dbg !898

bb.i179:                                          ; preds = %process_flags.exit
  %430 = load i8** @Prog, align 8, !dbg !902
  %431 = load %struct.FILE** @stderr, align 8, !dbg !902
  %432 = call i32 (%struct.FILE*, i8*, ...)* @fprintf(%struct.FILE* noalias %431, i8* noalias getelementptr inbounds ([20 x i8]* @.str24, i64 0, i64 0), i8* %430, i8* getelementptr inbounds (%struct.commonio_db* @group_db, i64 0, i32 0, i64 0)) nounwind, !dbg !902
  %433 = call i8* @setlocale(i32 6, i8* null) nounwind, !dbg !903
  %434 = icmp eq i8* %433, null, !dbg !903
  br i1 %434, label %bb4.i184.thread, label %bb2.i181, !dbg !903

bb4.i184.thread:                                  ; preds = %bb.i179
  call void (i32, i8*, ...)* @syslog(i32 4, i8* getelementptr inbounds ([15 x i8]* @.str26, i64 0, i64 0), i8* getelementptr inbounds (%struct.commonio_db* @group_db, i64 0, i32 0, i64 0)) nounwind, !dbg !903
  br label %bb6.i186

bb2.i181:                                         ; preds = %bb.i179
  %435 = call noalias i8* @strdup(i8* %433) nounwind, !dbg !903
  %436 = icmp eq i8* %435, null, !dbg !903
  br i1 %436, label %bb4.i184.thread228, label %bb5.i185, !dbg !903

bb4.i184.thread228:                               ; preds = %bb2.i181
  call void (i32, i8*, ...)* @syslog(i32 4, i8* getelementptr inbounds ([15 x i8]* @.str26, i64 0, i64 0), i8* getelementptr inbounds (%struct.commonio_db* @group_db, i64 0, i32 0, i64 0)) nounwind, !dbg !903
  br label %bb6.i186

bb5.i185:                                         ; preds = %bb2.i181
  %437 = call i8* @setlocale(i32 6, i8* getelementptr inbounds ([2 x i8]* @.str25, i64 0, i64 0)) nounwind, !dbg !903
  call void (i32, i8*, ...)* @syslog(i32 4, i8* getelementptr inbounds ([15 x i8]* @.str26, i64 0, i64 0), i8* getelementptr inbounds (%struct.commonio_db* @group_db, i64 0, i32 0, i64 0)) nounwind, !dbg !903
  %438 = call i8* @setlocale(i32 6, i8* %435) nounwind, !dbg !903
  call void @free(i8* %435) nounwind, !dbg !903
  br label %bb6.i186, !dbg !903

bb6.i186:                                         ; preds = %bb5.i185, %bb4.i184.thread228, %bb4.i184.thread
  call void @exit(i32 1) noreturn nounwind, !dbg !905
  unreachable, !dbg !905

bb7.i188:                                         ; preds = %process_flags.exit
  %439 = load i8* getelementptr inbounds (%struct.commonio_db* @group_db, i64 0, i32 6), align 8, !dbg !906
  %.lobit.i = and i8 %439, 2
  %toBool3.i = icmp eq i8 %.lobit.i, 0
  br i1 %toBool3.i, label %bb.i, label %bb4.i7, !dbg !906

bb.i:                                             ; preds = %bb7.i188
  %440 = call i32* @__errno_location() nounwind readnone, !dbg !1041
  store i32 22, i32* %440, align 4, !dbg !1041
  br label %bb8.i190

bb4.i7:                                           ; preds = %bb7.i188
  %441 = load i8** @group, align 8, !dbg !1040
  %442 = load %struct.commonio_entry** getelementptr inbounds (%struct.commonio_db* @group_db, i64 0, i32 3), align 16, !dbg !1042
  %443 = call fastcc %struct.commonio_entry* @next_entry_by_name(%struct.commonio_db* @group_db, %struct.commonio_entry* %442, i8* %441) nounwind, !dbg !1042
  %444 = icmp eq %struct.commonio_entry* %443, null, !dbg !1048
  br i1 %444, label %bb5.i8, label %commonio_locate.exit, !dbg !1048

bb5.i8:                                           ; preds = %bb4.i7
  %445 = call i32* @__errno_location() nounwind readnone, !dbg !1049
  store i32 2, i32* %445, align 4, !dbg !1049
  br label %bb8.i190

commonio_locate.exit:                             ; preds = %bb4.i7
  store %struct.commonio_entry* %443, %struct.commonio_entry** getelementptr inbounds (%struct.commonio_db* @group_db, i64 0, i32 5), align 32, !dbg !1050
  %446 = getelementptr inbounds %struct.commonio_entry* %443, i64 0, i32 1, !dbg !1051
  %447 = load i8** %446, align 8, !dbg !1051
  %448 = icmp eq i8* %447, null
  br i1 %448, label %bb8.i190, label %bb9.i191, !dbg !1052

bb8.i190:                                         ; preds = %commonio_locate.exit, %bb5.i8, %bb.i
  %449 = load i8** @group, align 8, !dbg !1053
  %450 = load i8** @Prog, align 8, !dbg !1053
  %451 = load %struct.FILE** @stderr, align 8, !dbg !1053
  %452 = call i32 (%struct.FILE*, i8*, ...)* @fprintf(%struct.FILE* noalias %451, i8* noalias getelementptr inbounds ([37 x i8]* @.str45, i64 0, i64 0), i8* %450, i8* %449, i8* getelementptr inbounds (%struct.commonio_db* @group_db, i64 0, i32 0, i64 0)) nounwind, !dbg !1053
  call void @exit(i32 3) noreturn nounwind, !dbg !1054
  unreachable, !dbg !1054

bb9.i191:                                         ; preds = %commonio_locate.exit
  %453 = getelementptr inbounds %struct.group* %grent, i64 0, i32 0, !dbg !1055
  %454 = bitcast i8* %447 to i8**
  %455 = load i8** %454, align 8, !dbg !1055
  store i8* %455, i8** %453, align 8, !dbg !1055
  %456 = getelementptr inbounds %struct.group* %grent, i64 0, i32 1, !dbg !1055
  %457 = getelementptr inbounds i8* %447, i64 8
  %458 = bitcast i8* %457 to i8**
  %459 = load i8** %458, align 8, !dbg !1055
  store i8* %459, i8** %456, align 8, !dbg !1055
  %460 = getelementptr inbounds %struct.group* %grent, i64 0, i32 2, !dbg !1055
  %461 = getelementptr inbounds i8* %447, i64 16
  %462 = bitcast i8* %461 to i32*
  %463 = load i32* %462, align 8, !dbg !1055
  store i32 %463, i32* %460, align 8, !dbg !1055
  %464 = getelementptr inbounds %struct.group* %grent, i64 0, i32 3, !dbg !1055
  %465 = getelementptr inbounds i8* %447, i64 24
  %466 = bitcast i8* %465 to i8***
  %467 = load i8*** %466, align 8, !dbg !1055
  store i8** %467, i8*** %464, align 8, !dbg !1055
  %468 = load i8** %454, align 8, !dbg !1056
  %469 = call i64 @strlen(i8* %468) nounwind readonly, !dbg !1057
  %470 = add i64 %469, 1, !dbg !1057
  %471 = call fastcc i8* @xmalloc(i64 %470) nounwind, !dbg !1057
  %472 = call i8* @strcpy(i8* noalias %471, i8* noalias %468) nounwind, !dbg !1057
  store i8* %472, i8** %453, align 8, !dbg !1056
  %473 = load i8** %458, align 8, !dbg !1058
  %474 = call i64 @strlen(i8* %473) nounwind readonly, !dbg !1059
  %475 = add i64 %474, 1, !dbg !1059
  %476 = call fastcc i8* @xmalloc(i64 %475) nounwind, !dbg !1059
  %477 = call i8* @strcpy(i8* noalias %476, i8* noalias %473) nounwind, !dbg !1059
  store i8* %477, i8** %456, align 8, !dbg !1058
  %478 = load i8*** %466, align 8, !dbg !1060
  %479 = call fastcc i8** @dup_list(i8** %478) nounwind, !dbg !1060
  store i8** %479, i8*** %464, align 8, !dbg !1060
  %480 = call fastcc i32 @commonio_close(%struct.commonio_db* @group_db) nounwind, !dbg !1061
  %481 = icmp eq i32 %480, 0, !dbg !1064
  br i1 %481, label %bb10.i192, label %bb19.i200, !dbg !1064

bb10.i192:                                        ; preds = %bb9.i191
  %482 = load i8** @Prog, align 8, !dbg !1065
  %483 = load %struct.FILE** @stderr, align 8, !dbg !1065
  %484 = call i32 (%struct.FILE*, i8*, ...)* @fprintf(%struct.FILE* noalias %483, i8* noalias getelementptr inbounds ([40 x i8]* @.str46, i64 0, i64 0), i8* %482, i8* getelementptr inbounds (%struct.commonio_db* @group_db, i64 0, i32 0, i64 0)) nounwind, !dbg !1065
  %485 = call i8* @setlocale(i32 6, i8* null) nounwind, !dbg !1066
  %486 = icmp eq i8* %485, null, !dbg !1066
  br i1 %486, label %bb16.i196.thread, label %bb14.i194, !dbg !1066

bb16.i196.thread:                                 ; preds = %bb10.i192
  call void (i32, i8*, ...)* @syslog(i32 3, i8* getelementptr inbounds ([35 x i8]* @.str47, i64 0, i64 0), i8* getelementptr inbounds (%struct.commonio_db* @group_db, i64 0, i32 0, i64 0)) nounwind, !dbg !1066
  br label %bb18.i198

bb14.i194:                                        ; preds = %bb10.i192
  %487 = call noalias i8* @strdup(i8* %485) nounwind, !dbg !1066
  %488 = icmp eq i8* %487, null, !dbg !1066
  br i1 %488, label %bb16.i196.thread229, label %bb17.i197, !dbg !1066

bb16.i196.thread229:                              ; preds = %bb14.i194
  call void (i32, i8*, ...)* @syslog(i32 3, i8* getelementptr inbounds ([35 x i8]* @.str47, i64 0, i64 0), i8* getelementptr inbounds (%struct.commonio_db* @group_db, i64 0, i32 0, i64 0)) nounwind, !dbg !1066
  br label %bb18.i198

bb17.i197:                                        ; preds = %bb14.i194
  %489 = call i8* @setlocale(i32 6, i8* getelementptr inbounds ([2 x i8]* @.str25, i64 0, i64 0)) nounwind, !dbg !1066
  call void (i32, i8*, ...)* @syslog(i32 3, i8* getelementptr inbounds ([35 x i8]* @.str47, i64 0, i64 0), i8* getelementptr inbounds (%struct.commonio_db* @group_db, i64 0, i32 0, i64 0)) nounwind, !dbg !1066
  %490 = call i8* @setlocale(i32 6, i8* %487) nounwind, !dbg !1066
  call void @free(i8* %487) nounwind, !dbg !1066
  br label %bb18.i198, !dbg !1066

bb18.i198:                                        ; preds = %bb17.i197, %bb16.i196.thread229, %bb16.i196.thread
  call void @exit(i32 1) noreturn nounwind, !dbg !1068
  unreachable, !dbg !1068

bb19.i200:                                        ; preds = %bb9.i191
  br i1 %99, label %bb20.i201, label %get_group.exit, !dbg !1069

bb20.i201:                                        ; preds = %bb19.i200
  %491 = call fastcc i32 @commonio_open(%struct.commonio_db* @gshadow_db, i32 0) nounwind, !dbg !1070
  %492 = icmp eq i32 %491, 0, !dbg !1075
  br i1 %492, label %bb21.i202, label %bb30.i209, !dbg !1075

bb21.i202:                                        ; preds = %bb20.i201
  %493 = load i8** @Prog, align 8, !dbg !1076
  %494 = load %struct.FILE** @stderr, align 8, !dbg !1076
  %495 = call i32 (%struct.FILE*, i8*, ...)* @fprintf(%struct.FILE* noalias %494, i8* noalias getelementptr inbounds ([20 x i8]* @.str24, i64 0, i64 0), i8* %493, i8* getelementptr inbounds (%struct.commonio_db* @gshadow_db, i64 0, i32 0, i64 0)) nounwind, !dbg !1076
  %496 = call i8* @setlocale(i32 6, i8* null) nounwind, !dbg !1077
  %497 = icmp eq i8* %496, null, !dbg !1077
  br i1 %497, label %bb27.i206.thread, label %bb25.i204, !dbg !1077

bb27.i206.thread:                                 ; preds = %bb21.i202
  call void (i32, i8*, ...)* @syslog(i32 4, i8* getelementptr inbounds ([15 x i8]* @.str26, i64 0, i64 0), i8* getelementptr inbounds (%struct.commonio_db* @gshadow_db, i64 0, i32 0, i64 0)) nounwind, !dbg !1077
  br label %bb29.i208

bb25.i204:                                        ; preds = %bb21.i202
  %498 = call noalias i8* @strdup(i8* %496) nounwind, !dbg !1077
  %499 = icmp eq i8* %498, null, !dbg !1077
  br i1 %499, label %bb27.i206.thread230, label %bb28.i207, !dbg !1077

bb27.i206.thread230:                              ; preds = %bb25.i204
  call void (i32, i8*, ...)* @syslog(i32 4, i8* getelementptr inbounds ([15 x i8]* @.str26, i64 0, i64 0), i8* getelementptr inbounds (%struct.commonio_db* @gshadow_db, i64 0, i32 0, i64 0)) nounwind, !dbg !1077
  br label %bb29.i208

bb28.i207:                                        ; preds = %bb25.i204
  %500 = call i8* @setlocale(i32 6, i8* getelementptr inbounds ([2 x i8]* @.str25, i64 0, i64 0)) nounwind, !dbg !1077
  call void (i32, i8*, ...)* @syslog(i32 4, i8* getelementptr inbounds ([15 x i8]* @.str26, i64 0, i64 0), i8* getelementptr inbounds (%struct.commonio_db* @gshadow_db, i64 0, i32 0, i64 0)) nounwind, !dbg !1077
  %501 = call i8* @setlocale(i32 6, i8* %498) nounwind, !dbg !1077
  call void @free(i8* %498) nounwind, !dbg !1077
  br label %bb29.i208, !dbg !1077

bb29.i208:                                        ; preds = %bb28.i207, %bb27.i206.thread230, %bb27.i206.thread
  call void @exit(i32 1) noreturn nounwind, !dbg !1079
  unreachable, !dbg !1079

bb30.i209:                                        ; preds = %bb20.i201
  %502 = load i8* getelementptr inbounds (%struct.commonio_db* @gshadow_db, i64 0, i32 6), align 8, !dbg !1080
  %.lobit.i10 = and i8 %502, 2
  %toBool3.i11 = icmp eq i8 %.lobit.i10, 0
  br i1 %toBool3.i11, label %bb.i12, label %bb4.i13, !dbg !1080

bb.i12:                                           ; preds = %bb30.i209
  %503 = call i32* @__errno_location() nounwind readnone, !dbg !1096
  store i32 22, i32* %503, align 4, !dbg !1096
  br label %bb32.i

bb4.i13:                                          ; preds = %bb30.i209
  %504 = load i8** @group, align 8, !dbg !1095
  %505 = load %struct.commonio_entry** getelementptr inbounds (%struct.commonio_db* @gshadow_db, i64 0, i32 3), align 16, !dbg !1097
  %506 = call fastcc %struct.commonio_entry* @next_entry_by_name(%struct.commonio_db* @gshadow_db, %struct.commonio_entry* %505, i8* %504) nounwind, !dbg !1097
  %507 = icmp eq %struct.commonio_entry* %506, null, !dbg !1099
  br i1 %507, label %bb5.i14, label %commonio_locate.exit16, !dbg !1099

bb5.i14:                                          ; preds = %bb4.i13
  %508 = call i32* @__errno_location() nounwind readnone, !dbg !1100
  store i32 2, i32* %508, align 4, !dbg !1100
  br label %bb32.i

commonio_locate.exit16:                           ; preds = %bb4.i13
  store %struct.commonio_entry* %506, %struct.commonio_entry** getelementptr inbounds (%struct.commonio_db* @gshadow_db, i64 0, i32 5), align 32, !dbg !1101
  %509 = getelementptr inbounds %struct.commonio_entry* %506, i64 0, i32 1, !dbg !1102
  %510 = load i8** %509, align 8, !dbg !1102
  %511 = icmp eq i8* %510, null
  br i1 %511, label %bb32.i, label %bb31.i210, !dbg !1103

bb31.i210:                                        ; preds = %commonio_locate.exit16
  %512 = getelementptr inbounds %struct.sgrp* %sgent, i64 0, i32 0, !dbg !1104
  %513 = bitcast i8* %510 to i8**
  %514 = load i8** %513, align 8, !dbg !1104
  store i8* %514, i8** %512, align 8, !dbg !1104
  %515 = getelementptr inbounds %struct.sgrp* %sgent, i64 0, i32 1, !dbg !1104
  %516 = getelementptr inbounds i8* %510, i64 8
  %517 = bitcast i8* %516 to i8**
  %518 = load i8** %517, align 8, !dbg !1104
  store i8* %518, i8** %515, align 8, !dbg !1104
  %519 = getelementptr inbounds %struct.sgrp* %sgent, i64 0, i32 2, !dbg !1104
  %520 = getelementptr inbounds i8* %510, i64 16
  %521 = bitcast i8* %520 to i8***
  %522 = load i8*** %521, align 8, !dbg !1104
  store i8** %522, i8*** %519, align 8, !dbg !1104
  %523 = getelementptr inbounds %struct.sgrp* %sgent, i64 0, i32 3, !dbg !1104
  %524 = getelementptr inbounds i8* %510, i64 24
  %525 = bitcast i8* %524 to i8***
  %526 = load i8*** %525, align 8, !dbg !1104
  store i8** %526, i8*** %523, align 8, !dbg !1104
  %527 = load i8** %513, align 8, !dbg !1105
  %528 = call i64 @strlen(i8* %527) nounwind readonly, !dbg !1106
  %529 = add i64 %528, 1, !dbg !1106
  %530 = call fastcc i8* @xmalloc(i64 %529) nounwind, !dbg !1106
  %531 = call i8* @strcpy(i8* noalias %530, i8* noalias %527) nounwind, !dbg !1106
  store i8* %531, i8** %512, align 8, !dbg !1105
  %532 = load i8** %517, align 8, !dbg !1107
  %533 = call i64 @strlen(i8* %532) nounwind readonly, !dbg !1108
  %534 = add i64 %533, 1, !dbg !1108
  %535 = call fastcc i8* @xmalloc(i64 %534) nounwind, !dbg !1108
  %536 = call i8* @strcpy(i8* noalias %535, i8* noalias %532) nounwind, !dbg !1108
  store i8* %536, i8** %515, align 8, !dbg !1107
  %537 = load i8*** %525, align 8, !dbg !1109
  %538 = call fastcc i8** @dup_list(i8** %537) nounwind, !dbg !1109
  store i8** %538, i8*** %523, align 8, !dbg !1109
  %539 = load i8*** %521, align 8, !dbg !1110
  %540 = call fastcc i8** @dup_list(i8** %539) nounwind, !dbg !1110
  store i8** %540, i8*** %519, align 8, !dbg !1110
  br label %bb33.i, !dbg !1110

bb32.i:                                           ; preds = %commonio_locate.exit16, %bb5.i14, %bb.i12
  %541 = load i8** @group, align 8, !dbg !1111
  %542 = call i64 @strlen(i8* %541) nounwind readonly, !dbg !1112
  %543 = add i64 %542, 1, !dbg !1112
  %544 = call fastcc i8* @xmalloc(i64 %543) nounwind, !dbg !1112
  %545 = call i8* @strcpy(i8* noalias %544, i8* noalias %541) nounwind, !dbg !1112
  %546 = getelementptr inbounds %struct.sgrp* %sgent, i64 0, i32 0, !dbg !1111
  store i8* %545, i8** %546, align 8, !dbg !1111
  %547 = load i8** %456, align 8, !dbg !1113
  %548 = getelementptr inbounds %struct.sgrp* %sgent, i64 0, i32 1, !dbg !1113
  store i8* %547, i8** %548, align 8, !dbg !1113
  store i8* getelementptr inbounds ([2 x i8]* @.str48, i64 0, i64 0), i8** %456, align 8, !dbg !1114
  %549 = load i8*** %464, align 8, !dbg !1115
  %550 = call fastcc i8** @dup_list(i8** %549) nounwind, !dbg !1115
  %551 = getelementptr inbounds %struct.sgrp* %sgent, i64 0, i32 3, !dbg !1115
  store i8** %550, i8*** %551, align 8, !dbg !1115
  %552 = call fastcc i8* @xmalloc(i64 16) nounwind, !dbg !1116
  %553 = bitcast i8* %552 to i8**, !dbg !1116
  %554 = getelementptr inbounds %struct.sgrp* %sgent, i64 0, i32 2, !dbg !1116
  store i8** %553, i8*** %554, align 8, !dbg !1116
  store i8* null, i8** %553, align 1, !dbg !1117
  br label %bb33.i, !dbg !1117

bb33.i:                                           ; preds = %bb32.i, %bb31.i210
  %555 = call fastcc i32 @commonio_close(%struct.commonio_db* @gshadow_db) nounwind, !dbg !1118
  %556 = icmp eq i32 %555, 0, !dbg !1121
  br i1 %556, label %bb34.i, label %get_group.exit, !dbg !1121

bb34.i:                                           ; preds = %bb33.i
  %557 = load i8** @Prog, align 8, !dbg !1122
  %558 = load %struct.FILE** @stderr, align 8, !dbg !1122
  %559 = call i32 (%struct.FILE*, i8*, ...)* @fprintf(%struct.FILE* noalias %558, i8* noalias getelementptr inbounds ([40 x i8]* @.str46, i64 0, i64 0), i8* %557, i8* getelementptr inbounds (%struct.commonio_db* @gshadow_db, i64 0, i32 0, i64 0)) nounwind, !dbg !1122
  %560 = call i8* @setlocale(i32 6, i8* null) nounwind, !dbg !1123
  %561 = icmp eq i8* %560, null, !dbg !1123
  br i1 %561, label %bb40.i.thread, label %bb38.i, !dbg !1123

bb40.i.thread:                                    ; preds = %bb34.i
  call void (i32, i8*, ...)* @syslog(i32 3, i8* getelementptr inbounds ([35 x i8]* @.str47, i64 0, i64 0), i8* getelementptr inbounds (%struct.commonio_db* @gshadow_db, i64 0, i32 0, i64 0)) nounwind, !dbg !1123
  br label %bb42.i

bb38.i:                                           ; preds = %bb34.i
  %562 = call noalias i8* @strdup(i8* %560) nounwind, !dbg !1123
  %563 = icmp eq i8* %562, null, !dbg !1123
  br i1 %563, label %bb40.i.thread231, label %bb41.i, !dbg !1123

bb40.i.thread231:                                 ; preds = %bb38.i
  call void (i32, i8*, ...)* @syslog(i32 3, i8* getelementptr inbounds ([35 x i8]* @.str47, i64 0, i64 0), i8* getelementptr inbounds (%struct.commonio_db* @gshadow_db, i64 0, i32 0, i64 0)) nounwind, !dbg !1123
  br label %bb42.i

bb41.i:                                           ; preds = %bb38.i
  %564 = call i8* @setlocale(i32 6, i8* getelementptr inbounds ([2 x i8]* @.str25, i64 0, i64 0)) nounwind, !dbg !1123
  call void (i32, i8*, ...)* @syslog(i32 3, i8* getelementptr inbounds ([35 x i8]* @.str47, i64 0, i64 0), i8* getelementptr inbounds (%struct.commonio_db* @gshadow_db, i64 0, i32 0, i64 0)) nounwind, !dbg !1123
  %565 = call i8* @setlocale(i32 6, i8* %562) nounwind, !dbg !1123
  call void @free(i8* %562) nounwind, !dbg !1123
  br label %bb42.i, !dbg !1123

bb42.i:                                           ; preds = %bb41.i, %bb40.i.thread231, %bb40.i.thread
  call void @exit(i32 1) noreturn nounwind, !dbg !1125
  unreachable, !dbg !1125

get_group.exit:                                   ; preds = %bb33.i, %bb19.i200
  %566 = icmp eq i32 %34, 0, !dbg !1126
  br i1 %566, label %bb4.i219, label %bb.i216, !dbg !1126

bb.i216:                                          ; preds = %get_group.exit
  %.b.i = load i1* @Aflg.b
  br i1 %.b.i, label %bb3.i218, label %bb1.i217, !dbg !1126

bb1.i217:                                         ; preds = %bb.i216
  %.b1.i = load i1* @Mflg.b
  br i1 %.b1.i, label %bb3.i218, label %bb4.i219, !dbg !1126

bb3.i218:                                         ; preds = %bb1.i217, %bb.i216
  %567 = load i8** @Prog, align 8, !dbg !1136
  %568 = load %struct.FILE** @stderr, align 8, !dbg !1136
  %569 = call i32 (%struct.FILE*, i8*, ...)* @fprintf(%struct.FILE* noalias %568, i8* noalias getelementptr inbounds ([24 x i8]* @.str11, i64 0, i64 0), i8* %567) nounwind, !dbg !1136
  call fastcc void @log_gpasswd_failure(i8* getelementptr inbounds ([20 x i8]* @.str12, i64 0, i64 0)) nounwind, !dbg !1141
  call void @exit(i32 1) noreturn nounwind, !dbg !1142
  unreachable, !dbg !1142

bb4.i219:                                         ; preds = %bb1.i217, %get_group.exit
  br i1 %99, label %bb6.i220, label %bb14.i224, !dbg !1143

bb6.i220:                                         ; preds = %bb4.i219
  br i1 %566, label %check_perms.exit, label %bb7.i221, !dbg !1144

bb7.i221:                                         ; preds = %bb6.i220
  %570 = load i8** @myname, align 8, !dbg !1144
  %571 = getelementptr inbounds %struct.sgrp* %sgent, i64 0, i32 2, !dbg !1144
  %572 = load i8*** %571, align 8, !dbg !1144
  %573 = icmp eq i8* %570, null, !dbg !1145
  br i1 %573, label %bb.i17, label %bb1.i18, !dbg !1145

bb.i17:                                           ; preds = %bb7.i221
  call void @__assert_fail(i8* getelementptr inbounds ([22 x i8]* @.str79, i64 0, i64 0), i8* getelementptr inbounds ([21 x i8]* @.str180, i64 0, i64 0), i32 180, i8* getelementptr inbounds ([11 x i8]* @__PRETTY_FUNCTION__.5270, i64 0, i64 0)) noreturn nounwind, !dbg !1145
  unreachable, !dbg !1145

bb1.i18:                                          ; preds = %bb7.i221
  %574 = icmp eq i8** %572, null
  br i1 %574, label %bb2.i, label %bb7.i21, !dbg !1158

bb2.i:                                            ; preds = %bb1.i18
  call void @__assert_fail(i8* getelementptr inbounds ([20 x i8]* @.str281, i64 0, i64 0), i8* getelementptr inbounds ([21 x i8]* @.str180, i64 0, i64 0), i32 181, i8* getelementptr inbounds ([11 x i8]* @__PRETTY_FUNCTION__.5270, i64 0, i64 0)) noreturn nounwind, !dbg !1158
  unreachable, !dbg !1158

bb4.i19:                                          ; preds = %bb7.i21
  %575 = call i32 @strcmp(i8* %578, i8* %570) nounwind readonly, !dbg !1159
  %576 = icmp eq i32 %575, 0, !dbg !1159
  br i1 %576, label %check_perms.exit, label %bb6.i20, !dbg !1159

bb6.i20:                                          ; preds = %bb4.i19
  %577 = getelementptr inbounds i8** %list_addr.0.i, i64 1, !dbg !1160
  br label %bb7.i21, !dbg !1160

bb7.i21:                                          ; preds = %bb6.i20, %bb1.i18
  %list_addr.0.i = phi i8** [ %577, %bb6.i20 ], [ %572, %bb1.i18 ]
  %578 = load i8** %list_addr.0.i, align 8, !dbg !1161
  %579 = icmp eq i8* %578, null, !dbg !1161
  br i1 %579, label %bb12.i222, label %bb4.i19, !dbg !1161

bb12.i222:                                        ; preds = %bb7.i21
  %580 = load i8** @Prog, align 8, !dbg !1162
  %581 = load %struct.FILE** @stderr, align 8, !dbg !1162
  %582 = call i32 (%struct.FILE*, i8*, ...)* @fprintf(%struct.FILE* noalias %581, i8* noalias getelementptr inbounds ([24 x i8]* @.str11, i64 0, i64 0), i8* %580) nounwind, !dbg !1162
  call fastcc void @log_gpasswd_failure(i8* getelementptr inbounds ([20 x i8]* @.str12, i64 0, i64 0)) nounwind, !dbg !1164
  call void @exit(i32 1) noreturn nounwind, !dbg !1165
  unreachable, !dbg !1165

bb14.i224:                                        ; preds = %bb4.i219
  br i1 %566, label %check_perms.exit, label %bb15.i225, !dbg !1166

bb15.i225:                                        ; preds = %bb14.i224
  %583 = load i8** @Prog, align 8, !dbg !1167
  %584 = load %struct.FILE** @stderr, align 8, !dbg !1167
  %585 = call i32 (%struct.FILE*, i8*, ...)* @fprintf(%struct.FILE* noalias %584, i8* noalias getelementptr inbounds ([24 x i8]* @.str11, i64 0, i64 0), i8* %583) nounwind, !dbg !1167
  call fastcc void @log_gpasswd_failure(i8* getelementptr inbounds ([20 x i8]* @.str12, i64 0, i64 0)) nounwind, !dbg !1169
  call void @exit(i32 1) noreturn nounwind, !dbg !1170
  unreachable, !dbg !1170

check_perms.exit:                                 ; preds = %bb14.i224, %bb4.i19, %bb6.i220
  %.b5 = load i1* @rflg.b
  br i1 %.b5, label %bb10, label %bb15, !dbg !1171

bb10:                                             ; preds = %check_perms.exit
  br i1 %99, label %bb12, label %bb13, !dbg !1172

bb12:                                             ; preds = %bb10
  store i8* getelementptr inbounds ([2 x i8]* @.str48, i64 0, i64 0), i8** %456, align 8, !dbg !1173
  %586 = getelementptr inbounds %struct.sgrp* %sgent, i64 0, i32 1, !dbg !1174
  store i8* getelementptr inbounds ([1 x i8]* @.str34, i64 0, i64 0), i8** %586, align 8, !dbg !1174
  br label %output, !dbg !1174

bb13:                                             ; preds = %bb10
  store i8* getelementptr inbounds ([1 x i8]* @.str34, i64 0, i64 0), i8** %456, align 8, !dbg !1175
  br label %output, !dbg !1175

bb15:                                             ; preds = %check_perms.exit
  %.b6 = load i1* @Rflg.b
  br i1 %.b6, label %bb17, label %bb22, !dbg !1176

bb17:                                             ; preds = %bb15
  br i1 %99, label %bb19, label %bb20, !dbg !1177

bb19:                                             ; preds = %bb17
  store i8* getelementptr inbounds ([2 x i8]* @.str48, i64 0, i64 0), i8** %456, align 8, !dbg !1178
  %587 = getelementptr inbounds %struct.sgrp* %sgent, i64 0, i32 1, !dbg !1179
  store i8* getelementptr inbounds ([2 x i8]* @.str61, i64 0, i64 0), i8** %587, align 8, !dbg !1179
  br label %output, !dbg !1179

bb20:                                             ; preds = %bb17
  store i8* getelementptr inbounds ([2 x i8]* @.str61, i64 0, i64 0), i8** %456, align 8, !dbg !1180
  br label %output, !dbg !1180

bb22:                                             ; preds = %bb15
  %.b = load i1* @aflg.b
  br i1 %.b, label %bb24, label %bb28, !dbg !1181

bb24:                                             ; preds = %bb22
  %588 = load i8** @group, align 8, !dbg !1182
  %589 = load i8** @user, align 8, !dbg !1182
  %590 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([28 x i8]* @.str62, i64 0, i64 0), i8* %589, i8* %588) nounwind, !dbg !1182
  %591 = load i8** @user, align 8, !dbg !1183
  %592 = load i8*** %464, align 8, !dbg !1183
  %593 = call fastcc i8** @add_list(i8** %592, i8* %591) nounwind, !dbg !1183
  store i8** %593, i8*** %464, align 8, !dbg !1183
  br i1 %99, label %bb26, label %output, !dbg !1184

bb26:                                             ; preds = %bb24
  %594 = load i8** @user, align 8, !dbg !1185
  %595 = getelementptr inbounds %struct.sgrp* %sgent, i64 0, i32 3, !dbg !1185
  %596 = load i8*** %595, align 8, !dbg !1185
  %597 = call fastcc i8** @add_list(i8** %596, i8* %594) nounwind, !dbg !1185
  store i8** %597, i8*** %595, align 8, !dbg !1185
  br label %output, !dbg !1185

bb28:                                             ; preds = %bb22
  %.b2 = load i1* @dflg.b
  br i1 %.b2, label %bb30, label %bb45, !dbg !1186

bb30:                                             ; preds = %bb28
  %598 = load i8** @group, align 8, !dbg !1187
  %599 = load i8** @user, align 8, !dbg !1187
  %600 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([32 x i8]* @.str63, i64 0, i64 0), i8* %599, i8* %598) nounwind, !dbg !1187
  %601 = load i8** @user, align 8, !dbg !1189
  %602 = load i8*** %464, align 8, !dbg !1189
  %603 = icmp eq i8* %601, null, !dbg !1190
  br i1 %603, label %bb.i24, label %bb1.i26, !dbg !1190

bb.i24:                                           ; preds = %bb30
  call void @__assert_fail(i8* getelementptr inbounds ([22 x i8]* @.str79, i64 0, i64 0), i8* getelementptr inbounds ([21 x i8]* @.str180, i64 0, i64 0), i32 180, i8* getelementptr inbounds ([11 x i8]* @__PRETTY_FUNCTION__.5270, i64 0, i64 0)) noreturn nounwind, !dbg !1190
  unreachable, !dbg !1190

bb1.i26:                                          ; preds = %bb30
  %604 = icmp eq i8** %602, null
  br i1 %604, label %bb2.i28, label %bb7.i32, !dbg !1191

bb2.i28:                                          ; preds = %bb1.i26
  call void @__assert_fail(i8* getelementptr inbounds ([20 x i8]* @.str281, i64 0, i64 0), i8* getelementptr inbounds ([21 x i8]* @.str180, i64 0, i64 0), i32 181, i8* getelementptr inbounds ([11 x i8]* @__PRETTY_FUNCTION__.5270, i64 0, i64 0)) noreturn nounwind, !dbg !1191
  unreachable, !dbg !1191

bb4.i29:                                          ; preds = %bb7.i32
  %605 = call i32 @strcmp(i8* %608, i8* %601) nounwind readonly, !dbg !1192
  %606 = icmp eq i32 %605, 0, !dbg !1192
  br i1 %606, label %bb32, label %bb6.i30, !dbg !1192

bb6.i30:                                          ; preds = %bb4.i29
  %607 = getelementptr inbounds i8** %list_addr.0.i31, i64 1, !dbg !1193
  br label %bb7.i32, !dbg !1193

bb7.i32:                                          ; preds = %bb6.i30, %bb1.i26
  %list_addr.0.i31 = phi i8** [ %607, %bb6.i30 ], [ %602, %bb1.i26 ]
  %608 = load i8** %list_addr.0.i31, align 8, !dbg !1194
  %609 = icmp eq i8* %608, null, !dbg !1194
  br i1 %609, label %bb33, label %bb4.i29, !dbg !1194

bb32:                                             ; preds = %bb4.i29
  %610 = call fastcc i8** @del_list(i8** %602, i8* %601) nounwind, !dbg !1195
  store i8** %610, i8*** %464, align 8, !dbg !1195
  br label %bb33, !dbg !1195

bb33:                                             ; preds = %bb32, %bb7.i32
  %removed.0 = phi i8 [ 1, %bb32 ], [ 0, %bb7.i32 ]
  br i1 %99, label %bb35, label %bb38, !dbg !1196

bb35:                                             ; preds = %bb33
  %611 = load i8** @user, align 8, !dbg !1197
  %612 = getelementptr inbounds %struct.sgrp* %sgent, i64 0, i32 3, !dbg !1197
  %613 = load i8*** %612, align 8, !dbg !1197
  %614 = icmp eq i8* %611, null, !dbg !1198
  br i1 %614, label %bb.i35, label %bb1.i36, !dbg !1198

bb.i35:                                           ; preds = %bb35
  call void @__assert_fail(i8* getelementptr inbounds ([22 x i8]* @.str79, i64 0, i64 0), i8* getelementptr inbounds ([21 x i8]* @.str180, i64 0, i64 0), i32 180, i8* getelementptr inbounds ([11 x i8]* @__PRETTY_FUNCTION__.5270, i64 0, i64 0)) noreturn nounwind, !dbg !1198
  unreachable, !dbg !1198

bb1.i36:                                          ; preds = %bb35
  %615 = icmp eq i8** %613, null
  br i1 %615, label %bb2.i37, label %bb7.i41, !dbg !1199

bb2.i37:                                          ; preds = %bb1.i36
  call void @__assert_fail(i8* getelementptr inbounds ([20 x i8]* @.str281, i64 0, i64 0), i8* getelementptr inbounds ([21 x i8]* @.str180, i64 0, i64 0), i32 181, i8* getelementptr inbounds ([11 x i8]* @__PRETTY_FUNCTION__.5270, i64 0, i64 0)) noreturn nounwind, !dbg !1199
  unreachable, !dbg !1199

bb4.i38:                                          ; preds = %bb7.i41
  %616 = call i32 @strcmp(i8* %619, i8* %611) nounwind readonly, !dbg !1200
  %617 = icmp eq i32 %616, 0, !dbg !1200
  br i1 %617, label %bb38.thread, label %bb6.i39, !dbg !1200

bb6.i39:                                          ; preds = %bb4.i38
  %618 = getelementptr inbounds i8** %list_addr.0.i40, i64 1, !dbg !1201
  br label %bb7.i41, !dbg !1201

bb7.i41:                                          ; preds = %bb6.i39, %bb1.i36
  %list_addr.0.i40 = phi i8** [ %618, %bb6.i39 ], [ %613, %bb1.i36 ]
  %619 = load i8** %list_addr.0.i40, align 8, !dbg !1202
  %620 = icmp eq i8* %619, null, !dbg !1202
  br i1 %620, label %bb38, label %bb4.i38, !dbg !1202

bb38.thread:                                      ; preds = %bb4.i38
  %621 = call fastcc i8** @del_list(i8** %613, i8* %611) nounwind, !dbg !1203
  store i8** %621, i8*** %612, align 8, !dbg !1203
  br label %output

bb38:                                             ; preds = %bb7.i41, %bb33
  %toBool39not = icmp eq i8 %removed.0, 0
  br i1 %toBool39not, label %bb43, label %output, !dbg !1204

bb43:                                             ; preds = %bb38
  %622 = load i8** @group, align 8, !dbg !1205
  %623 = load i8** @user, align 8, !dbg !1205
  %624 = load i8** @Prog, align 8, !dbg !1205
  %625 = load %struct.FILE** @stderr, align 8, !dbg !1205
  %626 = call i32 (%struct.FILE*, i8*, ...)* @fprintf(%struct.FILE* noalias %625, i8* noalias getelementptr inbounds ([39 x i8]* @.str64, i64 0, i64 0), i8* %624, i8* %623, i8* %622) nounwind, !dbg !1205
  call void @exit(i32 3) noreturn nounwind, !dbg !1206
  unreachable, !dbg !1206

bb45:                                             ; preds = %bb28
  %.b1 = load i1* @Aflg.b
  br i1 %.b1, label %bb47, label %bb52thread-pre-split, !dbg !1207

bb47:                                             ; preds = %bb45
  %627 = load i8** @admins, align 8, !dbg !1208
  %628 = call fastcc i8** @comma_to_list(i8* %627) nounwind, !dbg !1208
  %629 = getelementptr inbounds %struct.sgrp* %sgent, i64 0, i32 2, !dbg !1208
  store i8** %628, i8*** %629, align 8, !dbg !1208
  %.b4 = load i1* @Mflg.b
  br i1 %.b4, label %bb54, label %output, !dbg !1209

bb52thread-pre-split:                             ; preds = %bb45
  %.b3.pr = load i1* @Mflg.b
  br i1 %.b3.pr, label %bb54, label %bb55, !dbg !1210

bb54:                                             ; preds = %bb52thread-pre-split, %bb47
  %630 = load i8** @members, align 8, !dbg !1211
  %631 = call fastcc i8** @comma_to_list(i8* %630) nounwind, !dbg !1211
  %632 = getelementptr inbounds %struct.sgrp* %sgent, i64 0, i32 3, !dbg !1211
  store i8** %631, i8*** %632, align 8, !dbg !1211
  %633 = load i8** @members, align 8, !dbg !1212
  %634 = call fastcc i8** @comma_to_list(i8* %633) nounwind, !dbg !1212
  store i8** %634, i8*** %464, align 8, !dbg !1212
  br label %output, !dbg !1212

bb55:                                             ; preds = %bb52thread-pre-split
  %635 = call i32 @isatty(i32 0) nounwind, !dbg !1213
  %636 = icmp eq i32 %635, 0, !dbg !1213
  br i1 %636, label %bb57, label %bb56, !dbg !1213

bb56:                                             ; preds = %bb55
  %637 = call i32 @isatty(i32 1) nounwind, !dbg !1213
  %638 = icmp eq i32 %637, 0, !dbg !1213
  br i1 %638, label %bb57, label %bb58, !dbg !1213

bb57:                                             ; preds = %bb56, %bb55
  %639 = load i8** @Prog, align 8, !dbg !1214
  %640 = load %struct.FILE** @stderr, align 8, !dbg !1214
  %641 = call i32 (%struct.FILE*, i8*, ...)* @fprintf(%struct.FILE* noalias %640, i8* noalias getelementptr inbounds ([15 x i8]* @.str65, i64 0, i64 0), i8* %639) nounwind, !dbg !1214
  call void @exit(i32 1) noreturn nounwind, !dbg !1215
  unreachable, !dbg !1215

bb58:                                             ; preds = %bb56
  %642 = call i32 @tcgetattr(i32 0, %struct.termios* @sgtty.5395) nounwind, !dbg !1216
  %643 = call void (i32)* (i32, void (i32)*)* @signal(i32 1, void (i32)* @catch_signals) nounwind, !dbg !1218
  %644 = call void (i32)* (i32, void (i32)*)* @signal(i32 2, void (i32)* @catch_signals) nounwind, !dbg !1219
  %645 = call void (i32)* (i32, void (i32)*)* @signal(i32 3, void (i32)* @catch_signals) nounwind, !dbg !1220
  %646 = call void (i32)* (i32, void (i32)*)* @signal(i32 15, void (i32)* @catch_signals) nounwind, !dbg !1221
  %647 = call void (i32)* (i32, void (i32)*)* @signal(i32 20, void (i32)* @catch_signals) nounwind, !dbg !1222
  %648 = load i8** @group, align 8, !dbg !1223
  %649 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([36 x i8]* @.str49, i64 0, i64 0), i8* %648) nounwind, !dbg !1223
  br label %bb9.i74, !dbg !1226

bb.i64:                                           ; preds = %bb9.i74
  %650 = call i8* @getpass(i8* getelementptr inbounds ([15 x i8]* @.str50, i64 0, i64 0)) nounwind, !dbg !1227
  %651 = icmp eq i8* %650, null, !dbg !1228
  br i1 %651, label %bb1.i65, label %bb2.i66, !dbg !1228

bb1.i65:                                          ; preds = %bb.i64
  call void @exit(i32 1) noreturn nounwind, !dbg !1229
  unreachable, !dbg !1229

bb2.i66:                                          ; preds = %bb.i64
  %652 = call i8* @strncpy(i8* noalias getelementptr inbounds ([8192 x i8]* @pass.6010, i64 0, i64 0), i8* noalias %650, i64 8191) nounwind, !dbg !1230
  store i8 0, i8* getelementptr inbounds ([8192 x i8]* @pass.6010, i64 0, i64 8191), align 1, !dbg !1230
  %653 = call i64 @strlen(i8* %650) nounwind readonly, !dbg !1231
  %654 = call i8* @memset(i8* %650, i32 0, i64 %653) nounwind
  %655 = call i8* @getpass(i8* getelementptr inbounds ([24 x i8]* @.str51, i64 0, i64 0)) nounwind, !dbg !1232
  %656 = icmp eq i8* %655, null, !dbg !1233
  br i1 %656, label %bb3.i67, label %bb4.i68, !dbg !1233

bb3.i67:                                          ; preds = %bb2.i66
  call void @exit(i32 1) noreturn nounwind, !dbg !1234
  unreachable, !dbg !1234

bb4.i68:                                          ; preds = %bb2.i66
  %657 = call i32 @strcmp(i8* getelementptr inbounds ([8192 x i8]* @pass.6010, i64 0, i64 0), i8* %655) nounwind readonly, !dbg !1235
  %658 = icmp eq i32 %657, 0, !dbg !1235
  %659 = call i64 @strlen(i8* %655) nounwind readonly, !dbg !1236
  %660 = call i8* @memset(i8* %655, i32 0, i64 %659) nounwind
  br i1 %658, label %bb10.i75, label %bb6.i70, !dbg !1235

bb6.i70:                                          ; preds = %bb4.i68
  %661 = call i8* @memset(i8* getelementptr inbounds ([8192 x i8]* @pass.6010, i64 0, i64 0), i32 0, i64 8192) nounwind
  %662 = add nsw i32 %storemerge.i73, 1, !dbg !1237
  %663 = icmp slt i32 %662, 3
  br i1 %663, label %bb7.i71, label %bb9.i74, !dbg !1237

bb7.i71:                                          ; preds = %bb6.i70
  %664 = call i32 @puts(i8* getelementptr inbounds ([28 x i8]* @.str52, i64 0, i64 0)) nounwind, !dbg !1238
  br label %bb9.i74, !dbg !1238

bb9.i74:                                          ; preds = %bb7.i71, %bb6.i70, %bb58
  %storemerge.i73 = phi i32 [ 0, %bb58 ], [ %662, %bb6.i70 ], [ %662, %bb7.i71 ]
  %665 = icmp slt i32 %storemerge.i73, 3
  br i1 %665, label %bb.i64, label %bb10.i75, !dbg !1226

bb10.i75:                                         ; preds = %bb9.i74, %bb4.i68
  %666 = icmp eq i32 %storemerge.i73, 3, !dbg !1239
  br i1 %666, label %bb11.i76, label %bb1.i.i, !dbg !1239

bb11.i76:                                         ; preds = %bb10.i75
  %667 = load i8** @Prog, align 8, !dbg !1240
  %668 = load %struct.FILE** @stderr, align 8, !dbg !1240
  %669 = call i32 (%struct.FILE*, i8*, ...)* @fprintf(%struct.FILE* noalias %668, i8* noalias getelementptr inbounds ([21 x i8]* @.str53, i64 0, i64 0), i8* %667) nounwind, !dbg !1240
  call void @exit(i32 1) noreturn nounwind, !dbg !1241
  unreachable, !dbg !1241

bb1.i.i:                                          ; preds = %bb10.i75
  store i8 0, i8* getelementptr inbounds ([40 x i8]* @result.5285, i64 0, i64 0), align 1
  %.b.i.i.i = load i1* @def_loaded.b
  br i1 %.b.i.i.i, label %bb4.i.i.i, label %bb.i.i.i

bb.i.i.i:                                         ; preds = %bb1.i.i
  call fastcc void @def_load() nounwind
  br label %bb4.i.i.i

bb4.i.i.i:                                        ; preds = %bb.i.i.i, %bb1.i.i
  %670 = call fastcc %struct.itemdef* @def_find(i8* getelementptr inbounds ([15 x i8]* @.str6104, i64 0, i64 0)) nounwind
  %671 = icmp eq %struct.itemdef* %670, null
  br i1 %671, label %bb2.i.i, label %getdef_str.exit.i.i

getdef_str.exit.i.i:                              ; preds = %bb4.i.i.i
  %672 = getelementptr inbounds %struct.itemdef* %670, i64 0, i32 1
  %673 = load i8** %672, align 8
  %674 = icmp eq i8* %673, null
  br i1 %674, label %bb2.i.i, label %bb6.i.i

bb2.i.i:                                          ; preds = %getdef_str.exit.i.i, %bb4.i.i.i
  %.b.i8.i.i = load i1* @def_loaded.b
  br i1 %.b.i8.i.i, label %bb4.i10.i.i, label %bb.i9.i.i

bb.i9.i.i:                                        ; preds = %bb2.i.i
  call fastcc void @def_load() nounwind
  br label %bb4.i10.i.i

bb4.i10.i.i:                                      ; preds = %bb.i9.i.i, %bb2.i.i
  %675 = call fastcc %struct.itemdef* @def_find(i8* getelementptr inbounds ([15 x i8]* @.str7105, i64 0, i64 0)) nounwind
  %676 = icmp eq %struct.itemdef* %675, null
  br i1 %676, label %bb4.i.i, label %bb5.i11.i.i

bb5.i11.i.i:                                      ; preds = %bb4.i10.i.i
  %677 = getelementptr inbounds %struct.itemdef* %675, i64 0, i32 1
  %678 = load i8** %677, align 8
  %679 = icmp eq i8* %678, null
  br i1 %679, label %bb4.i.i, label %getdef_bool.exit.i.i

getdef_bool.exit.i.i:                             ; preds = %bb5.i11.i.i
  %680 = call i32 @strcasecmp(i8* %678, i8* getelementptr inbounds ([4 x i8]* @.str67224, i64 0, i64 0)) nounwind readonly
  %phitmp = icmp eq i32 %680, 0
  br i1 %phitmp, label %bb6.i.i, label %bb4.i.i

bb4.i.i:                                          ; preds = %getdef_bool.exit.i.i, %bb5.i11.i.i, %bb4.i10.i.i
  br label %bb6.i.i

bb6.i.i:                                          ; preds = %bb4.i.i, %getdef_bool.exit.i.i, %getdef_str.exit.i.i
  %method.i.i.0 = phi i8* [ %673, %getdef_str.exit.i.i ], [ getelementptr inbounds ([4 x i8]* @.str9107, i64 0, i64 0), %bb4.i.i ], [ getelementptr inbounds ([4 x i8]* @.str8106, i64 0, i64 0), %getdef_bool.exit.i.i ]
  %681 = call i32 @strcmp(i8* %method.i.i.0, i8* getelementptr inbounds ([4 x i8]* @.str8106, i64 0, i64 0)) nounwind readonly
  %682 = icmp eq i32 %681, 0
  br i1 %682, label %bb7.i.i, label %bb8.i.i

bb7.i.i:                                          ; preds = %bb6.i.i
  store i8 36, i8* getelementptr inbounds ([40 x i8]* @result.5285, i64 0, i64 2), align 1
  store i8 36, i8* getelementptr inbounds ([40 x i8]* @result.5285, i64 0, i64 0), align 1
  store i8 49, i8* getelementptr inbounds ([40 x i8]* @result.5285, i64 0, i64 1), align 1
  store i8 0, i8* getelementptr inbounds ([40 x i8]* @result.5285, i64 0, i64 3), align 1
  br label %bb14.i.i

bb8.i.i:                                          ; preds = %bb6.i.i
  %683 = call i32 @strcmp(i8* %method.i.i.0, i8* getelementptr inbounds ([7 x i8]* @.str10108, i64 0, i64 0)) nounwind readonly
  %684 = icmp eq i32 %683, 0
  br i1 %684, label %bb9.i.i, label %bb10.i.i

bb9.i.i:                                          ; preds = %bb8.i.i
  store i8 36, i8* getelementptr inbounds ([40 x i8]* @result.5285, i64 0, i64 2), align 1
  store i8 36, i8* getelementptr inbounds ([40 x i8]* @result.5285, i64 0, i64 0), align 1
  store i8 53, i8* getelementptr inbounds ([40 x i8]* @result.5285, i64 0, i64 1), align 1
  store i8 0, i8* getelementptr inbounds ([40 x i8]* @result.5285, i64 0, i64 3), align 1
  %685 = call fastcc i8* @SHA_salt_rounds() nounwind
  %686 = call i8* @strcat(i8* noalias getelementptr inbounds ([40 x i8]* @result.5285, i64 0, i64 0), i8* noalias %685) nounwind
  %.b.i46 = load i1* @seeded.5201.b
  br i1 %.b.i46, label %seedRNG.exit, label %bb.i47

bb.i47:                                           ; preds = %bb9.i.i
  %687 = call i32 @gettimeofday(%struct.rlimit* noalias %tv.i, %struct.__mbstate_t* noalias null) nounwind
  %688 = getelementptr inbounds %struct.rlimit* %tv.i, i64 0, i32 0
  %689 = load i64* %688, align 8
  %690 = getelementptr inbounds %struct.rlimit* %tv.i, i64 0, i32 1
  %691 = load i64* %690, align 8
  %692 = xor i64 %689, %691
  %693 = trunc i64 %692 to i32
  %694 = call i32 @getpid() nounwind
  %695 = xor i32 %693, %694
  call void @srandom(i32 %695) nounwind
  store i1 true, i1* @seeded.5201.b
  br label %seedRNG.exit

seedRNG.exit:                                     ; preds = %bb.i47, %bb9.i.i
  %696 = call i64 @random() nounwind
  %697 = sitofp i64 %696 to double
  %698 = fmul double %697, 9.000000e+00
  %699 = fdiv double %698, 0x41DFFFFFFFC00000
  %700 = fadd double %699, 8.000000e+00
  %701 = fptoui double %700 to i64
  br label %bb14.i.i

bb10.i.i:                                         ; preds = %bb8.i.i
  %702 = call i32 @strcmp(i8* %method.i.i.0, i8* getelementptr inbounds ([7 x i8]* @.str11109, i64 0, i64 0)) nounwind readonly
  %703 = icmp eq i32 %702, 0
  br i1 %703, label %bb11.i.i, label %bb12.i.i

bb11.i.i:                                         ; preds = %bb10.i.i
  store i8 36, i8* getelementptr inbounds ([40 x i8]* @result.5285, i64 0, i64 2), align 1
  store i8 36, i8* getelementptr inbounds ([40 x i8]* @result.5285, i64 0, i64 0), align 1
  store i8 54, i8* getelementptr inbounds ([40 x i8]* @result.5285, i64 0, i64 1), align 1
  store i8 0, i8* getelementptr inbounds ([40 x i8]* @result.5285, i64 0, i64 3), align 1
  %704 = call fastcc i8* @SHA_salt_rounds() nounwind
  %705 = call i8* @strcat(i8* noalias getelementptr inbounds ([40 x i8]* @result.5285, i64 0, i64 0), i8* noalias %704) nounwind
  %.b.i49 = load i1* @seeded.5201.b
  br i1 %.b.i49, label %seedRNG.exit52, label %bb.i50

bb.i50:                                           ; preds = %bb11.i.i
  %706 = call i32 @gettimeofday(%struct.rlimit* noalias %tv.i48, %struct.__mbstate_t* noalias null) nounwind
  %707 = getelementptr inbounds %struct.rlimit* %tv.i48, i64 0, i32 0
  %708 = load i64* %707, align 8
  %709 = getelementptr inbounds %struct.rlimit* %tv.i48, i64 0, i32 1
  %710 = load i64* %709, align 8
  %711 = xor i64 %708, %710
  %712 = trunc i64 %711 to i32
  %713 = call i32 @getpid() nounwind
  %714 = xor i32 %712, %713
  call void @srandom(i32 %714) nounwind
  store i1 true, i1* @seeded.5201.b
  br label %seedRNG.exit52

seedRNG.exit52:                                   ; preds = %bb.i50, %bb11.i.i
  %715 = call i64 @random() nounwind
  %716 = sitofp i64 %715 to double
  %717 = fmul double %716, 9.000000e+00
  %718 = fdiv double %717, 0x41DFFFFFFFC00000
  %719 = fadd double %718, 8.000000e+00
  %720 = fptoui double %719 to i64
  br label %bb14.i.i

bb12.i.i:                                         ; preds = %bb10.i.i
  %721 = call i32 @strcmp(i8* %method.i.i.0, i8* getelementptr inbounds ([4 x i8]* @.str9107, i64 0, i64 0)) nounwind readonly
  %722 = icmp eq i32 %721, 0
  br i1 %722, label %bb14.i.i, label %bb13.i.i

bb13.i.i:                                         ; preds = %bb12.i.i
  %723 = load %struct.FILE** @stderr, align 8
  %724 = call i32 (%struct.FILE*, i8*, ...)* @fprintf(%struct.FILE* noalias %723, i8* noalias getelementptr inbounds ([56 x i8]* @.str12110, i64 0, i64 0), i8* %method.i.i.0) nounwind
  store i8 0, i8* getelementptr inbounds ([40 x i8]* @result.5285, i64 0, i64 0), align 1
  br label %bb14.i.i

bb14.i.i:                                         ; preds = %bb13.i.i, %bb12.i.i, %seedRNG.exit52, %seedRNG.exit, %bb7.i.i
  %salt_len.i.i.0 = phi i64 [ 8, %bb7.i.i ], [ %701, %seedRNG.exit ], [ %720, %seedRNG.exit52 ], [ 8, %bb12.i.i ], [ 8, %bb13.i.i ]
  %725 = call i64 @strlen(i8* getelementptr inbounds ([40 x i8]* @result.5285, i64 0, i64 0)) nounwind readonly
  %726 = add i64 %725, %salt_len.i.i.0
  %727 = icmp ugt i64 %726, 39
  br i1 %727, label %bb15.i.i, label %bb16.i.i

bb15.i.i:                                         ; preds = %bb14.i.i
  call void @__assert_fail(i8* getelementptr inbounds ([45 x i8]* @.str13111, i64 0, i64 0), i8* getelementptr inbounds ([21 x i8]* @.str5103, i64 0, i64 0), i32 246, i8* getelementptr inbounds ([16 x i8]* @__PRETTY_FUNCTION__.5288, i64 0, i64 0)) noreturn nounwind
  unreachable

bb16.i.i:                                         ; preds = %bb14.i.i
  %728 = sub i64 39, %725
  store i8 0, i8* getelementptr inbounds ([32 x i8]* @salt.5266, i64 0, i64 0), align 1
  %salt_len.i.i.0.off = add i64 %salt_len.i.i.0, -8
  %729 = icmp ugt i64 %salt_len.i.i.0.off, 8
  br i1 %729, label %bb1.i.i.i, label %bb2.i.i.i

bb1.i.i.i:                                        ; preds = %bb16.i.i
  call void @__assert_fail(i8* getelementptr inbounds ([34 x i8]* @.str4102, i64 0, i64 0), i8* getelementptr inbounds ([21 x i8]* @.str5103, i64 0, i64 0), i32 173, i8* getelementptr inbounds ([8 x i8]* @__PRETTY_FUNCTION__.5267, i64 0, i64 0)) noreturn nounwind
  unreachable

bb2.i.i.i:                                        ; preds = %bb16.i.i
  %.b.i.i.i.i = load i1* @seeded.5201.b
  br i1 %.b.i.i.i.i, label %seedRNG.exit.i.i.i, label %bb.i.i.i.i

bb.i.i.i.i:                                       ; preds = %bb2.i.i.i
  %730 = call i32 @gettimeofday(%struct.rlimit* noalias %tv.i.i.i.i, %struct.__mbstate_t* noalias null) nounwind
  %731 = getelementptr inbounds %struct.rlimit* %tv.i.i.i.i, i64 0, i32 0
  %732 = load i64* %731, align 8
  %733 = getelementptr inbounds %struct.rlimit* %tv.i.i.i.i, i64 0, i32 1
  %734 = load i64* %733, align 8
  %735 = xor i64 %732, %734
  %736 = trunc i64 %735 to i32
  %737 = call i32 @getpid() nounwind
  %738 = xor i32 %736, %737
  call void @srandom(i32 %738) nounwind
  store i1 true, i1* @seeded.5201.b
  br label %seedRNG.exit.i.i.i

seedRNG.exit.i.i.i:                               ; preds = %bb.i.i.i.i, %bb2.i.i.i
  %739 = call i64 @random() nounwind
  %740 = call i8* @l64a(i64 %739) nounwind
  %741 = call i8* @strcat(i8* noalias getelementptr inbounds ([32 x i8]* @salt.5266, i64 0, i64 0), i8* noalias %740) nounwind
  br label %bb3.i.i.i

bb3.i.i.i:                                        ; preds = %bb3.i.i.i, %seedRNG.exit.i.i.i
  %742 = call i64 @random() nounwind
  %743 = call i8* @l64a(i64 %742) nounwind
  %744 = call i8* @strcat(i8* noalias getelementptr inbounds ([32 x i8]* @salt.5266, i64 0, i64 0), i8* noalias %743) nounwind
  %745 = call i64 @strlen(i8* getelementptr inbounds ([32 x i8]* @salt.5266, i64 0, i64 0)) nounwind readonly
  %746 = icmp ult i64 %745, %salt_len.i.i.0
  br i1 %746, label %bb3.i.i.i, label %crypt_make_salt.exit.i

crypt_make_salt.exit.i:                           ; preds = %bb3.i.i.i
  %747 = getelementptr inbounds [32 x i8]* @salt.5266, i64 0, i64 %salt_len.i.i.0
  store i8 0, i8* %747, align 1
  %748 = call i8* @strncat(i8* noalias getelementptr inbounds ([40 x i8]* @result.5285, i64 0, i64 0), i8* noalias getelementptr inbounds ([32 x i8]* @salt.5266, i64 0, i64 0), i64 %728) nounwind
  %749 = call i8* @crypt(i8* getelementptr inbounds ([8192 x i8]* @pass.6010, i64 0, i64 0), i8* getelementptr inbounds ([40 x i8]* @result.5285, i64 0, i64 0)) nounwind
  %750 = icmp eq i8* %749, null
  br i1 %750, label %bb.i3.i, label %bb2.i5.i

bb.i3.i:                                          ; preds = %crypt_make_salt.exit.i
  call void @perror(i8* getelementptr inbounds ([6 x i8]* @.str252, i64 0, i64 0)) nounwind
  call void @exit(i32 1) noreturn nounwind
  unreachable

bb2.i5.i:                                         ; preds = %crypt_make_salt.exit.i
  %751 = load i8* getelementptr inbounds ([40 x i8]* @result.5285, i64 0, i64 0), align 1
  %752 = icmp eq i8 %751, 36
  br i1 %752, label %bb3.i6.i, label %bb10.i13.i

bb3.i6.i:                                         ; preds = %bb2.i5.i
  %753 = call i64 @strlen(i8* %749) nounwind readonly
  %754 = icmp ult i64 %753, 14
  br i1 %754, label %bb4.i7.i, label %bb10.i13.i

bb4.i7.i:                                         ; preds = %bb3.i6.i
  %755 = load i8* getelementptr inbounds ([40 x i8]* @result.5285, i64 0, i64 1), align 1
  %Pivot45 = icmp slt i8 %755, 53
  br i1 %Pivot45, label %LeafBlock36, label %NodeBlock42

NodeBlock42:                                      ; preds = %bb4.i7.i
  %Pivot43 = icmp slt i8 %755, 54
  br i1 %Pivot43, label %LeafBlock38, label %LeafBlock40

LeafBlock40:                                      ; preds = %NodeBlock42
  %SwitchLeaf41 = icmp eq i8 %755, 54
  br i1 %SwitchLeaf41, label %bb9.i12.i, label %bb8.i11.i

LeafBlock38:                                      ; preds = %NodeBlock42
  %SwitchLeaf39 = icmp eq i8 %755, 53
  br i1 %SwitchLeaf39, label %bb9.i12.i, label %bb8.i11.i

LeafBlock36:                                      ; preds = %bb4.i7.i
  %SwitchLeaf37 = icmp eq i8 %755, 49
  br i1 %SwitchLeaf37, label %bb9.i12.i, label %bb8.i11.i

bb8.i11.i:                                        ; preds = %LeafBlock36, %LeafBlock38, %LeafBlock40
  store i8 %755, i8* getelementptr inbounds ([4 x i8]* @nummethod.5168, i64 0, i64 1), align 1
  br label %bb9.i12.i

bb9.i12.i:                                        ; preds = %bb8.i11.i, %LeafBlock36, %LeafBlock38, %LeafBlock40
  %method.i2.i.0 = phi i8* [ getelementptr inbounds ([4 x i8]* @nummethod.5168, i64 0, i64 0), %bb8.i11.i ], [ getelementptr inbounds ([4 x i8]* @.str8106, i64 0, i64 0), %LeafBlock36 ], [ getelementptr inbounds ([7 x i8]* @.str10108, i64 0, i64 0), %LeafBlock38 ], [ getelementptr inbounds ([7 x i8]* @.str11109, i64 0, i64 0), %LeafBlock40 ]
  %756 = load %struct.FILE** @stderr, align 8
  %757 = call i32 (%struct.FILE*, i8*, ...)* @fprintf(%struct.FILE* noalias %756, i8* noalias getelementptr inbounds ([46 x i8]* @.str4256, i64 0, i64 0), i8* %method.i2.i.0) nounwind
  call void @exit(i32 1) noreturn nounwind
  unreachable

bb10.i13.i:                                       ; preds = %bb3.i6.i, %bb2.i5.i
  %758 = call i64 @strlen(i8* %749) nounwind readonly
  %759 = icmp eq i64 %758, 13
  br i1 %759, label %bb12.i15.i, label %pw_encrypt.exit.i

bb12.i15.i:                                       ; preds = %bb10.i13.i
  %760 = call i8* @strcpy(i8* noalias getelementptr inbounds ([128 x i8]* @cipher.5160, i64 0, i64 0), i8* noalias %749) nounwind
  br label %pw_encrypt.exit.i

pw_encrypt.exit.i:                                ; preds = %bb12.i15.i, %bb10.i13.i
  %storemerge.i16.i = phi i8* [ getelementptr inbounds ([128 x i8]* @cipher.5160, i64 0, i64 0), %bb12.i15.i ], [ %749, %bb10.i13.i ]
  %761 = call i8* @memset(i8* getelementptr inbounds ([8192 x i8]* @pass.6010, i64 0, i64 0), i32 0, i64 8192) nounwind
  br i1 %99, label %bb13.i79, label %bb14.i80, !dbg !1242

bb13.i79:                                         ; preds = %pw_encrypt.exit.i
  store i8* getelementptr inbounds ([2 x i8]* @.str48, i64 0, i64 0), i8** %456, align 8, !dbg !1243
  %762 = getelementptr inbounds %struct.sgrp* %sgent, i64 0, i32 1, !dbg !1244
  store i8* %storemerge.i16.i, i8** %762, align 8, !dbg !1244
  br label %output, !dbg !1244

bb14.i80:                                         ; preds = %pw_encrypt.exit.i
  store i8* %storemerge.i16.i, i8** %456, align 8, !dbg !1245
  br label %output, !dbg !1245

output:                                           ; preds = %bb14.i80, %bb13.i79, %bb54, %bb47, %bb38, %bb38.thread, %bb26, %bb24, %bb20, %bb19, %bb13, %bb12
  %763 = call i32 @setuid(i32 0) nounwind, !dbg !1246
  %764 = icmp eq i32 %763, 0, !dbg !1246
  br i1 %764, label %bb68, label %bb59, !dbg !1246

bb59:                                             ; preds = %output
  %765 = load %struct.FILE** @stderr, align 8, !dbg !1247
  %766 = bitcast %struct.FILE* %765 to i8*, !dbg !1247
  %767 = call i64 @fwrite(i8* getelementptr inbounds ([27 x i8]* @.str66, i64 0, i64 0), i64 1, i64 26, i8* %766) nounwind, !dbg !1247
  %768 = call i8* @setlocale(i32 6, i8* null) nounwind, !dbg !1248
  %769 = icmp eq i8* %768, null, !dbg !1248
  br i1 %769, label %bb65.thread, label %bb63, !dbg !1248

bb65.thread:                                      ; preds = %bb59
  call void (i32, i8*, ...)* @syslog(i32 3, i8* getelementptr inbounds ([16 x i8]* @.str67, i64 0, i64 0)) nounwind, !dbg !1248
  br label %bb67

bb63:                                             ; preds = %bb59
  %770 = call noalias i8* @strdup(i8* %768) nounwind, !dbg !1248
  %771 = icmp eq i8* %770, null, !dbg !1248
  br i1 %771, label %bb65.thread233, label %bb66, !dbg !1248

bb65.thread233:                                   ; preds = %bb63
  call void (i32, i8*, ...)* @syslog(i32 3, i8* getelementptr inbounds ([16 x i8]* @.str67, i64 0, i64 0)) nounwind, !dbg !1248
  br label %bb67

bb66:                                             ; preds = %bb63
  %772 = call i8* @setlocale(i32 6, i8* getelementptr inbounds ([2 x i8]* @.str25, i64 0, i64 0)) nounwind, !dbg !1248
  call void (i32, i8*, ...)* @syslog(i32 3, i8* getelementptr inbounds ([16 x i8]* @.str67, i64 0, i64 0)) nounwind, !dbg !1248
  %773 = call i8* @setlocale(i32 6, i8* %770) nounwind, !dbg !1248
  call void @free(i8* %770) nounwind, !dbg !1248
  br label %bb67, !dbg !1248

bb67:                                             ; preds = %bb66, %bb65.thread233, %bb65.thread
  call void @closelog() nounwind, !dbg !1250
  call void @exit(i32 1) noreturn nounwind, !dbg !1251
  unreachable, !dbg !1251

bb68:                                             ; preds = %output
  %774 = getelementptr inbounds %struct.rlimit* %rlim.i, i64 0, i32 1, !dbg !1252
  store i64 0, i64* %774, align 8, !dbg !1252
  %775 = getelementptr inbounds %struct.rlimit* %rlim.i, i64 0, i32 0, !dbg !1252
  store i64 0, i64* %775, align 8, !dbg !1252
  %776 = call i32 @setrlimit(i32 4, %struct.rlimit* %rlim.i) nounwind, !dbg !1258
  store i64 -1, i64* %774, align 8, !dbg !1259
  store i64 -1, i64* %775, align 8, !dbg !1259
  %777 = call i32 @setrlimit(i32 9, %struct.rlimit* %rlim.i) nounwind, !dbg !1260
  %778 = call i32 @setrlimit(i32 0, %struct.rlimit* %rlim.i) nounwind, !dbg !1261
  %779 = call i32 @setrlimit(i32 2, %struct.rlimit* %rlim.i) nounwind, !dbg !1262
  %780 = call i32 @setrlimit(i32 1, %struct.rlimit* %rlim.i) nounwind, !dbg !1263
  %781 = call i32 @setrlimit(i32 7, %struct.rlimit* %rlim.i) nounwind, !dbg !1264
  %782 = call i32 @setrlimit(i32 5, %struct.rlimit* %rlim.i) nounwind, !dbg !1265
  %783 = call i32 @setrlimit(i32 3, %struct.rlimit* %rlim.i) nounwind, !dbg !1266
  %784 = call void (i32)* (i32, void (i32)*)* @signal(i32 14, void (i32)* inttoptr (i64 1 to void (i32)*)) nounwind, !dbg !1267
  %785 = call void (i32)* (i32, void (i32)*)* @signal(i32 1, void (i32)* inttoptr (i64 1 to void (i32)*)) nounwind, !dbg !1268
  %786 = call void (i32)* (i32, void (i32)*)* @signal(i32 2, void (i32)* inttoptr (i64 1 to void (i32)*)) nounwind, !dbg !1269
  %787 = call void (i32)* (i32, void (i32)*)* @signal(i32 13, void (i32)* inttoptr (i64 1 to void (i32)*)) nounwind, !dbg !1270
  %788 = call void (i32)* (i32, void (i32)*)* @signal(i32 3, void (i32)* inttoptr (i64 1 to void (i32)*)) nounwind, !dbg !1271
  %789 = call void (i32)* (i32, void (i32)*)* @signal(i32 15, void (i32)* inttoptr (i64 1 to void (i32)*)) nounwind, !dbg !1272
  %790 = call void (i32)* (i32, void (i32)*)* @signal(i32 20, void (i32)* inttoptr (i64 1 to void (i32)*)) nounwind, !dbg !1273
  %791 = call void (i32)* (i32, void (i32)*)* @signal(i32 22, void (i32)* inttoptr (i64 1 to void (i32)*)) nounwind, !dbg !1274
  %792 = call i32 @umask(i32 63) nounwind, !dbg !1275
  %793 = call fastcc i32 @commonio_lock(%struct.commonio_db* @group_db) nounwind, !dbg !1276
  %794 = icmp eq i32 %793, 0, !dbg !1279
  br i1 %794, label %bb.i37, label %bb1.i39, !dbg !1279

bb.i37:                                           ; preds = %bb68
  %795 = load i8** @Prog, align 8, !dbg !1283
  %796 = load %struct.FILE** @stderr, align 8, !dbg !1283
  %797 = call i32 (%struct.FILE*, i8*, ...)* @fprintf(%struct.FILE* noalias %796, i8* noalias getelementptr inbounds ([38 x i8]* @.str23, i64 0, i64 0), i8* %795, i8* getelementptr inbounds (%struct.commonio_db* @group_db, i64 0, i32 0, i64 0)) nounwind, !dbg !1283
  call void @exit(i32 1) noreturn nounwind, !dbg !1284
  unreachable, !dbg !1284

bb1.i39:                                          ; preds = %bb68
  call fastcc void @add_cleanup(void (i8*)* @cleanup_unlock_group) nounwind
  br i1 %99, label %bb2.i41, label %bb5.i45, !dbg !1285

bb2.i41:                                          ; preds = %bb1.i39
  %798 = call fastcc i32 @commonio_lock(%struct.commonio_db* @gshadow_db) nounwind, !dbg !1286
  %799 = icmp eq i32 %798, 0, !dbg !1289
  br i1 %799, label %bb3.i43, label %bb4.i44, !dbg !1289

bb3.i43:                                          ; preds = %bb2.i41
  %800 = load i8** @Prog, align 8, !dbg !1290
  %801 = load %struct.FILE** @stderr, align 8, !dbg !1290
  %802 = call i32 (%struct.FILE*, i8*, ...)* @fprintf(%struct.FILE* noalias %801, i8* noalias getelementptr inbounds ([38 x i8]* @.str23, i64 0, i64 0), i8* %800, i8* getelementptr inbounds (%struct.commonio_db* @gshadow_db, i64 0, i32 0, i64 0)) nounwind, !dbg !1290
  call void @exit(i32 1) noreturn nounwind, !dbg !1291
  unreachable, !dbg !1291

bb4.i44:                                          ; preds = %bb2.i41
  call fastcc void @add_cleanup(void (i8*)* @cleanup_unlock_gshadow) nounwind
  br label %bb5.i45, !dbg !1292

bb5.i45:                                          ; preds = %bb4.i44, %bb1.i39
  call fastcc void @add_cleanup(void (i8*)* @log_gpasswd_failure_system) nounwind
  %803 = call fastcc i32 @commonio_open(%struct.commonio_db* @group_db, i32 2) nounwind, !dbg !1293
  %804 = icmp eq i32 %803, 0, !dbg !1294
  br i1 %804, label %bb6.i46, label %bb13.i53, !dbg !1294

bb6.i46:                                          ; preds = %bb5.i45
  %805 = load i8** @Prog, align 8, !dbg !1295
  %806 = load %struct.FILE** @stderr, align 8, !dbg !1295
  %807 = call i32 (%struct.FILE*, i8*, ...)* @fprintf(%struct.FILE* noalias %806, i8* noalias getelementptr inbounds ([20 x i8]* @.str24, i64 0, i64 0), i8* %805, i8* getelementptr inbounds (%struct.commonio_db* @group_db, i64 0, i32 0, i64 0)) nounwind, !dbg !1295
  %808 = call i8* @setlocale(i32 6, i8* null) nounwind, !dbg !1296
  %809 = icmp eq i8* %808, null, !dbg !1296
  br i1 %809, label %bb10.i50.thread, label %bb8.i48, !dbg !1296

bb10.i50.thread:                                  ; preds = %bb6.i46
  call void (i32, i8*, ...)* @syslog(i32 4, i8* getelementptr inbounds ([15 x i8]* @.str26, i64 0, i64 0), i8* getelementptr inbounds (%struct.commonio_db* @group_db, i64 0, i32 0, i64 0)) nounwind, !dbg !1296
  br label %bb12.i52

bb8.i48:                                          ; preds = %bb6.i46
  %810 = call noalias i8* @strdup(i8* %808) nounwind, !dbg !1296
  %811 = icmp eq i8* %810, null, !dbg !1296
  br i1 %811, label %bb10.i50.thread234, label %bb11.i51, !dbg !1296

bb10.i50.thread234:                               ; preds = %bb8.i48
  call void (i32, i8*, ...)* @syslog(i32 4, i8* getelementptr inbounds ([15 x i8]* @.str26, i64 0, i64 0), i8* getelementptr inbounds (%struct.commonio_db* @group_db, i64 0, i32 0, i64 0)) nounwind, !dbg !1296
  br label %bb12.i52

bb11.i51:                                         ; preds = %bb8.i48
  %812 = call i8* @setlocale(i32 6, i8* getelementptr inbounds ([2 x i8]* @.str25, i64 0, i64 0)) nounwind, !dbg !1296
  call void (i32, i8*, ...)* @syslog(i32 4, i8* getelementptr inbounds ([15 x i8]* @.str26, i64 0, i64 0), i8* getelementptr inbounds (%struct.commonio_db* @group_db, i64 0, i32 0, i64 0)) nounwind, !dbg !1296
  %813 = call i8* @setlocale(i32 6, i8* %810) nounwind, !dbg !1296
  call void @free(i8* %810) nounwind, !dbg !1296
  br label %bb12.i52, !dbg !1296

bb12.i52:                                         ; preds = %bb11.i51, %bb10.i50.thread234, %bb10.i50.thread
  call void @exit(i32 1) noreturn nounwind, !dbg !1298
  unreachable, !dbg !1298

bb13.i53:                                         ; preds = %bb5.i45
  br i1 %99, label %bb15.i54, label %open_files.exit, !dbg !1299

bb15.i54:                                         ; preds = %bb13.i53
  %814 = call fastcc i32 @commonio_open(%struct.commonio_db* @gshadow_db, i32 2) nounwind, !dbg !1300
  %815 = icmp eq i32 %814, 0, !dbg !1301
  br i1 %815, label %bb16.i55, label %bb25.i, !dbg !1301

bb16.i55:                                         ; preds = %bb15.i54
  %816 = load i8** @Prog, align 8, !dbg !1302
  %817 = load %struct.FILE** @stderr, align 8, !dbg !1302
  %818 = call i32 (%struct.FILE*, i8*, ...)* @fprintf(%struct.FILE* noalias %817, i8* noalias getelementptr inbounds ([20 x i8]* @.str24, i64 0, i64 0), i8* %816, i8* getelementptr inbounds (%struct.commonio_db* @gshadow_db, i64 0, i32 0, i64 0)) nounwind, !dbg !1302
  %819 = call i8* @setlocale(i32 6, i8* null) nounwind, !dbg !1303
  %820 = icmp eq i8* %819, null, !dbg !1303
  br i1 %820, label %bb22.i.thread, label %bb20.i57, !dbg !1303

bb22.i.thread:                                    ; preds = %bb16.i55
  call void (i32, i8*, ...)* @syslog(i32 4, i8* getelementptr inbounds ([15 x i8]* @.str26, i64 0, i64 0), i8* getelementptr inbounds (%struct.commonio_db* @gshadow_db, i64 0, i32 0, i64 0)) nounwind, !dbg !1303
  br label %bb24.i

bb20.i57:                                         ; preds = %bb16.i55
  %821 = call noalias i8* @strdup(i8* %819) nounwind, !dbg !1303
  %822 = icmp eq i8* %821, null, !dbg !1303
  br i1 %822, label %bb22.i.thread235, label %bb23.i, !dbg !1303

bb22.i.thread235:                                 ; preds = %bb20.i57
  call void (i32, i8*, ...)* @syslog(i32 4, i8* getelementptr inbounds ([15 x i8]* @.str26, i64 0, i64 0), i8* getelementptr inbounds (%struct.commonio_db* @gshadow_db, i64 0, i32 0, i64 0)) nounwind, !dbg !1303
  br label %bb24.i

bb23.i:                                           ; preds = %bb20.i57
  %823 = call i8* @setlocale(i32 6, i8* getelementptr inbounds ([2 x i8]* @.str25, i64 0, i64 0)) nounwind, !dbg !1303
  call void (i32, i8*, ...)* @syslog(i32 4, i8* getelementptr inbounds ([15 x i8]* @.str26, i64 0, i64 0), i8* getelementptr inbounds (%struct.commonio_db* @gshadow_db, i64 0, i32 0, i64 0)) nounwind, !dbg !1303
  %824 = call i8* @setlocale(i32 6, i8* %821) nounwind, !dbg !1303
  call void @free(i8* %821) nounwind, !dbg !1303
  br label %bb24.i, !dbg !1303

bb24.i:                                           ; preds = %bb23.i, %bb22.i.thread235, %bb22.i.thread
  call void @exit(i32 1) noreturn nounwind, !dbg !1305
  unreachable, !dbg !1305

bb25.i:                                           ; preds = %bb15.i54
  call fastcc void @add_cleanup(void (i8*)* @log_gpasswd_failure_gshadow) nounwind
  br label %open_files.exit, !dbg !1306

open_files.exit:                                  ; preds = %bb25.i, %bb13.i53
  call fastcc void @add_cleanup(void (i8*)* @log_gpasswd_failure_group) nounwind
  call fastcc void @del_cleanup(void (i8*)* @log_gpasswd_failure_system) nounwind, !dbg !1307
  %825 = bitcast %struct.group* %grent to i8*, !dbg !1308
  %826 = call fastcc i32 @commonio_update(%struct.commonio_db* @group_db, i8* %825) nounwind, !dbg !1308
  %827 = icmp eq i32 %826, 0, !dbg !1313
  br i1 %827, label %bb.i23, label %bb1.i25, !dbg !1313

bb.i23:                                           ; preds = %open_files.exit
  %828 = load i8** %453, align 8, !dbg !1317
  %829 = load i8** @Prog, align 8, !dbg !1317
  %830 = load %struct.FILE** @stderr, align 8, !dbg !1317
  %831 = call i32 (%struct.FILE*, i8*, ...)* @fprintf(%struct.FILE* noalias %830, i8* noalias getelementptr inbounds ([45 x i8]* @.str44, i64 0, i64 0), i8* %829, i8* getelementptr inbounds (%struct.commonio_db* @group_db, i64 0, i32 0, i64 0), i8* %828) nounwind, !dbg !1317
  call void @exit(i32 1) noreturn nounwind, !dbg !1318
  unreachable, !dbg !1318

bb1.i25:                                          ; preds = %open_files.exit
  br i1 %99, label %bb2.i27, label %update_group.exit, !dbg !1319

bb2.i27:                                          ; preds = %bb1.i25
  %832 = bitcast %struct.sgrp* %sgent to i8*, !dbg !1320
  %833 = call fastcc i32 @commonio_update(%struct.commonio_db* @gshadow_db, i8* %832) nounwind, !dbg !1320
  %834 = icmp eq i32 %833, 0, !dbg !1319
  br i1 %834, label %bb3.i29, label %update_group.exit, !dbg !1319

bb3.i29:                                          ; preds = %bb2.i27
  %835 = getelementptr inbounds %struct.sgrp* %sgent, i64 0, i32 0, !dbg !1325
  %836 = load i8** %835, align 8, !dbg !1325
  %837 = load i8** @Prog, align 8, !dbg !1325
  %838 = load %struct.FILE** @stderr, align 8, !dbg !1325
  %839 = call i32 (%struct.FILE*, i8*, ...)* @fprintf(%struct.FILE* noalias %838, i8* noalias getelementptr inbounds ([45 x i8]* @.str44, i64 0, i64 0), i8* %837, i8* getelementptr inbounds (%struct.commonio_db* @gshadow_db, i64 0, i32 0, i64 0), i8* %836) nounwind, !dbg !1325
  call void @exit(i32 1) noreturn nounwind, !dbg !1326
  unreachable, !dbg !1326

update_group.exit:                                ; preds = %bb2.i27, %bb1.i25
  %840 = call fastcc i32 @commonio_close(%struct.commonio_db* @group_db) nounwind, !dbg !1327
  %841 = icmp eq i32 %840, 0, !dbg !1328
  br i1 %841, label %bb.i11, label %bb1.i12, !dbg !1328

bb.i11:                                           ; preds = %update_group.exit
  %842 = load i8** @Prog, align 8, !dbg !1332
  %843 = load %struct.FILE** @stderr, align 8, !dbg !1332
  %844 = call i32 (%struct.FILE*, i8*, ...)* @fprintf(%struct.FILE* noalias %843, i8* noalias getelementptr inbounds ([41 x i8]* @.str43, i64 0, i64 0), i8* %842, i8* getelementptr inbounds (%struct.commonio_db* @group_db, i64 0, i32 0, i64 0)) nounwind, !dbg !1332
  call void @exit(i32 1) noreturn nounwind, !dbg !1333
  unreachable, !dbg !1333

bb1.i12:                                          ; preds = %update_group.exit
  call fastcc void @add_cleanup(void (i8*)* @log_gpasswd_success_group) nounwind
  call fastcc void @del_cleanup(void (i8*)* @log_gpasswd_failure_group) nounwind, !dbg !1334
  call void @cleanup_unlock_group(i8* null) nounwind, !dbg !1335
  call fastcc void @del_cleanup(void (i8*)* @cleanup_unlock_group) nounwind, !dbg !1336
  br i1 %99, label %bb2.i13, label %close_files.exit, !dbg !1337

bb2.i13:                                          ; preds = %bb1.i12
  %845 = call fastcc i32 @commonio_close(%struct.commonio_db* @gshadow_db) nounwind, !dbg !1338
  %846 = icmp eq i32 %845, 0, !dbg !1339
  br i1 %846, label %bb3.i14, label %bb4.i15, !dbg !1339

bb3.i14:                                          ; preds = %bb2.i13
  %847 = load i8** @Prog, align 8, !dbg !1340
  %848 = load %struct.FILE** @stderr, align 8, !dbg !1340
  %849 = call i32 (%struct.FILE*, i8*, ...)* @fprintf(%struct.FILE* noalias %848, i8* noalias getelementptr inbounds ([41 x i8]* @.str43, i64 0, i64 0), i8* %847, i8* getelementptr inbounds (%struct.commonio_db* @gshadow_db, i64 0, i32 0, i64 0)) nounwind, !dbg !1340
  call void @exit(i32 1) noreturn nounwind, !dbg !1341
  unreachable, !dbg !1341

bb4.i15:                                          ; preds = %bb2.i13
  call fastcc void @del_cleanup(void (i8*)* @log_gpasswd_failure_gshadow) nounwind, !dbg !1342
  call void @cleanup_unlock_gshadow(i8* null) nounwind, !dbg !1343
  call fastcc void @del_cleanup(void (i8*)* @cleanup_unlock_gshadow) nounwind, !dbg !1344
  br label %close_files.exit, !dbg !1344

close_files.exit:                                 ; preds = %bb4.i15, %bb1.i12
  call fastcc void @log_gpasswd_success(i8* getelementptr inbounds ([1 x i8]* @.str34, i64 0, i64 0)) nounwind
  call fastcc void @del_cleanup(void (i8*)* @log_gpasswd_success_group) nounwind, !dbg !1345
  call fastcc void @nscd_flush_cache(i8* getelementptr inbounds ([6 x i8]* @.str68, i64 0, i64 0)) nounwind
  call void @exit(i32 0) noreturn nounwind, !dbg !1346
  unreachable, !dbg !1346
}

declare i8* @bindtextdomain(i8*, i8*) nounwind

declare i8* @textdomain(i8*) nounwind

declare i32 @getuid() nounwind

declare void @openlog(i8*, i32, i32)

declare void @setbuf(%struct.FILE* noalias, i8* noalias) nounwind

declare i32 @atexit(void ()*) nounwind

declare i32 @isatty(i32) nounwind

declare void (i32)* @signal(i32, void (i32)*) nounwind

declare i32 @setuid(i32) nounwind

declare void @closelog()

define internal void @do_cleanups() nounwind {
entry:
  %0 = load void (i8*)** getelementptr inbounds ([10 x void (i8*)*]* @cleanup_functions, i64 0, i64 9), align 8, !dbg !1347
  %1 = icmp eq void (i8*)* %0, null, !dbg !1347
  br i1 %1, label %bb1, label %bb, !dbg !1347

bb:                                               ; preds = %entry
  call void @__assert_fail(i8* getelementptr inbounds ([39 x i8]* @.str69, i64 0, i64 0), i8* getelementptr inbounds ([24 x i8]* @.str170, i64 0, i64 0), i32 71, i8* getelementptr inbounds ([12 x i8]* @__PRETTY_FUNCTION__.5178, i64 0, i64 0)) noreturn nounwind, !dbg !1347
  unreachable, !dbg !1347

bb1:                                              ; preds = %entry
  %2 = call i32 @getpid() nounwind, !dbg !1351
  %3 = load i32* @cleanup_pid, align 4, !dbg !1351
  %4 = icmp eq i32 %2, %3, !dbg !1351
  br i1 %4, label %bb3, label %return, !dbg !1351

bb3:                                              ; preds = %bb5, %bb1
  %i.0 = phi i32 [ %5, %bb5 ], [ 10, %bb1 ]
  %5 = add i32 %i.0, -1
  %6 = zext i32 %5 to i64, !dbg !1352
  %7 = getelementptr inbounds [10 x void (i8*)*]* @cleanup_functions, i64 0, i64 %6, !dbg !1352
  %8 = load void (i8*)** %7, align 8, !dbg !1352
  %9 = icmp eq void (i8*)* %8, null, !dbg !1352
  br i1 %9, label %bb5, label %bb4, !dbg !1352

bb4:                                              ; preds = %bb3
  %10 = getelementptr inbounds [10 x i8*]* @cleanup_function_args, i64 0, i64 %6, !dbg !1353
  %11 = load i8** %10, align 8, !dbg !1353
  call void %8(i8* %11) nounwind, !dbg !1353
  br label %bb5, !dbg !1353

bb5:                                              ; preds = %bb4, %bb3
  %12 = icmp eq i32 %5, 0, !dbg !1354
  br i1 %12, label %return, label %bb3, !dbg !1354

return:                                           ; preds = %bb5, %bb1
  ret void, !dbg !1354
}

declare void @__assert_fail(i8*, i8*, i32, i8*) noreturn nounwind

declare i32 @getpid() nounwind

define internal fastcc void @add_cleanup(void (i8*)* %pcf) nounwind {
entry:
  %0 = icmp eq void (i8*)* %pcf, null, !dbg !1355
  br i1 %0, label %bb, label %bb1, !dbg !1355

bb:                                               ; preds = %entry
  call void @__assert_fail(i8* getelementptr inbounds ([19 x i8]* @.str271, i64 0, i64 0), i8* getelementptr inbounds ([24 x i8]* @.str170, i64 0, i64 0), i32 92, i8* getelementptr inbounds ([12 x i8]* @__PRETTY_FUNCTION__.5201, i64 0, i64 0)) noreturn nounwind, !dbg !1355
  unreachable, !dbg !1355

bb1:                                              ; preds = %entry
  %1 = load void (i8*)** getelementptr inbounds ([10 x void (i8*)*]* @cleanup_functions, i64 0, i64 8), align 32, !dbg !1360
  %2 = icmp eq void (i8*)* %1, null, !dbg !1360
  br i1 %2, label %bb3, label %bb2, !dbg !1360

bb2:                                              ; preds = %bb1
  call void @__assert_fail(i8* getelementptr inbounds ([39 x i8]* @.str372, i64 0, i64 0), i8* getelementptr inbounds ([24 x i8]* @.str170, i64 0, i64 0), i32 94, i8* getelementptr inbounds ([12 x i8]* @__PRETTY_FUNCTION__.5201, i64 0, i64 0)) noreturn nounwind, !dbg !1360
  unreachable, !dbg !1360

bb3:                                              ; preds = %bb1
  %3 = load i32* @cleanup_pid, align 4, !dbg !1361
  %4 = icmp eq i32 %3, 0, !dbg !1361
  br i1 %4, label %bb4, label %bb7, !dbg !1361

bb4:                                              ; preds = %bb3
  %5 = call i32 @getpid() nounwind, !dbg !1362
  store i32 %5, i32* @cleanup_pid, align 4, !dbg !1362
  br label %bb7, !dbg !1362

bb6:                                              ; preds = %bb7
  %6 = add i32 %storemerge, 1, !dbg !1363
  br label %bb7, !dbg !1363

bb7:                                              ; preds = %bb6, %bb4, %bb3
  %storemerge = phi i32 [ %6, %bb6 ], [ 0, %bb3 ], [ 0, %bb4 ]
  %7 = zext i32 %storemerge to i64, !dbg !1363
  %8 = getelementptr inbounds [10 x void (i8*)*]* @cleanup_functions, i64 0, i64 %7, !dbg !1363
  %9 = load void (i8*)** %8, align 8, !dbg !1363
  %10 = icmp eq void (i8*)* %9, null, !dbg !1363
  br i1 %10, label %return, label %bb6, !dbg !1363

return:                                           ; preds = %bb7
  store void (i8*)* %pcf, void (i8*)** %8, align 8, !dbg !1364
  %11 = getelementptr inbounds [10 x i8*]* @cleanup_function_args, i64 0, i64 %7, !dbg !1365
  store i8* null, i8** %11, align 8, !dbg !1365
  ret void, !dbg !1366
}

define internal fastcc void @del_cleanup(void (i8*)* %pcf) nounwind {
entry:
  %0 = icmp eq void (i8*)* %pcf, null, !dbg !1367
  br i1 %0, label %bb, label %bb4, !dbg !1367

bb:                                               ; preds = %entry
  call void @__assert_fail(i8* getelementptr inbounds ([19 x i8]* @.str271, i64 0, i64 0), i8* getelementptr inbounds ([24 x i8]* @.str170, i64 0, i64 0), i32 112, i8* getelementptr inbounds ([12 x i8]* @__PRETTY_FUNCTION__.5222, i64 0, i64 0)) noreturn nounwind, !dbg !1367
  unreachable, !dbg !1367

bb2:                                              ; preds = %bb4
  %1 = zext i32 %storemerge to i64, !dbg !1372
  %2 = getelementptr inbounds [10 x void (i8*)*]* @cleanup_functions, i64 0, i64 %1, !dbg !1372
  %3 = load void (i8*)** %2, align 8, !dbg !1372
  %4 = icmp eq void (i8*)* %3, %pcf, !dbg !1372
  br i1 %4, label %bb5, label %bb3, !dbg !1372

bb3:                                              ; preds = %bb2
  %5 = add i32 %storemerge, 1, !dbg !1373
  br label %bb4, !dbg !1373

bb4:                                              ; preds = %bb3, %entry
  %storemerge = phi i32 [ %5, %bb3 ], [ 0, %entry ]
  %6 = icmp ult i32 %storemerge, 10
  br i1 %6, label %bb2, label %bb5, !dbg !1373

bb5:                                              ; preds = %bb4, %bb2
  %7 = icmp ugt i32 %storemerge, 9, !dbg !1374
  br i1 %7, label %bb6, label %bb16, !dbg !1374

bb6:                                              ; preds = %bb5
  call void @__assert_fail(i8* getelementptr inbounds ([5 x i8]* @.str473, i64 0, i64 0), i8* getelementptr inbounds ([24 x i8]* @.str170, i64 0, i64 0), i32 122, i8* getelementptr inbounds ([12 x i8]* @__PRETTY_FUNCTION__.5222, i64 0, i64 0)) noreturn nounwind, !dbg !1374
  unreachable, !dbg !1374

bb8:                                              ; preds = %bb16
  %8 = icmp eq i32 %i.0, 9, !dbg !1375
  br i1 %8, label %bb12, label %bb9, !dbg !1375

bb9:                                              ; preds = %bb8
  %9 = add i32 %i.0, 1, !dbg !1375
  %10 = zext i32 %9 to i64, !dbg !1375
  %11 = getelementptr inbounds [10 x void (i8*)*]* @cleanup_functions, i64 0, i64 %10, !dbg !1375
  %12 = load void (i8*)** %11, align 8, !dbg !1375
  %13 = icmp eq void (i8*)* %12, %pcf, !dbg !1375
  br i1 %13, label %bb10, label %bb11, !dbg !1375

bb10:                                             ; preds = %bb9
  call void @__assert_fail(i8* getelementptr inbounds ([50 x i8]* @.str574, i64 0, i64 0), i8* getelementptr inbounds ([24 x i8]* @.str170, i64 0, i64 0), i32 128, i8* getelementptr inbounds ([12 x i8]* @__PRETTY_FUNCTION__.5222, i64 0, i64 0)) noreturn nounwind, !dbg !1375
  unreachable, !dbg !1375

bb11:                                             ; preds = %bb9
  br i1 %8, label %bb12, label %bb13, !dbg !1376

bb12:                                             ; preds = %bb11, %bb8
  %14 = zext i32 %i.0 to i64, !dbg !1377
  %15 = getelementptr inbounds [10 x void (i8*)*]* @cleanup_functions, i64 0, i64 %14, !dbg !1377
  store void (i8*)* null, void (i8*)** %15, align 8, !dbg !1377
  %16 = getelementptr inbounds [10 x i8*]* @cleanup_function_args, i64 0, i64 %14, !dbg !1378
  store i8* null, i8** %16, align 8, !dbg !1378
  br label %bb14, !dbg !1378

bb13:                                             ; preds = %bb11
  %17 = zext i32 %i.0 to i64, !dbg !1379
  %18 = getelementptr inbounds [10 x void (i8*)*]* @cleanup_functions, i64 0, i64 %17, !dbg !1379
  store void (i8*)* %12, void (i8*)** %18, align 8, !dbg !1379
  %19 = getelementptr inbounds [10 x i8*]* @cleanup_function_args, i64 0, i64 %10, !dbg !1380
  %20 = load i8** %19, align 8, !dbg !1380
  %21 = getelementptr inbounds [10 x i8*]* @cleanup_function_args, i64 0, i64 %17, !dbg !1380
  store i8* %20, i8** %21, align 8, !dbg !1380
  br label %bb14, !dbg !1380

bb14:                                             ; preds = %bb13, %bb12
  %22 = zext i32 %i.0 to i64, !dbg !1381
  %23 = getelementptr inbounds [10 x void (i8*)*]* @cleanup_functions, i64 0, i64 %22, !dbg !1381
  %24 = load void (i8*)** %23, align 8, !dbg !1381
  %25 = icmp eq void (i8*)* %24, null, !dbg !1381
  br i1 %25, label %return, label %bb15, !dbg !1381

bb15:                                             ; preds = %bb14
  %26 = add i32 %i.0, 1, !dbg !1382
  br label %bb16, !dbg !1382

bb16:                                             ; preds = %bb15, %bb5
  %i.0 = phi i32 [ %26, %bb15 ], [ %storemerge, %bb5 ]
  %27 = icmp ult i32 %i.0, 10
  br i1 %27, label %bb8, label %return, !dbg !1382

return:                                           ; preds = %bb16, %bb14
  ret void, !dbg !1383
}

declare i8* @strrchr(i8*, i32) nounwind readonly

define internal fastcc i8** @add_list(i8** %list, i8* %member) nounwind {
entry:
  %0 = icmp eq i8* %member, null, !dbg !1384
  br i1 %0, label %bb, label %bb1, !dbg !1384

bb:                                               ; preds = %entry
  call void @__assert_fail(i8* getelementptr inbounds ([22 x i8]* @.str79, i64 0, i64 0), i8* getelementptr inbounds ([21 x i8]* @.str180, i64 0, i64 0), i32 51, i8* getelementptr inbounds ([9 x i8]* @__PRETTY_FUNCTION__.5176, i64 0, i64 0)) noreturn nounwind, !dbg !1384
  unreachable, !dbg !1384

bb1:                                              ; preds = %entry
  %1 = icmp eq i8** %list, null, !dbg !1390
  br i1 %1, label %bb2, label %bb7, !dbg !1390

bb2:                                              ; preds = %bb1
  call void @__assert_fail(i8* getelementptr inbounds ([20 x i8]* @.str281, i64 0, i64 0), i8* getelementptr inbounds ([21 x i8]* @.str180, i64 0, i64 0), i32 52, i8* getelementptr inbounds ([9 x i8]* @__PRETTY_FUNCTION__.5176, i64 0, i64 0)) noreturn nounwind, !dbg !1390
  unreachable, !dbg !1390

bb4:                                              ; preds = %bb7
  %2 = call i32 @strcmp(i8* %7, i8* %member) nounwind readonly, !dbg !1391
  %3 = icmp eq i32 %2, 0, !dbg !1391
  br i1 %3, label %return, label %bb6, !dbg !1391

bb6:                                              ; preds = %bb4
  %4 = add nsw i32 %storemerge, 1, !dbg !1392
  br label %bb7, !dbg !1392

bb7:                                              ; preds = %bb6, %bb1
  %storemerge = phi i32 [ %4, %bb6 ], [ 0, %bb1 ]
  %5 = sext i32 %storemerge to i64, !dbg !1392
  %6 = getelementptr inbounds i8** %list, i64 %5, !dbg !1392
  %7 = load i8** %6, align 1, !dbg !1392
  %8 = icmp eq i8* %7, null, !dbg !1392
  br i1 %8, label %bb8, label %bb4, !dbg !1392

bb8:                                              ; preds = %bb7
  %9 = add nsw i32 %storemerge, 2, !dbg !1393
  %10 = sext i32 %9 to i64, !dbg !1393
  %11 = shl i64 %10, 3
  %12 = call noalias i8* @malloc(i64 %11) nounwind, !dbg !1394
  %13 = icmp eq i8* %12, null, !dbg !1395
  br i1 %13, label %bb.i, label %xmalloc.exit, !dbg !1395

bb.i:                                             ; preds = %bb8
  %14 = call i32* @__errno_location() nounwind readnone, !dbg !1396
  %15 = load i32* %14, align 4, !dbg !1396
  %16 = call i8* @strerror(i32 %15) nounwind, !dbg !1396
  %17 = load i8** @Prog, align 8, !dbg !1396
  %18 = load %struct.FILE** @stderr, align 8, !dbg !1396
  %19 = call i32 (%struct.FILE*, i8*, ...)* @fprintf(%struct.FILE* noalias %18, i8* noalias getelementptr inbounds ([35 x i8]* @.str147, i64 0, i64 0), i8* %17, i8* %16) nounwind, !dbg !1396
  call void @exit(i32 13) noreturn nounwind, !dbg !1397
  unreachable, !dbg !1397

xmalloc.exit:                                     ; preds = %bb8
  %20 = bitcast i8* %12 to i8**, !dbg !1393
  br label %bb10, !dbg !1398

bb9:                                              ; preds = %bb10
  %21 = getelementptr inbounds i8** %20, i64 %23, !dbg !1399
  store i8* %25, i8** %21, align 1, !dbg !1399
  %22 = add nsw i32 %storemerge1, 1, !dbg !1398
  br label %bb10, !dbg !1398

bb10:                                             ; preds = %bb9, %xmalloc.exit
  %storemerge1 = phi i32 [ 0, %xmalloc.exit ], [ %22, %bb9 ]
  %23 = sext i32 %storemerge1 to i64, !dbg !1398
  %24 = getelementptr inbounds i8** %list, i64 %23, !dbg !1398
  %25 = load i8** %24, align 1, !dbg !1398
  %26 = icmp eq i8* %25, null, !dbg !1398
  br i1 %26, label %bb11, label %bb9, !dbg !1398

bb11:                                             ; preds = %bb10
  %27 = call i64 @strlen(i8* %member) nounwind readonly, !dbg !1400
  %28 = add i64 %27, 1, !dbg !1400
  %29 = call noalias i8* @malloc(i64 %28) nounwind, !dbg !1402
  %30 = icmp eq i8* %29, null, !dbg !1403
  br i1 %30, label %bb.i1, label %xmalloc.exit2, !dbg !1403

bb.i1:                                            ; preds = %bb11
  %31 = call i32* @__errno_location() nounwind readnone, !dbg !1404
  %32 = load i32* %31, align 4, !dbg !1404
  %33 = call i8* @strerror(i32 %32) nounwind, !dbg !1404
  %34 = load i8** @Prog, align 8, !dbg !1404
  %35 = load %struct.FILE** @stderr, align 8, !dbg !1404
  %36 = call i32 (%struct.FILE*, i8*, ...)* @fprintf(%struct.FILE* noalias %35, i8* noalias getelementptr inbounds ([35 x i8]* @.str147, i64 0, i64 0), i8* %34, i8* %33) nounwind, !dbg !1404
  call void @exit(i32 13) noreturn nounwind, !dbg !1405
  unreachable, !dbg !1405

xmalloc.exit2:                                    ; preds = %bb11
  %37 = call i8* @strcpy(i8* noalias %29, i8* noalias %member) nounwind, !dbg !1400
  %38 = getelementptr inbounds i8** %20, i64 %23, !dbg !1401
  store i8* %37, i8** %38, align 1, !dbg !1401
  %39 = add nsw i32 %storemerge1, 1, !dbg !1406
  %40 = sext i32 %39 to i64, !dbg !1406
  %41 = getelementptr inbounds i8** %20, i64 %40, !dbg !1406
  store i8* null, i8** %41, align 1, !dbg !1406
  ret i8** %20, !dbg !1407

return:                                           ; preds = %bb4
  ret i8** %list, !dbg !1407
}

define internal fastcc i8** @del_list(i8** %list, i8* %member) nounwind {
entry:
  %0 = icmp eq i8* %member, null, !dbg !1408
  br i1 %0, label %bb, label %bb1, !dbg !1408

bb:                                               ; preds = %entry
  call void @__assert_fail(i8* getelementptr inbounds ([22 x i8]* @.str79, i64 0, i64 0), i8* getelementptr inbounds ([21 x i8]* @.str180, i64 0, i64 0), i32 101, i8* getelementptr inbounds ([9 x i8]* @__PRETTY_FUNCTION__.5210, i64 0, i64 0)) noreturn nounwind, !dbg !1408
  unreachable, !dbg !1408

bb1:                                              ; preds = %entry
  %1 = icmp eq i8** %list, null, !dbg !1411
  br i1 %1, label %bb2, label %bb7, !dbg !1411

bb2:                                              ; preds = %bb1
  call void @__assert_fail(i8* getelementptr inbounds ([20 x i8]* @.str281, i64 0, i64 0), i8* getelementptr inbounds ([21 x i8]* @.str180, i64 0, i64 0), i32 102, i8* getelementptr inbounds ([9 x i8]* @__PRETTY_FUNCTION__.5210, i64 0, i64 0)) noreturn nounwind, !dbg !1411
  unreachable, !dbg !1411

bb4:                                              ; preds = %bb7
  %2 = call i32 @strcmp(i8* %7, i8* %member) nounwind readonly, !dbg !1412
  %not. = icmp ne i32 %2, 0
  %3 = zext i1 %not. to i32
  %j.1. = add i32 %j.1, %3
  %4 = add nsw i32 %storemerge, 1, !dbg !1413
  br label %bb7, !dbg !1413

bb7:                                              ; preds = %bb4, %bb1
  %j.1 = phi i32 [ %j.1., %bb4 ], [ 0, %bb1 ]
  %storemerge = phi i32 [ %4, %bb4 ], [ 0, %bb1 ]
  %5 = sext i32 %storemerge to i64, !dbg !1413
  %6 = getelementptr inbounds i8** %list, i64 %5, !dbg !1413
  %7 = load i8** %6, align 1, !dbg !1413
  %8 = icmp eq i8* %7, null, !dbg !1413
  br i1 %8, label %bb8, label %bb4, !dbg !1413

bb8:                                              ; preds = %bb7
  %9 = icmp eq i32 %j.1, %storemerge, !dbg !1414
  br i1 %9, label %return, label %bb10, !dbg !1414

bb10:                                             ; preds = %bb8
  %10 = add nsw i32 %j.1, 1, !dbg !1415
  %11 = sext i32 %10 to i64, !dbg !1415
  %12 = shl i64 %11, 3
  %13 = call noalias i8* @malloc(i64 %12) nounwind, !dbg !1416
  %14 = icmp eq i8* %13, null, !dbg !1417
  br i1 %14, label %bb.i, label %xmalloc.exit, !dbg !1417

bb.i:                                             ; preds = %bb10
  %15 = call i32* @__errno_location() nounwind readnone, !dbg !1418
  %16 = load i32* %15, align 4, !dbg !1418
  %17 = call i8* @strerror(i32 %16) nounwind, !dbg !1418
  %18 = load i8** @Prog, align 8, !dbg !1418
  %19 = load %struct.FILE** @stderr, align 8, !dbg !1418
  %20 = call i32 (%struct.FILE*, i8*, ...)* @fprintf(%struct.FILE* noalias %19, i8* noalias getelementptr inbounds ([35 x i8]* @.str147, i64 0, i64 0), i8* %18, i8* %17) nounwind, !dbg !1418
  call void @exit(i32 13) noreturn nounwind, !dbg !1419
  unreachable, !dbg !1419

xmalloc.exit:                                     ; preds = %bb10
  %21 = bitcast i8* %13 to i8**, !dbg !1415
  br label %bb14, !dbg !1420

bb11:                                             ; preds = %bb14
  %22 = call i32 @strcmp(i8* %30, i8* %member) nounwind readonly, !dbg !1421
  %23 = icmp eq i32 %22, 0, !dbg !1421
  br i1 %23, label %bb13, label %bb12, !dbg !1421

bb12:                                             ; preds = %bb11
  %24 = sext i32 %j.3 to i64, !dbg !1422
  %25 = getelementptr inbounds i8** %21, i64 %24, !dbg !1422
  store i8* %30, i8** %25, align 1, !dbg !1422
  %26 = add nsw i32 %j.3, 1, !dbg !1423
  br label %bb13, !dbg !1423

bb13:                                             ; preds = %bb12, %bb11
  %j.2 = phi i32 [ %j.3, %bb11 ], [ %26, %bb12 ]
  %27 = add nsw i32 %storemerge1, 1, !dbg !1420
  br label %bb14, !dbg !1420

bb14:                                             ; preds = %bb13, %xmalloc.exit
  %j.3 = phi i32 [ 0, %xmalloc.exit ], [ %j.2, %bb13 ]
  %storemerge1 = phi i32 [ 0, %xmalloc.exit ], [ %27, %bb13 ]
  %28 = sext i32 %storemerge1 to i64, !dbg !1420
  %29 = getelementptr inbounds i8** %list, i64 %28, !dbg !1420
  %30 = load i8** %29, align 1, !dbg !1420
  %31 = icmp eq i8* %30, null, !dbg !1420
  br i1 %31, label %bb15, label %bb11, !dbg !1420

bb15:                                             ; preds = %bb14
  %32 = sext i32 %j.3 to i64, !dbg !1424
  %33 = getelementptr inbounds i8** %21, i64 %32, !dbg !1424
  store i8* null, i8** %33, align 1, !dbg !1424
  ret i8** %21, !dbg !1425

return:                                           ; preds = %bb8
  ret i8** %list, !dbg !1425
}

define internal fastcc noalias i8** @dup_list(i8** %list) nounwind {
entry:
  %0 = icmp eq i8** %list, null
  br i1 %0, label %bb, label %bb3, !dbg !1426

bb:                                               ; preds = %entry
  call void @__assert_fail(i8* getelementptr inbounds ([20 x i8]* @.str281, i64 0, i64 0), i8* getelementptr inbounds ([21 x i8]* @.str180, i64 0, i64 0), i32 155, i8* getelementptr inbounds ([9 x i8]* @__PRETTY_FUNCTION__.5246, i64 0, i64 0)) noreturn nounwind, !dbg !1426
  unreachable, !dbg !1426

bb3:                                              ; preds = %bb3, %entry
  %storemerge = phi i32 [ %5, %bb3 ], [ 0, %entry ]
  %1 = sext i32 %storemerge to i64, !dbg !1431
  %2 = getelementptr inbounds i8** %list, i64 %1, !dbg !1431
  %3 = load i8** %2, align 1, !dbg !1431
  %4 = icmp eq i8* %3, null, !dbg !1431
  %5 = add nsw i32 %storemerge, 1, !dbg !1432
  br i1 %4, label %bb4, label %bb3, !dbg !1431

bb4:                                              ; preds = %bb3
  %6 = sext i32 %5 to i64, !dbg !1432
  %7 = shl i64 %6, 3
  %8 = call noalias i8* @malloc(i64 %7) nounwind, !dbg !1433
  %9 = icmp eq i8* %8, null, !dbg !1434
  br i1 %9, label %bb.i, label %xmalloc.exit, !dbg !1434

bb.i:                                             ; preds = %bb4
  %10 = call i32* @__errno_location() nounwind readnone, !dbg !1435
  %11 = load i32* %10, align 4, !dbg !1435
  %12 = call i8* @strerror(i32 %11) nounwind, !dbg !1435
  %13 = load i8** @Prog, align 8, !dbg !1435
  %14 = load %struct.FILE** @stderr, align 8, !dbg !1435
  %15 = call i32 (%struct.FILE*, i8*, ...)* @fprintf(%struct.FILE* noalias %14, i8* noalias getelementptr inbounds ([35 x i8]* @.str147, i64 0, i64 0), i8* %13, i8* %12) nounwind, !dbg !1435
  call void @exit(i32 13) noreturn nounwind, !dbg !1436
  unreachable, !dbg !1436

xmalloc.exit:                                     ; preds = %bb4
  %16 = bitcast i8* %8 to i8**, !dbg !1432
  br label %bb6, !dbg !1437

bb5:                                              ; preds = %bb6
  %17 = call i64 @strlen(i8* %32) nounwind readonly, !dbg !1438
  %18 = add i64 %17, 1, !dbg !1438
  %19 = call noalias i8* @malloc(i64 %18) nounwind, !dbg !1440
  %20 = icmp eq i8* %19, null, !dbg !1441
  br i1 %20, label %bb.i1, label %xmalloc.exit2, !dbg !1441

bb.i1:                                            ; preds = %bb5
  %21 = call i32* @__errno_location() nounwind readnone, !dbg !1442
  %22 = load i32* %21, align 4, !dbg !1442
  %23 = call i8* @strerror(i32 %22) nounwind, !dbg !1442
  %24 = load i8** @Prog, align 8, !dbg !1442
  %25 = load %struct.FILE** @stderr, align 8, !dbg !1442
  %26 = call i32 (%struct.FILE*, i8*, ...)* @fprintf(%struct.FILE* noalias %25, i8* noalias getelementptr inbounds ([35 x i8]* @.str147, i64 0, i64 0), i8* %24, i8* %23) nounwind, !dbg !1442
  call void @exit(i32 13) noreturn nounwind, !dbg !1443
  unreachable, !dbg !1443

xmalloc.exit2:                                    ; preds = %bb5
  %27 = call i8* @strcpy(i8* noalias %19, i8* noalias %32) nounwind, !dbg !1438
  %28 = sext i32 %i.0 to i64, !dbg !1439
  %29 = getelementptr inbounds i8** %16, i64 %28, !dbg !1439
  store i8* %27, i8** %29, align 1, !dbg !1439
  %30 = add nsw i32 %i.0, 1, !dbg !1444
  %31 = getelementptr inbounds i8** %list_addr.0, i64 1, !dbg !1445
  br label %bb6, !dbg !1445

bb6:                                              ; preds = %xmalloc.exit2, %xmalloc.exit
  %list_addr.0 = phi i8** [ %list, %xmalloc.exit ], [ %31, %xmalloc.exit2 ]
  %i.0 = phi i32 [ 0, %xmalloc.exit ], [ %30, %xmalloc.exit2 ]
  %32 = load i8** %list_addr.0, align 8, !dbg !1446
  %33 = icmp eq i8* %32, null, !dbg !1446
  br i1 %33, label %return, label %bb5, !dbg !1446

return:                                           ; preds = %bb6
  %34 = sext i32 %i.0 to i64, !dbg !1447
  %35 = getelementptr inbounds i8** %16, i64 %34, !dbg !1447
  store i8* null, i8** %35, align 1, !dbg !1447
  ret i8** %16, !dbg !1448
}

define internal fastcc noalias i8** @comma_to_list(i8* %comma) nounwind {
entry:
  %0 = icmp eq i8* %comma, null, !dbg !1449
  br i1 %0, label %bb, label %bb1, !dbg !1449

bb:                                               ; preds = %entry
  call void @__assert_fail(i8* getelementptr inbounds ([21 x i8]* @.str382, i64 0, i64 0), i8* getelementptr inbounds ([21 x i8]* @.str180, i64 0, i64 0), i32 205, i8* getelementptr inbounds ([14 x i8]* @__PRETTY_FUNCTION__.5295, i64 0, i64 0)) noreturn nounwind, !dbg !1449
  unreachable, !dbg !1449

bb1:                                              ; preds = %entry
  %1 = call i64 @strlen(i8* %comma) nounwind readonly, !dbg !1454
  %2 = add i64 %1, 1, !dbg !1454
  %3 = call noalias i8* @malloc(i64 %2) nounwind, !dbg !1456
  %4 = icmp eq i8* %3, null, !dbg !1457
  br i1 %4, label %bb.i, label %xmalloc.exit, !dbg !1457

bb.i:                                             ; preds = %bb1
  %5 = call i32* @__errno_location() nounwind readnone, !dbg !1458
  %6 = load i32* %5, align 4, !dbg !1458
  %7 = call i8* @strerror(i32 %6) nounwind, !dbg !1458
  %8 = load i8** @Prog, align 8, !dbg !1458
  %9 = load %struct.FILE** @stderr, align 8, !dbg !1458
  %10 = call i32 (%struct.FILE*, i8*, ...)* @fprintf(%struct.FILE* noalias %9, i8* noalias getelementptr inbounds ([35 x i8]* @.str147, i64 0, i64 0), i8* %8, i8* %7) nounwind, !dbg !1458
  call void @exit(i32 13) noreturn nounwind, !dbg !1459
  unreachable, !dbg !1459

xmalloc.exit:                                     ; preds = %bb1
  %11 = call i8* @strcpy(i8* noalias %3, i8* noalias %comma) nounwind, !dbg !1454
  br label %bb2, !dbg !1460

bb2:                                              ; preds = %bb3, %xmalloc.exit
  %cp.0 = phi i8* [ %11, %xmalloc.exit ], [ %14, %bb3 ]
  %storemerge = phi i32 [ 0, %xmalloc.exit ], [ %15, %bb3 ]
  %12 = call i8* @strchr(i8* %cp.0, i32 44) nounwind readonly, !dbg !1461
  %13 = icmp eq i8* %12, null, !dbg !1462
  br i1 %13, label %bb4, label %bb3, !dbg !1462

bb3:                                              ; preds = %bb2
  %14 = getelementptr inbounds i8* %12, i64 1, !dbg !1463
  %15 = add nsw i32 %storemerge, 1, !dbg !1460
  br label %bb2, !dbg !1460

bb4:                                              ; preds = %bb2
  %16 = add nsw i32 %storemerge, 2, !dbg !1464
  %17 = sext i32 %16 to i64, !dbg !1465
  %18 = shl i64 %17, 3
  %19 = call noalias i8* @malloc(i64 %18) nounwind, !dbg !1466
  %20 = icmp eq i8* %19, null, !dbg !1467
  br i1 %20, label %bb.i1, label %xmalloc.exit2, !dbg !1467

bb.i1:                                            ; preds = %bb4
  %21 = call i32* @__errno_location() nounwind readnone, !dbg !1468
  %22 = load i32* %21, align 4, !dbg !1468
  %23 = call i8* @strerror(i32 %22) nounwind, !dbg !1468
  %24 = load i8** @Prog, align 8, !dbg !1468
  %25 = load %struct.FILE** @stderr, align 8, !dbg !1468
  %26 = call i32 (%struct.FILE*, i8*, ...)* @fprintf(%struct.FILE* noalias %25, i8* noalias getelementptr inbounds ([35 x i8]* @.str147, i64 0, i64 0), i8* %24, i8* %23) nounwind, !dbg !1468
  call void @exit(i32 13) noreturn nounwind, !dbg !1469
  unreachable, !dbg !1469

xmalloc.exit2:                                    ; preds = %bb4
  %27 = bitcast i8* %19 to i8**, !dbg !1465
  %28 = load i8* %11, align 1, !dbg !1470
  %29 = icmp eq i8 %28, 0, !dbg !1470
  br i1 %29, label %bb5, label %bb7, !dbg !1470

bb5:                                              ; preds = %xmalloc.exit2
  store i8* null, i8** %27, align 8, !dbg !1471
  ret i8** %27, !dbg !1472

bb7:                                              ; preds = %bb8, %xmalloc.exit2
  %cp.1 = phi i8* [ %34, %bb8 ], [ %11, %xmalloc.exit2 ]
  %storemerge1 = phi i32 [ %35, %bb8 ], [ 0, %xmalloc.exit2 ]
  %30 = sext i32 %storemerge1 to i64, !dbg !1473
  %31 = getelementptr inbounds i8** %27, i64 %30, !dbg !1473
  store i8* %cp.1, i8** %31, align 1, !dbg !1473
  %32 = call i8* @strchr(i8* %cp.1, i32 44) nounwind readonly, !dbg !1474
  %33 = icmp eq i8* %32, null, !dbg !1475
  br i1 %33, label %bb9, label %bb8, !dbg !1475

bb8:                                              ; preds = %bb7
  store i8 0, i8* %32, align 1, !dbg !1476
  %34 = getelementptr inbounds i8* %32, i64 1, !dbg !1477
  %35 = add nsw i32 %storemerge1, 1, !dbg !1478
  br label %bb7, !dbg !1478

bb9:                                              ; preds = %bb7
  %36 = add nsw i32 %storemerge1, 1, !dbg !1479
  %37 = sext i32 %36 to i64, !dbg !1479
  %38 = getelementptr inbounds i8** %27, i64 %37, !dbg !1479
  store i8* null, i8** %38, align 1, !dbg !1479
  ret i8** %27, !dbg !1472
}

define internal void @cleanup_unlock_group(i8* nocapture %arg) nounwind {
entry:
  %0 = call fastcc i32 @commonio_unlock(%struct.commonio_db* @group_db) nounwind, !dbg !1480
  %1 = icmp eq i32 %0, 0, !dbg !1483
  br i1 %1, label %bb, label %return, !dbg !1483

bb:                                               ; preds = %entry
  %2 = load i8** @Prog, align 8, !dbg !1490
  %3 = load %struct.FILE** @stderr, align 8, !dbg !1490
  %4 = call i32 (%struct.FILE*, i8*, ...)* @fprintf(%struct.FILE* noalias %3, i8* noalias getelementptr inbounds ([25 x i8]* @.str694, i64 0, i64 0), i8* %2, i8* getelementptr inbounds (%struct.commonio_db* @group_db, i64 0, i32 0, i64 0)) nounwind, !dbg !1490
  %5 = call i8* @setlocale(i32 6, i8* null) nounwind, !dbg !1491
  %6 = icmp eq i8* %5, null, !dbg !1491
  br i1 %6, label %bb4.thread, label %bb2, !dbg !1491

bb4.thread:                                       ; preds = %bb
  call void (i32, i8*, ...)* @syslog(i32 3, i8* getelementptr inbounds ([20 x i8]* @.str795, i64 0, i64 0), i8* getelementptr inbounds (%struct.commonio_db* @group_db, i64 0, i32 0, i64 0)) nounwind, !dbg !1491
  ret void, !dbg !1493

bb2:                                              ; preds = %bb
  %7 = call noalias i8* @strdup(i8* %5) nounwind, !dbg !1491
  %8 = icmp eq i8* %7, null, !dbg !1491
  br i1 %8, label %bb4.thread5, label %bb5, !dbg !1491

bb4.thread5:                                      ; preds = %bb2
  call void (i32, i8*, ...)* @syslog(i32 3, i8* getelementptr inbounds ([20 x i8]* @.str795, i64 0, i64 0), i8* getelementptr inbounds (%struct.commonio_db* @group_db, i64 0, i32 0, i64 0)) nounwind, !dbg !1491
  ret void, !dbg !1493

bb5:                                              ; preds = %bb2
  %9 = call i8* @setlocale(i32 6, i8* getelementptr inbounds ([2 x i8]* @.str25, i64 0, i64 0)) nounwind, !dbg !1491
  call void (i32, i8*, ...)* @syslog(i32 3, i8* getelementptr inbounds ([20 x i8]* @.str795, i64 0, i64 0), i8* getelementptr inbounds (%struct.commonio_db* @group_db, i64 0, i32 0, i64 0)) nounwind, !dbg !1491
  %10 = call i8* @setlocale(i32 6, i8* %7) nounwind, !dbg !1491
  call void @free(i8* %7) nounwind, !dbg !1491
  ret void, !dbg !1493

return:                                           ; preds = %entry
  ret void, !dbg !1493
}

define internal void @cleanup_unlock_gshadow(i8* nocapture %arg) nounwind {
entry:
  %0 = call fastcc i32 @commonio_unlock(%struct.commonio_db* @gshadow_db) nounwind, !dbg !1494
  %1 = icmp eq i32 %0, 0, !dbg !1497
  br i1 %1, label %bb, label %return, !dbg !1497

bb:                                               ; preds = %entry
  %2 = load i8** @Prog, align 8, !dbg !1500
  %3 = load %struct.FILE** @stderr, align 8, !dbg !1500
  %4 = call i32 (%struct.FILE*, i8*, ...)* @fprintf(%struct.FILE* noalias %3, i8* noalias getelementptr inbounds ([25 x i8]* @.str694, i64 0, i64 0), i8* %2, i8* getelementptr inbounds (%struct.commonio_db* @gshadow_db, i64 0, i32 0, i64 0)) nounwind, !dbg !1500
  %5 = call i8* @setlocale(i32 6, i8* null) nounwind, !dbg !1501
  %6 = icmp eq i8* %5, null, !dbg !1501
  br i1 %6, label %bb4.thread, label %bb2, !dbg !1501

bb4.thread:                                       ; preds = %bb
  call void (i32, i8*, ...)* @syslog(i32 3, i8* getelementptr inbounds ([20 x i8]* @.str795, i64 0, i64 0), i8* getelementptr inbounds (%struct.commonio_db* @gshadow_db, i64 0, i32 0, i64 0)) nounwind, !dbg !1501
  ret void, !dbg !1503

bb2:                                              ; preds = %bb
  %7 = call noalias i8* @strdup(i8* %5) nounwind, !dbg !1501
  %8 = icmp eq i8* %7, null, !dbg !1501
  br i1 %8, label %bb4.thread5, label %bb5, !dbg !1501

bb4.thread5:                                      ; preds = %bb2
  call void (i32, i8*, ...)* @syslog(i32 3, i8* getelementptr inbounds ([20 x i8]* @.str795, i64 0, i64 0), i8* getelementptr inbounds (%struct.commonio_db* @gshadow_db, i64 0, i32 0, i64 0)) nounwind, !dbg !1501
  ret void, !dbg !1503

bb5:                                              ; preds = %bb2
  %9 = call i8* @setlocale(i32 6, i8* getelementptr inbounds ([2 x i8]* @.str25, i64 0, i64 0)) nounwind, !dbg !1501
  call void (i32, i8*, ...)* @syslog(i32 3, i8* getelementptr inbounds ([20 x i8]* @.str795, i64 0, i64 0), i8* getelementptr inbounds (%struct.commonio_db* @gshadow_db, i64 0, i32 0, i64 0)) nounwind, !dbg !1501
  %10 = call i8* @setlocale(i32 6, i8* %7) nounwind, !dbg !1501
  call void @free(i8* %7) nounwind, !dbg !1501
  ret void, !dbg !1503

return:                                           ; preds = %entry
  ret void, !dbg !1503
}

declare i32 @gettimeofday(%struct.rlimit* noalias, %struct.__mbstate_t* noalias) nounwind

declare void @srandom(i32) nounwind

declare i64 @random() nounwind

define internal fastcc i8* @SHA_salt_rounds() nounwind {
bb:
  %tv.i = alloca %struct.rlimit, align 8
  %0 = call fastcc i64 @getdef_long(i8* getelementptr inbounds ([21 x i8]* @.str98, i64 0, i64 0)) nounwind
  %1 = call fastcc i64 @getdef_long(i8* getelementptr inbounds ([21 x i8]* @.str199, i64 0, i64 0)) nounwind
  %2 = icmp eq i64 %0, -1, !dbg !1504
  br i1 %2, label %bb1, label %bb5thread-pre-split, !dbg !1504

bb1:                                              ; preds = %bb
  %3 = icmp eq i64 %1, -1, !dbg !1504
  br i1 %3, label %return, label %bb3, !dbg !1504

bb3:                                              ; preds = %bb1
  br i1 %2, label %bb5, label %bb5thread-pre-split, !dbg !1507

bb5thread-pre-split:                              ; preds = %bb3, %bb
  %.pre = icmp eq i64 %1, -1, !dbg !1508
  %phitmp = select i1 %.pre, i64 %0, i64 %1
  br label %bb5

bb5:                                              ; preds = %bb5thread-pre-split, %bb3
  %.pre-phi = phi i64 [ %phitmp, %bb5thread-pre-split ], [ %1, %bb3 ]
  %min_rounds.0 = phi i64 [ %0, %bb5thread-pre-split ], [ %1, %bb3 ]
  %4 = icmp sgt i64 %min_rounds.0, %.pre-phi, !dbg !1509
  %max_rounds.1 = select i1 %4, i64 %min_rounds.0, i64 %.pre-phi
  %.b.i = load i1* @seeded.5201.b
  br i1 %.b.i, label %bb13, label %bb.i, !dbg !1510

bb.i:                                             ; preds = %bb5
  %5 = call i32 @gettimeofday(%struct.rlimit* noalias %tv.i, %struct.__mbstate_t* noalias null) nounwind, !dbg !1513
  %6 = getelementptr inbounds %struct.rlimit* %tv.i, i64 0, i32 0, !dbg !1514
  %7 = load i64* %6, align 8, !dbg !1514
  %8 = getelementptr inbounds %struct.rlimit* %tv.i, i64 0, i32 1, !dbg !1514
  %9 = load i64* %8, align 8, !dbg !1514
  %10 = xor i64 %7, %9
  %11 = trunc i64 %10 to i32
  %12 = call i32 @getpid() nounwind, !dbg !1514
  %13 = xor i32 %11, %12, !dbg !1514
  call void @srandom(i32 %13) nounwind, !dbg !1514
  store i1 true, i1* @seeded.5201.b
  br label %bb13, !dbg !1515

bb13:                                             ; preds = %bb.i, %bb5
  %14 = sub nsw i64 %max_rounds.1, %min_rounds.0, !dbg !1516
  %15 = sitofp i64 %14 to double, !dbg !1516
  %16 = fadd double %15, 1.000000e+00, !dbg !1516
  %17 = call i64 @random() nounwind, !dbg !1516
  %18 = sitofp i64 %17 to double, !dbg !1516
  %19 = fmul double %16, %18, !dbg !1516
  %20 = fdiv double %19, 0x41DFFFFFFFC00000, !dbg !1517
  %21 = sitofp i64 %min_rounds.0 to double, !dbg !1518
  %22 = fadd double %21, %20, !dbg !1518
  %23 = fptosi double %22 to i64, !dbg !1518
  %24 = icmp slt i64 %23, 1000
  br i1 %24, label %bb17, label %bb15, !dbg !1519

bb15:                                             ; preds = %bb13
  %25 = icmp sgt i64 %23, 999999999, !dbg !1520
  br i1 %25, label %bb16, label %bb17, !dbg !1520

bb16:                                             ; preds = %bb15
  br label %bb17, !dbg !1521

bb17:                                             ; preds = %bb16, %bb15, %bb13
  %storemerge2 = phi i64 [ 999999999, %bb16 ], [ %23, %bb15 ], [ 1000, %bb13 ]
  %26 = call i32 (i8*, i64, i8*, ...)* @snprintf(i8* noalias getelementptr inbounds ([18 x i8]* @rounds_prefix.5226, i64 0, i64 0), i64 18, i8* noalias getelementptr inbounds ([12 x i8]* @.str3101, i64 0, i64 0), i64 %storemerge2) nounwind, !dbg !1522
  ret i8* getelementptr inbounds ([18 x i8]* @rounds_prefix.5226, i64 0, i64 0), !dbg !1523

return:                                           ; preds = %bb1
  ret i8* getelementptr inbounds ([1 x i8]* @.str34, i64 0, i64 0), !dbg !1523
}

declare i8* @l64a(i64) nounwind

declare i8* @strcat(i8* noalias, i8* noalias) nounwind

declare i8* @strncat(i8* noalias, i8* noalias, i64) nounwind

declare i8* @getlogin()

declare i32 @getgid() nounwind

declare i32 @setregid(i32, i32) nounwind

declare i32 @setreuid(i32, i32) nounwind

declare i32* @__errno_location() nounwind readnone

declare i8* @strerror(i32) nounwind

declare i32 @access(i8*, i32) nounwind

declare i32 @chroot(i8*) nounwind

declare i32 @setrlimit(i32, %struct.rlimit*) nounwind

declare i32 @umask(i32) nounwind

declare i32 @strncmp(i8*, i8*, i64) nounwind readonly

declare i8* @realloc(i8*, i64) nounwind

define internal fastcc noalias i8* @xmalloc(i64 %size) nounwind {
entry:
  %0 = call noalias i8* @malloc(i64 %size) nounwind, !dbg !1524
  %1 = icmp eq i8* %0, null, !dbg !1525
  br i1 %1, label %bb, label %return, !dbg !1525

bb:                                               ; preds = %entry
  %2 = call i32* @__errno_location() nounwind readnone, !dbg !1526
  %3 = load i32* %2, align 4, !dbg !1526
  %4 = call i8* @strerror(i32 %3) nounwind, !dbg !1526
  %5 = load i8** @Prog, align 8, !dbg !1526
  %6 = load %struct.FILE** @stderr, align 8, !dbg !1526
  %7 = call i32 (%struct.FILE*, i8*, ...)* @fprintf(%struct.FILE* noalias %6, i8* noalias getelementptr inbounds ([35 x i8]* @.str147, i64 0, i64 0), i8* %5, i8* %4) nounwind, !dbg !1526
  call void @exit(i32 13) noreturn nounwind, !dbg !1527
  unreachable, !dbg !1527

return:                                           ; preds = %entry
  ret i8* %0, !dbg !1528
}

declare noalias i8* @malloc(i64) nounwind

declare i8* @strcpy(i8* noalias, i8* noalias) nounwind

declare i32 @getpwnam_r(i8* noalias, %struct.passwd* noalias, i8* noalias, i64, %struct.passwd** noalias)

declare i32 @getpwuid_r(i32, %struct.passwd* noalias, i8* noalias, i64, %struct.passwd** noalias)

define internal fastcc %struct.passwd* @__pw_dup(%struct.passwd* nocapture %pwent) nounwind {
entry:
  %0 = call noalias i8* @malloc(i64 48) nounwind, !dbg !1529
  %1 = bitcast i8* %0 to %struct.passwd*, !dbg !1529
  %2 = icmp eq i8* %0, null
  br i1 %2, label %return, label %bb1, !dbg !1552

bb1:                                              ; preds = %entry
  %3 = getelementptr inbounds %struct.passwd* %pwent, i64 0, i32 2, !dbg !1553
  %4 = load i32* %3, align 8, !dbg !1553
  %5 = getelementptr inbounds i8* %0, i64 16
  %6 = bitcast i8* %5 to i32*
  store i32 %4, i32* %6, align 8, !dbg !1553
  %7 = getelementptr inbounds %struct.passwd* %pwent, i64 0, i32 3, !dbg !1554
  %8 = load i32* %7, align 4, !dbg !1554
  %9 = getelementptr inbounds i8* %0, i64 20
  %10 = bitcast i8* %9 to i32*
  store i32 %8, i32* %10, align 4, !dbg !1554
  %11 = getelementptr inbounds %struct.passwd* %pwent, i64 0, i32 0, !dbg !1555
  %12 = load i8** %11, align 8, !dbg !1555
  %13 = call noalias i8* @strdup(i8* %12) nounwind, !dbg !1555
  %14 = bitcast i8* %0 to i8**
  store i8* %13, i8** %14, align 8, !dbg !1555
  %15 = icmp eq i8* %13, null, !dbg !1556
  br i1 %15, label %bb2, label %bb3, !dbg !1556

bb2:                                              ; preds = %bb1
  call void @free(i8* %0) nounwind, !dbg !1557
  ret %struct.passwd* null, !dbg !1558

bb3:                                              ; preds = %bb1
  %16 = getelementptr inbounds %struct.passwd* %pwent, i64 0, i32 1, !dbg !1559
  %17 = load i8** %16, align 8, !dbg !1559
  %18 = call noalias i8* @strdup(i8* %17) nounwind, !dbg !1559
  %19 = getelementptr inbounds i8* %0, i64 8
  %20 = bitcast i8* %19 to i8**
  store i8* %18, i8** %20, align 8, !dbg !1559
  %21 = icmp eq i8* %18, null, !dbg !1560
  br i1 %21, label %bb4, label %bb5, !dbg !1560

bb4:                                              ; preds = %bb3
  %22 = load i8** %14, align 8, !dbg !1561
  call void @free(i8* %22) nounwind, !dbg !1561
  call void @free(i8* %0) nounwind, !dbg !1562
  ret %struct.passwd* null, !dbg !1558

bb5:                                              ; preds = %bb3
  %23 = getelementptr inbounds %struct.passwd* %pwent, i64 0, i32 4, !dbg !1563
  %24 = load i8** %23, align 8, !dbg !1563
  %25 = call noalias i8* @strdup(i8* %24) nounwind, !dbg !1563
  %26 = getelementptr inbounds i8* %0, i64 24
  %27 = bitcast i8* %26 to i8**
  store i8* %25, i8** %27, align 8, !dbg !1563
  %28 = icmp eq i8* %25, null, !dbg !1564
  br i1 %28, label %bb6, label %bb7, !dbg !1564

bb6:                                              ; preds = %bb5
  %29 = load i8** %20, align 8, !dbg !1565
  call void @free(i8* %29) nounwind, !dbg !1565
  %30 = load i8** %14, align 8, !dbg !1566
  call void @free(i8* %30) nounwind, !dbg !1566
  call void @free(i8* %0) nounwind, !dbg !1567
  ret %struct.passwd* null, !dbg !1558

bb7:                                              ; preds = %bb5
  %31 = getelementptr inbounds %struct.passwd* %pwent, i64 0, i32 5, !dbg !1568
  %32 = load i8** %31, align 8, !dbg !1568
  %33 = call noalias i8* @strdup(i8* %32) nounwind, !dbg !1568
  %34 = getelementptr inbounds i8* %0, i64 32
  %35 = bitcast i8* %34 to i8**
  store i8* %33, i8** %35, align 8, !dbg !1568
  %36 = icmp eq i8* %33, null, !dbg !1569
  br i1 %36, label %bb8, label %bb9, !dbg !1569

bb8:                                              ; preds = %bb7
  %37 = load i8** %27, align 8, !dbg !1570
  call void @free(i8* %37) nounwind, !dbg !1570
  %38 = load i8** %20, align 8, !dbg !1571
  call void @free(i8* %38) nounwind, !dbg !1571
  %39 = load i8** %14, align 8, !dbg !1572
  call void @free(i8* %39) nounwind, !dbg !1572
  call void @free(i8* %0) nounwind, !dbg !1573
  ret %struct.passwd* null, !dbg !1558

bb9:                                              ; preds = %bb7
  %40 = getelementptr inbounds %struct.passwd* %pwent, i64 0, i32 6, !dbg !1574
  %41 = load i8** %40, align 8, !dbg !1574
  %42 = call noalias i8* @strdup(i8* %41) nounwind, !dbg !1574
  %43 = getelementptr inbounds i8* %0, i64 40
  %44 = bitcast i8* %43 to i8**
  store i8* %42, i8** %44, align 8, !dbg !1574
  %45 = icmp eq i8* %42, null, !dbg !1575
  br i1 %45, label %bb10, label %return, !dbg !1575

bb10:                                             ; preds = %bb9
  %46 = load i8** %35, align 8, !dbg !1576
  call void @free(i8* %46) nounwind, !dbg !1576
  %47 = load i8** %27, align 8, !dbg !1577
  call void @free(i8* %47) nounwind, !dbg !1577
  %48 = load i8** %20, align 8, !dbg !1578
  call void @free(i8* %48) nounwind, !dbg !1578
  %49 = load i8** %14, align 8, !dbg !1579
  call void @free(i8* %49) nounwind, !dbg !1579
  call void @free(i8* %0) nounwind, !dbg !1580
  ret %struct.passwd* null, !dbg !1558

return:                                           ; preds = %bb9, %entry
  %.0 = phi %struct.passwd* [ null, %entry ], [ %1, %bb9 ]
  ret %struct.passwd* %.0, !dbg !1558
}

declare i32 @strcasecmp(i8*, i8*) nounwind readonly

define internal fastcc i32 @getdef_unum() nounwind {
entry:
  %endptr.i = alloca i8*, align 8
  %.b = load i1* @def_loaded.b
  br i1 %.b, label %bb4, label %bb, !dbg !1581

bb:                                               ; preds = %entry
  call fastcc void @def_load() nounwind, !dbg !1587
  br label %bb4, !dbg !1587

bb4:                                              ; preds = %bb, %entry
  %0 = call fastcc %struct.itemdef* @def_find(i8* getelementptr inbounds ([22 x i8]* @.str21178, i64 0, i64 0)) nounwind, !dbg !1588
  %1 = icmp eq %struct.itemdef* %0, null, !dbg !1589
  br i1 %1, label %return, label %bb5, !dbg !1589

bb5:                                              ; preds = %bb4
  %2 = getelementptr inbounds %struct.itemdef* %0, i64 0, i32 1, !dbg !1589
  %3 = load i8** %2, align 8, !dbg !1589
  %4 = icmp eq i8* %3, null, !dbg !1589
  br i1 %4, label %return, label %bb7, !dbg !1589

bb7:                                              ; preds = %bb5
  %5 = call i32* @__errno_location() nounwind readnone, !dbg !1590
  store i32 0, i32* %5, align 4, !dbg !1590
  %6 = call i64 @strtol(i8* noalias %3, i8** noalias %endptr.i, i32 0) nounwind, !dbg !1603
  %7 = load i8* %3, align 1, !dbg !1604
  %8 = icmp eq i8 %7, 0, !dbg !1604
  br i1 %8, label %bb10, label %bb.i, !dbg !1604

bb.i:                                             ; preds = %bb7
  %9 = load i8** %endptr.i, align 8, !dbg !1604
  %10 = load i8* %9, align 1, !dbg !1604
  %11 = icmp eq i8 %10, 0, !dbg !1604
  br i1 %11, label %bb1.i, label %bb10, !dbg !1604

bb1.i:                                            ; preds = %bb.i
  %12 = load i32* %5, align 4, !dbg !1604
  %13 = icmp eq i32 %12, 34, !dbg !1604
  %14 = icmp ugt i64 %6, 2147483647
  %or.cond = or i1 %13, %14
  br i1 %or.cond, label %bb10, label %bb11, !dbg !1604

bb10:                                             ; preds = %bb1.i, %bb.i, %bb7
  %15 = load i8** %2, align 8, !dbg !1605
  %16 = load %struct.FILE** @stderr, align 8, !dbg !1605
  %17 = call i32 (%struct.FILE*, i8*, ...)* @fprintf(%struct.FILE* noalias %16, i8* noalias getelementptr inbounds ([50 x i8]* @.str68225, i64 0, i64 0), i8* getelementptr inbounds ([22 x i8]* @.str21178, i64 0, i64 0), i8* %15) nounwind, !dbg !1605
  ret i32 0, !dbg !1606

bb11:                                             ; preds = %bb1.i
  %18 = trunc i64 %6 to i32, !dbg !1606
  ret i32 %18, !dbg !1606

return:                                           ; preds = %bb5, %bb4
  ret i32 0, !dbg !1606
}

define internal fastcc i64 @getdef_long(i8* %item) nounwind {
entry:
  %endptr.i = alloca i8*, align 8
  %.b = load i1* @def_loaded.b
  br i1 %.b, label %bb4, label %bb, !dbg !1607

bb:                                               ; preds = %entry
  call fastcc void @def_load() nounwind, !dbg !1613
  br label %bb4, !dbg !1613

bb4:                                              ; preds = %bb, %entry
  %0 = call fastcc %struct.itemdef* @def_find(i8* %item) nounwind, !dbg !1614
  %1 = icmp eq %struct.itemdef* %0, null, !dbg !1615
  br i1 %1, label %return, label %bb5, !dbg !1615

bb5:                                              ; preds = %bb4
  %2 = getelementptr inbounds %struct.itemdef* %0, i64 0, i32 1, !dbg !1615
  %3 = load i8** %2, align 8, !dbg !1615
  %4 = icmp eq i8* %3, null, !dbg !1615
  br i1 %4, label %return, label %bb7, !dbg !1615

bb7:                                              ; preds = %bb5
  %5 = call i32* @__errno_location() nounwind readnone, !dbg !1616
  store i32 0, i32* %5, align 4, !dbg !1616
  %6 = call i64 @strtol(i8* noalias %3, i8** noalias %endptr.i, i32 0) nounwind, !dbg !1618
  %7 = load i8* %3, align 1, !dbg !1619
  %8 = icmp eq i8 %7, 0, !dbg !1619
  br i1 %8, label %bb8, label %bb.i, !dbg !1619

bb.i:                                             ; preds = %bb7
  %9 = load i8** %endptr.i, align 8, !dbg !1619
  %10 = load i8* %9, align 1, !dbg !1619
  %11 = icmp eq i8 %10, 0, !dbg !1619
  br i1 %11, label %bb1.i, label %bb8, !dbg !1619

bb1.i:                                            ; preds = %bb.i
  %12 = load i32* %5, align 4, !dbg !1619
  %13 = icmp eq i32 %12, 34, !dbg !1619
  br i1 %13, label %bb8, label %bb9, !dbg !1619

bb8:                                              ; preds = %bb1.i, %bb.i, %bb7
  %14 = load i8** %2, align 8, !dbg !1620
  %15 = load %struct.FILE** @stderr, align 8, !dbg !1620
  %16 = call i32 (%struct.FILE*, i8*, ...)* @fprintf(%struct.FILE* noalias %15, i8* noalias getelementptr inbounds ([50 x i8]* @.str68225, i64 0, i64 0), i8* %item, i8* %14) nounwind, !dbg !1620
  ret i64 -1, !dbg !1621

bb9:                                              ; preds = %bb1.i
  ret i64 %6, !dbg !1621

return:                                           ; preds = %bb5, %bb4
  ret i64 -1, !dbg !1621
}

define internal fastcc %struct.itemdef* @def_find(i8* %name) nounwind {
entry:
  br label %bb3, !dbg !1622

bb:                                               ; preds = %bb3
  %0 = call i32 @strcmp(i8* %4, i8* %name) nounwind readonly, !dbg !1628
  %1 = icmp eq i32 %0, 0, !dbg !1628
  br i1 %1, label %return, label %bb2, !dbg !1628

bb2:                                              ; preds = %bb
  %2 = getelementptr inbounds %struct.itemdef* %storemerge, i64 1, !dbg !1622
  br label %bb3, !dbg !1622

bb3:                                              ; preds = %bb2, %entry
  %storemerge = phi %struct.itemdef* [ getelementptr inbounds ([68 x %struct.itemdef]* @def_table, i64 0, i64 0), %entry ], [ %2, %bb2 ]
  %3 = getelementptr inbounds %struct.itemdef* %storemerge, i64 0, i32 0, !dbg !1622
  %4 = load i8** %3, align 8, !dbg !1622
  %5 = icmp eq i8* %4, null, !dbg !1622
  br i1 %5, label %bb4, label %bb, !dbg !1622

bb4:                                              ; preds = %bb3
  %6 = load %struct.FILE** @stderr, align 8, !dbg !1629
  %7 = call i32 (%struct.FILE*, i8*, ...)* @fprintf(%struct.FILE* noalias %6, i8* noalias getelementptr inbounds ([64 x i8]* @.str72, i64 0, i64 0), i8* %name) nounwind, !dbg !1629
  %8 = call i8* @setlocale(i32 6, i8* null) nounwind, !dbg !1630
  %9 = icmp eq i8* %8, null, !dbg !1630
  br i1 %9, label %bb8.thread, label %bb6, !dbg !1630

bb8.thread:                                       ; preds = %bb4
  call void (i32, i8*, ...)* @syslog(i32 2, i8* getelementptr inbounds ([32 x i8]* @.str73, i64 0, i64 0), i8* %name) nounwind, !dbg !1630
  ret %struct.itemdef* null, !dbg !1632

bb6:                                              ; preds = %bb4
  %10 = call noalias i8* @strdup(i8* %8) nounwind, !dbg !1630
  %11 = icmp eq i8* %10, null, !dbg !1630
  br i1 %11, label %bb8.thread2, label %bb9, !dbg !1630

bb8.thread2:                                      ; preds = %bb6
  call void (i32, i8*, ...)* @syslog(i32 2, i8* getelementptr inbounds ([32 x i8]* @.str73, i64 0, i64 0), i8* %name) nounwind, !dbg !1630
  ret %struct.itemdef* null, !dbg !1632

bb9:                                              ; preds = %bb6
  %12 = call i8* @setlocale(i32 6, i8* getelementptr inbounds ([2 x i8]* @.str25, i64 0, i64 0)) nounwind, !dbg !1630
  call void (i32, i8*, ...)* @syslog(i32 2, i8* getelementptr inbounds ([32 x i8]* @.str73, i64 0, i64 0), i8* %name) nounwind, !dbg !1630
  %13 = call i8* @setlocale(i32 6, i8* %10) nounwind, !dbg !1630
  call void @free(i8* %10) nounwind, !dbg !1630
  ret %struct.itemdef* null, !dbg !1632

return:                                           ; preds = %bb
  ret %struct.itemdef* %storemerge, !dbg !1632
}

define internal fastcc void @def_load() nounwind {
entry:
  %buf = alloca [1024 x i8], align 1
  %0 = call %struct.FILE* @fopen(i8* noalias getelementptr inbounds ([16 x i8]* @def_fname, i64 0, i64 0), i8* noalias getelementptr inbounds ([2 x i8]* @.str74, i64 0, i64 0)) nounwind, !dbg !1633
  %1 = icmp eq %struct.FILE* %0, null, !dbg !1637
  br i1 %1, label %bb, label %bb7, !dbg !1637

bb:                                               ; preds = %entry
  %2 = call i32* @__errno_location() nounwind readnone, !dbg !1638
  %3 = load i32* %2, align 4, !dbg !1638
  %4 = call i8* @setlocale(i32 6, i8* null) nounwind, !dbg !1640
  %5 = icmp eq i8* %4, null, !dbg !1640
  br i1 %5, label %bb4, label %bb2, !dbg !1640

bb2:                                              ; preds = %bb
  %6 = call noalias i8* @strdup(i8* %4) nounwind, !dbg !1640
  %7 = icmp eq i8* %6, null, !dbg !1640
  br i1 %7, label %bb4, label %bb3, !dbg !1640

bb3:                                              ; preds = %bb2
  %8 = call i8* @setlocale(i32 6, i8* getelementptr inbounds ([2 x i8]* @.str25, i64 0, i64 0)) nounwind, !dbg !1640
  br label %bb4, !dbg !1640

bb4:                                              ; preds = %bb3, %bb2, %bb
  %saved_locale.0 = phi i8* [ null, %bb ], [ %6, %bb2 ], [ %6, %bb3 ]
  %9 = call i8* @strerror(i32 %3) nounwind, !dbg !1640
  call void (i32, i8*, ...)* @syslog(i32 2, i8* getelementptr inbounds ([38 x i8]* @.str75, i64 0, i64 0), i8* getelementptr inbounds ([16 x i8]* @def_fname, i64 0, i64 0), i8* %9) nounwind, !dbg !1640
  %10 = icmp eq i8* %saved_locale.0, null, !dbg !1640
  br i1 %10, label %bb6, label %bb5, !dbg !1640

bb5:                                              ; preds = %bb4
  %11 = call i8* @setlocale(i32 6, i8* %saved_locale.0) nounwind, !dbg !1640
  call void @free(i8* %saved_locale.0) nounwind, !dbg !1640
  br label %bb6, !dbg !1640

bb6:                                              ; preds = %bb5, %bb4
  call void @exit(i32 1) noreturn nounwind, !dbg !1642
  unreachable, !dbg !1642

bb7:                                              ; preds = %entry
  store i1 true, i1* @def_loaded.b
  %buf20 = getelementptr inbounds [1024 x i8]* %buf, i64 0, i64 0
  br label %bb19, !dbg !1643

bb8:                                              ; preds = %bb19
  %12 = call i64 @strlen(i8* %buf20) nounwind readonly, !dbg !1644
  %13 = trunc i64 %12 to i32, !dbg !1644
  br label %bb12, !dbg !1644

bb10:                                             ; preds = %bb12
  %14 = call i16** @__ctype_b_loc() nounwind readnone, !dbg !1645
  %15 = load i16** %14, align 8, !dbg !1645
  %16 = sext i32 %storemerge to i64, !dbg !1645
  %17 = getelementptr inbounds [1024 x i8]* %buf, i64 0, i64 %16, !dbg !1645
  %18 = load i8* %17, align 1, !dbg !1645
  %19 = sext i8 %18 to i64
  %20 = getelementptr inbounds i16* %15, i64 %19, !dbg !1645
  %21 = load i16* %20, align 1, !dbg !1645
  %22 = zext i16 %21 to i32, !dbg !1645
  %23 = and i32 %22, 8192, !dbg !1645
  %24 = icmp eq i32 %23, 0, !dbg !1645
  br i1 %24, label %bb13, label %bb12, !dbg !1645

bb12:                                             ; preds = %bb10, %bb8
  %storemerge.in = phi i32 [ %13, %bb8 ], [ %storemerge, %bb10 ]
  %storemerge = add i32 %storemerge.in, -1
  %25 = icmp sgt i32 %storemerge, -1
  br i1 %25, label %bb10, label %bb13, !dbg !1644

bb13:                                             ; preds = %bb12, %bb10
  %26 = sext i32 %storemerge.in to i64, !dbg !1646
  %27 = getelementptr inbounds [1024 x i8]* %buf, i64 0, i64 %26, !dbg !1646
  store i8 0, i8* %27, align 1, !dbg !1646
  %28 = call i64 @strspn(i8* %buf20, i8* getelementptr inbounds ([3 x i8]* @.str76, i64 0, i64 0)) nounwind readonly, !dbg !1647
  %29 = getelementptr inbounds [1024 x i8]* %buf, i64 0, i64 %28
  %30 = load i8* %29, align 1, !dbg !1648
  %Pivot = icmp slt i8 %30, 35
  br i1 %Pivot, label %LeafBlock, label %LeafBlock1

LeafBlock1:                                       ; preds = %bb13
  %SwitchLeaf2 = icmp eq i8 %30, 35
  br i1 %SwitchLeaf2, label %bb19, label %bb17

LeafBlock:                                        ; preds = %bb13
  %SwitchLeaf = icmp eq i8 %30, 0
  br i1 %SwitchLeaf, label %bb19, label %bb17

bb17:                                             ; preds = %LeafBlock, %LeafBlock1
  %31 = call i64 @strcspn(i8* %29, i8* getelementptr inbounds ([3 x i8]* @.str76, i64 0, i64 0)) nounwind readonly, !dbg !1649
  %.sum2 = add i64 %28, %31
  %32 = getelementptr inbounds [1024 x i8]* %buf, i64 0, i64 %.sum2
  %33 = load i8* %32, align 1, !dbg !1650
  %34 = icmp eq i8 %33, 0, !dbg !1650
  br i1 %34, label %bb19, label %bb18, !dbg !1650

bb18:                                             ; preds = %bb17
  store i8 0, i8* %32, align 1, !dbg !1651
  %.sum3 = add i64 %.sum2, 1
  %35 = getelementptr inbounds [1024 x i8]* %buf, i64 0, i64 %.sum3
  %36 = call i64 @strspn(i8* %35, i8* getelementptr inbounds ([4 x i8]* @.str77, i64 0, i64 0)) nounwind readonly, !dbg !1652
  %.sum = add i64 %36, 1
  %.sum4 = add i64 %.sum2, %.sum
  %37 = getelementptr inbounds [1024 x i8]* %buf, i64 0, i64 %.sum4
  %38 = call i64 @strcspn(i8* %37, i8* getelementptr inbounds ([2 x i8]* @.str78, i64 0, i64 0)) nounwind readonly, !dbg !1653
  %.sum1 = add i64 %.sum, %38
  %.sum5 = add i64 %.sum2, %.sum1
  %39 = getelementptr inbounds [1024 x i8]* %buf, i64 0, i64 %.sum5
  store i8 0, i8* %39, align 1, !dbg !1653
  %.b.i = load i1* @def_loaded.b
  br i1 %.b.i, label %bb4.i, label %bb.i

bb.i:                                             ; preds = %bb18
  call fastcc void @def_load() nounwind
  br label %bb4.i

bb4.i:                                            ; preds = %bb.i, %bb18
  %40 = call fastcc %struct.itemdef* @def_find(i8* %29) nounwind
  %41 = icmp eq %struct.itemdef* %40, null
  br i1 %41, label %bb19, label %bb6.i

bb6.i:                                            ; preds = %bb4.i
  %42 = call noalias i8* @strdup(i8* %37) nounwind
  %43 = icmp eq i8* %42, null
  br i1 %43, label %bb7.i, label %bb14.i

bb7.i:                                            ; preds = %bb6.i
  %44 = load %struct.FILE** @stderr, align 8
  %45 = bitcast %struct.FILE* %44 to i8*
  %46 = call i64 @fwrite(i8* getelementptr inbounds ([43 x i8]* @.str69226, i64 0, i64 0), i64 1, i64 42, i8* %45) nounwind
  %47 = call i8* @setlocale(i32 6, i8* null) nounwind
  %48 = icmp eq i8* %47, null
  br i1 %48, label %bb11.i.thread, label %bb9.i

bb11.i.thread:                                    ; preds = %bb7.i
  call void (i32, i8*, ...)* @syslog(i32 3, i8* getelementptr inbounds ([41 x i8]* @.str71, i64 0, i64 0)) nounwind
  br label %bb19

bb9.i:                                            ; preds = %bb7.i
  %49 = call noalias i8* @strdup(i8* %47) nounwind
  %50 = icmp eq i8* %49, null
  br i1 %50, label %bb11.i.thread6, label %bb12.i

bb11.i.thread6:                                   ; preds = %bb9.i
  call void (i32, i8*, ...)* @syslog(i32 3, i8* getelementptr inbounds ([41 x i8]* @.str71, i64 0, i64 0)) nounwind
  br label %bb19

bb12.i:                                           ; preds = %bb9.i
  %51 = call i8* @setlocale(i32 6, i8* getelementptr inbounds ([2 x i8]* @.str25, i64 0, i64 0)) nounwind
  call void (i32, i8*, ...)* @syslog(i32 3, i8* getelementptr inbounds ([41 x i8]* @.str71, i64 0, i64 0)) nounwind
  %52 = call i8* @setlocale(i32 6, i8* %49) nounwind
  call void @free(i8* %49) nounwind
  br label %bb19

bb14.i:                                           ; preds = %bb6.i
  %53 = getelementptr inbounds %struct.itemdef* %40, i64 0, i32 1
  %54 = load i8** %53, align 8
  %55 = icmp eq i8* %54, null
  br i1 %55, label %bb16.i, label %bb15.i

bb15.i:                                           ; preds = %bb14.i
  call void @free(i8* %54) nounwind
  br label %bb16.i

bb16.i:                                           ; preds = %bb15.i, %bb14.i
  store i8* %42, i8** %53, align 8
  br label %bb19

bb19:                                             ; preds = %bb16.i, %bb12.i, %bb11.i.thread6, %bb11.i.thread, %bb4.i, %bb17, %LeafBlock, %LeafBlock1, %bb7
  %56 = call i8* @fgets(i8* noalias %buf20, i32 1024, %struct.FILE* noalias %0) nounwind, !dbg !1654
  %57 = icmp eq i8* %56, null, !dbg !1654
  br i1 %57, label %bb21, label %bb8, !dbg !1654

bb21:                                             ; preds = %bb19
  %58 = call i32 @ferror(%struct.FILE* %0) nounwind, !dbg !1655
  %59 = icmp eq i32 %58, 0, !dbg !1655
  br i1 %59, label %return, label %bb22, !dbg !1655

bb22:                                             ; preds = %bb21
  %60 = call i32* @__errno_location() nounwind readnone, !dbg !1656
  %61 = load i32* %60, align 4, !dbg !1656
  %62 = call i8* @setlocale(i32 6, i8* null) nounwind, !dbg !1658
  %63 = icmp eq i8* %62, null, !dbg !1658
  br i1 %63, label %bb29, label %bb27, !dbg !1658

bb27:                                             ; preds = %bb22
  %64 = call noalias i8* @strdup(i8* %62) nounwind, !dbg !1658
  %65 = icmp eq i8* %64, null, !dbg !1658
  br i1 %65, label %bb29, label %bb28, !dbg !1658

bb28:                                             ; preds = %bb27
  %66 = call i8* @setlocale(i32 6, i8* getelementptr inbounds ([2 x i8]* @.str25, i64 0, i64 0)) nounwind, !dbg !1658
  br label %bb29, !dbg !1658

bb29:                                             ; preds = %bb28, %bb27, %bb22
  %saved_locale25.0 = phi i8* [ null, %bb22 ], [ %64, %bb27 ], [ %64, %bb28 ]
  %67 = call i8* @strerror(i32 %61) nounwind, !dbg !1658
  call void (i32, i8*, ...)* @syslog(i32 2, i8* getelementptr inbounds ([38 x i8]* @.str79227, i64 0, i64 0), i8* getelementptr inbounds ([16 x i8]* @def_fname, i64 0, i64 0), i8* %67) nounwind, !dbg !1658
  %68 = icmp eq i8* %saved_locale25.0, null, !dbg !1658
  br i1 %68, label %bb31, label %bb30, !dbg !1658

bb30:                                             ; preds = %bb29
  %69 = call i8* @setlocale(i32 6, i8* %saved_locale25.0) nounwind, !dbg !1658
  call void @free(i8* %saved_locale25.0) nounwind, !dbg !1658
  br label %bb31, !dbg !1658

bb31:                                             ; preds = %bb30, %bb29
  call void @exit(i32 1) noreturn nounwind, !dbg !1660
  unreachable, !dbg !1660

return:                                           ; preds = %bb21
  %70 = call i32 @fclose(%struct.FILE* %0) nounwind, !dbg !1661
  ret void, !dbg !1662
}

declare %struct.FILE* @fopen(i8* noalias, i8* noalias)

declare i16** @__ctype_b_loc() nounwind readnone

declare i64 @strspn(i8*, i8*) nounwind readonly

declare i64 @strcspn(i8*, i8*) nounwind readonly

declare i8* @fgets(i8* noalias, i32, %struct.FILE* noalias)

declare i32 @ferror(%struct.FILE*) nounwind

declare i32 @fclose(%struct.FILE*)

define internal i8* @group_dup(i8* nocapture %ent) nounwind {
entry:
  %0 = call noalias i8* @malloc(i64 32) nounwind, !dbg !1663
  %1 = icmp eq i8* %0, null
  br i1 %1, label %return, label %bb1.i, !dbg !1686

bb1.i:                                            ; preds = %entry
  %2 = getelementptr inbounds i8* %ent, i64 16
  %3 = bitcast i8* %2 to i32*
  %4 = load i32* %3, align 8, !dbg !1687
  %5 = getelementptr inbounds i8* %0, i64 16
  %6 = bitcast i8* %5 to i32*
  store i32 %4, i32* %6, align 8, !dbg !1687
  %7 = bitcast i8* %ent to i8**
  %8 = load i8** %7, align 8, !dbg !1688
  %9 = call noalias i8* @strdup(i8* %8) nounwind, !dbg !1688
  %10 = bitcast i8* %0 to i8**
  store i8* %9, i8** %10, align 8, !dbg !1688
  %11 = icmp eq i8* %9, null, !dbg !1689
  br i1 %11, label %bb2.i, label %bb3.i, !dbg !1689

bb2.i:                                            ; preds = %bb1.i
  call void @free(i8* %0) nounwind, !dbg !1690
  ret i8* null, !dbg !1683

bb3.i:                                            ; preds = %bb1.i
  %12 = getelementptr inbounds i8* %ent, i64 8
  %13 = bitcast i8* %12 to i8**
  %14 = load i8** %13, align 8, !dbg !1691
  %15 = call noalias i8* @strdup(i8* %14) nounwind, !dbg !1691
  %16 = getelementptr inbounds i8* %0, i64 8
  %17 = bitcast i8* %16 to i8**
  store i8* %15, i8** %17, align 8, !dbg !1691
  %18 = icmp eq i8* %15, null, !dbg !1692
  br i1 %18, label %bb4.i, label %bb7.i.preheader, !dbg !1692

bb7.i.preheader:                                  ; preds = %bb3.i
  %19 = getelementptr inbounds i8* %ent, i64 24
  %20 = bitcast i8* %19 to i8***
  %21 = load i8*** %20, align 8, !dbg !1693
  br label %bb7.i

bb4.i:                                            ; preds = %bb3.i
  %22 = load i8** %10, align 8, !dbg !1694
  call void @free(i8* %22) nounwind, !dbg !1694
  call void @free(i8* %0) nounwind, !dbg !1695
  ret i8* null, !dbg !1683

bb7.i:                                            ; preds = %bb7.i, %bb7.i.preheader
  %storemerge.i = phi i32 [ 0, %bb7.i.preheader ], [ %27, %bb7.i ]
  %23 = sext i32 %storemerge.i to i64, !dbg !1693
  %24 = getelementptr inbounds i8** %21, i64 %23, !dbg !1693
  %25 = load i8** %24, align 1, !dbg !1693
  %26 = icmp eq i8* %25, null, !dbg !1693
  %27 = add nsw i32 %storemerge.i, 1, !dbg !1696
  br i1 %26, label %bb8.i, label %bb7.i, !dbg !1693

bb8.i:                                            ; preds = %bb7.i
  %28 = sext i32 %27 to i64, !dbg !1696
  %29 = shl i64 %28, 3
  %30 = call noalias i8* @malloc(i64 %29) nounwind, !dbg !1696
  %31 = bitcast i8* %30 to i8**, !dbg !1696
  %32 = getelementptr inbounds i8* %0, i64 24
  %33 = bitcast i8* %32 to i8***
  store i8** %31, i8*** %33, align 8, !dbg !1696
  %34 = icmp eq i8* %30, null
  br i1 %34, label %bb9.i, label %bb17.i, !dbg !1697

bb9.i:                                            ; preds = %bb8.i
  call void @free(i8* %15) nounwind, !dbg !1698
  %35 = load i8** %10, align 8, !dbg !1699
  call void @free(i8* %35) nounwind, !dbg !1699
  call void @free(i8* %0) nounwind, !dbg !1700
  ret i8* null, !dbg !1683

bb11.i:                                           ; preds = %bb17.i
  %36 = call noalias i8* @strdup(i8* %56) nounwind, !dbg !1701
  %37 = getelementptr inbounds i8** %52, i64 %54, !dbg !1701
  store i8* %36, i8** %37, align 1, !dbg !1701
  %38 = load i8*** %33, align 8, !dbg !1702
  %39 = getelementptr inbounds i8** %38, i64 %54, !dbg !1702
  %40 = load i8** %39, align 1, !dbg !1702
  %41 = icmp eq i8* %40, null, !dbg !1702
  br i1 %41, label %bb14.i, label %bb16.i, !dbg !1702

bb13.i:                                           ; preds = %bb14.i
  %42 = sext i32 %storemerge2.i to i64, !dbg !1703
  %43 = getelementptr inbounds i8** %46, i64 %42, !dbg !1703
  %44 = load i8** %43, align 1, !dbg !1703
  call void @free(i8* %44) nounwind, !dbg !1703
  %45 = add nsw i32 %storemerge2.i, 1, !dbg !1705
  %.pre1 = load i8*** %33, align 8
  br label %bb14.i, !dbg !1705

bb14.i:                                           ; preds = %bb13.i, %bb11.i
  %46 = phi i8** [ %.pre1, %bb13.i ], [ %38, %bb11.i ]
  %storemerge2.i = phi i32 [ %45, %bb13.i ], [ 0, %bb11.i ]
  %47 = icmp slt i32 %storemerge2.i, %storemerge1.i, !dbg !1705
  br i1 %47, label %bb13.i, label %bb15.i, !dbg !1705

bb15.i:                                           ; preds = %bb14.i
  %48 = bitcast i8** %46 to i8*, !dbg !1706
  call void @free(i8* %48) nounwind, !dbg !1706
  %49 = load i8** %17, align 8, !dbg !1707
  call void @free(i8* %49) nounwind, !dbg !1707
  %50 = load i8** %10, align 8, !dbg !1708
  call void @free(i8* %50) nounwind, !dbg !1708
  call void @free(i8* %0) nounwind, !dbg !1709
  ret i8* null, !dbg !1683

bb16.i:                                           ; preds = %bb11.i
  %51 = add nsw i32 %storemerge1.i, 1, !dbg !1710
  %.pre = load i8*** %20, align 8
  br label %bb17.i, !dbg !1710

bb17.i:                                           ; preds = %bb16.i, %bb8.i
  %52 = phi i8** [ %38, %bb16.i ], [ %31, %bb8.i ]
  %53 = phi i8** [ %.pre, %bb16.i ], [ %21, %bb8.i ]
  %storemerge1.i = phi i32 [ %51, %bb16.i ], [ 0, %bb8.i ]
  %54 = sext i32 %storemerge1.i to i64, !dbg !1710
  %55 = getelementptr inbounds i8** %53, i64 %54, !dbg !1710
  %56 = load i8** %55, align 1, !dbg !1710
  %57 = icmp eq i8* %56, null, !dbg !1710
  br i1 %57, label %bb18.i, label %bb11.i, !dbg !1710

bb18.i:                                           ; preds = %bb17.i
  %58 = getelementptr inbounds i8** %52, i64 %54, !dbg !1711
  store i8* null, i8** %58, align 1, !dbg !1711
  ret i8* %0, !dbg !1683

return:                                           ; preds = %entry
  ret i8* null, !dbg !1683
}

define internal void @group_free(i8* %ent) nounwind {
entry:
  %0 = bitcast i8* %ent to i8**
  %1 = load i8** %0, align 8, !dbg !1712
  call void @free(i8* %1) nounwind, !dbg !1712
  %2 = getelementptr inbounds i8* %ent, i64 8
  %3 = bitcast i8* %2 to i8**
  %4 = load i8** %3, align 8, !dbg !1720
  %5 = icmp eq i8* %4, null, !dbg !1720
  br i1 %5, label %bb1.i, label %bb.i, !dbg !1720

bb.i:                                             ; preds = %entry
  %6 = call i64 @strlen(i8* %4) nounwind readonly, !dbg !1721
  %7 = call i8* @memset(i8* %4, i32 0, i64 %6) nounwind
  %8 = load i8** %3, align 8, !dbg !1722
  call void @free(i8* %8) nounwind, !dbg !1722
  br label %bb1.i, !dbg !1722

bb1.i:                                            ; preds = %bb.i, %entry
  %9 = getelementptr inbounds i8* %ent, i64 24
  %10 = bitcast i8* %9 to i8***
  %11 = load i8*** %10, align 8, !dbg !1723
  %12 = icmp eq i8** %11, null, !dbg !1723
  br i1 %12, label %return, label %bb4.i, !dbg !1723

bb3.i:                                            ; preds = %bb4.i
  call void @free(i8* %16) nounwind, !dbg !1724
  %13 = add i64 %storemerge.i, 1, !dbg !1726
  %.pre = load i8*** %10, align 8
  br label %bb4.i, !dbg !1726

bb4.i:                                            ; preds = %bb3.i, %bb1.i
  %14 = phi i8** [ %.pre, %bb3.i ], [ %11, %bb1.i ]
  %storemerge.i = phi i64 [ %13, %bb3.i ], [ 0, %bb1.i ]
  %15 = getelementptr inbounds i8** %14, i64 %storemerge.i, !dbg !1726
  %16 = load i8** %15, align 1, !dbg !1726
  %17 = icmp eq i8* %16, null, !dbg !1726
  br i1 %17, label %bb5.i, label %bb3.i, !dbg !1726

bb5.i:                                            ; preds = %bb4.i
  %18 = bitcast i8** %14 to i8*, !dbg !1727
  call void @free(i8* %18) nounwind, !dbg !1727
  br label %return, !dbg !1727

return:                                           ; preds = %bb5.i, %bb1.i
  call void @free(i8* %ent) nounwind, !dbg !1728
  ret void, !dbg !1729
}

define internal i8* @group_getname(i8* nocapture %ent) nounwind readonly {
return:
  %0 = bitcast i8* %ent to i8**
  %1 = load i8** %0, align 8, !dbg !1730
  ret i8* %1, !dbg !1730
}

define internal i8* @group_parse(i8* %line) nounwind {
entry:
  %endptr.i.i = alloca i8*, align 8
  %0 = call i64 @strlen(i8* %line) nounwind readonly, !dbg !1733
  %1 = add i64 %0, 1, !dbg !1733
  %2 = load i64* @size.5208, align 8, !dbg !1733
  %3 = icmp ugt i64 %1, %2, !dbg !1733
  %4 = load i8** @grpbuf.5207, align 8, !dbg !1738
  br i1 %3, label %bb.i, label %bb4.i, !dbg !1733

bb.i:                                             ; preds = %entry
  %5 = icmp eq i8* %4, null, !dbg !1738
  br i1 %5, label %bb2.i, label %bb1.i, !dbg !1738

bb1.i:                                            ; preds = %bb.i
  call void @free(i8* %4) nounwind, !dbg !1739
  br label %bb2.i, !dbg !1739

bb2.i:                                            ; preds = %bb1.i, %bb.i
  %6 = call i64 @strlen(i8* %line) nounwind readonly, !dbg !1740
  %7 = add i64 %6, 1000, !dbg !1740
  store i64 %7, i64* @size.5208, align 8, !dbg !1740
  %8 = call noalias i8* @malloc(i64 %7) nounwind, !dbg !1741
  store i8* %8, i8** @grpbuf.5207, align 8, !dbg !1741
  %9 = icmp eq i8* %8, null, !dbg !1742
  br i1 %9, label %bb3.i, label %bb4.i, !dbg !1742

bb3.i:                                            ; preds = %bb2.i
  store i64 0, i64* @size.5208, align 8, !dbg !1743
  ret i8* null, !dbg !1735

bb4.i:                                            ; preds = %bb2.i, %entry
  %10 = phi i8* [ %8, %bb2.i ], [ %4, %entry ]
  %11 = call i8* @strcpy(i8* noalias %10, i8* noalias %line) nounwind, !dbg !1744
  %12 = load i8** @grpbuf.5207, align 8, !dbg !1745
  %13 = call i8* @strrchr(i8* %12, i32 10) nounwind readonly, !dbg !1745
  %14 = icmp eq i8* %13, null, !dbg !1746
  br i1 %14, label %bb10.i, label %bb5.i, !dbg !1746

bb5.i:                                            ; preds = %bb4.i
  store i8 0, i8* %13, align 1, !dbg !1747
  br label %bb10.i, !dbg !1747

bb7.i:                                            ; preds = %bb10.i
  %15 = sext i32 %storemerge.i to i64, !dbg !1748
  %16 = getelementptr inbounds [4 x i8*]* @grpfields.5209, i64 0, i64 %15, !dbg !1748
  store i8* %cp.i.0, i8** %16, align 8, !dbg !1748
  %17 = call i8* @strchr(i8* %cp.i.0, i32 58) nounwind readonly, !dbg !1749
  %18 = icmp eq i8* %17, null, !dbg !1750
  br i1 %18, label %bb9.i, label %bb8.i, !dbg !1750

bb8.i:                                            ; preds = %bb7.i
  store i8 0, i8* %17, align 1, !dbg !1751
  %19 = getelementptr inbounds i8* %17, i64 1, !dbg !1752
  br label %bb9.i, !dbg !1752

bb9.i:                                            ; preds = %bb8.i, %bb7.i
  %cp.i.1 = phi i8* [ %17, %bb7.i ], [ %19, %bb8.i ]
  %20 = add nsw i32 %storemerge.i, 1, !dbg !1753
  br label %bb10.i, !dbg !1753

bb10.i:                                           ; preds = %bb9.i, %bb5.i, %bb4.i
  %cp.i.0 = phi i8* [ %cp.i.1, %bb9.i ], [ %12, %bb4.i ], [ %12, %bb5.i ]
  %storemerge.i = phi i32 [ %20, %bb9.i ], [ 0, %bb4.i ], [ 0, %bb5.i ]
  %21 = icmp sgt i32 %storemerge.i, 3, !dbg !1753
  %22 = icmp eq i8* %cp.i.0, null, !dbg !1753
  %or.cond = or i1 %21, %22
  br i1 %or.cond, label %bb12.i, label %bb7.i, !dbg !1753

bb12.i:                                           ; preds = %bb10.i
  %23 = icmp slt i32 %storemerge.i, 3
  br i1 %23, label %return, label %bb13.i, !dbg !1754

bb13.i:                                           ; preds = %bb12.i
  %24 = load i8** getelementptr inbounds ([4 x i8*]* @grpfields.5209, i64 0, i64 2), align 8, !dbg !1754
  %25 = load i8* %24, align 1, !dbg !1754
  %26 = icmp eq i8 %25, 0, !dbg !1754
  br i1 %26, label %return, label %bb15.i, !dbg !1754

bb15.i:                                           ; preds = %bb13.i
  %27 = load i8** getelementptr inbounds ([4 x i8*]* @grpfields.5209, i64 0, i64 0), align 8, !dbg !1755
  store i8* %27, i8** getelementptr inbounds (%struct.group* @grent.5210, i64 0, i32 0), align 8, !dbg !1755
  %28 = load i8** getelementptr inbounds ([4 x i8*]* @grpfields.5209, i64 0, i64 1), align 8, !dbg !1756
  store i8* %28, i8** getelementptr inbounds (%struct.group* @grent.5210, i64 0, i32 1), align 8, !dbg !1756
  %29 = call i32* @__errno_location() nounwind readnone
  store i32 0, i32* %29, align 4
  %30 = call i64 @strtoll(i8* noalias %24, i8** noalias %endptr.i.i, i32 10) nounwind
  %31 = load i8* %24, align 1
  %32 = icmp eq i8 %31, 0
  br i1 %32, label %return, label %bb.i.i

bb.i.i:                                           ; preds = %bb15.i
  %33 = load i8** %endptr.i.i, align 8
  %34 = load i8* %33, align 1
  %35 = icmp eq i8 %34, 0
  br i1 %35, label %bb1.i.i, label %return

bb1.i.i:                                          ; preds = %bb.i.i
  %36 = load i32* %29, align 4
  %37 = icmp eq i32 %36, 34
  br i1 %37, label %return, label %bb2.i.i

bb2.i.i:                                          ; preds = %bb1.i.i
  %38 = and i64 %30, 4294967295
  %39 = icmp eq i64 %38, %30
  br i1 %39, label %bb17.i, label %return

bb17.i:                                           ; preds = %bb2.i.i
  %40 = trunc i64 %30 to i32
  store i32 %40, i32* getelementptr inbounds (%struct.group* @grent.5210, i64 0, i32 2), align 8
  %41 = load i8** getelementptr inbounds ([4 x i8*]* @grpfields.5209, i64 0, i64 3), align 8, !dbg !1757
  br label %bb.i2.i, !dbg !1758

bb.i2.i:                                          ; preds = %bb16.i.i, %bb15.i.i, %bb13.i.i, %bb17.i
  %i.i.i.0 = phi i32 [ 0, %bb17.i ], [ %62, %bb13.i.i ], [ %62, %bb15.i.i ], [ %62, %bb16.i.i ]
  %s_addr.i.i.1 = phi i8* [ %41, %bb17.i ], [ %s_addr.i.i.0, %bb13.i.i ], [ %s_addr.i.i.0, %bb15.i.i ], [ %67, %bb16.i.i ]
  %42 = load i32* @size.5160, align 4, !dbg !1760
  %43 = icmp slt i32 %i.i.i.0, %42, !dbg !1760
  br i1 %43, label %bb9.i.i, label %bb1.i3.i, !dbg !1760

bb1.i3.i:                                         ; preds = %bb.i2.i
  %44 = add nsw i32 %i.i.i.0, 100, !dbg !1761
  store i32 %44, i32* @size.5160, align 4, !dbg !1761
  %45 = load i8*** @members.5159, align 8, !dbg !1762
  %46 = icmp eq i8** %45, null, !dbg !1762
  %47 = sext i32 %44 to i64, !dbg !1763
  %48 = shl i64 %47, 3
  br i1 %46, label %bb3.i5.i, label %bb2.i4.i, !dbg !1762

bb2.i4.i:                                         ; preds = %bb1.i3.i
  %49 = bitcast i8** %45 to i8*, !dbg !1764
  %50 = call i8* @realloc(i8* %49, i64 %48) nounwind, !dbg !1764
  br label %bb4.i6.i, !dbg !1764

bb3.i5.i:                                         ; preds = %bb1.i3.i
  %51 = call noalias i8* @malloc(i64 %48) nounwind, !dbg !1763
  br label %bb4.i6.i, !dbg !1763

bb4.i6.i:                                         ; preds = %bb3.i5.i, %bb2.i4.i
  %storemerge1.in.i.i = phi i8* [ %51, %bb3.i5.i ], [ %50, %bb2.i4.i ]
  %52 = icmp eq i8* %storemerge1.in.i.i, null
  br i1 %52, label %bb5.i.i, label %bb8.i.i, !dbg !1765

bb5.i.i:                                          ; preds = %bb4.i6.i
  %53 = load i8*** @members.5159, align 8, !dbg !1766
  %54 = icmp eq i8** %53, null, !dbg !1766
  br i1 %54, label %list.exit.i.thread, label %bb6.i.i, !dbg !1766

bb6.i.i:                                          ; preds = %bb5.i.i
  %55 = bitcast i8** %53 to i8*, !dbg !1767
  call void @free(i8* %55) nounwind, !dbg !1767
  br label %list.exit.i.thread, !dbg !1767

list.exit.i.thread:                               ; preds = %bb6.i.i, %bb5.i.i
  store i8** null, i8*** @members.5159, align 8, !dbg !1768
  store i32 0, i32* @size.5160, align 4, !dbg !1769
  store i8** null, i8*** getelementptr inbounds (%struct.group* @grent.5210, i64 0, i32 3), align 8, !dbg !1757
  ret i8* null, !dbg !1735

bb8.i.i:                                          ; preds = %bb4.i6.i
  %storemerge1.i.i = bitcast i8* %storemerge1.in.i.i to i8**
  store i8** %storemerge1.i.i, i8*** @members.5159, align 8, !dbg !1770
  br label %bb9.i.i, !dbg !1770

bb9.i.i:                                          ; preds = %bb8.i.i, %bb.i2.i
  %56 = icmp eq i8* %s_addr.i.i.1, null, !dbg !1771
  br i1 %56, label %list.exit.i, label %bb10.i.i, !dbg !1771

bb10.i.i:                                         ; preds = %bb9.i.i
  %57 = load i8* %s_addr.i.i.1, align 1, !dbg !1771
  %58 = icmp eq i8 %57, 0, !dbg !1771
  br i1 %58, label %list.exit.i, label %bb11.i.i, !dbg !1771

bb11.i.i:                                         ; preds = %bb10.i.i
  %59 = load i8*** @members.5159, align 8, !dbg !1772
  %60 = sext i32 %i.i.i.0 to i64, !dbg !1772
  %61 = getelementptr inbounds i8** %59, i64 %60, !dbg !1772
  store i8* %s_addr.i.i.1, i8** %61, align 1, !dbg !1772
  %62 = add nsw i32 %i.i.i.0, 1, !dbg !1772
  br label %bb13.i.i, !dbg !1772

bb12.i.i:                                         ; preds = %bb14.i.i
  %63 = getelementptr inbounds i8* %s_addr.i.i.0, i64 1, !dbg !1773
  br label %bb13.i.i, !dbg !1773

bb13.i.i:                                         ; preds = %bb12.i.i, %bb11.i.i
  %s_addr.i.i.0 = phi i8* [ %s_addr.i.i.1, %bb11.i.i ], [ %63, %bb12.i.i ]
  %64 = load i8* %s_addr.i.i.0, align 1, !dbg !1774
  %65 = icmp eq i8 %64, 0, !dbg !1774
  br i1 %65, label %bb.i2.i, label %bb14.i.i, !dbg !1774

bb14.i.i:                                         ; preds = %bb13.i.i
  %66 = icmp eq i8 %64, 44, !dbg !1774
  br i1 %66, label %bb15.i.i, label %bb12.i.i, !dbg !1774

bb15.i.i:                                         ; preds = %bb14.i.i
  br i1 %65, label %bb.i2.i, label %bb16.i.i, !dbg !1775

bb16.i.i:                                         ; preds = %bb15.i.i
  store i8 0, i8* %s_addr.i.i.0, align 1, !dbg !1776
  %67 = getelementptr inbounds i8* %s_addr.i.i.0, i64 1, !dbg !1776
  br label %bb.i2.i, !dbg !1776

list.exit.i:                                      ; preds = %bb10.i.i, %bb9.i.i
  %68 = load i8*** @members.5159, align 8, !dbg !1777
  %69 = sext i32 %i.i.i.0 to i64, !dbg !1777
  %70 = getelementptr inbounds i8** %68, i64 %69, !dbg !1777
  store i8* null, i8** %70, align 1, !dbg !1777
  store i8** %68, i8*** getelementptr inbounds (%struct.group* @grent.5210, i64 0, i32 3), align 8, !dbg !1757
  %71 = icmp eq i8** %68, null, !dbg !1778
  %retval = select i1 %71, i8* null, i8* bitcast (%struct.group* @grent.5210 to i8*)
  ret i8* %retval

return:                                           ; preds = %bb2.i.i, %bb1.i.i, %bb.i.i, %bb15.i, %bb13.i, %bb12.i
  ret i8* null, !dbg !1735
}

define internal i32 @group_put(i8* %ent, %struct.FILE* %file) nounwind {
entry:
  %0 = bitcast i8* %ent to %struct.group*, !dbg !1779
  %1 = icmp eq i8* %ent, null, !dbg !1782
  br i1 %1, label %return, label %bb, !dbg !1782

bb:                                               ; preds = %entry
  %2 = bitcast i8* %ent to i8**
  %3 = load i8** %2, align 8, !dbg !1782
  %4 = icmp eq i8* %3, null, !dbg !1783
  br i1 %4, label %return, label %bb5.i, !dbg !1783

bb2.i:                                            ; preds = %bb5.i
  %5 = sext i8 %9 to i32, !dbg !1793
  %6 = call i8* @strchr(i8* getelementptr inbounds ([3 x i8]* @.str231, i64 0, i64 0), i32 %5) nounwind readonly, !dbg !1793
  %7 = icmp eq i8* %6, null, !dbg !1793
  br i1 %7, label %bb4.i, label %return, !dbg !1793

bb4.i:                                            ; preds = %bb2.i
  %8 = getelementptr inbounds i8* %storemerge.i, i64 1, !dbg !1794
  br label %bb5.i, !dbg !1794

bb5.i:                                            ; preds = %bb4.i, %bb
  %storemerge.i = phi i8* [ %8, %bb4.i ], [ %3, %bb ]
  %9 = load i8* %storemerge.i, align 1, !dbg !1794
  %10 = icmp eq i8 %9, 0, !dbg !1794
  br i1 %10, label %bb11.i, label %bb2.i, !dbg !1794

bb8.i:                                            ; preds = %bb11.i
  %11 = call i16** @__ctype_b_loc() nounwind readnone, !dbg !1795
  %12 = load i16** %11, align 8, !dbg !1795
  %13 = sext i8 %20 to i64
  %14 = getelementptr inbounds i16* %12, i64 %13, !dbg !1795
  %15 = load i16* %14, align 1, !dbg !1795
  %16 = zext i16 %15 to i32, !dbg !1795
  %17 = and i32 %16, 16384, !dbg !1795
  %18 = icmp eq i32 %17, 0, !dbg !1795
  br i1 %18, label %bb1, label %bb10.i, !dbg !1795

bb10.i:                                           ; preds = %bb8.i
  %19 = getelementptr inbounds i8* %storemerge2.i, i64 1, !dbg !1796
  br label %bb11.i, !dbg !1796

bb11.i:                                           ; preds = %bb10.i, %bb5.i
  %storemerge2.i = phi i8* [ %19, %bb10.i ], [ %3, %bb5.i ]
  %20 = load i8* %storemerge2.i, align 1, !dbg !1796
  %21 = icmp eq i8 %20, 0, !dbg !1796
  br i1 %21, label %bb1, label %bb8.i, !dbg !1796

bb1:                                              ; preds = %bb11.i, %bb8.i
  %22 = getelementptr inbounds i8* %ent, i64 8
  %23 = bitcast i8* %22 to i8**
  %24 = load i8** %23, align 8, !dbg !1782
  %25 = icmp eq i8* %24, null, !dbg !1783
  br i1 %25, label %return, label %bb5.i14, !dbg !1783

bb2.i11:                                          ; preds = %bb5.i14
  %26 = sext i8 %30 to i32, !dbg !1793
  %27 = call i8* @strchr(i8* getelementptr inbounds ([3 x i8]* @.str231, i64 0, i64 0), i32 %26) nounwind readonly, !dbg !1793
  %28 = icmp eq i8* %27, null, !dbg !1793
  br i1 %28, label %bb4.i12, label %return, !dbg !1793

bb4.i12:                                          ; preds = %bb2.i11
  %29 = getelementptr inbounds i8* %storemerge.i13, i64 1, !dbg !1794
  br label %bb5.i14, !dbg !1794

bb5.i14:                                          ; preds = %bb4.i12, %bb1
  %storemerge.i13 = phi i8* [ %29, %bb4.i12 ], [ %24, %bb1 ]
  %30 = load i8* %storemerge.i13, align 1, !dbg !1794
  %31 = icmp eq i8 %30, 0, !dbg !1794
  br i1 %31, label %bb11.i18, label %bb2.i11, !dbg !1794

bb8.i15:                                          ; preds = %bb11.i18
  %32 = call i16** @__ctype_b_loc() nounwind readnone, !dbg !1795
  %33 = load i16** %32, align 8, !dbg !1795
  %34 = sext i8 %41 to i64
  %35 = getelementptr inbounds i16* %33, i64 %34, !dbg !1795
  %36 = load i16* %35, align 1, !dbg !1795
  %37 = zext i16 %36 to i32, !dbg !1795
  %38 = and i32 %37, 16384, !dbg !1795
  %39 = icmp eq i32 %38, 0, !dbg !1795
  br i1 %39, label %bb2, label %bb10.i16, !dbg !1795

bb10.i16:                                         ; preds = %bb8.i15
  %40 = getelementptr inbounds i8* %storemerge2.i17, i64 1, !dbg !1796
  br label %bb11.i18, !dbg !1796

bb11.i18:                                         ; preds = %bb10.i16, %bb5.i14
  %storemerge2.i17 = phi i8* [ %40, %bb10.i16 ], [ %24, %bb5.i14 ]
  %41 = load i8* %storemerge2.i17, align 1, !dbg !1796
  %42 = icmp eq i8 %41, 0, !dbg !1796
  br i1 %42, label %bb2, label %bb8.i15, !dbg !1796

bb2:                                              ; preds = %bb11.i18, %bb8.i15
  %43 = getelementptr inbounds i8* %ent, i64 16
  %44 = bitcast i8* %43 to i32*
  %45 = load i32* %44, align 8, !dbg !1782
  %46 = icmp eq i32 %45, -1, !dbg !1782
  br i1 %46, label %return, label %bb4, !dbg !1782

bb4:                                              ; preds = %bb2
  %47 = getelementptr inbounds i8* %ent, i64 24
  %48 = bitcast i8* %47 to i8***
  %49 = load i8*** %48, align 8, !dbg !1797
  %50 = icmp eq i8** %49, null, !dbg !1797
  br i1 %50, label %bb10, label %bb9, !dbg !1797

bb2.i1:                                           ; preds = %bb5.i4
  %51 = sext i8 %55 to i32, !dbg !1798
  %52 = call i8* @strchr(i8* getelementptr inbounds ([4 x i8]* @.str1232, i64 0, i64 0), i32 %51) nounwind readonly, !dbg !1798
  %53 = icmp eq i8* %52, null, !dbg !1798
  br i1 %53, label %bb4.i2, label %return, !dbg !1798

bb4.i2:                                           ; preds = %bb2.i1
  %54 = getelementptr inbounds i8* %storemerge.i3, i64 1, !dbg !1801
  br label %bb5.i4, !dbg !1801

bb5.i4:                                           ; preds = %bb9, %bb4.i2
  %storemerge.i3 = phi i8* [ %54, %bb4.i2 ], [ %70, %bb9 ]
  %55 = load i8* %storemerge.i3, align 1, !dbg !1801
  %56 = icmp eq i8 %55, 0, !dbg !1801
  br i1 %56, label %bb11.i8, label %bb2.i1, !dbg !1801

bb8.i5:                                           ; preds = %bb11.i8
  %57 = call i16** @__ctype_b_loc() nounwind readnone, !dbg !1802
  %58 = load i16** %57, align 8, !dbg !1802
  %59 = sext i8 %66 to i64
  %60 = getelementptr inbounds i16* %58, i64 %59, !dbg !1802
  %61 = load i16* %60, align 1, !dbg !1802
  %62 = zext i16 %61 to i32, !dbg !1802
  %63 = and i32 %62, 16384, !dbg !1802
  %64 = icmp eq i32 %63, 0, !dbg !1802
  br i1 %64, label %bb8, label %bb10.i6, !dbg !1802

bb10.i6:                                          ; preds = %bb8.i5
  %65 = getelementptr inbounds i8* %storemerge2.i7, i64 1, !dbg !1803
  br label %bb11.i8, !dbg !1803

bb11.i8:                                          ; preds = %bb10.i6, %bb5.i4
  %storemerge2.i7 = phi i8* [ %65, %bb10.i6 ], [ %70, %bb5.i4 ]
  %66 = load i8* %storemerge2.i7, align 1, !dbg !1803
  %67 = icmp eq i8 %66, 0, !dbg !1803
  br i1 %67, label %bb8, label %bb8.i5, !dbg !1803

bb8:                                              ; preds = %bb11.i8, %bb8.i5
  %68 = add i64 %storemerge1, 1, !dbg !1804
  br label %bb9, !dbg !1804

bb9:                                              ; preds = %bb8, %bb4
  %storemerge1 = phi i64 [ %68, %bb8 ], [ 0, %bb4 ]
  %69 = getelementptr inbounds i8** %49, i64 %storemerge1, !dbg !1804
  %70 = load i8** %69, align 1, !dbg !1804
  %71 = icmp eq i8* %70, null, !dbg !1804
  br i1 %71, label %bb10, label %bb5.i4, !dbg !1804

bb10:                                             ; preds = %bb9, %bb4
  %72 = call i32 @putgrent(%struct.group* noalias %0, %struct.FILE* noalias %file) nounwind, !dbg !1805
  %73 = icmp eq i32 %72, -1, !dbg !1805
  %retval = sext i1 %73 to i32
  ret i32 %retval

return:                                           ; preds = %bb2.i1, %bb2, %bb2.i11, %bb1, %bb2.i, %bb, %entry
  ret i32 -1, !dbg !1805
}

declare i32 @putgrent(%struct.group* noalias, %struct.FILE* noalias)

define internal i32 @group_close_hook() nounwind {
entry:
  %0 = call fastcc i32 @getdef_unum() nounwind
  %1 = icmp eq i32 %0, 0, !dbg !1806
  br i1 %1, label %return, label %bb26.i, !dbg !1806

bb.i:                                             ; preds = %bb26.i
  %2 = getelementptr inbounds %struct.commonio_entry* %storemerge.i, i64 0, i32 1, !dbg !1809
  %3 = load i8** %2, align 8, !dbg !1809
  %4 = getelementptr inbounds %struct.commonio_entry* %storemerge.i, i64 0, i32 4, !dbg !1816
  %5 = load i8* %4, align 8, !dbg !1816
  %6 = and i8 %5, 1
  %toBool3.i = icmp eq i8 %6, 0
  %7 = icmp eq i8* %3, null
  %or.cond = or i1 %toBool3.i, %7
  br i1 %or.cond, label %bb25.i, label %bb7.i.preheader, !dbg !1816

bb7.i.preheader:                                  ; preds = %bb.i
  %8 = getelementptr inbounds i8* %3, i64 24
  %9 = bitcast i8* %8 to i8***
  %10 = load i8*** %9, align 8, !dbg !1817
  br label %bb7.i

bb6.i:                                            ; preds = %bb7.i
  %11 = add i32 %storemerge1.i, 1, !dbg !1817
  br label %bb7.i, !dbg !1817

bb7.i:                                            ; preds = %bb6.i, %bb7.i.preheader
  %storemerge1.i = phi i32 [ %11, %bb6.i ], [ 0, %bb7.i.preheader ]
  %12 = zext i32 %storemerge1.i to i64, !dbg !1817
  %13 = getelementptr inbounds i8** %10, i64 %12, !dbg !1817
  %14 = load i8** %13, align 1, !dbg !1817
  %15 = icmp eq i8* %14, null, !dbg !1817
  br i1 %15, label %bb8.i, label %bb6.i, !dbg !1817

bb8.i:                                            ; preds = %bb7.i
  %16 = icmp ugt i32 %storemerge1.i, %0, !dbg !1818
  br i1 %16, label %bb9.i, label %bb25.i, !dbg !1818

bb9.i:                                            ; preds = %bb8.i
  %17 = call noalias i8* @malloc(i64 40) nounwind, !dbg !1819
  %18 = bitcast i8* %17 to %struct.commonio_entry*, !dbg !1819
  %19 = icmp eq i8* %17, null
  br i1 %19, label %bb10.i, label %bb11.i, !dbg !1820

bb10.i:                                           ; preds = %bb9.i
  %20 = call i32* @__errno_location() nounwind readnone, !dbg !1821
  store i32 12, i32* %20, align 4, !dbg !1821
  ret i32 0, !dbg !1815

bb11.i:                                           ; preds = %bb9.i
  %21 = call i8* @group_dup(i8* %3) nounwind, !dbg !1822
  %22 = getelementptr inbounds i8* %17, i64 8
  %23 = bitcast i8* %22 to i8**
  store i8* %21, i8** %23, align 8, !dbg !1822
  %24 = icmp eq i8* %21, null, !dbg !1823
  br i1 %24, label %bb12.i, label %bb13.i, !dbg !1823

bb12.i:                                           ; preds = %bb11.i
  call void @free(i8* %17) nounwind, !dbg !1824
  %25 = call i32* @__errno_location() nounwind readnone, !dbg !1825
  store i32 12, i32* %25, align 4, !dbg !1825
  ret i32 0, !dbg !1815

bb13.i:                                           ; preds = %bb11.i
  %26 = bitcast i8* %17 to i8**
  store i8* null, i8** %26, align 8, !dbg !1826
  %27 = getelementptr inbounds i8* %17, i64 32
  %28 = load i8* %27, align 8, !dbg !1827
  %29 = or i8 %28, 1, !dbg !1827
  store i8 %29, i8* %27, align 8, !dbg !1827
  br label %bb15.i, !dbg !1828

bb14.i:                                           ; preds = %bb15.i
  call void @free(i8* %36) nounwind, !dbg !1829
  %30 = load i8*** %9, align 8, !dbg !1830
  %31 = getelementptr inbounds i8** %30, i64 %34, !dbg !1830
  store i8* null, i8** %31, align 1, !dbg !1830
  %32 = add i32 %storemerge2.i, 1, !dbg !1828
  br label %bb15.i, !dbg !1828

bb15.i:                                           ; preds = %bb14.i, %bb13.i
  %storemerge2.i = phi i32 [ %0, %bb13.i ], [ %32, %bb14.i ]
  %33 = load i8*** %9, align 8, !dbg !1828
  %34 = zext i32 %storemerge2.i to i64, !dbg !1828
  %35 = getelementptr inbounds i8** %33, i64 %34, !dbg !1828
  %36 = load i8** %35, align 1, !dbg !1828
  %37 = icmp eq i8* %36, null, !dbg !1828
  br i1 %37, label %bb20.i.loopexit, label %bb14.i, !dbg !1828

bb17.i:                                           ; preds = %bb20.i
  %38 = zext i32 %storemerge3.i to i64, !dbg !1831
  %39 = getelementptr inbounds i8** %50, i64 %38, !dbg !1831
  %40 = load i8** %39, align 1, !dbg !1831
  %41 = icmp eq i8* %40, null, !dbg !1831
  br i1 %41, label %bb19.i, label %bb18.i, !dbg !1831

bb18.i:                                           ; preds = %bb17.i
  call void @free(i8* %40) nounwind, !dbg !1832
  %.pre = load i8*** %49, align 8
  %.phi.trans.insert = getelementptr inbounds i8** %.pre, i64 %52
  %.pre1 = load i8** %.phi.trans.insert, align 1
  br label %bb19.i, !dbg !1832

bb19.i:                                           ; preds = %bb18.i, %bb17.i
  %42 = phi i8* [ %.pre1, %bb18.i ], [ %54, %bb17.i ]
  %43 = phi i8** [ %.pre, %bb18.i ], [ %50, %bb17.i ]
  %44 = getelementptr inbounds i8** %43, i64 %38, !dbg !1833
  store i8* %42, i8** %44, align 1, !dbg !1833
  %45 = load i8*** %49, align 8, !dbg !1834
  %46 = getelementptr inbounds i8** %45, i64 %52, !dbg !1834
  store i8* null, i8** %46, align 1, !dbg !1834
  %47 = add i32 %storemerge3.i, 1, !dbg !1835
  br label %bb20.i, !dbg !1835

bb20.i.loopexit:                                  ; preds = %bb15.i
  %48 = getelementptr inbounds i8* %21, i64 24
  %49 = bitcast i8* %48 to i8***
  br label %bb20.i

bb20.i:                                           ; preds = %bb20.i.loopexit, %bb19.i
  %storemerge3.i = phi i32 [ %47, %bb19.i ], [ 0, %bb20.i.loopexit ]
  %50 = load i8*** %49, align 8, !dbg !1835
  %51 = add i32 %storemerge3.i, %0, !dbg !1835
  %52 = zext i32 %51 to i64, !dbg !1835
  %53 = getelementptr inbounds i8** %50, i64 %52, !dbg !1835
  %54 = load i8** %53, align 1, !dbg !1835
  %55 = icmp eq i8* %54, null, !dbg !1835
  br i1 %55, label %bb23.i, label %bb17.i, !dbg !1835

bb22.i:                                           ; preds = %bb23.i
  call void @free(i8* %62) nounwind, !dbg !1836
  %56 = load i8*** %49, align 8, !dbg !1837
  %57 = getelementptr inbounds i8** %56, i64 %60, !dbg !1837
  store i8* null, i8** %57, align 1, !dbg !1837
  %58 = add i32 %i.i.0, 1, !dbg !1838
  %.pre2 = load i8*** %49, align 8
  br label %bb23.i, !dbg !1838

bb23.i:                                           ; preds = %bb22.i, %bb20.i
  %59 = phi i8** [ %.pre2, %bb22.i ], [ %50, %bb20.i ]
  %i.i.0 = phi i32 [ %58, %bb22.i ], [ %storemerge3.i, %bb20.i ]
  %60 = zext i32 %i.i.0 to i64, !dbg !1838
  %61 = getelementptr inbounds i8** %59, i64 %60, !dbg !1838
  %62 = load i8** %61, align 1, !dbg !1838
  %63 = icmp eq i8* %62, null, !dbg !1838
  br i1 %63, label %bb24.i, label %bb22.i, !dbg !1838

bb24.i:                                           ; preds = %bb23.i
  %64 = getelementptr inbounds i8* %17, i64 16
  %65 = bitcast i8* %64 to %struct.commonio_entry**
  store %struct.commonio_entry* %storemerge.i, %struct.commonio_entry** %65, align 8, !dbg !1839
  %66 = getelementptr inbounds %struct.commonio_entry* %storemerge.i, i64 0, i32 3, !dbg !1840
  %67 = load %struct.commonio_entry** %66, align 8, !dbg !1840
  %68 = getelementptr inbounds i8* %17, i64 24
  %69 = bitcast i8* %68 to %struct.commonio_entry**
  store %struct.commonio_entry* %67, %struct.commonio_entry** %69, align 8, !dbg !1840
  store %struct.commonio_entry* %18, %struct.commonio_entry** %66, align 8, !dbg !1841
  br label %bb25.i, !dbg !1841

bb25.i:                                           ; preds = %bb24.i, %bb8.i, %bb.i
  %70 = getelementptr inbounds %struct.commonio_entry* %storemerge.i, i64 0, i32 3, !dbg !1842
  br label %bb26.i, !dbg !1842

bb26.i:                                           ; preds = %bb25.i, %entry
  %storemerge.in.i = phi %struct.commonio_entry** [ %70, %bb25.i ], [ getelementptr inbounds (%struct.commonio_db* @group_db, i64 0, i32 3), %entry ]
  %storemerge.i = load %struct.commonio_entry** %storemerge.in.i, align 8
  %71 = icmp eq %struct.commonio_entry* %storemerge.i, null, !dbg !1842
  br i1 %71, label %return, label %bb.i, !dbg !1842

return:                                           ; preds = %bb26.i, %entry
  ret i32 1, !dbg !1815
}

define internal i32 @group_open_hook() nounwind {
entry:
  %0 = call fastcc i32 @getdef_unum() nounwind
  %1 = icmp eq i32 %0, 0, !dbg !1843
  br i1 %1, label %return, label %bb20, !dbg !1843

bb2:                                              ; preds = %bb20
  %2 = getelementptr inbounds %struct.commonio_entry* %storemerge, i64 0, i32 1, !dbg !1846
  %3 = getelementptr inbounds %struct.commonio_entry* %storemerge, i64 0, i32 0, !dbg !1848
  br label %bb16, !dbg !1854

bb3:                                              ; preds = %bb16
  %4 = load i8** %2, align 8, !dbg !1846
  %5 = getelementptr inbounds %struct.commonio_entry* %storemerge1, i64 0, i32 1, !dbg !1855
  %6 = load i8** %5, align 8, !dbg !1855
  %7 = icmp eq i8* %4, null
  %8 = icmp eq i8* %6, null
  %or.cond = or i1 %7, %8
  br i1 %or.cond, label %bb16, label %bb5, !dbg !1856

bb5:                                              ; preds = %bb3
  %9 = bitcast i8* %6 to i8**
  %10 = load i8** %9, align 8, !dbg !1856
  %11 = bitcast i8* %4 to i8**
  %12 = load i8** %11, align 8, !dbg !1856
  %13 = call i32 @strcmp(i8* %12, i8* %10) nounwind readonly, !dbg !1856
  %14 = icmp eq i32 %13, 0, !dbg !1856
  br i1 %14, label %bb6, label %bb16, !dbg !1856

bb6:                                              ; preds = %bb5
  %15 = getelementptr inbounds i8* %6, i64 8
  %16 = bitcast i8* %15 to i8**
  %17 = load i8** %16, align 8, !dbg !1856
  %18 = getelementptr inbounds i8* %4, i64 8
  %19 = bitcast i8* %18 to i8**
  %20 = load i8** %19, align 8, !dbg !1856
  %21 = call i32 @strcmp(i8* %20, i8* %17) nounwind readonly, !dbg !1856
  %22 = icmp eq i32 %21, 0, !dbg !1856
  br i1 %22, label %bb7, label %bb16, !dbg !1856

bb7:                                              ; preds = %bb6
  %23 = getelementptr inbounds i8* %4, i64 16
  %24 = bitcast i8* %23 to i32*
  %25 = load i32* %24, align 8, !dbg !1856
  %26 = getelementptr inbounds i8* %6, i64 16
  %27 = bitcast i8* %26 to i32*
  %28 = load i32* %27, align 8, !dbg !1856
  %29 = icmp eq i32 %25, %28, !dbg !1856
  br i1 %29, label %bb2.i, label %bb16, !dbg !1856

bb2.i:                                            ; preds = %bb7
  %or.cond2 = or i1 %8, %7
  br i1 %or.cond2, label %bb4.i, label %bb5.i, !dbg !1857

bb4.i:                                            ; preds = %bb2.i
  %30 = call i32* @__errno_location() nounwind readnone, !dbg !1858
  store i32 22, i32* %30, align 4, !dbg !1858
  ret i32 0, !dbg !1859

bb5.i:                                            ; preds = %bb2.i
  %31 = load i8** %3, align 8, !dbg !1848
  %32 = call i64 @strlen(i8* %31) nounwind readonly, !dbg !1848
  %33 = getelementptr inbounds %struct.commonio_entry* %storemerge1, i64 0, i32 0, !dbg !1848
  %34 = load i8** %33, align 8, !dbg !1848
  %35 = call i64 @strlen(i8* %34) nounwind readonly, !dbg !1848
  %36 = add i64 %32, %35, !dbg !1848
  %37 = add i64 %36, 1, !dbg !1848
  %38 = shl i64 %36, 3
  %39 = add i64 %38, 16
  %40 = call noalias i8* @malloc(i64 %39) nounwind, !dbg !1860
  %41 = icmp eq i8* %40, null, !dbg !1861
  br i1 %41, label %bb6.i, label %bb7.i, !dbg !1861

bb6.i:                                            ; preds = %bb5.i
  %42 = call i32* @__errno_location() nounwind readnone, !dbg !1862
  store i32 12, i32* %42, align 4, !dbg !1862
  ret i32 0, !dbg !1859

bb7.i:                                            ; preds = %bb5.i
  %43 = call i32 (i8*, i64, i8*, ...)* @snprintf(i8* noalias %40, i64 %37, i8* noalias getelementptr inbounds ([6 x i8]* @.str6237, i64 0, i64 0), i8* %31, i8* %34) nounwind, !dbg !1863
  %44 = getelementptr inbounds i8* %40, i64 %37, !dbg !1864
  store i8 0, i8* %44, align 1, !dbg !1864
  %45 = getelementptr inbounds i8* %4, i64 24
  %46 = bitcast i8* %45 to i8***
  %47 = load i8*** %46, align 8, !dbg !1865
  br label %bb9.i, !dbg !1865

bb8.i:                                            ; preds = %bb9.i
  %48 = add i64 %storemerge.i, 1, !dbg !1865
  br label %bb9.i, !dbg !1865

bb9.i:                                            ; preds = %bb8.i, %bb7.i
  %storemerge.i = phi i64 [ 0, %bb7.i ], [ %48, %bb8.i ]
  %49 = getelementptr inbounds i8** %47, i64 %storemerge.i, !dbg !1865
  %50 = load i8** %49, align 1, !dbg !1865
  %51 = icmp eq i8* %50, null, !dbg !1865
  br i1 %51, label %bb10.i, label %bb8.i, !dbg !1865

bb10.i:                                           ; preds = %bb9.i
  %52 = getelementptr inbounds i8* %6, i64 24
  %53 = bitcast i8* %52 to i8***
  %54 = load i8*** %53, align 8, !dbg !1866
  br label %bb18.i, !dbg !1866

bb12.i:                                           ; preds = %bb14.i
  %55 = call i32 @strcmp(i8* %58, i8* %63) nounwind readonly, !dbg !1867
  %56 = icmp eq i32 %55, 0, !dbg !1867
  br i1 %56, label %bb15.i, label %bb13.i, !dbg !1867

bb13.i:                                           ; preds = %bb12.i
  %57 = getelementptr inbounds i8** %storemerge5.i, i64 1, !dbg !1869
  br label %bb14.i, !dbg !1869

bb14.i:                                           ; preds = %bb18.i, %bb13.i
  %storemerge5.i = phi i8** [ %57, %bb13.i ], [ %47, %bb18.i ]
  %58 = load i8** %storemerge5.i, align 8, !dbg !1870
  %59 = icmp eq i8* %58, null, !dbg !1870
  br i1 %59, label %bb16.i, label %bb12.i, !dbg !1870

bb15.i:                                           ; preds = %bb12.i
  br i1 %59, label %bb16.i, label %bb17.i, !dbg !1871

bb16.i:                                           ; preds = %bb15.i, %bb14.i
  %60 = add i64 %members.i.1, 1, !dbg !1872
  br label %bb17.i, !dbg !1872

bb17.i:                                           ; preds = %bb16.i, %bb15.i
  %members.i.0 = phi i64 [ %60, %bb16.i ], [ %members.i.1, %bb15.i ]
  %61 = add i64 %storemerge1.i, 1, !dbg !1866
  br label %bb18.i, !dbg !1866

bb18.i:                                           ; preds = %bb17.i, %bb10.i
  %members.i.1 = phi i64 [ %storemerge.i, %bb10.i ], [ %members.i.0, %bb17.i ]
  %storemerge1.i = phi i64 [ 0, %bb10.i ], [ %61, %bb17.i ]
  %62 = getelementptr inbounds i8** %54, i64 %storemerge1.i, !dbg !1866
  %63 = load i8** %62, align 1, !dbg !1866
  %64 = icmp eq i8* %63, null, !dbg !1866
  br i1 %64, label %bb19.i, label %bb14.i, !dbg !1866

bb19.i:                                           ; preds = %bb18.i
  %65 = shl i64 %members.i.1, 3
  %66 = add i64 %65, 8
  %67 = call noalias i8* @malloc(i64 %66) nounwind, !dbg !1873
  %68 = bitcast i8* %67 to i8**, !dbg !1873
  %69 = icmp eq i8* %67, null
  br i1 %69, label %bb20.i, label %bb23.i, !dbg !1874

bb20.i:                                           ; preds = %bb19.i
  call void @free(i8* %40) nounwind, !dbg !1875
  %70 = call i32* @__errno_location() nounwind readnone, !dbg !1876
  store i32 12, i32* %70, align 4, !dbg !1876
  ret i32 0, !dbg !1859

bb22.i:                                           ; preds = %bb23.i
  %71 = getelementptr inbounds i8** %68, i64 %storemerge2.i, !dbg !1877
  store i8* %75, i8** %71, align 1, !dbg !1877
  %72 = add i64 %storemerge2.i, 1, !dbg !1878
  %.pre = load i8*** %46, align 8
  br label %bb23.i, !dbg !1878

bb23.i:                                           ; preds = %bb22.i, %bb19.i
  %73 = phi i8** [ %.pre, %bb22.i ], [ %47, %bb19.i ]
  %storemerge2.i = phi i64 [ %72, %bb22.i ], [ 0, %bb19.i ]
  %74 = getelementptr inbounds i8** %73, i64 %storemerge2.i, !dbg !1878
  %75 = load i8** %74, align 1, !dbg !1878
  %76 = icmp eq i8* %75, null, !dbg !1878
  br i1 %76, label %bb33.i, label %bb22.i, !dbg !1878

bb27.i:                                           ; preds = %bb29.i
  %77 = call i32 @strcmp(i8* %80, i8* %88) nounwind readonly, !dbg !1879
  %78 = icmp eq i32 %77, 0, !dbg !1879
  br i1 %78, label %bb30.i, label %bb28.i, !dbg !1879

bb28.i:                                           ; preds = %bb27.i
  %79 = getelementptr inbounds i8** %storemerge4.i, i64 1, !dbg !1881
  br label %bb29.i, !dbg !1881

bb29.i:                                           ; preds = %bb33.i, %bb28.i
  %storemerge4.i = phi i8** [ %79, %bb28.i ], [ %68, %bb33.i ]
  %80 = load i8** %storemerge4.i, align 8, !dbg !1882
  %81 = icmp eq i8* %80, null, !dbg !1882
  br i1 %81, label %bb31.i, label %bb27.i, !dbg !1882

bb30.i:                                           ; preds = %bb27.i
  br i1 %81, label %bb31.i, label %bb32.i, !dbg !1883

bb31.i:                                           ; preds = %bb30.i, %bb29.i
  %82 = getelementptr inbounds i8** %68, i64 %members.i.3, !dbg !1884
  store i8* %88, i8** %82, align 1, !dbg !1884
  %83 = add i64 %members.i.3, 1, !dbg !1885
  %84 = getelementptr inbounds i8** %68, i64 %83, !dbg !1886
  store i8* null, i8** %84, align 1, !dbg !1886
  br label %bb32.i, !dbg !1886

bb32.i:                                           ; preds = %bb31.i, %bb30.i
  %members.i.2 = phi i64 [ %83, %bb31.i ], [ %members.i.3, %bb30.i ]
  %85 = add i64 %storemerge3.i, 1, !dbg !1887
  br label %bb33.i, !dbg !1887

bb33.i:                                           ; preds = %bb32.i, %bb23.i
  %members.i.3 = phi i64 [ %members.i.2, %bb32.i ], [ %storemerge2.i, %bb23.i ]
  %storemerge3.i = phi i64 [ %85, %bb32.i ], [ 0, %bb23.i ]
  %86 = load i8*** %53, align 8, !dbg !1887
  %87 = getelementptr inbounds i8** %86, i64 %storemerge3.i, !dbg !1887
  %88 = load i8** %87, align 1, !dbg !1887
  %89 = icmp eq i8* %88, null, !dbg !1887
  br i1 %89, label %bb10, label %bb29.i, !dbg !1887

bb10:                                             ; preds = %bb33.i
  store i8* %40, i8** %3, align 8, !dbg !1888
  store i8** %68, i8*** %46, align 8, !dbg !1889
  %90 = getelementptr inbounds %struct.commonio_entry* %storemerge1, i64 0, i32 3, !dbg !1890
  %91 = load %struct.commonio_entry** %90, align 8, !dbg !1890
  %92 = icmp eq %struct.commonio_entry* %91, null, !dbg !1890
  br i1 %92, label %bb12, label %bb11, !dbg !1890

bb11:                                             ; preds = %bb10
  %93 = getelementptr inbounds %struct.commonio_entry* %storemerge1, i64 0, i32 2, !dbg !1891
  %94 = load %struct.commonio_entry** %93, align 8, !dbg !1891
  %95 = getelementptr inbounds %struct.commonio_entry* %91, i64 0, i32 2, !dbg !1891
  store %struct.commonio_entry* %94, %struct.commonio_entry** %95, align 8, !dbg !1891
  br label %bb12, !dbg !1891

bb12:                                             ; preds = %bb11, %bb10
  %96 = getelementptr inbounds %struct.commonio_entry* %storemerge1, i64 0, i32 2, !dbg !1892
  %97 = load %struct.commonio_entry** %96, align 8, !dbg !1892
  %98 = icmp eq %struct.commonio_entry* %97, null, !dbg !1892
  br i1 %98, label %bb13, label %bb14, !dbg !1892

bb13:                                             ; preds = %bb12
  call void @__assert_fail(i8* getelementptr inbounds ([25 x i8]* @.str3234, i64 0, i64 0), i8* getelementptr inbounds ([20 x i8]* @.str4235, i64 0, i64 0), i32 287, i8* getelementptr inbounds ([16 x i8]* @__PRETTY_FUNCTION__.5431, i64 0, i64 0)) noreturn nounwind, !dbg !1892
  unreachable, !dbg !1892

bb14:                                             ; preds = %bb12
  %99 = load %struct.commonio_entry** %90, align 8, !dbg !1893
  %100 = getelementptr inbounds %struct.commonio_entry* %97, i64 0, i32 3, !dbg !1893
  store %struct.commonio_entry* %99, %struct.commonio_entry** %100, align 8, !dbg !1893
  br label %bb16, !dbg !1893

bb16:                                             ; preds = %bb14, %bb7, %bb6, %bb5, %bb3, %bb2
  %.pn = phi %struct.commonio_entry* [ %storemerge, %bb2 ], [ %storemerge1, %bb3 ], [ %storemerge1, %bb5 ], [ %storemerge1, %bb6 ], [ %storemerge1, %bb7 ], [ %storemerge1, %bb14 ]
  %storemerge1.in = getelementptr inbounds %struct.commonio_entry* %.pn, i64 0, i32 3
  %storemerge1 = load %struct.commonio_entry** %storemerge1.in, align 8
  %101 = icmp eq %struct.commonio_entry* %storemerge1, null, !dbg !1854
  br i1 %101, label %bb19, label %bb3, !dbg !1854

bb19:                                             ; preds = %bb16
  %102 = getelementptr inbounds %struct.commonio_entry* %storemerge, i64 0, i32 3, !dbg !1894
  br label %bb20, !dbg !1894

bb20:                                             ; preds = %bb19, %entry
  %storemerge.in = phi %struct.commonio_entry** [ %102, %bb19 ], [ getelementptr inbounds (%struct.commonio_db* @group_db, i64 0, i32 3), %entry ]
  %storemerge = load %struct.commonio_entry** %storemerge.in, align 8
  %103 = icmp eq %struct.commonio_entry* %storemerge, null, !dbg !1894
  br i1 %103, label %return, label %bb2, !dbg !1894

return:                                           ; preds = %bb20, %entry
  ret i32 1, !dbg !1859
}

define internal fastcc void @nscd_flush_cache(i8* %service) nounwind {
bb1.i:
  %status = alloca i32, align 4
  %spawnedArgs = alloca [4 x i8*], align 8
  %spawnedEnv = alloca [1 x i8*], align 8
  %0 = getelementptr inbounds [4 x i8*]* %spawnedArgs, i64 0, i64 0, !dbg !1895
  store i8* getelementptr inbounds ([5 x i8]* @.str1246, i64 0, i64 0), i8** %0, align 8, !dbg !1895
  %1 = getelementptr inbounds [4 x i8*]* %spawnedArgs, i64 0, i64 1, !dbg !1895
  store i8* getelementptr inbounds ([3 x i8]* @.str2247, i64 0, i64 0), i8** %1, align 8, !dbg !1895
  %2 = getelementptr inbounds [4 x i8*]* %spawnedArgs, i64 0, i64 2, !dbg !1895
  store i8* %service, i8** %2, align 8, !dbg !1895
  %3 = getelementptr inbounds [4 x i8*]* %spawnedArgs, i64 0, i64 3, !dbg !1895
  store i8* null, i8** %3, align 8, !dbg !1895
  %4 = getelementptr inbounds [1 x i8*]* %spawnedEnv, i64 0, i64 0, !dbg !1905
  store i8* null, i8** %4, align 8, !dbg !1905
  %5 = load %struct.FILE** @stdout, align 8, !dbg !1906
  %6 = call i32 @fflush(%struct.FILE* %5) nounwind, !dbg !1906
  %7 = load %struct.FILE** @stderr, align 8, !dbg !1919
  %8 = call i32 @fflush(%struct.FILE* %7) nounwind, !dbg !1919
  %9 = call i32 @fork() nounwind, !dbg !1920
  %Pivot = icmp slt i32 %9, 0
  br i1 %Pivot, label %LeafBlock, label %LeafBlock1

LeafBlock1:                                       ; preds = %bb1.i
  %SwitchLeaf2 = icmp eq i32 %9, 0
  br i1 %SwitchLeaf2, label %bb2.i, label %bb7.i

LeafBlock:                                        ; preds = %bb1.i
  %SwitchLeaf = icmp eq i32 %9, -1
  br i1 %SwitchLeaf, label %bb6.i, label %bb7.i

bb2.i:                                            ; preds = %LeafBlock1
  %10 = call i32 @execve(i8* getelementptr inbounds ([15 x i8]* @.str245, i64 0, i64 0), i8** %0, i8** %4) nounwind, !dbg !1921
  %11 = call i32* @__errno_location() nounwind readnone, !dbg !1922
  %12 = load i32* %11, align 4, !dbg !1922
  %13 = icmp eq i32 %12, 2, !dbg !1922
  br i1 %13, label %bb3.i, label %bb4.i, !dbg !1922

bb3.i:                                            ; preds = %bb2.i
  call void @exit(i32 127) noreturn nounwind, !dbg !1923
  unreachable, !dbg !1923

bb4.i:                                            ; preds = %bb2.i
  %14 = call i8* @strerror(i32 %12) nounwind, !dbg !1924
  %15 = load i8** @Prog, align 8, !dbg !1924
  %16 = load %struct.FILE** @stderr, align 8, !dbg !1924
  %17 = call i32 (%struct.FILE*, i8*, ...)* @fprintf(%struct.FILE* noalias %16, i8* noalias getelementptr inbounds ([27 x i8]* @.str316, i64 0, i64 0), i8* %15, i8* getelementptr inbounds ([15 x i8]* @.str245, i64 0, i64 0), i8* %14) nounwind, !dbg !1924
  call void @exit(i32 126) noreturn nounwind, !dbg !1925
  unreachable, !dbg !1925

bb6.i:                                            ; preds = %LeafBlock
  %18 = call i32* @__errno_location() nounwind readnone, !dbg !1926
  %19 = load i32* %18, align 4, !dbg !1926
  %20 = call i8* @strerror(i32 %19) nounwind, !dbg !1926
  %21 = load i8** @Prog, align 8, !dbg !1926
  %22 = load %struct.FILE** @stderr, align 8, !dbg !1926
  %23 = call i32 (%struct.FILE*, i8*, ...)* @fprintf(%struct.FILE* noalias %22, i8* noalias getelementptr inbounds ([27 x i8]* @.str316, i64 0, i64 0), i8* %21, i8* getelementptr inbounds ([15 x i8]* @.str245, i64 0, i64 0), i8* %20) nounwind, !dbg !1926
  br label %bb, !dbg !1927

bb7.i:                                            ; preds = %bb9.i, %bb8.i, %LeafBlock, %LeafBlock1
  %24 = call i32 @waitpid(i32 %9, i32* %status, i32 0) nounwind, !dbg !1928
  %25 = icmp eq i32 %24, -1, !dbg !1929
  br i1 %25, label %bb8.i, label %bb9.i, !dbg !1929

bb8.i:                                            ; preds = %bb7.i
  %26 = call i32* @__errno_location() nounwind readnone, !dbg !1929
  %27 = load i32* %26, align 4, !dbg !1929
  %.not = icmp ne i32 %27, 4
  %28 = icmp eq i32 %24, %9, !dbg !1929
  %or.cond = and i1 %.not, %28
  br i1 %or.cond, label %bb10.i, label %bb7.i, !dbg !1929

bb9.i:                                            ; preds = %bb7.i
  %.old = icmp eq i32 %24, %9, !dbg !1929
  br i1 %.old, label %bb10.i, label %bb7.i, !dbg !1929

bb10.i:                                           ; preds = %bb9.i, %bb8.i
  br i1 %25, label %bb11.i, label %bb3, !dbg !1930

bb11.i:                                           ; preds = %bb10.i
  %29 = call i32* @__errno_location() nounwind readnone, !dbg !1931
  %30 = load i32* %29, align 4, !dbg !1931
  %31 = call i8* @strerror(i32 %30) nounwind, !dbg !1931
  %32 = load i32* %status, align 4, !dbg !1931
  %33 = load i8** @Prog, align 8, !dbg !1931
  %34 = load %struct.FILE** @stderr, align 8, !dbg !1931
  %35 = call i32 (%struct.FILE*, i8*, ...)* @fprintf(%struct.FILE* noalias %34, i8* noalias getelementptr inbounds ([30 x i8]* @.str1317, i64 0, i64 0), i8* %33, i32 %32, i8* %31) nounwind, !dbg !1931
  br label %bb, !dbg !1932

bb:                                               ; preds = %bb11.i, %bb6.i
  %36 = load i8** @Prog, align 8, !dbg !1933
  %37 = load %struct.FILE** @stderr, align 8, !dbg !1933
  %38 = call i32 (%struct.FILE*, i8*, ...)* @fprintf(%struct.FILE* noalias %37, i8* noalias getelementptr inbounds ([37 x i8]* @.str3248, i64 0, i64 0), i8* %36) nounwind, !dbg !1933
  ret void

bb3:                                              ; preds = %bb10.i
  %39 = load i32* %status, align 4, !dbg !1934
  %40 = lshr i32 %39, 8
  %41 = and i32 %40, 255
  %42 = and i32 %39, 127, !dbg !1935
  %43 = icmp eq i32 %42, 0, !dbg !1935
  br i1 %43, label %NodeBlock8, label %bb4, !dbg !1935

bb4:                                              ; preds = %bb3
  %44 = load i8** @Prog, align 8, !dbg !1936
  %45 = load %struct.FILE** @stderr, align 8, !dbg !1936
  %46 = call i32 (%struct.FILE*, i8*, ...)* @fprintf(%struct.FILE* noalias %45, i8* noalias getelementptr inbounds ([49 x i8]* @.str4249, i64 0, i64 0), i8* %44, i32 %42) nounwind, !dbg !1936
  ret void

NodeBlock8:                                       ; preds = %bb3
  %Pivot9 = icmp ult i32 %41, 127
  br i1 %Pivot9, label %LeafBlock4, label %LeafBlock6

LeafBlock6:                                       ; preds = %NodeBlock8
  %SwitchLeaf7 = icmp eq i32 %41, 127
  br i1 %SwitchLeaf7, label %return, label %bb8

LeafBlock4:                                       ; preds = %NodeBlock8
  %SwitchLeaf5 = icmp eq i32 %41, 0
  br i1 %SwitchLeaf5, label %return, label %bb8

bb8:                                              ; preds = %LeafBlock4, %LeafBlock6
  %47 = load i8** @Prog, align 8, !dbg !1938
  %48 = load %struct.FILE** @stderr, align 8, !dbg !1938
  %49 = call i32 (%struct.FILE*, i8*, ...)* @fprintf(%struct.FILE* noalias %48, i8* noalias getelementptr inbounds ([31 x i8]* @.str5250, i64 0, i64 0), i8* %47, i32 %41) nounwind, !dbg !1938
  %50 = load i8** @Prog, align 8, !dbg !1939
  %51 = load %struct.FILE** @stderr, align 8, !dbg !1939
  %52 = call i32 (%struct.FILE*, i8*, ...)* @fprintf(%struct.FILE* noalias %51, i8* noalias getelementptr inbounds ([37 x i8]* @.str3248, i64 0, i64 0), i8* %50) nounwind, !dbg !1939
  ret void

return:                                           ; preds = %LeafBlock4, %LeafBlock6
  ret void
}

declare i8* @crypt(i8*, i8*) nounwind

declare void @perror(i8*)

define internal i8* @gshadow_dup(i8* nocapture %ent) nounwind {
entry:
  %0 = call noalias i8* @malloc(i64 32) nounwind, !dbg !1940
  %1 = icmp eq i8* %0, null
  br i1 %1, label %return, label %bb1.i, !dbg !1949

bb1.i:                                            ; preds = %entry
  %2 = bitcast i8* %ent to i8**
  %3 = load i8** %2, align 8, !dbg !1950
  %4 = call noalias i8* @strdup(i8* %3) nounwind, !dbg !1950
  %5 = bitcast i8* %0 to i8**
  store i8* %4, i8** %5, align 8, !dbg !1950
  %6 = icmp eq i8* %4, null, !dbg !1951
  br i1 %6, label %bb2.i, label %bb3.i, !dbg !1951

bb2.i:                                            ; preds = %bb1.i
  call void @free(i8* %0) nounwind, !dbg !1952
  ret i8* null, !dbg !1946

bb3.i:                                            ; preds = %bb1.i
  %7 = getelementptr inbounds i8* %ent, i64 8
  %8 = bitcast i8* %7 to i8**
  %9 = load i8** %8, align 8, !dbg !1953
  %10 = call noalias i8* @strdup(i8* %9) nounwind, !dbg !1953
  %11 = getelementptr inbounds i8* %0, i64 8
  %12 = bitcast i8* %11 to i8**
  store i8* %10, i8** %12, align 8, !dbg !1953
  %13 = icmp eq i8* %10, null, !dbg !1954
  br i1 %13, label %bb4.i, label %bb7.i.preheader, !dbg !1954

bb7.i.preheader:                                  ; preds = %bb3.i
  %14 = getelementptr inbounds i8* %ent, i64 16
  %15 = bitcast i8* %14 to i8***
  %16 = load i8*** %15, align 8, !dbg !1955
  br label %bb7.i

bb4.i:                                            ; preds = %bb3.i
  %17 = load i8** %5, align 8, !dbg !1956
  call void @free(i8* %17) nounwind, !dbg !1956
  call void @free(i8* %0) nounwind, !dbg !1957
  ret i8* null, !dbg !1946

bb7.i:                                            ; preds = %bb7.i, %bb7.i.preheader
  %storemerge.i = phi i32 [ 0, %bb7.i.preheader ], [ %22, %bb7.i ]
  %18 = sext i32 %storemerge.i to i64, !dbg !1955
  %19 = getelementptr inbounds i8** %16, i64 %18, !dbg !1955
  %20 = load i8** %19, align 1, !dbg !1955
  %21 = icmp eq i8* %20, null, !dbg !1955
  %22 = add nsw i32 %storemerge.i, 1, !dbg !1958
  br i1 %21, label %bb8.i, label %bb7.i, !dbg !1955

bb8.i:                                            ; preds = %bb7.i
  %23 = sext i32 %22 to i64, !dbg !1958
  %24 = shl i64 %23, 3
  %25 = call noalias i8* @malloc(i64 %24) nounwind, !dbg !1958
  %26 = bitcast i8* %25 to i8**, !dbg !1958
  %27 = getelementptr inbounds i8* %0, i64 16
  %28 = bitcast i8* %27 to i8***
  store i8** %26, i8*** %28, align 8, !dbg !1958
  %29 = icmp eq i8* %25, null
  br i1 %29, label %bb9.i, label %bb17.i, !dbg !1959

bb9.i:                                            ; preds = %bb8.i
  call void @free(i8* %10) nounwind, !dbg !1960
  %30 = load i8** %5, align 8, !dbg !1961
  call void @free(i8* %30) nounwind, !dbg !1961
  call void @free(i8* %0) nounwind, !dbg !1962
  ret i8* null, !dbg !1946

bb11.i:                                           ; preds = %bb17.i
  %31 = call noalias i8* @strdup(i8* %51) nounwind, !dbg !1963
  %32 = getelementptr inbounds i8** %47, i64 %49, !dbg !1963
  store i8* %31, i8** %32, align 1, !dbg !1963
  %33 = load i8*** %28, align 8, !dbg !1964
  %34 = getelementptr inbounds i8** %33, i64 %49, !dbg !1964
  %35 = load i8** %34, align 1, !dbg !1964
  %36 = icmp eq i8* %35, null, !dbg !1964
  br i1 %36, label %bb14.i, label %bb16.i, !dbg !1964

bb13.i:                                           ; preds = %bb14.i
  call void @free(i8* %41) nounwind, !dbg !1965
  %37 = add nsw i32 %storemerge7.i, 1, !dbg !1966
  %.pre3 = load i8*** %28, align 8
  br label %bb14.i, !dbg !1966

bb14.i:                                           ; preds = %bb13.i, %bb11.i
  %38 = phi i8** [ %.pre3, %bb13.i ], [ %33, %bb11.i ]
  %storemerge7.i = phi i32 [ %37, %bb13.i ], [ 0, %bb11.i ]
  %39 = sext i32 %storemerge7.i to i64, !dbg !1966
  %40 = getelementptr inbounds i8** %38, i64 %39, !dbg !1966
  %41 = load i8** %40, align 1, !dbg !1966
  %42 = icmp eq i8* %41, null, !dbg !1966
  br i1 %42, label %bb15.i, label %bb13.i, !dbg !1966

bb15.i:                                           ; preds = %bb14.i
  %43 = bitcast i8** %38 to i8*, !dbg !1967
  call void @free(i8* %43) nounwind, !dbg !1967
  %44 = load i8** %12, align 8, !dbg !1968
  call void @free(i8* %44) nounwind, !dbg !1968
  %45 = load i8** %5, align 8, !dbg !1969
  call void @free(i8* %45) nounwind, !dbg !1969
  call void @free(i8* %0) nounwind, !dbg !1970
  ret i8* null, !dbg !1946

bb16.i:                                           ; preds = %bb11.i
  %46 = add nsw i32 %storemerge1.i, 1, !dbg !1971
  %.pre = load i8*** %15, align 8
  br label %bb17.i, !dbg !1971

bb17.i:                                           ; preds = %bb16.i, %bb8.i
  %47 = phi i8** [ %33, %bb16.i ], [ %26, %bb8.i ]
  %48 = phi i8** [ %.pre, %bb16.i ], [ %16, %bb8.i ]
  %storemerge1.i = phi i32 [ %46, %bb16.i ], [ 0, %bb8.i ]
  %49 = sext i32 %storemerge1.i to i64, !dbg !1971
  %50 = getelementptr inbounds i8** %48, i64 %49, !dbg !1971
  %51 = load i8** %50, align 1, !dbg !1971
  %52 = icmp eq i8* %51, null, !dbg !1971
  br i1 %52, label %bb18.i, label %bb11.i, !dbg !1971

bb18.i:                                           ; preds = %bb17.i
  %53 = getelementptr inbounds i8** %47, i64 %49, !dbg !1972
  store i8* null, i8** %53, align 1, !dbg !1972
  %54 = getelementptr inbounds i8* %ent, i64 24
  %55 = bitcast i8* %54 to i8***
  %56 = load i8*** %55, align 8, !dbg !1973
  br label %bb20.i, !dbg !1973

bb20.i:                                           ; preds = %bb20.i, %bb18.i
  %storemerge2.i = phi i32 [ 0, %bb18.i ], [ %61, %bb20.i ]
  %57 = sext i32 %storemerge2.i to i64, !dbg !1973
  %58 = getelementptr inbounds i8** %56, i64 %57, !dbg !1973
  %59 = load i8** %58, align 1, !dbg !1973
  %60 = icmp eq i8* %59, null, !dbg !1973
  %61 = add nsw i32 %storemerge2.i, 1, !dbg !1974
  br i1 %60, label %bb21.i, label %bb20.i, !dbg !1973

bb21.i:                                           ; preds = %bb20.i
  %62 = sext i32 %61 to i64, !dbg !1974
  %63 = shl i64 %62, 3
  %64 = call noalias i8* @malloc(i64 %63) nounwind, !dbg !1974
  %65 = bitcast i8* %64 to i8**, !dbg !1974
  %66 = getelementptr inbounds i8* %0, i64 24
  %67 = bitcast i8* %66 to i8***
  store i8** %65, i8*** %67, align 8, !dbg !1974
  %68 = icmp eq i8* %64, null
  br i1 %68, label %bb24.i, label %bb36.i, !dbg !1975

bb23.i:                                           ; preds = %bb24.i
  call void @free(i8* %73) nounwind, !dbg !1976
  %69 = add nsw i32 %storemerge6.i, 1, !dbg !1977
  br label %bb24.i, !dbg !1977

bb24.i:                                           ; preds = %bb23.i, %bb21.i
  %storemerge6.i = phi i32 [ %69, %bb23.i ], [ 0, %bb21.i ]
  %70 = load i8*** %28, align 8, !dbg !1977
  %71 = sext i32 %storemerge6.i to i64, !dbg !1977
  %72 = getelementptr inbounds i8** %70, i64 %71, !dbg !1977
  %73 = load i8** %72, align 1, !dbg !1977
  %74 = icmp eq i8* %73, null, !dbg !1977
  br i1 %74, label %bb25.i, label %bb23.i, !dbg !1977

bb25.i:                                           ; preds = %bb24.i
  %75 = bitcast i8** %70 to i8*, !dbg !1978
  call void @free(i8* %75) nounwind, !dbg !1978
  %76 = load i8** %12, align 8, !dbg !1979
  call void @free(i8* %76) nounwind, !dbg !1979
  %77 = load i8** %5, align 8, !dbg !1980
  call void @free(i8* %77) nounwind, !dbg !1980
  call void @free(i8* %0) nounwind, !dbg !1981
  ret i8* null, !dbg !1946

bb27.i:                                           ; preds = %bb36.i
  %78 = call noalias i8* @strdup(i8* %105) nounwind, !dbg !1982
  %79 = getelementptr inbounds i8** %101, i64 %103, !dbg !1982
  store i8* %78, i8** %79, align 1, !dbg !1982
  %80 = load i8*** %67, align 8, !dbg !1983
  %81 = getelementptr inbounds i8** %80, i64 %103, !dbg !1983
  %82 = load i8** %81, align 1, !dbg !1983
  %83 = icmp eq i8* %82, null, !dbg !1983
  br i1 %83, label %bb30.i, label %bb35.i, !dbg !1983

bb29.i:                                           ; preds = %bb30.i
  call void @free(i8* %88) nounwind, !dbg !1984
  %84 = add nsw i32 %storemerge4.i, 1, !dbg !1985
  %.pre2 = load i8*** %67, align 8
  br label %bb30.i, !dbg !1985

bb30.i:                                           ; preds = %bb29.i, %bb27.i
  %85 = phi i8** [ %.pre2, %bb29.i ], [ %80, %bb27.i ]
  %storemerge4.i = phi i32 [ %84, %bb29.i ], [ 0, %bb27.i ]
  %86 = sext i32 %storemerge4.i to i64, !dbg !1985
  %87 = getelementptr inbounds i8** %85, i64 %86, !dbg !1985
  %88 = load i8** %87, align 1, !dbg !1985
  %89 = icmp eq i8* %88, null, !dbg !1985
  br i1 %89, label %bb31.i, label %bb29.i, !dbg !1985

bb31.i:                                           ; preds = %bb30.i
  %90 = bitcast i8** %85 to i8*, !dbg !1986
  call void @free(i8* %90) nounwind, !dbg !1986
  br label %bb33.i, !dbg !1987

bb32.i:                                           ; preds = %bb33.i
  call void @free(i8* %95) nounwind, !dbg !1988
  %91 = add nsw i32 %storemerge5.i, 1, !dbg !1987
  br label %bb33.i, !dbg !1987

bb33.i:                                           ; preds = %bb32.i, %bb31.i
  %storemerge5.i = phi i32 [ 0, %bb31.i ], [ %91, %bb32.i ]
  %92 = load i8*** %28, align 8, !dbg !1987
  %93 = sext i32 %storemerge5.i to i64, !dbg !1987
  %94 = getelementptr inbounds i8** %92, i64 %93, !dbg !1987
  %95 = load i8** %94, align 1, !dbg !1987
  %96 = icmp eq i8* %95, null, !dbg !1987
  br i1 %96, label %bb34.i, label %bb32.i, !dbg !1987

bb34.i:                                           ; preds = %bb33.i
  %97 = bitcast i8** %92 to i8*, !dbg !1989
  call void @free(i8* %97) nounwind, !dbg !1989
  %98 = load i8** %12, align 8, !dbg !1990
  call void @free(i8* %98) nounwind, !dbg !1990
  %99 = load i8** %5, align 8, !dbg !1991
  call void @free(i8* %99) nounwind, !dbg !1991
  call void @free(i8* %0) nounwind, !dbg !1992
  ret i8* null, !dbg !1946

bb35.i:                                           ; preds = %bb27.i
  %100 = add nsw i32 %storemerge3.i, 1, !dbg !1993
  %.pre1 = load i8*** %55, align 8
  br label %bb36.i, !dbg !1993

bb36.i:                                           ; preds = %bb35.i, %bb21.i
  %101 = phi i8** [ %80, %bb35.i ], [ %65, %bb21.i ]
  %102 = phi i8** [ %.pre1, %bb35.i ], [ %56, %bb21.i ]
  %storemerge3.i = phi i32 [ %100, %bb35.i ], [ 0, %bb21.i ]
  %103 = sext i32 %storemerge3.i to i64, !dbg !1993
  %104 = getelementptr inbounds i8** %102, i64 %103, !dbg !1993
  %105 = load i8** %104, align 1, !dbg !1993
  %106 = icmp eq i8* %105, null, !dbg !1993
  br i1 %106, label %bb37.i, label %bb27.i, !dbg !1993

bb37.i:                                           ; preds = %bb36.i
  %107 = getelementptr inbounds i8** %101, i64 %103, !dbg !1994
  store i8* null, i8** %107, align 1, !dbg !1994
  ret i8* %0, !dbg !1946

return:                                           ; preds = %entry
  ret i8* null, !dbg !1946
}

define internal void @gshadow_free(i8* %ent) nounwind {
entry:
  %0 = bitcast i8* %ent to i8**
  %1 = load i8** %0, align 8, !dbg !1995
  call void @free(i8* %1) nounwind, !dbg !1995
  %2 = getelementptr inbounds i8* %ent, i64 8
  %3 = bitcast i8* %2 to i8**
  %4 = load i8** %3, align 8, !dbg !2003
  %5 = icmp eq i8* %4, null, !dbg !2003
  br i1 %5, label %bb3.i.preheader, label %bb.i, !dbg !2003

bb.i:                                             ; preds = %entry
  %6 = call i64 @strlen(i8* %4) nounwind readonly, !dbg !2004
  %7 = call i8* @memset(i8* %4, i32 0, i64 %6) nounwind
  %8 = load i8** %3, align 8, !dbg !2005
  call void @free(i8* %8) nounwind, !dbg !2005
  br label %bb3.i.preheader, !dbg !2005

bb3.i.preheader:                                  ; preds = %bb.i, %entry
  %9 = getelementptr inbounds i8* %ent, i64 16
  %10 = bitcast i8* %9 to i8***
  br label %bb3.i

bb2.i:                                            ; preds = %bb3.i
  call void @free(i8* %14) nounwind, !dbg !2006
  %11 = add i64 %storemerge.i, 1, !dbg !2007
  br label %bb3.i, !dbg !2007

bb3.i:                                            ; preds = %bb2.i, %bb3.i.preheader
  %storemerge.i = phi i64 [ %11, %bb2.i ], [ 0, %bb3.i.preheader ]
  %12 = load i8*** %10, align 8, !dbg !2007
  %13 = getelementptr inbounds i8** %12, i64 %storemerge.i, !dbg !2007
  %14 = load i8** %13, align 1, !dbg !2007
  %15 = icmp eq i8* %14, null, !dbg !2007
  br i1 %15, label %bb4.i, label %bb2.i, !dbg !2007

bb4.i:                                            ; preds = %bb3.i
  %16 = bitcast i8** %12 to i8*, !dbg !2008
  call void @free(i8* %16) nounwind, !dbg !2008
  %17 = getelementptr inbounds i8* %ent, i64 24
  %18 = bitcast i8* %17 to i8***
  br label %bb6.i, !dbg !2009

bb5.i:                                            ; preds = %bb6.i
  call void @free(i8* %22) nounwind, !dbg !2010
  %19 = add i64 %storemerge1.i, 1, !dbg !2009
  br label %bb6.i, !dbg !2009

bb6.i:                                            ; preds = %bb5.i, %bb4.i
  %storemerge1.i = phi i64 [ 0, %bb4.i ], [ %19, %bb5.i ]
  %20 = load i8*** %18, align 8, !dbg !2009
  %21 = getelementptr inbounds i8** %20, i64 %storemerge1.i, !dbg !2009
  %22 = load i8** %21, align 1, !dbg !2009
  %23 = icmp eq i8* %22, null, !dbg !2009
  br i1 %23, label %return, label %bb5.i, !dbg !2009

return:                                           ; preds = %bb6.i
  %24 = bitcast i8** %20 to i8*, !dbg !2011
  call void @free(i8* %24) nounwind, !dbg !2011
  call void @free(i8* %ent) nounwind, !dbg !2012
  ret void, !dbg !2013
}

define internal i8* @gshadow_getname(i8* nocapture %ent) nounwind readonly {
return:
  %0 = bitcast i8* %ent to i8**
  %1 = load i8** %0, align 8, !dbg !2014
  ret i8* %1, !dbg !2014
}

define internal i8* @gshadow_parse(i8* %line) nounwind {
entry:
  %fields.i = alloca [4 x i8*], align 8
  %0 = call i64 @strlen(i8* %line) nounwind readonly, !dbg !2017
  %1 = add i64 %0, 1, !dbg !2017
  %2 = load i64* @sgrbuflen.5209, align 8, !dbg !2022
  %3 = icmp ugt i64 %1, %2, !dbg !2022
  %4 = load i8** @sgrbuf.5208, align 8, !dbg !2023
  br i1 %3, label %bb.i, label %bb3.i, !dbg !2022

bb.i:                                             ; preds = %entry
  %5 = call i8* @realloc(i8* %4, i64 %1) nounwind, !dbg !2023
  %6 = icmp eq i8* %5, null, !dbg !2025
  br i1 %6, label %return, label %bb2.i, !dbg !2025

bb2.i:                                            ; preds = %bb.i
  store i8* %5, i8** @sgrbuf.5208, align 8, !dbg !2026
  store i64 %1, i64* @sgrbuflen.5209, align 8, !dbg !2027
  br label %bb3.i, !dbg !2027

bb3.i:                                            ; preds = %bb2.i, %entry
  %7 = phi i8* [ %5, %bb2.i ], [ %4, %entry ]
  %8 = call i8* @strncpy(i8* noalias %7, i8* noalias %line, i64 %1) nounwind, !dbg !2028
  %9 = load i8** @sgrbuf.5208, align 8, !dbg !2029
  %10 = getelementptr inbounds i8* %9, i64 %0, !dbg !2029
  store i8 0, i8* %10, align 1, !dbg !2029
  %11 = call i8* @strrchr(i8* %9, i32 10) nounwind readonly, !dbg !2030
  %12 = icmp eq i8* %11, null, !dbg !2031
  br i1 %12, label %bb9.i, label %bb4.i, !dbg !2031

bb4.i:                                            ; preds = %bb3.i
  store i8 0, i8* %11, align 1, !dbg !2032
  br label %bb9.i, !dbg !2032

bb6.i:                                            ; preds = %bb10.i
  %13 = sext i32 %storemerge.i to i64, !dbg !2033
  %14 = getelementptr inbounds [4 x i8*]* %fields.i, i64 0, i64 %13, !dbg !2033
  store i8* %cp.i.0, i8** %14, align 8, !dbg !2033
  %15 = call i8* @strchr(i8* %cp.i.0, i32 58) nounwind readonly, !dbg !2034
  %16 = icmp eq i8* %15, null, !dbg !2035
  br i1 %16, label %bb8.i, label %bb7.i, !dbg !2035

bb7.i:                                            ; preds = %bb6.i
  store i8 0, i8* %15, align 1, !dbg !2036
  %17 = getelementptr inbounds i8* %15, i64 1, !dbg !2036
  br label %bb8.i, !dbg !2036

bb8.i:                                            ; preds = %bb7.i, %bb6.i
  %cp.i.1 = phi i8* [ %15, %bb6.i ], [ %17, %bb7.i ]
  %18 = add nsw i32 %storemerge.i, 1, !dbg !2037
  br label %bb9.i, !dbg !2037

bb9.i:                                            ; preds = %bb8.i, %bb4.i, %bb3.i
  %cp.i.0 = phi i8* [ %cp.i.1, %bb8.i ], [ %9, %bb3.i ], [ %9, %bb4.i ]
  %storemerge.i = phi i32 [ %18, %bb8.i ], [ 0, %bb3.i ], [ 0, %bb4.i ]
  %19 = icmp sgt i32 %storemerge.i, 3, !dbg !2037
  %.pre1 = icmp eq i8* %cp.i.0, null, !dbg !2038
  br i1 %19, label %bb11.i, label %bb10.i, !dbg !2037

bb10.i:                                           ; preds = %bb9.i
  br i1 %.pre1, label %bb12.i, label %bb6.i, !dbg !2037

bb11.i:                                           ; preds = %bb9.i
  %20 = icmp eq i32 %storemerge.i, 4, !dbg !2038
  %or.cond = and i1 %.pre1, %20
  br i1 %or.cond, label %bb14.i, label %return, !dbg !2038

bb12.i:                                           ; preds = %bb10.i
  %.old = icmp eq i32 %storemerge.i, 4, !dbg !2038
  br i1 %.old, label %bb14.i, label %return, !dbg !2038

bb14.i:                                           ; preds = %bb12.i, %bb11.i
  %21 = getelementptr inbounds [4 x i8*]* %fields.i, i64 0, i64 0, !dbg !2039
  %22 = load i8** %21, align 8, !dbg !2039
  store i8* %22, i8** getelementptr inbounds (%struct.sgrp* @sgroup, i64 0, i32 0), align 32, !dbg !2039
  %23 = getelementptr inbounds [4 x i8*]* %fields.i, i64 0, i64 1, !dbg !2040
  %24 = load i8** %23, align 8, !dbg !2040
  store i8* %24, i8** getelementptr inbounds (%struct.sgrp* @sgroup, i64 0, i32 1), align 8, !dbg !2040
  %25 = load i64* @nadmins, align 8, !dbg !2041
  %26 = icmp eq i64 %25, 0, !dbg !2041
  br i1 %26, label %bb16.i, label %bb15.i, !dbg !2041

bb15.i:                                           ; preds = %bb14.i
  store i64 0, i64* @nadmins, align 8, !dbg !2042
  %27 = load i8*** @admins311, align 8, !dbg !2043
  %28 = bitcast i8** %27 to i8*, !dbg !2043
  call void @free(i8* %28) nounwind, !dbg !2043
  store i8** null, i8*** @admins311, align 8, !dbg !2044
  br label %bb16.i, !dbg !2044

bb16.i:                                           ; preds = %bb15.i, %bb14.i
  %29 = load i64* @nmembers, align 8, !dbg !2045
  %30 = icmp eq i64 %29, 0, !dbg !2045
  br i1 %30, label %bb18.i, label %bb17.i, !dbg !2045

bb17.i:                                           ; preds = %bb16.i
  store i64 0, i64* @nmembers, align 8, !dbg !2046
  %31 = load i8*** @members310, align 8, !dbg !2047
  %32 = bitcast i8** %31 to i8*, !dbg !2047
  call void @free(i8* %32) nounwind, !dbg !2047
  store i8** null, i8*** @members310, align 8, !dbg !2048
  br label %bb18.i, !dbg !2048

bb18.i:                                           ; preds = %bb17.i, %bb16.i
  %33 = getelementptr inbounds [4 x i8*]* %fields.i, i64 0, i64 2, !dbg !2049
  %34 = load i8** %33, align 8, !dbg !2049
  %35 = call fastcc i8** @build_list(i8* %34, i8*** @admins311, i64* @nadmins) nounwind, !dbg !2049
  store i8** %35, i8*** getelementptr inbounds (%struct.sgrp* @sgroup, i64 0, i32 2), align 16, !dbg !2049
  %36 = getelementptr inbounds [4 x i8*]* %fields.i, i64 0, i64 3, !dbg !2050
  %37 = load i8** %36, align 8, !dbg !2050
  %38 = call fastcc i8** @build_list(i8* %37, i8*** @members310, i64* @nmembers) nounwind, !dbg !2050
  store i8** %38, i8*** getelementptr inbounds (%struct.sgrp* @sgroup, i64 0, i32 3), align 8, !dbg !2050
  ret i8* bitcast (%struct.sgrp* @sgroup to i8*), !dbg !2019

return:                                           ; preds = %bb12.i, %bb11.i, %bb.i
  ret i8* null, !dbg !2019
}

define internal i32 @gshadow_put(i8* %ent, %struct.FILE* %file) nounwind {
entry:
  %0 = icmp eq i8* %ent, null, !dbg !2051
  br i1 %0, label %return, label %bb, !dbg !2051

bb:                                               ; preds = %entry
  %1 = bitcast i8* %ent to i8**
  %2 = load i8** %1, align 8, !dbg !2051
  %3 = icmp eq i8* %2, null, !dbg !2054
  br i1 %3, label %return, label %bb5.i4, !dbg !2054

bb2.i1:                                           ; preds = %bb5.i4
  %4 = sext i8 %8 to i32, !dbg !2055
  %5 = call i8* @strchr(i8* getelementptr inbounds ([3 x i8]* @.str231, i64 0, i64 0), i32 %4) nounwind readonly, !dbg !2055
  %6 = icmp eq i8* %5, null, !dbg !2055
  br i1 %6, label %bb4.i2, label %return, !dbg !2055

bb4.i2:                                           ; preds = %bb2.i1
  %7 = getelementptr inbounds i8* %storemerge.i3, i64 1, !dbg !2056
  br label %bb5.i4, !dbg !2056

bb5.i4:                                           ; preds = %bb4.i2, %bb
  %storemerge.i3 = phi i8* [ %7, %bb4.i2 ], [ %2, %bb ]
  %8 = load i8* %storemerge.i3, align 1, !dbg !2056
  %9 = icmp eq i8 %8, 0, !dbg !2056
  br i1 %9, label %bb11.i, label %bb2.i1, !dbg !2056

bb8.i5:                                           ; preds = %bb11.i
  %10 = call i16** @__ctype_b_loc() nounwind readnone, !dbg !2057
  %11 = load i16** %10, align 8, !dbg !2057
  %12 = sext i8 %19 to i64
  %13 = getelementptr inbounds i16* %11, i64 %12, !dbg !2057
  %14 = load i16* %13, align 1, !dbg !2057
  %15 = zext i16 %14 to i32, !dbg !2057
  %16 = and i32 %15, 16384, !dbg !2057
  %17 = icmp eq i32 %16, 0, !dbg !2057
  br i1 %17, label %bb1, label %bb10.i6, !dbg !2057

bb10.i6:                                          ; preds = %bb8.i5
  %18 = getelementptr inbounds i8* %storemerge2.i7, i64 1, !dbg !2058
  br label %bb11.i, !dbg !2058

bb11.i:                                           ; preds = %bb10.i6, %bb5.i4
  %storemerge2.i7 = phi i8* [ %18, %bb10.i6 ], [ %2, %bb5.i4 ]
  %19 = load i8* %storemerge2.i7, align 1, !dbg !2058
  %20 = icmp eq i8 %19, 0, !dbg !2058
  br i1 %20, label %bb1, label %bb8.i5, !dbg !2058

bb1:                                              ; preds = %bb11.i, %bb8.i5
  %21 = getelementptr inbounds i8* %ent, i64 8
  %22 = bitcast i8* %21 to i8**
  %23 = load i8** %22, align 8, !dbg !2051
  %24 = icmp eq i8* %23, null, !dbg !2054
  br i1 %24, label %return, label %bb5.i32, !dbg !2054

bb2.i29:                                          ; preds = %bb5.i32
  %25 = sext i8 %29 to i32, !dbg !2055
  %26 = call i8* @strchr(i8* getelementptr inbounds ([3 x i8]* @.str231, i64 0, i64 0), i32 %25) nounwind readonly, !dbg !2055
  %27 = icmp eq i8* %26, null, !dbg !2055
  br i1 %27, label %bb4.i30, label %return, !dbg !2055

bb4.i30:                                          ; preds = %bb2.i29
  %28 = getelementptr inbounds i8* %storemerge.i31, i64 1, !dbg !2056
  br label %bb5.i32, !dbg !2056

bb5.i32:                                          ; preds = %bb4.i30, %bb1
  %storemerge.i31 = phi i8* [ %28, %bb4.i30 ], [ %23, %bb1 ]
  %29 = load i8* %storemerge.i31, align 1, !dbg !2056
  %30 = icmp eq i8 %29, 0, !dbg !2056
  br i1 %30, label %bb11.i36, label %bb2.i29, !dbg !2056

bb8.i33:                                          ; preds = %bb11.i36
  %31 = call i16** @__ctype_b_loc() nounwind readnone, !dbg !2057
  %32 = load i16** %31, align 8, !dbg !2057
  %33 = sext i8 %40 to i64
  %34 = getelementptr inbounds i16* %32, i64 %33, !dbg !2057
  %35 = load i16* %34, align 1, !dbg !2057
  %36 = zext i16 %35 to i32, !dbg !2057
  %37 = and i32 %36, 16384, !dbg !2057
  %38 = icmp eq i32 %37, 0, !dbg !2057
  br i1 %38, label %bb3, label %bb10.i34, !dbg !2057

bb10.i34:                                         ; preds = %bb8.i33
  %39 = getelementptr inbounds i8* %storemerge2.i35, i64 1, !dbg !2058
  br label %bb11.i36, !dbg !2058

bb11.i36:                                         ; preds = %bb10.i34, %bb5.i32
  %storemerge2.i35 = phi i8* [ %39, %bb10.i34 ], [ %23, %bb5.i32 ]
  %40 = load i8* %storemerge2.i35, align 1, !dbg !2058
  %41 = icmp eq i8 %40, 0, !dbg !2058
  br i1 %41, label %bb3, label %bb8.i33, !dbg !2058

bb3:                                              ; preds = %bb11.i36, %bb8.i33
  %42 = getelementptr inbounds i8* %ent, i64 16
  %43 = bitcast i8* %42 to i8***
  %44 = load i8*** %43, align 8, !dbg !2059
  %45 = icmp eq i8** %44, null, !dbg !2059
  br i1 %45, label %bb9, label %bb8, !dbg !2059

bb2.i19:                                          ; preds = %bb5.i22
  %46 = sext i8 %50 to i32, !dbg !2060
  %47 = call i8* @strchr(i8* getelementptr inbounds ([4 x i8]* @.str1232, i64 0, i64 0), i32 %46) nounwind readonly, !dbg !2060
  %48 = icmp eq i8* %47, null, !dbg !2060
  br i1 %48, label %bb4.i20, label %return, !dbg !2060

bb4.i20:                                          ; preds = %bb2.i19
  %49 = getelementptr inbounds i8* %storemerge.i21, i64 1, !dbg !2063
  br label %bb5.i22, !dbg !2063

bb5.i22:                                          ; preds = %bb8, %bb4.i20
  %storemerge.i21 = phi i8* [ %49, %bb4.i20 ], [ %65, %bb8 ]
  %50 = load i8* %storemerge.i21, align 1, !dbg !2063
  %51 = icmp eq i8 %50, 0, !dbg !2063
  br i1 %51, label %bb11.i26, label %bb2.i19, !dbg !2063

bb8.i23:                                          ; preds = %bb11.i26
  %52 = call i16** @__ctype_b_loc() nounwind readnone, !dbg !2064
  %53 = load i16** %52, align 8, !dbg !2064
  %54 = sext i8 %61 to i64
  %55 = getelementptr inbounds i16* %53, i64 %54, !dbg !2064
  %56 = load i16* %55, align 1, !dbg !2064
  %57 = zext i16 %56 to i32, !dbg !2064
  %58 = and i32 %57, 16384, !dbg !2064
  %59 = icmp eq i32 %58, 0, !dbg !2064
  br i1 %59, label %bb7, label %bb10.i24, !dbg !2064

bb10.i24:                                         ; preds = %bb8.i23
  %60 = getelementptr inbounds i8* %storemerge2.i25, i64 1, !dbg !2065
  br label %bb11.i26, !dbg !2065

bb11.i26:                                         ; preds = %bb10.i24, %bb5.i22
  %storemerge2.i25 = phi i8* [ %60, %bb10.i24 ], [ %65, %bb5.i22 ]
  %61 = load i8* %storemerge2.i25, align 1, !dbg !2065
  %62 = icmp eq i8 %61, 0, !dbg !2065
  br i1 %62, label %bb7, label %bb8.i23, !dbg !2065

bb7:                                              ; preds = %bb11.i26, %bb8.i23
  %63 = add i64 %storemerge2, 1, !dbg !2066
  br label %bb8, !dbg !2066

bb8:                                              ; preds = %bb7, %bb3
  %storemerge2 = phi i64 [ %63, %bb7 ], [ 0, %bb3 ]
  %64 = getelementptr inbounds i8** %44, i64 %storemerge2, !dbg !2066
  %65 = load i8** %64, align 1, !dbg !2066
  %66 = icmp eq i8* %65, null, !dbg !2066
  br i1 %66, label %bb9, label %bb5.i22, !dbg !2066

bb9:                                              ; preds = %bb8, %bb3
  %67 = getelementptr inbounds i8* %ent, i64 24
  %68 = bitcast i8* %67 to i8***
  %69 = load i8*** %68, align 8, !dbg !2067
  %70 = icmp eq i8** %69, null, !dbg !2067
  br i1 %70, label %bb16, label %bb15, !dbg !2067

bb2.i9:                                           ; preds = %bb5.i12
  %71 = sext i8 %75 to i32, !dbg !2068
  %72 = call i8* @strchr(i8* getelementptr inbounds ([4 x i8]* @.str1232, i64 0, i64 0), i32 %71) nounwind readonly, !dbg !2068
  %73 = icmp eq i8* %72, null, !dbg !2068
  br i1 %73, label %bb4.i10, label %return, !dbg !2068

bb4.i10:                                          ; preds = %bb2.i9
  %74 = getelementptr inbounds i8* %storemerge.i11, i64 1, !dbg !2071
  br label %bb5.i12, !dbg !2071

bb5.i12:                                          ; preds = %bb15, %bb4.i10
  %storemerge.i11 = phi i8* [ %74, %bb4.i10 ], [ %90, %bb15 ]
  %75 = load i8* %storemerge.i11, align 1, !dbg !2071
  %76 = icmp eq i8 %75, 0, !dbg !2071
  br i1 %76, label %bb11.i16, label %bb2.i9, !dbg !2071

bb8.i13:                                          ; preds = %bb11.i16
  %77 = call i16** @__ctype_b_loc() nounwind readnone, !dbg !2072
  %78 = load i16** %77, align 8, !dbg !2072
  %79 = sext i8 %86 to i64
  %80 = getelementptr inbounds i16* %78, i64 %79, !dbg !2072
  %81 = load i16* %80, align 1, !dbg !2072
  %82 = zext i16 %81 to i32, !dbg !2072
  %83 = and i32 %82, 16384, !dbg !2072
  %84 = icmp eq i32 %83, 0, !dbg !2072
  br i1 %84, label %bb14, label %bb10.i14, !dbg !2072

bb10.i14:                                         ; preds = %bb8.i13
  %85 = getelementptr inbounds i8* %storemerge2.i15, i64 1, !dbg !2073
  br label %bb11.i16, !dbg !2073

bb11.i16:                                         ; preds = %bb10.i14, %bb5.i12
  %storemerge2.i15 = phi i8* [ %85, %bb10.i14 ], [ %90, %bb5.i12 ]
  %86 = load i8* %storemerge2.i15, align 1, !dbg !2073
  %87 = icmp eq i8 %86, 0, !dbg !2073
  br i1 %87, label %bb14, label %bb8.i13, !dbg !2073

bb14:                                             ; preds = %bb11.i16, %bb8.i13
  %88 = add i64 %storemerge1, 1, !dbg !2074
  br label %bb15, !dbg !2074

bb15:                                             ; preds = %bb14, %bb9
  %storemerge1 = phi i64 [ %88, %bb14 ], [ 0, %bb9 ]
  %89 = getelementptr inbounds i8** %69, i64 %storemerge1, !dbg !2074
  %90 = load i8** %89, align 1, !dbg !2074
  %91 = icmp eq i8* %90, null, !dbg !2074
  br i1 %91, label %bb16, label %bb5.i12, !dbg !2074

bb16:                                             ; preds = %bb15, %bb9
  %92 = icmp eq %struct.FILE* %file, null, !dbg !2075
  br i1 %92, label %return, label %bb2.i, !dbg !2075

bb2.i:                                            ; preds = %bb16
  %93 = call i64 @strlen(i8* %2) nounwind readonly, !dbg !2083
  %94 = call i64 @strlen(i8* %23) nounwind readonly, !dbg !2083
  %95 = add i64 %93, %94, !dbg !2083
  %96 = add i64 %95, 10, !dbg !2083
  br label %bb4.i, !dbg !2084

bb3.i:                                            ; preds = %bb5.i
  %97 = call i64 @strlen(i8* %103) nounwind readonly, !dbg !2085
  %98 = add i64 %97, %size.i.0, !dbg !2085
  %99 = add i64 %98, 1, !dbg !2085
  %100 = add nsw i32 %storemerge.i, 1, !dbg !2084
  br label %bb4.i, !dbg !2084

bb4.i:                                            ; preds = %bb3.i, %bb2.i
  %size.i.0 = phi i64 [ %96, %bb2.i ], [ %99, %bb3.i ]
  %storemerge.i = phi i32 [ 0, %bb2.i ], [ %100, %bb3.i ]
  br i1 %45, label %bb8.i, label %bb5.i, !dbg !2084

bb5.i:                                            ; preds = %bb4.i
  %101 = sext i32 %storemerge.i to i64, !dbg !2084
  %102 = getelementptr inbounds i8** %44, i64 %101, !dbg !2084
  %103 = load i8** %102, align 1, !dbg !2084
  %104 = icmp eq i8* %103, null, !dbg !2084
  br i1 %104, label %bb8.i, label %bb3.i, !dbg !2084

bb7.i:                                            ; preds = %bb9.i
  %105 = call i64 @strlen(i8* %111) nounwind readonly, !dbg !2086
  %106 = add i64 %105, %size.i.1, !dbg !2086
  %107 = add i64 %106, 1, !dbg !2086
  %108 = add nsw i32 %storemerge1.i, 1, !dbg !2087
  br label %bb8.i, !dbg !2087

bb8.i:                                            ; preds = %bb7.i, %bb5.i, %bb4.i
  %size.i.1 = phi i64 [ %107, %bb7.i ], [ %size.i.0, %bb4.i ], [ %size.i.0, %bb5.i ]
  %storemerge1.i = phi i32 [ %108, %bb7.i ], [ 0, %bb4.i ], [ 0, %bb5.i ]
  br i1 %70, label %bb10.i, label %bb9.i, !dbg !2087

bb9.i:                                            ; preds = %bb8.i
  %109 = sext i32 %storemerge1.i to i64, !dbg !2087
  %110 = getelementptr inbounds i8** %69, i64 %109, !dbg !2087
  %111 = load i8** %110, align 1, !dbg !2087
  %112 = icmp eq i8* %111, null, !dbg !2087
  br i1 %112, label %bb10.i, label %bb7.i, !dbg !2087

bb10.i:                                           ; preds = %bb9.i, %bb8.i
  %113 = call noalias i8* @malloc(i64 %size.i.1) nounwind, !dbg !2088
  %114 = icmp eq i8* %113, null, !dbg !2089
  br i1 %114, label %return, label %bb12.i, !dbg !2089

bb12.i:                                           ; preds = %bb10.i
  %115 = call i8* @strcpy(i8* noalias %113, i8* noalias %2) nounwind, !dbg !2090
  %116 = call i64 @strlen(i8* %113) nounwind readonly, !dbg !2091
  %117 = getelementptr inbounds i8* %113, i64 %116, !dbg !2091
  store i8 58, i8* %117, align 1, !dbg !2092
  %.sum = add i64 %116, 1
  %118 = getelementptr inbounds i8* %113, i64 %.sum, !dbg !2092
  %119 = load i8** %22, align 8, !dbg !2093
  %120 = call i8* @strcpy(i8* noalias %118, i8* noalias %119) nounwind, !dbg !2093
  %121 = call i64 @strlen(i8* %118) nounwind readonly, !dbg !2094
  %.sum7 = add i64 %.sum, %121
  %122 = getelementptr inbounds i8* %113, i64 %.sum7, !dbg !2094
  store i8 58, i8* %122, align 1, !dbg !2095
  %.sum8 = add i64 %.sum7, 1
  %123 = getelementptr inbounds i8* %113, i64 %.sum8, !dbg !2095
  br label %bb16.i, !dbg !2096

bb13.i:                                           ; preds = %bb16.i
  %124 = icmp sgt i32 %storemerge2.i, 0, !dbg !2097
  br i1 %124, label %bb14.i, label %bb15.i, !dbg !2097

bb14.i:                                           ; preds = %bb13.i
  store i8 44, i8* %cp.i.1, align 1, !dbg !2098
  %125 = getelementptr inbounds i8* %cp.i.1, i64 1, !dbg !2098
  %.pre4 = load i8*** %43, align 8
  %.phi.trans.insert5 = getelementptr inbounds i8** %.pre4, i64 %132
  %.pre6 = load i8** %.phi.trans.insert5, align 1
  br label %bb15.i, !dbg !2098

bb15.i:                                           ; preds = %bb14.i, %bb13.i
  %126 = phi i8* [ %.pre6, %bb14.i ], [ %134, %bb13.i ]
  %cp.i.0 = phi i8* [ %125, %bb14.i ], [ %cp.i.1, %bb13.i ]
  %127 = call i8* @strcpy(i8* noalias %cp.i.0, i8* noalias %126) nounwind, !dbg !2099
  %128 = call i64 @strlen(i8* %cp.i.0) nounwind readonly, !dbg !2100
  %129 = getelementptr inbounds i8* %cp.i.0, i64 %128, !dbg !2100
  %130 = add nsw i32 %storemerge2.i, 1, !dbg !2096
  br label %bb16.i, !dbg !2096

bb16.i:                                           ; preds = %bb15.i, %bb12.i
  %cp.i.1 = phi i8* [ %123, %bb12.i ], [ %129, %bb15.i ]
  %storemerge2.i = phi i32 [ 0, %bb12.i ], [ %130, %bb15.i ]
  %131 = load i8*** %43, align 8, !dbg !2096
  %132 = sext i32 %storemerge2.i to i64, !dbg !2096
  %133 = getelementptr inbounds i8** %131, i64 %132, !dbg !2096
  %134 = load i8** %133, align 1, !dbg !2096
  %135 = icmp eq i8* %134, null, !dbg !2096
  br i1 %135, label %bb17.i, label %bb13.i, !dbg !2096

bb17.i:                                           ; preds = %bb16.i
  store i8 58, i8* %cp.i.1, align 1, !dbg !2101
  %136 = getelementptr inbounds i8* %cp.i.1, i64 1, !dbg !2102
  br label %bb21.i, !dbg !2103

bb18.i:                                           ; preds = %bb21.i
  %137 = icmp sgt i32 %storemerge3.i, 0, !dbg !2104
  br i1 %137, label %bb19.i, label %bb20.i, !dbg !2104

bb19.i:                                           ; preds = %bb18.i
  store i8 44, i8* %cp.i.3, align 1, !dbg !2105
  %138 = getelementptr inbounds i8* %cp.i.3, i64 1, !dbg !2106
  %.pre = load i8*** %68, align 8
  %.phi.trans.insert = getelementptr inbounds i8** %.pre, i64 %145
  %.pre3 = load i8** %.phi.trans.insert, align 1
  br label %bb20.i, !dbg !2106

bb20.i:                                           ; preds = %bb19.i, %bb18.i
  %139 = phi i8* [ %.pre3, %bb19.i ], [ %147, %bb18.i ]
  %cp.i.2 = phi i8* [ %138, %bb19.i ], [ %cp.i.3, %bb18.i ]
  %140 = call i8* @strcpy(i8* noalias %cp.i.2, i8* noalias %139) nounwind, !dbg !2107
  %141 = call i64 @strlen(i8* %cp.i.2) nounwind readonly, !dbg !2108
  %142 = getelementptr inbounds i8* %cp.i.2, i64 %141, !dbg !2108
  %143 = add nsw i32 %storemerge3.i, 1, !dbg !2103
  br label %bb21.i, !dbg !2103

bb21.i:                                           ; preds = %bb20.i, %bb17.i
  %cp.i.3 = phi i8* [ %136, %bb17.i ], [ %142, %bb20.i ]
  %storemerge3.i = phi i32 [ 0, %bb17.i ], [ %143, %bb20.i ]
  %144 = load i8*** %68, align 8, !dbg !2103
  %145 = sext i32 %storemerge3.i to i64, !dbg !2103
  %146 = getelementptr inbounds i8** %144, i64 %145, !dbg !2103
  %147 = load i8** %146, align 1, !dbg !2103
  %148 = icmp eq i8* %147, null, !dbg !2103
  br i1 %148, label %bb22.i, label %bb18.i, !dbg !2103

bb22.i:                                           ; preds = %bb21.i
  store i8 10, i8* %cp.i.3, align 1, !dbg !2109
  %149 = getelementptr inbounds i8* %cp.i.3, i64 1, !dbg !2110
  store i8 0, i8* %149, align 1, !dbg !2111
  br label %bb3.i.i, !dbg !2112

bb.i.i:                                           ; preds = %bb3.i.i
  %150 = sext i8 %154 to i32, !dbg !2174
  %151 = call i32 @_IO_putc(i32 %150, %struct.FILE* %file) nounwind, !dbg !2174
  %152 = icmp eq i32 %151, -1, !dbg !2174
  br i1 %152, label %bb23.i, label %bb2.i.i, !dbg !2174

bb2.i.i:                                          ; preds = %bb.i.i
  %153 = getelementptr inbounds i8* %s_addr.i.i.0, i64 1, !dbg !2112
  br label %bb3.i.i, !dbg !2112

bb3.i.i:                                          ; preds = %bb2.i.i, %bb22.i
  %s_addr.i.i.0 = phi i8* [ %113, %bb22.i ], [ %153, %bb2.i.i ]
  %154 = load i8* %s_addr.i.i.0, align 1, !dbg !2112
  %155 = icmp eq i8 %154, 0, !dbg !2112
  br i1 %155, label %bb18, label %bb.i.i, !dbg !2112

bb23.i:                                           ; preds = %bb.i.i
  call void @free(i8* %113) nounwind, !dbg !2175
  ret i32 -1, !dbg !2082

bb18:                                             ; preds = %bb3.i.i
  call void @free(i8* %113) nounwind, !dbg !2176
  ret i32 0, !dbg !2082

return:                                           ; preds = %bb10.i, %bb16, %bb2.i9, %bb2.i19, %bb2.i29, %bb1, %bb2.i1, %bb, %entry
  ret i32 -1, !dbg !2082
}

declare i32 @lstat(i8* noalias, %struct.stat* noalias) nounwind

declare i8* @realpath(i8* noalias, i8* noalias) nounwind

declare i32 @rename(i8*, i8*) nounwind

declare i32 @stat(i8* noalias, %struct.stat* noalias) nounwind

declare i32 @open(i8*, i32, ...)

declare i64 @write(i32, i8*, i64)

declare i32 @close(i32)

declare i32 @unlink(i8*) nounwind

declare i32 @link(i8*, i8*) nounwind

declare i64 @read(i32, i8*, i64)

declare i32 @kill(i32, i32) nounwind

declare i32 @fileno(%struct.FILE*) nounwind

declare i32 @fchown(i32, i32, i32) nounwind

declare i32 @fchmod(i32, i32) nounwind

declare i32 @fstat(i32, %struct.stat*) nounwind

declare i32 @fseek(%struct.FILE*, i64, i32)

declare i32 @_IO_putc(i32, %struct.FILE*)

declare i32 @_IO_getc(%struct.FILE*)

declare i32 @fsync(i32)

declare i32 @utime(i8*, %struct.rlimit*) nounwind

define internal fastcc i32 @commonio_lock(%struct.commonio_db* %db) nounwind {
entry:
  %endptr.i.i.i = alloca i8*, align 8
  %sb.i2.i.i = alloca %struct.stat, align 8
  %sb.i.i.i = alloca %struct.stat, align 8
  %buf.i.i = alloca [32 x i8], align 1
  %file.i = alloca [1024 x i8], align 1
  %lock.i = alloca [1024 x i8], align 1
  %0 = load i32* @lock_count, align 4, !dbg !2177
  %1 = icmp eq i32 %0, 0, !dbg !2177
  br i1 %1, label %bb, label %bb4, !dbg !2177

bb:                                               ; preds = %entry
  %2 = call i32 @lckpwdf() nounwind, !dbg !2182
  %3 = icmp eq i32 %2, -1, !dbg !2182
  br i1 %3, label %bb1, label %bb4, !dbg !2182

bb1:                                              ; preds = %bb
  %4 = call i32 @geteuid() nounwind, !dbg !2183
  %5 = icmp eq i32 %4, 0, !dbg !2183
  br i1 %5, label %return, label %bb2, !dbg !2183

bb2:                                              ; preds = %bb1
  %6 = load i8** @Prog, align 8, !dbg !2184
  %7 = load %struct.FILE** @stderr, align 8, !dbg !2184
  %8 = call i32 (%struct.FILE*, i8*, ...)* @fprintf(%struct.FILE* noalias %7, i8* noalias getelementptr inbounds ([24 x i8]* @.str11, i64 0, i64 0), i8* %6) nounwind, !dbg !2184
  ret i32 0, !dbg !2185

bb4:                                              ; preds = %bb, %entry
  %9 = getelementptr inbounds %struct.commonio_db* %db, i64 0, i32 6
  %10 = load i8* %9, align 8
  %11 = and i8 %10, 4
  %toBool.i = icmp eq i8 %11, 0
  br i1 %toBool.i, label %bb1.i, label %return

bb1.i:                                            ; preds = %bb4
  %12 = call i32 @getpid() nounwind
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds %struct.commonio_db* %db, i64 0, i32 0, i64 0
  %file2.i = getelementptr inbounds [1024 x i8]* %file.i, i64 0, i64 0
  %15 = call i32 (i8*, i64, i8*, ...)* @snprintf(i8* noalias %file2.i, i64 1024, i8* noalias getelementptr inbounds ([7 x i8]* @.str10280, i64 0, i64 0), i8* %14, i64 %13) nounwind
  %lock3.i = getelementptr inbounds [1024 x i8]* %lock.i, i64 0, i64 0
  %16 = call i32 (i8*, i64, i8*, ...)* @snprintf(i8* noalias %lock3.i, i64 1024, i8* noalias getelementptr inbounds ([8 x i8]* @.str11281, i64 0, i64 0), i8* %14) nounwind
  %17 = call i32 (i8*, i32, ...)* @open(i8* %file2.i, i32 193, i32 384) nounwind
  %18 = icmp eq i32 %17, -1
  br i1 %18, label %bb3.i.i, label %bb4.i.i

bb3.i.i:                                          ; preds = %bb1.i
  %19 = call i32* @__errno_location() nounwind readnone
  %20 = load i32* %19, align 4
  %21 = call i8* @strerror(i32 %20) nounwind
  %22 = load i8** @Prog, align 8
  %23 = load %struct.FILE** @stderr, align 8
  %24 = call i32 (%struct.FILE*, i8*, ...)* @fprintf(%struct.FILE* noalias %23, i8* noalias getelementptr inbounds ([12 x i8]* @.str1271, i64 0, i64 0), i8* %22, i8* %file2.i, i8* %21) nounwind
  br label %bb6

bb4.i.i:                                          ; preds = %bb1.i
  %25 = call i32 @getpid() nounwind
  %26 = sext i32 %25 to i64
  %buf5.i.i = getelementptr inbounds [32 x i8]* %buf.i.i, i64 0, i64 0
  %27 = call i32 (i8*, i64, i8*, ...)* @snprintf(i8* noalias %buf5.i.i, i64 32, i8* noalias getelementptr inbounds ([4 x i8]* @.str2272, i64 0, i64 0), i64 %26) nounwind
  %28 = call i64 @strlen(i8* %buf5.i.i) nounwind readonly
  %29 = add nsw i64 %28, 1
  %30 = call i64 @write(i32 %17, i8* %buf5.i.i, i64 %29) nounwind
  %31 = icmp eq i64 %30, %29
  br i1 %31, label %bb12.i.i, label %bb11.i.i

bb11.i.i:                                         ; preds = %bb4.i.i
  %32 = call i32* @__errno_location() nounwind readnone
  %33 = load i32* %32, align 4
  %34 = call i8* @strerror(i32 %33) nounwind
  %35 = load i8** @Prog, align 8
  %36 = load %struct.FILE** @stderr, align 8
  %37 = call i32 (%struct.FILE*, i8*, ...)* @fprintf(%struct.FILE* noalias %36, i8* noalias getelementptr inbounds ([12 x i8]* @.str1271, i64 0, i64 0), i8* %35, i8* %file2.i, i8* %34) nounwind
  %38 = call i32 @close(i32 %17) nounwind
  %39 = call i32 @unlink(i8* %file2.i) nounwind
  br label %bb6

bb12.i.i:                                         ; preds = %bb4.i.i
  %40 = call i32 @close(i32 %17) nounwind
  %41 = call i32 @link(i8* %file2.i, i8* %lock3.i) nounwind
  %42 = icmp eq i32 %41, 0
  br i1 %42, label %bb13.i.i, label %bb18.i.i

bb13.i.i:                                         ; preds = %bb12.i.i
  %43 = call i32 @stat(i8* noalias %file2.i, %struct.stat* noalias %sb.i.i.i) nounwind
  %44 = icmp eq i32 %43, 0
  br i1 %44, label %bb1.i.i.i, label %bb16.i.i

bb1.i.i.i:                                        ; preds = %bb13.i.i
  %45 = getelementptr inbounds %struct.stat* %sb.i.i.i, i64 0, i32 2
  %46 = load i64* %45, align 8
  %47 = icmp eq i64 %46, 2
  br i1 %47, label %bb17.i.i, label %bb16.i.i

bb16.i.i:                                         ; preds = %bb1.i.i.i, %bb13.i.i
  %48 = load i8** @Prog, align 8
  %49 = load %struct.FILE** @stderr, align 8
  %50 = call i32 (%struct.FILE*, i8*, ...)* @fprintf(%struct.FILE* noalias %49, i8* noalias getelementptr inbounds ([32 x i8]* @.str3273, i64 0, i64 0), i8* %48, i8* %file2.i) nounwind
  br label %bb17.i.i

bb17.i.i:                                         ; preds = %bb16.i.i, %bb1.i.i.i
  %retval1.i.i.0 = phi i32 [ 0, %bb16.i.i ], [ 1, %bb1.i.i.i ]
  %51 = call i32 @unlink(i8* %file2.i) nounwind
  br label %do_lock_file.exit.i

bb18.i.i:                                         ; preds = %bb12.i.i
  %52 = call i32 (i8*, i32, ...)* @open(i8* %lock3.i, i32 2) nounwind
  %53 = icmp eq i32 %52, -1
  br i1 %53, label %bb22.i.i, label %bb23.i.i

bb22.i.i:                                         ; preds = %bb18.i.i
  %54 = call i32* @__errno_location() nounwind readnone
  %55 = load i32* %54, align 4
  %56 = call i8* @strerror(i32 %55) nounwind
  %57 = load i8** @Prog, align 8
  %58 = load %struct.FILE** @stderr, align 8
  %59 = call i32 (%struct.FILE*, i8*, ...)* @fprintf(%struct.FILE* noalias %58, i8* noalias getelementptr inbounds ([12 x i8]* @.str1271, i64 0, i64 0), i8* %57, i8* %lock3.i, i8* %56) nounwind
  %60 = call i32 @unlink(i8* %file2.i) nounwind
  store i32 22, i32* %54, align 4
  br label %bb6

bb23.i.i:                                         ; preds = %bb18.i.i
  %61 = call i64 @read(i32 %52, i8* %buf5.i.i, i64 31) nounwind
  %62 = call i32 @close(i32 %52) nounwind
  %63 = icmp slt i64 %61, 1
  br i1 %63, label %bb28.i.i, label %bb29.i.i

bb28.i.i:                                         ; preds = %bb23.i.i
  %64 = load i8** @Prog, align 8
  %65 = load %struct.FILE** @stderr, align 8
  %66 = call i32 (%struct.FILE*, i8*, ...)* @fprintf(%struct.FILE* noalias %65, i8* noalias getelementptr inbounds ([41 x i8]* @.str4274, i64 0, i64 0), i8* %64, i8* %lock3.i) nounwind
  %67 = call i32 @unlink(i8* %file2.i) nounwind
  %68 = call i32* @__errno_location() nounwind readnone
  store i32 22, i32* %68, align 4
  br label %bb6

bb29.i.i:                                         ; preds = %bb23.i.i
  %69 = getelementptr inbounds [32 x i8]* %buf.i.i, i64 0, i64 %61
  store i8 0, i8* %69, align 1
  %70 = call i32* @__errno_location() nounwind readnone
  store i32 0, i32* %70, align 4
  %71 = call i64 @strtoll(i8* noalias %buf5.i.i, i8** noalias %endptr.i.i.i, i32 10) nounwind
  %72 = load i8* %buf5.i.i, align 1
  %73 = icmp eq i8 %72, 0
  br i1 %73, label %bb35.i.i, label %bb.i10.i.i

bb.i10.i.i:                                       ; preds = %bb29.i.i
  %74 = load i8** %endptr.i.i.i, align 8
  %75 = load i8* %74, align 1
  %76 = icmp eq i8 %75, 0
  br i1 %76, label %bb1.i11.i.i, label %bb35.i.i

bb1.i11.i.i:                                      ; preds = %bb.i10.i.i
  %77 = load i32* %70, align 4
  %78 = icmp eq i32 %77, 34
  br i1 %78, label %bb35.i.i, label %bb2.i12.i.i

bb2.i12.i.i:                                      ; preds = %bb1.i11.i.i
  %sext.i.i.i = shl i64 %71, 32
  %79 = ashr i64 %sext.i.i.i, 32
  %80 = icmp eq i64 %79, %71
  br i1 %80, label %bb36.i.i, label %bb35.i.i

bb35.i.i:                                         ; preds = %bb2.i12.i.i, %bb1.i11.i.i, %bb.i10.i.i, %bb29.i.i
  %81 = load i8** @Prog, align 8
  %82 = load %struct.FILE** @stderr, align 8
  %83 = call i32 (%struct.FILE*, i8*, ...)* @fprintf(%struct.FILE* noalias %82, i8* noalias getelementptr inbounds ([52 x i8]* @.str5275, i64 0, i64 0), i8* %81, i8* %lock3.i, i8* %buf5.i.i) nounwind
  %84 = call i32 @unlink(i8* %file2.i) nounwind
  store i32 22, i32* %70, align 4
  br label %bb6

bb36.i.i:                                         ; preds = %bb2.i12.i.i
  %85 = trunc i64 %71 to i32
  %86 = call i32 @kill(i32 %85, i32 0) nounwind
  %87 = icmp eq i32 %86, 0
  br i1 %87, label %bb40.i.i, label %bb41.i.i

bb40.i.i:                                         ; preds = %bb36.i.i
  %88 = sext i32 %85 to i64
  %89 = load i8** @Prog, align 8
  %90 = load %struct.FILE** @stderr, align 8
  %91 = call i32 (%struct.FILE*, i8*, ...)* @fprintf(%struct.FILE* noalias %90, i8* noalias getelementptr inbounds ([37 x i8]* @.str6276, i64 0, i64 0), i8* %89, i8* %lock3.i, i64 %88) nounwind
  %92 = call i32 @unlink(i8* %file2.i) nounwind
  store i32 17, i32* %70, align 4
  br label %bb6

bb41.i.i:                                         ; preds = %bb36.i.i
  %93 = call i32 @unlink(i8* %lock3.i) nounwind
  %94 = icmp eq i32 %93, 0
  br i1 %94, label %bb46.i.i, label %bb45.i.i

bb45.i.i:                                         ; preds = %bb41.i.i
  %95 = load i32* %70, align 4
  %96 = call i8* @strerror(i32 %95) nounwind
  %97 = load i8** @Prog, align 8
  %98 = load %struct.FILE** @stderr, align 8
  %99 = call i32 (%struct.FILE*, i8*, ...)* @fprintf(%struct.FILE* noalias %98, i8* noalias getelementptr inbounds ([28 x i8]* @.str7277, i64 0, i64 0), i8* %97, i8* %lock3.i, i8* %96) nounwind
  %100 = call i32 @unlink(i8* %file2.i) nounwind
  br label %bb6

bb46.i.i:                                         ; preds = %bb41.i.i
  %101 = call i32 @link(i8* %file2.i, i8* %lock3.i) nounwind
  %102 = icmp eq i32 %101, 0
  br i1 %102, label %bb47.i.i, label %bb54.i.i

bb47.i.i:                                         ; preds = %bb46.i.i
  %103 = call i32 @stat(i8* noalias %file2.i, %struct.stat* noalias %sb.i2.i.i) nounwind
  %104 = icmp eq i32 %103, 0
  br i1 %104, label %bb1.i4.i.i, label %bb50.i.i

bb1.i4.i.i:                                       ; preds = %bb47.i.i
  %105 = getelementptr inbounds %struct.stat* %sb.i2.i.i, i64 0, i32 2
  %106 = load i64* %105, align 8
  %107 = icmp eq i64 %106, 2
  br i1 %107, label %bb55.i.i, label %bb50.i.i

bb50.i.i:                                         ; preds = %bb1.i4.i.i, %bb47.i.i
  %108 = load i8** @Prog, align 8
  %109 = load %struct.FILE** @stderr, align 8
  %110 = call i32 (%struct.FILE*, i8*, ...)* @fprintf(%struct.FILE* noalias %109, i8* noalias getelementptr inbounds ([32 x i8]* @.str3273, i64 0, i64 0), i8* %108, i8* %file2.i) nounwind
  br label %bb55.i.i

bb54.i.i:                                         ; preds = %bb46.i.i
  %111 = load i32* %70, align 4
  %112 = call i8* @strerror(i32 %111) nounwind
  %113 = load i8** @Prog, align 8
  %114 = load %struct.FILE** @stderr, align 8
  %115 = call i32 (%struct.FILE*, i8*, ...)* @fprintf(%struct.FILE* noalias %114, i8* noalias getelementptr inbounds ([28 x i8]* @.str7277, i64 0, i64 0), i8* %113, i8* %lock3.i, i8* %112) nounwind
  br label %bb55.i.i

bb55.i.i:                                         ; preds = %bb54.i.i, %bb50.i.i, %bb1.i4.i.i
  %retval1.i.i.1 = phi i32 [ 0, %bb50.i.i ], [ 0, %bb54.i.i ], [ 1, %bb1.i4.i.i ]
  %116 = call i32 @unlink(i8* %file2.i) nounwind
  br label %do_lock_file.exit.i

do_lock_file.exit.i:                              ; preds = %bb55.i.i, %bb17.i.i
  %117 = phi i32 [ %retval1.i.i.1, %bb55.i.i ], [ %retval1.i.i.0, %bb17.i.i ]
  %118 = icmp eq i32 %117, 0
  br i1 %118, label %bb6, label %bb6.i

bb6.i:                                            ; preds = %do_lock_file.exit.i
  %119 = load i8* %9, align 8
  %120 = or i8 %119, 4
  store i8 %120, i8* %9, align 8
  %121 = load i32* @lock_count, align 4
  %122 = add nsw i32 %121, 1
  store i32 %122, i32* @lock_count, align 4
  ret i32 1, !dbg !2185

bb6:                                              ; preds = %do_lock_file.exit.i, %bb45.i.i, %bb40.i.i, %bb35.i.i, %bb28.i.i, %bb22.i.i, %bb11.i.i, %bb3.i.i
  %123 = call i32 @ulckpwdf() nounwind, !dbg !2186
  ret i32 0, !dbg !2185

return:                                           ; preds = %bb4, %bb1
  %.0 = phi i32 [ 0, %bb1 ], [ 1, %bb4 ]
  ret i32 %.0, !dbg !2185
}

declare i32 @lckpwdf() nounwind

declare i32 @geteuid() nounwind

declare i32 @ulckpwdf() nounwind

define internal fastcc i32 @commonio_unlock(%struct.commonio_db* %db) nounwind {
entry:
  %lock = alloca [1024 x i8], align 1
  %0 = getelementptr inbounds %struct.commonio_db* %db, i64 0, i32 6, !dbg !2187
  %1 = load i8* %0, align 8, !dbg !2187
  %2 = and i8 %1, 2
  %toBool = icmp eq i8 %2, 0, !dbg !2187
  br i1 %toBool, label %bb5, label %bb, !dbg !2187

bb:                                               ; preds = %entry
  %3 = or i8 %1, 8, !dbg !2190
  store i8 %3, i8* %0, align 8, !dbg !2190
  %4 = call fastcc i32 @commonio_close(%struct.commonio_db* %db) nounwind, !dbg !2191
  %5 = icmp eq i32 %4, 0, !dbg !2191
  %6 = load i8* %0, align 8, !dbg !2192
  br i1 %5, label %bb1, label %bb5, !dbg !2191

bb1:                                              ; preds = %bb
  %7 = and i8 %6, 4
  %toBool2 = icmp eq i8 %7, 0, !dbg !2192
  br i1 %toBool2, label %return, label %bb3, !dbg !2192

bb3:                                              ; preds = %bb1
  %8 = load i32* @lock_count, align 4, !dbg !2193
  %9 = icmp sgt i32 %8, 0, !dbg !2193
  br i1 %9, label %bb.i, label %return, !dbg !2193

bb.i:                                             ; preds = %bb3
  %10 = add nsw i32 %8, -1
  store i32 %10, i32* @lock_count, align 4, !dbg !2198
  %11 = icmp eq i32 %10, 0, !dbg !2199
  br i1 %11, label %bb1.i, label %return, !dbg !2199

bb1.i:                                            ; preds = %bb.i
  %.b.i = load i1* @nscd_need_reload.b
  br i1 %.b.i, label %bb2.i, label %bb3.i, !dbg !2200

bb2.i:                                            ; preds = %bb1.i
  call fastcc void @nscd_flush_cache(i8* getelementptr inbounds ([7 x i8]* @.str13283, i64 0, i64 0)) nounwind
  call fastcc void @nscd_flush_cache(i8* getelementptr inbounds ([6 x i8]* @.str68, i64 0, i64 0)) nounwind
  store i1 false, i1* @nscd_need_reload.b
  br label %bb3.i, !dbg !2201

bb3.i:                                            ; preds = %bb2.i, %bb1.i
  %12 = call i32 @ulckpwdf() nounwind, !dbg !2202
  ret i32 0, !dbg !2203

bb5:                                              ; preds = %bb, %entry
  %13 = phi i8 [ %1, %entry ], [ %6, %bb ]
  %14 = and i8 %13, 4
  %toBool6 = icmp eq i8 %14, 0, !dbg !2204
  br i1 %toBool6, label %return, label %bb7, !dbg !2204

bb7:                                              ; preds = %bb5
  %15 = and i8 %13, -5, !dbg !2205
  store i8 %15, i8* %0, align 8, !dbg !2205
  %16 = getelementptr inbounds %struct.commonio_db* %db, i64 0, i32 0, i64 0
  %lock8 = getelementptr inbounds [1024 x i8]* %lock, i64 0, i64 0
  %17 = call i32 (i8*, i64, i8*, ...)* @snprintf(i8* noalias %lock8, i64 1024, i8* noalias getelementptr inbounds ([8 x i8]* @.str11281, i64 0, i64 0), i8* %16) nounwind, !dbg !2206
  %18 = call i32 @unlink(i8* %lock8) nounwind, !dbg !2207
  %19 = load i32* @lock_count, align 4, !dbg !2208
  %20 = icmp sgt i32 %19, 0, !dbg !2208
  br i1 %20, label %bb.i1, label %return, !dbg !2208

bb.i1:                                            ; preds = %bb7
  %21 = add nsw i32 %19, -1
  store i32 %21, i32* @lock_count, align 4, !dbg !2210
  %22 = icmp eq i32 %21, 0, !dbg !2211
  br i1 %22, label %bb1.i3, label %return, !dbg !2211

bb1.i3:                                           ; preds = %bb.i1
  %.b.i2 = load i1* @nscd_need_reload.b
  br i1 %.b.i2, label %bb2.i4, label %bb3.i5, !dbg !2212

bb2.i4:                                           ; preds = %bb1.i3
  call fastcc void @nscd_flush_cache(i8* getelementptr inbounds ([7 x i8]* @.str13283, i64 0, i64 0)) nounwind
  call fastcc void @nscd_flush_cache(i8* getelementptr inbounds ([6 x i8]* @.str68, i64 0, i64 0)) nounwind
  store i1 false, i1* @nscd_need_reload.b
  br label %bb3.i5, !dbg !2213

bb3.i5:                                           ; preds = %bb2.i4, %bb1.i3
  %23 = call i32 @ulckpwdf() nounwind, !dbg !2214
  ret i32 1, !dbg !2203

return:                                           ; preds = %bb.i1, %bb7, %bb5, %bb.i, %bb3, %bb1
  %.0 = phi i32 [ 0, %bb.i ], [ 0, %bb3 ], [ 0, %bb1 ], [ 1, %bb7 ], [ 1, %bb.i1 ], [ 0, %bb5 ]
  ret i32 %.0, !dbg !2203
}

define internal fastcc i32 @commonio_open(%struct.commonio_db* %db, i32 %mode) nounwind {
entry:
  %0 = and i32 %mode, -65, !dbg !2215
  %1 = getelementptr inbounds %struct.commonio_db* %db, i64 0, i32 6, !dbg !2220
  %2 = load i8* %1, align 8, !dbg !2220
  %3 = and i8 %2, 2
  %toBool = icmp eq i8 %3, 0, !dbg !2220
  br i1 %toBool, label %bb, label %bb2, !dbg !2220

bb:                                               ; preds = %entry
  %4 = icmp eq i32 %0, 0, !dbg !2220
  %Pivot = icmp slt i32 %0, 2
  br i1 %Pivot, label %LeafBlock, label %LeafBlock1

LeafBlock1:                                       ; preds = %bb
  %SwitchLeaf2 = icmp eq i32 %0, 2
  br i1 %SwitchLeaf2, label %bb3, label %bb2

LeafBlock:                                        ; preds = %bb
  br i1 %4, label %bb3, label %bb2

bb2:                                              ; preds = %LeafBlock, %LeafBlock1, %entry
  %5 = call i32* @__errno_location() nounwind readnone, !dbg !2221
  store i32 22, i32* %5, align 4, !dbg !2221
  ret i32 0, !dbg !2222

bb3:                                              ; preds = %LeafBlock, %LeafBlock1
  %6 = zext i1 %4 to i8, !dbg !2223
  %7 = shl i8 %6, 3, !dbg !2223
  %8 = and i8 %2, -9, !dbg !2223
  %9 = or i8 %8, %7, !dbg !2223
  store i8 %9, i8* %1, align 8, !dbg !2223
  %toBool7 = icmp eq i8 %7, 0
  br i1 %toBool7, label %bb8, label %bb14, !dbg !2224

bb8:                                              ; preds = %bb3
  %.lobit2 = and i8 %2, 4
  %toBool12 = icmp eq i8 %.lobit2, 0
  br i1 %toBool12, label %bb13, label %bb14, !dbg !2224

bb13:                                             ; preds = %bb8
  %10 = call i32* @__errno_location() nounwind readnone, !dbg !2225
  store i32 13, i32* %10, align 4, !dbg !2225
  ret i32 0, !dbg !2222

bb14:                                             ; preds = %bb8, %bb3
  %11 = getelementptr inbounds %struct.commonio_db* %db, i64 0, i32 3, !dbg !2226
  store %struct.commonio_entry* null, %struct.commonio_entry** %11, align 8, !dbg !2226
  %12 = getelementptr inbounds %struct.commonio_db* %db, i64 0, i32 4, !dbg !2227
  store %struct.commonio_entry* null, %struct.commonio_entry** %12, align 8, !dbg !2227
  %13 = getelementptr inbounds %struct.commonio_db* %db, i64 0, i32 5, !dbg !2228
  store %struct.commonio_entry* null, %struct.commonio_entry** %13, align 8, !dbg !2228
  %14 = and i8 %9, -2, !dbg !2229
  store i8 %14, i8* %1, align 8, !dbg !2229
  %storemerge = select i1 %toBool7, i32 133378, i32 133376
  %15 = getelementptr inbounds %struct.commonio_db* %db, i64 0, i32 0, i64 0
  %16 = call i32 (i8*, i32, ...)* @open(i8* %15, i32 %storemerge) nounwind, !dbg !2230
  %17 = call i32* @__errno_location() nounwind readnone, !dbg !2231
  %18 = load i32* %17, align 4, !dbg !2231
  %19 = getelementptr inbounds %struct.commonio_db* %db, i64 0, i32 2, !dbg !2232
  store %struct.FILE* null, %struct.FILE** %19, align 8, !dbg !2232
  %20 = icmp sgt i32 %16, -1
  br i1 %20, label %bb19, label %bb25, !dbg !2233

bb19:                                             ; preds = %bb14
  %21 = load i8* %1, align 8, !dbg !2234
  %22 = and i8 %21, 8
  %toBool20 = icmp eq i8 %22, 0, !dbg !2234
  %storemerge1 = select i1 %toBool20, i8* getelementptr inbounds ([3 x i8]* @.str16286, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8]* @.str74, i64 0, i64 0)
  %23 = call %struct.FILE* @fdopen(i32 %16, i8* %storemerge1) nounwind, !dbg !2234
  store %struct.FILE* %23, %struct.FILE** %19, align 8, !dbg !2234
  %24 = load i32* %17, align 4, !dbg !2235
  %25 = icmp eq %struct.FILE* %23, null, !dbg !2236
  br i1 %25, label %bb24, label %bb25, !dbg !2236

bb24:                                             ; preds = %bb19
  %26 = call i32 @close(i32 %16) nounwind, !dbg !2237
  br label %bb25, !dbg !2237

bb25:                                             ; preds = %bb24, %bb19, %bb14
  %27 = phi i32 [ %24, %bb24 ], [ %24, %bb19 ], [ %18, %bb14 ]
  store i32 %27, i32* %17, align 4, !dbg !2238
  %28 = load %struct.FILE** %19, align 8, !dbg !2239
  %29 = icmp eq %struct.FILE* %28, null, !dbg !2239
  br i1 %29, label %bb26, label %bb30, !dbg !2239

bb26:                                             ; preds = %bb25
  %30 = and i32 %mode, 64, !dbg !2240
  %.not = icmp ne i32 %30, 0
  %31 = icmp eq i32 %27, 2, !dbg !2240
  %or.cond = and i1 %.not, %31
  br i1 %or.cond, label %bb28, label %return, !dbg !2240

bb28:                                             ; preds = %bb26
  %32 = load i8* %1, align 8, !dbg !2241
  %33 = or i8 %32, 2, !dbg !2241
  store i8 %33, i8* %1, align 8, !dbg !2241
  ret i32 1, !dbg !2222

bb30:                                             ; preds = %bb25
  %34 = call i32 @fileno(%struct.FILE* %28) nounwind, !dbg !2242
  %35 = call i32 (i32, i32, ...)* @fcntl(i32 %34, i32 2, i32 1) nounwind, !dbg !2242
  %36 = call noalias i8* @malloc(i64 4096) nounwind, !dbg !2243
  %37 = icmp eq i8* %36, null, !dbg !2244
  br i1 %37, label %cleanup_ENOMEM, label %bb47.preheader, !dbg !2244

bb47.preheader:                                   ; preds = %bb30
  %38 = getelementptr inbounds %struct.commonio_db* %db, i64 0, i32 1, !dbg !2245
  br label %bb47

bb33:                                             ; preds = %bb36
  %39 = add i64 %buflen.0, 4096, !dbg !2246
  %40 = call i8* @realloc(i8* %buf.0, i64 %39) nounwind, !dbg !2248
  %41 = icmp eq i8* %40, null, !dbg !2249
  br i1 %41, label %cleanup_buf, label %bb34, !dbg !2249

bb34:                                             ; preds = %bb33
  %42 = call i64 @strlen(i8* %40) nounwind readonly, !dbg !2250
  %43 = load %struct.commonio_ops** %38, align 8, !dbg !2251
  %44 = getelementptr inbounds %struct.commonio_ops* %43, i64 0, i32 5, !dbg !2251
  %45 = load i8* (i8*, i32, %struct.FILE*)** %44, align 8, !dbg !2251
  %46 = load %struct.FILE** %19, align 8, !dbg !2251
  %47 = trunc i64 %39 to i32, !dbg !2251
  %48 = trunc i64 %42 to i32, !dbg !2251
  %49 = sub i32 %47, %48, !dbg !2251
  %50 = getelementptr inbounds i8* %40, i64 %42, !dbg !2251
  %51 = call i8* %45(i8* %50, i32 %49, %struct.FILE* %46) nounwind, !dbg !2251
  %52 = icmp eq i8* %51, null, !dbg !2251
  br i1 %52, label %cleanup_buf, label %bb35, !dbg !2251

bb35:                                             ; preds = %bb47, %bb34
  %buf.0 = phi i8* [ %40, %bb34 ], [ %buf.2, %bb47 ]
  %buflen.0 = phi i64 [ %39, %bb34 ], [ %buflen.1, %bb47 ]
  %53 = call i8* @strrchr(i8* %buf.0, i32 10) nounwind readonly, !dbg !2252
  %54 = icmp eq i8* %53, null, !dbg !2252
  br i1 %54, label %bb36, label %bb37, !dbg !2252

bb36:                                             ; preds = %bb35
  %55 = load %struct.FILE** %19, align 8, !dbg !2252
  %56 = call i32 @feof(%struct.FILE* %55) nounwind, !dbg !2252
  %57 = icmp eq i32 %56, 0, !dbg !2252
  br i1 %57, label %bb33, label %bb37, !dbg !2252

bb37:                                             ; preds = %bb36, %bb35
  %58 = call i8* @strrchr(i8* %buf.0, i32 10) nounwind readonly, !dbg !2253
  %59 = icmp eq i8* %58, null, !dbg !2254
  br i1 %59, label %bb39, label %bb38, !dbg !2254

bb38:                                             ; preds = %bb37
  store i8 0, i8* %58, align 1, !dbg !2255
  br label %bb39, !dbg !2255

bb39:                                             ; preds = %bb38, %bb37
  %60 = call noalias i8* @strdup(i8* %buf.0) nounwind, !dbg !2256
  %61 = icmp eq i8* %60, null, !dbg !2257
  br i1 %61, label %cleanup_buf, label %bb40, !dbg !2257

bb40:                                             ; preds = %bb39
  %62 = load i8* %60, align 1, !dbg !2258
  %Pivot9 = icmp slt i8 %62, 45
  br i1 %Pivot9, label %LeafBlock4, label %LeafBlock6

LeafBlock6:                                       ; preds = %bb40
  %SwitchLeaf7 = icmp eq i8 %62, 45
  br i1 %SwitchLeaf7, label %bb45, label %bb43

LeafBlock4:                                       ; preds = %bb40
  %SwitchLeaf5 = icmp eq i8 %62, 43
  br i1 %SwitchLeaf5, label %bb45, label %bb43

bb43:                                             ; preds = %LeafBlock4, %LeafBlock6
  %63 = load %struct.commonio_ops** %38, align 8, !dbg !2264
  %64 = getelementptr inbounds %struct.commonio_ops* %63, i64 0, i32 3, !dbg !2264
  %65 = load i8* (i8*)** %64, align 8, !dbg !2264
  %66 = call i8* %65(i8* %60) nounwind, !dbg !2264
  %67 = icmp eq i8* %66, null, !dbg !2265
  br i1 %67, label %bb45, label %bb44, !dbg !2265

bb44:                                             ; preds = %bb43
  %68 = load %struct.commonio_ops** %38, align 8, !dbg !2266
  %69 = getelementptr inbounds %struct.commonio_ops* %68, i64 0, i32 0, !dbg !2266
  %70 = load i8* (i8*)** %69, align 8, !dbg !2266
  %71 = call i8* %70(i8* %66) nounwind, !dbg !2266
  %72 = icmp eq i8* %71, null, !dbg !2267
  br i1 %72, label %cleanup_line, label %bb45, !dbg !2267

bb45:                                             ; preds = %bb44, %bb43, %LeafBlock4, %LeafBlock6
  %eptr.0 = phi i8* [ %66, %bb43 ], [ %71, %bb44 ], [ null, %LeafBlock4 ], [ null, %LeafBlock6 ]
  %73 = call noalias i8* @malloc(i64 40) nounwind, !dbg !2268
  %74 = bitcast i8* %73 to %struct.commonio_entry*, !dbg !2268
  %75 = icmp eq i8* %73, null
  br i1 %75, label %cleanup_entry, label %bb46, !dbg !2269

bb46:                                             ; preds = %bb45
  %76 = getelementptr inbounds i8* %73, i64 8
  %77 = bitcast i8* %76 to i8**
  store i8* %eptr.0, i8** %77, align 8, !dbg !2270
  %78 = bitcast i8* %73 to i8**
  store i8* %60, i8** %78, align 8, !dbg !2271
  %79 = getelementptr inbounds i8* %73, i64 32
  store i8 0, i8* %79, align 8, !dbg !2272
  %80 = getelementptr inbounds i8* %73, i64 24
  %81 = bitcast i8* %80 to %struct.commonio_entry**
  store %struct.commonio_entry* null, %struct.commonio_entry** %81, align 8, !dbg !2273
  %82 = load %struct.commonio_entry** %12, align 8, !dbg !2279
  %83 = getelementptr inbounds i8* %73, i64 16
  %84 = bitcast i8* %83 to %struct.commonio_entry**
  store %struct.commonio_entry* %82, %struct.commonio_entry** %84, align 8, !dbg !2279
  %85 = load %struct.commonio_entry** %11, align 8, !dbg !2280
  %86 = icmp eq %struct.commonio_entry* %85, null, !dbg !2280
  br i1 %86, label %bb.i3, label %bb1.i4, !dbg !2280

bb.i3:                                            ; preds = %bb46
  store %struct.commonio_entry* %74, %struct.commonio_entry** %11, align 8, !dbg !2281
  br label %bb1.i4, !dbg !2281

bb1.i4:                                           ; preds = %bb.i3, %bb46
  %87 = icmp eq %struct.commonio_entry* %82, null, !dbg !2282
  br i1 %87, label %add_one_entry.exit, label %bb2.i5, !dbg !2282

bb2.i5:                                           ; preds = %bb1.i4
  %88 = getelementptr inbounds %struct.commonio_entry* %82, i64 0, i32 3, !dbg !2283
  store %struct.commonio_entry* %74, %struct.commonio_entry** %88, align 8, !dbg !2283
  br label %add_one_entry.exit, !dbg !2283

add_one_entry.exit:                               ; preds = %bb2.i5, %bb1.i4
  store %struct.commonio_entry* %74, %struct.commonio_entry** %12, align 8, !dbg !2284
  br label %bb47, !dbg !2278

bb47:                                             ; preds = %add_one_entry.exit, %bb47.preheader
  %buf.2 = phi i8* [ %buf.0, %add_one_entry.exit ], [ %36, %bb47.preheader ]
  %buflen.1 = phi i64 [ %buflen.0, %add_one_entry.exit ], [ 4096, %bb47.preheader ]
  %89 = load %struct.commonio_ops** %38, align 8, !dbg !2245
  %90 = getelementptr inbounds %struct.commonio_ops* %89, i64 0, i32 5, !dbg !2245
  %91 = load i8* (i8*, i32, %struct.FILE*)** %90, align 8, !dbg !2245
  %92 = load %struct.FILE** %19, align 8, !dbg !2245
  %93 = trunc i64 %buflen.1 to i32, !dbg !2245
  %94 = call i8* %91(i8* %buf.2, i32 %93, %struct.FILE* %92) nounwind, !dbg !2245
  %95 = icmp eq i8* %94, %buf.2, !dbg !2245
  br i1 %95, label %bb35, label %bb48, !dbg !2245

bb48:                                             ; preds = %bb47
  call void @free(i8* %buf.2) nounwind, !dbg !2285
  %96 = load %struct.FILE** %19, align 8, !dbg !2286
  %97 = call i32 @ferror(%struct.FILE* %96) nounwind, !dbg !2286
  %98 = icmp eq i32 %97, 0, !dbg !2286
  br i1 %98, label %bb49, label %cleanup_errno, !dbg !2286

bb49:                                             ; preds = %bb48
  %99 = load %struct.commonio_ops** %38, align 8, !dbg !2287
  %100 = getelementptr inbounds %struct.commonio_ops* %99, i64 0, i32 7, !dbg !2287
  %101 = load i32 ()** %100, align 8, !dbg !2287
  %102 = icmp eq i32 ()* %101, null, !dbg !2287
  br i1 %102, label %bb51, label %bb50, !dbg !2287

bb50:                                             ; preds = %bb49
  %103 = call i32 %101() nounwind, !dbg !2287
  %104 = icmp eq i32 %103, 0, !dbg !2287
  br i1 %104, label %cleanup_errno, label %bb51, !dbg !2287

bb51:                                             ; preds = %bb50, %bb49
  %105 = load i8* %1, align 8, !dbg !2288
  %106 = or i8 %105, 2, !dbg !2288
  store i8 %106, i8* %1, align 8, !dbg !2288
  ret i32 1, !dbg !2222

cleanup_entry:                                    ; preds = %bb45
  %107 = icmp eq i8* %eptr.0, null, !dbg !2289
  br i1 %107, label %cleanup_line, label %bb52, !dbg !2289

bb52:                                             ; preds = %cleanup_entry
  %108 = load %struct.commonio_ops** %38, align 8, !dbg !2290
  %109 = getelementptr inbounds %struct.commonio_ops* %108, i64 0, i32 1, !dbg !2290
  %110 = load void (i8*)** %109, align 8, !dbg !2290
  call void %110(i8* %eptr.0) nounwind, !dbg !2290
  br label %cleanup_line, !dbg !2291

cleanup_line:                                     ; preds = %bb52, %cleanup_entry, %bb44
  call void @free(i8* %60) nounwind, !dbg !2292
  br label %cleanup_buf, !dbg !2293

cleanup_buf:                                      ; preds = %cleanup_line, %bb39, %bb34, %bb33
  %buf.1 = phi i8* [ %buf.0, %cleanup_line ], [ %40, %bb34 ], [ %buf.0, %bb33 ], [ %buf.0, %bb39 ]
  call void @free(i8* %buf.1) nounwind, !dbg !2294
  br label %cleanup_ENOMEM, !dbg !2295

cleanup_ENOMEM:                                   ; preds = %cleanup_buf, %bb30
  store i32 12, i32* %17, align 4, !dbg !2296
  br label %cleanup_errno, !dbg !2297

cleanup_errno:                                    ; preds = %cleanup_ENOMEM, %bb50, %bb48
  %111 = load i32* %17, align 4, !dbg !2298
  %112 = getelementptr inbounds %struct.commonio_db* %db, i64 0, i32 1, !dbg !2299
  br label %bb5.i, !dbg !2305

bb.i:                                             ; preds = %bb5.i
  %113 = getelementptr inbounds %struct.commonio_entry* %125, i64 0, i32 3, !dbg !2306
  %114 = load %struct.commonio_entry** %113, align 8, !dbg !2306
  store %struct.commonio_entry* %114, %struct.commonio_entry** %11, align 8, !dbg !2306
  %115 = getelementptr inbounds %struct.commonio_entry* %125, i64 0, i32 0, !dbg !2307
  %116 = load i8** %115, align 8, !dbg !2307
  %117 = icmp eq i8* %116, null, !dbg !2307
  br i1 %117, label %bb2.i, label %bb1.i, !dbg !2307

bb1.i:                                            ; preds = %bb.i
  call void @free(i8* %116) nounwind, !dbg !2308
  br label %bb2.i, !dbg !2308

bb2.i:                                            ; preds = %bb1.i, %bb.i
  %118 = getelementptr inbounds %struct.commonio_entry* %125, i64 0, i32 1, !dbg !2309
  %119 = load i8** %118, align 8, !dbg !2309
  %120 = icmp eq i8* %119, null, !dbg !2309
  br i1 %120, label %bb4.i, label %bb3.i, !dbg !2309

bb3.i:                                            ; preds = %bb2.i
  %121 = load %struct.commonio_ops** %112, align 8, !dbg !2299
  %122 = getelementptr inbounds %struct.commonio_ops* %121, i64 0, i32 1, !dbg !2299
  %123 = load void (i8*)** %122, align 8, !dbg !2299
  call void %123(i8* %119) nounwind, !dbg !2299
  br label %bb4.i, !dbg !2299

bb4.i:                                            ; preds = %bb3.i, %bb2.i
  %124 = bitcast %struct.commonio_entry* %125 to i8*, !dbg !2310
  call void @free(i8* %124) nounwind, !dbg !2310
  br label %bb5.i, !dbg !2310

bb5.i:                                            ; preds = %bb4.i, %cleanup_errno
  %125 = load %struct.commonio_entry** %11, align 8, !dbg !2311
  %126 = icmp eq %struct.commonio_entry* %125, null, !dbg !2311
  br i1 %126, label %free_linked_list.exit, label %bb.i, !dbg !2311

free_linked_list.exit:                            ; preds = %bb5.i
  store %struct.commonio_entry* null, %struct.commonio_entry** %12, align 8, !dbg !2312
  %127 = load %struct.FILE** %19, align 8, !dbg !2313
  %128 = call i32 @fclose(%struct.FILE* %127) nounwind, !dbg !2313
  store %struct.FILE* null, %struct.FILE** %19, align 8, !dbg !2314
  store i32 %111, i32* %17, align 4, !dbg !2315
  ret i32 0, !dbg !2222

return:                                           ; preds = %bb26
  ret i32 0, !dbg !2222
}

declare %struct.FILE* @fdopen(i32, i8*) nounwind

declare i32 @fcntl(i32, i32, ...)

declare i32 @feof(%struct.FILE*) nounwind

define internal fastcc i32 @commonio_close(%struct.commonio_db* %db) nounwind {
entry:
  %sb.i9 = alloca %struct.stat, align 8
  %sb.i = alloca %struct.stat, align 8
  %ub.i = alloca %struct.rlimit, align 8
  %buf = alloca [1024 x i8], align 1
  %sb = alloca %struct.stat, align 8
  %0 = getelementptr inbounds %struct.commonio_db* %db, i64 0, i32 6, !dbg !2316
  %1 = load i8* %0, align 8, !dbg !2316
  %.lobit = and i8 %1, 2
  %toBool3 = icmp eq i8 %.lobit, 0
  br i1 %toBool3, label %bb, label %bb4, !dbg !2316

bb:                                               ; preds = %entry
  %2 = call i32* @__errno_location() nounwind readnone, !dbg !2319
  store i32 22, i32* %2, align 4, !dbg !2319
  ret i32 0, !dbg !2320

bb4:                                              ; preds = %entry
  %3 = and i8 %1, -3, !dbg !2321
  store i8 %3, i8* %0, align 8, !dbg !2321
  %4 = and i8 %1, 1
  %toBool8 = icmp eq i8 %4, 0
  br i1 %toBool8, label %bb11, label %bb9, !dbg !2322

bb9:                                              ; preds = %bb4
  %5 = and i8 %1, 8
  %toBool10 = icmp eq i8 %5, 0, !dbg !2322
  br i1 %toBool10, label %bb12, label %bb11, !dbg !2322

bb11:                                             ; preds = %bb9, %bb4
  %6 = getelementptr inbounds %struct.commonio_db* %db, i64 0, i32 2, !dbg !2323
  %7 = load %struct.FILE** %6, align 8, !dbg !2323
  %8 = call i32 @fclose(%struct.FILE* %7) nounwind, !dbg !2323
  store %struct.FILE* null, %struct.FILE** %6, align 8, !dbg !2324
  br label %success, !dbg !2324

bb12:                                             ; preds = %bb9
  %9 = getelementptr inbounds %struct.commonio_db* %db, i64 0, i32 1, !dbg !2325
  %10 = load %struct.commonio_ops** %9, align 8, !dbg !2325
  %11 = getelementptr inbounds %struct.commonio_ops* %10, i64 0, i32 8, !dbg !2325
  %12 = load i32 ()** %11, align 8, !dbg !2325
  %13 = icmp eq i32 ()* %12, null, !dbg !2325
  br i1 %13, label %bb14, label %bb13, !dbg !2325

bb13:                                             ; preds = %bb12
  %14 = call i32 %12() nounwind, !dbg !2325
  %15 = icmp eq i32 %14, 0, !dbg !2325
  br i1 %15, label %fail, label %bb14, !dbg !2325

bb14:                                             ; preds = %bb13, %bb12
  %sb15 = bitcast %struct.stat* %sb to i8*, !dbg !2326
  %16 = call i8* @memset(i8* %sb15, i32 0, i64 144) nounwind
  %17 = getelementptr inbounds %struct.commonio_db* %db, i64 0, i32 2, !dbg !2327
  %18 = load %struct.FILE** %17, align 8, !dbg !2327
  %19 = icmp eq %struct.FILE* %18, null, !dbg !2327
  br i1 %19, label %bb27, label %bb16, !dbg !2327

bb16:                                             ; preds = %bb14
  %20 = call i32 @fileno(%struct.FILE* %18) nounwind, !dbg !2328
  %21 = call i32 @fstat(i32 %20, %struct.stat* %sb) nounwind, !dbg !2328
  %22 = icmp eq i32 %21, 0, !dbg !2328
  br i1 %22, label %bb18, label %bb17, !dbg !2328

bb17:                                             ; preds = %bb16
  %23 = load %struct.FILE** %17, align 8, !dbg !2329
  %24 = call i32 @fclose(%struct.FILE* %23) nounwind, !dbg !2329
  store %struct.FILE* null, %struct.FILE** %17, align 8, !dbg !2330
  br label %fail, !dbg !2330

bb18:                                             ; preds = %bb16
  %25 = getelementptr inbounds %struct.commonio_db* %db, i64 0, i32 0, i64 0
  %buf19 = getelementptr inbounds [1024 x i8]* %buf, i64 0, i64 0
  %26 = call i32 (i8*, i64, i8*, ...)* @snprintf(i8* noalias %buf19, i64 1024, i8* noalias getelementptr inbounds ([4 x i8]* @.str19289, i64 0, i64 0), i8* %25) nounwind, !dbg !2331
  %27 = load %struct.FILE** %17, align 8, !dbg !2332
  %28 = call i32 @fileno(%struct.FILE* %27) nounwind, !dbg !2333
  %29 = call i32 @fstat(i32 %28, %struct.stat* %sb.i) nounwind, !dbg !2333
  %30 = icmp eq i32 %29, 0, !dbg !2333
  br i1 %30, label %bb1.i, label %bb22, !dbg !2333

bb1.i:                                            ; preds = %bb18
  %31 = call i32 @umask(i32 63) nounwind, !dbg !2336
  %32 = call %struct.FILE* @fopen(i8* noalias %buf19, i8* noalias getelementptr inbounds ([2 x i8]* @.str8278, i64 0, i64 0)) nounwind, !dbg !2337
  %33 = call i32 @umask(i32 %31) nounwind, !dbg !2338
  %34 = icmp eq %struct.FILE* %32, null, !dbg !2339
  br i1 %34, label %bb22, label %bb3.i, !dbg !2339

bb3.i:                                            ; preds = %bb1.i
  %35 = call i32 @fseek(%struct.FILE* %27, i64 0, i32 0) nounwind, !dbg !2340
  %36 = icmp eq i32 %35, 0, !dbg !2340
  br i1 %36, label %bb6.i, label %bb10.i, !dbg !2340

bb5.i:                                            ; preds = %bb6.i
  %37 = call i32 @_IO_putc(i32 %39, %struct.FILE* %32) nounwind, !dbg !2341
  %38 = icmp eq i32 %37, -1, !dbg !2341
  br i1 %38, label %bb10.i, label %bb6.i, !dbg !2341

bb6.i:                                            ; preds = %bb5.i, %bb3.i
  %39 = call i32 @_IO_getc(%struct.FILE* %27) nounwind, !dbg !2342
  %40 = icmp eq i32 %39, -1, !dbg !2342
  br i1 %40, label %bb8.i, label %bb5.i, !dbg !2342

bb8.i:                                            ; preds = %bb6.i
  %41 = call i32 @ferror(%struct.FILE* %27) nounwind, !dbg !2343
  %42 = icmp eq i32 %41, 0, !dbg !2343
  br i1 %42, label %bb9.i, label %bb10.i, !dbg !2343

bb9.i:                                            ; preds = %bb8.i
  %43 = call i32 @fflush(%struct.FILE* %32) nounwind, !dbg !2343
  %44 = icmp eq i32 %43, 0, !dbg !2343
  br i1 %44, label %bb11.i, label %bb10.i, !dbg !2343

bb10.i:                                           ; preds = %bb9.i, %bb8.i, %bb5.i, %bb3.i
  %45 = call i32 @fclose(%struct.FILE* %32) nounwind, !dbg !2344
  br label %bb22, !dbg !2345

bb11.i:                                           ; preds = %bb9.i
  %46 = call i32 @fileno(%struct.FILE* %32) nounwind, !dbg !2346
  %47 = call i32 @fsync(i32 %46) nounwind, !dbg !2346
  %48 = icmp eq i32 %47, 0, !dbg !2346
  br i1 %48, label %bb12.i, label %bb22, !dbg !2346

bb12.i:                                           ; preds = %bb11.i
  %49 = call i32 @fclose(%struct.FILE* %32) nounwind, !dbg !2346
  %50 = icmp eq i32 %49, 0, !dbg !2346
  br i1 %50, label %create_backup.exit, label %bb22, !dbg !2346

create_backup.exit:                               ; preds = %bb12.i
  %51 = getelementptr inbounds %struct.stat* %sb.i, i64 0, i32 11, i32 0
  %52 = load i64* %51, align 8, !dbg !2347
  %53 = getelementptr inbounds %struct.rlimit* %ub.i, i64 0, i32 0, !dbg !2347
  store i64 %52, i64* %53, align 8, !dbg !2347
  %54 = getelementptr inbounds %struct.stat* %sb.i, i64 0, i32 12, i32 0
  %55 = load i64* %54, align 8, !dbg !2348
  %56 = getelementptr inbounds %struct.rlimit* %ub.i, i64 0, i32 1, !dbg !2348
  store i64 %55, i64* %56, align 8, !dbg !2348
  %57 = call i32 @utime(i8* %buf19, %struct.rlimit* %ub.i) nounwind, !dbg !2349
  br label %bb22, !dbg !2332

bb22:                                             ; preds = %create_backup.exit, %bb12.i, %bb11.i, %bb10.i, %bb1.i, %bb18
  %errors.0 = phi i32 [ 0, %create_backup.exit ], [ 1, %bb11.i ], [ 1, %bb12.i ], [ 1, %bb1.i ], [ 1, %bb18 ], [ 1, %bb10.i ]
  %58 = load %struct.FILE** %17, align 8, !dbg !2350
  %59 = call i32 @fclose(%struct.FILE* %58) nounwind, !dbg !2350
  %not. = icmp ne i32 %59, 0
  %60 = zext i1 %not. to i32
  %errors.4 = add i32 %errors.0, %60
  %61 = icmp eq i32 %errors.4, 0, !dbg !2351
  br i1 %61, label %bb28, label %bb25, !dbg !2351

bb25:                                             ; preds = %bb22
  store %struct.FILE* null, %struct.FILE** %17, align 8, !dbg !2352
  br label %fail, !dbg !2352

bb27:                                             ; preds = %bb14
  %62 = getelementptr inbounds %struct.stat* %sb, i64 0, i32 3, !dbg !2353
  store i32 256, i32* %62, align 8, !dbg !2353
  %63 = getelementptr inbounds %struct.stat* %sb, i64 0, i32 4, !dbg !2354
  store i32 0, i32* %63, align 4, !dbg !2354
  %64 = getelementptr inbounds %struct.stat* %sb, i64 0, i32 5, !dbg !2355
  store i32 0, i32* %64, align 8, !dbg !2355
  br label %bb28, !dbg !2355

bb28:                                             ; preds = %bb27, %bb22
  %errors.1 = phi i32 [ 0, %bb27 ], [ %errors.4, %bb22 ]
  %65 = getelementptr inbounds %struct.commonio_db* %db, i64 0, i32 0, i64 0
  %buf29 = getelementptr inbounds [1024 x i8]* %buf, i64 0, i64 0
  %66 = call i32 (i8*, i64, i8*, ...)* @snprintf(i8* noalias %buf29, i64 1024, i8* noalias getelementptr inbounds ([4 x i8]* @.str20290, i64 0, i64 0), i8* %65) nounwind, !dbg !2356
  %67 = call i32 @umask(i32 511) nounwind
  %68 = call %struct.FILE* @fopen(i8* noalias %buf29, i8* noalias getelementptr inbounds ([2 x i8]* @.str8278, i64 0, i64 0)) nounwind
  %69 = call i32 @umask(i32 %67) nounwind
  %70 = icmp eq %struct.FILE* %68, null
  br i1 %70, label %fopen_set_perms.exit.thread, label %bb1.i4

bb1.i4:                                           ; preds = %bb28
  %71 = getelementptr inbounds %struct.stat* %sb, i64 0, i32 5
  %72 = load i32* %71, align 8
  %73 = getelementptr inbounds %struct.stat* %sb, i64 0, i32 4
  %74 = load i32* %73, align 4
  %75 = call i32 @fileno(%struct.FILE* %68) nounwind
  %76 = call i32 @fchown(i32 %75, i32 %74, i32 %72) nounwind
  %77 = icmp eq i32 %76, 0
  br i1 %77, label %bb2.i5, label %fail.i

bb2.i5:                                           ; preds = %bb1.i4
  %78 = getelementptr inbounds %struct.stat* %sb, i64 0, i32 3
  %79 = load i32* %78, align 8
  %80 = and i32 %79, 436
  %81 = call i32 @fileno(%struct.FILE* %68) nounwind
  %82 = call i32 @fchmod(i32 %81, i32 %80) nounwind
  %83 = icmp eq i32 %82, 0
  br i1 %83, label %bb31, label %fail.i

fail.i:                                           ; preds = %bb2.i5, %bb1.i4
  %84 = call i32 @fclose(%struct.FILE* %68) nounwind
  %85 = call i32 @unlink(i8* %buf29) nounwind
  br label %fopen_set_perms.exit.thread

fopen_set_perms.exit.thread:                      ; preds = %fail.i, %bb28
  store %struct.FILE* null, %struct.FILE** %17, align 8, !dbg !2357
  br label %fail

bb31:                                             ; preds = %bb2.i5
  store %struct.FILE* %68, %struct.FILE** %17, align 8, !dbg !2357
  %86 = getelementptr inbounds %struct.commonio_db* %db, i64 0, i32 3, !dbg !2358
  br label %bb12.i30, !dbg !2358

bb.i18:                                           ; preds = %bb12.i30
  %87 = getelementptr inbounds %struct.commonio_entry* %storemerge.i, i64 0, i32 4, !dbg !2366
  %88 = load i8* %87, align 8, !dbg !2366
  %89 = and i8 %88, 1
  %toBool.i = icmp eq i8 %89, 0, !dbg !2366
  br i1 %toBool.i, label %bb6.i24, label %bb1.i19, !dbg !2366

bb1.i19:                                          ; preds = %bb.i18
  %90 = getelementptr inbounds %struct.commonio_entry* %storemerge.i, i64 0, i32 1, !dbg !2367
  %91 = load i8** %90, align 8, !dbg !2367
  %92 = icmp eq i8* %91, null, !dbg !2368
  br i1 %92, label %bb2.i20, label %bb3.i21, !dbg !2368

bb2.i20:                                          ; preds = %bb1.i19
  call void @__assert_fail(i8* getelementptr inbounds ([20 x i8]* @.str17287, i64 0, i64 0), i8* getelementptr inbounds ([21 x i8]* @.str18288, i64 0, i64 0), i32 893, i8* getelementptr inbounds ([10 x i8]* @__PRETTY_FUNCTION__.5934, i64 0, i64 0)) noreturn nounwind, !dbg !2368
  unreachable, !dbg !2368

bb3.i21:                                          ; preds = %bb1.i19
  %93 = load %struct.commonio_ops** %9, align 8, !dbg !2369
  %94 = getelementptr inbounds %struct.commonio_ops* %93, i64 0, i32 4, !dbg !2369
  %95 = load i32 (i8*, %struct.FILE*)** %94, align 8, !dbg !2369
  %96 = load %struct.FILE** %17, align 8, !dbg !2369
  %97 = call i32 %95(i8* %91, %struct.FILE* %96) nounwind, !dbg !2369
  %98 = icmp eq i32 %97, 0, !dbg !2369
  br i1 %98, label %bb11.i29, label %bb32, !dbg !2369

bb6.i24:                                          ; preds = %bb.i18
  %99 = getelementptr inbounds %struct.commonio_entry* %storemerge.i, i64 0, i32 0, !dbg !2370
  %100 = load i8** %99, align 8, !dbg !2370
  %101 = icmp eq i8* %100, null, !dbg !2370
  br i1 %101, label %bb11.i29, label %bb7.i25, !dbg !2370

bb7.i25:                                          ; preds = %bb6.i24
  %102 = load %struct.commonio_ops** %9, align 8, !dbg !2371
  %103 = getelementptr inbounds %struct.commonio_ops* %102, i64 0, i32 6, !dbg !2371
  %104 = load i32 (i8*, %struct.FILE*)** %103, align 8, !dbg !2371
  %105 = load %struct.FILE** %17, align 8, !dbg !2371
  %106 = call i32 %104(i8* %100, %struct.FILE* %105) nounwind, !dbg !2371
  %107 = icmp eq i32 %106, -1, !dbg !2371
  br i1 %107, label %bb32, label %bb9.i27, !dbg !2371

bb9.i27:                                          ; preds = %bb7.i25
  %108 = load %struct.FILE** %17, align 8, !dbg !2372
  %109 = call i32 @_IO_putc(i32 10, %struct.FILE* %108) nounwind, !dbg !2372
  %110 = icmp eq i32 %109, -1, !dbg !2372
  br i1 %110, label %bb32, label %bb11.i29, !dbg !2372

bb11.i29:                                         ; preds = %bb9.i27, %bb6.i24, %bb3.i21
  %111 = getelementptr inbounds %struct.commonio_entry* %storemerge.i, i64 0, i32 3, !dbg !2358
  br label %bb12.i30, !dbg !2358

bb12.i30:                                         ; preds = %bb11.i29, %bb31
  %storemerge.in.i = phi %struct.commonio_entry** [ %86, %bb31 ], [ %111, %bb11.i29 ]
  %storemerge.i = load %struct.commonio_entry** %storemerge.in.i, align 8
  %112 = icmp eq %struct.commonio_entry* %storemerge.i, null
  br i1 %112, label %bb33, label %bb.i18, !dbg !2358

bb32:                                             ; preds = %bb9.i27, %bb7.i25, %bb3.i21
  %113 = add nsw i32 %errors.1, 1, !dbg !2373
  br label %bb33, !dbg !2373

bb33:                                             ; preds = %bb32, %bb12.i30
  %errors.5 = phi i32 [ %113, %bb32 ], [ %errors.1, %bb12.i30 ]
  %114 = load %struct.FILE** %17, align 8, !dbg !2374
  %115 = call i32 @fflush(%struct.FILE* %114) nounwind, !dbg !2374
  %not.37 = icmp ne i32 %115, 0
  %116 = zext i1 %not.37 to i32
  %errors.6 = add i32 %errors.5, %116
  %117 = load %struct.FILE** %17, align 8, !dbg !2375
  %118 = call i32 @fileno(%struct.FILE* %117) nounwind, !dbg !2375
  %119 = call i32 @fsync(i32 %118) nounwind, !dbg !2375
  %not.38 = icmp ne i32 %119, 0
  %120 = zext i1 %not.38 to i32
  %errors.7 = add i32 %errors.6, %120
  %121 = load %struct.FILE** %17, align 8, !dbg !2376
  %122 = call i32 @fclose(%struct.FILE* %121) nounwind, !dbg !2376
  %not.39 = icmp ne i32 %122, 0
  %123 = zext i1 %not.39 to i32
  %errors.8 = add i32 %errors.7, %123
  store %struct.FILE* null, %struct.FILE** %17, align 8, !dbg !2377
  %124 = icmp eq i32 %errors.8, 0, !dbg !2378
  br i1 %124, label %bb42, label %bb40, !dbg !2378

bb40:                                             ; preds = %bb33
  %125 = call i32 @unlink(i8* %buf29) nounwind, !dbg !2379
  br label %fail, !dbg !2379

bb42:                                             ; preds = %bb33
  %126 = call i32 @lstat(i8* noalias %65, %struct.stat* noalias %sb.i9) nounwind, !dbg !2380
  %127 = icmp eq i32 %126, 0, !dbg !2380
  br i1 %127, label %bb.i10, label %bb4.i14.thread, !dbg !2380

bb.i10:                                           ; preds = %bb42
  %128 = getelementptr inbounds %struct.stat* %sb.i9, i64 0, i32 3, !dbg !2380
  %129 = load i32* %128, align 8, !dbg !2380
  %130 = and i32 %129, 61440, !dbg !2380
  %131 = icmp eq i32 %130, 40960, !dbg !2380
  br i1 %131, label %bb1.i11, label %bb4.i14.thread, !dbg !2380

bb1.i11:                                          ; preds = %bb.i10
  %132 = call i8* @realpath(i8* noalias %65, i8* noalias null) nounwind, !dbg !2386
  %133 = icmp eq i8* %132, null, !dbg !2387
  br i1 %133, label %bb4.i14, label %bb5.i15, !dbg !2387

bb4.i14.thread:                                   ; preds = %bb.i10, %bb42
  %134 = call i32 @rename(i8* %buf29, i8* %65) nounwind, !dbg !2388
  br label %lrename.exit

bb4.i14:                                          ; preds = %bb1.i11
  call void @perror(i8* getelementptr inbounds ([22 x i8]* @.str270, i64 0, i64 0)) nounwind, !dbg !2389
  %135 = call i32 @rename(i8* %buf29, i8* %65) nounwind, !dbg !2388
  br label %lrename.exit, !dbg !2390

bb5.i15:                                          ; preds = %bb1.i11
  %136 = call i32 @rename(i8* %buf29, i8* %132) nounwind, !dbg !2388
  call void @free(i8* %132) nounwind, !dbg !2391
  br label %lrename.exit, !dbg !2391

lrename.exit:                                     ; preds = %bb5.i15, %bb4.i14, %bb4.i14.thread
  %137 = phi i32 [ %134, %bb4.i14.thread ], [ %135, %bb4.i14 ], [ %136, %bb5.i15 ]
  %138 = icmp eq i32 %137, 0, !dbg !2385
  br i1 %138, label %bb44, label %fail, !dbg !2385

bb44:                                             ; preds = %lrename.exit
  store i1 true, i1* @nscd_need_reload.b
  br label %success, !dbg !2392

fail:                                             ; preds = %lrename.exit, %bb40, %fopen_set_perms.exit.thread, %bb25, %bb17, %bb13
  %errors.2 = phi i32 [ %errors.8, %lrename.exit ], [ %errors.8, %bb40 ], [ %errors.4, %bb25 ], [ 0, %bb17 ], [ 0, %bb13 ], [ %errors.1, %fopen_set_perms.exit.thread ]
  %139 = add nsw i32 %errors.2, 1, !dbg !2393
  br label %success, !dbg !2394

success:                                          ; preds = %fail, %bb44, %bb11
  %errors.3 = phi i32 [ 0, %bb11 ], [ %139, %fail ], [ %errors.8, %bb44 ]
  %140 = getelementptr inbounds %struct.commonio_db* %db, i64 0, i32 3, !dbg !2395
  %141 = getelementptr inbounds %struct.commonio_db* %db, i64 0, i32 1, !dbg !2397
  br label %bb5.i3, !dbg !2398

bb.i:                                             ; preds = %bb5.i3
  %142 = getelementptr inbounds %struct.commonio_entry* %154, i64 0, i32 3, !dbg !2399
  %143 = load %struct.commonio_entry** %142, align 8, !dbg !2399
  store %struct.commonio_entry* %143, %struct.commonio_entry** %140, align 8, !dbg !2399
  %144 = getelementptr inbounds %struct.commonio_entry* %154, i64 0, i32 0, !dbg !2400
  %145 = load i8** %144, align 8, !dbg !2400
  %146 = icmp eq i8* %145, null, !dbg !2400
  br i1 %146, label %bb2.i, label %bb1.i1, !dbg !2400

bb1.i1:                                           ; preds = %bb.i
  call void @free(i8* %145) nounwind, !dbg !2401
  br label %bb2.i, !dbg !2401

bb2.i:                                            ; preds = %bb1.i1, %bb.i
  %147 = getelementptr inbounds %struct.commonio_entry* %154, i64 0, i32 1, !dbg !2402
  %148 = load i8** %147, align 8, !dbg !2402
  %149 = icmp eq i8* %148, null, !dbg !2402
  br i1 %149, label %bb4.i, label %bb3.i2, !dbg !2402

bb3.i2:                                           ; preds = %bb2.i
  %150 = load %struct.commonio_ops** %141, align 8, !dbg !2397
  %151 = getelementptr inbounds %struct.commonio_ops* %150, i64 0, i32 1, !dbg !2397
  %152 = load void (i8*)** %151, align 8, !dbg !2397
  call void %152(i8* %148) nounwind, !dbg !2397
  br label %bb4.i, !dbg !2397

bb4.i:                                            ; preds = %bb3.i2, %bb2.i
  %153 = bitcast %struct.commonio_entry* %154 to i8*, !dbg !2403
  call void @free(i8* %153) nounwind, !dbg !2403
  br label %bb5.i3, !dbg !2403

bb5.i3:                                           ; preds = %bb4.i, %success
  %154 = load %struct.commonio_entry** %140, align 8, !dbg !2395
  %155 = icmp eq %struct.commonio_entry* %154, null, !dbg !2395
  br i1 %155, label %free_linked_list.exit, label %bb.i, !dbg !2395

free_linked_list.exit:                            ; preds = %bb5.i3
  %156 = getelementptr inbounds %struct.commonio_db* %db, i64 0, i32 4, !dbg !2404
  store %struct.commonio_entry* null, %struct.commonio_entry** %156, align 8, !dbg !2404
  %157 = icmp eq i32 %errors.3, 0, !dbg !2320
  %158 = zext i1 %157 to i32, !dbg !2320
  ret i32 %158, !dbg !2320
}

define internal fastcc %struct.commonio_entry* @next_entry_by_name(%struct.commonio_db* nocapture %db, %struct.commonio_entry* %pos, i8* %name) nounwind {
entry:
  %0 = icmp eq %struct.commonio_entry* %pos, null, !dbg !2405
  br i1 %0, label %return, label %bb1, !dbg !2405

bb1:                                              ; preds = %entry
  %1 = getelementptr inbounds %struct.commonio_db* %db, i64 0, i32 1, !dbg !2410
  br label %bb5, !dbg !2411

bb2:                                              ; preds = %bb5
  %2 = getelementptr inbounds %struct.commonio_entry* %storemerge, i64 0, i32 1, !dbg !2412
  %3 = load i8** %2, align 8, !dbg !2412
  %4 = icmp eq i8* %3, null, !dbg !2410
  br i1 %4, label %bb4, label %bb3, !dbg !2410

bb3:                                              ; preds = %bb2
  %5 = load %struct.commonio_ops** %1, align 8, !dbg !2410
  %6 = getelementptr inbounds %struct.commonio_ops* %5, i64 0, i32 2, !dbg !2410
  %7 = load i8* (i8*)** %6, align 8, !dbg !2410
  %8 = call i8* %7(i8* %3) nounwind, !dbg !2410
  %9 = call i32 @strcmp(i8* %8, i8* %name) nounwind readonly, !dbg !2410
  %10 = icmp eq i32 %9, 0, !dbg !2410
  br i1 %10, label %return, label %bb4, !dbg !2410

bb4:                                              ; preds = %bb3, %bb2
  %11 = getelementptr inbounds %struct.commonio_entry* %storemerge, i64 0, i32 3, !dbg !2411
  %12 = load %struct.commonio_entry** %11, align 8, !dbg !2411
  br label %bb5, !dbg !2411

bb5:                                              ; preds = %bb4, %bb1
  %storemerge = phi %struct.commonio_entry* [ %pos, %bb1 ], [ %12, %bb4 ]
  %13 = icmp eq %struct.commonio_entry* %storemerge, null, !dbg !2411
  br i1 %13, label %return, label %bb2, !dbg !2411

return:                                           ; preds = %bb5, %bb3, %entry
  %storemerge1 = phi %struct.commonio_entry* [ null, %entry ], [ %storemerge, %bb3 ], [ %storemerge, %bb5 ]
  ret %struct.commonio_entry* %storemerge1, !dbg !2413
}

define internal fastcc i32 @commonio_update(%struct.commonio_db* %db, i8* %eptr) nounwind {
entry:
  %0 = getelementptr inbounds %struct.commonio_db* %db, i64 0, i32 6, !dbg !2414
  %1 = load i8* %0, align 8, !dbg !2414
  %.lobit = and i8 %1, 2
  %toBool3 = icmp eq i8 %.lobit, 0
  br i1 %toBool3, label %bb5, label %bb, !dbg !2414

bb:                                               ; preds = %entry
  %2 = and i8 %1, 8
  %toBool4 = icmp eq i8 %2, 0, !dbg !2414
  br i1 %toBool4, label %bb6, label %bb5, !dbg !2414

bb5:                                              ; preds = %bb, %entry
  %3 = call i32* @__errno_location() nounwind readnone, !dbg !2419
  store i32 22, i32* %3, align 4, !dbg !2419
  ret i32 0, !dbg !2420

bb6:                                              ; preds = %bb
  %4 = getelementptr inbounds %struct.commonio_db* %db, i64 0, i32 1, !dbg !2421
  %5 = load %struct.commonio_ops** %4, align 8, !dbg !2421
  %6 = getelementptr inbounds %struct.commonio_ops* %5, i64 0, i32 0, !dbg !2421
  %7 = load i8* (i8*)** %6, align 8, !dbg !2421
  %8 = call i8* %7(i8* %eptr) nounwind, !dbg !2421
  %9 = icmp eq i8* %8, null, !dbg !2422
  br i1 %9, label %bb7, label %bb8, !dbg !2422

bb7:                                              ; preds = %bb6
  %10 = call i32* @__errno_location() nounwind readnone, !dbg !2423
  store i32 12, i32* %10, align 4, !dbg !2423
  ret i32 0, !dbg !2420

bb8:                                              ; preds = %bb6
  %11 = load %struct.commonio_ops** %4, align 8, !dbg !2424
  %12 = getelementptr inbounds %struct.commonio_ops* %11, i64 0, i32 2, !dbg !2424
  %13 = load i8* (i8*)** %12, align 8, !dbg !2424
  %14 = call i8* %13(i8* %eptr) nounwind, !dbg !2424
  %15 = getelementptr inbounds %struct.commonio_db* %db, i64 0, i32 3, !dbg !2425
  %16 = load %struct.commonio_entry** %15, align 8, !dbg !2425
  %17 = icmp eq %struct.commonio_entry* %16, null, !dbg !2426
  br i1 %17, label %bb12, label %bb5.i6, !dbg !2426

bb2.i2:                                           ; preds = %bb5.i6
  %18 = getelementptr inbounds %struct.commonio_entry* %storemerge.i5, i64 0, i32 1, !dbg !2427
  %19 = load i8** %18, align 8, !dbg !2427
  %20 = icmp eq i8* %19, null, !dbg !2428
  br i1 %20, label %bb4.i4, label %bb3.i3, !dbg !2428

bb3.i3:                                           ; preds = %bb2.i2
  %21 = load %struct.commonio_ops** %4, align 8, !dbg !2428
  %22 = getelementptr inbounds %struct.commonio_ops* %21, i64 0, i32 2, !dbg !2428
  %23 = load i8* (i8*)** %22, align 8, !dbg !2428
  %24 = call i8* %23(i8* %19) nounwind, !dbg !2428
  %25 = call i32 @strcmp(i8* %24, i8* %14) nounwind readonly, !dbg !2428
  %26 = icmp eq i32 %25, 0, !dbg !2428
  br i1 %26, label %bb9, label %bb4.i4, !dbg !2428

bb4.i4:                                           ; preds = %bb3.i3, %bb2.i2
  %27 = getelementptr inbounds %struct.commonio_entry* %storemerge.i5, i64 0, i32 3, !dbg !2429
  %28 = load %struct.commonio_entry** %27, align 8, !dbg !2429
  br label %bb5.i6, !dbg !2429

bb5.i6:                                           ; preds = %bb4.i4, %bb8
  %storemerge.i5 = phi %struct.commonio_entry* [ %28, %bb4.i4 ], [ %16, %bb8 ]
  %29 = icmp eq %struct.commonio_entry* %storemerge.i5, null, !dbg !2429
  br i1 %29, label %bb12, label %bb2.i2, !dbg !2429

bb9:                                              ; preds = %bb3.i3
  %30 = load %struct.commonio_ops** %4, align 8, !dbg !2430
  %31 = getelementptr inbounds %struct.commonio_ops* %30, i64 0, i32 2, !dbg !2430
  %32 = load i8* (i8*)** %31, align 8, !dbg !2430
  %33 = call i8* %32(i8* %eptr) nounwind, !dbg !2430
  %34 = getelementptr inbounds %struct.commonio_entry* %storemerge.i5, i64 0, i32 3, !dbg !2430
  %35 = load %struct.commonio_entry** %34, align 8, !dbg !2430
  %36 = icmp eq %struct.commonio_entry* %35, null, !dbg !2431
  br i1 %36, label %bb11, label %bb5.i13, !dbg !2431

bb2.i9:                                           ; preds = %bb5.i13
  %37 = getelementptr inbounds %struct.commonio_entry* %storemerge.i12, i64 0, i32 1, !dbg !2432
  %38 = load i8** %37, align 8, !dbg !2432
  %39 = icmp eq i8* %38, null, !dbg !2433
  br i1 %39, label %bb4.i11, label %bb3.i10, !dbg !2433

bb3.i10:                                          ; preds = %bb2.i9
  %40 = load %struct.commonio_ops** %4, align 8, !dbg !2433
  %41 = getelementptr inbounds %struct.commonio_ops* %40, i64 0, i32 2, !dbg !2433
  %42 = load i8* (i8*)** %41, align 8, !dbg !2433
  %43 = call i8* %42(i8* %38) nounwind, !dbg !2433
  %44 = call i32 @strcmp(i8* %43, i8* %33) nounwind readonly, !dbg !2433
  %45 = icmp eq i32 %44, 0, !dbg !2433
  br i1 %45, label %bb10, label %bb4.i11, !dbg !2433

bb4.i11:                                          ; preds = %bb3.i10, %bb2.i9
  %46 = getelementptr inbounds %struct.commonio_entry* %storemerge.i12, i64 0, i32 3, !dbg !2434
  %47 = load %struct.commonio_entry** %46, align 8, !dbg !2434
  br label %bb5.i13, !dbg !2434

bb5.i13:                                          ; preds = %bb4.i11, %bb9
  %storemerge.i12 = phi %struct.commonio_entry* [ %47, %bb4.i11 ], [ %35, %bb9 ]
  %48 = icmp eq %struct.commonio_entry* %storemerge.i12, null, !dbg !2434
  br i1 %48, label %bb11, label %bb2.i9, !dbg !2434

bb10:                                             ; preds = %bb3.i10
  %49 = getelementptr inbounds %struct.commonio_db* %db, i64 0, i32 0, i64 0
  %50 = load %struct.commonio_ops** %4, align 8, !dbg !2435
  %51 = getelementptr inbounds %struct.commonio_ops* %50, i64 0, i32 2, !dbg !2435
  %52 = load i8* (i8*)** %51, align 8, !dbg !2435
  %53 = call i8* %52(i8* %eptr) nounwind, !dbg !2435
  %54 = load %struct.FILE** @stderr, align 8, !dbg !2435
  %55 = call i32 (%struct.FILE*, i8*, ...)* @fprintf(%struct.FILE* noalias %54, i8* noalias getelementptr inbounds ([72 x i8]* @.str21291, i64 0, i64 0), i8* %53, i8* %49) nounwind, !dbg !2435
  ret i32 0, !dbg !2420

bb11:                                             ; preds = %bb5.i13, %bb9
  %56 = load %struct.commonio_ops** %4, align 8, !dbg !2436
  %57 = getelementptr inbounds %struct.commonio_ops* %56, i64 0, i32 1, !dbg !2436
  %58 = load void (i8*)** %57, align 8, !dbg !2436
  %59 = load i8** %18, align 8, !dbg !2436
  call void %58(i8* %59) nounwind, !dbg !2436
  store i8* %8, i8** %18, align 8, !dbg !2437
  %60 = getelementptr inbounds %struct.commonio_entry* %storemerge.i5, i64 0, i32 4, !dbg !2438
  %61 = load i8* %60, align 8, !dbg !2438
  %62 = or i8 %61, 1, !dbg !2438
  store i8 %62, i8* %60, align 8, !dbg !2438
  %63 = getelementptr inbounds %struct.commonio_db* %db, i64 0, i32 5, !dbg !2439
  store %struct.commonio_entry* %storemerge.i5, %struct.commonio_entry** %63, align 8, !dbg !2439
  %64 = load i8* %0, align 8, !dbg !2440
  %65 = or i8 %64, 1, !dbg !2440
  store i8 %65, i8* %0, align 8, !dbg !2440
  ret i32 1, !dbg !2420

bb12:                                             ; preds = %bb5.i6, %bb8
  %66 = call noalias i8* @malloc(i64 40) nounwind, !dbg !2441
  %67 = bitcast i8* %66 to %struct.commonio_entry*, !dbg !2441
  %68 = icmp eq i8* %66, null
  br i1 %68, label %bb13, label %bb14, !dbg !2442

bb13:                                             ; preds = %bb12
  %69 = load %struct.commonio_ops** %4, align 8, !dbg !2443
  %70 = getelementptr inbounds %struct.commonio_ops* %69, i64 0, i32 1, !dbg !2443
  %71 = load void (i8*)** %70, align 8, !dbg !2443
  call void %71(i8* %8) nounwind, !dbg !2443
  %72 = call i32* @__errno_location() nounwind readnone, !dbg !2444
  store i32 12, i32* %72, align 4, !dbg !2444
  ret i32 0, !dbg !2420

bb14:                                             ; preds = %bb12
  %73 = getelementptr inbounds i8* %66, i64 8
  %74 = bitcast i8* %73 to i8**
  store i8* %8, i8** %74, align 8, !dbg !2445
  %75 = bitcast i8* %66 to i8**
  store i8* null, i8** %75, align 8, !dbg !2446
  %76 = getelementptr inbounds i8* %66, i64 32
  store i8 -1, i8* %76, align 8, !dbg !2447
  br label %bb9.i, !dbg !2448

bb.i:                                             ; preds = %bb9.i
  %77 = getelementptr inbounds %struct.commonio_entry* %storemerge.i, i64 0, i32 1, !dbg !2452
  %78 = load i8** %77, align 8, !dbg !2452
  %79 = icmp eq i8* %78, null, !dbg !2452
  br i1 %79, label %bb2.i, label %bb1.i, !dbg !2452

bb1.i:                                            ; preds = %bb.i
  %80 = load %struct.commonio_ops** %4, align 8, !dbg !2452
  %81 = getelementptr inbounds %struct.commonio_ops* %80, i64 0, i32 2, !dbg !2452
  %82 = load i8* (i8*)** %81, align 8, !dbg !2452
  %83 = call i8* %82(i8* %78) nounwind, !dbg !2452
  br label %bb3.i, !dbg !2452

bb2.i:                                            ; preds = %bb.i
  %84 = getelementptr inbounds %struct.commonio_entry* %storemerge.i, i64 0, i32 0, !dbg !2452
  %85 = load i8** %84, align 8, !dbg !2452
  br label %bb3.i, !dbg !2452

bb3.i:                                            ; preds = %bb2.i, %bb1.i
  %storemerge1.i = phi i8* [ %85, %bb2.i ], [ %83, %bb1.i ]
  %86 = load i8* %storemerge1.i, align 1, !dbg !2453
  %Pivot = icmp slt i8 %86, 45
  br i1 %Pivot, label %LeafBlock, label %LeafBlock1

LeafBlock1:                                       ; preds = %bb3.i
  %SwitchLeaf2 = icmp eq i8 %86, 45
  br i1 %SwitchLeaf2, label %bb4.i, label %bb8.i

LeafBlock:                                        ; preds = %bb3.i
  %SwitchLeaf = icmp eq i8 %86, 43
  br i1 %SwitchLeaf, label %bb4.i, label %bb8.i

bb4.i:                                            ; preds = %LeafBlock, %LeafBlock1
  %87 = getelementptr inbounds i8* %66, i64 24
  %88 = bitcast i8* %87 to %struct.commonio_entry**
  store %struct.commonio_entry* %storemerge.i, %struct.commonio_entry** %88, align 8, !dbg !2454
  %89 = getelementptr inbounds %struct.commonio_entry* %storemerge.i, i64 0, i32 2, !dbg !2455
  %90 = load %struct.commonio_entry** %89, align 8, !dbg !2455
  %91 = getelementptr inbounds i8* %66, i64 16
  %92 = bitcast i8* %91 to %struct.commonio_entry**
  store %struct.commonio_entry* %90, %struct.commonio_entry** %92, align 8, !dbg !2455
  %93 = load %struct.commonio_entry** %89, align 8, !dbg !2456
  %94 = icmp eq %struct.commonio_entry* %93, null, !dbg !2456
  br i1 %94, label %bb6.i, label %bb5.i, !dbg !2456

bb5.i:                                            ; preds = %bb4.i
  %95 = getelementptr inbounds %struct.commonio_entry* %93, i64 0, i32 3, !dbg !2457
  store %struct.commonio_entry* %67, %struct.commonio_entry** %95, align 8, !dbg !2457
  br label %bb7.i, !dbg !2457

bb6.i:                                            ; preds = %bb4.i
  store %struct.commonio_entry* %67, %struct.commonio_entry** %15, align 8, !dbg !2458
  br label %bb7.i, !dbg !2458

bb7.i:                                            ; preds = %bb6.i, %bb5.i
  store %struct.commonio_entry* %67, %struct.commonio_entry** %89, align 8, !dbg !2459
  br label %add_one_entry_nis.exit, !dbg !2459

bb8.i:                                            ; preds = %LeafBlock, %LeafBlock1
  %96 = getelementptr inbounds %struct.commonio_entry* %storemerge.i, i64 0, i32 3, !dbg !2448
  br label %bb9.i, !dbg !2448

bb9.i:                                            ; preds = %bb8.i, %bb14
  %storemerge.in.i = phi %struct.commonio_entry** [ %15, %bb14 ], [ %96, %bb8.i ]
  %storemerge.i = load %struct.commonio_entry** %storemerge.in.i, align 8
  %97 = icmp eq %struct.commonio_entry* %storemerge.i, null, !dbg !2448
  br i1 %97, label %bb10.i, label %bb.i, !dbg !2448

bb10.i:                                           ; preds = %bb9.i
  %98 = getelementptr inbounds i8* %66, i64 24
  %99 = bitcast i8* %98 to %struct.commonio_entry**
  store %struct.commonio_entry* null, %struct.commonio_entry** %99, align 8, !dbg !2460
  %100 = getelementptr inbounds %struct.commonio_db* %db, i64 0, i32 4, !dbg !2462
  %101 = load %struct.commonio_entry** %100, align 8, !dbg !2462
  %102 = getelementptr inbounds i8* %66, i64 16
  %103 = bitcast i8* %102 to %struct.commonio_entry**
  store %struct.commonio_entry* %101, %struct.commonio_entry** %103, align 8, !dbg !2462
  %104 = load %struct.commonio_entry** %15, align 8, !dbg !2463
  %105 = icmp eq %struct.commonio_entry* %104, null, !dbg !2463
  br i1 %105, label %bb.i2.i, label %bb1.i3.i, !dbg !2463

bb.i2.i:                                          ; preds = %bb10.i
  store %struct.commonio_entry* %67, %struct.commonio_entry** %15, align 8, !dbg !2464
  br label %bb1.i3.i, !dbg !2464

bb1.i3.i:                                         ; preds = %bb.i2.i, %bb10.i
  %106 = icmp eq %struct.commonio_entry* %101, null, !dbg !2465
  br i1 %106, label %add_one_entry.exit.i, label %bb2.i4.i, !dbg !2465

bb2.i4.i:                                         ; preds = %bb1.i3.i
  %107 = getelementptr inbounds %struct.commonio_entry* %101, i64 0, i32 3, !dbg !2466
  store %struct.commonio_entry* %67, %struct.commonio_entry** %107, align 8, !dbg !2466
  br label %add_one_entry.exit.i, !dbg !2466

add_one_entry.exit.i:                             ; preds = %bb2.i4.i, %bb1.i3.i
  store %struct.commonio_entry* %67, %struct.commonio_entry** %100, align 8, !dbg !2467
  br label %add_one_entry_nis.exit, !dbg !2461

add_one_entry_nis.exit:                           ; preds = %add_one_entry.exit.i, %bb7.i
  %108 = load i8* %0, align 8, !dbg !2468
  %109 = or i8 %108, 1, !dbg !2468
  store i8 %109, i8* %0, align 8, !dbg !2468
  ret i32 1, !dbg !2420
}

define internal i8* @fgetsx(i8* %buf, i32 %cnt, %struct.FILE* %f) nounwind {
entry:
  br label %bb7.outer, !dbg !2469

bb:                                               ; preds = %bb7
  %0 = call i8* @fgets(i8* noalias %cp.0.ph, i32 %cnt_addr.0, %struct.FILE* noalias %f) nounwind, !dbg !2474
  %1 = icmp eq i8* %0, %cp.0.ph, !dbg !2474
  br i1 %1, label %bb3, label %bb1, !dbg !2474

bb1:                                              ; preds = %bb
  %2 = icmp eq i8* %cp.0.ph, %buf, !dbg !2475
  %retval = select i1 %2, i8* null, i8* %buf
  ret i8* %retval

bb3:                                              ; preds = %bb
  %3 = call i8* @strrchr(i8* %cp.0.ph, i32 92) nounwind readonly, !dbg !2476
  %4 = icmp eq i8* %3, null, !dbg !2477
  br i1 %4, label %bb8, label %bb4, !dbg !2477

bb4:                                              ; preds = %bb3
  %5 = getelementptr inbounds i8* %3, i64 1, !dbg !2477
  %6 = load i8* %5, align 1, !dbg !2477
  %7 = icmp eq i8 %6, 10, !dbg !2477
  br i1 %7, label %bb5, label %bb8, !dbg !2477

bb5:                                              ; preds = %bb4
  %8 = ptrtoint i8* %3 to i64, !dbg !2478
  %9 = trunc i64 %8 to i32, !dbg !2478
  %10 = sub i32 %14, %9, !dbg !2478
  %11 = add i32 %cnt_addr.0, %10
  %12 = icmp sgt i32 %11, 0, !dbg !2479
  br i1 %12, label %bb6, label %bb7, !dbg !2479

bb6:                                              ; preds = %bb5
  store i8 0, i8* %3, align 1, !dbg !2480
  br label %bb7.outer, !dbg !2480

bb7.outer:                                        ; preds = %bb6, %entry
  %cnt_addr.0.ph = phi i32 [ %cnt, %entry ], [ %11, %bb6 ]
  %cp.0.ph = phi i8* [ %buf, %entry ], [ %3, %bb6 ]
  %13 = ptrtoint i8* %cp.0.ph to i64, !dbg !2478
  %14 = trunc i64 %13 to i32, !dbg !2478
  br label %bb7

bb7:                                              ; preds = %bb7.outer, %bb5
  %cnt_addr.0 = phi i32 [ %11, %bb5 ], [ %cnt_addr.0.ph, %bb7.outer ]
  %15 = icmp sgt i32 %cnt_addr.0, 0, !dbg !2481
  br i1 %15, label %bb, label %bb8, !dbg !2481

bb8:                                              ; preds = %bb7, %bb4, %bb3
  ret i8* %buf, !dbg !2482
}

define internal i32 @fputsx(i8* nocapture %s, %struct.FILE* %stream) nounwind {
entry:
  br label %bb3, !dbg !2483

bb:                                               ; preds = %bb3
  %0 = sext i8 %4 to i32, !dbg !2484
  %1 = call i32 @_IO_putc(i32 %0, %struct.FILE* %stream) nounwind, !dbg !2484
  %2 = icmp eq i32 %1, -1, !dbg !2484
  br i1 %2, label %return, label %bb2, !dbg !2484

bb2:                                              ; preds = %bb
  %3 = getelementptr inbounds i8* %s_addr.0, i64 1, !dbg !2483
  br label %bb3, !dbg !2483

bb3:                                              ; preds = %bb2, %entry
  %s_addr.0 = phi i8* [ %s, %entry ], [ %3, %bb2 ]
  %4 = load i8* %s_addr.0, align 1, !dbg !2483
  %5 = icmp eq i8 %4, 0, !dbg !2483
  br i1 %5, label %return, label %bb, !dbg !2483

return:                                           ; preds = %bb3, %bb
  %storemerge = phi i32 [ -1, %bb ], [ 0, %bb3 ]
  ret i32 %storemerge, !dbg !2485
}

declare i64 @strtol(i8* noalias, i8** noalias, i32) nounwind

declare i64 @strtoll(i8* noalias, i8** noalias, i32) nounwind

define internal fastcc i8** @build_list(i8* %s, i8*** nocapture %list, i64* nocapture %nlist) nounwind {
entry:
  %0 = load i64* %nlist, align 8, !dbg !2486
  br label %bb3.outer, !dbg !2486

bb:                                               ; preds = %bb4
  %1 = load i8*** %list, align 8, !dbg !2493
  %2 = bitcast i8** %1 to i8*, !dbg !2493
  %3 = call i8* @realloc(i8* %2, i64 %13) nounwind, !dbg !2493
  %4 = icmp eq i8* %3, null
  br i1 %4, label %bb3, label %bb1, !dbg !2494

bb1:                                              ; preds = %bb
  %5 = bitcast i8* %3 to i8**, !dbg !2493
  %6 = getelementptr inbounds i8** %5, i64 %nelem.0.ph, !dbg !2495
  store i8* %s_addr.0.ph, i8** %6, align 1, !dbg !2495
  %7 = add i64 %nelem.0.ph, 1, !dbg !2496
  store i8** %5, i8*** %list, align 8, !dbg !2497
  store i64 %7, i64* %nlist, align 8, !dbg !2498
  %8 = call i8* @strchr(i8* %s_addr.0.ph, i32 44) nounwind readonly, !dbg !2499
  %9 = icmp eq i8* %8, null, !dbg !2500
  br i1 %9, label %bb3.outer, label %bb2, !dbg !2500

bb2:                                              ; preds = %bb1
  store i8 0, i8* %8, align 1, !dbg !2501
  %10 = getelementptr inbounds i8* %8, i64 1, !dbg !2502
  br label %bb3.outer, !dbg !2502

bb3.outer:                                        ; preds = %bb2, %bb1, %entry
  %nelem.0.ph = phi i64 [ %0, %entry ], [ %7, %bb2 ], [ %7, %bb1 ]
  %s_addr.0.ph = phi i8* [ %s, %entry ], [ %10, %bb2 ], [ %8, %bb1 ]
  %11 = icmp eq i8* %s_addr.0.ph, null, !dbg !2503
  %12 = shl i64 %nelem.0.ph, 3
  %13 = add i64 %12, 8
  br label %bb3

bb3:                                              ; preds = %bb3.outer, %bb
  br i1 %11, label %bb5, label %bb4, !dbg !2503

bb4:                                              ; preds = %bb3
  %14 = load i8* %s_addr.0.ph, align 1, !dbg !2503
  %15 = icmp eq i8 %14, 0, !dbg !2503
  br i1 %15, label %bb5, label %bb, !dbg !2503

bb5:                                              ; preds = %bb4, %bb3
  %16 = load i8*** %list, align 8, !dbg !2504
  %17 = bitcast i8** %16 to i8*, !dbg !2504
  %18 = call i8* @realloc(i8* %17, i64 %13) nounwind, !dbg !2504
  %19 = bitcast i8* %18 to i8**, !dbg !2504
  %20 = icmp eq i8* %18, null
  br i1 %20, label %return, label %bb6, !dbg !2505

bb6:                                              ; preds = %bb5
  %21 = getelementptr inbounds i8** %19, i64 %nelem.0.ph, !dbg !2506
  store i8* null, i8** %21, align 1, !dbg !2506
  store i8** %19, i8*** %list, align 8, !dbg !2507
  ret i8** %19, !dbg !2508

return:                                           ; preds = %bb5
  ret i8** %19, !dbg !2508
}

declare i32 @fork() nounwind

declare i32 @execve(i8*, i8**, i8**) nounwind

declare i32 @waitpid(i32, i32*, i32)

declare i8* @memset(i8*, i32, i64)

define internal fastcc void @exchange(i8** nocapture %argv, %struct._getopt_data* nocapture %d) nounwind {
entry:
  %0 = getelementptr inbounds %struct._getopt_data* %d, i64 0, i32 8
  %1 = load i32* %0, align 8
  %2 = getelementptr inbounds %struct._getopt_data* %d, i64 0, i32 9
  %3 = load i32* %2, align 4
  %4 = getelementptr inbounds %struct._getopt_data* %d, i64 0, i32 0
  %5 = load i32* %4, align 8
  br label %bb11.outer

bb:                                               ; preds = %bb11
  %6 = sub nsw i32 %top.0, %3
  %7 = icmp sgt i32 %6, %32
  br i1 %7, label %bb1, label %bb9

bb1:                                              ; preds = %bb
  %8 = add i32 %top.0, %33
  br label %bb3

bb2:                                              ; preds = %bb3
  %9 = add nsw i32 %bottom.0.ph, %storemerge1
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds i8** %argv, i64 %10
  %12 = load i8** %11, align 1
  %13 = add nsw i32 %8, %storemerge1
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds i8** %argv, i64 %14
  %16 = load i8** %15, align 1
  store i8* %16, i8** %11, align 1
  store i8* %12, i8** %15, align 1
  %17 = add nsw i32 %storemerge1, 1
  br label %bb3

bb3:                                              ; preds = %bb2, %bb1
  %storemerge1 = phi i32 [ 0, %bb1 ], [ %17, %bb2 ]
  %18 = icmp slt i32 %storemerge1, %32
  br i1 %18, label %bb2, label %bb4

bb4:                                              ; preds = %bb3
  %19 = sub nsw i32 %top.0, %32
  br label %bb11

bb8:                                              ; preds = %bb9
  %20 = add nsw i32 %bottom.0.ph, %storemerge
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds i8** %argv, i64 %21
  %23 = load i8** %22, align 1
  %24 = add nsw i32 %3, %storemerge
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds i8** %argv, i64 %25
  %27 = load i8** %26, align 1
  store i8* %27, i8** %22, align 1
  store i8* %23, i8** %26, align 1
  %28 = add nsw i32 %storemerge, 1
  br label %bb9

bb9:                                              ; preds = %bb8, %bb
  %storemerge = phi i32 [ %28, %bb8 ], [ 0, %bb ]
  %29 = icmp slt i32 %storemerge, %6
  br i1 %29, label %bb8, label %bb10

bb10:                                             ; preds = %bb9
  %30 = add nsw i32 %bottom.0.ph, %6
  br label %bb11.outer

bb11.outer:                                       ; preds = %bb10, %entry
  %bottom.0.ph = phi i32 [ %1, %entry ], [ %30, %bb10 ]
  %top.0.ph = phi i32 [ %5, %entry ], [ %top.0, %bb10 ]
  %31 = icmp sgt i32 %3, %bottom.0.ph
  %32 = sub nsw i32 %3, %bottom.0.ph
  %33 = sub nsw i32 %bottom.0.ph, %3
  br label %bb11

bb11:                                             ; preds = %bb11.outer, %bb4
  %top.0 = phi i32 [ %19, %bb4 ], [ %top.0.ph, %bb11.outer ]
  %34 = icmp sgt i32 %top.0, %3
  %or.cond = and i1 %34, %31
  br i1 %or.cond, label %bb, label %return

return:                                           ; preds = %bb11
  %35 = load i32* %0, align 8
  %36 = load i32* %4, align 8
  %37 = load i32* %2, align 4
  %38 = sub nsw i32 %36, %37
  %39 = add nsw i32 %35, %38
  store i32 %39, i32* %0, align 8
  store i32 %36, i32* %2, align 4
  ret void
}

declare i8* @getenv(i8*) nounwind

declare void @abort()

!llvm.dbg.gv = !{!0, !3, !4, !5, !6, !7, !8, !11, !12, !13, !14, !15, !39, !57, !82, !83, !86, !87, !91, !101, !104, !110, !121, !129, !137, !141, !145, !151, !155, !168, !172, !174, !273, !300, !310, !314, !406, !431, !434, !436, !441, !444, !445, !446, !460, !461, !514, !515, !516, !517, !526, !527, !544, !545, !547}

!0 = metadata !{i32 458804, i32 0, metadata !1, metadata !"aflg", metadata !"aflg", metadata !"", metadata !1, i32 68, metadata !2, i1 true, i1 true, null}
!1 = metadata !{i32 458769, i32 0, i32 1, metadata !"gpasswd.c", metadata !"/home/heming/rcs/direct-sym/apps/shadow/shadow-4.1.5/obj/src/../../src", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.7)", i1 true, i1 false, metadata !"", i32 0}
!2 = metadata !{i32 458788, metadata !1, metadata !"_Bool", metadata !1, i32 0, i64 8, i64 8, i64 0, i32 0, i32 2}
!3 = metadata !{i32 458804, i32 0, metadata !1, metadata !"Aflg", metadata !"Aflg", metadata !"", metadata !1, i32 69, metadata !2, i1 true, i1 true, null}
!4 = metadata !{i32 458804, i32 0, metadata !1, metadata !"dflg", metadata !"dflg", metadata !"", metadata !1, i32 70, metadata !2, i1 true, i1 true, null}
!5 = metadata !{i32 458804, i32 0, metadata !1, metadata !"Mflg", metadata !"Mflg", metadata !"", metadata !1, i32 71, metadata !2, i1 true, i1 true, null}
!6 = metadata !{i32 458804, i32 0, metadata !1, metadata !"rflg", metadata !"rflg", metadata !"", metadata !1, i32 72, metadata !2, i1 true, i1 true, null}
!7 = metadata !{i32 458804, i32 0, metadata !1, metadata !"Rflg", metadata !"Rflg", metadata !"", metadata !1, i32 73, metadata !2, i1 true, i1 true, null}
!8 = metadata !{i32 458804, i32 0, metadata !1, metadata !"group", metadata !"group", metadata !"", metadata !1, i32 75, metadata !9, i1 true, i1 true, null}
!9 = metadata !{i32 458767, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !10}
!10 = metadata !{i32 458788, metadata !1, metadata !"char", metadata !1, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6}
!11 = metadata !{i32 458804, i32 0, metadata !1, metadata !"user", metadata !"user", metadata !"", metadata !1, i32 77, metadata !9, i1 true, i1 true, null}
!12 = metadata !{i32 458804, i32 0, metadata !1, metadata !"members", metadata !"members", metadata !"", metadata !1, i32 79, metadata !9, i1 true, i1 true, null}
!13 = metadata !{i32 458804, i32 0, metadata !1, metadata !"admins", metadata !"admins", metadata !"", metadata !1, i32 82, metadata !9, i1 true, i1 true, null}
!14 = metadata !{i32 458804, i32 0, metadata !1, metadata !"myname", metadata !"myname", metadata !"", metadata !1, i32 85, metadata !9, i1 true, i1 true, null}
!15 = metadata !{i32 458804, i32 0, metadata !16, metadata !"sgtty", metadata !"sgtty", metadata !"", metadata !1, i32 163, metadata !20, i1 true, i1 true, null}
!16 = metadata !{i32 458798, i32 0, metadata !1, metadata !"catch_signals", metadata !"catch_signals", metadata !"catch_signals", metadata !1, i32 162, metadata !17, i1 true, i1 true, i32 0, i32 0, null, i1 false}
!17 = metadata !{i32 458773, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !18, i32 0, null}
!18 = metadata !{null, metadata !19}
!19 = metadata !{i32 458788, metadata !1, metadata !"int", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5}
!20 = metadata !{i32 458771, metadata !1, metadata !"termios", metadata !21, i32 31, i64 480, i64 32, i64 0, i32 0, null, metadata !22, i32 0, null}
!21 = metadata !{i32 458769, i32 0, i32 1, metadata !"termios.h", metadata !"/usr/include/bits", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.7)", i1 false, i1 false, metadata !"", i32 0}
!22 = metadata !{metadata !23, metadata !26, metadata !27, metadata !28, metadata !29, metadata !32, metadata !36, metadata !38}
!23 = metadata !{i32 458765, metadata !20, metadata !"c_iflag", metadata !21, i32 32, i64 32, i64 32, i64 0, i32 0, metadata !24}
!24 = metadata !{i32 458774, metadata !1, metadata !"tcflag_t", metadata !21, i32 27, i64 0, i64 0, i64 0, i32 0, metadata !25}
!25 = metadata !{i32 458788, metadata !1, metadata !"unsigned int", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, i32 7}
!26 = metadata !{i32 458765, metadata !20, metadata !"c_oflag", metadata !21, i32 33, i64 32, i64 32, i64 32, i32 0, metadata !24}
!27 = metadata !{i32 458765, metadata !20, metadata !"c_cflag", metadata !21, i32 34, i64 32, i64 32, i64 64, i32 0, metadata !24}
!28 = metadata !{i32 458765, metadata !20, metadata !"c_lflag", metadata !21, i32 35, i64 32, i64 32, i64 96, i32 0, metadata !24}
!29 = metadata !{i32 458765, metadata !20, metadata !"c_line", metadata !21, i32 36, i64 8, i64 8, i64 128, i32 0, metadata !30}
!30 = metadata !{i32 458774, metadata !1, metadata !"cc_t", metadata !21, i32 25, i64 0, i64 0, i64 0, i32 0, metadata !31}
!31 = metadata !{i32 458788, metadata !1, metadata !"unsigned char", metadata !1, i32 0, i64 8, i64 8, i64 0, i32 0, i32 8}
!32 = metadata !{i32 458765, metadata !20, metadata !"c_cc", metadata !21, i32 37, i64 256, i64 8, i64 136, i32 0, metadata !33}
!33 = metadata !{i32 458753, metadata !1, metadata !"", metadata !1, i32 0, i64 256, i64 8, i64 0, i32 0, metadata !30, metadata !34, i32 0, null}
!34 = metadata !{metadata !35}
!35 = metadata !{i32 458785, i64 0, i64 31}
!36 = metadata !{i32 458765, metadata !20, metadata !"c_ispeed", metadata !21, i32 38, i64 32, i64 32, i64 416, i32 0, metadata !37}
!37 = metadata !{i32 458774, metadata !1, metadata !"speed_t", metadata !21, i32 26, i64 0, i64 0, i64 0, i32 0, metadata !25}
!38 = metadata !{i32 458765, metadata !20, metadata !"c_ospeed", metadata !21, i32 39, i64 32, i64 32, i64 448, i32 0, metadata !37}
!39 = metadata !{i32 458804, i32 0, metadata !40, metadata !"long_options", metadata !"long_options", metadata !"", metadata !1, i32 232, metadata !44, i1 true, i1 true, null}
!40 = metadata !{i32 458798, i32 0, metadata !1, metadata !"process_flags", metadata !"process_flags", metadata !"process_flags", metadata !1, i32 230, metadata !41, i1 true, i1 true, i32 0, i32 0, null, i1 false}
!41 = metadata !{i32 458773, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !42, i32 0, null}
!42 = metadata !{null, metadata !19, metadata !43}
!43 = metadata !{i32 458767, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !9}
!44 = metadata !{i32 458753, metadata !1, metadata !"", metadata !1, i32 0, i64 2304, i64 64, i64 0, i32 0, metadata !45, metadata !55, i32 0, null}
!45 = metadata !{i32 458771, metadata !1, metadata !"option", metadata !46, i32 107, i64 256, i64 64, i64 0, i32 0, null, metadata !47, i32 0, null}
!46 = metadata !{i32 458769, i32 0, i32 1, metadata !"getopt.h", metadata !"/usr/include", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.7)", i1 false, i1 false, metadata !"", i32 0}
!47 = metadata !{metadata !48, metadata !51, metadata !52, metadata !54}
!48 = metadata !{i32 458765, metadata !45, metadata !"name", metadata !46, i32 108, i64 64, i64 64, i64 0, i32 0, metadata !49}
!49 = metadata !{i32 458767, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !50}
!50 = metadata !{i32 458790, metadata !1, metadata !"", metadata !1, i32 0, i64 8, i64 8, i64 0, i32 0, metadata !10}
!51 = metadata !{i32 458765, metadata !45, metadata !"has_arg", metadata !46, i32 111, i64 32, i64 32, i64 64, i32 0, metadata !19}
!52 = metadata !{i32 458765, metadata !45, metadata !"flag", metadata !46, i32 112, i64 64, i64 64, i64 128, i32 0, metadata !53}
!53 = metadata !{i32 458767, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !19}
!54 = metadata !{i32 458765, metadata !45, metadata !"val", metadata !46, i32 113, i64 32, i64 32, i64 192, i32 0, metadata !19}
!55 = metadata !{metadata !56}
!56 = metadata !{i32 458785, i64 0, i64 8}
!57 = metadata !{i32 458804, i32 0, metadata !58, metadata !"pass", metadata !"pass", metadata !"", metadata !1, i32 899, metadata !79, i1 true, i1 true, null}
!58 = metadata !{i32 458798, i32 0, metadata !1, metadata !"change_passwd", metadata !"change_passwd", metadata !"change_passwd", metadata !1, i32 897, metadata !59, i1 true, i1 true, i32 0, i32 0, null, i1 false}
!59 = metadata !{i32 458773, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !60, i32 0, null}
!60 = metadata !{null, metadata !61, metadata !71}
!61 = metadata !{i32 458767, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !62}
!62 = metadata !{i32 458771, metadata !1, metadata !"group", metadata !63, i32 45, i64 256, i64 64, i64 0, i32 0, null, metadata !64, i32 0, null}
!63 = metadata !{i32 458769, i32 0, i32 1, metadata !"grp.h", metadata !"/usr/include", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.7)", i1 false, i1 false, metadata !"", i32 0}
!64 = metadata !{metadata !65, metadata !66, metadata !67, metadata !70}
!65 = metadata !{i32 458765, metadata !62, metadata !"gr_name", metadata !63, i32 46, i64 64, i64 64, i64 0, i32 0, metadata !9}
!66 = metadata !{i32 458765, metadata !62, metadata !"gr_passwd", metadata !63, i32 47, i64 64, i64 64, i64 64, i32 0, metadata !9}
!67 = metadata !{i32 458765, metadata !62, metadata !"gr_gid", metadata !63, i32 48, i64 32, i64 32, i64 128, i32 0, metadata !68}
!68 = metadata !{i32 458774, metadata !1, metadata !"__gid_t", metadata !69, i32 136, i64 0, i64 0, i64 0, i32 0, metadata !25}
!69 = metadata !{i32 458769, i32 0, i32 1, metadata !"types.h", metadata !"/usr/include/bits", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.7)", i1 false, i1 false, metadata !"", i32 0}
!70 = metadata !{i32 458765, metadata !62, metadata !"gr_mem", metadata !63, i32 49, i64 64, i64 64, i64 192, i32 0, metadata !43}
!71 = metadata !{i32 458767, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !72}
!72 = metadata !{i32 458771, metadata !1, metadata !"sgrp", metadata !73, i32 43, i64 256, i64 64, i64 0, i32 0, null, metadata !74, i32 0, null}
!73 = metadata !{i32 458769, i32 0, i32 1, metadata !"gshadow_.h", metadata !"/home/heming/rcs/direct-sym/apps/shadow/shadow-4.1.5/obj/src/../../lib", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.7)", i1 false, i1 false, metadata !"", i32 0}
!74 = metadata !{metadata !75, metadata !76, metadata !77, metadata !78}
!75 = metadata !{i32 458765, metadata !72, metadata !"sg_name", metadata !73, i32 44, i64 64, i64 64, i64 0, i32 0, metadata !9}
!76 = metadata !{i32 458765, metadata !72, metadata !"sg_passwd", metadata !73, i32 45, i64 64, i64 64, i64 64, i32 0, metadata !9}
!77 = metadata !{i32 458765, metadata !72, metadata !"sg_adm", metadata !73, i32 46, i64 64, i64 64, i64 128, i32 0, metadata !43}
!78 = metadata !{i32 458765, metadata !72, metadata !"sg_mem", metadata !73, i32 47, i64 64, i64 64, i64 192, i32 0, metadata !43}
!79 = metadata !{i32 458753, metadata !1, metadata !"", metadata !1, i32 0, i64 65536, i64 8, i64 0, i32 0, metadata !10, metadata !80, i32 0, null}
!80 = metadata !{metadata !81}
!81 = metadata !{i32 458785, i64 0, i64 8191}
!82 = metadata !{i32 458804, i32 0, metadata !1, metadata !"is_shadowgrp", metadata !"is_shadowgrp", metadata !"", metadata !1, i32 64, metadata !2, i1 true, i1 true, null}
!83 = metadata !{i32 458804, i32 0, metadata !1, metadata !"bywho", metadata !"bywho", metadata !"", metadata !1, i32 87, metadata !84, i1 true, i1 true, null}
!84 = metadata !{i32 458774, metadata !1, metadata !"uid_t", metadata !85, i32 87, i64 0, i64 0, i64 0, i32 0, metadata !25}
!85 = metadata !{i32 458769, i32 0, i32 1, metadata !"types.h", metadata !"/usr/include/sys", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.7)", i1 false, i1 false, metadata !"", i32 0}
!86 = metadata !{i32 458804, i32 0, metadata !1, metadata !"Prog", metadata !"Prog", metadata !"", metadata !1, i32 59, metadata !49, i1 false, i1 true, null}
!87 = metadata !{i32 458804, i32 0, metadata !88, metadata !"cleanup_pid", metadata !"cleanup_pid", metadata !"", metadata !88, i32 46, metadata !89, i1 true, i1 true, null}
!88 = metadata !{i32 458769, i32 0, i32 1, metadata !"cleanup.c", metadata !"/home/heming/rcs/direct-sym/apps/shadow/shadow-4.1.5/obj/libmisc/../../libmisc", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.7)", i1 true, i1 false, metadata !"", i32 0}
!89 = metadata !{i32 458774, metadata !88, metadata !"pid_t", metadata !85, i32 99, i64 0, i64 0, i64 0, i32 0, metadata !90}
!90 = metadata !{i32 458788, metadata !88, metadata !"int", metadata !88, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5}
!91 = metadata !{i32 458804, i32 0, metadata !88, metadata !"cleanup_functions", metadata !"cleanup_functions", metadata !"", metadata !88, i32 44, metadata !92, i1 true, i1 true, null}
!92 = metadata !{i32 458753, metadata !88, metadata !"", metadata !88, i32 0, i64 640, i64 64, i64 0, i32 0, metadata !93, metadata !99, i32 0, null}
!93 = metadata !{i32 458774, metadata !88, metadata !"cleanup_function", metadata !94, i32 89, i64 0, i64 0, i64 0, i32 0, metadata !95}
!94 = metadata !{i32 458769, i32 0, i32 1, metadata !"prototypes.h", metadata !"/home/heming/rcs/direct-sym/apps/shadow/shadow-4.1.5/obj/libmisc/../../lib", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.7)", i1 false, i1 false, metadata !"", i32 0}
!95 = metadata !{i32 458767, metadata !88, metadata !"", metadata !88, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !96}
!96 = metadata !{i32 458773, metadata !88, metadata !"", metadata !88, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !97, i32 0, null}
!97 = metadata !{null, metadata !98}
!98 = metadata !{i32 458767, metadata !88, metadata !"", metadata !88, i32 0, i64 64, i64 64, i64 0, i32 0, null}
!99 = metadata !{metadata !100}
!100 = metadata !{i32 458785, i64 0, i64 9}
!101 = metadata !{i32 458804, i32 0, metadata !88, metadata !"cleanup_function_args", metadata !"cleanup_function_args", metadata !"", metadata !88, i32 45, metadata !102, i1 true, i1 true, null}
!102 = metadata !{i32 458753, metadata !88, metadata !"", metadata !88, i32 0, i64 640, i64 64, i64 0, i32 0, metadata !103, metadata !99, i32 0, null}
!103 = metadata !{i32 458774, metadata !88, metadata !"parg_t", metadata !88, i32 44, i64 0, i64 0, i64 0, i32 0, metadata !98}
!104 = metadata !{i32 458804, i32 0, metadata !105, metadata !"seeded", metadata !"seeded", metadata !"", metadata !106, i32 69, metadata !109, i1 true, i1 true, null}
!105 = metadata !{i32 458798, i32 0, metadata !106, metadata !"seedRNG", metadata !"seedRNG", metadata !"seedRNG", metadata !106, i32 67, metadata !107, i1 true, i1 true, i32 0, i32 0, null, i1 false}
!106 = metadata !{i32 458769, i32 0, i32 1, metadata !"salt.c", metadata !"/home/heming/rcs/direct-sym/apps/shadow/shadow-4.1.5/obj/libmisc/../../libmisc", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.7)", i1 true, i1 false, metadata !"", i32 0}
!107 = metadata !{i32 458773, metadata !106, metadata !"", metadata !106, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !108, i32 0, null}
!108 = metadata !{null}
!109 = metadata !{i32 458788, metadata !106, metadata !"int", metadata !106, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5}
!110 = metadata !{i32 458804, i32 0, metadata !111, metadata !"rounds_prefix", metadata !"rounds_prefix", metadata !"", metadata !106, i32 109, metadata !118, i1 true, i1 true, null}
!111 = metadata !{i32 458798, i32 0, metadata !106, metadata !"SHA_salt_rounds", metadata !"SHA_salt_rounds", metadata !"SHA_salt_rounds", metadata !106, i32 108, metadata !112, i1 true, i1 true, i32 0, i32 0, null, i1 false}
!112 = metadata !{i32 458773, metadata !106, metadata !"", metadata !106, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !113, i32 0, null}
!113 = metadata !{metadata !114, metadata !117}
!114 = metadata !{i32 458767, metadata !106, metadata !"", metadata !106, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !115}
!115 = metadata !{i32 458790, metadata !106, metadata !"", metadata !106, i32 0, i64 8, i64 8, i64 0, i32 0, metadata !116}
!116 = metadata !{i32 458788, metadata !106, metadata !"char", metadata !106, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6}
!117 = metadata !{i32 458767, metadata !106, metadata !"", metadata !106, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !109}
!118 = metadata !{i32 458753, metadata !106, metadata !"", metadata !106, i32 0, i64 144, i64 8, i64 0, i32 0, metadata !116, metadata !119, i32 0, null}
!119 = metadata !{metadata !120}
!120 = metadata !{i32 458785, i64 0, i64 17}
!121 = metadata !{i32 458804, i32 0, metadata !122, metadata !"salt", metadata !"salt", metadata !"", metadata !106, i32 168, metadata !128, i1 true, i1 true, null}
!122 = metadata !{i32 458798, i32 0, metadata !106, metadata !"gensalt", metadata !"gensalt", metadata !"gensalt", metadata !106, i32 167, metadata !123, i1 true, i1 true, i32 0, i32 0, null, i1 false}
!123 = metadata !{i32 458773, metadata !106, metadata !"", metadata !106, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !124, i32 0, null}
!124 = metadata !{metadata !114, metadata !125}
!125 = metadata !{i32 458774, metadata !106, metadata !"size_t", metadata !126, i32 214, i64 0, i64 0, i64 0, i32 0, metadata !127}
!126 = metadata !{i32 458769, i32 0, i32 1, metadata !"stddef.h", metadata !"/home/heming/rcs/llvm/install/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.2.1/include", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.7)", i1 false, i1 false, metadata !"", i32 0}
!127 = metadata !{i32 458788, metadata !106, metadata !"long unsigned int", metadata !106, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7}
!128 = metadata !{i32 458753, metadata !106, metadata !"", metadata !106, i32 0, i64 256, i64 8, i64 0, i32 0, metadata !116, metadata !34, i32 0, null}
!129 = metadata !{i32 458804, i32 0, metadata !130, metadata !"result", metadata !"result", metadata !"", metadata !106, i32 208, metadata !134, i1 true, i1 true, null}
!130 = metadata !{i32 458798, i32 0, metadata !106, metadata !"crypt_make_salt", metadata !"crypt_make_salt", metadata !"crypt_make_salt", metadata !106, i32 201, metadata !131, i1 false, i1 true, i32 0, i32 0, null, i1 false}
!131 = metadata !{i32 458773, metadata !106, metadata !"", metadata !106, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !132, i32 0, null}
!132 = metadata !{metadata !114, metadata !114, metadata !133}
!133 = metadata !{i32 458767, metadata !106, metadata !"", metadata !106, i32 0, i64 64, i64 64, i64 0, i32 0, null}
!134 = metadata !{i32 458753, metadata !106, metadata !"", metadata !106, i32 0, i64 320, i64 8, i64 0, i32 0, metadata !116, metadata !135, i32 0, null}
!135 = metadata !{metadata !136}
!136 = metadata !{i32 458785, i64 0, i64 39}
!137 = metadata !{i32 458804, i32 0, metadata !138, metadata !"newenvc", metadata !"newenvc", metadata !"", metadata !138, i32 49, metadata !139, i1 false, i1 true, null}
!138 = metadata !{i32 458769, i32 0, i32 1, metadata !"env.c", metadata !"/home/heming/rcs/direct-sym/apps/shadow/shadow-4.1.5/obj/libmisc/../../libmisc", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.7)", i1 true, i1 false, metadata !"", i32 0}
!139 = metadata !{i32 458774, metadata !138, metadata !"size_t", metadata !126, i32 214, i64 0, i64 0, i64 0, i32 0, metadata !140}
!140 = metadata !{i32 458788, metadata !138, metadata !"long unsigned int", metadata !138, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7}
!141 = metadata !{i32 458804, i32 0, metadata !138, metadata !"newenvp", metadata !"newenvp", metadata !"", metadata !138, i32 50, metadata !142, i1 false, i1 true, null}
!142 = metadata !{i32 458767, metadata !138, metadata !"", metadata !138, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !143}
!143 = metadata !{i32 458767, metadata !138, metadata !"", metadata !138, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !144}
!144 = metadata !{i32 458788, metadata !138, metadata !"char", metadata !138, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6}
!145 = metadata !{i32 458804, i32 0, metadata !138, metadata !"forbid", metadata !"forbid", metadata !"", metadata !138, i32 53, metadata !146, i1 true, i1 true, null}
!146 = metadata !{i32 458753, metadata !138, metadata !"", metadata !138, i32 0, i64 896, i64 64, i64 0, i32 0, metadata !147, metadata !149, i32 0, null}
!147 = metadata !{i32 458767, metadata !138, metadata !"", metadata !138, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !148}
!148 = metadata !{i32 458790, metadata !138, metadata !"", metadata !138, i32 0, i64 8, i64 8, i64 0, i32 0, metadata !144}
!149 = metadata !{metadata !150}
!150 = metadata !{i32 458785, i64 0, i64 13}
!151 = metadata !{i32 458804, i32 0, metadata !138, metadata !"noslash", metadata !"noslash", metadata !"", metadata !138, i32 72, metadata !152, i1 true, i1 true, null}
!152 = metadata !{i32 458753, metadata !138, metadata !"", metadata !138, i32 0, i64 256, i64 64, i64 0, i32 0, metadata !147, metadata !153, i32 0, null}
!153 = metadata !{metadata !154}
!154 = metadata !{i32 458785, i64 0, i64 3}
!155 = metadata !{i32 458804, i32 0, metadata !156, metadata !"def_table", metadata !"def_table", metadata !"", metadata !156, i32 53, metadata !157, i1 true, i1 true, null}
!156 = metadata !{i32 458769, i32 0, i32 1, metadata !"getdef.c", metadata !"/home/heming/rcs/direct-sym/apps/shadow/shadow-4.1.5/obj/lib/../../lib", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.7)", i1 true, i1 false, metadata !"", i32 0}
!157 = metadata !{i32 458753, metadata !156, metadata !"", metadata !156, i32 0, i64 8704, i64 64, i64 0, i32 0, metadata !158, metadata !166, i32 0, null}
!158 = metadata !{i32 458771, metadata !156, metadata !"itemdef", metadata !156, i32 47, i64 128, i64 64, i64 0, i32 0, null, metadata !159, i32 0, null}
!159 = metadata !{metadata !160, metadata !164}
!160 = metadata !{i32 458765, metadata !158, metadata !"name", metadata !156, i32 48, i64 64, i64 64, i64 0, i32 0, metadata !161}
!161 = metadata !{i32 458767, metadata !156, metadata !"", metadata !156, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !162}
!162 = metadata !{i32 458790, metadata !156, metadata !"", metadata !156, i32 0, i64 8, i64 8, i64 0, i32 0, metadata !163}
!163 = metadata !{i32 458788, metadata !156, metadata !"char", metadata !156, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6}
!164 = metadata !{i32 458765, metadata !158, metadata !"value", metadata !156, i32 49, i64 64, i64 64, i64 64, i32 0, metadata !165}
!165 = metadata !{i32 458767, metadata !156, metadata !"", metadata !156, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !163}
!166 = metadata !{metadata !167}
!167 = metadata !{i32 458785, i64 0, i64 67}
!168 = metadata !{i32 458804, i32 0, metadata !156, metadata !"def_fname", metadata !"def_fname", metadata !"", metadata !156, i32 139, metadata !169, i1 true, i1 true, null}
!169 = metadata !{i32 458753, metadata !156, metadata !"", metadata !156, i32 0, i64 128, i64 8, i64 0, i32 0, metadata !163, metadata !170, i32 0, null}
!170 = metadata !{metadata !171}
!171 = metadata !{i32 458785, i64 0, i64 15}
!172 = metadata !{i32 458804, i32 0, metadata !156, metadata !"def_loaded", metadata !"def_loaded", metadata !"", metadata !156, i32 140, metadata !173, i1 true, i1 true, null}
!173 = metadata !{i32 458788, metadata !156, metadata !"_Bool", metadata !156, i32 0, i64 8, i64 8, i64 0, i32 0, i32 2}
!174 = metadata !{i32 458804, i32 0, metadata !175, metadata !"group_ops", metadata !"group_ops", metadata !"", metadata !175, i32 114, metadata !176, i1 true, i1 true, null}
!175 = metadata !{i32 458769, i32 0, i32 1, metadata !"groupio.c", metadata !"/home/heming/rcs/direct-sym/apps/shadow/shadow-4.1.5/obj/lib/../../lib", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.7)", i1 true, i1 false, metadata !"", i32 0}
!176 = metadata !{i32 458771, metadata !175, metadata !"commonio_ops", metadata !177, i32 57, i64 576, i64 64, i64 0, i32 0, null, metadata !178, i32 0, null}
!177 = metadata !{i32 458769, i32 0, i32 1, metadata !"commonio.h", metadata !"/home/heming/rcs/direct-sym/apps/shadow/shadow-4.1.5/obj/lib/../../lib", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.7)", i1 false, i1 false, metadata !"", i32 0}
!178 = metadata !{metadata !179, metadata !184, metadata !188, metadata !195, metadata !199, metadata !260, metadata !264, metadata !268, metadata !272}
!179 = metadata !{i32 458765, metadata !176, metadata !"dup", metadata !177, i32 62, i64 64, i64 64, i64 0, i32 0, metadata !180}
!180 = metadata !{i32 458767, metadata !175, metadata !"", metadata !175, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !181}
!181 = metadata !{i32 458773, metadata !175, metadata !"", metadata !175, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !182, i32 0, null}
!182 = metadata !{metadata !183, metadata !183}
!183 = metadata !{i32 458767, metadata !175, metadata !"", metadata !175, i32 0, i64 64, i64 64, i64 0, i32 0, null}
!184 = metadata !{i32 458765, metadata !176, metadata !"free", metadata !177, i32 67, i64 64, i64 64, i64 64, i32 0, metadata !185}
!185 = metadata !{i32 458767, metadata !175, metadata !"", metadata !175, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !186}
!186 = metadata !{i32 458773, metadata !175, metadata !"", metadata !175, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !187, i32 0, null}
!187 = metadata !{null, metadata !183}
!188 = metadata !{i32 458765, metadata !176, metadata !"getname", metadata !177, i32 73, i64 64, i64 64, i64 128, i32 0, metadata !189}
!189 = metadata !{i32 458767, metadata !175, metadata !"", metadata !175, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !190}
!190 = metadata !{i32 458773, metadata !175, metadata !"", metadata !175, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !191, i32 0, null}
!191 = metadata !{metadata !192, metadata !183}
!192 = metadata !{i32 458767, metadata !175, metadata !"", metadata !175, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !193}
!193 = metadata !{i32 458790, metadata !175, metadata !"", metadata !175, i32 0, i64 8, i64 8, i64 0, i32 0, metadata !194}
!194 = metadata !{i32 458788, metadata !175, metadata !"char", metadata !175, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6}
!195 = metadata !{i32 458765, metadata !176, metadata !"parse", metadata !177, i32 79, i64 64, i64 64, i64 192, i32 0, metadata !196}
!196 = metadata !{i32 458767, metadata !175, metadata !"", metadata !175, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !197}
!197 = metadata !{i32 458773, metadata !175, metadata !"", metadata !175, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !198, i32 0, null}
!198 = metadata !{metadata !183, metadata !192}
!199 = metadata !{i32 458765, metadata !176, metadata !"put", metadata !177, i32 85, i64 64, i64 64, i64 256, i32 0, metadata !200}
!200 = metadata !{i32 458767, metadata !175, metadata !"", metadata !175, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !201}
!201 = metadata !{i32 458773, metadata !175, metadata !"", metadata !175, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !202, i32 0, null}
!202 = metadata !{metadata !203, metadata !183, metadata !204}
!203 = metadata !{i32 458788, metadata !175, metadata !"int", metadata !175, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5}
!204 = metadata !{i32 458767, metadata !175, metadata !"", metadata !175, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !205}
!205 = metadata !{i32 458774, metadata !175, metadata !"FILE", metadata !206, i32 49, i64 0, i64 0, i64 0, i32 0, metadata !207}
!206 = metadata !{i32 458769, i32 0, i32 1, metadata !"stdio.h", metadata !"/usr/include", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.7)", i1 false, i1 false, metadata !"", i32 0}
!207 = metadata !{i32 458771, metadata !175, metadata !"_IO_FILE", metadata !206, i32 45, i64 1728, i64 64, i64 0, i32 0, null, metadata !208, i32 0, null}
!208 = metadata !{metadata !209, metadata !211, metadata !213, metadata !214, metadata !215, metadata !216, metadata !217, metadata !218, metadata !219, metadata !220, metadata !221, metadata !222, metadata !223, metadata !231, metadata !232, metadata !233, metadata !234, metadata !237, metadata !239, metadata !241, metadata !245, metadata !246, metadata !248, metadata !249, metadata !250, metadata !251, metadata !252, metadata !255, metadata !256}
!209 = metadata !{i32 458765, metadata !207, metadata !"_flags", metadata !210, i32 272, i64 32, i64 32, i64 0, i32 0, metadata !203}
!210 = metadata !{i32 458769, i32 0, i32 1, metadata !"libio.h", metadata !"/usr/include", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.7)", i1 false, i1 false, metadata !"", i32 0}
!211 = metadata !{i32 458765, metadata !207, metadata !"_IO_read_ptr", metadata !210, i32 277, i64 64, i64 64, i64 64, i32 0, metadata !212}
!212 = metadata !{i32 458767, metadata !175, metadata !"", metadata !175, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !194}
!213 = metadata !{i32 458765, metadata !207, metadata !"_IO_read_end", metadata !210, i32 278, i64 64, i64 64, i64 128, i32 0, metadata !212}
!214 = metadata !{i32 458765, metadata !207, metadata !"_IO_read_base", metadata !210, i32 279, i64 64, i64 64, i64 192, i32 0, metadata !212}
!215 = metadata !{i32 458765, metadata !207, metadata !"_IO_write_base", metadata !210, i32 280, i64 64, i64 64, i64 256, i32 0, metadata !212}
!216 = metadata !{i32 458765, metadata !207, metadata !"_IO_write_ptr", metadata !210, i32 281, i64 64, i64 64, i64 320, i32 0, metadata !212}
!217 = metadata !{i32 458765, metadata !207, metadata !"_IO_write_end", metadata !210, i32 282, i64 64, i64 64, i64 384, i32 0, metadata !212}
!218 = metadata !{i32 458765, metadata !207, metadata !"_IO_buf_base", metadata !210, i32 283, i64 64, i64 64, i64 448, i32 0, metadata !212}
!219 = metadata !{i32 458765, metadata !207, metadata !"_IO_buf_end", metadata !210, i32 284, i64 64, i64 64, i64 512, i32 0, metadata !212}
!220 = metadata !{i32 458765, metadata !207, metadata !"_IO_save_base", metadata !210, i32 286, i64 64, i64 64, i64 576, i32 0, metadata !212}
!221 = metadata !{i32 458765, metadata !207, metadata !"_IO_backup_base", metadata !210, i32 287, i64 64, i64 64, i64 640, i32 0, metadata !212}
!222 = metadata !{i32 458765, metadata !207, metadata !"_IO_save_end", metadata !210, i32 288, i64 64, i64 64, i64 704, i32 0, metadata !212}
!223 = metadata !{i32 458765, metadata !207, metadata !"_markers", metadata !210, i32 290, i64 64, i64 64, i64 768, i32 0, metadata !224}
!224 = metadata !{i32 458767, metadata !175, metadata !"", metadata !175, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !225}
!225 = metadata !{i32 458771, metadata !175, metadata !"_IO_marker", metadata !210, i32 186, i64 192, i64 64, i64 0, i32 0, null, metadata !226, i32 0, null}
!226 = metadata !{metadata !227, metadata !228, metadata !230}
!227 = metadata !{i32 458765, metadata !225, metadata !"_next", metadata !210, i32 187, i64 64, i64 64, i64 0, i32 0, metadata !224}
!228 = metadata !{i32 458765, metadata !225, metadata !"_sbuf", metadata !210, i32 188, i64 64, i64 64, i64 64, i32 0, metadata !229}
!229 = metadata !{i32 458767, metadata !175, metadata !"", metadata !175, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !207}
!230 = metadata !{i32 458765, metadata !225, metadata !"_pos", metadata !210, i32 192, i64 32, i64 32, i64 128, i32 0, metadata !203}
!231 = metadata !{i32 458765, metadata !207, metadata !"_chain", metadata !210, i32 292, i64 64, i64 64, i64 832, i32 0, metadata !229}
!232 = metadata !{i32 458765, metadata !207, metadata !"_fileno", metadata !210, i32 294, i64 32, i64 32, i64 896, i32 0, metadata !203}
!233 = metadata !{i32 458765, metadata !207, metadata !"_flags2", metadata !210, i32 298, i64 32, i64 32, i64 928, i32 0, metadata !203}
!234 = metadata !{i32 458765, metadata !207, metadata !"_old_offset", metadata !210, i32 300, i64 64, i64 64, i64 960, i32 0, metadata !235}
!235 = metadata !{i32 458774, metadata !175, metadata !"__off_t", metadata !69, i32 141, i64 0, i64 0, i64 0, i32 0, metadata !236}
!236 = metadata !{i32 458788, metadata !175, metadata !"long int", metadata !175, i32 0, i64 64, i64 64, i64 0, i32 0, i32 5}
!237 = metadata !{i32 458765, metadata !207, metadata !"_cur_column", metadata !210, i32 304, i64 16, i64 16, i64 1024, i32 0, metadata !238}
!238 = metadata !{i32 458788, metadata !175, metadata !"short unsigned int", metadata !175, i32 0, i64 16, i64 16, i64 0, i32 0, i32 7}
!239 = metadata !{i32 458765, metadata !207, metadata !"_vtable_offset", metadata !210, i32 305, i64 8, i64 8, i64 1040, i32 0, metadata !240}
!240 = metadata !{i32 458788, metadata !175, metadata !"signed char", metadata !175, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6}
!241 = metadata !{i32 458765, metadata !207, metadata !"_shortbuf", metadata !210, i32 306, i64 8, i64 8, i64 1048, i32 0, metadata !242}
!242 = metadata !{i32 458753, metadata !175, metadata !"", metadata !175, i32 0, i64 8, i64 8, i64 0, i32 0, metadata !194, metadata !243, i32 0, null}
!243 = metadata !{metadata !244}
!244 = metadata !{i32 458785, i64 0, i64 0}
!245 = metadata !{i32 458765, metadata !207, metadata !"_lock", metadata !210, i32 310, i64 64, i64 64, i64 1088, i32 0, metadata !183}
!246 = metadata !{i32 458765, metadata !207, metadata !"_offset", metadata !210, i32 319, i64 64, i64 64, i64 1152, i32 0, metadata !247}
!247 = metadata !{i32 458774, metadata !175, metadata !"__off64_t", metadata !69, i32 142, i64 0, i64 0, i64 0, i32 0, metadata !236}
!248 = metadata !{i32 458765, metadata !207, metadata !"__pad1", metadata !210, i32 328, i64 64, i64 64, i64 1216, i32 0, metadata !183}
!249 = metadata !{i32 458765, metadata !207, metadata !"__pad2", metadata !210, i32 329, i64 64, i64 64, i64 1280, i32 0, metadata !183}
!250 = metadata !{i32 458765, metadata !207, metadata !"__pad3", metadata !210, i32 330, i64 64, i64 64, i64 1344, i32 0, metadata !183}
!251 = metadata !{i32 458765, metadata !207, metadata !"__pad4", metadata !210, i32 331, i64 64, i64 64, i64 1408, i32 0, metadata !183}
!252 = metadata !{i32 458765, metadata !207, metadata !"__pad5", metadata !210, i32 332, i64 64, i64 64, i64 1472, i32 0, metadata !253}
!253 = metadata !{i32 458774, metadata !175, metadata !"size_t", metadata !126, i32 214, i64 0, i64 0, i64 0, i32 0, metadata !254}
!254 = metadata !{i32 458788, metadata !175, metadata !"long unsigned int", metadata !175, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7}
!255 = metadata !{i32 458765, metadata !207, metadata !"_mode", metadata !210, i32 334, i64 32, i64 32, i64 1536, i32 0, metadata !203}
!256 = metadata !{i32 458765, metadata !207, metadata !"_unused2", metadata !210, i32 336, i64 160, i64 8, i64 1568, i32 0, metadata !257}
!257 = metadata !{i32 458753, metadata !175, metadata !"", metadata !175, i32 0, i64 160, i64 8, i64 0, i32 0, metadata !194, metadata !258, i32 0, null}
!258 = metadata !{metadata !259}
!259 = metadata !{i32 458785, i64 0, i64 19}
!260 = metadata !{i32 458765, metadata !176, metadata !"fgets", metadata !177, i32 91, i64 64, i64 64, i64 320, i32 0, metadata !261}
!261 = metadata !{i32 458767, metadata !175, metadata !"", metadata !175, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !262}
!262 = metadata !{i32 458773, metadata !175, metadata !"", metadata !175, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !263, i32 0, null}
!263 = metadata !{metadata !212, metadata !212, metadata !203, metadata !204}
!264 = metadata !{i32 458765, metadata !176, metadata !"fputs", metadata !177, i32 92, i64 64, i64 64, i64 384, i32 0, metadata !265}
!265 = metadata !{i32 458767, metadata !175, metadata !"", metadata !175, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !266}
!266 = metadata !{i32 458773, metadata !175, metadata !"", metadata !175, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !267, i32 0, null}
!267 = metadata !{metadata !203, metadata !192, metadata !204}
!268 = metadata !{i32 458765, metadata !176, metadata !"open_hook", metadata !177, i32 100, i64 64, i64 64, i64 448, i32 0, metadata !269}
!269 = metadata !{i32 458767, metadata !175, metadata !"", metadata !175, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !270}
!270 = metadata !{i32 458773, metadata !175, metadata !"", metadata !175, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !271, i32 0, null}
!271 = metadata !{metadata !203}
!272 = metadata !{i32 458765, metadata !176, metadata !"close_hook", metadata !177, i32 101, i64 64, i64 64, i64 512, i32 0, metadata !269}
!273 = metadata !{i32 458804, i32 0, metadata !175, metadata !"group_db", metadata !"group_db", metadata !"", metadata !175, i32 126, metadata !274, i1 true, i1 true, null}
!274 = metadata !{i32 458771, metadata !175, metadata !"commonio_db", metadata !177, i32 107, i64 8576, i64 64, i64 0, i32 0, null, metadata !275, i32 0, null}
!275 = metadata !{metadata !276, metadata !280, metadata !283, metadata !284, metadata !294, metadata !295, metadata !296, metadata !297, metadata !298, metadata !299}
!276 = metadata !{i32 458765, metadata !274, metadata !"filename", metadata !177, i32 111, i64 8192, i64 8, i64 0, i32 0, metadata !277}
!277 = metadata !{i32 458753, metadata !175, metadata !"", metadata !175, i32 0, i64 8192, i64 8, i64 0, i32 0, metadata !194, metadata !278, i32 0, null}
!278 = metadata !{metadata !279}
!279 = metadata !{i32 458785, i64 0, i64 1023}
!280 = metadata !{i32 458765, metadata !274, metadata !"ops", metadata !177, i32 116, i64 64, i64 64, i64 8192, i32 0, metadata !281}
!281 = metadata !{i32 458767, metadata !175, metadata !"", metadata !175, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !282}
!282 = metadata !{i32 458790, metadata !175, metadata !"", metadata !175, i32 0, i64 576, i64 64, i64 0, i32 0, metadata !176}
!283 = metadata !{i32 458765, metadata !274, metadata !"fp", metadata !177, i32 121, i64 64, i64 64, i64 8256, i32 0, metadata !204}
!284 = metadata !{i32 458765, metadata !274, metadata !"head", metadata !177, i32 129, i64 64, i64 64, i64 8320, i32 0, metadata !285}
!285 = metadata !{i32 458767, metadata !175, metadata !"", metadata !175, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !286}
!286 = metadata !{i32 458771, metadata !175, metadata !"commonio_entry", metadata !177, i32 46, i64 320, i64 64, i64 0, i32 0, null, metadata !287, i32 0, null}
!287 = metadata !{metadata !288, metadata !289, metadata !290, metadata !291, metadata !292}
!288 = metadata !{i32 458765, metadata !286, metadata !"line", metadata !177, i32 47, i64 64, i64 64, i64 0, i32 0, metadata !212}
!289 = metadata !{i32 458765, metadata !286, metadata !"eptr", metadata !177, i32 48, i64 64, i64 64, i64 64, i32 0, metadata !183}
!290 = metadata !{i32 458765, metadata !286, metadata !"prev", metadata !177, i32 49, i64 64, i64 64, i64 128, i32 0, metadata !285}
!291 = metadata !{i32 458765, metadata !286, metadata !"next", metadata !177, i32 50, i64 64, i64 64, i64 192, i32 0, metadata !285}
!292 = metadata !{i32 458765, metadata !286, metadata !"changed", metadata !177, i32 51, i64 1, i64 8, i64 256, i32 0, metadata !293}
!293 = metadata !{i32 458788, metadata !175, metadata !"_Bool", metadata !175, i32 0, i64 8, i64 8, i64 0, i32 0, i32 2}
!294 = metadata !{i32 458765, metadata !274, metadata !"tail", metadata !177, i32 130, i64 64, i64 64, i64 8384, i32 0, metadata !285}
!295 = metadata !{i32 458765, metadata !274, metadata !"cursor", metadata !177, i32 131, i64 64, i64 64, i64 8448, i32 0, metadata !285}
!296 = metadata !{i32 458765, metadata !274, metadata !"changed", metadata !177, i32 136, i64 1, i64 8, i64 8512, i32 0, metadata !293}
!297 = metadata !{i32 458765, metadata !274, metadata !"isopen", metadata !177, i32 137, i64 1, i64 8, i64 8513, i32 0, metadata !293}
!298 = metadata !{i32 458765, metadata !274, metadata !"locked", metadata !177, i32 138, i64 1, i64 8, i64 8514, i32 0, metadata !293}
!299 = metadata !{i32 458765, metadata !274, metadata !"readonly", metadata !177, i32 139, i64 1, i64 8, i64 8515, i32 0, metadata !293}
!300 = metadata !{i32 458804, i32 0, metadata !301, metadata !"nummethod", metadata !"nummethod", metadata !"", metadata !302, i32 77, metadata !309, i1 true, i1 true, null}
!301 = metadata !{i32 458798, i32 0, metadata !302, metadata !"pw_encrypt", metadata !"pw_encrypt", metadata !"pw_encrypt", metadata !302, i32 44, metadata !303, i1 false, i1 true, i32 0, i32 0, null, i1 false}
!302 = metadata !{i32 458769, i32 0, i32 1, metadata !"encrypt.c", metadata !"/home/heming/rcs/direct-sym/apps/shadow/shadow-4.1.5/obj/lib/../../lib", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.7)", i1 true, i1 false, metadata !"", i32 0}
!303 = metadata !{i32 458773, metadata !302, metadata !"", metadata !302, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !304, i32 0, null}
!304 = metadata !{metadata !305, metadata !307, metadata !307}
!305 = metadata !{i32 458767, metadata !302, metadata !"", metadata !302, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !306}
!306 = metadata !{i32 458788, metadata !302, metadata !"char", metadata !302, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6}
!307 = metadata !{i32 458767, metadata !302, metadata !"", metadata !302, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !308}
!308 = metadata !{i32 458790, metadata !302, metadata !"", metadata !302, i32 0, i64 8, i64 8, i64 0, i32 0, metadata !306}
!309 = metadata !{i32 458753, metadata !302, metadata !"", metadata !302, i32 0, i64 32, i64 8, i64 0, i32 0, metadata !306, metadata !153, i32 0, null}
!310 = metadata !{i32 458804, i32 0, metadata !301, metadata !"cipher", metadata !"cipher", metadata !"", metadata !302, i32 45, metadata !311, i1 true, i1 true, null}
!311 = metadata !{i32 458753, metadata !302, metadata !"", metadata !302, i32 0, i64 1024, i64 8, i64 0, i32 0, metadata !306, metadata !312, i32 0, null}
!312 = metadata !{metadata !313}
!313 = metadata !{i32 458785, i64 0, i64 127}
!314 = metadata !{i32 458804, i32 0, metadata !315, metadata !"gshadow_ops", metadata !"gshadow_ops", metadata !"", metadata !315, i32 201, metadata !316, i1 true, i1 true, null}
!315 = metadata !{i32 458769, i32 0, i32 1, metadata !"sgroupio.c", metadata !"/home/heming/rcs/direct-sym/apps/shadow/shadow-4.1.5/obj/lib/../../lib", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.7)", i1 true, i1 false, metadata !"", i32 0}
!316 = metadata !{i32 458771, metadata !315, metadata !"commonio_ops", metadata !177, i32 57, i64 576, i64 64, i64 0, i32 0, null, metadata !317, i32 0, null}
!317 = metadata !{metadata !318, metadata !323, metadata !327, metadata !334, metadata !338, metadata !393, metadata !397, metadata !401, metadata !405}
!318 = metadata !{i32 458765, metadata !316, metadata !"dup", metadata !177, i32 62, i64 64, i64 64, i64 0, i32 0, metadata !319}
!319 = metadata !{i32 458767, metadata !315, metadata !"", metadata !315, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !320}
!320 = metadata !{i32 458773, metadata !315, metadata !"", metadata !315, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !321, i32 0, null}
!321 = metadata !{metadata !322, metadata !322}
!322 = metadata !{i32 458767, metadata !315, metadata !"", metadata !315, i32 0, i64 64, i64 64, i64 0, i32 0, null}
!323 = metadata !{i32 458765, metadata !316, metadata !"free", metadata !177, i32 67, i64 64, i64 64, i64 64, i32 0, metadata !324}
!324 = metadata !{i32 458767, metadata !315, metadata !"", metadata !315, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !325}
!325 = metadata !{i32 458773, metadata !315, metadata !"", metadata !315, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !326, i32 0, null}
!326 = metadata !{null, metadata !322}
!327 = metadata !{i32 458765, metadata !316, metadata !"getname", metadata !177, i32 73, i64 64, i64 64, i64 128, i32 0, metadata !328}
!328 = metadata !{i32 458767, metadata !315, metadata !"", metadata !315, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !329}
!329 = metadata !{i32 458773, metadata !315, metadata !"", metadata !315, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !330, i32 0, null}
!330 = metadata !{metadata !331, metadata !322}
!331 = metadata !{i32 458767, metadata !315, metadata !"", metadata !315, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !332}
!332 = metadata !{i32 458790, metadata !315, metadata !"", metadata !315, i32 0, i64 8, i64 8, i64 0, i32 0, metadata !333}
!333 = metadata !{i32 458788, metadata !315, metadata !"char", metadata !315, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6}
!334 = metadata !{i32 458765, metadata !316, metadata !"parse", metadata !177, i32 79, i64 64, i64 64, i64 192, i32 0, metadata !335}
!335 = metadata !{i32 458767, metadata !315, metadata !"", metadata !315, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !336}
!336 = metadata !{i32 458773, metadata !315, metadata !"", metadata !315, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !337, i32 0, null}
!337 = metadata !{metadata !322, metadata !331}
!338 = metadata !{i32 458765, metadata !316, metadata !"put", metadata !177, i32 85, i64 64, i64 64, i64 256, i32 0, metadata !339}
!339 = metadata !{i32 458767, metadata !315, metadata !"", metadata !315, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !340}
!340 = metadata !{i32 458773, metadata !315, metadata !"", metadata !315, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !341, i32 0, null}
!341 = metadata !{metadata !342, metadata !322, metadata !343}
!342 = metadata !{i32 458788, metadata !315, metadata !"int", metadata !315, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5}
!343 = metadata !{i32 458767, metadata !315, metadata !"", metadata !315, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !344}
!344 = metadata !{i32 458774, metadata !315, metadata !"FILE", metadata !206, i32 49, i64 0, i64 0, i64 0, i32 0, metadata !345}
!345 = metadata !{i32 458771, metadata !315, metadata !"_IO_FILE", metadata !206, i32 45, i64 1728, i64 64, i64 0, i32 0, null, metadata !346, i32 0, null}
!346 = metadata !{metadata !347, metadata !348, metadata !350, metadata !351, metadata !352, metadata !353, metadata !354, metadata !355, metadata !356, metadata !357, metadata !358, metadata !359, metadata !360, metadata !368, metadata !369, metadata !370, metadata !371, metadata !374, metadata !376, metadata !378, metadata !380, metadata !381, metadata !383, metadata !384, metadata !385, metadata !386, metadata !387, metadata !390, metadata !391}
!347 = metadata !{i32 458765, metadata !345, metadata !"_flags", metadata !210, i32 272, i64 32, i64 32, i64 0, i32 0, metadata !342}
!348 = metadata !{i32 458765, metadata !345, metadata !"_IO_read_ptr", metadata !210, i32 277, i64 64, i64 64, i64 64, i32 0, metadata !349}
!349 = metadata !{i32 458767, metadata !315, metadata !"", metadata !315, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !333}
!350 = metadata !{i32 458765, metadata !345, metadata !"_IO_read_end", metadata !210, i32 278, i64 64, i64 64, i64 128, i32 0, metadata !349}
!351 = metadata !{i32 458765, metadata !345, metadata !"_IO_read_base", metadata !210, i32 279, i64 64, i64 64, i64 192, i32 0, metadata !349}
!352 = metadata !{i32 458765, metadata !345, metadata !"_IO_write_base", metadata !210, i32 280, i64 64, i64 64, i64 256, i32 0, metadata !349}
!353 = metadata !{i32 458765, metadata !345, metadata !"_IO_write_ptr", metadata !210, i32 281, i64 64, i64 64, i64 320, i32 0, metadata !349}
!354 = metadata !{i32 458765, metadata !345, metadata !"_IO_write_end", metadata !210, i32 282, i64 64, i64 64, i64 384, i32 0, metadata !349}
!355 = metadata !{i32 458765, metadata !345, metadata !"_IO_buf_base", metadata !210, i32 283, i64 64, i64 64, i64 448, i32 0, metadata !349}
!356 = metadata !{i32 458765, metadata !345, metadata !"_IO_buf_end", metadata !210, i32 284, i64 64, i64 64, i64 512, i32 0, metadata !349}
!357 = metadata !{i32 458765, metadata !345, metadata !"_IO_save_base", metadata !210, i32 286, i64 64, i64 64, i64 576, i32 0, metadata !349}
!358 = metadata !{i32 458765, metadata !345, metadata !"_IO_backup_base", metadata !210, i32 287, i64 64, i64 64, i64 640, i32 0, metadata !349}
!359 = metadata !{i32 458765, metadata !345, metadata !"_IO_save_end", metadata !210, i32 288, i64 64, i64 64, i64 704, i32 0, metadata !349}
!360 = metadata !{i32 458765, metadata !345, metadata !"_markers", metadata !210, i32 290, i64 64, i64 64, i64 768, i32 0, metadata !361}
!361 = metadata !{i32 458767, metadata !315, metadata !"", metadata !315, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !362}
!362 = metadata !{i32 458771, metadata !315, metadata !"_IO_marker", metadata !210, i32 186, i64 192, i64 64, i64 0, i32 0, null, metadata !363, i32 0, null}
!363 = metadata !{metadata !364, metadata !365, metadata !367}
!364 = metadata !{i32 458765, metadata !362, metadata !"_next", metadata !210, i32 187, i64 64, i64 64, i64 0, i32 0, metadata !361}
!365 = metadata !{i32 458765, metadata !362, metadata !"_sbuf", metadata !210, i32 188, i64 64, i64 64, i64 64, i32 0, metadata !366}
!366 = metadata !{i32 458767, metadata !315, metadata !"", metadata !315, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !345}
!367 = metadata !{i32 458765, metadata !362, metadata !"_pos", metadata !210, i32 192, i64 32, i64 32, i64 128, i32 0, metadata !342}
!368 = metadata !{i32 458765, metadata !345, metadata !"_chain", metadata !210, i32 292, i64 64, i64 64, i64 832, i32 0, metadata !366}
!369 = metadata !{i32 458765, metadata !345, metadata !"_fileno", metadata !210, i32 294, i64 32, i64 32, i64 896, i32 0, metadata !342}
!370 = metadata !{i32 458765, metadata !345, metadata !"_flags2", metadata !210, i32 298, i64 32, i64 32, i64 928, i32 0, metadata !342}
!371 = metadata !{i32 458765, metadata !345, metadata !"_old_offset", metadata !210, i32 300, i64 64, i64 64, i64 960, i32 0, metadata !372}
!372 = metadata !{i32 458774, metadata !315, metadata !"__off_t", metadata !69, i32 141, i64 0, i64 0, i64 0, i32 0, metadata !373}
!373 = metadata !{i32 458788, metadata !315, metadata !"long int", metadata !315, i32 0, i64 64, i64 64, i64 0, i32 0, i32 5}
!374 = metadata !{i32 458765, metadata !345, metadata !"_cur_column", metadata !210, i32 304, i64 16, i64 16, i64 1024, i32 0, metadata !375}
!375 = metadata !{i32 458788, metadata !315, metadata !"short unsigned int", metadata !315, i32 0, i64 16, i64 16, i64 0, i32 0, i32 7}
!376 = metadata !{i32 458765, metadata !345, metadata !"_vtable_offset", metadata !210, i32 305, i64 8, i64 8, i64 1040, i32 0, metadata !377}
!377 = metadata !{i32 458788, metadata !315, metadata !"signed char", metadata !315, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6}
!378 = metadata !{i32 458765, metadata !345, metadata !"_shortbuf", metadata !210, i32 306, i64 8, i64 8, i64 1048, i32 0, metadata !379}
!379 = metadata !{i32 458753, metadata !315, metadata !"", metadata !315, i32 0, i64 8, i64 8, i64 0, i32 0, metadata !333, metadata !243, i32 0, null}
!380 = metadata !{i32 458765, metadata !345, metadata !"_lock", metadata !210, i32 310, i64 64, i64 64, i64 1088, i32 0, metadata !322}
!381 = metadata !{i32 458765, metadata !345, metadata !"_offset", metadata !210, i32 319, i64 64, i64 64, i64 1152, i32 0, metadata !382}
!382 = metadata !{i32 458774, metadata !315, metadata !"__off64_t", metadata !69, i32 142, i64 0, i64 0, i64 0, i32 0, metadata !373}
!383 = metadata !{i32 458765, metadata !345, metadata !"__pad1", metadata !210, i32 328, i64 64, i64 64, i64 1216, i32 0, metadata !322}
!384 = metadata !{i32 458765, metadata !345, metadata !"__pad2", metadata !210, i32 329, i64 64, i64 64, i64 1280, i32 0, metadata !322}
!385 = metadata !{i32 458765, metadata !345, metadata !"__pad3", metadata !210, i32 330, i64 64, i64 64, i64 1344, i32 0, metadata !322}
!386 = metadata !{i32 458765, metadata !345, metadata !"__pad4", metadata !210, i32 331, i64 64, i64 64, i64 1408, i32 0, metadata !322}
!387 = metadata !{i32 458765, metadata !345, metadata !"__pad5", metadata !210, i32 332, i64 64, i64 64, i64 1472, i32 0, metadata !388}
!388 = metadata !{i32 458774, metadata !315, metadata !"size_t", metadata !126, i32 214, i64 0, i64 0, i64 0, i32 0, metadata !389}
!389 = metadata !{i32 458788, metadata !315, metadata !"long unsigned int", metadata !315, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7}
!390 = metadata !{i32 458765, metadata !345, metadata !"_mode", metadata !210, i32 334, i64 32, i64 32, i64 1536, i32 0, metadata !342}
!391 = metadata !{i32 458765, metadata !345, metadata !"_unused2", metadata !210, i32 336, i64 160, i64 8, i64 1568, i32 0, metadata !392}
!392 = metadata !{i32 458753, metadata !315, metadata !"", metadata !315, i32 0, i64 160, i64 8, i64 0, i32 0, metadata !333, metadata !258, i32 0, null}
!393 = metadata !{i32 458765, metadata !316, metadata !"fgets", metadata !177, i32 91, i64 64, i64 64, i64 320, i32 0, metadata !394}
!394 = metadata !{i32 458767, metadata !315, metadata !"", metadata !315, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !395}
!395 = metadata !{i32 458773, metadata !315, metadata !"", metadata !315, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !396, i32 0, null}
!396 = metadata !{metadata !349, metadata !349, metadata !342, metadata !343}
!397 = metadata !{i32 458765, metadata !316, metadata !"fputs", metadata !177, i32 92, i64 64, i64 64, i64 384, i32 0, metadata !398}
!398 = metadata !{i32 458767, metadata !315, metadata !"", metadata !315, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !399}
!399 = metadata !{i32 458773, metadata !315, metadata !"", metadata !315, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !400, i32 0, null}
!400 = metadata !{metadata !342, metadata !331, metadata !343}
!401 = metadata !{i32 458765, metadata !316, metadata !"open_hook", metadata !177, i32 100, i64 64, i64 64, i64 448, i32 0, metadata !402}
!402 = metadata !{i32 458767, metadata !315, metadata !"", metadata !315, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !403}
!403 = metadata !{i32 458773, metadata !315, metadata !"", metadata !315, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !404, i32 0, null}
!404 = metadata !{metadata !342}
!405 = metadata !{i32 458765, metadata !316, metadata !"close_hook", metadata !177, i32 101, i64 64, i64 64, i64 512, i32 0, metadata !402}
!406 = metadata !{i32 458804, i32 0, metadata !315, metadata !"gshadow_db", metadata !"gshadow_db", metadata !"", metadata !315, i32 213, metadata !407, i1 true, i1 true, null}
!407 = metadata !{i32 458771, metadata !315, metadata !"commonio_db", metadata !177, i32 107, i64 8576, i64 64, i64 0, i32 0, null, metadata !408, i32 0, null}
!408 = metadata !{metadata !409, metadata !411, metadata !414, metadata !415, metadata !425, metadata !426, metadata !427, metadata !428, metadata !429, metadata !430}
!409 = metadata !{i32 458765, metadata !407, metadata !"filename", metadata !177, i32 111, i64 8192, i64 8, i64 0, i32 0, metadata !410}
!410 = metadata !{i32 458753, metadata !315, metadata !"", metadata !315, i32 0, i64 8192, i64 8, i64 0, i32 0, metadata !333, metadata !278, i32 0, null}
!411 = metadata !{i32 458765, metadata !407, metadata !"ops", metadata !177, i32 116, i64 64, i64 64, i64 8192, i32 0, metadata !412}
!412 = metadata !{i32 458767, metadata !315, metadata !"", metadata !315, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !413}
!413 = metadata !{i32 458790, metadata !315, metadata !"", metadata !315, i32 0, i64 576, i64 64, i64 0, i32 0, metadata !316}
!414 = metadata !{i32 458765, metadata !407, metadata !"fp", metadata !177, i32 121, i64 64, i64 64, i64 8256, i32 0, metadata !343}
!415 = metadata !{i32 458765, metadata !407, metadata !"head", metadata !177, i32 129, i64 64, i64 64, i64 8320, i32 0, metadata !416}
!416 = metadata !{i32 458767, metadata !315, metadata !"", metadata !315, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !417}
!417 = metadata !{i32 458771, metadata !315, metadata !"commonio_entry", metadata !177, i32 46, i64 320, i64 64, i64 0, i32 0, null, metadata !418, i32 0, null}
!418 = metadata !{metadata !419, metadata !420, metadata !421, metadata !422, metadata !423}
!419 = metadata !{i32 458765, metadata !417, metadata !"line", metadata !177, i32 47, i64 64, i64 64, i64 0, i32 0, metadata !349}
!420 = metadata !{i32 458765, metadata !417, metadata !"eptr", metadata !177, i32 48, i64 64, i64 64, i64 64, i32 0, metadata !322}
!421 = metadata !{i32 458765, metadata !417, metadata !"prev", metadata !177, i32 49, i64 64, i64 64, i64 128, i32 0, metadata !416}
!422 = metadata !{i32 458765, metadata !417, metadata !"next", metadata !177, i32 50, i64 64, i64 64, i64 192, i32 0, metadata !416}
!423 = metadata !{i32 458765, metadata !417, metadata !"changed", metadata !177, i32 51, i64 1, i64 8, i64 256, i32 0, metadata !424}
!424 = metadata !{i32 458788, metadata !315, metadata !"_Bool", metadata !315, i32 0, i64 8, i64 8, i64 0, i32 0, i32 2}
!425 = metadata !{i32 458765, metadata !407, metadata !"tail", metadata !177, i32 130, i64 64, i64 64, i64 8384, i32 0, metadata !416}
!426 = metadata !{i32 458765, metadata !407, metadata !"cursor", metadata !177, i32 131, i64 64, i64 64, i64 8448, i32 0, metadata !416}
!427 = metadata !{i32 458765, metadata !407, metadata !"changed", metadata !177, i32 136, i64 1, i64 8, i64 8512, i32 0, metadata !424}
!428 = metadata !{i32 458765, metadata !407, metadata !"isopen", metadata !177, i32 137, i64 1, i64 8, i64 8513, i32 0, metadata !424}
!429 = metadata !{i32 458765, metadata !407, metadata !"locked", metadata !177, i32 138, i64 1, i64 8, i64 8514, i32 0, metadata !424}
!430 = metadata !{i32 458765, metadata !407, metadata !"readonly", metadata !177, i32 139, i64 1, i64 8, i64 8515, i32 0, metadata !424}
!431 = metadata !{i32 458804, i32 0, metadata !432, metadata !"lock_count", metadata !"lock_count", metadata !"", metadata !432, i32 77, metadata !433, i1 true, i1 true, null}
!432 = metadata !{i32 458769, i32 0, i32 1, metadata !"commonio.c", metadata !"/home/heming/rcs/direct-sym/apps/shadow/shadow-4.1.5/obj/lib/../../lib", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.7)", i1 true, i1 false, metadata !"", i32 0}
!433 = metadata !{i32 458788, metadata !432, metadata !"int", metadata !432, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5}
!434 = metadata !{i32 458804, i32 0, metadata !432, metadata !"nscd_need_reload", metadata !"nscd_need_reload", metadata !"", metadata !432, i32 78, metadata !435, i1 true, i1 true, null}
!435 = metadata !{i32 458788, metadata !432, metadata !"_Bool", metadata !432, i32 0, i64 8, i64 8, i64 0, i32 0, i32 2}
!436 = metadata !{i32 458804, i32 0, metadata !437, metadata !"members", metadata !"members", metadata !"", metadata !437, i32 44, metadata !438, i1 true, i1 true, null}
!437 = metadata !{i32 458769, i32 0, i32 1, metadata !"gshadow.c", metadata !"/home/heming/rcs/direct-sym/apps/shadow/shadow-4.1.5/obj/lib/../../lib", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.7)", i1 true, i1 false, metadata !"", i32 0}
!438 = metadata !{i32 458767, metadata !437, metadata !"", metadata !437, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !439}
!439 = metadata !{i32 458767, metadata !437, metadata !"", metadata !437, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !440}
!440 = metadata !{i32 458788, metadata !437, metadata !"char", metadata !437, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6}
!441 = metadata !{i32 458804, i32 0, metadata !437, metadata !"nmembers", metadata !"nmembers", metadata !"", metadata !437, i32 45, metadata !442, i1 true, i1 true, null}
!442 = metadata !{i32 458774, metadata !437, metadata !"size_t", metadata !126, i32 214, i64 0, i64 0, i64 0, i32 0, metadata !443}
!443 = metadata !{i32 458788, metadata !437, metadata !"long unsigned int", metadata !437, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7}
!444 = metadata !{i32 458804, i32 0, metadata !437, metadata !"admins", metadata !"admins", metadata !"", metadata !437, i32 46, metadata !438, i1 true, i1 true, null}
!445 = metadata !{i32 458804, i32 0, metadata !437, metadata !"nadmins", metadata !"nadmins", metadata !"", metadata !437, i32 47, metadata !442, i1 true, i1 true, null}
!446 = metadata !{i32 458804, i32 0, metadata !447, metadata !"sgrbuflen", metadata !"sgrbuflen", metadata !"", metadata !437, i32 134, metadata !442, i1 true, i1 true, null}
!447 = metadata !{i32 458798, i32 0, metadata !437, metadata !"sgetsgent", metadata !"sgetsgent", metadata !"sgetsgent", metadata !437, i32 132, metadata !448, i1 false, i1 true, i32 0, i32 0, null, i1 false}
!448 = metadata !{i32 458773, metadata !437, metadata !"", metadata !437, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !449, i32 0, null}
!449 = metadata !{metadata !450, metadata !458}
!450 = metadata !{i32 458767, metadata !437, metadata !"", metadata !437, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !451}
!451 = metadata !{i32 458771, metadata !437, metadata !"sgrp", metadata !452, i32 43, i64 256, i64 64, i64 0, i32 0, null, metadata !453, i32 0, null}
!452 = metadata !{i32 458769, i32 0, i32 1, metadata !"gshadow_.h", metadata !"/home/heming/rcs/direct-sym/apps/shadow/shadow-4.1.5/obj/lib/../../lib", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.7)", i1 false, i1 false, metadata !"", i32 0}
!453 = metadata !{metadata !454, metadata !455, metadata !456, metadata !457}
!454 = metadata !{i32 458765, metadata !451, metadata !"sg_name", metadata !452, i32 44, i64 64, i64 64, i64 0, i32 0, metadata !439}
!455 = metadata !{i32 458765, metadata !451, metadata !"sg_passwd", metadata !452, i32 45, i64 64, i64 64, i64 64, i32 0, metadata !439}
!456 = metadata !{i32 458765, metadata !451, metadata !"sg_adm", metadata !452, i32 46, i64 64, i64 64, i64 128, i32 0, metadata !438}
!457 = metadata !{i32 458765, metadata !451, metadata !"sg_mem", metadata !452, i32 47, i64 64, i64 64, i64 192, i32 0, metadata !438}
!458 = metadata !{i32 458767, metadata !437, metadata !"", metadata !437, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !459}
!459 = metadata !{i32 458790, metadata !437, metadata !"", metadata !437, i32 0, i64 8, i64 8, i64 0, i32 0, metadata !440}
!460 = metadata !{i32 458804, i32 0, metadata !447, metadata !"sgrbuf", metadata !"sgrbuf", metadata !"", metadata !437, i32 133, metadata !439, i1 true, i1 true, null}
!461 = metadata !{i32 458804, i32 0, metadata !462, metadata !"buflen", metadata !"buflen", metadata !"", metadata !437, i32 215, metadata !442, i1 true, i1 true, null}
!462 = metadata !{i32 458798, i32 0, metadata !437, metadata !"fgetsgent", metadata !"fgetsgent", metadata !"fgetsgent", metadata !437, i32 214, metadata !463, i1 false, i1 true, i32 0, i32 0, null, i1 false}
!463 = metadata !{i32 458773, metadata !437, metadata !"", metadata !437, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !464, i32 0, null}
!464 = metadata !{metadata !450, metadata !465}
!465 = metadata !{i32 458767, metadata !437, metadata !"", metadata !437, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !466}
!466 = metadata !{i32 458774, metadata !437, metadata !"FILE", metadata !206, i32 49, i64 0, i64 0, i64 0, i32 0, metadata !467}
!467 = metadata !{i32 458771, metadata !437, metadata !"_IO_FILE", metadata !206, i32 45, i64 1728, i64 64, i64 0, i32 0, null, metadata !468, i32 0, null}
!468 = metadata !{metadata !469, metadata !471, metadata !472, metadata !473, metadata !474, metadata !475, metadata !476, metadata !477, metadata !478, metadata !479, metadata !480, metadata !481, metadata !482, metadata !490, metadata !491, metadata !492, metadata !493, metadata !496, metadata !498, metadata !500, metadata !502, metadata !504, metadata !506, metadata !507, metadata !508, metadata !509, metadata !510, metadata !511, metadata !512}
!469 = metadata !{i32 458765, metadata !467, metadata !"_flags", metadata !210, i32 272, i64 32, i64 32, i64 0, i32 0, metadata !470}
!470 = metadata !{i32 458788, metadata !437, metadata !"int", metadata !437, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5}
!471 = metadata !{i32 458765, metadata !467, metadata !"_IO_read_ptr", metadata !210, i32 277, i64 64, i64 64, i64 64, i32 0, metadata !439}
!472 = metadata !{i32 458765, metadata !467, metadata !"_IO_read_end", metadata !210, i32 278, i64 64, i64 64, i64 128, i32 0, metadata !439}
!473 = metadata !{i32 458765, metadata !467, metadata !"_IO_read_base", metadata !210, i32 279, i64 64, i64 64, i64 192, i32 0, metadata !439}
!474 = metadata !{i32 458765, metadata !467, metadata !"_IO_write_base", metadata !210, i32 280, i64 64, i64 64, i64 256, i32 0, metadata !439}
!475 = metadata !{i32 458765, metadata !467, metadata !"_IO_write_ptr", metadata !210, i32 281, i64 64, i64 64, i64 320, i32 0, metadata !439}
!476 = metadata !{i32 458765, metadata !467, metadata !"_IO_write_end", metadata !210, i32 282, i64 64, i64 64, i64 384, i32 0, metadata !439}
!477 = metadata !{i32 458765, metadata !467, metadata !"_IO_buf_base", metadata !210, i32 283, i64 64, i64 64, i64 448, i32 0, metadata !439}
!478 = metadata !{i32 458765, metadata !467, metadata !"_IO_buf_end", metadata !210, i32 284, i64 64, i64 64, i64 512, i32 0, metadata !439}
!479 = metadata !{i32 458765, metadata !467, metadata !"_IO_save_base", metadata !210, i32 286, i64 64, i64 64, i64 576, i32 0, metadata !439}
!480 = metadata !{i32 458765, metadata !467, metadata !"_IO_backup_base", metadata !210, i32 287, i64 64, i64 64, i64 640, i32 0, metadata !439}
!481 = metadata !{i32 458765, metadata !467, metadata !"_IO_save_end", metadata !210, i32 288, i64 64, i64 64, i64 704, i32 0, metadata !439}
!482 = metadata !{i32 458765, metadata !467, metadata !"_markers", metadata !210, i32 290, i64 64, i64 64, i64 768, i32 0, metadata !483}
!483 = metadata !{i32 458767, metadata !437, metadata !"", metadata !437, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !484}
!484 = metadata !{i32 458771, metadata !437, metadata !"_IO_marker", metadata !210, i32 186, i64 192, i64 64, i64 0, i32 0, null, metadata !485, i32 0, null}
!485 = metadata !{metadata !486, metadata !487, metadata !489}
!486 = metadata !{i32 458765, metadata !484, metadata !"_next", metadata !210, i32 187, i64 64, i64 64, i64 0, i32 0, metadata !483}
!487 = metadata !{i32 458765, metadata !484, metadata !"_sbuf", metadata !210, i32 188, i64 64, i64 64, i64 64, i32 0, metadata !488}
!488 = metadata !{i32 458767, metadata !437, metadata !"", metadata !437, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !467}
!489 = metadata !{i32 458765, metadata !484, metadata !"_pos", metadata !210, i32 192, i64 32, i64 32, i64 128, i32 0, metadata !470}
!490 = metadata !{i32 458765, metadata !467, metadata !"_chain", metadata !210, i32 292, i64 64, i64 64, i64 832, i32 0, metadata !488}
!491 = metadata !{i32 458765, metadata !467, metadata !"_fileno", metadata !210, i32 294, i64 32, i64 32, i64 896, i32 0, metadata !470}
!492 = metadata !{i32 458765, metadata !467, metadata !"_flags2", metadata !210, i32 298, i64 32, i64 32, i64 928, i32 0, metadata !470}
!493 = metadata !{i32 458765, metadata !467, metadata !"_old_offset", metadata !210, i32 300, i64 64, i64 64, i64 960, i32 0, metadata !494}
!494 = metadata !{i32 458774, metadata !437, metadata !"__off_t", metadata !69, i32 141, i64 0, i64 0, i64 0, i32 0, metadata !495}
!495 = metadata !{i32 458788, metadata !437, metadata !"long int", metadata !437, i32 0, i64 64, i64 64, i64 0, i32 0, i32 5}
!496 = metadata !{i32 458765, metadata !467, metadata !"_cur_column", metadata !210, i32 304, i64 16, i64 16, i64 1024, i32 0, metadata !497}
!497 = metadata !{i32 458788, metadata !437, metadata !"short unsigned int", metadata !437, i32 0, i64 16, i64 16, i64 0, i32 0, i32 7}
!498 = metadata !{i32 458765, metadata !467, metadata !"_vtable_offset", metadata !210, i32 305, i64 8, i64 8, i64 1040, i32 0, metadata !499}
!499 = metadata !{i32 458788, metadata !437, metadata !"signed char", metadata !437, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6}
!500 = metadata !{i32 458765, metadata !467, metadata !"_shortbuf", metadata !210, i32 306, i64 8, i64 8, i64 1048, i32 0, metadata !501}
!501 = metadata !{i32 458753, metadata !437, metadata !"", metadata !437, i32 0, i64 8, i64 8, i64 0, i32 0, metadata !440, metadata !243, i32 0, null}
!502 = metadata !{i32 458765, metadata !467, metadata !"_lock", metadata !210, i32 310, i64 64, i64 64, i64 1088, i32 0, metadata !503}
!503 = metadata !{i32 458767, metadata !437, metadata !"", metadata !437, i32 0, i64 64, i64 64, i64 0, i32 0, null}
!504 = metadata !{i32 458765, metadata !467, metadata !"_offset", metadata !210, i32 319, i64 64, i64 64, i64 1152, i32 0, metadata !505}
!505 = metadata !{i32 458774, metadata !437, metadata !"__off64_t", metadata !69, i32 142, i64 0, i64 0, i64 0, i32 0, metadata !495}
!506 = metadata !{i32 458765, metadata !467, metadata !"__pad1", metadata !210, i32 328, i64 64, i64 64, i64 1216, i32 0, metadata !503}
!507 = metadata !{i32 458765, metadata !467, metadata !"__pad2", metadata !210, i32 329, i64 64, i64 64, i64 1280, i32 0, metadata !503}
!508 = metadata !{i32 458765, metadata !467, metadata !"__pad3", metadata !210, i32 330, i64 64, i64 64, i64 1344, i32 0, metadata !503}
!509 = metadata !{i32 458765, metadata !467, metadata !"__pad4", metadata !210, i32 331, i64 64, i64 64, i64 1408, i32 0, metadata !503}
!510 = metadata !{i32 458765, metadata !467, metadata !"__pad5", metadata !210, i32 332, i64 64, i64 64, i64 1472, i32 0, metadata !442}
!511 = metadata !{i32 458765, metadata !467, metadata !"_mode", metadata !210, i32 334, i64 32, i64 32, i64 1536, i32 0, metadata !470}
!512 = metadata !{i32 458765, metadata !467, metadata !"_unused2", metadata !210, i32 336, i64 160, i64 8, i64 1568, i32 0, metadata !513}
!513 = metadata !{i32 458753, metadata !437, metadata !"", metadata !437, i32 0, i64 160, i64 8, i64 0, i32 0, metadata !440, metadata !258, i32 0, null}
!514 = metadata !{i32 458804, i32 0, metadata !462, metadata !"buf", metadata !"buf", metadata !"", metadata !437, i32 216, metadata !439, i1 true, i1 true, null}
!515 = metadata !{i32 458804, i32 0, metadata !437, metadata !"shadow", metadata !"shadow", metadata !"", metadata !437, i32 43, metadata !465, i1 true, i1 true, null}
!516 = metadata !{i32 458804, i32 0, metadata !437, metadata !"sgroup", metadata !"sgroup", metadata !"", metadata !437, i32 48, metadata !451, i1 true, i1 true, null}
!517 = metadata !{i32 458804, i32 0, metadata !518, metadata !"size", metadata !"size", metadata !"", metadata !519, i32 61, metadata !525, i1 true, i1 true, null}
!518 = metadata !{i32 458798, i32 0, metadata !519, metadata !"list", metadata !"list", metadata !"list", metadata !519, i32 59, metadata !520, i1 true, i1 true, i32 0, i32 0, null, i1 false}
!519 = metadata !{i32 458769, i32 0, i32 1, metadata !"sgetgrent.c", metadata !"/home/heming/rcs/direct-sym/apps/shadow/shadow-4.1.5/obj/lib/../../lib", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.7)", i1 true, i1 false, metadata !"", i32 0}
!520 = metadata !{i32 458773, metadata !519, metadata !"", metadata !519, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !521, i32 0, null}
!521 = metadata !{metadata !522, metadata !523}
!522 = metadata !{i32 458767, metadata !519, metadata !"", metadata !519, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !523}
!523 = metadata !{i32 458767, metadata !519, metadata !"", metadata !519, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !524}
!524 = metadata !{i32 458788, metadata !519, metadata !"char", metadata !519, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6}
!525 = metadata !{i32 458788, metadata !519, metadata !"int", metadata !519, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5}
!526 = metadata !{i32 458804, i32 0, metadata !518, metadata !"members", metadata !"members", metadata !"", metadata !519, i32 60, metadata !522, i1 true, i1 true, null}
!527 = metadata !{i32 458804, i32 0, metadata !528, metadata !"size", metadata !"size", metadata !"", metadata !519, i32 106, metadata !542, i1 true, i1 true, null}
!528 = metadata !{i32 458798, i32 0, metadata !519, metadata !"sgetgrent", metadata !"sgetgrent", metadata !"sgetgrent", metadata !519, i32 104, metadata !529, i1 false, i1 true, i32 0, i32 0, null, i1 false}
!529 = metadata !{i32 458773, metadata !519, metadata !"", metadata !519, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !530, i32 0, null}
!530 = metadata !{metadata !531, metadata !540}
!531 = metadata !{i32 458767, metadata !519, metadata !"", metadata !519, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !532}
!532 = metadata !{i32 458771, metadata !519, metadata !"group", metadata !63, i32 45, i64 256, i64 64, i64 0, i32 0, null, metadata !533, i32 0, null}
!533 = metadata !{metadata !534, metadata !535, metadata !536, metadata !539}
!534 = metadata !{i32 458765, metadata !532, metadata !"gr_name", metadata !63, i32 46, i64 64, i64 64, i64 0, i32 0, metadata !523}
!535 = metadata !{i32 458765, metadata !532, metadata !"gr_passwd", metadata !63, i32 47, i64 64, i64 64, i64 64, i32 0, metadata !523}
!536 = metadata !{i32 458765, metadata !532, metadata !"gr_gid", metadata !63, i32 48, i64 32, i64 32, i64 128, i32 0, metadata !537}
!537 = metadata !{i32 458774, metadata !519, metadata !"__gid_t", metadata !69, i32 136, i64 0, i64 0, i64 0, i32 0, metadata !538}
!538 = metadata !{i32 458788, metadata !519, metadata !"unsigned int", metadata !519, i32 0, i64 32, i64 32, i64 0, i32 0, i32 7}
!539 = metadata !{i32 458765, metadata !532, metadata !"gr_mem", metadata !63, i32 49, i64 64, i64 64, i64 192, i32 0, metadata !522}
!540 = metadata !{i32 458767, metadata !519, metadata !"", metadata !519, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !541}
!541 = metadata !{i32 458790, metadata !519, metadata !"", metadata !519, i32 0, i64 8, i64 8, i64 0, i32 0, metadata !524}
!542 = metadata !{i32 458774, metadata !519, metadata !"size_t", metadata !126, i32 214, i64 0, i64 0, i64 0, i32 0, metadata !543}
!543 = metadata !{i32 458788, metadata !519, metadata !"long unsigned int", metadata !519, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7}
!544 = metadata !{i32 458804, i32 0, metadata !528, metadata !"grpbuf", metadata !"grpbuf", metadata !"", metadata !519, i32 105, metadata !523, i1 true, i1 true, null}
!545 = metadata !{i32 458804, i32 0, metadata !528, metadata !"grpfields", metadata !"grpfields", metadata !"", metadata !519, i32 107, metadata !546, i1 true, i1 true, null}
!546 = metadata !{i32 458753, metadata !519, metadata !"", metadata !519, i32 0, i64 256, i64 64, i64 0, i32 0, metadata !523, metadata !153, i32 0, null}
!547 = metadata !{i32 458804, i32 0, metadata !528, metadata !"grent", metadata !"grent", metadata !"", metadata !519, i32 108, metadata !532, i1 true, i1 true, null}
!548 = metadata !{i32 130, i32 0, metadata !549, null}
!549 = metadata !{i32 458763, metadata !550, i32 129, i32 0}
!550 = metadata !{i32 458798, i32 0, metadata !1, metadata !"usage", metadata !"usage", metadata !"usage", metadata !1, i32 129, metadata !17, i1 true, i1 true, i32 0, i32 0, null, i1 false}
!551 = metadata !{i32 131, i32 0, metadata !549, null}
!552 = metadata !{i32 136, i32 0, metadata !549, null}
!553 = metadata !{i32 137, i32 0, metadata !549, null}
!554 = metadata !{i32 138, i32 0, metadata !549, null}
!555 = metadata !{i32 139, i32 0, metadata !549, null}
!556 = metadata !{i32 140, i32 0, metadata !549, null}
!557 = metadata !{i32 141, i32 0, metadata !549, null}
!558 = metadata !{i32 142, i32 0, metadata !549, null}
!559 = metadata !{i32 144, i32 0, metadata !549, null}
!560 = metadata !{i32 146, i32 0, metadata !549, null}
!561 = metadata !{i32 150, i32 0, metadata !549, null}
!562 = metadata !{i32 165, i32 0, metadata !563, null}
!563 = metadata !{i32 458763, metadata !16, i32 162, i32 0}
!564 = metadata !{i32 166, i32 0, metadata !563, null}
!565 = metadata !{i32 168, i32 0, metadata !563, null}
!566 = metadata !{i32 171, i32 0, metadata !563, null}
!567 = metadata !{i32 172, i32 0, metadata !563, null}
!568 = metadata !{i32 173, i32 0, metadata !563, null}
!569 = metadata !{i32 174, i32 0, metadata !563, null}
!570 = metadata !{i32 176, i32 0, metadata !563, null}
!571 = metadata !{i32 67, i32 0, metadata !572, metadata !581}
!572 = metadata !{i32 458763, metadata !573, i32 66, i32 0}
!573 = metadata !{i32 458798, i32 0, metadata !574, metadata !"xstrdup", metadata !"xstrdup", metadata !"xstrdup", metadata !574, i32 66, metadata !575, i1 false, i1 true, i32 0, i32 0, null, i1 false}
!574 = metadata !{i32 458769, i32 0, i32 1, metadata !"xmalloc.c", metadata !"/home/heming/rcs/direct-sym/apps/shadow/shadow-4.1.5/obj/libmisc/../../libmisc", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.7)", i1 true, i1 false, metadata !"", i32 0}
!575 = metadata !{i32 458773, metadata !574, metadata !"", metadata !574, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !576, i32 0, null}
!576 = metadata !{metadata !577, metadata !579}
!577 = metadata !{i32 458767, metadata !574, metadata !"", metadata !574, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !578}
!578 = metadata !{i32 458788, metadata !574, metadata !"char", metadata !574, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6}
!579 = metadata !{i32 458767, metadata !574, metadata !"", metadata !574, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !580}
!580 = metadata !{i32 458790, metadata !574, metadata !"", metadata !574, i32 0, i64 8, i64 8, i64 0, i32 0, metadata !578}
!581 = metadata !{i32 191, i32 0, metadata !582, null}
!582 = metadata !{i32 458763, metadata !583, i32 187, i32 0}
!583 = metadata !{i32 458798, i32 0, metadata !1, metadata !"is_valid_user_list", metadata !"is_valid_user_list", metadata !"is_valid_user_list", metadata !1, i32 187, metadata !584, i1 true, i1 true, i32 0, i32 0, null, i1 false}
!584 = metadata !{i32 458773, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !585, i32 0, null}
!585 = metadata !{metadata !2, metadata !49}
!586 = metadata !{i32 55, i32 0, metadata !587, metadata !571}
!587 = metadata !{i32 458763, metadata !588, i32 52, i32 0}
!588 = metadata !{i32 458798, i32 0, metadata !574, metadata !"xmalloc", metadata !"xmalloc", metadata !"xmalloc", metadata !574, i32 52, metadata !589, i1 false, i1 true, i32 0, i32 0, null, i1 false}
!589 = metadata !{i32 458773, metadata !574, metadata !"", metadata !574, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !590, i32 0, null}
!590 = metadata !{metadata !577, metadata !591}
!591 = metadata !{i32 458774, metadata !574, metadata !"size_t", metadata !126, i32 214, i64 0, i64 0, i64 0, i32 0, metadata !592}
!592 = metadata !{i32 458788, metadata !574, metadata !"long unsigned int", metadata !574, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7}
!593 = metadata !{i32 56, i32 0, metadata !587, metadata !571}
!594 = metadata !{i32 57, i32 0, metadata !587, metadata !571}
!595 = metadata !{i32 60, i32 0, metadata !587, metadata !571}
!596 = metadata !{i32 193, i32 0, metadata !582, null}
!597 = metadata !{i32 196, i32 0, metadata !582, null}
!598 = metadata !{i32 197, i32 0, metadata !582, null}
!599 = metadata !{i32 198, i32 0, metadata !582, null}
!600 = metadata !{i32 199, i32 0, metadata !582, null}
!601 = metadata !{i32 207, i32 0, metadata !582, null}
!602 = metadata !{i32 208, i32 0, metadata !582, null}
!603 = metadata !{i32 210, i32 0, metadata !582, null}
!604 = metadata !{i32 194, i32 0, metadata !582, null}
!605 = metadata !{i32 214, i32 0, metadata !582, null}
!606 = metadata !{i32 216, i32 0, metadata !582, null}
!607 = metadata !{i32 403, i32 0, metadata !608, null}
!608 = metadata !{i32 458763, metadata !609, i32 399, i32 0}
!609 = metadata !{i32 458798, i32 0, metadata !1, metadata !"log_gpasswd_failure", metadata !"log_gpasswd_failure", metadata !"log_gpasswd_failure", metadata !1, i32 399, metadata !610, i1 true, i1 true, i32 0, i32 0, null, i1 false}
!610 = metadata !{i32 458773, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !611, i32 0, null}
!611 = metadata !{null, metadata !49}
!612 = metadata !{i32 404, i32 0, metadata !613, null}
!613 = metadata !{i32 458763, metadata !608, i32 399, i32 0}
!614 = metadata !{i32 507, i32 0, metadata !615, null}
!615 = metadata !{i32 458763, metadata !608, i32 478, i32 0}
!616 = metadata !{i32 417, i32 0, metadata !608, null}
!617 = metadata !{i32 418, i32 0, metadata !618, null}
!618 = metadata !{i32 458763, metadata !608, i32 417, i32 0}
!619 = metadata !{i32 431, i32 0, metadata !608, null}
!620 = metadata !{i32 432, i32 0, metadata !621, null}
!621 = metadata !{i32 458763, metadata !608, i32 431, i32 0}
!622 = metadata !{i32 445, i32 0, metadata !608, null}
!623 = metadata !{i32 446, i32 0, metadata !624, null}
!624 = metadata !{i32 458763, metadata !608, i32 445, i32 0}
!625 = metadata !{i32 459, i32 0, metadata !608, null}
!626 = metadata !{i32 461, i32 0, metadata !608, null}
!627 = metadata !{i32 462, i32 0, metadata !628, null}
!628 = metadata !{i32 458763, metadata !608, i32 461, i32 0}
!629 = metadata !{i32 477, i32 0, metadata !608, null}
!630 = metadata !{i32 478, i32 0, metadata !631, null}
!631 = metadata !{i32 458763, metadata !608, i32 477, i32 0}
!632 = metadata !{i32 493, i32 0, metadata !615, null}
!633 = metadata !{i32 511, i32 0, metadata !634, null}
!634 = metadata !{i32 458763, metadata !635, i32 510, i32 0}
!635 = metadata !{i32 458798, i32 0, metadata !1, metadata !"log_gpasswd_failure_system", metadata !"log_gpasswd_failure_system", metadata !"log_gpasswd_failure_system", metadata !1, i32 510, metadata !636, i1 true, i1 true, i32 0, i32 0, null, i1 false}
!636 = metadata !{i32 458773, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !637, i32 0, null}
!637 = metadata !{null, metadata !638}
!638 = metadata !{i32 458767, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, null}
!639 = metadata !{i32 512, i32 0, metadata !634, null}
!640 = metadata !{i32 517, i32 0, metadata !641, null}
!641 = metadata !{i32 458763, metadata !642, i32 515, i32 0}
!642 = metadata !{i32 458798, i32 0, metadata !1, metadata !"log_gpasswd_failure_group", metadata !"log_gpasswd_failure_group", metadata !"log_gpasswd_failure_group", metadata !1, i32 515, metadata !636, i1 true, i1 true, i32 0, i32 0, null, i1 false}
!643 = metadata !{i32 518, i32 0, metadata !641, null}
!644 = metadata !{i32 519, i32 0, metadata !641, null}
!645 = metadata !{i32 520, i32 0, metadata !641, null}
!646 = metadata !{i32 526, i32 0, metadata !647, null}
!647 = metadata !{i32 458763, metadata !648, i32 524, i32 0}
!648 = metadata !{i32 458798, i32 0, metadata !1, metadata !"log_gpasswd_failure_gshadow", metadata !"log_gpasswd_failure_gshadow", metadata !"log_gpasswd_failure_gshadow", metadata !1, i32 524, metadata !636, i1 true, i1 true, i32 0, i32 0, null, i1 false}
!649 = metadata !{i32 527, i32 0, metadata !647, null}
!650 = metadata !{i32 528, i32 0, metadata !647, null}
!651 = metadata !{i32 529, i32 0, metadata !647, null}
!652 = metadata !{i32 537, i32 0, metadata !653, null}
!653 = metadata !{i32 458763, metadata !654, i32 533, i32 0}
!654 = metadata !{i32 458798, i32 0, metadata !1, metadata !"log_gpasswd_success", metadata !"log_gpasswd_success", metadata !"log_gpasswd_success", metadata !1, i32 533, metadata !610, i1 true, i1 true, i32 0, i32 0, null, i1 false}
!655 = metadata !{i32 538, i32 0, metadata !656, null}
!656 = metadata !{i32 458763, metadata !653, i32 533, i32 0}
!657 = metadata !{i32 641, i32 0, metadata !658, null}
!658 = metadata !{i32 458763, metadata !653, i32 612, i32 0}
!659 = metadata !{i32 551, i32 0, metadata !653, null}
!660 = metadata !{i32 552, i32 0, metadata !661, null}
!661 = metadata !{i32 458763, metadata !653, i32 551, i32 0}
!662 = metadata !{i32 565, i32 0, metadata !653, null}
!663 = metadata !{i32 566, i32 0, metadata !664, null}
!664 = metadata !{i32 458763, metadata !653, i32 565, i32 0}
!665 = metadata !{i32 579, i32 0, metadata !653, null}
!666 = metadata !{i32 580, i32 0, metadata !667, null}
!667 = metadata !{i32 458763, metadata !653, i32 579, i32 0}
!668 = metadata !{i32 593, i32 0, metadata !653, null}
!669 = metadata !{i32 595, i32 0, metadata !653, null}
!670 = metadata !{i32 596, i32 0, metadata !671, null}
!671 = metadata !{i32 458763, metadata !653, i32 595, i32 0}
!672 = metadata !{i32 611, i32 0, metadata !653, null}
!673 = metadata !{i32 612, i32 0, metadata !674, null}
!674 = metadata !{i32 458763, metadata !653, i32 611, i32 0}
!675 = metadata !{i32 627, i32 0, metadata !658, null}
!676 = metadata !{i32 651, i32 0, metadata !677, null}
!677 = metadata !{i32 458763, metadata !678, i32 649, i32 0}
!678 = metadata !{i32 458798, i32 0, metadata !1, metadata !"log_gpasswd_success_group", metadata !"log_gpasswd_success_group", metadata !"log_gpasswd_success_group", metadata !1, i32 649, metadata !636, i1 true, i1 true, i32 0, i32 0, null, i1 false}
!679 = metadata !{i32 652, i32 0, metadata !677, null}
!680 = metadata !{i32 653, i32 0, metadata !677, null}
!681 = metadata !{i32 654, i32 0, metadata !677, null}
!682 = metadata !{i32 242, i32 0, metadata !683, metadata !686}
!683 = metadata !{i32 458763, metadata !684, i32 241, i32 0}
!684 = metadata !{i32 458798, i32 0, metadata !138, metadata !"sanitize_env", metadata !"sanitize_env", metadata !"sanitize_env", metadata !138, i32 241, metadata !685, i1 false, i1 true, i32 0, i32 0, null, i1 false}
!685 = metadata !{i32 458773, metadata !138, metadata !"", metadata !138, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !108, i32 0, null}
!686 = metadata !{i32 969, i32 0, metadata !687, null}
!687 = metadata !{i32 458763, metadata !688, i32 958, i32 0}
!688 = metadata !{i32 458798, i32 0, metadata !1, metadata !"main", metadata !"main", metadata !"main", metadata !1, i32 958, metadata !689, i1 false, i1 true, i32 0, i32 0, null, i1 false}
!689 = metadata !{i32 458773, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !690, i32 0, null}
!690 = metadata !{metadata !19, metadata !19, metadata !43}
!691 = metadata !{i32 247, i32 0, metadata !683, metadata !686}
!692 = metadata !{i32 249, i32 0, metadata !683, metadata !686}
!693 = metadata !{i32 251, i32 0, metadata !683, metadata !686}
!694 = metadata !{i32 250, i32 0, metadata !683, metadata !686}
!695 = metadata !{i32 253, i32 0, metadata !683, metadata !686}
!696 = metadata !{i32 248, i32 0, metadata !683, metadata !686}
!697 = metadata !{i32 261, i32 0, metadata !683, metadata !686}
!698 = metadata !{i32 264, i32 0, metadata !683, metadata !686}
!699 = metadata !{i32 268, i32 0, metadata !683, metadata !686}
!700 = metadata !{i32 267, i32 0, metadata !683, metadata !686}
!701 = metadata !{i32 270, i32 0, metadata !683, metadata !686}
!702 = metadata !{i32 260, i32 0, metadata !683, metadata !686}
!703 = metadata !{i32 259, i32 0, metadata !683, metadata !686}
!704 = metadata !{i32 970, i32 0, metadata !687, null}
!705 = metadata !{i32 971, i32 0, metadata !687, null}
!706 = metadata !{i32 972, i32 0, metadata !687, null}
!707 = metadata !{i32 981, i32 0, metadata !687, null}
!708 = metadata !{i32 982, i32 0, metadata !687, null}
!709 = metadata !{i32 47, i32 0, metadata !710, metadata !708}
!710 = metadata !{i32 458763, metadata !711, i32 46, i32 0}
!711 = metadata !{i32 458798, i32 0, metadata !712, metadata !"Basename", metadata !"Basename", metadata !"Basename", metadata !712, i32 46, metadata !713, i1 false, i1 true, i32 0, i32 0, null, i1 false}
!712 = metadata !{i32 458769, i32 0, i32 1, metadata !"basename.c", metadata !"/home/heming/rcs/direct-sym/apps/shadow/shadow-4.1.5/obj/libmisc/../../libmisc", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.7)", i1 true, i1 false, metadata !"", i32 0}
!713 = metadata !{i32 458773, metadata !712, metadata !"", metadata !712, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !714, i32 0, null}
!714 = metadata !{metadata !715, metadata !715}
!715 = metadata !{i32 458767, metadata !712, metadata !"", metadata !712, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !716}
!716 = metadata !{i32 458790, metadata !712, metadata !"", metadata !712, i32 0, i64 8, i64 8, i64 0, i32 0, metadata !717}
!717 = metadata !{i32 458788, metadata !712, metadata !"char", metadata !712, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6}
!718 = metadata !{i32 49, i32 0, metadata !710, metadata !708}
!719 = metadata !{i32 984, i32 0, metadata !687, null}
!720 = metadata !{i32 985, i32 0, metadata !687, null}
!721 = metadata !{i32 986, i32 0, metadata !687, null}
!722 = metadata !{i32 47, i32 0, metadata !723, metadata !744}
!723 = metadata !{i32 458763, metadata !724, i32 45, i32 0}
!724 = metadata !{i32 458798, i32 0, metadata !725, metadata !"get_my_pwent", metadata !"get_my_pwent", metadata !"get_my_pwent", metadata !725, i32 45, metadata !726, i1 false, i1 true, i32 0, i32 0, null, i1 false}
!725 = metadata !{i32 458769, i32 0, i32 1, metadata !"myname.c", metadata !"/home/heming/rcs/direct-sym/apps/shadow/shadow-4.1.5/obj/libmisc/../../libmisc", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.7)", i1 true, i1 false, metadata !"", i32 0}
!726 = metadata !{i32 458773, metadata !725, metadata !"", metadata !725, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !727, i32 0, null}
!727 = metadata !{metadata !728}
!728 = metadata !{i32 458767, metadata !725, metadata !"", metadata !725, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !729}
!729 = metadata !{i32 458771, metadata !725, metadata !"passwd", metadata !730, i32 51, i64 384, i64 64, i64 0, i32 0, null, metadata !731, i32 0, null}
!730 = metadata !{i32 458769, i32 0, i32 1, metadata !"pwd.h", metadata !"/usr/include", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.7)", i1 false, i1 false, metadata !"", i32 0}
!731 = metadata !{metadata !732, metadata !735, metadata !736, metadata !739, metadata !741, metadata !742, metadata !743}
!732 = metadata !{i32 458765, metadata !729, metadata !"pw_name", metadata !730, i32 52, i64 64, i64 64, i64 0, i32 0, metadata !733}
!733 = metadata !{i32 458767, metadata !725, metadata !"", metadata !725, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !734}
!734 = metadata !{i32 458788, metadata !725, metadata !"char", metadata !725, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6}
!735 = metadata !{i32 458765, metadata !729, metadata !"pw_passwd", metadata !730, i32 53, i64 64, i64 64, i64 64, i32 0, metadata !733}
!736 = metadata !{i32 458765, metadata !729, metadata !"pw_uid", metadata !730, i32 54, i64 32, i64 32, i64 128, i32 0, metadata !737}
!737 = metadata !{i32 458774, metadata !725, metadata !"__uid_t", metadata !69, i32 135, i64 0, i64 0, i64 0, i32 0, metadata !738}
!738 = metadata !{i32 458788, metadata !725, metadata !"unsigned int", metadata !725, i32 0, i64 32, i64 32, i64 0, i32 0, i32 7}
!739 = metadata !{i32 458765, metadata !729, metadata !"pw_gid", metadata !730, i32 55, i64 32, i64 32, i64 160, i32 0, metadata !740}
!740 = metadata !{i32 458774, metadata !725, metadata !"__gid_t", metadata !69, i32 136, i64 0, i64 0, i64 0, i32 0, metadata !738}
!741 = metadata !{i32 458765, metadata !729, metadata !"pw_gecos", metadata !730, i32 56, i64 64, i64 64, i64 192, i32 0, metadata !733}
!742 = metadata !{i32 458765, metadata !729, metadata !"pw_dir", metadata !730, i32 57, i64 64, i64 64, i64 256, i32 0, metadata !733}
!743 = metadata !{i32 458765, metadata !729, metadata !"pw_shell", metadata !730, i32 58, i64 64, i64 64, i64 320, i32 0, metadata !733}
!744 = metadata !{i32 1000, i32 0, metadata !687, null}
!745 = metadata !{i32 48, i32 0, metadata !723, metadata !744}
!746 = metadata !{i32 60, i32 0, metadata !723, metadata !744}
!747 = metadata !{i32 75, i32 0, metadata !748, metadata !771}
!748 = metadata !{i32 458763, metadata !749, i32 68, i32 0}
!749 = metadata !{i32 458798, i32 0, metadata !750, metadata !"xgetpwnam", metadata !"xgetpwnam", metadata !"xgetpwnam", metadata !751, i32 68, metadata !752, i1 false, i1 true, i32 0, i32 0, null, i1 false}
!750 = metadata !{i32 458769, i32 0, i32 1, metadata !"xgetpwnam.c", metadata !"/home/heming/rcs/direct-sym/apps/shadow/shadow-4.1.5/obj/libmisc/../../libmisc", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.7)", i1 true, i1 false, metadata !"", i32 0}
!751 = metadata !{i32 458769, i32 0, i32 1, metadata !"xgetXXbyYY.c", metadata !"/home/heming/rcs/direct-sym/apps/shadow/shadow-4.1.5/obj/libmisc/../../libmisc", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.7)", i1 false, i1 false, metadata !"", i32 0}
!752 = metadata !{i32 458773, metadata !750, metadata !"", metadata !750, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !753, i32 0, null}
!753 = metadata !{metadata !754, metadata !769}
!754 = metadata !{i32 458767, metadata !750, metadata !"", metadata !750, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !755}
!755 = metadata !{i32 458771, metadata !750, metadata !"passwd", metadata !730, i32 51, i64 384, i64 64, i64 0, i32 0, null, metadata !756, i32 0, null}
!756 = metadata !{metadata !757, metadata !760, metadata !761, metadata !764, metadata !766, metadata !767, metadata !768}
!757 = metadata !{i32 458765, metadata !755, metadata !"pw_name", metadata !730, i32 52, i64 64, i64 64, i64 0, i32 0, metadata !758}
!758 = metadata !{i32 458767, metadata !750, metadata !"", metadata !750, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !759}
!759 = metadata !{i32 458788, metadata !750, metadata !"char", metadata !750, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6}
!760 = metadata !{i32 458765, metadata !755, metadata !"pw_passwd", metadata !730, i32 53, i64 64, i64 64, i64 64, i32 0, metadata !758}
!761 = metadata !{i32 458765, metadata !755, metadata !"pw_uid", metadata !730, i32 54, i64 32, i64 32, i64 128, i32 0, metadata !762}
!762 = metadata !{i32 458774, metadata !750, metadata !"__uid_t", metadata !69, i32 135, i64 0, i64 0, i64 0, i32 0, metadata !763}
!763 = metadata !{i32 458788, metadata !750, metadata !"unsigned int", metadata !750, i32 0, i64 32, i64 32, i64 0, i32 0, i32 7}
!764 = metadata !{i32 458765, metadata !755, metadata !"pw_gid", metadata !730, i32 55, i64 32, i64 32, i64 160, i32 0, metadata !765}
!765 = metadata !{i32 458774, metadata !750, metadata !"__gid_t", metadata !69, i32 136, i64 0, i64 0, i64 0, i32 0, metadata !763}
!766 = metadata !{i32 458765, metadata !755, metadata !"pw_gecos", metadata !730, i32 56, i64 64, i64 64, i64 192, i32 0, metadata !758}
!767 = metadata !{i32 458765, metadata !755, metadata !"pw_dir", metadata !730, i32 57, i64 64, i64 64, i64 256, i32 0, metadata !758}
!768 = metadata !{i32 458765, metadata !755, metadata !"pw_shell", metadata !730, i32 58, i64 64, i64 64, i64 320, i32 0, metadata !758}
!769 = metadata !{i32 458767, metadata !750, metadata !"", metadata !750, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !770}
!770 = metadata !{i32 458790, metadata !750, metadata !"", metadata !750, i32 0, i64 8, i64 8, i64 0, i32 0, metadata !759}
!771 = metadata !{i32 61, i32 0, metadata !723, metadata !744}
!772 = metadata !{i32 76, i32 0, metadata !748, metadata !771}
!773 = metadata !{i32 77, i32 0, metadata !748, metadata !771}
!774 = metadata !{i32 79, i32 0, metadata !748, metadata !771}
!775 = metadata !{i32 84, i32 0, metadata !776, metadata !771}
!776 = metadata !{i32 458763, metadata !748, i32 79, i32 0}
!777 = metadata !{i32 85, i32 0, metadata !776, metadata !771}
!778 = metadata !{i32 86, i32 0, metadata !776, metadata !771}
!779 = metadata !{i32 87, i32 0, metadata !776, metadata !771}
!780 = metadata !{i32 89, i32 0, metadata !776, metadata !771}
!781 = metadata !{i32 91, i32 0, metadata !776, metadata !771}
!782 = metadata !{i32 92, i32 0, metadata !776, metadata !771}
!783 = metadata !{i32 94, i32 0, metadata !776, metadata !771}
!784 = metadata !{i32 103, i32 0, metadata !776, metadata !771}
!785 = metadata !{i32 104, i32 0, metadata !776, metadata !771}
!786 = metadata !{i32 105, i32 0, metadata !776, metadata !771}
!787 = metadata !{i32 106, i32 0, metadata !776, metadata !771}
!788 = metadata !{i32 109, i32 0, metadata !776, metadata !771}
!789 = metadata !{i32 110, i32 0, metadata !776, metadata !771}
!790 = metadata !{i32 111, i32 0, metadata !776, metadata !771}
!791 = metadata !{i32 118, i32 0, metadata !748, metadata !771}
!792 = metadata !{i32 119, i32 0, metadata !748, metadata !771}
!793 = metadata !{i32 120, i32 0, metadata !748, metadata !771}
!794 = metadata !{i32 97, i32 0, metadata !795, metadata !771}
!795 = metadata !{i32 458763, metadata !776, i32 94, i32 0}
!796 = metadata !{i32 98, i32 0, metadata !795, metadata !771}
!797 = metadata !{i32 99, i32 0, metadata !795, metadata !771}
!798 = metadata !{i32 62, i32 0, metadata !723, metadata !744}
!799 = metadata !{i32 75, i32 0, metadata !800, metadata !821}
!800 = metadata !{i32 458763, metadata !801, i32 68, i32 0}
!801 = metadata !{i32 458798, i32 0, metadata !802, metadata !"xgetpwuid", metadata !"xgetpwuid", metadata !"xgetpwuid", metadata !751, i32 68, metadata !803, i1 false, i1 true, i32 0, i32 0, null, i1 false}
!802 = metadata !{i32 458769, i32 0, i32 1, metadata !"xgetpwuid.c", metadata !"/home/heming/rcs/direct-sym/apps/shadow/shadow-4.1.5/obj/libmisc/../../libmisc", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.7)", i1 true, i1 false, metadata !"", i32 0}
!803 = metadata !{i32 458773, metadata !802, metadata !"", metadata !802, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !804, i32 0, null}
!804 = metadata !{metadata !805, metadata !820}
!805 = metadata !{i32 458767, metadata !802, metadata !"", metadata !802, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !806}
!806 = metadata !{i32 458771, metadata !802, metadata !"passwd", metadata !730, i32 51, i64 384, i64 64, i64 0, i32 0, null, metadata !807, i32 0, null}
!807 = metadata !{metadata !808, metadata !811, metadata !812, metadata !815, metadata !817, metadata !818, metadata !819}
!808 = metadata !{i32 458765, metadata !806, metadata !"pw_name", metadata !730, i32 52, i64 64, i64 64, i64 0, i32 0, metadata !809}
!809 = metadata !{i32 458767, metadata !802, metadata !"", metadata !802, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !810}
!810 = metadata !{i32 458788, metadata !802, metadata !"char", metadata !802, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6}
!811 = metadata !{i32 458765, metadata !806, metadata !"pw_passwd", metadata !730, i32 53, i64 64, i64 64, i64 64, i32 0, metadata !809}
!812 = metadata !{i32 458765, metadata !806, metadata !"pw_uid", metadata !730, i32 54, i64 32, i64 32, i64 128, i32 0, metadata !813}
!813 = metadata !{i32 458774, metadata !802, metadata !"__uid_t", metadata !69, i32 135, i64 0, i64 0, i64 0, i32 0, metadata !814}
!814 = metadata !{i32 458788, metadata !802, metadata !"unsigned int", metadata !802, i32 0, i64 32, i64 32, i64 0, i32 0, i32 7}
!815 = metadata !{i32 458765, metadata !806, metadata !"pw_gid", metadata !730, i32 55, i64 32, i64 32, i64 160, i32 0, metadata !816}
!816 = metadata !{i32 458774, metadata !802, metadata !"__gid_t", metadata !69, i32 136, i64 0, i64 0, i64 0, i32 0, metadata !814}
!817 = metadata !{i32 458765, metadata !806, metadata !"pw_gecos", metadata !730, i32 56, i64 64, i64 64, i64 192, i32 0, metadata !809}
!818 = metadata !{i32 458765, metadata !806, metadata !"pw_dir", metadata !730, i32 57, i64 64, i64 64, i64 256, i32 0, metadata !809}
!819 = metadata !{i32 458765, metadata !806, metadata !"pw_shell", metadata !730, i32 58, i64 64, i64 64, i64 320, i32 0, metadata !809}
!820 = metadata !{i32 458774, metadata !802, metadata !"uid_t", metadata !85, i32 81, i64 0, i64 0, i64 0, i32 0, metadata !814}
!821 = metadata !{i32 67, i32 0, metadata !723, metadata !744}
!822 = metadata !{i32 76, i32 0, metadata !800, metadata !821}
!823 = metadata !{i32 77, i32 0, metadata !800, metadata !821}
!824 = metadata !{i32 79, i32 0, metadata !800, metadata !821}
!825 = metadata !{i32 84, i32 0, metadata !826, metadata !821}
!826 = metadata !{i32 458763, metadata !800, i32 79, i32 0}
!827 = metadata !{i32 85, i32 0, metadata !826, metadata !821}
!828 = metadata !{i32 86, i32 0, metadata !826, metadata !821}
!829 = metadata !{i32 87, i32 0, metadata !826, metadata !821}
!830 = metadata !{i32 89, i32 0, metadata !826, metadata !821}
!831 = metadata !{i32 91, i32 0, metadata !826, metadata !821}
!832 = metadata !{i32 92, i32 0, metadata !826, metadata !821}
!833 = metadata !{i32 94, i32 0, metadata !826, metadata !821}
!834 = metadata !{i32 97, i32 0, metadata !835, metadata !821}
!835 = metadata !{i32 458763, metadata !826, i32 94, i32 0}
!836 = metadata !{i32 98, i32 0, metadata !835, metadata !821}
!837 = metadata !{i32 99, i32 0, metadata !835, metadata !821}
!838 = metadata !{i32 100, i32 0, metadata !835, metadata !821}
!839 = metadata !{i32 103, i32 0, metadata !826, metadata !821}
!840 = metadata !{i32 104, i32 0, metadata !826, metadata !821}
!841 = metadata !{i32 105, i32 0, metadata !826, metadata !821}
!842 = metadata !{i32 106, i32 0, metadata !826, metadata !821}
!843 = metadata !{i32 109, i32 0, metadata !826, metadata !821}
!844 = metadata !{i32 110, i32 0, metadata !826, metadata !821}
!845 = metadata !{i32 111, i32 0, metadata !826, metadata !821}
!846 = metadata !{i32 118, i32 0, metadata !800, metadata !821}
!847 = metadata !{i32 119, i32 0, metadata !800, metadata !821}
!848 = metadata !{i32 120, i32 0, metadata !800, metadata !821}
!849 = metadata !{i32 1001, i32 0, metadata !687, null}
!850 = metadata !{i32 1002, i32 0, metadata !687, null}
!851 = metadata !{i32 1004, i32 0, metadata !852, null}
!852 = metadata !{i32 458763, metadata !687, i32 1002, i32 0}
!853 = metadata !{i32 1007, i32 0, metadata !687, null}
!854 = metadata !{i32 1009, i32 0, metadata !687, null}
!855 = metadata !{i32 67, i32 0, metadata !572, metadata !854}
!856 = metadata !{i32 1015, i32 0, metadata !687, null}
!857 = metadata !{i32 1016, i32 0, metadata !687, null}
!858 = metadata !{i32 1017, i32 0, metadata !687, null}
!859 = metadata !{i32 249, i32 0, metadata !860, metadata !861}
!860 = metadata !{i32 458763, metadata !40, i32 230, i32 0}
!861 = metadata !{i32 1021, i32 0, metadata !687, null}
!862 = metadata !{i32 251, i32 0, metadata !860, metadata !861}
!863 = metadata !{i32 252, i32 0, metadata !860, metadata !861}
!864 = metadata !{i32 255, i32 0, metadata !860, metadata !861}
!865 = metadata !{i32 260, i32 0, metadata !860, metadata !861}
!866 = metadata !{i32 261, i32 0, metadata !860, metadata !861}
!867 = metadata !{i32 264, i32 0, metadata !860, metadata !861}
!868 = metadata !{i32 266, i32 0, metadata !860, metadata !861}
!869 = metadata !{i32 267, i32 0, metadata !860, metadata !861}
!870 = metadata !{i32 268, i32 0, metadata !860, metadata !861}
!871 = metadata !{i32 270, i32 0, metadata !860, metadata !861}
!872 = metadata !{i32 275, i32 0, metadata !860, metadata !861}
!873 = metadata !{i32 280, i32 0, metadata !860, metadata !861}
!874 = metadata !{i32 283, i32 0, metadata !860, metadata !861}
!875 = metadata !{i32 284, i32 0, metadata !860, metadata !861}
!876 = metadata !{i32 285, i32 0, metadata !860, metadata !861}
!877 = metadata !{i32 287, i32 0, metadata !860, metadata !861}
!878 = metadata !{i32 292, i32 0, metadata !860, metadata !861}
!879 = metadata !{i32 295, i32 0, metadata !860, metadata !861}
!880 = metadata !{i32 298, i32 0, metadata !860, metadata !861}
!881 = metadata !{i32 303, i32 0, metadata !860, metadata !861}
!882 = metadata !{i32 329, i32 0, metadata !883, metadata !887}
!883 = metadata !{i32 458763, metadata !884, i32 312, i32 0}
!884 = metadata !{i32 458798, i32 0, metadata !1, metadata !"check_flags", metadata !"check_flags", metadata !"check_flags", metadata !1, i32 312, metadata !885, i1 true, i1 true, i32 0, i32 0, null, i1 false}
!885 = metadata !{i32 458773, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !886, i32 0, null}
!886 = metadata !{null, metadata !19, metadata !19}
!887 = metadata !{i32 305, i32 0, metadata !860, metadata !861}
!888 = metadata !{i32 330, i32 0, metadata !883, metadata !887}
!889 = metadata !{i32 332, i32 0, metadata !883, metadata !887}
!890 = metadata !{i32 333, i32 0, metadata !883, metadata !887}
!891 = metadata !{i32 339, i32 0, metadata !883, metadata !887}
!892 = metadata !{i32 340, i32 0, metadata !883, metadata !887}
!893 = metadata !{i32 159, i32 0, metadata !894, metadata !898}
!894 = metadata !{i32 458763, metadata !895, i32 158, i32 0}
!895 = metadata !{i32 458798, i32 0, metadata !175, metadata !"gr_open", metadata !"gr_open", metadata !"gr_open", metadata !175, i32 158, metadata !896, i1 false, i1 true, i32 0, i32 0, null, i1 false}
!896 = metadata !{i32 458773, metadata !175, metadata !"", metadata !175, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !897, i32 0, null}
!897 = metadata !{metadata !203, metadata !203}
!898 = metadata !{i32 806, i32 0, metadata !899, metadata !901}
!899 = metadata !{i32 458763, metadata !900, i32 800, i32 0}
!900 = metadata !{i32 458798, i32 0, metadata !1, metadata !"get_group", metadata !"get_group", metadata !"get_group", metadata !1, i32 800, metadata !59, i1 true, i1 true, i32 0, i32 0, null, i1 false}
!901 = metadata !{i32 1027, i32 0, metadata !687, null}
!902 = metadata !{i32 807, i32 0, metadata !899, metadata !901}
!903 = metadata !{i32 808, i32 0, metadata !904, metadata !901}
!904 = metadata !{i32 458763, metadata !899, i32 807, i32 0}
!905 = metadata !{i32 809, i32 0, metadata !899, metadata !901}
!906 = metadata !{i32 1173, i32 0, metadata !907, metadata !1024}
!907 = metadata !{i32 458763, metadata !908, i32 1170, i32 0}
!908 = metadata !{i32 458798, i32 0, metadata !432, metadata !"commonio_locate", metadata !"commonio_locate", metadata !"commonio_locate", metadata !432, i32 1170, metadata !909, i1 false, i1 true, i32 0, i32 0, null, i1 false}
!909 = metadata !{i32 458773, metadata !432, metadata !"", metadata !432, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !910, i32 0, null}
!910 = metadata !{metadata !911, metadata !912, metadata !935}
!911 = metadata !{i32 458767, metadata !432, metadata !"", metadata !432, i32 0, i64 64, i64 64, i64 0, i32 0, null}
!912 = metadata !{i32 458767, metadata !432, metadata !"", metadata !432, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !913}
!913 = metadata !{i32 458771, metadata !432, metadata !"commonio_db", metadata !177, i32 107, i64 8576, i64 64, i64 0, i32 0, null, metadata !914, i32 0, null}
!914 = metadata !{metadata !915, metadata !918, metadata !1008, metadata !1009, metadata !1018, metadata !1019, metadata !1020, metadata !1021, metadata !1022, metadata !1023}
!915 = metadata !{i32 458765, metadata !913, metadata !"filename", metadata !177, i32 111, i64 8192, i64 8, i64 0, i32 0, metadata !916}
!916 = metadata !{i32 458753, metadata !432, metadata !"", metadata !432, i32 0, i64 8192, i64 8, i64 0, i32 0, metadata !917, metadata !278, i32 0, null}
!917 = metadata !{i32 458788, metadata !432, metadata !"char", metadata !432, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6}
!918 = metadata !{i32 458765, metadata !913, metadata !"ops", metadata !177, i32 116, i64 64, i64 64, i64 8192, i32 0, metadata !919}
!919 = metadata !{i32 458767, metadata !432, metadata !"", metadata !432, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !920}
!920 = metadata !{i32 458790, metadata !432, metadata !"", metadata !432, i32 0, i64 576, i64 64, i64 0, i32 0, metadata !921}
!921 = metadata !{i32 458771, metadata !432, metadata !"commonio_ops", metadata !177, i32 57, i64 576, i64 64, i64 0, i32 0, null, metadata !922, i32 0, null}
!922 = metadata !{metadata !923, metadata !927, metadata !931, metadata !937, metadata !941, metadata !995, metadata !999, metadata !1003, metadata !1007}
!923 = metadata !{i32 458765, metadata !921, metadata !"dup", metadata !177, i32 62, i64 64, i64 64, i64 0, i32 0, metadata !924}
!924 = metadata !{i32 458767, metadata !432, metadata !"", metadata !432, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !925}
!925 = metadata !{i32 458773, metadata !432, metadata !"", metadata !432, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !926, i32 0, null}
!926 = metadata !{metadata !911, metadata !911}
!927 = metadata !{i32 458765, metadata !921, metadata !"free", metadata !177, i32 67, i64 64, i64 64, i64 64, i32 0, metadata !928}
!928 = metadata !{i32 458767, metadata !432, metadata !"", metadata !432, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !929}
!929 = metadata !{i32 458773, metadata !432, metadata !"", metadata !432, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !930, i32 0, null}
!930 = metadata !{null, metadata !911}
!931 = metadata !{i32 458765, metadata !921, metadata !"getname", metadata !177, i32 73, i64 64, i64 64, i64 128, i32 0, metadata !932}
!932 = metadata !{i32 458767, metadata !432, metadata !"", metadata !432, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !933}
!933 = metadata !{i32 458773, metadata !432, metadata !"", metadata !432, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !934, i32 0, null}
!934 = metadata !{metadata !935, metadata !911}
!935 = metadata !{i32 458767, metadata !432, metadata !"", metadata !432, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !936}
!936 = metadata !{i32 458790, metadata !432, metadata !"", metadata !432, i32 0, i64 8, i64 8, i64 0, i32 0, metadata !917}
!937 = metadata !{i32 458765, metadata !921, metadata !"parse", metadata !177, i32 79, i64 64, i64 64, i64 192, i32 0, metadata !938}
!938 = metadata !{i32 458767, metadata !432, metadata !"", metadata !432, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !939}
!939 = metadata !{i32 458773, metadata !432, metadata !"", metadata !432, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !940, i32 0, null}
!940 = metadata !{metadata !911, metadata !935}
!941 = metadata !{i32 458765, metadata !921, metadata !"put", metadata !177, i32 85, i64 64, i64 64, i64 256, i32 0, metadata !942}
!942 = metadata !{i32 458767, metadata !432, metadata !"", metadata !432, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !943}
!943 = metadata !{i32 458773, metadata !432, metadata !"", metadata !432, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !944, i32 0, null}
!944 = metadata !{metadata !433, metadata !911, metadata !945}
!945 = metadata !{i32 458767, metadata !432, metadata !"", metadata !432, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !946}
!946 = metadata !{i32 458774, metadata !432, metadata !"FILE", metadata !206, i32 49, i64 0, i64 0, i64 0, i32 0, metadata !947}
!947 = metadata !{i32 458771, metadata !432, metadata !"_IO_FILE", metadata !206, i32 45, i64 1728, i64 64, i64 0, i32 0, null, metadata !948, i32 0, null}
!948 = metadata !{metadata !949, metadata !950, metadata !952, metadata !953, metadata !954, metadata !955, metadata !956, metadata !957, metadata !958, metadata !959, metadata !960, metadata !961, metadata !962, metadata !970, metadata !971, metadata !972, metadata !973, metadata !976, metadata !978, metadata !980, metadata !982, metadata !983, metadata !985, metadata !986, metadata !987, metadata !988, metadata !989, metadata !992, metadata !993}
!949 = metadata !{i32 458765, metadata !947, metadata !"_flags", metadata !210, i32 272, i64 32, i64 32, i64 0, i32 0, metadata !433}
!950 = metadata !{i32 458765, metadata !947, metadata !"_IO_read_ptr", metadata !210, i32 277, i64 64, i64 64, i64 64, i32 0, metadata !951}
!951 = metadata !{i32 458767, metadata !432, metadata !"", metadata !432, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !917}
!952 = metadata !{i32 458765, metadata !947, metadata !"_IO_read_end", metadata !210, i32 278, i64 64, i64 64, i64 128, i32 0, metadata !951}
!953 = metadata !{i32 458765, metadata !947, metadata !"_IO_read_base", metadata !210, i32 279, i64 64, i64 64, i64 192, i32 0, metadata !951}
!954 = metadata !{i32 458765, metadata !947, metadata !"_IO_write_base", metadata !210, i32 280, i64 64, i64 64, i64 256, i32 0, metadata !951}
!955 = metadata !{i32 458765, metadata !947, metadata !"_IO_write_ptr", metadata !210, i32 281, i64 64, i64 64, i64 320, i32 0, metadata !951}
!956 = metadata !{i32 458765, metadata !947, metadata !"_IO_write_end", metadata !210, i32 282, i64 64, i64 64, i64 384, i32 0, metadata !951}
!957 = metadata !{i32 458765, metadata !947, metadata !"_IO_buf_base", metadata !210, i32 283, i64 64, i64 64, i64 448, i32 0, metadata !951}
!958 = metadata !{i32 458765, metadata !947, metadata !"_IO_buf_end", metadata !210, i32 284, i64 64, i64 64, i64 512, i32 0, metadata !951}
!959 = metadata !{i32 458765, metadata !947, metadata !"_IO_save_base", metadata !210, i32 286, i64 64, i64 64, i64 576, i32 0, metadata !951}
!960 = metadata !{i32 458765, metadata !947, metadata !"_IO_backup_base", metadata !210, i32 287, i64 64, i64 64, i64 640, i32 0, metadata !951}
!961 = metadata !{i32 458765, metadata !947, metadata !"_IO_save_end", metadata !210, i32 288, i64 64, i64 64, i64 704, i32 0, metadata !951}
!962 = metadata !{i32 458765, metadata !947, metadata !"_markers", metadata !210, i32 290, i64 64, i64 64, i64 768, i32 0, metadata !963}
!963 = metadata !{i32 458767, metadata !432, metadata !"", metadata !432, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !964}
!964 = metadata !{i32 458771, metadata !432, metadata !"_IO_marker", metadata !210, i32 186, i64 192, i64 64, i64 0, i32 0, null, metadata !965, i32 0, null}
!965 = metadata !{metadata !966, metadata !967, metadata !969}
!966 = metadata !{i32 458765, metadata !964, metadata !"_next", metadata !210, i32 187, i64 64, i64 64, i64 0, i32 0, metadata !963}
!967 = metadata !{i32 458765, metadata !964, metadata !"_sbuf", metadata !210, i32 188, i64 64, i64 64, i64 64, i32 0, metadata !968}
!968 = metadata !{i32 458767, metadata !432, metadata !"", metadata !432, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !947}
!969 = metadata !{i32 458765, metadata !964, metadata !"_pos", metadata !210, i32 192, i64 32, i64 32, i64 128, i32 0, metadata !433}
!970 = metadata !{i32 458765, metadata !947, metadata !"_chain", metadata !210, i32 292, i64 64, i64 64, i64 832, i32 0, metadata !968}
!971 = metadata !{i32 458765, metadata !947, metadata !"_fileno", metadata !210, i32 294, i64 32, i64 32, i64 896, i32 0, metadata !433}
!972 = metadata !{i32 458765, metadata !947, metadata !"_flags2", metadata !210, i32 298, i64 32, i64 32, i64 928, i32 0, metadata !433}
!973 = metadata !{i32 458765, metadata !947, metadata !"_old_offset", metadata !210, i32 300, i64 64, i64 64, i64 960, i32 0, metadata !974}
!974 = metadata !{i32 458774, metadata !432, metadata !"__off_t", metadata !69, i32 141, i64 0, i64 0, i64 0, i32 0, metadata !975}
!975 = metadata !{i32 458788, metadata !432, metadata !"long int", metadata !432, i32 0, i64 64, i64 64, i64 0, i32 0, i32 5}
!976 = metadata !{i32 458765, metadata !947, metadata !"_cur_column", metadata !210, i32 304, i64 16, i64 16, i64 1024, i32 0, metadata !977}
!977 = metadata !{i32 458788, metadata !432, metadata !"short unsigned int", metadata !432, i32 0, i64 16, i64 16, i64 0, i32 0, i32 7}
!978 = metadata !{i32 458765, metadata !947, metadata !"_vtable_offset", metadata !210, i32 305, i64 8, i64 8, i64 1040, i32 0, metadata !979}
!979 = metadata !{i32 458788, metadata !432, metadata !"signed char", metadata !432, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6}
!980 = metadata !{i32 458765, metadata !947, metadata !"_shortbuf", metadata !210, i32 306, i64 8, i64 8, i64 1048, i32 0, metadata !981}
!981 = metadata !{i32 458753, metadata !432, metadata !"", metadata !432, i32 0, i64 8, i64 8, i64 0, i32 0, metadata !917, metadata !243, i32 0, null}
!982 = metadata !{i32 458765, metadata !947, metadata !"_lock", metadata !210, i32 310, i64 64, i64 64, i64 1088, i32 0, metadata !911}
!983 = metadata !{i32 458765, metadata !947, metadata !"_offset", metadata !210, i32 319, i64 64, i64 64, i64 1152, i32 0, metadata !984}
!984 = metadata !{i32 458774, metadata !432, metadata !"__off64_t", metadata !69, i32 142, i64 0, i64 0, i64 0, i32 0, metadata !975}
!985 = metadata !{i32 458765, metadata !947, metadata !"__pad1", metadata !210, i32 328, i64 64, i64 64, i64 1216, i32 0, metadata !911}
!986 = metadata !{i32 458765, metadata !947, metadata !"__pad2", metadata !210, i32 329, i64 64, i64 64, i64 1280, i32 0, metadata !911}
!987 = metadata !{i32 458765, metadata !947, metadata !"__pad3", metadata !210, i32 330, i64 64, i64 64, i64 1344, i32 0, metadata !911}
!988 = metadata !{i32 458765, metadata !947, metadata !"__pad4", metadata !210, i32 331, i64 64, i64 64, i64 1408, i32 0, metadata !911}
!989 = metadata !{i32 458765, metadata !947, metadata !"__pad5", metadata !210, i32 332, i64 64, i64 64, i64 1472, i32 0, metadata !990}
!990 = metadata !{i32 458774, metadata !432, metadata !"size_t", metadata !126, i32 214, i64 0, i64 0, i64 0, i32 0, metadata !991}
!991 = metadata !{i32 458788, metadata !432, metadata !"long unsigned int", metadata !432, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7}
!992 = metadata !{i32 458765, metadata !947, metadata !"_mode", metadata !210, i32 334, i64 32, i64 32, i64 1536, i32 0, metadata !433}
!993 = metadata !{i32 458765, metadata !947, metadata !"_unused2", metadata !210, i32 336, i64 160, i64 8, i64 1568, i32 0, metadata !994}
!994 = metadata !{i32 458753, metadata !432, metadata !"", metadata !432, i32 0, i64 160, i64 8, i64 0, i32 0, metadata !917, metadata !258, i32 0, null}
!995 = metadata !{i32 458765, metadata !921, metadata !"fgets", metadata !177, i32 91, i64 64, i64 64, i64 320, i32 0, metadata !996}
!996 = metadata !{i32 458767, metadata !432, metadata !"", metadata !432, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !997}
!997 = metadata !{i32 458773, metadata !432, metadata !"", metadata !432, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !998, i32 0, null}
!998 = metadata !{metadata !951, metadata !951, metadata !433, metadata !945}
!999 = metadata !{i32 458765, metadata !921, metadata !"fputs", metadata !177, i32 92, i64 64, i64 64, i64 384, i32 0, metadata !1000}
!1000 = metadata !{i32 458767, metadata !432, metadata !"", metadata !432, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1001}
!1001 = metadata !{i32 458773, metadata !432, metadata !"", metadata !432, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1002, i32 0, null}
!1002 = metadata !{metadata !433, metadata !935, metadata !945}
!1003 = metadata !{i32 458765, metadata !921, metadata !"open_hook", metadata !177, i32 100, i64 64, i64 64, i64 448, i32 0, metadata !1004}
!1004 = metadata !{i32 458767, metadata !432, metadata !"", metadata !432, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1005}
!1005 = metadata !{i32 458773, metadata !432, metadata !"", metadata !432, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1006, i32 0, null}
!1006 = metadata !{metadata !433}
!1007 = metadata !{i32 458765, metadata !921, metadata !"close_hook", metadata !177, i32 101, i64 64, i64 64, i64 512, i32 0, metadata !1004}
!1008 = metadata !{i32 458765, metadata !913, metadata !"fp", metadata !177, i32 121, i64 64, i64 64, i64 8256, i32 0, metadata !945}
!1009 = metadata !{i32 458765, metadata !913, metadata !"head", metadata !177, i32 129, i64 64, i64 64, i64 8320, i32 0, metadata !1010}
!1010 = metadata !{i32 458767, metadata !432, metadata !"", metadata !432, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1011}
!1011 = metadata !{i32 458771, metadata !432, metadata !"commonio_entry", metadata !177, i32 46, i64 320, i64 64, i64 0, i32 0, null, metadata !1012, i32 0, null}
!1012 = metadata !{metadata !1013, metadata !1014, metadata !1015, metadata !1016, metadata !1017}
!1013 = metadata !{i32 458765, metadata !1011, metadata !"line", metadata !177, i32 47, i64 64, i64 64, i64 0, i32 0, metadata !951}
!1014 = metadata !{i32 458765, metadata !1011, metadata !"eptr", metadata !177, i32 48, i64 64, i64 64, i64 64, i32 0, metadata !911}
!1015 = metadata !{i32 458765, metadata !1011, metadata !"prev", metadata !177, i32 49, i64 64, i64 64, i64 128, i32 0, metadata !1010}
!1016 = metadata !{i32 458765, metadata !1011, metadata !"next", metadata !177, i32 50, i64 64, i64 64, i64 192, i32 0, metadata !1010}
!1017 = metadata !{i32 458765, metadata !1011, metadata !"changed", metadata !177, i32 51, i64 1, i64 8, i64 256, i32 0, metadata !435}
!1018 = metadata !{i32 458765, metadata !913, metadata !"tail", metadata !177, i32 130, i64 64, i64 64, i64 8384, i32 0, metadata !1010}
!1019 = metadata !{i32 458765, metadata !913, metadata !"cursor", metadata !177, i32 131, i64 64, i64 64, i64 8448, i32 0, metadata !1010}
!1020 = metadata !{i32 458765, metadata !913, metadata !"changed", metadata !177, i32 136, i64 1, i64 8, i64 8512, i32 0, metadata !435}
!1021 = metadata !{i32 458765, metadata !913, metadata !"isopen", metadata !177, i32 137, i64 1, i64 8, i64 8513, i32 0, metadata !435}
!1022 = metadata !{i32 458765, metadata !913, metadata !"locked", metadata !177, i32 138, i64 1, i64 8, i64 8514, i32 0, metadata !435}
!1023 = metadata !{i32 458765, metadata !913, metadata !"readonly", metadata !177, i32 139, i64 1, i64 8, i64 8515, i32 0, metadata !435}
!1024 = metadata !{i32 164, i32 0, metadata !1025, metadata !1040}
!1025 = metadata !{i32 458763, metadata !1026, i32 163, i32 0}
!1026 = metadata !{i32 458798, i32 0, metadata !175, metadata !"gr_locate", metadata !"gr_locate", metadata !"gr_locate", metadata !175, i32 163, metadata !1027, i1 false, i1 true, i32 0, i32 0, null, i1 false}
!1027 = metadata !{i32 458773, metadata !175, metadata !"", metadata !175, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1028, i32 0, null}
!1028 = metadata !{metadata !1029, metadata !192}
!1029 = metadata !{i32 458767, metadata !175, metadata !"", metadata !175, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1030}
!1030 = metadata !{i32 458790, metadata !175, metadata !"", metadata !175, i32 0, i64 256, i64 64, i64 0, i32 0, metadata !1031}
!1031 = metadata !{i32 458771, metadata !175, metadata !"group", metadata !63, i32 45, i64 256, i64 64, i64 0, i32 0, null, metadata !1032, i32 0, null}
!1032 = metadata !{metadata !1033, metadata !1034, metadata !1035, metadata !1038}
!1033 = metadata !{i32 458765, metadata !1031, metadata !"gr_name", metadata !63, i32 46, i64 64, i64 64, i64 0, i32 0, metadata !212}
!1034 = metadata !{i32 458765, metadata !1031, metadata !"gr_passwd", metadata !63, i32 47, i64 64, i64 64, i64 64, i32 0, metadata !212}
!1035 = metadata !{i32 458765, metadata !1031, metadata !"gr_gid", metadata !63, i32 48, i64 32, i64 32, i64 128, i32 0, metadata !1036}
!1036 = metadata !{i32 458774, metadata !175, metadata !"__gid_t", metadata !69, i32 136, i64 0, i64 0, i64 0, i32 0, metadata !1037}
!1037 = metadata !{i32 458788, metadata !175, metadata !"unsigned int", metadata !175, i32 0, i64 32, i64 32, i64 0, i32 0, i32 7}
!1038 = metadata !{i32 458765, metadata !1031, metadata !"gr_mem", metadata !63, i32 49, i64 64, i64 64, i64 192, i32 0, metadata !1039}
!1039 = metadata !{i32 458767, metadata !175, metadata !"", metadata !175, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !212}
!1040 = metadata !{i32 812, i32 0, metadata !899, metadata !901}
!1041 = metadata !{i32 1174, i32 0, metadata !907, metadata !1024}
!1042 = metadata !{i32 1050, i32 0, metadata !1043, metadata !1047}
!1043 = metadata !{i32 458763, metadata !1044, i32 1049, i32 0}
!1044 = metadata !{i32 458798, i32 0, metadata !432, metadata !"find_entry_by_name", metadata !"find_entry_by_name", metadata !"find_entry_by_name", metadata !432, i32 1049, metadata !1045, i1 true, i1 true, i32 0, i32 0, null, i1 false}
!1045 = metadata !{i32 458773, metadata !432, metadata !"", metadata !432, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1046, i32 0, null}
!1046 = metadata !{metadata !1010, metadata !912, metadata !935}
!1047 = metadata !{i32 1177, i32 0, metadata !907, metadata !1024}
!1048 = metadata !{i32 1178, i32 0, metadata !907, metadata !1024}
!1049 = metadata !{i32 1179, i32 0, metadata !907, metadata !1024}
!1050 = metadata !{i32 1182, i32 0, metadata !907, metadata !1024}
!1051 = metadata !{i32 1183, i32 0, metadata !907, metadata !1024}
!1052 = metadata !{i32 813, i32 0, metadata !899, metadata !901}
!1053 = metadata !{i32 814, i32 0, metadata !899, metadata !901}
!1054 = metadata !{i32 817, i32 0, metadata !899, metadata !901}
!1055 = metadata !{i32 820, i32 0, metadata !899, metadata !901}
!1056 = metadata !{i32 821, i32 0, metadata !899, metadata !901}
!1057 = metadata !{i32 67, i32 0, metadata !572, metadata !1056}
!1058 = metadata !{i32 822, i32 0, metadata !899, metadata !901}
!1059 = metadata !{i32 67, i32 0, metadata !572, metadata !1058}
!1060 = metadata !{i32 823, i32 0, metadata !899, metadata !901}
!1061 = metadata !{i32 201, i32 0, metadata !1062, metadata !1064}
!1062 = metadata !{i32 458763, metadata !1063, i32 200, i32 0}
!1063 = metadata !{i32 458798, i32 0, metadata !175, metadata !"gr_close", metadata !"gr_close", metadata !"gr_close", metadata !175, i32 200, metadata !270, i1 false, i1 true, i32 0, i32 0, null, i1 false}
!1064 = metadata !{i32 825, i32 0, metadata !899, metadata !901}
!1065 = metadata !{i32 826, i32 0, metadata !899, metadata !901}
!1066 = metadata !{i32 829, i32 0, metadata !1067, metadata !901}
!1067 = metadata !{i32 458763, metadata !899, i32 826, i32 0}
!1068 = metadata !{i32 832, i32 0, metadata !899, metadata !901}
!1069 = metadata !{i32 836, i32 0, metadata !899, metadata !901}
!1070 = metadata !{i32 251, i32 0, metadata !1071, metadata !1075}
!1071 = metadata !{i32 458763, metadata !1072, i32 250, i32 0}
!1072 = metadata !{i32 458798, i32 0, metadata !315, metadata !"sgr_open", metadata !"sgr_open", metadata !"sgr_open", metadata !315, i32 250, metadata !1073, i1 false, i1 true, i32 0, i32 0, null, i1 false}
!1073 = metadata !{i32 458773, metadata !315, metadata !"", metadata !315, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1074, i32 0, null}
!1074 = metadata !{metadata !342, metadata !342}
!1075 = metadata !{i32 837, i32 0, metadata !899, metadata !901}
!1076 = metadata !{i32 838, i32 0, metadata !899, metadata !901}
!1077 = metadata !{i32 841, i32 0, metadata !1078, metadata !901}
!1078 = metadata !{i32 458763, metadata !899, i32 838, i32 0}
!1079 = metadata !{i32 842, i32 0, metadata !899, metadata !901}
!1080 = metadata !{i32 1173, i32 0, metadata !907, metadata !1081}
!1081 = metadata !{i32 256, i32 0, metadata !1082, metadata !1095}
!1082 = metadata !{i32 458763, metadata !1083, i32 255, i32 0}
!1083 = metadata !{i32 458798, i32 0, metadata !315, metadata !"sgr_locate", metadata !"sgr_locate", metadata !"sgr_locate", metadata !315, i32 255, metadata !1084, i1 false, i1 true, i32 0, i32 0, null, i1 false}
!1084 = metadata !{i32 458773, metadata !315, metadata !"", metadata !315, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1085, i32 0, null}
!1085 = metadata !{metadata !1086, metadata !331}
!1086 = metadata !{i32 458767, metadata !315, metadata !"", metadata !315, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1087}
!1087 = metadata !{i32 458790, metadata !315, metadata !"", metadata !315, i32 0, i64 256, i64 64, i64 0, i32 0, metadata !1088}
!1088 = metadata !{i32 458771, metadata !315, metadata !"sgrp", metadata !452, i32 43, i64 256, i64 64, i64 0, i32 0, null, metadata !1089, i32 0, null}
!1089 = metadata !{metadata !1090, metadata !1091, metadata !1092, metadata !1094}
!1090 = metadata !{i32 458765, metadata !1088, metadata !"sg_name", metadata !452, i32 44, i64 64, i64 64, i64 0, i32 0, metadata !349}
!1091 = metadata !{i32 458765, metadata !1088, metadata !"sg_passwd", metadata !452, i32 45, i64 64, i64 64, i64 64, i32 0, metadata !349}
!1092 = metadata !{i32 458765, metadata !1088, metadata !"sg_adm", metadata !452, i32 46, i64 64, i64 64, i64 128, i32 0, metadata !1093}
!1093 = metadata !{i32 458767, metadata !315, metadata !"", metadata !315, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !349}
!1094 = metadata !{i32 458765, metadata !1088, metadata !"sg_mem", metadata !452, i32 47, i64 64, i64 64, i64 192, i32 0, metadata !1093}
!1095 = metadata !{i32 844, i32 0, metadata !899, metadata !901}
!1096 = metadata !{i32 1174, i32 0, metadata !907, metadata !1081}
!1097 = metadata !{i32 1050, i32 0, metadata !1043, metadata !1098}
!1098 = metadata !{i32 1177, i32 0, metadata !907, metadata !1081}
!1099 = metadata !{i32 1178, i32 0, metadata !907, metadata !1081}
!1100 = metadata !{i32 1179, i32 0, metadata !907, metadata !1081}
!1101 = metadata !{i32 1182, i32 0, metadata !907, metadata !1081}
!1102 = metadata !{i32 1183, i32 0, metadata !907, metadata !1081}
!1103 = metadata !{i32 845, i32 0, metadata !899, metadata !901}
!1104 = metadata !{i32 846, i32 0, metadata !899, metadata !901}
!1105 = metadata !{i32 847, i32 0, metadata !899, metadata !901}
!1106 = metadata !{i32 67, i32 0, metadata !572, metadata !1105}
!1107 = metadata !{i32 848, i32 0, metadata !899, metadata !901}
!1108 = metadata !{i32 67, i32 0, metadata !572, metadata !1107}
!1109 = metadata !{i32 850, i32 0, metadata !899, metadata !901}
!1110 = metadata !{i32 851, i32 0, metadata !899, metadata !901}
!1111 = metadata !{i32 853, i32 0, metadata !899, metadata !901}
!1112 = metadata !{i32 67, i32 0, metadata !572, metadata !1111}
!1113 = metadata !{i32 854, i32 0, metadata !899, metadata !901}
!1114 = metadata !{i32 855, i32 0, metadata !899, metadata !901}
!1115 = metadata !{i32 857, i32 0, metadata !899, metadata !901}
!1116 = metadata !{i32 859, i32 0, metadata !899, metadata !901}
!1117 = metadata !{i32 867, i32 0, metadata !899, metadata !901}
!1118 = metadata !{i32 281, i32 0, metadata !1119, metadata !1121}
!1119 = metadata !{i32 458763, metadata !1120, i32 280, i32 0}
!1120 = metadata !{i32 458798, i32 0, metadata !315, metadata !"sgr_close", metadata !"sgr_close", metadata !"sgr_close", metadata !315, i32 280, metadata !403, i1 false, i1 true, i32 0, i32 0, null, i1 false}
!1121 = metadata !{i32 871, i32 0, metadata !899, metadata !901}
!1122 = metadata !{i32 872, i32 0, metadata !899, metadata !901}
!1123 = metadata !{i32 875, i32 0, metadata !1124, metadata !901}
!1124 = metadata !{i32 458763, metadata !899, i32 872, i32 0}
!1125 = metadata !{i32 878, i32 0, metadata !899, metadata !901}
!1126 = metadata !{i32 711, i32 0, metadata !1127, metadata !1135}
!1127 = metadata !{i32 458763, metadata !1128, i32 707, i32 0}
!1128 = metadata !{i32 458798, i32 0, metadata !1, metadata !"check_perms", metadata !"check_perms", metadata !"check_perms", metadata !1, i32 707, metadata !1129, i1 true, i1 true, i32 0, i32 0, null, i1 false}
!1129 = metadata !{i32 458773, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1130, i32 0, null}
!1130 = metadata !{null, metadata !1131, metadata !1133}
!1131 = metadata !{i32 458767, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1132}
!1132 = metadata !{i32 458790, metadata !1, metadata !"", metadata !1, i32 0, i64 256, i64 64, i64 0, i32 0, metadata !62}
!1133 = metadata !{i32 458767, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1134}
!1134 = metadata !{i32 458790, metadata !1, metadata !"", metadata !1, i32 0, i64 256, i64 64, i64 0, i32 0, metadata !72}
!1135 = metadata !{i32 1036, i32 0, metadata !687, null}
!1136 = metadata !{i32 221, i32 0, metadata !1137, metadata !1140}
!1137 = metadata !{i32 458763, metadata !1138, i32 220, i32 0}
!1138 = metadata !{i32 458798, i32 0, metadata !1, metadata !"failure", metadata !"failure", metadata !"failure", metadata !1, i32 220, metadata !1139, i1 true, i1 true, i32 0, i32 0, null, i1 false}
!1139 = metadata !{i32 458773, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !108, i32 0, null}
!1140 = metadata !{i32 712, i32 0, metadata !1127, metadata !1135}
!1141 = metadata !{i32 222, i32 0, metadata !1137, metadata !1140}
!1142 = metadata !{i32 223, i32 0, metadata !1137, metadata !1140}
!1143 = metadata !{i32 716, i32 0, metadata !1127, metadata !1135}
!1144 = metadata !{i32 724, i32 0, metadata !1127, metadata !1135}
!1145 = metadata !{i32 180, i32 0, metadata !1146, metadata !1144}
!1146 = metadata !{i32 458763, metadata !1147, i32 179, i32 0}
!1147 = metadata !{i32 458798, i32 0, metadata !1148, metadata !"is_on_list", metadata !"is_on_list", metadata !"is_on_list", metadata !1148, i32 179, metadata !1149, i1 false, i1 true, i32 0, i32 0, null, i1 false}
!1148 = metadata !{i32 458769, i32 0, i32 1, metadata !"list.c", metadata !"/home/heming/rcs/direct-sym/apps/shadow/shadow-4.1.5/obj/libmisc/../../libmisc", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.7)", i1 true, i1 false, metadata !"", i32 0}
!1149 = metadata !{i32 458773, metadata !1148, metadata !"", metadata !1148, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1150, i32 0, null}
!1150 = metadata !{metadata !1151, metadata !1152, metadata !1156}
!1151 = metadata !{i32 458788, metadata !1148, metadata !"_Bool", metadata !1148, i32 0, i64 8, i64 8, i64 0, i32 0, i32 2}
!1152 = metadata !{i32 458767, metadata !1148, metadata !"", metadata !1148, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1153}
!1153 = metadata !{i32 458790, metadata !1148, metadata !"", metadata !1148, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1154}
!1154 = metadata !{i32 458767, metadata !1148, metadata !"", metadata !1148, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1155}
!1155 = metadata !{i32 458788, metadata !1148, metadata !"char", metadata !1148, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6}
!1156 = metadata !{i32 458767, metadata !1148, metadata !"", metadata !1148, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1157}
!1157 = metadata !{i32 458790, metadata !1148, metadata !"", metadata !1148, i32 0, i64 8, i64 8, i64 0, i32 0, metadata !1155}
!1158 = metadata !{i32 181, i32 0, metadata !1146, metadata !1144}
!1159 = metadata !{i32 184, i32 0, metadata !1146, metadata !1144}
!1160 = metadata !{i32 187, i32 0, metadata !1146, metadata !1144}
!1161 = metadata !{i32 183, i32 0, metadata !1146, metadata !1144}
!1162 = metadata !{i32 221, i32 0, metadata !1137, metadata !1163}
!1163 = metadata !{i32 725, i32 0, metadata !1127, metadata !1135}
!1164 = metadata !{i32 222, i32 0, metadata !1137, metadata !1163}
!1165 = metadata !{i32 223, i32 0, metadata !1137, metadata !1163}
!1166 = metadata !{i32 755, i32 0, metadata !1127, metadata !1135}
!1167 = metadata !{i32 221, i32 0, metadata !1137, metadata !1168}
!1168 = metadata !{i32 756, i32 0, metadata !1127, metadata !1135}
!1169 = metadata !{i32 222, i32 0, metadata !1137, metadata !1168}
!1170 = metadata !{i32 223, i32 0, metadata !1137, metadata !1168}
!1171 = metadata !{i32 1045, i32 0, metadata !687, null}
!1172 = metadata !{i32 1047, i32 0, metadata !687, null}
!1173 = metadata !{i32 1048, i32 0, metadata !687, null}
!1174 = metadata !{i32 1049, i32 0, metadata !687, null}
!1175 = metadata !{i32 1053, i32 0, metadata !687, null}
!1176 = metadata !{i32 1056, i32 0, metadata !687, null}
!1177 = metadata !{i32 1062, i32 0, metadata !687, null}
!1178 = metadata !{i32 1063, i32 0, metadata !687, null}
!1179 = metadata !{i32 1064, i32 0, metadata !687, null}
!1180 = metadata !{i32 1068, i32 0, metadata !687, null}
!1181 = metadata !{i32 1077, i32 0, metadata !687, null}
!1182 = metadata !{i32 1078, i32 0, metadata !687, null}
!1183 = metadata !{i32 1079, i32 0, metadata !687, null}
!1184 = metadata !{i32 1081, i32 0, metadata !687, null}
!1185 = metadata !{i32 1082, i32 0, metadata !687, null}
!1186 = metadata !{i32 1092, i32 0, metadata !687, null}
!1187 = metadata !{i32 1095, i32 0, metadata !1188, null}
!1188 = metadata !{i32 458763, metadata !687, i32 1092, i32 0}
!1189 = metadata !{i32 1097, i32 0, metadata !1188, null}
!1190 = metadata !{i32 180, i32 0, metadata !1146, metadata !1189}
!1191 = metadata !{i32 181, i32 0, metadata !1146, metadata !1189}
!1192 = metadata !{i32 184, i32 0, metadata !1146, metadata !1189}
!1193 = metadata !{i32 187, i32 0, metadata !1146, metadata !1189}
!1194 = metadata !{i32 183, i32 0, metadata !1146, metadata !1189}
!1195 = metadata !{i32 1099, i32 0, metadata !1188, null}
!1196 = metadata !{i32 1102, i32 0, metadata !1188, null}
!1197 = metadata !{i32 1103, i32 0, metadata !1188, null}
!1198 = metadata !{i32 180, i32 0, metadata !1146, metadata !1197}
!1199 = metadata !{i32 181, i32 0, metadata !1146, metadata !1197}
!1200 = metadata !{i32 184, i32 0, metadata !1146, metadata !1197}
!1201 = metadata !{i32 187, i32 0, metadata !1146, metadata !1197}
!1202 = metadata !{i32 183, i32 0, metadata !1146, metadata !1197}
!1203 = metadata !{i32 1105, i32 0, metadata !1188, null}
!1204 = metadata !{i32 1109, i32 0, metadata !1188, null}
!1205 = metadata !{i32 1110, i32 0, metadata !1188, null}
!1206 = metadata !{i32 1113, i32 0, metadata !1188, null}
!1207 = metadata !{i32 1123, i32 0, metadata !687, null}
!1208 = metadata !{i32 1124, i32 0, metadata !687, null}
!1209 = metadata !{i32 1125, i32 0, metadata !687, null}
!1210 = metadata !{i32 1136, i32 0, metadata !687, null}
!1211 = metadata !{i32 1138, i32 0, metadata !687, null}
!1212 = metadata !{i32 1140, i32 0, metadata !687, null}
!1213 = metadata !{i32 1149, i32 0, metadata !687, null}
!1214 = metadata !{i32 1150, i32 0, metadata !687, null}
!1215 = metadata !{i32 1151, i32 0, metadata !687, null}
!1216 = metadata !{i32 168, i32 0, metadata !563, metadata !1217}
!1217 = metadata !{i32 1154, i32 0, metadata !687, null}
!1218 = metadata !{i32 1156, i32 0, metadata !687, null}
!1219 = metadata !{i32 1157, i32 0, metadata !687, null}
!1220 = metadata !{i32 1158, i32 0, metadata !687, null}
!1221 = metadata !{i32 1159, i32 0, metadata !687, null}
!1222 = metadata !{i32 1161, i32 0, metadata !687, null}
!1223 = metadata !{i32 908, i32 0, metadata !1224, metadata !1225}
!1224 = metadata !{i32 458763, metadata !58, i32 897, i32 0}
!1225 = metadata !{i32 1166, i32 0, metadata !687, null}
!1226 = metadata !{i32 910, i32 0, metadata !1224, metadata !1225}
!1227 = metadata !{i32 911, i32 0, metadata !1224, metadata !1225}
!1228 = metadata !{i32 912, i32 0, metadata !1224, metadata !1225}
!1229 = metadata !{i32 913, i32 0, metadata !1224, metadata !1225}
!1230 = metadata !{i32 916, i32 0, metadata !1224, metadata !1225}
!1231 = metadata !{i32 917, i32 0, metadata !1224, metadata !1225}
!1232 = metadata !{i32 918, i32 0, metadata !1224, metadata !1225}
!1233 = metadata !{i32 919, i32 0, metadata !1224, metadata !1225}
!1234 = metadata !{i32 920, i32 0, metadata !1224, metadata !1225}
!1235 = metadata !{i32 923, i32 0, metadata !1224, metadata !1225}
!1236 = metadata !{i32 924, i32 0, metadata !1224, metadata !1225}
!1237 = metadata !{i32 931, i32 0, metadata !1224, metadata !1225}
!1238 = metadata !{i32 932, i32 0, metadata !1224, metadata !1225}
!1239 = metadata !{i32 936, i32 0, metadata !1224, metadata !1225}
!1240 = metadata !{i32 937, i32 0, metadata !1224, metadata !1225}
!1241 = metadata !{i32 938, i32 0, metadata !1224, metadata !1225}
!1242 = metadata !{i32 944, i32 0, metadata !1224, metadata !1225}
!1243 = metadata !{i32 945, i32 0, metadata !1224, metadata !1225}
!1244 = metadata !{i32 946, i32 0, metadata !1224, metadata !1225}
!1245 = metadata !{i32 950, i32 0, metadata !1224, metadata !1225}
!1246 = metadata !{i32 1178, i32 0, metadata !687, null}
!1247 = metadata !{i32 1179, i32 0, metadata !687, null}
!1248 = metadata !{i32 1180, i32 0, metadata !1249, null}
!1249 = metadata !{i32 458763, metadata !687, i32 1179, i32 0}
!1250 = metadata !{i32 1181, i32 0, metadata !687, null}
!1251 = metadata !{i32 1182, i32 0, metadata !687, null}
!1252 = metadata !{i32 58, i32 0, metadata !1253, metadata !1257}
!1253 = metadata !{i32 458763, metadata !1254, i32 53, i32 0}
!1254 = metadata !{i32 458798, i32 0, metadata !1255, metadata !"pwd_init", metadata !"pwd_init", metadata !"pwd_init", metadata !1255, i32 53, metadata !1256, i1 false, i1 true, i32 0, i32 0, null, i1 false}
!1255 = metadata !{i32 458769, i32 0, i32 1, metadata !"pwd_init.c", metadata !"/home/heming/rcs/direct-sym/apps/shadow/shadow-4.1.5/obj/libmisc/../../libmisc", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.7)", i1 true, i1 false, metadata !"", i32 0}
!1256 = metadata !{i32 458773, metadata !1255, metadata !"", metadata !1255, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !108, i32 0, null}
!1257 = metadata !{i32 1184, i32 0, metadata !687, null}
!1258 = metadata !{i32 59, i32 0, metadata !1253, metadata !1257}
!1259 = metadata !{i32 61, i32 0, metadata !1253, metadata !1257}
!1260 = metadata !{i32 63, i32 0, metadata !1253, metadata !1257}
!1261 = metadata !{i32 66, i32 0, metadata !1253, metadata !1257}
!1262 = metadata !{i32 69, i32 0, metadata !1253, metadata !1257}
!1263 = metadata !{i32 72, i32 0, metadata !1253, metadata !1257}
!1264 = metadata !{i32 75, i32 0, metadata !1253, metadata !1257}
!1265 = metadata !{i32 78, i32 0, metadata !1253, metadata !1257}
!1266 = metadata !{i32 81, i32 0, metadata !1253, metadata !1257}
!1267 = metadata !{i32 88, i32 0, metadata !1253, metadata !1257}
!1268 = metadata !{i32 89, i32 0, metadata !1253, metadata !1257}
!1269 = metadata !{i32 90, i32 0, metadata !1253, metadata !1257}
!1270 = metadata !{i32 91, i32 0, metadata !1253, metadata !1257}
!1271 = metadata !{i32 92, i32 0, metadata !1253, metadata !1257}
!1272 = metadata !{i32 93, i32 0, metadata !1253, metadata !1257}
!1273 = metadata !{i32 95, i32 0, metadata !1253, metadata !1257}
!1274 = metadata !{i32 98, i32 0, metadata !1253, metadata !1257}
!1275 = metadata !{i32 101, i32 0, metadata !1253, metadata !1257}
!1276 = metadata !{i32 154, i32 0, metadata !1277, metadata !1279}
!1277 = metadata !{i32 458763, metadata !1278, i32 153, i32 0}
!1278 = metadata !{i32 458798, i32 0, metadata !175, metadata !"gr_lock", metadata !"gr_lock", metadata !"gr_lock", metadata !175, i32 153, metadata !270, i1 false, i1 true, i32 0, i32 0, null, i1 false}
!1279 = metadata !{i32 351, i32 0, metadata !1280, metadata !1282}
!1280 = metadata !{i32 458763, metadata !1281, i32 350, i32 0}
!1281 = metadata !{i32 458798, i32 0, metadata !1, metadata !"open_files", metadata !"open_files", metadata !"open_files", metadata !1, i32 350, metadata !1139, i1 true, i1 true, i32 0, i32 0, null, i1 false}
!1282 = metadata !{i32 1186, i32 0, metadata !687, null}
!1283 = metadata !{i32 352, i32 0, metadata !1280, metadata !1282}
!1284 = metadata !{i32 355, i32 0, metadata !1280, metadata !1282}
!1285 = metadata !{i32 360, i32 0, metadata !1280, metadata !1282}
!1286 = metadata !{i32 246, i32 0, metadata !1287, metadata !1289}
!1287 = metadata !{i32 458763, metadata !1288, i32 245, i32 0}
!1288 = metadata !{i32 458798, i32 0, metadata !315, metadata !"sgr_lock", metadata !"sgr_lock", metadata !"sgr_lock", metadata !315, i32 245, metadata !403, i1 false, i1 true, i32 0, i32 0, null, i1 false}
!1289 = metadata !{i32 361, i32 0, metadata !1280, metadata !1282}
!1290 = metadata !{i32 362, i32 0, metadata !1280, metadata !1282}
!1291 = metadata !{i32 365, i32 0, metadata !1280, metadata !1282}
!1292 = metadata !{i32 367, i32 0, metadata !1280, metadata !1282}
!1293 = metadata !{i32 159, i32 0, metadata !894, metadata !1294}
!1294 = metadata !{i32 373, i32 0, metadata !1280, metadata !1282}
!1295 = metadata !{i32 374, i32 0, metadata !1280, metadata !1282}
!1296 = metadata !{i32 377, i32 0, metadata !1297, metadata !1282}
!1297 = metadata !{i32 458763, metadata !1280, i32 350, i32 0}
!1298 = metadata !{i32 378, i32 0, metadata !1280, metadata !1282}
!1299 = metadata !{i32 382, i32 0, metadata !1280, metadata !1282}
!1300 = metadata !{i32 251, i32 0, metadata !1071, metadata !1301}
!1301 = metadata !{i32 383, i32 0, metadata !1280, metadata !1282}
!1302 = metadata !{i32 384, i32 0, metadata !1280, metadata !1282}
!1303 = metadata !{i32 387, i32 0, metadata !1304, metadata !1282}
!1304 = metadata !{i32 458763, metadata !1280, i32 384, i32 0}
!1305 = metadata !{i32 388, i32 0, metadata !1280, metadata !1282}
!1306 = metadata !{i32 390, i32 0, metadata !1280, metadata !1282}
!1307 = metadata !{i32 395, i32 0, metadata !1280, metadata !1282}
!1308 = metadata !{i32 181, i32 0, metadata !1309, metadata !1313}
!1309 = metadata !{i32 458763, metadata !1310, i32 180, i32 0}
!1310 = metadata !{i32 458798, i32 0, metadata !175, metadata !"gr_update", metadata !"gr_update", metadata !"gr_update", metadata !175, i32 180, metadata !1311, i1 false, i1 true, i32 0, i32 0, null, i1 false}
!1311 = metadata !{i32 458773, metadata !175, metadata !"", metadata !175, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1312, i32 0, null}
!1312 = metadata !{metadata !203, metadata !1029}
!1313 = metadata !{i32 771, i32 0, metadata !1314, metadata !1316}
!1314 = metadata !{i32 458763, metadata !1315, i32 770, i32 0}
!1315 = metadata !{i32 458798, i32 0, metadata !1, metadata !"update_group", metadata !"update_group", metadata !"update_group", metadata !1, i32 770, metadata !59, i1 true, i1 true, i32 0, i32 0, null, i1 false}
!1316 = metadata !{i32 1189, i32 0, metadata !687, null}
!1317 = metadata !{i32 772, i32 0, metadata !1314, metadata !1316}
!1318 = metadata !{i32 775, i32 0, metadata !1314, metadata !1316}
!1319 = metadata !{i32 778, i32 0, metadata !1314, metadata !1316}
!1320 = metadata !{i32 261, i32 0, metadata !1321, metadata !1319}
!1321 = metadata !{i32 458763, metadata !1322, i32 260, i32 0}
!1322 = metadata !{i32 458798, i32 0, metadata !315, metadata !"sgr_update", metadata !"sgr_update", metadata !"sgr_update", metadata !315, i32 260, metadata !1323, i1 false, i1 true, i32 0, i32 0, null, i1 false}
!1323 = metadata !{i32 458773, metadata !315, metadata !"", metadata !315, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1324, i32 0, null}
!1324 = metadata !{metadata !342, metadata !1086}
!1325 = metadata !{i32 779, i32 0, metadata !1314, metadata !1316}
!1326 = metadata !{i32 782, i32 0, metadata !1314, metadata !1316}
!1327 = metadata !{i32 201, i32 0, metadata !1062, metadata !1328}
!1328 = metadata !{i32 665, i32 0, metadata !1329, metadata !1331}
!1329 = metadata !{i32 458763, metadata !1330, i32 664, i32 0}
!1330 = metadata !{i32 458798, i32 0, metadata !1, metadata !"close_files", metadata !"close_files", metadata !"close_files", metadata !1, i32 664, metadata !1139, i1 true, i1 true, i32 0, i32 0, null, i1 false}
!1331 = metadata !{i32 1194, i32 0, metadata !687, null}
!1332 = metadata !{i32 666, i32 0, metadata !1329, metadata !1331}
!1333 = metadata !{i32 669, i32 0, metadata !1329, metadata !1331}
!1334 = metadata !{i32 672, i32 0, metadata !1329, metadata !1331}
!1335 = metadata !{i32 674, i32 0, metadata !1329, metadata !1331}
!1336 = metadata !{i32 675, i32 0, metadata !1329, metadata !1331}
!1337 = metadata !{i32 678, i32 0, metadata !1329, metadata !1331}
!1338 = metadata !{i32 281, i32 0, metadata !1119, metadata !1339}
!1339 = metadata !{i32 679, i32 0, metadata !1329, metadata !1331}
!1340 = metadata !{i32 680, i32 0, metadata !1329, metadata !1331}
!1341 = metadata !{i32 683, i32 0, metadata !1329, metadata !1331}
!1342 = metadata !{i32 685, i32 0, metadata !1329, metadata !1331}
!1343 = metadata !{i32 687, i32 0, metadata !1329, metadata !1331}
!1344 = metadata !{i32 688, i32 0, metadata !1329, metadata !1331}
!1345 = metadata !{i32 693, i32 0, metadata !1329, metadata !1331}
!1346 = metadata !{i32 1198, i32 0, metadata !687, null}
!1347 = metadata !{i32 71, i32 0, metadata !1348, null}
!1348 = metadata !{i32 458763, metadata !1349, i32 67, i32 0}
!1349 = metadata !{i32 458798, i32 0, metadata !88, metadata !"do_cleanups", metadata !"do_cleanups", metadata !"do_cleanups", metadata !88, i32 67, metadata !1350, i1 false, i1 true, i32 0, i32 0, null, i1 false}
!1350 = metadata !{i32 458773, metadata !88, metadata !"", metadata !88, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !108, i32 0, null}
!1351 = metadata !{i32 73, i32 0, metadata !1348, null}
!1352 = metadata !{i32 80, i32 0, metadata !1348, null}
!1353 = metadata !{i32 81, i32 0, metadata !1348, null}
!1354 = metadata !{i32 83, i32 0, metadata !1348, null}
!1355 = metadata !{i32 92, i32 0, metadata !1356, null}
!1356 = metadata !{i32 458763, metadata !1357, i32 90, i32 0}
!1357 = metadata !{i32 458798, i32 0, metadata !88, metadata !"add_cleanup", metadata !"add_cleanup", metadata !"add_cleanup", metadata !88, i32 90, metadata !1358, i1 false, i1 true, i32 0, i32 0, null, i1 false}
!1358 = metadata !{i32 458773, metadata !88, metadata !"", metadata !88, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1359, i32 0, null}
!1359 = metadata !{null, metadata !93, metadata !98}
!1360 = metadata !{i32 94, i32 0, metadata !1356, null}
!1361 = metadata !{i32 96, i32 0, metadata !1356, null}
!1362 = metadata !{i32 97, i32 0, metadata !1356, null}
!1363 = metadata !{i32 101, i32 0, metadata !1356, null}
!1364 = metadata !{i32 102, i32 0, metadata !1356, null}
!1365 = metadata !{i32 103, i32 0, metadata !1356, null}
!1366 = metadata !{i32 104, i32 0, metadata !1356, null}
!1367 = metadata !{i32 112, i32 0, metadata !1368, null}
!1368 = metadata !{i32 458763, metadata !1369, i32 110, i32 0}
!1369 = metadata !{i32 458798, i32 0, metadata !88, metadata !"del_cleanup", metadata !"del_cleanup", metadata !"del_cleanup", metadata !88, i32 110, metadata !1370, i1 false, i1 true, i32 0, i32 0, null, i1 false}
!1370 = metadata !{i32 458773, metadata !88, metadata !"", metadata !88, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1371, i32 0, null}
!1371 = metadata !{null, metadata !93}
!1372 = metadata !{i32 116, i32 0, metadata !1368, null}
!1373 = metadata !{i32 115, i32 0, metadata !1368, null}
!1374 = metadata !{i32 122, i32 0, metadata !1368, null}
!1375 = metadata !{i32 127, i32 0, metadata !1368, null}
!1376 = metadata !{i32 130, i32 0, metadata !1368, null}
!1377 = metadata !{i32 131, i32 0, metadata !1368, null}
!1378 = metadata !{i32 132, i32 0, metadata !1368, null}
!1379 = metadata !{i32 134, i32 0, metadata !1368, null}
!1380 = metadata !{i32 135, i32 0, metadata !1368, null}
!1381 = metadata !{i32 139, i32 0, metadata !1368, null}
!1382 = metadata !{i32 125, i32 0, metadata !1368, null}
!1383 = metadata !{i32 143, i32 0, metadata !1368, null}
!1384 = metadata !{i32 51, i32 0, metadata !1385, null}
!1385 = metadata !{i32 458763, metadata !1386, i32 47, i32 0}
!1386 = metadata !{i32 458798, i32 0, metadata !1148, metadata !"add_list", metadata !"add_list", metadata !"add_list", metadata !1148, i32 47, metadata !1387, i1 false, i1 true, i32 0, i32 0, null, i1 false}
!1387 = metadata !{i32 458773, metadata !1148, metadata !"", metadata !1148, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1388, i32 0, null}
!1388 = metadata !{metadata !1389, metadata !1389, metadata !1156}
!1389 = metadata !{i32 458767, metadata !1148, metadata !"", metadata !1148, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1154}
!1390 = metadata !{i32 52, i32 0, metadata !1385, null}
!1391 = metadata !{i32 60, i32 0, metadata !1385, null}
!1392 = metadata !{i32 59, i32 0, metadata !1385, null}
!1393 = metadata !{i32 70, i32 0, metadata !1385, null}
!1394 = metadata !{i32 55, i32 0, metadata !587, metadata !1393}
!1395 = metadata !{i32 56, i32 0, metadata !587, metadata !1393}
!1396 = metadata !{i32 57, i32 0, metadata !587, metadata !1393}
!1397 = metadata !{i32 60, i32 0, metadata !587, metadata !1393}
!1398 = metadata !{i32 78, i32 0, metadata !1385, null}
!1399 = metadata !{i32 79, i32 0, metadata !1385, null}
!1400 = metadata !{i32 67, i32 0, metadata !572, metadata !1401}
!1401 = metadata !{i32 82, i32 0, metadata !1385, null}
!1402 = metadata !{i32 55, i32 0, metadata !587, metadata !1400}
!1403 = metadata !{i32 56, i32 0, metadata !587, metadata !1400}
!1404 = metadata !{i32 57, i32 0, metadata !587, metadata !1400}
!1405 = metadata !{i32 60, i32 0, metadata !587, metadata !1400}
!1406 = metadata !{i32 83, i32 0, metadata !1385, null}
!1407 = metadata !{i32 85, i32 0, metadata !1385, null}
!1408 = metadata !{i32 101, i32 0, metadata !1409, null}
!1409 = metadata !{i32 458763, metadata !1410, i32 97, i32 0}
!1410 = metadata !{i32 458798, i32 0, metadata !1148, metadata !"del_list", metadata !"del_list", metadata !"del_list", metadata !1148, i32 97, metadata !1387, i1 false, i1 true, i32 0, i32 0, null, i1 false}
!1411 = metadata !{i32 102, i32 0, metadata !1409, null}
!1412 = metadata !{i32 110, i32 0, metadata !1409, null}
!1413 = metadata !{i32 109, i32 0, metadata !1409, null}
!1414 = metadata !{i32 115, i32 0, metadata !1409, null}
!1415 = metadata !{i32 124, i32 0, metadata !1409, null}
!1416 = metadata !{i32 55, i32 0, metadata !587, metadata !1415}
!1417 = metadata !{i32 56, i32 0, metadata !587, metadata !1415}
!1418 = metadata !{i32 57, i32 0, metadata !587, metadata !1415}
!1419 = metadata !{i32 60, i32 0, metadata !587, metadata !1415}
!1420 = metadata !{i32 132, i32 0, metadata !1409, null}
!1421 = metadata !{i32 133, i32 0, metadata !1409, null}
!1422 = metadata !{i32 134, i32 0, metadata !1409, null}
!1423 = metadata !{i32 135, i32 0, metadata !1409, null}
!1424 = metadata !{i32 139, i32 0, metadata !1409, null}
!1425 = metadata !{i32 141, i32 0, metadata !1409, null}
!1426 = metadata !{i32 155, i32 0, metadata !1427, null}
!1427 = metadata !{i32 458763, metadata !1428, i32 151, i32 0}
!1428 = metadata !{i32 458798, i32 0, metadata !1148, metadata !"dup_list", metadata !"dup_list", metadata !"dup_list", metadata !1148, i32 151, metadata !1429, i1 false, i1 true, i32 0, i32 0, null, i1 false}
!1429 = metadata !{i32 458773, metadata !1148, metadata !"", metadata !1148, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1430, i32 0, null}
!1430 = metadata !{metadata !1389, metadata !1152}
!1431 = metadata !{i32 157, i32 0, metadata !1427, null}
!1432 = metadata !{i32 159, i32 0, metadata !1427, null}
!1433 = metadata !{i32 55, i32 0, metadata !587, metadata !1432}
!1434 = metadata !{i32 56, i32 0, metadata !587, metadata !1432}
!1435 = metadata !{i32 57, i32 0, metadata !587, metadata !1432}
!1436 = metadata !{i32 60, i32 0, metadata !587, metadata !1432}
!1437 = metadata !{i32 161, i32 0, metadata !1427, null}
!1438 = metadata !{i32 67, i32 0, metadata !572, metadata !1439}
!1439 = metadata !{i32 163, i32 0, metadata !1427, null}
!1440 = metadata !{i32 55, i32 0, metadata !587, metadata !1438}
!1441 = metadata !{i32 56, i32 0, metadata !587, metadata !1438}
!1442 = metadata !{i32 57, i32 0, metadata !587, metadata !1438}
!1443 = metadata !{i32 60, i32 0, metadata !587, metadata !1438}
!1444 = metadata !{i32 164, i32 0, metadata !1427, null}
!1445 = metadata !{i32 165, i32 0, metadata !1427, null}
!1446 = metadata !{i32 162, i32 0, metadata !1427, null}
!1447 = metadata !{i32 168, i32 0, metadata !1427, null}
!1448 = metadata !{i32 169, i32 0, metadata !1427, null}
!1449 = metadata !{i32 205, i32 0, metadata !1450, null}
!1450 = metadata !{i32 458763, metadata !1451, i32 198, i32 0}
!1451 = metadata !{i32 458798, i32 0, metadata !1148, metadata !"comma_to_list", metadata !"comma_to_list", metadata !"comma_to_list", metadata !1148, i32 198, metadata !1452, i1 false, i1 true, i32 0, i32 0, null, i1 false}
!1452 = metadata !{i32 458773, metadata !1148, metadata !"", metadata !1148, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1453, i32 0, null}
!1453 = metadata !{metadata !1389, metadata !1156}
!1454 = metadata !{i32 67, i32 0, metadata !572, metadata !1455}
!1455 = metadata !{i32 211, i32 0, metadata !1450, null}
!1456 = metadata !{i32 55, i32 0, metadata !587, metadata !1454}
!1457 = metadata !{i32 56, i32 0, metadata !587, metadata !1454}
!1458 = metadata !{i32 57, i32 0, metadata !587, metadata !1454}
!1459 = metadata !{i32 60, i32 0, metadata !587, metadata !1454}
!1460 = metadata !{i32 217, i32 0, metadata !1450, null}
!1461 = metadata !{i32 218, i32 0, metadata !1450, null}
!1462 = metadata !{i32 219, i32 0, metadata !1450, null}
!1463 = metadata !{i32 220, i32 0, metadata !1450, null}
!1464 = metadata !{i32 230, i32 0, metadata !1450, null}
!1465 = metadata !{i32 236, i32 0, metadata !1450, null}
!1466 = metadata !{i32 55, i32 0, metadata !587, metadata !1465}
!1467 = metadata !{i32 56, i32 0, metadata !587, metadata !1465}
!1468 = metadata !{i32 57, i32 0, metadata !587, metadata !1465}
!1469 = metadata !{i32 60, i32 0, metadata !587, metadata !1465}
!1470 = metadata !{i32 242, i32 0, metadata !1450, null}
!1471 = metadata !{i32 243, i32 0, metadata !1450, null}
!1472 = metadata !{i32 269, i32 0, metadata !1450, null}
!1473 = metadata !{i32 253, i32 0, metadata !1450, null}
!1474 = metadata !{i32 254, i32 0, metadata !1450, null}
!1475 = metadata !{i32 255, i32 0, metadata !1450, null}
!1476 = metadata !{i32 256, i32 0, metadata !1450, null}
!1477 = metadata !{i32 257, i32 0, metadata !1450, null}
!1478 = metadata !{i32 252, i32 0, metadata !1450, null}
!1479 = metadata !{i32 260, i32 0, metadata !1450, null}
!1480 = metadata !{i32 206, i32 0, metadata !1481, metadata !1483}
!1481 = metadata !{i32 458763, metadata !1482, i32 205, i32 0}
!1482 = metadata !{i32 458798, i32 0, metadata !175, metadata !"gr_unlock", metadata !"gr_unlock", metadata !"gr_unlock", metadata !175, i32 205, metadata !270, i1 false, i1 true, i32 0, i32 0, null, i1 false}
!1483 = metadata !{i32 205, i32 0, metadata !1484, null}
!1484 = metadata !{i32 458763, metadata !1485, i32 204, i32 0}
!1485 = metadata !{i32 458798, i32 0, metadata !1486, metadata !"cleanup_unlock_group", metadata !"cleanup_unlock_group", metadata !"cleanup_unlock_group", metadata !1486, i32 204, metadata !1487, i1 false, i1 true, i32 0, i32 0, null, i1 false}
!1486 = metadata !{i32 458769, i32 0, i32 1, metadata !"cleanup_group.c", metadata !"/home/heming/rcs/direct-sym/apps/shadow/shadow-4.1.5/obj/libmisc/../../libmisc", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.7)", i1 true, i1 false, metadata !"", i32 0}
!1487 = metadata !{i32 458773, metadata !1486, metadata !"", metadata !1486, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1488, i32 0, null}
!1488 = metadata !{null, metadata !1489}
!1489 = metadata !{i32 458767, metadata !1486, metadata !"", metadata !1486, i32 0, i64 64, i64 64, i64 0, i32 0, null}
!1490 = metadata !{i32 206, i32 0, metadata !1484, null}
!1491 = metadata !{i32 209, i32 0, metadata !1492, null}
!1492 = metadata !{i32 458763, metadata !1484, i32 204, i32 0}
!1493 = metadata !{i32 215, i32 0, metadata !1492, null}
!1494 = metadata !{i32 286, i32 0, metadata !1495, metadata !1497}
!1495 = metadata !{i32 458763, metadata !1496, i32 285, i32 0}
!1496 = metadata !{i32 458798, i32 0, metadata !315, metadata !"sgr_unlock", metadata !"sgr_unlock", metadata !"sgr_unlock", metadata !315, i32 285, metadata !403, i1 false, i1 true, i32 0, i32 0, null, i1 false}
!1497 = metadata !{i32 225, i32 0, metadata !1498, null}
!1498 = metadata !{i32 458763, metadata !1499, i32 224, i32 0}
!1499 = metadata !{i32 458798, i32 0, metadata !1486, metadata !"cleanup_unlock_gshadow", metadata !"cleanup_unlock_gshadow", metadata !"cleanup_unlock_gshadow", metadata !1486, i32 224, metadata !1487, i1 false, i1 true, i32 0, i32 0, null, i1 false}
!1500 = metadata !{i32 226, i32 0, metadata !1498, null}
!1501 = metadata !{i32 229, i32 0, metadata !1502, null}
!1502 = metadata !{i32 458763, metadata !1498, i32 224, i32 0}
!1503 = metadata !{i32 235, i32 0, metadata !1502, null}
!1504 = metadata !{i32 117, i32 0, metadata !1505, null}
!1505 = metadata !{i32 458763, metadata !1506, i32 112, i32 0}
!1506 = metadata !{i32 458763, metadata !111, i32 108, i32 0}
!1507 = metadata !{i32 121, i32 0, metadata !1505, null}
!1508 = metadata !{i32 125, i32 0, metadata !1505, null}
!1509 = metadata !{i32 129, i32 0, metadata !1505, null}
!1510 = metadata !{i32 71, i32 0, metadata !1511, metadata !1512}
!1511 = metadata !{i32 458763, metadata !105, i32 67, i32 0}
!1512 = metadata !{i32 133, i32 0, metadata !1505, null}
!1513 = metadata !{i32 72, i32 0, metadata !1511, metadata !1512}
!1514 = metadata !{i32 73, i32 0, metadata !1511, metadata !1512}
!1515 = metadata !{i32 74, i32 0, metadata !1511, metadata !1512}
!1516 = metadata !{i32 134, i32 0, metadata !1505, null}
!1517 = metadata !{i32 135, i32 0, metadata !1505, null}
!1518 = metadata !{i32 136, i32 0, metadata !1505, null}
!1519 = metadata !{i32 145, i32 0, metadata !1506, null}
!1520 = metadata !{i32 149, i32 0, metadata !1506, null}
!1521 = metadata !{i32 150, i32 0, metadata !1506, null}
!1522 = metadata !{i32 153, i32 0, metadata !1506, null}
!1523 = metadata !{i32 156, i32 0, metadata !1505, null}
!1524 = metadata !{i32 55, i32 0, metadata !587, null}
!1525 = metadata !{i32 56, i32 0, metadata !587, null}
!1526 = metadata !{i32 57, i32 0, metadata !587, null}
!1527 = metadata !{i32 60, i32 0, metadata !587, null}
!1528 = metadata !{i32 62, i32 0, metadata !587, null}
!1529 = metadata !{i32 47, i32 0, metadata !1530, null}
!1530 = metadata !{i32 458763, metadata !1531, i32 44, i32 0}
!1531 = metadata !{i32 458798, i32 0, metadata !1532, metadata !"__pw_dup", metadata !"__pw_dup", metadata !"__pw_dup", metadata !1532, i32 44, metadata !1533, i1 false, i1 true, i32 0, i32 0, null, i1 false}
!1532 = metadata !{i32 458769, i32 0, i32 1, metadata !"pwmem.c", metadata !"/home/heming/rcs/direct-sym/apps/shadow/shadow-4.1.5/obj/lib/../../lib", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.7)", i1 true, i1 false, metadata !"", i32 0}
!1533 = metadata !{i32 458773, metadata !1532, metadata !"", metadata !1532, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1534, i32 0, null}
!1534 = metadata !{metadata !1535, metadata !1550}
!1535 = metadata !{i32 458767, metadata !1532, metadata !"", metadata !1532, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1536}
!1536 = metadata !{i32 458771, metadata !1532, metadata !"passwd", metadata !730, i32 51, i64 384, i64 64, i64 0, i32 0, null, metadata !1537, i32 0, null}
!1537 = metadata !{metadata !1538, metadata !1541, metadata !1542, metadata !1545, metadata !1547, metadata !1548, metadata !1549}
!1538 = metadata !{i32 458765, metadata !1536, metadata !"pw_name", metadata !730, i32 52, i64 64, i64 64, i64 0, i32 0, metadata !1539}
!1539 = metadata !{i32 458767, metadata !1532, metadata !"", metadata !1532, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1540}
!1540 = metadata !{i32 458788, metadata !1532, metadata !"char", metadata !1532, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6}
!1541 = metadata !{i32 458765, metadata !1536, metadata !"pw_passwd", metadata !730, i32 53, i64 64, i64 64, i64 64, i32 0, metadata !1539}
!1542 = metadata !{i32 458765, metadata !1536, metadata !"pw_uid", metadata !730, i32 54, i64 32, i64 32, i64 128, i32 0, metadata !1543}
!1543 = metadata !{i32 458774, metadata !1532, metadata !"__uid_t", metadata !69, i32 135, i64 0, i64 0, i64 0, i32 0, metadata !1544}
!1544 = metadata !{i32 458788, metadata !1532, metadata !"unsigned int", metadata !1532, i32 0, i64 32, i64 32, i64 0, i32 0, i32 7}
!1545 = metadata !{i32 458765, metadata !1536, metadata !"pw_gid", metadata !730, i32 55, i64 32, i64 32, i64 160, i32 0, metadata !1546}
!1546 = metadata !{i32 458774, metadata !1532, metadata !"__gid_t", metadata !69, i32 136, i64 0, i64 0, i64 0, i32 0, metadata !1544}
!1547 = metadata !{i32 458765, metadata !1536, metadata !"pw_gecos", metadata !730, i32 56, i64 64, i64 64, i64 192, i32 0, metadata !1539}
!1548 = metadata !{i32 458765, metadata !1536, metadata !"pw_dir", metadata !730, i32 57, i64 64, i64 64, i64 256, i32 0, metadata !1539}
!1549 = metadata !{i32 458765, metadata !1536, metadata !"pw_shell", metadata !730, i32 58, i64 64, i64 64, i64 320, i32 0, metadata !1539}
!1550 = metadata !{i32 458767, metadata !1532, metadata !"", metadata !1532, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1551}
!1551 = metadata !{i32 458790, metadata !1532, metadata !"", metadata !1532, i32 0, i64 384, i64 64, i64 0, i32 0, metadata !1536}
!1552 = metadata !{i32 48, i32 0, metadata !1530, null}
!1553 = metadata !{i32 51, i32 0, metadata !1530, null}
!1554 = metadata !{i32 52, i32 0, metadata !1530, null}
!1555 = metadata !{i32 53, i32 0, metadata !1530, null}
!1556 = metadata !{i32 54, i32 0, metadata !1530, null}
!1557 = metadata !{i32 55, i32 0, metadata !1530, null}
!1558 = metadata !{i32 89, i32 0, metadata !1530, null}
!1559 = metadata !{i32 58, i32 0, metadata !1530, null}
!1560 = metadata !{i32 59, i32 0, metadata !1530, null}
!1561 = metadata !{i32 60, i32 0, metadata !1530, null}
!1562 = metadata !{i32 61, i32 0, metadata !1530, null}
!1563 = metadata !{i32 64, i32 0, metadata !1530, null}
!1564 = metadata !{i32 65, i32 0, metadata !1530, null}
!1565 = metadata !{i32 66, i32 0, metadata !1530, null}
!1566 = metadata !{i32 67, i32 0, metadata !1530, null}
!1567 = metadata !{i32 68, i32 0, metadata !1530, null}
!1568 = metadata !{i32 71, i32 0, metadata !1530, null}
!1569 = metadata !{i32 72, i32 0, metadata !1530, null}
!1570 = metadata !{i32 73, i32 0, metadata !1530, null}
!1571 = metadata !{i32 74, i32 0, metadata !1530, null}
!1572 = metadata !{i32 75, i32 0, metadata !1530, null}
!1573 = metadata !{i32 76, i32 0, metadata !1530, null}
!1574 = metadata !{i32 79, i32 0, metadata !1530, null}
!1575 = metadata !{i32 80, i32 0, metadata !1530, null}
!1576 = metadata !{i32 81, i32 0, metadata !1530, null}
!1577 = metadata !{i32 82, i32 0, metadata !1530, null}
!1578 = metadata !{i32 83, i32 0, metadata !1530, null}
!1579 = metadata !{i32 84, i32 0, metadata !1530, null}
!1580 = metadata !{i32 85, i32 0, metadata !1530, null}
!1581 = metadata !{i32 238, i32 0, metadata !1582, null}
!1582 = metadata !{i32 458763, metadata !1583, i32 234, i32 0}
!1583 = metadata !{i32 458798, i32 0, metadata !156, metadata !"getdef_unum", metadata !"getdef_unum", metadata !"getdef_unum", metadata !156, i32 234, metadata !1584, i1 false, i1 true, i32 0, i32 0, null, i1 false}
!1584 = metadata !{i32 458773, metadata !156, metadata !"", metadata !156, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1585, i32 0, null}
!1585 = metadata !{metadata !1586, metadata !161, metadata !1586}
!1586 = metadata !{i32 458788, metadata !156, metadata !"unsigned int", metadata !156, i32 0, i64 32, i64 32, i64 0, i32 0, i32 7}
!1587 = metadata !{i32 239, i32 0, metadata !1582, null}
!1588 = metadata !{i32 242, i32 0, metadata !1582, null}
!1589 = metadata !{i32 243, i32 0, metadata !1582, null}
!1590 = metadata !{i32 50, i32 0, metadata !1591, metadata !1602}
!1591 = metadata !{i32 458763, metadata !1592, i32 46, i32 0}
!1592 = metadata !{i32 458798, i32 0, metadata !1593, metadata !"getlong", metadata !"getlong", metadata !"getlong", metadata !1593, i32 46, metadata !1594, i1 false, i1 true, i32 0, i32 0, null, i1 false}
!1593 = metadata !{i32 458769, i32 0, i32 1, metadata !"getlong.c", metadata !"/home/heming/rcs/direct-sym/apps/shadow/shadow-4.1.5/obj/lib/../../lib", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.7)", i1 true, i1 false, metadata !"", i32 0}
!1594 = metadata !{i32 458773, metadata !1593, metadata !"", metadata !1593, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1595, i32 0, null}
!1595 = metadata !{metadata !1596, metadata !1597, metadata !1600}
!1596 = metadata !{i32 458788, metadata !1593, metadata !"int", metadata !1593, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5}
!1597 = metadata !{i32 458767, metadata !1593, metadata !"", metadata !1593, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1598}
!1598 = metadata !{i32 458790, metadata !1593, metadata !"", metadata !1593, i32 0, i64 8, i64 8, i64 0, i32 0, metadata !1599}
!1599 = metadata !{i32 458788, metadata !1593, metadata !"char", metadata !1593, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6}
!1600 = metadata !{i32 458767, metadata !1593, metadata !"", metadata !1593, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1601}
!1601 = metadata !{i32 458788, metadata !1593, metadata !"long int", metadata !1593, i32 0, i64 64, i64 64, i64 0, i32 0, i32 5}
!1602 = metadata !{i32 247, i32 0, metadata !1582, null}
!1603 = metadata !{i32 51, i32 0, metadata !1591, metadata !1602}
!1604 = metadata !{i32 52, i32 0, metadata !1591, metadata !1602}
!1605 = metadata !{i32 250, i32 0, metadata !1582, null}
!1606 = metadata !{i32 256, i32 0, metadata !1582, null}
!1607 = metadata !{i32 273, i32 0, metadata !1608, null}
!1608 = metadata !{i32 458763, metadata !1609, i32 269, i32 0}
!1609 = metadata !{i32 458798, i32 0, metadata !156, metadata !"getdef_long", metadata !"getdef_long", metadata !"getdef_long", metadata !156, i32 269, metadata !1610, i1 false, i1 true, i32 0, i32 0, null, i1 false}
!1610 = metadata !{i32 458773, metadata !156, metadata !"", metadata !156, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1611, i32 0, null}
!1611 = metadata !{metadata !1612, metadata !161, metadata !1612}
!1612 = metadata !{i32 458788, metadata !156, metadata !"long int", metadata !156, i32 0, i64 64, i64 64, i64 0, i32 0, i32 5}
!1613 = metadata !{i32 274, i32 0, metadata !1608, null}
!1614 = metadata !{i32 277, i32 0, metadata !1608, null}
!1615 = metadata !{i32 278, i32 0, metadata !1608, null}
!1616 = metadata !{i32 50, i32 0, metadata !1591, metadata !1617}
!1617 = metadata !{i32 282, i32 0, metadata !1608, null}
!1618 = metadata !{i32 51, i32 0, metadata !1591, metadata !1617}
!1619 = metadata !{i32 52, i32 0, metadata !1591, metadata !1617}
!1620 = metadata !{i32 283, i32 0, metadata !1608, null}
!1621 = metadata !{i32 289, i32 0, metadata !1608, null}
!1622 = metadata !{i32 384, i32 0, metadata !1623, null}
!1623 = metadata !{i32 458763, metadata !1624, i32 376, i32 0}
!1624 = metadata !{i32 458798, i32 0, metadata !156, metadata !"def_find", metadata !"def_find", metadata !"def_find", metadata !156, i32 376, metadata !1625, i1 true, i1 true, i32 0, i32 0, null, i1 false}
!1625 = metadata !{i32 458773, metadata !156, metadata !"", metadata !156, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1626, i32 0, null}
!1626 = metadata !{metadata !1627, metadata !161}
!1627 = metadata !{i32 458767, metadata !156, metadata !"", metadata !156, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !158}
!1628 = metadata !{i32 385, i32 0, metadata !1623, null}
!1629 = metadata !{i32 394, i32 0, metadata !1623, null}
!1630 = metadata !{i32 397, i32 0, metadata !1631, null}
!1631 = metadata !{i32 458763, metadata !1623, i32 394, i32 0}
!1632 = metadata !{i32 398, i32 0, metadata !1623, null}
!1633 = metadata !{i32 416, i32 0, metadata !1634, null}
!1634 = metadata !{i32 458763, metadata !1635, i32 408, i32 0}
!1635 = metadata !{i32 458798, i32 0, metadata !156, metadata !"def_load", metadata !"def_load", metadata !"def_load", metadata !156, i32 408, metadata !1636, i1 true, i1 true, i32 0, i32 0, null, i1 false}
!1636 = metadata !{i32 458773, metadata !156, metadata !"", metadata !156, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !108, i32 0, null}
!1637 = metadata !{i32 417, i32 0, metadata !1634, null}
!1638 = metadata !{i32 418, i32 0, metadata !1639, null}
!1639 = metadata !{i32 458763, metadata !1634, i32 417, i32 0}
!1640 = metadata !{i32 419, i32 0, metadata !1641, null}
!1641 = metadata !{i32 458763, metadata !1639, i32 418, i32 0}
!1642 = metadata !{i32 421, i32 0, metadata !1639, null}
!1643 = metadata !{i32 428, i32 0, metadata !1634, null}
!1644 = metadata !{i32 438, i32 0, metadata !1634, null}
!1645 = metadata !{i32 439, i32 0, metadata !1634, null}
!1646 = metadata !{i32 444, i32 0, metadata !1634, null}
!1647 = metadata !{i32 449, i32 0, metadata !1634, null}
!1648 = metadata !{i32 450, i32 0, metadata !1634, null}
!1649 = metadata !{i32 453, i32 0, metadata !1634, null}
!1650 = metadata !{i32 454, i32 0, metadata !1634, null}
!1651 = metadata !{i32 457, i32 0, metadata !1634, null}
!1652 = metadata !{i32 458, i32 0, metadata !1634, null}
!1653 = metadata !{i32 459, i32 0, metadata !1634, null}
!1654 = metadata !{i32 433, i32 0, metadata !1634, null}
!1655 = metadata !{i32 471, i32 0, metadata !1634, null}
!1656 = metadata !{i32 472, i32 0, metadata !1657, null}
!1657 = metadata !{i32 458763, metadata !1634, i32 471, i32 0}
!1658 = metadata !{i32 473, i32 0, metadata !1659, null}
!1659 = metadata !{i32 458763, metadata !1657, i32 472, i32 0}
!1660 = metadata !{i32 475, i32 0, metadata !1657, null}
!1661 = metadata !{i32 478, i32 0, metadata !1634, null}
!1662 = metadata !{i32 479, i32 0, metadata !1634, null}
!1663 = metadata !{i32 47, i32 0, metadata !1664, metadata !1683}
!1664 = metadata !{i32 458763, metadata !1665, i32 43, i32 0}
!1665 = metadata !{i32 458798, i32 0, metadata !1666, metadata !"__gr_dup", metadata !"__gr_dup", metadata !"__gr_dup", metadata !1666, i32 43, metadata !1667, i1 false, i1 true, i32 0, i32 0, null, i1 false}
!1666 = metadata !{i32 458769, i32 0, i32 1, metadata !"groupmem.c", metadata !"/home/heming/rcs/direct-sym/apps/shadow/shadow-4.1.5/obj/lib/../../lib", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.7)", i1 true, i1 false, metadata !"", i32 0}
!1667 = metadata !{i32 458773, metadata !1666, metadata !"", metadata !1666, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1668, i32 0, null}
!1668 = metadata !{metadata !1669, metadata !1681}
!1669 = metadata !{i32 458767, metadata !1666, metadata !"", metadata !1666, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1670}
!1670 = metadata !{i32 458771, metadata !1666, metadata !"group", metadata !63, i32 45, i64 256, i64 64, i64 0, i32 0, null, metadata !1671, i32 0, null}
!1671 = metadata !{metadata !1672, metadata !1675, metadata !1676, metadata !1679}
!1672 = metadata !{i32 458765, metadata !1670, metadata !"gr_name", metadata !63, i32 46, i64 64, i64 64, i64 0, i32 0, metadata !1673}
!1673 = metadata !{i32 458767, metadata !1666, metadata !"", metadata !1666, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1674}
!1674 = metadata !{i32 458788, metadata !1666, metadata !"char", metadata !1666, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6}
!1675 = metadata !{i32 458765, metadata !1670, metadata !"gr_passwd", metadata !63, i32 47, i64 64, i64 64, i64 64, i32 0, metadata !1673}
!1676 = metadata !{i32 458765, metadata !1670, metadata !"gr_gid", metadata !63, i32 48, i64 32, i64 32, i64 128, i32 0, metadata !1677}
!1677 = metadata !{i32 458774, metadata !1666, metadata !"__gid_t", metadata !69, i32 136, i64 0, i64 0, i64 0, i32 0, metadata !1678}
!1678 = metadata !{i32 458788, metadata !1666, metadata !"unsigned int", metadata !1666, i32 0, i64 32, i64 32, i64 0, i32 0, i32 7}
!1679 = metadata !{i32 458765, metadata !1670, metadata !"gr_mem", metadata !63, i32 49, i64 64, i64 64, i64 192, i32 0, metadata !1680}
!1680 = metadata !{i32 458767, metadata !1666, metadata !"", metadata !1666, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1673}
!1681 = metadata !{i32 458767, metadata !1666, metadata !"", metadata !1666, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1682}
!1682 = metadata !{i32 458790, metadata !1666, metadata !"", metadata !1666, i32 0, i64 256, i64 64, i64 0, i32 0, metadata !1670}
!1683 = metadata !{i32 57, i32 0, metadata !1684, null}
!1684 = metadata !{i32 458763, metadata !1685, i32 54, i32 0}
!1685 = metadata !{i32 458798, i32 0, metadata !175, metadata !"group_dup", metadata !"group_dup", metadata !"group_dup", metadata !175, i32 54, metadata !181, i1 true, i1 true, i32 0, i32 0, null, i1 false}
!1686 = metadata !{i32 48, i32 0, metadata !1664, metadata !1683}
!1687 = metadata !{i32 51, i32 0, metadata !1664, metadata !1683}
!1688 = metadata !{i32 52, i32 0, metadata !1664, metadata !1683}
!1689 = metadata !{i32 53, i32 0, metadata !1664, metadata !1683}
!1690 = metadata !{i32 54, i32 0, metadata !1664, metadata !1683}
!1691 = metadata !{i32 57, i32 0, metadata !1664, metadata !1683}
!1692 = metadata !{i32 58, i32 0, metadata !1664, metadata !1683}
!1693 = metadata !{i32 64, i32 0, metadata !1664, metadata !1683}
!1694 = metadata !{i32 59, i32 0, metadata !1664, metadata !1683}
!1695 = metadata !{i32 60, i32 0, metadata !1664, metadata !1683}
!1696 = metadata !{i32 66, i32 0, metadata !1664, metadata !1683}
!1697 = metadata !{i32 67, i32 0, metadata !1664, metadata !1683}
!1698 = metadata !{i32 68, i32 0, metadata !1664, metadata !1683}
!1699 = metadata !{i32 69, i32 0, metadata !1664, metadata !1683}
!1700 = metadata !{i32 70, i32 0, metadata !1664, metadata !1683}
!1701 = metadata !{i32 74, i32 0, metadata !1664, metadata !1683}
!1702 = metadata !{i32 75, i32 0, metadata !1664, metadata !1683}
!1703 = metadata !{i32 78, i32 0, metadata !1704, metadata !1683}
!1704 = metadata !{i32 458763, metadata !1664, i32 75, i32 0}
!1705 = metadata !{i32 77, i32 0, metadata !1704, metadata !1683}
!1706 = metadata !{i32 79, i32 0, metadata !1704, metadata !1683}
!1707 = metadata !{i32 80, i32 0, metadata !1704, metadata !1683}
!1708 = metadata !{i32 81, i32 0, metadata !1704, metadata !1683}
!1709 = metadata !{i32 82, i32 0, metadata !1704, metadata !1683}
!1710 = metadata !{i32 73, i32 0, metadata !1664, metadata !1683}
!1711 = metadata !{i32 86, i32 0, metadata !1664, metadata !1683}
!1712 = metadata !{i32 93, i32 0, metadata !1713, metadata !1717}
!1713 = metadata !{i32 458763, metadata !1714, i32 92, i32 0}
!1714 = metadata !{i32 458798, i32 0, metadata !1666, metadata !"gr_free", metadata !"gr_free", metadata !"gr_free", metadata !1666, i32 92, metadata !1715, i1 false, i1 true, i32 0, i32 0, null, i1 false}
!1715 = metadata !{i32 458773, metadata !1666, metadata !"", metadata !1666, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1716, i32 0, null}
!1716 = metadata !{null, metadata !1669}
!1717 = metadata !{i32 64, i32 0, metadata !1718, null}
!1718 = metadata !{i32 458763, metadata !1719, i32 61, i32 0}
!1719 = metadata !{i32 458798, i32 0, metadata !175, metadata !"group_free", metadata !"group_free", metadata !"group_free", metadata !175, i32 61, metadata !186, i1 true, i1 true, i32 0, i32 0, null, i1 false}
!1720 = metadata !{i32 94, i32 0, metadata !1713, metadata !1717}
!1721 = metadata !{i32 95, i32 0, metadata !1713, metadata !1717}
!1722 = metadata !{i32 96, i32 0, metadata !1713, metadata !1717}
!1723 = metadata !{i32 98, i32 0, metadata !1713, metadata !1717}
!1724 = metadata !{i32 101, i32 0, metadata !1725, metadata !1717}
!1725 = metadata !{i32 458763, metadata !1713, i32 92, i32 0}
!1726 = metadata !{i32 100, i32 0, metadata !1725, metadata !1717}
!1727 = metadata !{i32 103, i32 0, metadata !1725, metadata !1717}
!1728 = metadata !{i32 105, i32 0, metadata !1713, metadata !1717}
!1729 = metadata !{i32 65, i32 0, metadata !1718, null}
!1730 = metadata !{i32 71, i32 0, metadata !1731, null}
!1731 = metadata !{i32 458763, metadata !1732, i32 68, i32 0}
!1732 = metadata !{i32 458798, i32 0, metadata !175, metadata !"group_getname", metadata !"group_getname", metadata !"group_getname", metadata !175, i32 68, metadata !190, i1 true, i1 true, i32 0, i32 0, null, i1 false}
!1733 = metadata !{i32 112, i32 0, metadata !1734, metadata !1735}
!1734 = metadata !{i32 458763, metadata !528, i32 104, i32 0}
!1735 = metadata !{i32 76, i32 0, metadata !1736, null}
!1736 = metadata !{i32 458763, metadata !1737, i32 75, i32 0}
!1737 = metadata !{i32 458798, i32 0, metadata !175, metadata !"group_parse", metadata !"group_parse", metadata !"group_parse", metadata !175, i32 75, metadata !197, i1 true, i1 true, i32 0, i32 0, null, i1 false}
!1738 = metadata !{i32 115, i32 0, metadata !1734, metadata !1735}
!1739 = metadata !{i32 116, i32 0, metadata !1734, metadata !1735}
!1740 = metadata !{i32 117, i32 0, metadata !1734, metadata !1735}
!1741 = metadata !{i32 118, i32 0, metadata !1734, metadata !1735}
!1742 = metadata !{i32 119, i32 0, metadata !1734, metadata !1735}
!1743 = metadata !{i32 120, i32 0, metadata !1734, metadata !1735}
!1744 = metadata !{i32 124, i32 0, metadata !1734, metadata !1735}
!1745 = metadata !{i32 126, i32 0, metadata !1734, metadata !1735}
!1746 = metadata !{i32 127, i32 0, metadata !1734, metadata !1735}
!1747 = metadata !{i32 128, i32 0, metadata !1734, metadata !1735}
!1748 = metadata !{i32 132, i32 0, metadata !1734, metadata !1735}
!1749 = metadata !{i32 133, i32 0, metadata !1734, metadata !1735}
!1750 = metadata !{i32 134, i32 0, metadata !1734, metadata !1735}
!1751 = metadata !{i32 135, i32 0, metadata !1734, metadata !1735}
!1752 = metadata !{i32 136, i32 0, metadata !1734, metadata !1735}
!1753 = metadata !{i32 131, i32 0, metadata !1734, metadata !1735}
!1754 = metadata !{i32 139, i32 0, metadata !1734, metadata !1735}
!1755 = metadata !{i32 142, i32 0, metadata !1734, metadata !1735}
!1756 = metadata !{i32 143, i32 0, metadata !1734, metadata !1735}
!1757 = metadata !{i32 147, i32 0, metadata !1734, metadata !1735}
!1758 = metadata !{i32 65, i32 0, metadata !1759, metadata !1757}
!1759 = metadata !{i32 458763, metadata !518, i32 59, i32 0}
!1760 = metadata !{i32 69, i32 0, metadata !1759, metadata !1757}
!1761 = metadata !{i32 70, i32 0, metadata !1759, metadata !1757}
!1762 = metadata !{i32 71, i32 0, metadata !1759, metadata !1757}
!1763 = metadata !{i32 77, i32 0, metadata !1759, metadata !1757}
!1764 = metadata !{i32 72, i32 0, metadata !1759, metadata !1757}
!1765 = metadata !{i32 79, i32 0, metadata !1759, metadata !1757}
!1766 = metadata !{i32 80, i32 0, metadata !1759, metadata !1757}
!1767 = metadata !{i32 81, i32 0, metadata !1759, metadata !1757}
!1768 = metadata !{i32 82, i32 0, metadata !1759, metadata !1757}
!1769 = metadata !{i32 83, i32 0, metadata !1759, metadata !1757}
!1770 = metadata !{i32 86, i32 0, metadata !1759, metadata !1757}
!1771 = metadata !{i32 88, i32 0, metadata !1759, metadata !1757}
!1772 = metadata !{i32 90, i32 0, metadata !1759, metadata !1757}
!1773 = metadata !{i32 92, i32 0, metadata !1759, metadata !1757}
!1774 = metadata !{i32 91, i32 0, metadata !1759, metadata !1757}
!1775 = metadata !{i32 94, i32 0, metadata !1759, metadata !1757}
!1776 = metadata !{i32 95, i32 0, metadata !1759, metadata !1757}
!1777 = metadata !{i32 98, i32 0, metadata !1759, metadata !1757}
!1778 = metadata !{i32 148, i32 0, metadata !1734, metadata !1735}
!1779 = metadata !{i32 81, i32 0, metadata !1780, null}
!1780 = metadata !{i32 458763, metadata !1781, i32 80, i32 0}
!1781 = metadata !{i32 458798, i32 0, metadata !175, metadata !"group_put", metadata !"group_put", metadata !"group_put", metadata !175, i32 80, metadata !201, i1 true, i1 true, i32 0, i32 0, null, i1 false}
!1782 = metadata !{i32 83, i32 0, metadata !1780, null}
!1783 = metadata !{i32 57, i32 0, metadata !1784, metadata !1782}
!1784 = metadata !{i32 458763, metadata !1785, i32 53, i32 0}
!1785 = metadata !{i32 458798, i32 0, metadata !1786, metadata !"valid_field", metadata !"valid_field", metadata !"valid_field", metadata !1786, i32 53, metadata !1787, i1 false, i1 true, i32 0, i32 0, null, i1 false}
!1786 = metadata !{i32 458769, i32 0, i32 1, metadata !"fields.c", metadata !"/home/heming/rcs/direct-sym/apps/shadow/shadow-4.1.5/obj/lib/../../lib", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.7)", i1 true, i1 false, metadata !"", i32 0}
!1787 = metadata !{i32 458773, metadata !1786, metadata !"", metadata !1786, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1788, i32 0, null}
!1788 = metadata !{metadata !1789, metadata !1790, metadata !1790}
!1789 = metadata !{i32 458788, metadata !1786, metadata !"int", metadata !1786, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5}
!1790 = metadata !{i32 458767, metadata !1786, metadata !"", metadata !1786, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1791}
!1791 = metadata !{i32 458790, metadata !1786, metadata !"", metadata !1786, i32 0, i64 8, i64 8, i64 0, i32 0, metadata !1792}
!1792 = metadata !{i32 458788, metadata !1786, metadata !"char", metadata !1786, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6}
!1793 = metadata !{i32 64, i32 0, metadata !1784, metadata !1782}
!1794 = metadata !{i32 63, i32 0, metadata !1784, metadata !1782}
!1795 = metadata !{i32 73, i32 0, metadata !1784, metadata !1782}
!1796 = metadata !{i32 72, i32 0, metadata !1784, metadata !1782}
!1797 = metadata !{i32 91, i32 0, metadata !1780, null}
!1798 = metadata !{i32 64, i32 0, metadata !1784, metadata !1799}
!1799 = metadata !{i32 94, i32 0, metadata !1800, null}
!1800 = metadata !{i32 458763, metadata !1780, i32 91, i32 0}
!1801 = metadata !{i32 63, i32 0, metadata !1784, metadata !1799}
!1802 = metadata !{i32 73, i32 0, metadata !1784, metadata !1799}
!1803 = metadata !{i32 72, i32 0, metadata !1784, metadata !1799}
!1804 = metadata !{i32 93, i32 0, metadata !1800, null}
!1805 = metadata !{i32 100, i32 0, metadata !1780, null}
!1806 = metadata !{i32 107, i32 0, metadata !1807, null}
!1807 = metadata !{i32 458763, metadata !1808, i32 104, i32 0}
!1808 = metadata !{i32 458798, i32 0, metadata !175, metadata !"group_close_hook", metadata !"group_close_hook", metadata !"group_close_hook", metadata !175, i32 104, metadata !270, i1 true, i1 true, i32 0, i32 0, null, i1 false}
!1809 = metadata !{i32 398, i32 0, metadata !1810, metadata !1815}
!1810 = metadata !{i32 458763, metadata !1811, i32 397, i32 0}
!1811 = metadata !{i32 458763, metadata !1812, i32 394, i32 0}
!1812 = metadata !{i32 458798, i32 0, metadata !175, metadata !"split_groups", metadata !"split_groups", metadata !"split_groups", metadata !175, i32 394, metadata !1813, i1 true, i1 true, i32 0, i32 0, null, i1 false}
!1813 = metadata !{i32 458773, metadata !175, metadata !"", metadata !175, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1814, i32 0, null}
!1814 = metadata !{metadata !203, metadata !1037}
!1815 = metadata !{i32 111, i32 0, metadata !1807, null}
!1816 = metadata !{i32 405, i32 0, metadata !1810, metadata !1815}
!1817 = metadata !{i32 411, i32 0, metadata !1810, metadata !1815}
!1818 = metadata !{i32 412, i32 0, metadata !1810, metadata !1815}
!1819 = metadata !{i32 416, i32 0, metadata !1810, metadata !1815}
!1820 = metadata !{i32 417, i32 0, metadata !1810, metadata !1815}
!1821 = metadata !{i32 418, i32 0, metadata !1810, metadata !1815}
!1822 = metadata !{i32 421, i32 0, metadata !1810, metadata !1815}
!1823 = metadata !{i32 422, i32 0, metadata !1810, metadata !1815}
!1824 = metadata !{i32 423, i32 0, metadata !1810, metadata !1815}
!1825 = metadata !{i32 424, i32 0, metadata !1810, metadata !1815}
!1826 = metadata !{i32 428, i32 0, metadata !1810, metadata !1815}
!1827 = metadata !{i32 429, i32 0, metadata !1810, metadata !1815}
!1828 = metadata !{i32 432, i32 0, metadata !1810, metadata !1815}
!1829 = metadata !{i32 433, i32 0, metadata !1810, metadata !1815}
!1830 = metadata !{i32 434, i32 0, metadata !1810, metadata !1815}
!1831 = metadata !{i32 439, i32 0, metadata !1810, metadata !1815}
!1832 = metadata !{i32 440, i32 0, metadata !1810, metadata !1815}
!1833 = metadata !{i32 442, i32 0, metadata !1810, metadata !1815}
!1834 = metadata !{i32 443, i32 0, metadata !1810, metadata !1815}
!1835 = metadata !{i32 438, i32 0, metadata !1810, metadata !1815}
!1836 = metadata !{i32 446, i32 0, metadata !1810, metadata !1815}
!1837 = metadata !{i32 447, i32 0, metadata !1810, metadata !1815}
!1838 = metadata !{i32 445, i32 0, metadata !1810, metadata !1815}
!1839 = metadata !{i32 451, i32 0, metadata !1810, metadata !1815}
!1840 = metadata !{i32 452, i32 0, metadata !1810, metadata !1815}
!1841 = metadata !{i32 453, i32 0, metadata !1810, metadata !1815}
!1842 = metadata !{i32 397, i32 0, metadata !1811, metadata !1815}
!1843 = metadata !{i32 263, i32 0, metadata !1844, null}
!1844 = metadata !{i32 458763, metadata !1845, i32 259, i32 0}
!1845 = metadata !{i32 458798, i32 0, metadata !175, metadata !"group_open_hook", metadata !"group_open_hook", metadata !"group_open_hook", metadata !175, i32 259, metadata !270, i1 true, i1 true, i32 0, i32 0, null, i1 false}
!1846 = metadata !{i32 269, i32 0, metadata !1847, null}
!1847 = metadata !{i32 458763, metadata !1844, i32 268, i32 0}
!1848 = metadata !{i32 332, i32 0, metadata !1849, metadata !1853}
!1849 = metadata !{i32 458763, metadata !1850, i32 312, i32 0}
!1850 = metadata !{i32 458798, i32 0, metadata !175, metadata !"merge_group_entries", metadata !"merge_group_entries", metadata !"merge_group_entries", metadata !175, i32 312, metadata !1851, i1 true, i1 true, i32 0, i32 0, null, i1 false}
!1851 = metadata !{i32 458773, metadata !175, metadata !"", metadata !175, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1852, i32 0, null}
!1852 = metadata !{metadata !285, metadata !285, metadata !285}
!1853 = metadata !{i32 279, i32 0, metadata !1847, null}
!1854 = metadata !{i32 268, i32 0, metadata !1844, null}
!1855 = metadata !{i32 270, i32 0, metadata !1847, null}
!1856 = metadata !{i32 271, i32 0, metadata !1847, null}
!1857 = metadata !{i32 326, i32 0, metadata !1849, metadata !1853}
!1858 = metadata !{i32 327, i32 0, metadata !1849, metadata !1853}
!1859 = metadata !{i32 294, i32 0, metadata !1844, null}
!1860 = metadata !{i32 333, i32 0, metadata !1849, metadata !1853}
!1861 = metadata !{i32 334, i32 0, metadata !1849, metadata !1853}
!1862 = metadata !{i32 335, i32 0, metadata !1849, metadata !1853}
!1863 = metadata !{i32 338, i32 0, metadata !1849, metadata !1853}
!1864 = metadata !{i32 339, i32 0, metadata !1849, metadata !1853}
!1865 = metadata !{i32 342, i32 0, metadata !1849, metadata !1853}
!1866 = metadata !{i32 344, i32 0, metadata !1849, metadata !1853}
!1867 = metadata !{i32 347, i32 0, metadata !1868, metadata !1853}
!1868 = metadata !{i32 458763, metadata !1849, i32 344, i32 0}
!1869 = metadata !{i32 350, i32 0, metadata !1868, metadata !1853}
!1870 = metadata !{i32 346, i32 0, metadata !1868, metadata !1853}
!1871 = metadata !{i32 352, i32 0, metadata !1868, metadata !1853}
!1872 = metadata !{i32 353, i32 0, metadata !1868, metadata !1853}
!1873 = metadata !{i32 356, i32 0, metadata !1849, metadata !1853}
!1874 = metadata !{i32 357, i32 0, metadata !1849, metadata !1853}
!1875 = metadata !{i32 358, i32 0, metadata !1849, metadata !1853}
!1876 = metadata !{i32 359, i32 0, metadata !1849, metadata !1853}
!1877 = metadata !{i32 363, i32 0, metadata !1849, metadata !1853}
!1878 = metadata !{i32 362, i32 0, metadata !1849, metadata !1853}
!1879 = metadata !{i32 369, i32 0, metadata !1880, metadata !1853}
!1880 = metadata !{i32 458763, metadata !1849, i32 366, i32 0}
!1881 = metadata !{i32 372, i32 0, metadata !1880, metadata !1853}
!1882 = metadata !{i32 368, i32 0, metadata !1880, metadata !1853}
!1883 = metadata !{i32 374, i32 0, metadata !1880, metadata !1853}
!1884 = metadata !{i32 375, i32 0, metadata !1880, metadata !1853}
!1885 = metadata !{i32 376, i32 0, metadata !1880, metadata !1853}
!1886 = metadata !{i32 377, i32 0, metadata !1880, metadata !1853}
!1887 = metadata !{i32 366, i32 0, metadata !1849, metadata !1853}
!1888 = metadata !{i32 381, i32 0, metadata !1849, metadata !1853}
!1889 = metadata !{i32 382, i32 0, metadata !1849, metadata !1853}
!1890 = metadata !{i32 283, i32 0, metadata !1847, null}
!1891 = metadata !{i32 284, i32 0, metadata !1847, null}
!1892 = metadata !{i32 287, i32 0, metadata !1847, null}
!1893 = metadata !{i32 288, i32 0, metadata !1847, null}
!1894 = metadata !{i32 267, i32 0, metadata !1844, null}
!1895 = metadata !{i32 23, i32 0, metadata !1896, null}
!1896 = metadata !{i32 458763, metadata !1897, i32 20, i32 0}
!1897 = metadata !{i32 458798, i32 0, metadata !1898, metadata !"nscd_flush_cache", metadata !"nscd_flush_cache", metadata !"nscd_flush_cache", metadata !1898, i32 20, metadata !1899, i1 false, i1 true, i32 0, i32 0, null, i1 false}
!1898 = metadata !{i32 458769, i32 0, i32 1, metadata !"nscd.c", metadata !"/home/heming/rcs/direct-sym/apps/shadow/shadow-4.1.5/obj/lib/../../lib", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.7)", i1 true, i1 false, metadata !"", i32 0}
!1899 = metadata !{i32 458773, metadata !1898, metadata !"", metadata !1898, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1900, i32 0, null}
!1900 = metadata !{metadata !1901, metadata !1902}
!1901 = metadata !{i32 458788, metadata !1898, metadata !"int", metadata !1898, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5}
!1902 = metadata !{i32 458767, metadata !1898, metadata !"", metadata !1898, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1903}
!1903 = metadata !{i32 458790, metadata !1898, metadata !"", metadata !1898, i32 0, i64 8, i64 8, i64 0, i32 0, metadata !1904}
!1904 = metadata !{i32 458788, metadata !1898, metadata !"char", metadata !1898, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6}
!1905 = metadata !{i32 24, i32 0, metadata !1896, null}
!1906 = metadata !{i32 50, i32 0, metadata !1907, metadata !1918}
!1907 = metadata !{i32 458763, metadata !1908, i32 43, i32 0}
!1908 = metadata !{i32 458798, i32 0, metadata !1909, metadata !"run_command", metadata !"run_command", metadata !"run_command", metadata !1909, i32 43, metadata !1910, i1 false, i1 true, i32 0, i32 0, null, i1 false}
!1909 = metadata !{i32 458769, i32 0, i32 1, metadata !"spawn.c", metadata !"/home/heming/rcs/direct-sym/apps/shadow/shadow-4.1.5/obj/lib/../../lib", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.7)", i1 true, i1 false, metadata !"", i32 0}
!1910 = metadata !{i32 458773, metadata !1909, metadata !"", metadata !1909, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1911, i32 0, null}
!1911 = metadata !{metadata !1912, metadata !1913, metadata !1916, metadata !1916, metadata !1917}
!1912 = metadata !{i32 458788, metadata !1909, metadata !"int", metadata !1909, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5}
!1913 = metadata !{i32 458767, metadata !1909, metadata !"", metadata !1909, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1914}
!1914 = metadata !{i32 458790, metadata !1909, metadata !"", metadata !1909, i32 0, i64 8, i64 8, i64 0, i32 0, metadata !1915}
!1915 = metadata !{i32 458788, metadata !1909, metadata !"char", metadata !1909, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6}
!1916 = metadata !{i32 458767, metadata !1909, metadata !"", metadata !1909, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1913}
!1917 = metadata !{i32 458767, metadata !1909, metadata !"", metadata !1909, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1912}
!1918 = metadata !{i32 26, i32 0, metadata !1896, null}
!1919 = metadata !{i32 51, i32 0, metadata !1907, metadata !1918}
!1920 = metadata !{i32 53, i32 0, metadata !1907, metadata !1918}
!1921 = metadata !{i32 55, i32 0, metadata !1907, metadata !1918}
!1922 = metadata !{i32 57, i32 0, metadata !1907, metadata !1918}
!1923 = metadata !{i32 58, i32 0, metadata !1907, metadata !1918}
!1924 = metadata !{i32 60, i32 0, metadata !1907, metadata !1918}
!1925 = metadata !{i32 62, i32 0, metadata !1907, metadata !1918}
!1926 = metadata !{i32 64, i32 0, metadata !1907, metadata !1918}
!1927 = metadata !{i32 66, i32 0, metadata !1907, metadata !1918}
!1928 = metadata !{i32 70, i32 0, metadata !1907, metadata !1918}
!1929 = metadata !{i32 72, i32 0, metadata !1907, metadata !1918}
!1930 = metadata !{i32 74, i32 0, metadata !1907, metadata !1918}
!1931 = metadata !{i32 75, i32 0, metadata !1907, metadata !1918}
!1932 = metadata !{i32 77, i32 0, metadata !1907, metadata !1918}
!1933 = metadata !{i32 28, i32 0, metadata !1896, null}
!1934 = metadata !{i32 32, i32 0, metadata !1896, null}
!1935 = metadata !{i32 33, i32 0, metadata !1896, null}
!1936 = metadata !{i32 34, i32 0, metadata !1937, null}
!1937 = metadata !{i32 458763, metadata !1896, i32 33, i32 0}
!1938 = metadata !{i32 43, i32 0, metadata !1896, null}
!1939 = metadata !{i32 45, i32 0, metadata !1896, null}
!1940 = metadata !{i32 50, i32 0, metadata !1941, metadata !1946}
!1941 = metadata !{i32 458763, metadata !1942, i32 46, i32 0}
!1942 = metadata !{i32 458798, i32 0, metadata !315, metadata !"__sgr_dup", metadata !"__sgr_dup", metadata !"__sgr_dup", metadata !315, i32 46, metadata !1943, i1 false, i1 true, i32 0, i32 0, null, i1 false}
!1943 = metadata !{i32 458773, metadata !315, metadata !"", metadata !315, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1944, i32 0, null}
!1944 = metadata !{metadata !1945, metadata !1086}
!1945 = metadata !{i32 458767, metadata !315, metadata !"", metadata !315, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1088}
!1946 = metadata !{i32 127, i32 0, metadata !1947, null}
!1947 = metadata !{i32 458763, metadata !1948, i32 124, i32 0}
!1948 = metadata !{i32 458798, i32 0, metadata !315, metadata !"gshadow_dup", metadata !"gshadow_dup", metadata !"gshadow_dup", metadata !315, i32 124, metadata !320, i1 true, i1 true, i32 0, i32 0, null, i1 false}
!1949 = metadata !{i32 51, i32 0, metadata !1941, metadata !1946}
!1950 = metadata !{i32 54, i32 0, metadata !1941, metadata !1946}
!1951 = metadata !{i32 55, i32 0, metadata !1941, metadata !1946}
!1952 = metadata !{i32 56, i32 0, metadata !1941, metadata !1946}
!1953 = metadata !{i32 59, i32 0, metadata !1941, metadata !1946}
!1954 = metadata !{i32 60, i32 0, metadata !1941, metadata !1946}
!1955 = metadata !{i32 66, i32 0, metadata !1941, metadata !1946}
!1956 = metadata !{i32 61, i32 0, metadata !1941, metadata !1946}
!1957 = metadata !{i32 62, i32 0, metadata !1941, metadata !1946}
!1958 = metadata !{i32 67, i32 0, metadata !1941, metadata !1946}
!1959 = metadata !{i32 68, i32 0, metadata !1941, metadata !1946}
!1960 = metadata !{i32 69, i32 0, metadata !1941, metadata !1946}
!1961 = metadata !{i32 70, i32 0, metadata !1941, metadata !1946}
!1962 = metadata !{i32 71, i32 0, metadata !1941, metadata !1946}
!1963 = metadata !{i32 75, i32 0, metadata !1941, metadata !1946}
!1964 = metadata !{i32 76, i32 0, metadata !1941, metadata !1946}
!1965 = metadata !{i32 78, i32 0, metadata !1941, metadata !1946}
!1966 = metadata !{i32 77, i32 0, metadata !1941, metadata !1946}
!1967 = metadata !{i32 80, i32 0, metadata !1941, metadata !1946}
!1968 = metadata !{i32 81, i32 0, metadata !1941, metadata !1946}
!1969 = metadata !{i32 82, i32 0, metadata !1941, metadata !1946}
!1970 = metadata !{i32 83, i32 0, metadata !1941, metadata !1946}
!1971 = metadata !{i32 74, i32 0, metadata !1941, metadata !1946}
!1972 = metadata !{i32 87, i32 0, metadata !1941, metadata !1946}
!1973 = metadata !{i32 89, i32 0, metadata !1941, metadata !1946}
!1974 = metadata !{i32 90, i32 0, metadata !1941, metadata !1946}
!1975 = metadata !{i32 91, i32 0, metadata !1941, metadata !1946}
!1976 = metadata !{i32 93, i32 0, metadata !1941, metadata !1946}
!1977 = metadata !{i32 92, i32 0, metadata !1941, metadata !1946}
!1978 = metadata !{i32 95, i32 0, metadata !1941, metadata !1946}
!1979 = metadata !{i32 96, i32 0, metadata !1941, metadata !1946}
!1980 = metadata !{i32 97, i32 0, metadata !1941, metadata !1946}
!1981 = metadata !{i32 98, i32 0, metadata !1941, metadata !1946}
!1982 = metadata !{i32 102, i32 0, metadata !1941, metadata !1946}
!1983 = metadata !{i32 103, i32 0, metadata !1941, metadata !1946}
!1984 = metadata !{i32 105, i32 0, metadata !1941, metadata !1946}
!1985 = metadata !{i32 104, i32 0, metadata !1941, metadata !1946}
!1986 = metadata !{i32 107, i32 0, metadata !1941, metadata !1946}
!1987 = metadata !{i32 108, i32 0, metadata !1941, metadata !1946}
!1988 = metadata !{i32 109, i32 0, metadata !1941, metadata !1946}
!1989 = metadata !{i32 111, i32 0, metadata !1941, metadata !1946}
!1990 = metadata !{i32 112, i32 0, metadata !1941, metadata !1946}
!1991 = metadata !{i32 113, i32 0, metadata !1941, metadata !1946}
!1992 = metadata !{i32 114, i32 0, metadata !1941, metadata !1946}
!1993 = metadata !{i32 101, i32 0, metadata !1941, metadata !1946}
!1994 = metadata !{i32 118, i32 0, metadata !1941, metadata !1946}
!1995 = metadata !{i32 140, i32 0, metadata !1996, metadata !2000}
!1996 = metadata !{i32 458763, metadata !1997, i32 138, i32 0}
!1997 = metadata !{i32 458798, i32 0, metadata !315, metadata !"sgr_free", metadata !"sgr_free", metadata !"sgr_free", metadata !315, i32 138, metadata !1998, i1 false, i1 true, i32 0, i32 0, null, i1 false}
!1998 = metadata !{i32 458773, metadata !315, metadata !"", metadata !315, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1999, i32 0, null}
!1999 = metadata !{null, metadata !1945}
!2000 = metadata !{i32 134, i32 0, metadata !2001, null}
!2001 = metadata !{i32 458763, metadata !2002, i32 131, i32 0}
!2002 = metadata !{i32 458798, i32 0, metadata !315, metadata !"gshadow_free", metadata !"gshadow_free", metadata !"gshadow_free", metadata !315, i32 131, metadata !325, i1 true, i1 true, i32 0, i32 0, null, i1 false}
!2003 = metadata !{i32 141, i32 0, metadata !1996, metadata !2000}
!2004 = metadata !{i32 142, i32 0, metadata !1996, metadata !2000}
!2005 = metadata !{i32 143, i32 0, metadata !1996, metadata !2000}
!2006 = metadata !{i32 146, i32 0, metadata !1996, metadata !2000}
!2007 = metadata !{i32 145, i32 0, metadata !1996, metadata !2000}
!2008 = metadata !{i32 148, i32 0, metadata !1996, metadata !2000}
!2009 = metadata !{i32 149, i32 0, metadata !1996, metadata !2000}
!2010 = metadata !{i32 150, i32 0, metadata !1996, metadata !2000}
!2011 = metadata !{i32 152, i32 0, metadata !1996, metadata !2000}
!2012 = metadata !{i32 153, i32 0, metadata !1996, metadata !2000}
!2013 = metadata !{i32 135, i32 0, metadata !2001, null}
!2014 = metadata !{i32 160, i32 0, metadata !2015, null}
!2015 = metadata !{i32 458763, metadata !2016, i32 157, i32 0}
!2016 = metadata !{i32 458798, i32 0, metadata !315, metadata !"gshadow_getname", metadata !"gshadow_getname", metadata !"gshadow_getname", metadata !315, i32 157, metadata !329, i1 true, i1 true, i32 0, i32 0, null, i1 false}
!2017 = metadata !{i32 139, i32 0, metadata !2018, metadata !2019}
!2018 = metadata !{i32 458763, metadata !447, i32 132, i32 0}
!2019 = metadata !{i32 165, i32 0, metadata !2020, null}
!2020 = metadata !{i32 458763, metadata !2021, i32 164, i32 0}
!2021 = metadata !{i32 458798, i32 0, metadata !315, metadata !"gshadow_parse", metadata !"gshadow_parse", metadata !"gshadow_parse", metadata !315, i32 164, metadata !336, i1 true, i1 true, i32 0, i32 0, null, i1 false}
!2022 = metadata !{i32 141, i32 0, metadata !2018, metadata !2019}
!2023 = metadata !{i32 142, i32 0, metadata !2024, metadata !2019}
!2024 = metadata !{i32 458763, metadata !2018, i32 141, i32 0}
!2025 = metadata !{i32 143, i32 0, metadata !2024, metadata !2019}
!2026 = metadata !{i32 146, i32 0, metadata !2024, metadata !2019}
!2027 = metadata !{i32 147, i32 0, metadata !2024, metadata !2019}
!2028 = metadata !{i32 150, i32 0, metadata !2018, metadata !2019}
!2029 = metadata !{i32 151, i32 0, metadata !2018, metadata !2019}
!2030 = metadata !{i32 153, i32 0, metadata !2018, metadata !2019}
!2031 = metadata !{i32 154, i32 0, metadata !2018, metadata !2019}
!2032 = metadata !{i32 155, i32 0, metadata !2018, metadata !2019}
!2033 = metadata !{i32 164, i32 0, metadata !2018, metadata !2019}
!2034 = metadata !{i32 165, i32 0, metadata !2018, metadata !2019}
!2035 = metadata !{i32 166, i32 0, metadata !2018, metadata !2019}
!2036 = metadata !{i32 167, i32 0, metadata !2018, metadata !2019}
!2037 = metadata !{i32 163, i32 0, metadata !2018, metadata !2019}
!2038 = metadata !{i32 176, i32 0, metadata !2018, metadata !2019}
!2039 = metadata !{i32 188, i32 0, metadata !2018, metadata !2019}
!2040 = metadata !{i32 189, i32 0, metadata !2018, metadata !2019}
!2041 = metadata !{i32 190, i32 0, metadata !2018, metadata !2019}
!2042 = metadata !{i32 191, i32 0, metadata !2018, metadata !2019}
!2043 = metadata !{i32 192, i32 0, metadata !2018, metadata !2019}
!2044 = metadata !{i32 193, i32 0, metadata !2018, metadata !2019}
!2045 = metadata !{i32 195, i32 0, metadata !2018, metadata !2019}
!2046 = metadata !{i32 196, i32 0, metadata !2018, metadata !2019}
!2047 = metadata !{i32 197, i32 0, metadata !2018, metadata !2019}
!2048 = metadata !{i32 198, i32 0, metadata !2018, metadata !2019}
!2049 = metadata !{i32 200, i32 0, metadata !2018, metadata !2019}
!2050 = metadata !{i32 201, i32 0, metadata !2018, metadata !2019}
!2051 = metadata !{i32 172, i32 0, metadata !2052, null}
!2052 = metadata !{i32 458763, metadata !2053, i32 169, i32 0}
!2053 = metadata !{i32 458798, i32 0, metadata !315, metadata !"gshadow_put", metadata !"gshadow_put", metadata !"gshadow_put", metadata !315, i32 169, metadata !340, i1 true, i1 true, i32 0, i32 0, null, i1 false}
!2054 = metadata !{i32 57, i32 0, metadata !1784, metadata !2051}
!2055 = metadata !{i32 64, i32 0, metadata !1784, metadata !2051}
!2056 = metadata !{i32 63, i32 0, metadata !1784, metadata !2051}
!2057 = metadata !{i32 73, i32 0, metadata !1784, metadata !2051}
!2058 = metadata !{i32 72, i32 0, metadata !1784, metadata !2051}
!2059 = metadata !{i32 179, i32 0, metadata !2052, null}
!2060 = metadata !{i32 64, i32 0, metadata !1784, metadata !2061}
!2061 = metadata !{i32 182, i32 0, metadata !2062, null}
!2062 = metadata !{i32 458763, metadata !2052, i32 179, i32 0}
!2063 = metadata !{i32 63, i32 0, metadata !1784, metadata !2061}
!2064 = metadata !{i32 73, i32 0, metadata !1784, metadata !2061}
!2065 = metadata !{i32 72, i32 0, metadata !1784, metadata !2061}
!2066 = metadata !{i32 181, i32 0, metadata !2062, null}
!2067 = metadata !{i32 189, i32 0, metadata !2052, null}
!2068 = metadata !{i32 64, i32 0, metadata !1784, metadata !2069}
!2069 = metadata !{i32 192, i32 0, metadata !2070, null}
!2070 = metadata !{i32 458763, metadata !2052, i32 189, i32 0}
!2071 = metadata !{i32 63, i32 0, metadata !1784, metadata !2069}
!2072 = metadata !{i32 73, i32 0, metadata !1784, metadata !2069}
!2073 = metadata !{i32 72, i32 0, metadata !1784, metadata !2069}
!2074 = metadata !{i32 191, i32 0, metadata !2070, null}
!2075 = metadata !{i32 450, i32 0, metadata !2076, metadata !2082}
!2076 = metadata !{i32 458763, metadata !2077, i32 445, i32 0}
!2077 = metadata !{i32 458798, i32 0, metadata !437, metadata !"putsgent", metadata !"putsgent", metadata !"putsgent", metadata !437, i32 445, metadata !2078, i1 false, i1 true, i32 0, i32 0, null, i1 false}
!2078 = metadata !{i32 458773, metadata !437, metadata !"", metadata !437, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !2079, i32 0, null}
!2079 = metadata !{metadata !470, metadata !2080, metadata !465}
!2080 = metadata !{i32 458767, metadata !437, metadata !"", metadata !437, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !2081}
!2081 = metadata !{i32 458790, metadata !437, metadata !"", metadata !437, i32 0, i64 256, i64 64, i64 0, i32 0, metadata !451}
!2082 = metadata !{i32 198, i32 0, metadata !2052, null}
!2083 = metadata !{i32 455, i32 0, metadata !2076, metadata !2082}
!2084 = metadata !{i32 456, i32 0, metadata !2076, metadata !2082}
!2085 = metadata !{i32 457, i32 0, metadata !2076, metadata !2082}
!2086 = metadata !{i32 460, i32 0, metadata !2076, metadata !2082}
!2087 = metadata !{i32 459, i32 0, metadata !2076, metadata !2082}
!2088 = metadata !{i32 463, i32 0, metadata !2076, metadata !2082}
!2089 = metadata !{i32 464, i32 0, metadata !2076, metadata !2082}
!2090 = metadata !{i32 473, i32 0, metadata !2076, metadata !2082}
!2091 = metadata !{i32 474, i32 0, metadata !2076, metadata !2082}
!2092 = metadata !{i32 475, i32 0, metadata !2076, metadata !2082}
!2093 = metadata !{i32 477, i32 0, metadata !2076, metadata !2082}
!2094 = metadata !{i32 478, i32 0, metadata !2076, metadata !2082}
!2095 = metadata !{i32 479, i32 0, metadata !2076, metadata !2082}
!2096 = metadata !{i32 486, i32 0, metadata !2076, metadata !2082}
!2097 = metadata !{i32 487, i32 0, metadata !2076, metadata !2082}
!2098 = metadata !{i32 488, i32 0, metadata !2076, metadata !2082}
!2099 = metadata !{i32 491, i32 0, metadata !2076, metadata !2082}
!2100 = metadata !{i32 492, i32 0, metadata !2076, metadata !2082}
!2101 = metadata !{i32 494, i32 0, metadata !2076, metadata !2082}
!2102 = metadata !{i32 495, i32 0, metadata !2076, metadata !2082}
!2103 = metadata !{i32 501, i32 0, metadata !2076, metadata !2082}
!2104 = metadata !{i32 502, i32 0, metadata !2076, metadata !2082}
!2105 = metadata !{i32 503, i32 0, metadata !2076, metadata !2082}
!2106 = metadata !{i32 504, i32 0, metadata !2076, metadata !2082}
!2107 = metadata !{i32 507, i32 0, metadata !2076, metadata !2082}
!2108 = metadata !{i32 508, i32 0, metadata !2076, metadata !2082}
!2109 = metadata !{i32 510, i32 0, metadata !2076, metadata !2082}
!2110 = metadata !{i32 511, i32 0, metadata !2076, metadata !2082}
!2111 = metadata !{i32 512, i32 0, metadata !2076, metadata !2082}
!2112 = metadata !{i32 73, i32 0, metadata !2113, metadata !2173}
!2113 = metadata !{i32 458763, metadata !2114, i32 70, i32 0}
!2114 = metadata !{i32 458798, i32 0, metadata !2115, metadata !"fputsx", metadata !"fputsx", metadata !"fputsx", metadata !2115, i32 70, metadata !2116, i1 false, i1 true, i32 0, i32 0, null, i1 false}
!2115 = metadata !{i32 458769, i32 0, i32 1, metadata !"fputsx.c", metadata !"/home/heming/rcs/direct-sym/apps/shadow/shadow-4.1.5/obj/lib/../../lib", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.7)", i1 true, i1 false, metadata !"", i32 0}
!2116 = metadata !{i32 458773, metadata !2115, metadata !"", metadata !2115, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !2117, i32 0, null}
!2117 = metadata !{metadata !2118, metadata !2119, metadata !2122}
!2118 = metadata !{i32 458788, metadata !2115, metadata !"int", metadata !2115, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5}
!2119 = metadata !{i32 458767, metadata !2115, metadata !"", metadata !2115, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !2120}
!2120 = metadata !{i32 458790, metadata !2115, metadata !"", metadata !2115, i32 0, i64 8, i64 8, i64 0, i32 0, metadata !2121}
!2121 = metadata !{i32 458788, metadata !2115, metadata !"char", metadata !2115, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6}
!2122 = metadata !{i32 458767, metadata !2115, metadata !"", metadata !2115, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !2123}
!2123 = metadata !{i32 458774, metadata !2115, metadata !"FILE", metadata !206, i32 49, i64 0, i64 0, i64 0, i32 0, metadata !2124}
!2124 = metadata !{i32 458771, metadata !2115, metadata !"_IO_FILE", metadata !206, i32 45, i64 1728, i64 64, i64 0, i32 0, null, metadata !2125, i32 0, null}
!2125 = metadata !{metadata !2126, metadata !2127, metadata !2129, metadata !2130, metadata !2131, metadata !2132, metadata !2133, metadata !2134, metadata !2135, metadata !2136, metadata !2137, metadata !2138, metadata !2139, metadata !2147, metadata !2148, metadata !2149, metadata !2150, metadata !2153, metadata !2155, metadata !2157, metadata !2159, metadata !2161, metadata !2163, metadata !2164, metadata !2165, metadata !2166, metadata !2167, metadata !2170, metadata !2171}
!2126 = metadata !{i32 458765, metadata !2124, metadata !"_flags", metadata !210, i32 272, i64 32, i64 32, i64 0, i32 0, metadata !2118}
!2127 = metadata !{i32 458765, metadata !2124, metadata !"_IO_read_ptr", metadata !210, i32 277, i64 64, i64 64, i64 64, i32 0, metadata !2128}
!2128 = metadata !{i32 458767, metadata !2115, metadata !"", metadata !2115, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !2121}
!2129 = metadata !{i32 458765, metadata !2124, metadata !"_IO_read_end", metadata !210, i32 278, i64 64, i64 64, i64 128, i32 0, metadata !2128}
!2130 = metadata !{i32 458765, metadata !2124, metadata !"_IO_read_base", metadata !210, i32 279, i64 64, i64 64, i64 192, i32 0, metadata !2128}
!2131 = metadata !{i32 458765, metadata !2124, metadata !"_IO_write_base", metadata !210, i32 280, i64 64, i64 64, i64 256, i32 0, metadata !2128}
!2132 = metadata !{i32 458765, metadata !2124, metadata !"_IO_write_ptr", metadata !210, i32 281, i64 64, i64 64, i64 320, i32 0, metadata !2128}
!2133 = metadata !{i32 458765, metadata !2124, metadata !"_IO_write_end", metadata !210, i32 282, i64 64, i64 64, i64 384, i32 0, metadata !2128}
!2134 = metadata !{i32 458765, metadata !2124, metadata !"_IO_buf_base", metadata !210, i32 283, i64 64, i64 64, i64 448, i32 0, metadata !2128}
!2135 = metadata !{i32 458765, metadata !2124, metadata !"_IO_buf_end", metadata !210, i32 284, i64 64, i64 64, i64 512, i32 0, metadata !2128}
!2136 = metadata !{i32 458765, metadata !2124, metadata !"_IO_save_base", metadata !210, i32 286, i64 64, i64 64, i64 576, i32 0, metadata !2128}
!2137 = metadata !{i32 458765, metadata !2124, metadata !"_IO_backup_base", metadata !210, i32 287, i64 64, i64 64, i64 640, i32 0, metadata !2128}
!2138 = metadata !{i32 458765, metadata !2124, metadata !"_IO_save_end", metadata !210, i32 288, i64 64, i64 64, i64 704, i32 0, metadata !2128}
!2139 = metadata !{i32 458765, metadata !2124, metadata !"_markers", metadata !210, i32 290, i64 64, i64 64, i64 768, i32 0, metadata !2140}
!2140 = metadata !{i32 458767, metadata !2115, metadata !"", metadata !2115, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !2141}
!2141 = metadata !{i32 458771, metadata !2115, metadata !"_IO_marker", metadata !210, i32 186, i64 192, i64 64, i64 0, i32 0, null, metadata !2142, i32 0, null}
!2142 = metadata !{metadata !2143, metadata !2144, metadata !2146}
!2143 = metadata !{i32 458765, metadata !2141, metadata !"_next", metadata !210, i32 187, i64 64, i64 64, i64 0, i32 0, metadata !2140}
!2144 = metadata !{i32 458765, metadata !2141, metadata !"_sbuf", metadata !210, i32 188, i64 64, i64 64, i64 64, i32 0, metadata !2145}
!2145 = metadata !{i32 458767, metadata !2115, metadata !"", metadata !2115, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !2124}
!2146 = metadata !{i32 458765, metadata !2141, metadata !"_pos", metadata !210, i32 192, i64 32, i64 32, i64 128, i32 0, metadata !2118}
!2147 = metadata !{i32 458765, metadata !2124, metadata !"_chain", metadata !210, i32 292, i64 64, i64 64, i64 832, i32 0, metadata !2145}
!2148 = metadata !{i32 458765, metadata !2124, metadata !"_fileno", metadata !210, i32 294, i64 32, i64 32, i64 896, i32 0, metadata !2118}
!2149 = metadata !{i32 458765, metadata !2124, metadata !"_flags2", metadata !210, i32 298, i64 32, i64 32, i64 928, i32 0, metadata !2118}
!2150 = metadata !{i32 458765, metadata !2124, metadata !"_old_offset", metadata !210, i32 300, i64 64, i64 64, i64 960, i32 0, metadata !2151}
!2151 = metadata !{i32 458774, metadata !2115, metadata !"__off_t", metadata !69, i32 141, i64 0, i64 0, i64 0, i32 0, metadata !2152}
!2152 = metadata !{i32 458788, metadata !2115, metadata !"long int", metadata !2115, i32 0, i64 64, i64 64, i64 0, i32 0, i32 5}
!2153 = metadata !{i32 458765, metadata !2124, metadata !"_cur_column", metadata !210, i32 304, i64 16, i64 16, i64 1024, i32 0, metadata !2154}
!2154 = metadata !{i32 458788, metadata !2115, metadata !"short unsigned int", metadata !2115, i32 0, i64 16, i64 16, i64 0, i32 0, i32 7}
!2155 = metadata !{i32 458765, metadata !2124, metadata !"_vtable_offset", metadata !210, i32 305, i64 8, i64 8, i64 1040, i32 0, metadata !2156}
!2156 = metadata !{i32 458788, metadata !2115, metadata !"signed char", metadata !2115, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6}
!2157 = metadata !{i32 458765, metadata !2124, metadata !"_shortbuf", metadata !210, i32 306, i64 8, i64 8, i64 1048, i32 0, metadata !2158}
!2158 = metadata !{i32 458753, metadata !2115, metadata !"", metadata !2115, i32 0, i64 8, i64 8, i64 0, i32 0, metadata !2121, metadata !243, i32 0, null}
!2159 = metadata !{i32 458765, metadata !2124, metadata !"_lock", metadata !210, i32 310, i64 64, i64 64, i64 1088, i32 0, metadata !2160}
!2160 = metadata !{i32 458767, metadata !2115, metadata !"", metadata !2115, i32 0, i64 64, i64 64, i64 0, i32 0, null}
!2161 = metadata !{i32 458765, metadata !2124, metadata !"_offset", metadata !210, i32 319, i64 64, i64 64, i64 1152, i32 0, metadata !2162}
!2162 = metadata !{i32 458774, metadata !2115, metadata !"__off64_t", metadata !69, i32 142, i64 0, i64 0, i64 0, i32 0, metadata !2152}
!2163 = metadata !{i32 458765, metadata !2124, metadata !"__pad1", metadata !210, i32 328, i64 64, i64 64, i64 1216, i32 0, metadata !2160}
!2164 = metadata !{i32 458765, metadata !2124, metadata !"__pad2", metadata !210, i32 329, i64 64, i64 64, i64 1280, i32 0, metadata !2160}
!2165 = metadata !{i32 458765, metadata !2124, metadata !"__pad3", metadata !210, i32 330, i64 64, i64 64, i64 1344, i32 0, metadata !2160}
!2166 = metadata !{i32 458765, metadata !2124, metadata !"__pad4", metadata !210, i32 331, i64 64, i64 64, i64 1408, i32 0, metadata !2160}
!2167 = metadata !{i32 458765, metadata !2124, metadata !"__pad5", metadata !210, i32 332, i64 64, i64 64, i64 1472, i32 0, metadata !2168}
!2168 = metadata !{i32 458774, metadata !2115, metadata !"size_t", metadata !126, i32 214, i64 0, i64 0, i64 0, i32 0, metadata !2169}
!2169 = metadata !{i32 458788, metadata !2115, metadata !"long unsigned int", metadata !2115, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7}
!2170 = metadata !{i32 458765, metadata !2124, metadata !"_mode", metadata !210, i32 334, i64 32, i64 32, i64 1536, i32 0, metadata !2118}
!2171 = metadata !{i32 458765, metadata !2124, metadata !"_unused2", metadata !210, i32 336, i64 160, i64 8, i64 1568, i32 0, metadata !2172}
!2172 = metadata !{i32 458753, metadata !2115, metadata !"", metadata !2115, i32 0, i64 160, i64 8, i64 0, i32 0, metadata !2121, metadata !258, i32 0, null}
!2173 = metadata !{i32 519, i32 0, metadata !2076, metadata !2082}
!2174 = metadata !{i32 74, i32 0, metadata !2113, metadata !2173}
!2175 = metadata !{i32 520, i32 0, metadata !2076, metadata !2082}
!2176 = metadata !{i32 524, i32 0, metadata !2076, metadata !2082}
!2177 = metadata !{i32 413, i32 0, metadata !2178, null}
!2178 = metadata !{i32 458763, metadata !2179, i32 401, i32 0}
!2179 = metadata !{i32 458798, i32 0, metadata !432, metadata !"commonio_lock", metadata !"commonio_lock", metadata !"commonio_lock", metadata !432, i32 401, metadata !2180, i1 false, i1 true, i32 0, i32 0, null, i1 false}
!2180 = metadata !{i32 458773, metadata !432, metadata !"", metadata !432, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !2181, i32 0, null}
!2181 = metadata !{metadata !433, metadata !912}
!2182 = metadata !{i32 414, i32 0, metadata !2178, null}
!2183 = metadata !{i32 415, i32 0, metadata !2178, null}
!2184 = metadata !{i32 416, i32 0, metadata !2178, null}
!2185 = metadata !{i32 429, i32 0, metadata !2178, null}
!2186 = metadata !{i32 428, i32 0, metadata !2178, null}
!2187 = metadata !{i32 485, i32 0, metadata !2188, null}
!2188 = metadata !{i32 458763, metadata !2189, i32 482, i32 0}
!2189 = metadata !{i32 458798, i32 0, metadata !432, metadata !"commonio_unlock", metadata !"commonio_unlock", metadata !"commonio_unlock", metadata !432, i32 482, metadata !2180, i1 false, i1 true, i32 0, i32 0, null, i1 false}
!2190 = metadata !{i32 486, i32 0, metadata !2188, null}
!2191 = metadata !{i32 487, i32 0, metadata !2188, null}
!2192 = metadata !{i32 488, i32 0, metadata !2188, null}
!2193 = metadata !{i32 463, i32 0, metadata !2194, metadata !2197}
!2194 = metadata !{i32 458763, metadata !2195, i32 462, i32 0}
!2195 = metadata !{i32 458798, i32 0, metadata !432, metadata !"dec_lock_count", metadata !"dec_lock_count", metadata !"dec_lock_count", metadata !432, i32 462, metadata !2196, i1 true, i1 true, i32 0, i32 0, null, i1 false}
!2196 = metadata !{i32 458773, metadata !432, metadata !"", metadata !432, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !108, i32 0, null}
!2197 = metadata !{i32 489, i32 0, metadata !2188, null}
!2198 = metadata !{i32 464, i32 0, metadata !2194, metadata !2197}
!2199 = metadata !{i32 465, i32 0, metadata !2194, metadata !2197}
!2200 = metadata !{i32 468, i32 0, metadata !2194, metadata !2197}
!2201 = metadata !{i32 471, i32 0, metadata !2194, metadata !2197}
!2202 = metadata !{i32 474, i32 0, metadata !2194, metadata !2197}
!2203 = metadata !{i32 505, i32 0, metadata !2188, null}
!2204 = metadata !{i32 494, i32 0, metadata !2188, null}
!2205 = metadata !{i32 499, i32 0, metadata !2188, null}
!2206 = metadata !{i32 500, i32 0, metadata !2188, null}
!2207 = metadata !{i32 501, i32 0, metadata !2188, null}
!2208 = metadata !{i32 463, i32 0, metadata !2194, metadata !2209}
!2209 = metadata !{i32 502, i32 0, metadata !2188, null}
!2210 = metadata !{i32 464, i32 0, metadata !2194, metadata !2209}
!2211 = metadata !{i32 465, i32 0, metadata !2194, metadata !2209}
!2212 = metadata !{i32 468, i32 0, metadata !2194, metadata !2209}
!2213 = metadata !{i32 471, i32 0, metadata !2194, metadata !2209}
!2214 = metadata !{i32 474, i32 0, metadata !2194, metadata !2209}
!2215 = metadata !{i32 597, i32 0, metadata !2216, null}
!2216 = metadata !{i32 458763, metadata !2217, i32 586, i32 0}
!2217 = metadata !{i32 458798, i32 0, metadata !432, metadata !"commonio_open", metadata !"commonio_open", metadata !"commonio_open", metadata !432, i32 586, metadata !2218, i1 false, i1 true, i32 0, i32 0, null, i1 false}
!2218 = metadata !{i32 458773, metadata !432, metadata !"", metadata !432, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !2219, i32 0, null}
!2219 = metadata !{metadata !433, metadata !912, metadata !433}
!2220 = metadata !{i32 599, i32 0, metadata !2216, null}
!2221 = metadata !{i32 602, i32 0, metadata !2216, null}
!2222 = metadata !{i32 739, i32 0, metadata !2216, null}
!2223 = metadata !{i32 605, i32 0, metadata !2216, null}
!2224 = metadata !{i32 606, i32 0, metadata !2216, null}
!2225 = metadata !{i32 607, i32 0, metadata !2216, null}
!2226 = metadata !{i32 611, i32 0, metadata !2216, null}
!2227 = metadata !{i32 612, i32 0, metadata !2216, null}
!2228 = metadata !{i32 613, i32 0, metadata !2216, null}
!2229 = metadata !{i32 614, i32 0, metadata !2216, null}
!2230 = metadata !{i32 616, i32 0, metadata !2216, null}
!2231 = metadata !{i32 619, i32 0, metadata !2216, null}
!2232 = metadata !{i32 620, i32 0, metadata !2216, null}
!2233 = metadata !{i32 621, i32 0, metadata !2216, null}
!2234 = metadata !{i32 629, i32 0, metadata !2216, null}
!2235 = metadata !{i32 630, i32 0, metadata !2216, null}
!2236 = metadata !{i32 631, i32 0, metadata !2216, null}
!2237 = metadata !{i32 632, i32 0, metadata !2216, null}
!2238 = metadata !{i32 635, i32 0, metadata !2216, null}
!2239 = metadata !{i32 641, i32 0, metadata !2216, null}
!2240 = metadata !{i32 642, i32 0, metadata !2216, null}
!2241 = metadata !{i32 643, i32 0, metadata !2216, null}
!2242 = metadata !{i32 650, i32 0, metadata !2216, null}
!2243 = metadata !{i32 653, i32 0, metadata !2216, null}
!2244 = metadata !{i32 654, i32 0, metadata !2216, null}
!2245 = metadata !{i32 658, i32 0, metadata !2216, null}
!2246 = metadata !{i32 663, i32 0, metadata !2247, null}
!2247 = metadata !{i32 458763, metadata !2216, i32 654, i32 0}
!2248 = metadata !{i32 664, i32 0, metadata !2247, null}
!2249 = metadata !{i32 665, i32 0, metadata !2247, null}
!2250 = metadata !{i32 669, i32 0, metadata !2247, null}
!2251 = metadata !{i32 670, i32 0, metadata !2247, null}
!2252 = metadata !{i32 659, i32 0, metadata !2216, null}
!2253 = metadata !{i32 676, i32 0, metadata !2216, null}
!2254 = metadata !{i32 677, i32 0, metadata !2216, null}
!2255 = metadata !{i32 678, i32 0, metadata !2216, null}
!2256 = metadata !{i32 681, i32 0, metadata !2216, null}
!2257 = metadata !{i32 682, i32 0, metadata !2216, null}
!2258 = metadata !{i32 534, i32 0, metadata !2259, metadata !2263}
!2259 = metadata !{i32 458763, metadata !2260, i32 533, i32 0}
!2260 = metadata !{i32 458798, i32 0, metadata !432, metadata !"name_is_nis", metadata !"name_is_nis", metadata !"name_is_nis", metadata !432, i32 533, metadata !2261, i1 true, i1 true, i32 0, i32 0, null, i1 false}
!2261 = metadata !{i32 458773, metadata !432, metadata !"", metadata !432, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !2262, i32 0, null}
!2262 = metadata !{metadata !435, metadata !935}
!2263 = metadata !{i32 686, i32 0, metadata !2216, null}
!2264 = metadata !{i32 689, i32 0, metadata !2216, null}
!2265 = metadata !{i32 690, i32 0, metadata !2216, null}
!2266 = metadata !{i32 691, i32 0, metadata !2216, null}
!2267 = metadata !{i32 692, i32 0, metadata !2216, null}
!2268 = metadata !{i32 698, i32 0, metadata !2216, null}
!2269 = metadata !{i32 699, i32 0, metadata !2216, null}
!2270 = metadata !{i32 703, i32 0, metadata !2216, null}
!2271 = metadata !{i32 704, i32 0, metadata !2216, null}
!2272 = metadata !{i32 705, i32 0, metadata !2216, null}
!2273 = metadata !{i32 519, i32 0, metadata !2274, metadata !2278}
!2274 = metadata !{i32 458763, metadata !2275, i32 517, i32 0}
!2275 = metadata !{i32 458798, i32 0, metadata !432, metadata !"add_one_entry", metadata !"add_one_entry", metadata !"add_one_entry", metadata !432, i32 517, metadata !2276, i1 true, i1 true, i32 0, i32 0, null, i1 false}
!2276 = metadata !{i32 458773, metadata !432, metadata !"", metadata !432, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !2277, i32 0, null}
!2277 = metadata !{null, metadata !912, metadata !1010}
!2278 = metadata !{i32 707, i32 0, metadata !2216, null}
!2279 = metadata !{i32 520, i32 0, metadata !2274, metadata !2278}
!2280 = metadata !{i32 522, i32 0, metadata !2274, metadata !2278}
!2281 = metadata !{i32 523, i32 0, metadata !2274, metadata !2278}
!2282 = metadata !{i32 525, i32 0, metadata !2274, metadata !2278}
!2283 = metadata !{i32 526, i32 0, metadata !2274, metadata !2278}
!2284 = metadata !{i32 528, i32 0, metadata !2274, metadata !2278}
!2285 = metadata !{i32 710, i32 0, metadata !2216, null}
!2286 = metadata !{i32 712, i32 0, metadata !2216, null}
!2287 = metadata !{i32 716, i32 0, metadata !2216, null}
!2288 = metadata !{i32 720, i32 0, metadata !2216, null}
!2289 = metadata !{i32 724, i32 0, metadata !2216, null}
!2290 = metadata !{i32 725, i32 0, metadata !2216, null}
!2291 = metadata !{i32 727, i32 0, metadata !2216, null}
!2292 = metadata !{i32 728, i32 0, metadata !2216, null}
!2293 = metadata !{i32 729, i32 0, metadata !2216, null}
!2294 = metadata !{i32 730, i32 0, metadata !2216, null}
!2295 = metadata !{i32 731, i32 0, metadata !2216, null}
!2296 = metadata !{i32 732, i32 0, metadata !2216, null}
!2297 = metadata !{i32 733, i32 0, metadata !2216, null}
!2298 = metadata !{i32 734, i32 0, metadata !2216, null}
!2299 = metadata !{i32 357, i32 0, metadata !2300, metadata !2304}
!2300 = metadata !{i32 458763, metadata !2301, i32 345, i32 0}
!2301 = metadata !{i32 458798, i32 0, metadata !432, metadata !"free_linked_list", metadata !"free_linked_list", metadata !"free_linked_list", metadata !432, i32 345, metadata !2302, i1 true, i1 true, i32 0, i32 0, null, i1 false}
!2302 = metadata !{i32 458773, metadata !432, metadata !"", metadata !432, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !2303, i32 0, null}
!2303 = metadata !{null, metadata !912}
!2304 = metadata !{i32 735, i32 0, metadata !2216, null}
!2305 = metadata !{i32 345, i32 0, metadata !2301, metadata !2304}
!2306 = metadata !{i32 350, i32 0, metadata !2300, metadata !2304}
!2307 = metadata !{i32 352, i32 0, metadata !2300, metadata !2304}
!2308 = metadata !{i32 353, i32 0, metadata !2300, metadata !2304}
!2309 = metadata !{i32 356, i32 0, metadata !2300, metadata !2304}
!2310 = metadata !{i32 360, i32 0, metadata !2300, metadata !2304}
!2311 = metadata !{i32 348, i32 0, metadata !2300, metadata !2304}
!2312 = metadata !{i32 362, i32 0, metadata !2300, metadata !2304}
!2313 = metadata !{i32 736, i32 0, metadata !2216, null}
!2314 = metadata !{i32 737, i32 0, metadata !2216, null}
!2315 = metadata !{i32 738, i32 0, metadata !2216, null}
!2316 = metadata !{i32 917, i32 0, metadata !2317, null}
!2317 = metadata !{i32 458763, metadata !2318, i32 912, i32 0}
!2318 = metadata !{i32 458798, i32 0, metadata !432, metadata !"commonio_close", metadata !"commonio_close", metadata !"commonio_close", metadata !432, i32 912, metadata !2180, i1 false, i1 true, i32 0, i32 0, null, i1 false}
!2319 = metadata !{i32 918, i32 0, metadata !2317, null}
!2320 = metadata !{i32 1021, i32 0, metadata !2317, null}
!2321 = metadata !{i32 921, i32 0, metadata !2317, null}
!2322 = metadata !{i32 923, i32 0, metadata !2317, null}
!2323 = metadata !{i32 924, i32 0, metadata !2317, null}
!2324 = metadata !{i32 925, i32 0, metadata !2317, null}
!2325 = metadata !{i32 929, i32 0, metadata !2317, null}
!2326 = metadata !{i32 933, i32 0, metadata !2317, null}
!2327 = metadata !{i32 934, i32 0, metadata !2317, null}
!2328 = metadata !{i32 935, i32 0, metadata !2317, null}
!2329 = metadata !{i32 936, i32 0, metadata !2317, null}
!2330 = metadata !{i32 937, i32 0, metadata !2317, null}
!2331 = metadata !{i32 944, i32 0, metadata !2317, null}
!2332 = metadata !{i32 951, i32 0, metadata !2317, null}
!2333 = metadata !{i32 306, i32 0, metadata !2334, metadata !2332}
!2334 = metadata !{i32 458763, metadata !2335, i32 299, i32 0}
!2335 = metadata !{i32 458798, i32 0, metadata !432, metadata !"create_backup", metadata !"create_backup", metadata !"create_backup", metadata !432, i32 299, metadata !1001, i1 true, i1 true, i32 0, i32 0, null, i1 false}
!2336 = metadata !{i32 310, i32 0, metadata !2334, metadata !2332}
!2337 = metadata !{i32 311, i32 0, metadata !2334, metadata !2332}
!2338 = metadata !{i32 312, i32 0, metadata !2334, metadata !2332}
!2339 = metadata !{i32 313, i32 0, metadata !2334, metadata !2332}
!2340 = metadata !{i32 319, i32 0, metadata !2334, metadata !2332}
!2341 = metadata !{i32 321, i32 0, metadata !2334, metadata !2332}
!2342 = metadata !{i32 320, i32 0, metadata !2334, metadata !2332}
!2343 = metadata !{i32 326, i32 0, metadata !2334, metadata !2332}
!2344 = metadata !{i32 327, i32 0, metadata !2334, metadata !2332}
!2345 = metadata !{i32 329, i32 0, metadata !2334, metadata !2332}
!2346 = metadata !{i32 331, i32 0, metadata !2334, metadata !2332}
!2347 = metadata !{i32 337, i32 0, metadata !2334, metadata !2332}
!2348 = metadata !{i32 338, i32 0, metadata !2334, metadata !2332}
!2349 = metadata !{i32 339, i32 0, metadata !2334, metadata !2332}
!2350 = metadata !{i32 955, i32 0, metadata !2317, null}
!2351 = metadata !{i32 964, i32 0, metadata !2317, null}
!2352 = metadata !{i32 965, i32 0, metadata !2317, null}
!2353 = metadata !{i32 973, i32 0, metadata !2317, null}
!2354 = metadata !{i32 974, i32 0, metadata !2317, null}
!2355 = metadata !{i32 975, i32 0, metadata !2317, null}
!2356 = metadata !{i32 978, i32 0, metadata !2317, null}
!2357 = metadata !{i32 980, i32 0, metadata !2317, null}
!2358 = metadata !{i32 890, i32 0, metadata !2359, metadata !2365}
!2359 = metadata !{i32 458763, metadata !2360, i32 886, i32 0}
!2360 = metadata !{i32 458798, i32 0, metadata !432, metadata !"write_all", metadata !"write_all", metadata !"write_all", metadata !432, i32 886, metadata !2361, i1 true, i1 true, i32 0, i32 0, null, i1 false}
!2361 = metadata !{i32 458773, metadata !432, metadata !"", metadata !432, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !2362, i32 0, null}
!2362 = metadata !{metadata !433, metadata !2363}
!2363 = metadata !{i32 458767, metadata !432, metadata !"", metadata !432, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !2364}
!2364 = metadata !{i32 458790, metadata !432, metadata !"", metadata !432, i32 0, i64 8576, i64 64, i64 0, i32 0, metadata !913}
!2365 = metadata !{i32 985, i32 0, metadata !2317, null}
!2366 = metadata !{i32 891, i32 0, metadata !2359, metadata !2365}
!2367 = metadata !{i32 892, i32 0, metadata !2359, metadata !2365}
!2368 = metadata !{i32 893, i32 0, metadata !2359, metadata !2365}
!2369 = metadata !{i32 894, i32 0, metadata !2359, metadata !2365}
!2370 = metadata !{i32 897, i32 0, metadata !2359, metadata !2365}
!2371 = metadata !{i32 898, i32 0, metadata !2359, metadata !2365}
!2372 = metadata !{i32 901, i32 0, metadata !2359, metadata !2365}
!2373 = metadata !{i32 986, i32 0, metadata !2317, null}
!2374 = metadata !{i32 989, i32 0, metadata !2317, null}
!2375 = metadata !{i32 993, i32 0, metadata !2317, null}
!2376 = metadata !{i32 999, i32 0, metadata !2317, null}
!2377 = metadata !{i32 1003, i32 0, metadata !2317, null}
!2378 = metadata !{i32 1005, i32 0, metadata !2317, null}
!2379 = metadata !{i32 1006, i32 0, metadata !2317, null}
!2380 = metadata !{i32 94, i32 0, metadata !2381, metadata !2385}
!2381 = metadata !{i32 458763, metadata !2382, i32 85, i32 0}
!2382 = metadata !{i32 458798, i32 0, metadata !432, metadata !"lrename", metadata !"lrename", metadata !"lrename", metadata !432, i32 85, metadata !2383, i1 true, i1 true, i32 0, i32 0, null, i1 false}
!2383 = metadata !{i32 458773, metadata !432, metadata !"", metadata !432, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !2384, i32 0, null}
!2384 = metadata !{metadata !433, metadata !935, metadata !935}
!2385 = metadata !{i32 1010, i32 0, metadata !2317, null}
!2386 = metadata !{i32 96, i32 0, metadata !2381, metadata !2385}
!2387 = metadata !{i32 100, i32 0, metadata !2381, metadata !2385}
!2388 = metadata !{i32 108, i32 0, metadata !2381, metadata !2385}
!2389 = metadata !{i32 101, i32 0, metadata !2381, metadata !2385}
!2390 = metadata !{i32 111, i32 0, metadata !2381, metadata !2385}
!2391 = metadata !{i32 112, i32 0, metadata !2381, metadata !2385}
!2392 = metadata !{i32 1014, i32 0, metadata !2317, null}
!2393 = metadata !{i32 1017, i32 0, metadata !2317, null}
!2394 = metadata !{i32 1018, i32 0, metadata !2317, null}
!2395 = metadata !{i32 348, i32 0, metadata !2300, metadata !2396}
!2396 = metadata !{i32 1020, i32 0, metadata !2317, null}
!2397 = metadata !{i32 357, i32 0, metadata !2300, metadata !2396}
!2398 = metadata !{i32 345, i32 0, metadata !2301, metadata !2396}
!2399 = metadata !{i32 350, i32 0, metadata !2300, metadata !2396}
!2400 = metadata !{i32 352, i32 0, metadata !2300, metadata !2396}
!2401 = metadata !{i32 353, i32 0, metadata !2300, metadata !2396}
!2402 = metadata !{i32 356, i32 0, metadata !2300, metadata !2396}
!2403 = metadata !{i32 360, i32 0, metadata !2300, metadata !2396}
!2404 = metadata !{i32 362, i32 0, metadata !2300, metadata !2396}
!2405 = metadata !{i32 1032, i32 0, metadata !2406, null}
!2406 = metadata !{i32 458763, metadata !2407, i32 1028, i32 0}
!2407 = metadata !{i32 458798, i32 0, metadata !432, metadata !"next_entry_by_name", metadata !"next_entry_by_name", metadata !"next_entry_by_name", metadata !432, i32 1028, metadata !2408, i1 true, i1 true, i32 0, i32 0, null, i1 false}
!2408 = metadata !{i32 458773, metadata !432, metadata !"", metadata !432, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !2409, i32 0, null}
!2409 = metadata !{metadata !1010, metadata !912, metadata !1010, metadata !935}
!2410 = metadata !{i32 1038, i32 0, metadata !2406, null}
!2411 = metadata !{i32 1036, i32 0, metadata !2406, null}
!2412 = metadata !{i32 1037, i32 0, metadata !2406, null}
!2413 = metadata !{i32 1043, i32 0, metadata !2406, null}
!2414 = metadata !{i32 1059, i32 0, metadata !2415, null}
!2415 = metadata !{i32 458763, metadata !2416, i32 1055, i32 0}
!2416 = metadata !{i32 458798, i32 0, metadata !432, metadata !"commonio_update", metadata !"commonio_update", metadata !"commonio_update", metadata !432, i32 1055, metadata !2417, i1 false, i1 true, i32 0, i32 0, null, i1 false}
!2417 = metadata !{i32 458773, metadata !432, metadata !"", metadata !432, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !2418, i32 0, null}
!2418 = metadata !{metadata !433, metadata !912, metadata !911}
!2419 = metadata !{i32 1060, i32 0, metadata !2415, null}
!2420 = metadata !{i32 1101, i32 0, metadata !2415, null}
!2421 = metadata !{i32 1063, i32 0, metadata !2415, null}
!2422 = metadata !{i32 1064, i32 0, metadata !2415, null}
!2423 = metadata !{i32 1065, i32 0, metadata !2415, null}
!2424 = metadata !{i32 1068, i32 0, metadata !2415, null}
!2425 = metadata !{i32 1050, i32 0, metadata !1043, metadata !2424}
!2426 = metadata !{i32 1032, i32 0, metadata !2406, metadata !2425}
!2427 = metadata !{i32 1037, i32 0, metadata !2406, metadata !2425}
!2428 = metadata !{i32 1038, i32 0, metadata !2406, metadata !2425}
!2429 = metadata !{i32 1036, i32 0, metadata !2406, metadata !2425}
!2430 = metadata !{i32 1070, i32 0, metadata !2415, null}
!2431 = metadata !{i32 1032, i32 0, metadata !2406, metadata !2430}
!2432 = metadata !{i32 1037, i32 0, metadata !2406, metadata !2430}
!2433 = metadata !{i32 1038, i32 0, metadata !2406, metadata !2430}
!2434 = metadata !{i32 1036, i32 0, metadata !2406, metadata !2430}
!2435 = metadata !{i32 1071, i32 0, metadata !2415, null}
!2436 = metadata !{i32 1074, i32 0, metadata !2415, null}
!2437 = metadata !{i32 1075, i32 0, metadata !2415, null}
!2438 = metadata !{i32 1076, i32 0, metadata !2415, null}
!2439 = metadata !{i32 1077, i32 0, metadata !2415, null}
!2440 = metadata !{i32 1079, i32 0, metadata !2415, null}
!2441 = metadata !{i32 1083, i32 0, metadata !2415, null}
!2442 = metadata !{i32 1084, i32 0, metadata !2415, null}
!2443 = metadata !{i32 1085, i32 0, metadata !2415, null}
!2444 = metadata !{i32 1086, i32 0, metadata !2415, null}
!2445 = metadata !{i32 1090, i32 0, metadata !2415, null}
!2446 = metadata !{i32 1091, i32 0, metadata !2415, null}
!2447 = metadata !{i32 1092, i32 0, metadata !2415, null}
!2448 = metadata !{i32 561, i32 0, metadata !2449, metadata !2451}
!2449 = metadata !{i32 458763, metadata !2450, i32 558, i32 0}
!2450 = metadata !{i32 458798, i32 0, metadata !432, metadata !"add_one_entry_nis", metadata !"add_one_entry_nis", metadata !"add_one_entry_nis", metadata !432, i32 558, metadata !2276, i1 true, i1 true, i32 0, i32 0, null, i1 false}
!2451 = metadata !{i32 1095, i32 0, metadata !2415, null}
!2452 = metadata !{i32 562, i32 0, metadata !2449, metadata !2451}
!2453 = metadata !{i32 534, i32 0, metadata !2259, metadata !2452}
!2454 = metadata !{i32 565, i32 0, metadata !2449, metadata !2451}
!2455 = metadata !{i32 566, i32 0, metadata !2449, metadata !2451}
!2456 = metadata !{i32 568, i32 0, metadata !2449, metadata !2451}
!2457 = metadata !{i32 569, i32 0, metadata !2449, metadata !2451}
!2458 = metadata !{i32 571, i32 0, metadata !2449, metadata !2451}
!2459 = metadata !{i32 573, i32 0, metadata !2449, metadata !2451}
!2460 = metadata !{i32 519, i32 0, metadata !2274, metadata !2461}
!2461 = metadata !{i32 577, i32 0, metadata !2449, metadata !2451}
!2462 = metadata !{i32 520, i32 0, metadata !2274, metadata !2461}
!2463 = metadata !{i32 522, i32 0, metadata !2274, metadata !2461}
!2464 = metadata !{i32 523, i32 0, metadata !2274, metadata !2461}
!2465 = metadata !{i32 525, i32 0, metadata !2274, metadata !2461}
!2466 = metadata !{i32 526, i32 0, metadata !2274, metadata !2461}
!2467 = metadata !{i32 528, i32 0, metadata !2274, metadata !2461}
!2468 = metadata !{i32 1100, i32 0, metadata !2415, null}
!2469 = metadata !{i32 44, i32 0, metadata !2470, null}
!2470 = metadata !{i32 458763, metadata !2471, i32 43, i32 0}
!2471 = metadata !{i32 458798, i32 0, metadata !2115, metadata !"fgetsx", metadata !"fgetsx", metadata !"fgetsx", metadata !2115, i32 43, metadata !2472, i1 false, i1 true, i32 0, i32 0, null, i1 false}
!2472 = metadata !{i32 458773, metadata !2115, metadata !"", metadata !2115, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !2473, i32 0, null}
!2473 = metadata !{metadata !2128, metadata !2128, metadata !2118, metadata !2122}
!2474 = metadata !{i32 48, i32 0, metadata !2470, null}
!2475 = metadata !{i32 49, i32 0, metadata !2470, null}
!2476 = metadata !{i32 55, i32 0, metadata !2470, null}
!2477 = metadata !{i32 56, i32 0, metadata !2470, null}
!2478 = metadata !{i32 57, i32 0, metadata !2470, null}
!2479 = metadata !{i32 58, i32 0, metadata !2470, null}
!2480 = metadata !{i32 60, i32 0, metadata !2470, null}
!2481 = metadata !{i32 47, i32 0, metadata !2470, null}
!2482 = metadata !{i32 66, i32 0, metadata !2470, null}
!2483 = metadata !{i32 73, i32 0, metadata !2113, null}
!2484 = metadata !{i32 74, i32 0, metadata !2113, null}
!2485 = metadata !{i32 88, i32 0, metadata !2113, null}
!2486 = metadata !{i32 84, i32 0, metadata !2487, null}
!2487 = metadata !{i32 458763, metadata !2488, i32 82, i32 0}
!2488 = metadata !{i32 458798, i32 0, metadata !437, metadata !"build_list", metadata !"build_list", metadata !"build_list", metadata !437, i32 82, metadata !2489, i1 true, i1 true, i32 0, i32 0, null, i1 false}
!2489 = metadata !{i32 458773, metadata !437, metadata !"", metadata !437, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !2490, i32 0, null}
!2490 = metadata !{metadata !438, metadata !439, metadata !2491, metadata !2492}
!2491 = metadata !{i32 458767, metadata !437, metadata !"", metadata !437, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !438}
!2492 = metadata !{i32 458767, metadata !437, metadata !"", metadata !437, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !442}
!2493 = metadata !{i32 88, i32 0, metadata !2487, null}
!2494 = metadata !{i32 89, i32 0, metadata !2487, null}
!2495 = metadata !{i32 90, i32 0, metadata !2487, null}
!2496 = metadata !{i32 91, i32 0, metadata !2487, null}
!2497 = metadata !{i32 92, i32 0, metadata !2487, null}
!2498 = metadata !{i32 93, i32 0, metadata !2487, null}
!2499 = metadata !{i32 94, i32 0, metadata !2487, null}
!2500 = metadata !{i32 95, i32 0, metadata !2487, null}
!2501 = metadata !{i32 96, i32 0, metadata !2487, null}
!2502 = metadata !{i32 97, i32 0, metadata !2487, null}
!2503 = metadata !{i32 86, i32 0, metadata !2487, null}
!2504 = metadata !{i32 102, i32 0, metadata !2487, null}
!2505 = metadata !{i32 103, i32 0, metadata !2487, null}
!2506 = metadata !{i32 104, i32 0, metadata !2487, null}
!2507 = metadata !{i32 105, i32 0, metadata !2487, null}
!2508 = metadata !{i32 107, i32 0, metadata !2487, null}
