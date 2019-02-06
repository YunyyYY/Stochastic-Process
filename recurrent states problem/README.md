# Recurrent States Problem

**Theorem 1**: If *C* is a finite, closed and irreducible set, then all states in *C* are recurrent.

**Theorem 2** If a state *x* is recurrent, and *x* -> *y* in finite steps, then *y* is finite.

If *C* is infinite, is it possible tha all states in *C* are recurrent?

Let *P*(1,2) represents the probability of transferring from state 1 to state 2. If *P* = 1/3, all states are transient. The state may keep wandering right to infinite and never be back.

<img src="https://github.com/YunyyYY/Stochastic-Process/blob/master/recurrent%20states%20problem/1.jpeg" width="400" />

However, if *P* >= 1/2, all  states will be recurrent, the probability of starting from state 1 and return to state 1 is 1. Thus *P*(2,2) = 1, ...

<img src="https://github.com/YunyyYY/Stochastic-Process/blob/master/recurrent%20states%20problem/2.jpeg" width="400"/>

random_walk.m verifies the thesis.
