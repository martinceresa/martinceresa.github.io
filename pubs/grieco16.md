---
title: "QuickFuzz: an automatic random fuzzer for common file formats"
authors: Gustavo Grieco and Martín Ceresa and Pablo Buiras
year: 2016
venue: Haskell Symposium
date: 2016-09-22
cite: https://doi.org/10.1145/2976002.2976017
---

Fuzzing is a technique that involves testing programs using invalid or erroneous
inputs. Most fuzzers require a set of valid inputs as a starting point, in which
mutations are then introduced. QuickFuzz is a fuzzer that leverages
QuickCheck-style random test-case generationto automatically test programs that
manipulate common file formats by fuzzing. We rely on existing Haskell
implementations of file-format-handling libraries found on Hackage, the
community-driven Haskell code repository. We have tried QuickFuzz in the wild
and found that the approach is effective in discovering vulnerabilities in
real-world implementations of browsers, image processing utilities and file
compressors among others. In addition, we introduce a mechanism to automatically
derive random generators for the types representing these formats. QuickFuzz
handles most well-known image and media formats, and can be used to test
programs and libraries written in any language.
