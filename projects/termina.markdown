---
title: Termina -- Programming Language
year: 2022
date: 2022-03-10
description: "Termina is a domain-specific language for real-time embedded systems aimed at simplifying their implementation and reducing validation and verification costs."
---

[Termina](https://github.com/termina-lang/termina)
is a domain-specific language for real-time embedded systems aimed at simplifying their implementation and reducing validation and verification costs.

This repository contains the implementation of a transpiler from Termina to C.
The generated code is supported on a [runtime](https://github.com/termina-lang/termina-runtime) that in turn runs on a real-time
operating system.

## Main features

- **Ease of learning and use**. Termina follows the imperative paradigm with a syntax similar to C to facilitate adoption by current developers.
- **Domain-specific abstractions**. The language includes abstractions pertinent to reactive critical real-time systems, such as events, tasks, and asynchronous handlers, aligning design models with final application code.
- **Reactive programming model**. Tasks and handlers in Termina will be reactive components, incorporating various response actions. The language will enable global event definition and association with component actions, enhancing application analysis and verification.
- **_Run-to-completion_ semantics**. Actions in the system always complete once started, without blocking their executing tasks. This approach requires **all functions to be terminating**, with bounded loops and no recursion, aiding verification procedures.
- **Design patterns for safety and robustness**. Termina supports only two interaction mechanisms between reactive elements: shared resources and asynchronous message passing. A monitor-based approach manages shared resources.
- **Deterministic dynamic memory management**. Termina only allows the use of memory pools as a dynamic memory management mechanism.
- **Provision of memory-safety properties**. Termina implements a type system that guarantees that no error arises from memory management. In particular, the absence of access errors, null-pointer de-references and memory leaks.
