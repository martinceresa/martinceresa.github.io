---
title: "Multi: A Formal Playground for Multi-Smart Contract Interaction"
authors: Martín Ceresa and César Sánchez
year: 2022
venue: Workshop on Formal Methods for Blockchains
date: 2022-10-06
cite: https://doi.org/10.4230/OASIcs.FMBC.2022.5
---

Blockchains are maintained by a network of participants, miner nodes, that run
algorithms designed to maintain collectively a distributed machine tolerant to
Byzantine attacks. From the point of view of users, blockchains provide the
illusion of centralized computers that perform trustable verifiable
computations, where all computations are deterministic and the results cannot be
manipulated or undone.

Every blockchain is equipped with a crypto-currency. Programs running on
blockchains are called smart-contracts and are written in a special-purpose
programming language with deterministic semantics. Each transaction begins with
an invocation from an external user to a smart contract. Smart contracts have
local storage and can call other contracts, and more importantly, they store,
send and receive cryptocurrency.

Once installed in a blockchain, the code of the smart-contract cannot be
modified. Therefore, it is very important to guarantee that contracts are
correct before deployment. However, the resulting ecosystem makes it very
difficult to reason about program correctness, since smart-contracts can be
executed by malicious users or malicious smart-contracts can be designed to
exploit other contracts that call them. Many attacks and bugs are caused by
unexpected interactions between multiple contracts, the attacked contract and
unknown code that performs the exploit.

Moreover, there is a very aggressive competition between different blockchains
to expand their user base. Ideas are implemented fast and blockchains compete to
offer and adopt new features quickly.

In this paper, we propose a formal playground that allows reasoning about
multi-contract interactions and is extensible to incorporate new features, study
their behaviour and ultimately prove properties before features are incorporated
into the real blockchain. We implemented a model of computation that models the
execution platform, abstracts the internal code of each individual contract and
focuses on contract interactions. Even though our Coq implementation is still a
work in progress, we show how many features, existing or proposed, can be used
to reason about multi-contract interactions.
