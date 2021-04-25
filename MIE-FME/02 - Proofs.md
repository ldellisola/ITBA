# Proofs

We cannot check the correctness of a program just with the source code, because that would require testing all possible inputs and outputs, and we would also encounter different problems with different programming languages.

To mitigate this we can reduce our problem to logic. Now the verification condition is much easier but we still have infinite possible inputs. We finally solve this by either providing a formal proof that the logic formula holds or a counter example.

## The Method

To generate a proof, we can follow a simple method. We have to keep a *list* of things that we already know, and we can add new assumptions and simplify the formula we have to prove, until we get a formula that we know.

In order to create proofs, we have two ways to add elements to our assumptions:

- Add assumptions from the element we have to prove:
  $$
  \array{
  A \land B: && \text{Separately prove $A$ and $B$}\\
  A \lor B:  && \text{Assume $\neg A$ and prove $B$ (or vice versa)}\\
  A \implies B: && \text{Assume $A$ and prove $B$}\\
  \neg A : && \text{Assumbe $A$ and try to find a contradiction}\\
  \exists x.A: && \text{Choose a term $t$ and prove $A[x \larr t]$}\\
  \forall x. A: && \text{Choose a new constant $a$ and prove $A[x\larr a]$}
  }
  $$
  When choosing a new constant, we have to write the following:
  $$
  \text{let $a$ be arbitrary but fixed}
  $$
  

- Generate new knowledge from your existing assumptions:
  $$
  \array{
  A \land B: && \text{Conclude both $A$ and $B$}\\
  A \lor B : && \text{Separate in 2 cases, one assuming $A$ and other $B$}\\
  A\implies B: && \text{If we know $A$ then we conclude $B$}\\
  \exists x. A: && \text{Choose a new constant $a$ and add $A[x\larr a]$}\\
  \forall x. A: && \text{Choose a term $t$ and add $A[x\larr t]$}
  }
  $$
  When choosing a new constant we have to write the following:
  $$
  \text{let $a$ be such that $A[x\larr a]$ holds}
  $$

## Proof Rules for Equalities

For every term $t$ we can assume $t=t$. If we know that $t_1 = t_2$ then we can always replace $t_1$by $t_2$ and vice versa. The only case where we cannot do this is when we are dealing with bounded variables. For example this is not allowed:
$$
\exists x.P(x,y) \text{ and } y = f(x)\text{ then } \exists x. P(x,f(x))
$$

## Proof Rules for Equivalences

It is always allows to replace equivalences in our formulas. The only equivalence that does not need proving is:
$$
A \equiv \neg\neg A
$$
For the rest we have to prove them. Especially when proving $A$, we can:

1. Replace it by $\neg\neg A$
2. Apply the rue for proving negations
3. Add $\neg A$ as additional knowledge

## Lemmas

Lemmas are used to prove some additional knowledge that cannot be obtained by just one proof rule. Once we prove the lemma we can add it to our knowledge.





  