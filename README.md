clang-crashes
=============

This repo collects known test cases crashing clang – the "LLVM native" C/C++/Objective-C compiler.

Getting started
===============

```
$ git clone https://github.com/practicalswift/clang-crashes.git
$ cd clang-crashes/
$ ./test.sh

Running tests against clang-dev (clang version 3.7.0 (trunk 226206) (llvm/trunk 226205))
Usage: ./test.sh [-v] [-q] [-c<columns>] [-l] [file ...]
Adding a new test case? The crash id to use for the next test case is 00041.

== Currently known crashes, set #1 (human reported crashes, crashes not found by fuzzing) ==

  ✓  No tests found.

== Currently known crashes, set #2 (crashes found by fuzzing) ==

  ✘  00003 clang preprocessor lex (Objective-C)                   (a8f36bc695)
  ✘  00004 clang preprocessor lex (Objective-C)                   (5bc30b15e0)
  ✘  00005 clang preprocessor lex (Objective-C)                   (af9d24de29)
  ✘  00006 clang preprocessor lex (Objective-C)                   (316733326b)
  ✘  00008 clang preprocessor lex (Objective-C)                   (e0943e8431)
  ✘  00009 clang objcinterfacedecl hasdefinition (Objective-C)    (ec94582879)
  ✘  00011 llvm smallvectorimpl (C)                               (d15bdf293e)
  ✘  00013 expression did not evaluate to integer (C)             (b3cebb796f)
  ✘  00014 expression did not evaluate to integer (Objective-C)   (4beda0c717)
  ✘  00015 std 1 list (C)                                         (b59f1f2b25)
  ✘  00016 void llvm cl printoptiondiff (Objective-C)             (90bafa00ae)
  ✘  00019 void llvm cl printoptiondiff (C)                       (9c240c3ee9)
  ✘  00020 void llvm cl printoptiondiff (C)                       (c17a1eac08)
  ✘  00026 void llvm cl printoptiondiff (C)                       (be143df58c)
  ✘  00027 void llvm cl printoptiondiff (Objective-C)             (bd384ed433)
  ✘  00028 void llvm cl printoptiondiff (C)                       (f375e40444)
  ✘  00029 cannot get layout of invalid decl (Objective-C)        (65df83b1de)
  ✘  00031 void llvm cl printoptiondiff (Objective-C)             (c6c234485f)
  ✘  00032 invalid interface decl (Objective-C)                   (5ca5356940)
  ✘  00033 eof seen while discarding directive tokens (C)         (5d71ea338b)
  ✘  00038 void llvm cl printoptiondiff (C)                       (467711c93e)
  ✘  00039 could not evaluate expression (Objective-C)            (5cffab6a6c)
  ✘  00040 void llvm cl printoptiondiff (C)                       (b6ad92cf3c)

== Crashes marked as fixed in previous releases ==

  ✓  00001 not in a function (C)
  ✓  00002 not in a function (C++)
  ✓  00007 clang identifierinfo getname (Objective-C)
  ✓  00017 not in a function (C)
  ✓  00018 not in a function (Objective-C)
  ✓  00022 not in a function (Objective-C)
  ✓  00023 void llvm cl printoptiondiff (Objective-C)
  ✓  00025 not in a function (C++)
  ✓  00034 not in a function (Objective-C)
  ✓  00035 cannot retrieve a null type pointer (C)
  ✓  00036 not in a function (Objective-C)

** Results: 23 of 34 tests crashed the compiler **

```

License
=======
All files in this repository are distributed under the terms of the MIT license (see <a href="https://github.com/practicalswift/swift-compiler-crashes/blob/master/LICENSE">LICENSE</a>).
