# Properties of Regular Languages

## Pumping Lemma

Let $L$ be a regular language, then for language $L$ there exists a constant $p\ge 1$ such that for every sentence $w \in L$ it holds that, if $|w| \ge p$, then $w$ has the form $w=xyz$ such that:

- $y \not = \epsilon$
- $|xy| \le p$
- $\forall k \ge 0 / xy^kz \in L$

We will use this lemma to **prove that languages are not regular**. To do this we are going to use the counter-reciprocal method:

1. We assume that the language $L$ is regular, and because of this it must hold the pumping property and the counter-reciprocal:
   $$
   \forall p \ge 1. \exists w \in L/ |w| \ge p \land\\ 
   \forall x,y,x\in \Sigma^*.[(w = xyz \land |xy| \le p \land |y| \ge 1) \Rarr
   \exists k \ge 0. xy^kz \not\in L]
   $$

2. We have to look for a convenient word $w$ such that $|w| \ge p$

3. We need to split $w$ into $xyz$ and all its possible partitions. If the recursive part of the word has a sequence before it, then there are $2^n$ partitions, where $n$ is the size of the prefix.

4. We need to find $k$ such that $w_k = xy^kz \not\in L$

5. $L$ is regular but the pumping property is not met, this is absurd and it means that our assumption is wrong, meaning the language $L$ is not regular.

We can also look for the smallest value of $p$ valid. This depends on the language:

- If it is a finite language, then the smallest value of $p$ is the same as the length of the longest word $+1$.
- If the language is infinite, then $p$ is the value for which all $w_k$ is valid. Also we can construct the minimal finite automaton and then the number of states is equal to $p$. 

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

### Proving that a language is not regular

Often the key for proving that a language is not regular with the Myhill-Nerode Theorem is to prove that the second property isn't valid for a given language. We can follow this steps:

1. I will assume that the language $L$ is regular, meaning that the Myhill-Nerode theorem applies.

2. I will enumerate $k+1$ convenient words:
   $$
   W = \{w_1,\dots,w_{k+1}\}
   $$

3. Because there are only $k$ equivalence classes and I'm choosing $k+1$ words, some words must be in the same equivalence class:
   $$
   \exists i,j \in \{1,k+1\}. w_i \sim w_j  \Rarr w_iv \sim w_jv ~~\forall v
   $$

4. Now I have to find a word $v$ such that:
   $$
   w_iv \in L \land w_jv \not\in L
   $$

5. From one side, the Language is regular and because of that the MN theorem applies. On the other side,  the second proposition of the theorem is not valid for the language $L$. This is an absurd conclusion and it means that our initial assumption is incorrect. So $L$ is not regular.

