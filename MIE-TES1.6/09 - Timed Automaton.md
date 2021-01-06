# Timed Automaton

A **Timed Automaton** is a 5-tuple
$$
(L,L_0,X ,\mathcal I,T)
$$
where

- $L$ is a finite set of locations
- $L_0$ is the set of initial locations
- $X$ is a finite set of clocks
- $\mathcal I : L \rarr \mathcal C(X)$ is the set of location invariants
- $T \subseteq L \times \mathcal C(X) \times \mathcal P(X) \times L$ is the set of transitions with guards and resets.

Here we are using the word *"Invariant"* in a different way as before. Also, this automaton has no input or output.

A **Clock Constraint** is a conjunction of strict or non-strict inequalities between variables and rational numbers, denoted by $\mathcal C(X)$.

The **state of a timed automaton** is described by a pair
$$
(l,v)
$$
where:

- $l \in L$ is a location
- $v : X \rarr \R^{\ge 0}$ a clock assignment

In every state we must specify the time for all clocks in the automaton. The state may change in 2 ways:

1. Time passes while the agent stays in the same state. Here only the clocks would be altered. This transition is called a **delay transition** and it is formally described as
   $$
   d \in \R^{\ge0}.(l,v)  \overset d {\rarr}(l,v+d) \iff \forall e \in [0,d].v+e \models \mathcal I(l)
   $$
   

   
2. Changing locations also affects the state. If the location changes then the state will change and probably also the clocks. This is an **action transition** and it is defined as:
   $$
   (l,v) \hat \rarr (l',v')\\ \iff\\ \exists (l,\phi,\lambda,l')\in T. v \models \phi \land \forall x\in X. v' = 
   \left\{
   \array{0 & x\in \lambda\\ v(x) & x \not \in \lambda}
   \right.
   $$

The evolution of time for a clock $v$ assignment of $d \in \R^{\ge 0}$ time is described as:
$$
v+d / \forall x \in X. (v+d)(x)  =v(x) + d
$$
The **transition in timed automata** is defined as a combination of delay and action transition:
$$
(l,v) \rarr(l',v')\\ \iff\\
\exists d \in \R^{\ge 0}. (l,v) \overset d \rarr (l,v+d) \land (l,v+d) \hat \rarr(l',v')
$$
**Timed automaton can be non-deterministic** in a few different ways. For example there mora than one transition to different states within the same timeframe or even only one transition, but the restrictions allow us to move on different timeframes. This is caused because the states are defined in part by the clocks. 

The set of initial states is defined as:
$$
\{(l,v)/ l \in L_0, \forall x \in X. v(x) = 0\}
$$

## Specification

We can think of timed automaton as infinite transition systems:
$$
(L \times [X\rarr \R^{\ge 0}], \{(l,v)/ l\in L_0, \forall x \in X.v(x) = 0\}, \rarr )
$$
And because of this, we can use LTL on it.

If we want to test this transition systems we encounter the same problems as before, where we have an infinite number of paths with infinite length and each state has infinite number of successors.

## Symbolic Representation

The only way to represent an infinite transition system is with a symbolic representation. A **symbolic state** is defined as 
$$
(l,\nu)
$$
 where $l$ is a location and $\nu$ is a conjunction of inequalities. This symbolic states represents the set of states:
$$
[\![(l,\nu)]\!] \equiv \{(l,v)/ v \models \nu\} 
$$
In general, symbolic states have only one successor:
$$
(l,\nu) \overset \sim \rarr (l',\nu')
$$
where
$$
[\![ (l',\nu') ]\!]  \equiv (l,\{v+d/v \models \nu\land d\in \R^{\ge 0}\land \forall e \in [0,d].v+e\models \mathcal I(l)\})
$$
If we have more than 1 possible transition (because we can go to different locations) then we must choose one for the symbolic simulation. The **symbolic transition** is a combination of symbolic delay and action transitions. The symbolic delay has only 1 successor and the symbolic action transitions at most the same number of successor as transitions in $T$.

Because of this, the symbolic simulation has finitely many successor states and we can compute them and represent them.

### Unbounded Model Checking

We can do unbounded model checking on symbolic representation of timed automata with the following algorithm:

```pseudocode
V = S0
while exists transition(x,xp): x in V and xp not in V:
	V = V union Post(V)
return V
```

Where $V$ is the set of symbolic states.

Although timed automata have an infinite state space, checking any LTL formula is decidable. 

