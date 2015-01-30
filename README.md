clang-crashes
=============

This repo collects known test cases crashing clang – the "LLVM native" C/C++/Objective-C compiler.

Getting started
===============

```
$ git clone https://github.com/practicalswift/clang-crashes.git
$ cd clang-crashes/
$ ./test.sh

Running tests against clang-dev (clang version 3.7.0 (trunk 227017))
Usage: ./test.sh [-v] [-q] [-c<columns>] [-l] [file ...]
Adding a new test case? The crash id to use for the next test case is 00054.

== Currently known crashes, set #1 (human reported crashes, crashes not found by fuzzing) ==

  ✓  No tests found.

== Currently known crashes, set #2 (crashes found by fuzzing) ==

  ✘  00003 clang preprocessor lex (Objective-C)                   (2b568e44b1)
  ✘  00004 clang preprocessor lex (Objective-C)                   (3a7a61c22e)
  ✘  00005 clang preprocessor lex (Objective-C)                   (9238335867)
  ✘  00006 clang preprocessor lex (Objective-C)                   (2071074ac1)
  ✘  00008 clang preprocessor lex (Objective-C)                   (e843958205)
  ✘  00009 clang objcinterfacedecl hasdefinition (Objective-C)    (3f70727b17)
  ✘  00011 llvm smallvectorimpl (C)                               (42c4679604)
  ✘  00013 expression did not evaluate to integer (C)             (aa059a4e48)
  ✘  00014 expression did not evaluate to integer (Objective-C)   (7584663316)
  ✘  00015 std 1 list (C)                                         (dc0176b9ff)
  ✘  00016 void llvm cl printoptiondiff (Objective-C)             (044dd3d286)
  ✘  00019 void llvm cl printoptiondiff (C)                       (91ffc8c8ef)
  ✘  00020 void llvm cl printoptiondiff (C)                       (10375ca8a3)
  ✘  00026 void llvm cl printoptiondiff (C)                       (10d763463d)
  ✘  00027 void llvm cl printoptiondiff (Objective-C)             (c3af3d8261)
  ✘  00028 void llvm cl printoptiondiff (C)                       (0eeff50434)
  ✘  00029 cannot get layout of invalid decl (Objective-C)        (ce4db6a2fb)
  ✘  00032 invalid interface decl (Objective-C)                   (96bbe80d56)
  ✘  00033 eof seen while discarding directive tokens (C)         (b1103abc3d)
  ✘  00038 void llvm cl printoptiondiff (C)                       (68bce0790d)
  ✘  00040 void llvm cl printoptiondiff (C)                       (b8b6fa08ab)
  ✘  00041 llvm sys printstacktrace (C)                           (a355b91aa7)
  ✘  00042 llvm sys printstacktrace (C)                           (721cb6d8d5)
  ✘  00043 llvm sys printstacktrace (C)                           (f731c3dc10)
  ✘  00045 expression did not evaluate to integer (Objective-C)   (efd7962a33)
  ✘  00046 void std seed seq generate (Objective-C)               (0ec93083f0)
  ✘  00047 void std seed seq generate (C)                         (4a4a62bf7d)
  ✘  00048 invalid token lexed (C)                                (ac2f19c694)
  ✘  00049 location out of range for this buffer (C)              (0680dbfb3c)
  ✘  00050 void std seed seq generate (C)                         (fc262118f4)
  ✘  00051 void std seed seq generate (C)                         (569d316bef)
  ✘  00052 cannot get layout of forward declarations (Objective-C (c30d5899f9)
  ✘  00053 invalid token lexed (C)                                (89ad92281d)

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

** Results: 33 of 45 tests crashed the compiler **

```

License
=======
All files in this repository are distributed under the terms of the MIT license (see <a href="https://github.com/practicalswift/swift-compiler-crashes/blob/master/LICENSE">LICENSE</a>).
