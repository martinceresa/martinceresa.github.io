---
title: "Monitoring the Future of Smart Contracts"
authors: Margarita Capretto, Martín Ceresa and César Sánchez
year: 2024
venue: Fundamental Approaches to Software Engineering
date: 2024-04-06
cite: https://link.springer.com/chapter/10.1007/978-3-031-57259-3_6
---

Blockchains are decentralized systems that provide trustable execution
guarantees through the use of programs called smart contracts. Smart contracts
are programs written in domain-specific programming languages running on
blockchains that govern how tokens and cryptocurrency are sent and received.
Smart contracts can invoke other smart contracts during the execution of
transactions initiated by external users.

Once deployed, smart contracts running code cannot be modified, so techniques
like runtime verification are very appealing for improving their reliability.
Moreover, the conventional model of computation of smart contracts is
transactional: once operations commit, their effects are permanent and cannot be
undone. Therefore, errors in smart contracts may lead to millionaire losses of
money.

In this paper, we present the concept of future monitors which allows monitors
to remain waiting for future transactions to occur before committing or
aborting. This is inspired by optimistic rollups, which are modern blockchain
implementations that increase efficiency (and reduce cost) by delaying
transaction effects. We exploit this delay to propose a model of computation
that allows bounded future monitors. We show our monitors correct respect with
legacy transactions, how they implement bounded future monitors and how they
guarantee progress. We illustrate the use of bounded future monitors by
implementing correctly multi-transaction flash loans.
