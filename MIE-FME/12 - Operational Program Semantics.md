# Operational Program Semantics

We assume that a program has:

- $L$ lines
- variables from a set $V$ such that very variable $v$ has type $T_v$

The **program state** is a function that assigns:

- To the special variable $pc$ an element from ${1,\dots, L}$
- To each variable $v\in V$ an element from the set $T_v$

For example:
$$
\{pc \mapsto 2, i \mapsto 1, a \mapsto[1,5,2,4]\}
$$
The set of all states is called $S$.

With each step of the program, we take a certain state $s \in S$ and then compute another state $s'\in S$. This is denoted as:
$$
s \rarr_Ps'
$$
This relation $\rarr_P \subseteq S\times S$ is called the **transition relation** of the program $P$. A program may be influenced from the environment, such as reading data from a disk or it may influence itself the environment, like writing content to the console, hence it is possible that there are more than 1 possible next state and it is also possible to have more than one possible final output for one input. 

## The Transition Relation

First, we need to define some functions and operators:

The function $\pi:S\rarr S'$ where $S'$ is as $S$, but assigns values to primed variables:
$$
\forall r\in S,v\in \{pc\}\cup V. \pi(r)(v') :=r(v)
$$
For functions $r,r'$ with disjoint domains $R, R'$, $r \sqcup r'$ is a function with domain $R \cup R'$ for all $v \in R \cup R'$:
$$
(r\sqcup r')(v) = \left\{\array{r(v) & v\in R\\ r'(v) &v\in R'}\right.
$$

- **Assignment**: if $s(pc)$ points to a line with an assignment `v <- t`:
  $$
  s\rarr_P s' \iff s\sqcup\pi(s') \models pc' =pc+1 \land v'=t \land \bigwedge_{u\in V, u\neq v} u'=u
  $$

- **Goto**: If $s(pc)$ points to a line with the command `goto r`:
  $$
  s \rarr_P s' \iff s\sqcup\pi(s') \models pc' = r \land \bigwedge_{u\in V} u' = u
  $$

- **If then**: If $s(pc)$ points to a line with the command `if P then`:
  $$
  s \rarr_P s' \iff s\sqcup\pi(s') \models [P \implies pc' = pc+1]\land[\neg P \implies pc' = l]\land \bigwedge_{u\in V} u' = u
  $$

- **Assertions**: Even though we have two different types of assertions, they behave the same way. If $s(pc)$ points to a line $\bold{\text{assume }} \phi$ or $@\ \phi$:
  $$
  s\rarr_Ps' \iff s \sqcup\pi(s') \models pc' = pc + 1 \land \phi \land \bigwedge_{u\in V} u' = u
  $$

- **Side effects**: If there is input from the user or any other kind of influence that does not depend on the state of the program, we have to ignore it. So if $s(pc)$ points to a line of the form `input v`:
  $$
  s \rarr_P s' \iff s \sqcup\pi(s') \models pc' = pc + 1 \land \bigwedge_{u\in V, u \neq v} u' = u
  $$
  This commands are non-deterministic, so we cannot know the value of the variable.

- **Stop**: The program will terminate if:
  $$
  s \rarr_P s' \iff \bot
  $$

## Program Execution

A program can do an arbitrary number of steps according to $\rarr_P$:
$$
r \rarr_P^* r' \iff \exists s_1,\dots,s_n/r = s_1 \rarr_p \dots\rarr_p s_n = r'
$$
If we want to exclude the $0$ step possibility, we can use the $\rarr_P^+$ transitive relation.

## Operational Program Semantics

The semantics of a program $P$ are defined as the relation $[[P]] \subset S \times S/[[P]](s,s')$ if:

- $s\rarr_P^* s'$
- $\not \exists s''/s'\rarr_p s''$

Wh$s$ represents the initial state while $s'$ is the final state.

