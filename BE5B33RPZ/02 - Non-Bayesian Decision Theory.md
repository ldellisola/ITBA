# Non-Bayesian Methods

## Limitations of Bayesian Decision Theory

The limitations on Bayesian decision theory comes from its own components, the necessity to know all the probabilities and the loss function.

With Bayesian methods, the loss function $W$ must make sense, but there are a lot of cases where it doesn't make sense to have one.

Another problem is that the prior probabilities must exist and be known. But given that some events are not random, it doesn't make sense to talk about prior probabilities.

Lastly, the conditionals may be subject to non-random interventions.

## Neyman Pearson Task

The Neyman Pearson Task looks for the optimal strategy $q^*$ for which the error of classification of a dangerous state is lower than a predefined threshold ($0 < \epsilon_D <1$), while keeping the classification error for the normal state ($\epsilon_N$) as low as possible.

This task is usually used with only 2 states (normal and dangerous) but it can be generalized to 3 hidden states where 2 of them are dangerous. For this we have 2 inequality constraints and we have to minimize the classification error for the normal state.

The strength of this approach is that the likelihood ratio or even $p(x/N)$ don't need to be known. It is enough to know the $p(x/D)$ and the rank order of the likelihood ratio.

### Formulation of the Neyman Pearson Task

The Neyman Pearson task has the following components:

-  $K = \{D,N\}$: It must have a **dangerous** and **normal** state.
- $X$ is the set of observations.
- The conditional probabilities $p(x/D),p(x/N)$ are known.
- The prior probabilities $p(D), p(N)$ are unknown or don't exist.
- $q:X\rightarrow K$ is a strategy

This is formulated as an optimization task with an inequality constraint. We need to find the best $q^*$:
$$
q^* = \underset {q:X\rightarrow K} {\text{argmin}}\ \sum_{x:q(x)\neq N} p(x/N)
$$
while the error for the dangerous state is less than out threshold:
$$
\sum_{x:q(x)\neq D} p(x/D) \le  \overline \epsilon_D
$$
A strategy is characterized by the classification error:
$$
\array{
	\epsilon_N = \sum_{x:q(x)\neq N}p(x/N) && (false alarm) \\
	\epsilon_D = \sum_{x:q(x)\neq D}p(x/D) && (overlooked danger) \\
}
$$
The optimal strategy $q^*$ for a given $x\in X$ is constructed using the likelihood ratio:
$$
\frac {p(x/N)}{p(x/D)}
$$
We have to estimate a constant $\mu \ge 0$, and with it we can construct our strategy $q$:
$$
q:X\rightarrow K/q(x)=
\left \{
	\array{
		N	&&	\frac {p(x/N)}{p(x/D)} > \mu \\
		D	&&	\frac {p(x/N)}{p(x/D)} \le \mu \\
	}
\right.
$$
The optimal strategy $q^*$ is obtained by selecting the minimal $\mu$ for which there still holds that:
$$
\overline \epsilon_D \ge \epsilon_D
$$
Using the likelihood ratio, we can **rank** our results, and order them. The lowest likelihood ratio will be named as $r_1$, and subsequently all other results will follow it until the highest value.

The optimal way to pick $\mu$ is choosing the right $\mu_i$:
$$
\mu_0 = 0\\
\mu_i = \frac {r_i+r_{i+1}}{2}
$$

Such that:
$$
\mu_i < \mu < \mu_{i+1}
$$

### Randomized Strategies

It is common to use randomized strategies to obtain a better decision model. We do this so that $\epsilon_D$ is as close as possible to $\overline \epsilon_D$ as possible, and when we are dealing with discrete probabilities, it is often necessary.

The idea is to construct our ideal strategy and identify the rank $r_i$ where if we add $\mu_i$, $\epsilon_D > \overline \epsilon_D$. Now, when we evaluate this rank with our strategy, there should be some probability that it will return our normal state or dangerous state. This probability should be calculated so that $\epsilon_D = \overline \epsilon_D$. For example:
$$
q(x_1) = D\\
q(x_2) = 
\left\{
\array{
	D && 1/3 \text{ of the time}\\
	N && 2/3 \text{ of the time}
}\\
q(x_3) =N
\right.
$$
This problem is caused by the discrete nature of $X$, and it does not affect us when $X$ is continuous.

## Minimax Task

### Formulation of the Minimax Task

The Minimax task has the following components:

- $K=\{1,2,\dots,N\}$ is the set of possible classes.
- $X$ is the set of observations.
- The conditional probabilities  $p(x/k)$ are known for all classes.
- The prior probabilities $p(k)$ are unknown or don't exist
- $q:X\rightarrow K$

The minimax task looks for the optimum strategy $q^*$ which minimizes the classification error of the worst classified class:
$$
q^* = \underset {q:X\rightarrow K}{\text{argmin }} \underset{k \in K}{\text{max }} \epsilon(k)
$$
where the error function is calculated as:
$$
\epsilon(k) = \sum_{x:q(x) \neq k} p(x/k)
$$
If we only have 2 classes, the strategy is calculated using the **likelihood ratio**.

### Comparison with Bayesian Decision with unknown priors

Considering the same setting as in the minimax task, but let the priors $p(k)$ exists but be unknown. The **Bayesian error** for the strategy $q$ is:
$$
\epsilon = \sum_k p(k) \sum_{x:q(x) \neq k} p(x/k) = \sum_k {p(k)}\  \epsilon(k)
$$
We want to minimize $\epsilon$, but we don't know $p(k)$. Looking at the equation we can tell that the maximum Bayesian error is obtained when $p(k) = 1$ for the class $k$ with the highest class error $\epsilon(k)$.

Thus, to minimize the Bayesian error $\epsilon$ under this setting, we need to minimize the error of the hardest-to-classify class. This is why the Minimax formulation and the Bayesian formulation with unknown priors lead to the same solution.

## Wald Task

Let's consider a classification with 2 states: $K=\{1,2\}$. We want to set a threshold $\epsilon$ on the classification error of both classes:
$$
\array{\epsilon_1 \le \epsilon && \epsilon_2 \le \epsilon}
$$
If $\epsilon$ is too low, there may not be a possible solution. For this reason, we introduce the decision *don't know*, thus $D= K \cup \{?\}$.

A strategy  $q:X\rightarrow D$ is characterized by:
$$
\array{
	\epsilon_1 = \sum_{x:q(x) = 2} p(x/1) && (\text{classification error for 1})\\
	\epsilon_2 = \sum_{x:q(x) = 1} p(x/2) && (\text{classification error for 2})\\
	k_1 = \sum_{x:q(x) = ?} p(x/1) && (\text{undecided rate for 1})\\
	k_1 = \sum_{x:q(x) = ?} p(x/2) && (\text{undecided rate for 2})\\
}
$$
From this, we can say that the optimal strategy $q^*$ is:
$$
q^*=\underset {q:X\rightarrow D} {\text{argmin }} \underset {i=\{1,2\}}{\text{max}} k_i
$$
while considering our restrictions:
$$
\array{\epsilon_1 \le \epsilon && \epsilon_2 \le \epsilon}
$$
The optimal solution is again based on the likelihood ratio:
$$
r(x) = \frac {p(x/1)}{p(x/2)}
$$
And the optimal strategy is constructed by choosing two thresholds $\mu_1,\mu_2$ such that:
$$
q(x) = 
\left \{
	\array{
		2 && r(x) < \mu_1 \\
		1 && r(x) > \mu_2 \\
		? && else
	}
\right.
$$






