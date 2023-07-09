---
title: "Effectful improvement theory"
authors: Martín Ceresa and Mauro Jaskelioff
year: 2022
venue: Science of Computer Programming
date: 2022-04-01
cite: https://doi.org/10.1016/j.scico.2022.102792
---

Optimizing programs is hard. Not only one must preserve semantics, but one also
needs to ensure that an optimization truly makes the program better. The first
part, preserving program semantics, has been, and still is, the subject of much
research. We follow a line of work that starts with Morris' observational
equivalence, continues with Abramsky's applicative bisimilarity and Howe's
method, and concludes in a recent abstract formalization of applicative
bisimilarity in the presence of algebraic effects by Dal Lago, Gavazzo and Levy.
The second part, ensuring that an optimization truly makes the program better,
is a path less traveled, with the improvement theory of Sands being the most
prominent example.
In this work, we connect these two parts by obtaining an
abstract theory of improvements based on effectful applicative bisimilarity that
extends Sands' notion of improvement to effectful languages.
