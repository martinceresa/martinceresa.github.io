---
title: "Setchain: Improving Blockchain Scalability with Byzantine Distributed Sets and Barriers"
authors: Margarita Capretto, Martín Ceresa, Antonio Fernández Anta, Antonio Russo and César Sánchez
year: 2022
venue: IEEE International Conference on Blockchain
date: 2022-09-22
cite: https://doi.org/10.1109/Blockchain55522.2022.00022
---

Blockchain technologies are facing a scalability challenge, which must be
overcome to guarantee a wider adoption of the technology. This scalability issue
is due to the use of consensus algorithms to guarantee the total order of the
chain of blocks (and of the transactions within each block). However, total
order is often overkilling, since important advanced applications of
smart-contracts do not require a total order among all operations. A much higher
scalability can potentially be achieved if a more relaxed order (instead of a
total order) can be exploited. In this paper, we propose a distributed
concurrent data type, called Setchain, which improves scalability significantly.
A Setchain implements a grow-only set object whose elements are not ordered,
unlike conventional blockchain operations. When convenient, the Setchain allows
forcing a synchronization barrier that assigns permanently an epoch number to a
subset of the latest elements added. Therefore, two operations in the same epoch
are not ordered, while two operations in different epochs are ordered by their
respective epoch number. We present different Byzantine-tolerant implementations
of Setchain, prove their correctness and report on an empirical evaluation of a
prototype implementation. Our results show that Setchain is orders of magnitude
faster than consensus-based ledgers, since it implements grow-only sets with
epoch synchronization instead of total order. Moreover, since the Setchain
barriers can be synchronized with the underlying blockchain, Setchain objects
can be used as a sidechain to implement many smart contract solutions with much
faster operations than on basic blockchains.
