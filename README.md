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

Running tests against clang-dev (clang version 3.7.0 (trunk 230859))
Usage: ./test.sh [-v] [-q] [-c<columns>] [-l] [file ...]
Adding a new test case? The crash id to use for the next test case is 00062.

== Currently known crashes, set #1 (human reported crashes, crashes not found by fuzzing) ==

  ✓  No tests found.

== Currently known crashes, set #2 (crashes found by fuzzing) ==

  ✘  00003 clang preprocessor lex (Objective-C)                   (1b09a707e8)
  ✘  00004 clang preprocessor lex (Objective-C)                   (40045957dc)
  ✘  00005 clang preprocessor lex (Objective-C)                   (eac2ef117c)
  ✘  00006 clang preprocessor lex (Objective-C)                   (75c4f8382c)
  ✘  00008 clang preprocessor lex (Objective-C)                   (256df27e45)
  ✘  00009 clang objcinterfacedecl hasdefinition (Objective-C)    (e0c468b312)
  ✘  00011 llvm smallvectorimpl (C)                               (4878310254)
  ✘  00013 expression did not evaluate to integer (C)             (3d32adddbc)
  ✘  00014 expression did not evaluate to integer (Objective-C)   (3d8630bce2)
  ✘  00015 std 1 list (C)                                         (a2f37ec0c7)
  ✘  00016 void llvm cl printoptiondiff (Objective-C)             (ff42080f45)
  ✘  00019 void llvm cl printoptiondiff (C)                       (572f98c7e6)
  ✘  00020 void llvm cl printoptiondiff (C)                       (de37257f7b)
  ✘  00026 void llvm cl printoptiondiff (C)                       (1eab976b0c)
  ✘  00027 void llvm cl printoptiondiff (Objective-C)             (37c916bd00)
  ✘  00028 void llvm cl printoptiondiff (C)                       (9eef8a3163)
  ✘  00029 cannot get layout of invalid decl (Objective-C)        (a59986ced6)
  ✘  00032 invalid interface decl (Objective-C)                   (bb153156be)
  ✘  00033 eof seen while discarding directive tokens (C)         (5e789afc6e)
  ✘  00038 void llvm cl printoptiondiff (C)                       (9634767f0a)
  ✘  00040 void llvm cl printoptiondiff (C)                       (a02650592b)
  ✘  00041 llvm sys printstacktrace (C)                           (49e3654617)
  ✘  00042 llvm sys printstacktrace (C)                           (db3b9cceac)
  ✘  00043 llvm sys printstacktrace (C)                           (1032dec233)
  ✘  00045 expression did not evaluate to integer (Objective-C)   (910ae58561)
  ✘  00046 void std seed seq generate (Objective-C)               (56898aa93e)
  ✘  00047 void std seed seq generate (C)                         (68468dae45)
  ✘  00048 invalid token lexed (C) (timeout)                      (          )
  ✘  00049 location out of range for this buffer (C)              (93da4597e2)
  ✘  00050 void std seed seq generate (C)                         (d9394dc488)
  ✘  00051 void std seed seq generate (C)                         (4a618340dd)
  ✘  00052 cannot get layout of forward declarations (Objective-C (53755c4950)
  ✘  00053 invalid token lexed (C) (timeout)                      (          )
  ✘  00054 void std seed seq generate (C)                         (b3a85deb8d)
  ✘  00055 void std seed seq generate (C)                         (842d319881)
  ✘  00056 void std seed seq generate (Objective-C)               (da471c6154)
  ✘  00057 void std seed seq generate (C)                         (3533564bd2)
  ✘  00058 void std seed seq generate (Objective-C)               (e71fec678c)
  ✘  00059 none (Objective-C) (timeout)                           (          )
  ✘  00060 none (Objective-C) (timeout)                           (          )
  ✘  00061 void std seed seq generate (Objective-C)               (cf97858c91)

== Crashes marked as fixed ==

  ✓  00001 not in a function (C)
  ✓  00002 not in a function (C++)
  ✓  00007 clang identifierinfo getname (Objective-C)
  ✓  00017 not in a function (C)
  ✓  00018 not in a function (Objective-C)
  ✓  00022 not in a function (Objective-C)
  ✓  00023 void llvm cl printoptiondiff (Objective-C)
  ✓  00025 not in a function (C++)
  ✓  00031 void llvm cl printoptiondiff (Objective-C)
  ✓  00034 not in a function (Objective-C)
  ✓  00035 cannot retrieve a null type pointer (C)
  ✓  00036 not in a function (Objective-C)

** Results: 41 of 53 tests crashed the compiler **

```

License
=======
All files in this repository are distributed under the terms of the MIT license (see <a href="https://github.com/practicalswift/swift-compiler-crashes/blob/master/LICENSE">LICENSE</a>).
