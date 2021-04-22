# Coalitional Games

Coalitional Games are a set of games where the agents have to collaborate. Players can form coalitions and coordinate strategies in order to maximize the utility of the coalition.

The player set is described as:
$$
N =\{1,\dots,n\}
$$

And a coalition is a subset $A\subseteq N$ where:

- $\empty$ is the **empty coalition**.
- $N$ is the **grand coalition**.
- $\{i\}$ is a **one-player coalition**

The set of all coalitions is the powerset:
$$
\mathcal P(N) = \{A:A\subseteq N\}
$$
Formally, a **coalitional game** is a pair $(N,v)$ where $v$ is a function such that:
$$
\array{v:\mathcal P(N) \rarr \R & \text{such that }v(\empty) = 0 }
$$
The players in coalition $A$ receive the worth $v(A)$ independently of the actions of players in $N\setminus A$. We will identify a coalitional game $(N,v)$ with the function $v$ and simply call $v$ a game.

We say that a game $v$ is super-additive if:
$$
\array{v(A) + v(B) \le v(A\cup B) & A,B \subseteq N : A \cap B = \empty}
$$
The game can be supper-additive and simple if:
$$
v(A) \in \{0,1\}\\
v \text{ is monotone and } v(N) = 1
$$

## Coalitional Structure

A **coalitional structure** is a partition $S$ of $N$:
$$
S = \{A_1,\dots,A_k\}
$$
where:

- $A_1 \cup \dots\cup A_k = N$, $A_i \neq \empty$
- $A_i \cap A_j = \empty, \forall i \neq j$ 

The total utility of the coalitional structure $S$ is:
$$
V(S) = \sum_{i=1}^k  v(A_i)
$$
The coalition formulation problem can be described as:

> Find a collational structure $S^*$ satisfying:
> $$
> V(S^*) = \max\{V(S): S \text{ is a colational strucutre}\}
> $$

The **bell numbers** $B_n$ count the number of coalitional structures you can form, and it grows exponentially. This is an NP-complete problem. Luckily there is a trivial solution for supper-additive games:

> Let $v$ be a super-additive game, for any coalitional structure $S$:
> $$
> V(S) = \sum_{i=1}^k v(A_i) \le v(N) = V(\{N\})
> $$
> This implies that $S^*$ =\{N\}

From now on we will assume that players form a grand coalition $N$. Also the coalition will allocate its worth in the following way. An allocation is a vector $x=(x_1,\dots,x_n) \in \R^n$. If $x$ is allocated to players, coalition $A\subseteq N$ obtains:
$$
x(A) = \sum_{i\in A} x_i
$$
The solution of a game $v$ is some set of allocations $x\in \R^n$.

## The Core

The core is a set of efficient allocations upon which no coalition can improve. It is formally defined as:
$$
C(v) = \{x\in \R^n : x(N) = v(N) \land  \forall A\subseteq N.~ x(A) \ge v(A)\}
$$
The core is a complex polytope in $\R^n$ of dimension $\le n-1$.

We can decide if the core of a game is empty with the following linear program:
$$
\array{
\text{minimize} & x_1+\dots+x_n \\
\text{subject to}&\sum_{i\in A} x_i \ge v(A)&\forall A \subseteq N:A \neq \empty
}
$$
 We can also say that the following are equivalent:

- The optimal value is $v(N)$
- $C(v) \neq \empty$

To find all vertices of the core $C(v)$ is a hard problem, but there are closed-form solutions for some games.

A game $v$ is **super-modular** if:
$$
\array{v(A) + v(B) \le v(A\cup B) + v(A \cap B) & \forall A,B \subseteq N}
$$
 Also, the following propositions are equivalent:

- The game $v$ is super-modular.

- $\forall A,B \subseteq N: A \subseteq B$, and each $i \in N\setminus B$:
  $$
  v(A\cup i) - v(A) \le v(B\cup i)-v(B)
  $$

- The vertices of $C(v)$ are precisely marginal vectors

### Marginal Vector

Given a permutation $\pi$ of $N$, the rank of player $i$ is $\pi(i)$. The coalition preceding player $i$ is then:
$$
A_i^\pi = \{j\in N: \pi(j) < \pi(i)\}
$$
A **marginal vector** is an allocation $x^\pi \in \R^n$ such that:
$$
\array{x_i^\pi = v(A_i^\pi \cup i)- v(A_i^\pi) & i\in N}
$$




