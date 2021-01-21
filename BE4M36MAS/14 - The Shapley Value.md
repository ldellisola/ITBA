# The Shapley Value

The Shapley value quantifies the effect of individual components on the performance of the entire system.

Let $\Gamma$ be the set of all games over $N$, the **value** is a mapping:
$$
\array{\gamma:\Gamma\rarr \R^n & \gamma = (\gamma_1,\dots,\gamma_n)}
$$
A value $\gamma$:

- is **Efficient** if $\sum_{i\le n} \gamma_i = v(N)$ for each $v\in \Gamma$

- is **Additive** if $\gamma(u+v) = \gamma(u) + \gamma(v)$  for all $u,v \in \Gamma$

- is **Symmetric** if the following implication holds for each game $v$, players $i,j \in N$ and each coalition $A \subseteq N\setminus \{i,j\}$:
  $$
  v(A \cup i ) = v(A \cup j) \implies \gamma_i(v) = \gamma_j(v)
  $$
  Informally we can think that this means players get the same reward for the same contribution.

- satisfies the **Null Player Property**, if the following implication holds for each game $v$, each player $i \in N$ and all $A \subseteq N \setminus \{i\}$:
  $$
  v(A\cup i) = v(A) \implies \gamma_i(v) =0
  $$
  Informally we can express it as *"The player who doesn't work, doesn't get a reward"*.

> There is an unique value:
> $$
> \gamma^S: \Gamma \rarr \R^n
> $$
> Which is efficient, additive, symmetric and satisfies the null player property. The **Shapley value** of a player $i\in N$ is:
> $$
> \gamma_i^S(v) = \sum_{A\subseteq N\setminus\{i\}} \frac{|A|! \times (n-|A|-1)!}{n!} \times (v(A\cup i) - v(A))
> $$

We can also calculate this value using a marginal vector:
$$
\gamma_i^S(v) = \sum_{\pi \in \Pi} \frac 1 {n!} (v(A_i^\pi \cup i) - v(A_i^\pi))
$$
Here players arrive in a random order given by permutation $\pi$, and each permutation $\pi$ of players has a $\frac 1 {n!}$ changes of happening.

### Estimation

We can estimate the Shapley value with the following algorithm:

The input is a game $v$ over $n$ players and a selected player $i$

1. Pick the size of the random sample $m <\!<n!$

2. Sample with replacement permutations $(\pi_1,\dots,\pi_m)$ with uniform probability $\frac 1{n!}$

3. Estimate the Shapley value of player $i$:
   $$
   \sum_{k=1}^m \frac 1 m x_i^{\pi_k} = \sum_{k=1}^m \frac 1 m \times(v(A_i^\pi \cup i) - v(A_i^\pi))
   $$

The algorithm is polynomial provided that $v(A)$ can be calculated in polynomial time.

## Shapley-Shubik Index

The Shapley-Shubik index helps determine the voting power of players in simple games. This index is defined as:
$$
\gamma_i^S(v) = \sum_{\array{A \subseteq N\setminus\{i\}\\ i \text{ pivotal to }A}} \frac 1 {n \left(\array{n-1\\|A|}\right)}
$$
For a player $i$ in a simple game $v$.

A player $i$ is pivotal to a coalition $A \subseteq N\setminus\{i\}$ if:
$$
\array{v(A\cup i) = 1 & \and & v(A)=0}
$$
The probability that player $i$  casts the decisive vote in an order given by a randomly chosen permutation $\pi \in \Pi$ is:
$$
\gamma_i^S(v) = \frac 1 {n!} \times |\{\pi \in \Pi:i \text{ is pivotal to }A_i^\pi\}|
$$

## Banzhaf Index

A **swing** for player $i$ is a coalition in which $i$ is pivotal and it is defined as:
$$
s_i(v) = |\{A \subseteq N \setminus \{i\}: v(A\cup i) - v(a) = 1\}|
$$
The **Banzhaf index** of player $i$ in a simple game $v$ is :
$$
\gamma_i^B(v) - \frac{1}{2^{n-1}} \times s_i(v)
$$
We also have the **normalized Banzhaf Index** for player $i$ in a simple game $v$:
$$
\beta_i(b) = \frac{s_i(v)}{s_1(v) + \dots + s_n(v)}
$$
