# Turing Machines

A Turing Machine $R$ decides language $L$ over alphabet $\Sigma$ if its computation halts for every word and $L(R) = L$. If the Language $L$ is recursive, then there exists a $TM$ that decides it.

Also, a **language $L$ is recursive** if and only if $L$ and $\overline L$ are recursively enumerable. Also, all context-sensitive languages are recursive.

An **Universal Turing Machine** is a TM that accepts all pairs $(\text{codeof}(R);\alpha)$ such that $R$  accepts word $\alpha$

## Deterministic Turing Machines

A **Deterministic Turing Machine** is a 7-tuple:
$$
R = (Q,\Sigma,G,\delta,q_0,B,F)
$$
 Where:

- $Q$ is the finite set of states
- $\Sigma$ is the finite input alphabet
- $G$ is a finite work alphabet $(\Sigma \subseteq G)$
- $\delta$ is a mapping function from $(Q\setminus F) \times G$ into $Q\times G\times \{-1,0,1\}$
- $q_0 \in Q$ is the initial state
- $B \in G \setminus \Sigma$ is a blank symbol 
- $F \subseteq Q$ is the set of final states

The **configuration of a Turing Machine** is defined as
$$
(\alpha,q,\beta) \in G^*,\times Q\times G^*
$$
where

- $q$ is the machine's current state
- head $R$ reads the position $|\alpha|$ on the input tape
- $i$-th letter of the string $\alpha\beta$ is on the input tape when $i \le |\alpha\beta|$ or $\beta$ is on the input tape $i > |\alpha\beta|$

A Turing Machine makes a transition $(\alpha,q,\beta) \vdash (\gamma,r,\pi)$ in one of the following 3 cases:
$$
\array{
1) & \alpha =\gamma a & c\beta = \pi& \delta(q,a) = (r,c,-1)&& a,c \in G\\
2) & \alpha = \alpha'a&\gamma=\alpha'c &\beta = \pi &\delta(q,a) = (r,x,0) &a,c \in G\\
3) & \alpha = \alpha'a& \gamma = \alpha'cd & \beta = d\pi & \delta(q,a)=(r,c,1)&a,c,d\in G
}
$$
<img src="Resources/10 - Turing Machines/image-20201228220332429.png" alt="image-20201228220332429" style="zoom:67%;" />

And the transition function is represented in two different ways. For this example we will be going from the state $S$ with input symbol $a$, writing symbol $c$ and moving the head to the right into state $A$:

- Formal Representation:
  $$
  \delta(A,a) = \{(A,c,1)\}
  $$

- State Diagram:
  $$
  S \overset {a,c,1} \longrightarrow |A|
  $$
  



A Turing Machine $R=(Q,\Sigma,G,\delta,q_0,B,F)$ accepts a word $a\alpha \in \Sigma^+$ if $\exists q \in F$ such that:
$$
(a,q_0,\alpha) \vdash^*(B,q,\epsilon)
$$
In the same way $R$ accepts $\epsilon$ if $\exists q \in F$ such that:
$$
(B,q_0,\epsilon) \vdash^* (B,q,\epsilon)
$$
The language of words accepted by a Turing Machine $R$ is:
$$
L(R)
$$
A language $L$ is reclusively enumerable if it is accepted by some Turing Machine $R$, and every language accepted by $k-$tape Turing Machine is recursively enumerable.

## Nondeterministic Turing Machine

A **nondeterministic Turing Machine** is a seven-tuple
$$
R=(Q,\Sigma,G,\delta,q_0,B,G)
$$
where:

- $Q$ is the finite set of states
- $\Sigma$ is the finite input alphabet
- $G$ is the finite work alphabet $(\Sigma \subset G)$
- $\delta$ is the mapping function from $(Q\setminus F) \times G$ into $\mathcal P(Q \times G\times \{-1,0,1\})$
- $q_0 \in Q$ is the initial state
- $B \in G \setminus \Sigma$ is the blank symbol
- $F\subseteq Q$ is a set of final states

A NTM accepts a word $a\alpha$ if there exists $q\in F$ so that:
$$
(a,q_0,\alpha)\vdash^*(B,q,\epsilon)
$$
Also, it accepts an empty string if there exists $q\in F$ so that:
$$
(B,q_0,\epsilon)\vdash^*(B,q,\epsilon)
$$
We can also convert nondeterministic Turing Machines into deterministic Turing machines so that they generate the same language. This means that NTM accept exactly reclusively enumerable languages.

## Linear Bounded Automaton

A Linear Bounded Automaton or **Linear Bounded Turing Machine** is TM whose length of the tape is restricted to a $k$-multiple of length of the impute word, for some fixed $k$.

For any non-contracting grammar $G$ there exists a LBA $R$ such that $L(G) = L(R)$. We can also say that Context-Sensitive languages are accepted exactly by LBAs

## Undecidable Problems

Given a TM $T$ and an input $w$, does $T$ halt on $w$? This is called the **Halting Problem for Turing Machines** and it is not recursive.

### P and NP problems

We have to classes of problems defined by the time it takes for them to be solves:

- **Class P problems** are the ones that can be solved in polynomial time using a deterministic TM.
- **Class NP problems** can only be solved by non-deterministic TM in polynomial time.

We can convert some languages into polynomial-time languages using **polynomial-time reduction**. We say that language $A \subseteq\{0,1\}^*$ is polynomial-time reducible to a language $B\subseteq \{0,1\}^*$ denoted by $A\le_p B$ if there is a polynomial-time computable function $f:\{0,1\}^* \rarr \{0,1\}^*$ such that:
$$
\forall x \in \{0,1\}^*/ x\in A \iff f(x) \in B
$$
 We also have another class of problems called **NP-hard**. These problems are such that any problem in NP can be reduced to them (they are at least as hard as the hardest problems in NP). Formally, we can define them as:
$$
B \in \text{NP-hard} \iff A \le _p B, ~~\forall A \in \text{NP}
$$
We can also talk about **NP-compete** problems. This category contains all the *"hardest"* problems inside the NP class. They can be defined as:
$$
B \in \text{NP-complete} \iff B \in \text{NP-hard} \land B \in \text{NP}
$$
