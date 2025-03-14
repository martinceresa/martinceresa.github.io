---
title: "Multi Formal Playground"
year: 2022
date: 2022-01-01
description: "Coq Library implementing Tezos model of computation."
keywords: Coq, Computation Models, Blockchains
---

[Multi](https://gitlab.software.imdea.org/martin.ceresa/multi) is a small Coq
Library implementing (a probably outdated) Tezos computation model. We were
playing with several additional mechanisms that could have been added to the blockchain
and we wanted to see (and prove) how these mechanisms would impact contract interactions.

We also believed that attacks (or exploits) came from the interaction of
(provably) correct smart contracts at the interface definition level.  In other
words, we wanted to see how interaction breaks smart contracts implicit
protocols or assumptions.
