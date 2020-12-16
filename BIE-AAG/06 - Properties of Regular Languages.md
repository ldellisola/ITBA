# Properties of Regular Languages

## Pumping Lemma

Let $L$ be a regular language, then for language $L$ there exists a constant $p\ge 1$ such that for every sentence $w \in L$ it holds that, if $|w| \ge p$, then $w$ has the form $w=xyz$ such that:

- $y \not = \epsilon$
- $|xy| \le p$
- $\forall k \ge 0 / xy^kz \in L$

We will use this lemma to **prove that languages are not regular**. To do this we are going to prove them using by the absurd. We are going to assume that a language is regular an apply the lemma, we should find a word $w$ such that all the conditions for the pumping lemma don't hold for all possible partitions of $w$ into $xyz$.

## Myhill-Nerode Theorem

This theorem characterizes the fundamental relationships between finite automata over alphabet $\Sigma$ and certain equivalence relations over strings in $\Sigma^*$. It describes some of the necessary and sufficient conditions for a language to be regular and it provides a formal basis for an elegant proof of existence of a unique minimal DFA for a given regular language.

We will go over some necessary definitions for this topic:

- **Equivalence (~)** is a binary relation that is reflexive, symmetric and transitive.

- **Equivalence Class** of an element $a$ (denoted as $[a]$) in the set $X$ is the subset of all the elements in $X$ that are equivalent to $a$.

- **Quotient Set** is the set of all equivalence classes in $X$. It is denoted as $X\setminus \sim$ 

- **Index of Equivalence** is the number of equivalence classes in the quotient set $\Sigma\setminus\sim$. If there are infinitely many equivalence classes, the index is defined to be $\infty$.

- **Right Congruence**: Let $\Sigma$ be an alphabet ant $\sim$ an equivalence on $\Sigma^*$. The equivalence $\sim$ is a right congruence if:
  $$
  u \sim v \Rightarrow uw \sim vw,~~ \forall u,v,w \in \Sigma^*
  $$

- **Prefix Equivalence**: Let $L$ be an arbitrary language over alphabet $\Sigma$, We define prefix equivalence for $L$, a relation $\sim_L$ on the set $\Sigma^*$ as:
  $$
  u \sim_L v \iff \forall w \in \Sigma^*/ uw \in L \iff vw \in L
  $$
  For each language $L$ its prefix equivalence is its right congruence. 

The **Myhill-Nerode** Theorem says as follows:

> Let $L$ be a language over $\Sigma$, the following statements are equivalent:
>
> 1. $L$ is a language accepted by a finite automaton
>
> 2. $L$ is a union of certain equivalence classes of the quotient set of $\Sigma^*$ by the right congruence on $\Sigma^*$ with a finite index.
>
> 3. The relation $\sim_L$ has a finite index.

To prove this theorem we have to do it in the following way:
$$
1 \Rightarrow 2\\
2 \Rightarrow 3 \\
3 \Rightarrow 1
$$
To use this theorem to prove the irregularity of a language, we need to fin an example where the language fails to hold any of those 3 statements. If we can find it, we can say that the language is not regular.

There is a second version of this theorem:

> The number of states of any minimal DFA accepting $L$ is equal to the index of $\sim_L$.