clang-crashes
=============

This repo collects known test cases crashing clang – the "LLVM native" C/C++/Objective-C compiler.

A test case is valid for inclusion in this project if it crashes the current SVN trunk version of clang compiled with the configure flags `--enable-optimized --disable-assertions`.

Getting started
===============

```
$ git clone https://github.com/practicalswift/clang-crashes.git
$ cd clang-crashes/
$ ./test.sh

Running tests against clang-dev (clang version 3.7.0 (trunk 241392))
Usage: ./test.sh [-v] [-q] [-c<columns>] [-l] [file ...]
Adding a new test case? The crash id to use for the next test case is 00071.

== Currently known crashes, set #1 (human reported crashes, crashes not found by fuzzing) ==

  ✓  No tests found.

== Currently known crashes, set #2 (crashes found by fuzzing) ==

  ✘  00003 clang preprocessor lex (Objective-C)                   (b4108851a8)
  ✘  00004 clang preprocessor lex (Objective-C)                   (76dd1d75f8)
  ✘  00005 clang preprocessor lex (Objective-C)                   (9ffa101412)
  ✘  00006 clang preprocessor lex (Objective-C)                   (6065b5ea48)
  ✘  00008 clang preprocessor lex (Objective-C)                   (6d73cce420)
  ✘  00009 clang objcinterfacedecl hasdefinition (Objective-C)    (23ca6e1161)
  ✘  00016 void llvm cl printoptiondiff (Objective-C)             (55d94adb84)
  ✘  00029 cannot get layout of invalid decl (Objective-C)        (a65e5ffebd)
  ✘  00032 invalid interface decl (Objective-C)                   (d469bf9e40)
  ✘  00033 eof seen while discarding directive tokens (C)         (1f27300b42)
  ✘  00040 void llvm cl printoptiondiff (C)                       (d3eb45ad16)
  ✘  00041 llvm sys printstacktrace (C)                           (2f8e02a9f4)
  ✘  00042 llvm sys printstacktrace (C)                           (c4ab619aff)
  ✘  00043 llvm sys printstacktrace (C)                           (7752d8efef)
  ✘  00045 expression did not evaluate to integer (Objective-C)   (87a9211e4e)
  ✘  00046 void std seed seq generate (Objective-C)               (4ef9ac2f67)
  ✘  00056 void std seed seq generate (Objective-C)               (a94b7e14df)
  ✘  00058 void std seed seq generate (Objective-C)               (a6860ce762)
  ✘  00061 void std seed seq generate (Objective-C)               (b9c1b0668c)
  ✘  00062 void std seed seq generate (Objective-C)               (583e9ca715)
  ✘  00063 void std seed seq generate (Objective-C)               (256dbd6236)
  ✘  00064 llvm smallvectortemplatebase (C)                       (0feb0bdb38)
  ✘  00065 should not see dependent types here (C)                (18fa771813)
  ✘  00066 none (C)                                               (19bff8856e)
  ✘  00067 none (C)                                               (3b4f875c13)
  ✘  00068 eof seen while discarding directive tokens (C)         (addc60626f)
  ✘  00069 eof seen while discarding directive tokens (C)         (0d3b61e051)
  ✘  00070 isa used on a null pointer (C)                         (cd7d396161)

== Crashes marked as fixed ==

  ✓  00001 not in a function (C)
  ✓  00002 not in a function (C++)
  ✓  00007 clang identifierinfo getname (Objective-C)
  ✓  00011 llvm smallvectorimpl (C)
  ✓  00013 expression did not evaluate to integer (C)
  ✓  00014 expression did not evaluate to integer (Objective-C)
  ✓  00015 std 1 list (C)
  ✓  00017 not in a function (C)
  ✓  00018 not in a function (Objective-C)
  ✓  00019 void llvm cl printoptiondiff (C)
  ✓  00020 void llvm cl printoptiondiff (C)
  ✓  00022 not in a function (Objective-C)
  ✓  00023 void llvm cl printoptiondiff (Objective-C)
  ✓  00025 not in a function (C++)
  ✓  00026 void llvm cl printoptiondiff (C)
  ✓  00027 void llvm cl printoptiondiff (Objective-C)
  ✓  00028 void llvm cl printoptiondiff (C)
  ✓  00031 void llvm cl printoptiondiff (Objective-C)
  ✓  00034 not in a function (Objective-C)
  ✓  00035 cannot retrieve a null type pointer (C)
  ✓  00036 not in a function (Objective-C)
  ✓  00038 void llvm cl printoptiondiff (C)
  ✓  00047 void std seed seq generate (C)
  ✓  00048 invalid token lexed (C)
  ✓  00049 location out of range for this buffer (C)
  ✓  00050 void std seed seq generate (C)
  ✓  00051 void std seed seq generate (C)
  ✓  00053 invalid token lexed (C)
  ✓  00054 void std seed seq generate (C)
  ✓  00055 void std seed seq generate (C)
  ✓  00057 void std seed seq generate (C)
  ✓  00059 none (Objective-C)
  ✓  00060 none (Objective-C)

** Results: 28 of 61 tests crashed the compiler **

```

License
=======
All files in this repository are distributed under the terms of the MIT license (see <a href="https://github.com/practicalswift/swift-compiler-crashes/blob/master/LICENSE">LICENSE</a>).
