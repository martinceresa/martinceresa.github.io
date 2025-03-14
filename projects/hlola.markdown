---
title: HLola
year: 2019
date: 2019-10-05
description: "Stream Runtime Verification Engine implemented en Haskell borrowing (some) Haskell Data Types as Data Theories."
keywords: Haskell, Stream Runtime Verification
---
#### HLola

Most recent project I had the pleasure to get involved is
[HLola](https://github.com/imdea-software/hlola). *HLola* is a [Lola]() engine.
It is presented as embedded Domain Specific Language in Haskell were we tried to
get rid of concrete types and focus our attention on the *temporal aspects* of a
given specification.
Abstracting away specific types, not only we presented (finally) an
implementation were in principle simple types can be added seamlessly **but
also** we maintained the wonderful property of constant memory execution for a
proved kind of specification.
My role here was to provide guidance on the creation and implementation of such
an eDSL.
