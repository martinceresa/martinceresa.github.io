---
title: "Declarative Stream Runtime Verification (hLola)"
authors: Martín Ceresa and Felipe Gorostiaga and César Sánchez
year: 2020
venue: Asian Programming Languages and Systems
date: 2020-11-30
cite: https://doi.org/10.1007/978-3-030-64437-6_2
---
Stream Runtime Verification (SRV) is a formal dynamic analysis technique that
generalizes runtime verification algorithms from temporal logics like LTL to
stream monitoring, allowing the computation of richer verdicts than Booleans
(quantitative values or even arbitrary data). The core of SRV algorithms is a
clean separation between temporal dependencies and data computations. In spite
of this theoretical separation previous engines include ad-hoc implementations
of just a few data types, requiring complex changes in the tools to incorporate
new data types.

In this paper we present a solution as a Haskell embedded domain specific
language that is easily extensible to arbitrary data types. The solution is
enabled by a technique, which we call lift deep embedding, that consists in
borrowing general Haskell types and embedding them transparently into an eDSL.
This allows for example the use of higher-order functions to implement static
stream parametrization. We describe the Haskell implementation called HLOLA and
illustrate simple extensions implemented using libraries, which would require
long and error-prone additions in other ad-hoc SRV formalisms.
