---
title: "Transaction Monitoring of Smart Contracts"
authors: Margarita Capretto, Martín Ceresa and César Sánchez
year: 2022
venue: International Conference on Runtime Verification
date: 2022-07-23
cite: https://link.springer.com/chapter/10.1007/978-3-031-17196-3_9
---
Blockchains are modern distributed systems that provide decentralized financial
capabilities with trustable guarantees. Smart contracts are programs written in
specialized programming languages running on a blockchain and govern how tokens
and cryptocurrency are sent and received. Smart contracts can invoke other
contracts during the execution of transactions initiated by external users.

Once deployed, smart contracts cannot be modified and their pitfalls can cause
malfunctions and losses, for example by attacks from malicious users. Runtime
verification is a very appealing technique to improve the reliability of smart
contracts. One approach consists of specifying undesired executions (never
claims) and detecting violations of the specification on the fly. This can be
done by extending smart contracts with additional instructions corresponding to
monitor specified properties, resulting in an onchain monitoring approach.

In this paper, we study transaction monitoring that consists of detecting
violations of complete transaction executions and not of individual operations
within transactions. Our main contributions are to show that transaction
monitoring is not possible in most blockchains and propose different execution
mechanisms that would enable transaction monitoring.
