clang-crashes
=============

This repo collects known test cases crashing clang – the "LLVM native" C/C++/Objective-C compiler.

Getting started
===============

```
$ git clone https://github.com/practicalswift/clang-crashes.git
$ cd clang-crashes/
$ ./test.sh

Running tests against: clang (clang version 3.6.0 (trunk 224786))
Usage: ./test.sh [-v] [-q] [-c<columns>] [-l] [file ...]
Adding a new test case? The crash id to use for the next test case is 00010.

== Currently known crashes, set #1 (human reported crashes, crashes not found by fuzzing) ==

  ✓  No tests found.

== Currently known crashes, set #2 (crashes found by fuzzing) ==

  ✘  00001 clang sema lookuporcreatelabel (C)                     (f7a40612c5)
  ✘  00002 clang sema lookuporcreatelabelpp (C++)                 (a5a1414e8c)
  ✘  00003 clang preprocessor lex (Objective-C)                   (aee296f6ea)
  ✘  00004 clang preprocessor lex (Objective-C)                   (44a1258bca)
  ✘  00005 clang preprocessor lex (Objective-C)                   (fa449c7921)
  ✘  00006 clang preprocessor lex (Objective-C)                   (08ee1a56d8)
  ✘  00007 clang identifierinfo getname (Objective-C)             (11df54f0ba)
  ✘  00008 clang preprocessor lex (Objective-C)                   (92d01866ff)
  ✘  00009 clang objcinterfacedecl hasdefinition (Objective-C)    (84ae455ac5)

== Crashes marked as fixed in previous releases ==

  ✓  No tests found.

** Results: 9 of 9 tests crashed the compiler **

```

License
=======
All files in this repository are distributed under the terms of the MIT license (see <a href="https://github.com/practicalswift/swift-compiler-crashes/blob/master/LICENSE">LICENSE</a>).
