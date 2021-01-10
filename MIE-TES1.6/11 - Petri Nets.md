#  Petri Nets

A **Petri Net** is a 5-tuple
$$
(P,T,F,w,M_0)
$$
where:

- $P$ is a finite set of places
- $T$ is a finite set of transitions
- $F \subseteq (P\times T) \cup (T \times P)$ is a set of elements called arcs
- $w: F \rarr \N$ is a weight function
- $M_0:P\rarr \N_0$ is the initial marking.

A marking (state) if a Petri Net is defined as a function $s:P\rarr \N_0$ and it returns the number of tokens a state contains. The state evolves according to the following rules:

- A **transition $t$ is enabled** is each input place $p$ if $t$ is marked with at least $w(p,t)$ tokens
- A **transition $t$ can fire** if it is enabled. Firing a transition removes $w(p,t)$ tokens from each input and adds $w(t,p)$ tokens to the output place of $t$.
- Ordering of firings is non-deterministic. If more than one transition is enabled, arbitrarily one is fired.

The firing of a petri net transition is considered a transition of the system.

### Reachability

Given a Petri net $(P,T,F,w,M_0)$, we say that a marking $M'$ is **reachable from** a marking $M$ if there exists a sequence of firings from $M$ to $M'$. In a similar way, a marking $M$ is **reachable** if it is reachable from $M_0$. 

A **partial marking**  is a partial function from $P \rarr \N_0$ and it is reachable it there exists a reachable marking $M'$ that coincides with $M$ on its defined elements.

### Boundedness

A Petri net is **$k$-bounded** if the number on tokens in each place does not exceed $k$ for any reachable marking. Also, a Petri net is **bounded** if there exists a $k$ such that the net is $k$-bounded.

### Liveliness

A **transition is live** if from every reachable marking we can reach a firing of this transition. **The Petri net is live** if every transition is live.

### T-Invariants

Starting with any arbitrary initial marking, a **T-invariant** is a function $f:T \rarr \N_0$ such that for every sequence of firings from a marking $M$ to $M'$ that fires every transition $t\in T$ exactly $f(t)$ times, $M = M'$.

Any linear combination of two T-invariants is again a T-invariant.

To calculate a T-invariant we need to calculate how many transitions we get from a state $s$ to the same state. This can be solved with a system of linear equations and the same number of transitions:
$$
\Delta_1 x_1 + \dots+\Delta_{\#T}x_{\#T} = 0
$$
Each solution $(x_1,\dots,x_{\#T})$ represents one invariant. 

### P-Invariants

P-invariant is a function $f:(P\rarr \N_0) \rarr \Z$ such that for every marking $M, M'$, where $M'$ is the result of a firing from $M$, $f(M) = f(M')$. It is related to the number of tokens under arbitrary firings.

P-invariants are also computed with a system of linear equations:
$$
y\Delta_1 = 0\\
\vdots\\
y\Delta_{\#T} = 0\\
$$


## Transformations

Certain simplifications preserve certain properties of Petri Nets. We can also convert Petri Nets into transition systems. The states are represented by the markings as vectors $\N_0^{\#\text{locations}}$. This vector will represent the tokens in each location. 

Transitions are similar in both models. Here transitions are conformed by two parts. First the $\Delta^-$ expresses to which location we must remove tokens and $\Delta^+$ to which locations we need to add tokens. The transition ends up looking like 
$$
\Delta = \Delta^- + \Delta^+ \in \Z^{\#\text{Locations}}
$$
We can also convert petri nets to Infinite transition systems. Given a petri net 
$$
(\{P_1,\dots,P_n\},\{T_1,\dots,T_m\},F,w,M_0)
$$
The set of states is $\N_0^n$ and the initial state is $\{(M_0(P_1),\dots,M_0(P_n))\}$. The transition relation is defined as:

- $\Delta_j^- = (\delta_1,\dots,\delta_n)$ where
  $$
  \delta_i = \left\{
  \array{
  w(P_i,T_j) & (P_i,T_j) \in F \\
  0& (P_i,T_j) \not \in F
  }
  \right.
  $$

- $\Delta_j^+ = (\delta_1,\dots,\delta_n)$ where
  $$
  \delta_i = \left\{
  \array{
  w(T_j,P_i) & (T_j,P_i) \in F \\
  0& (P_i,T_j) \not \in F
  }
  \right.
  $$

Then, the transition is defined as:
$$
\Delta_j = \Delta_j^- + \Delta_j^+
$$
And the transition relation as:
$$
\{(s,s+\Delta) \in S \times S : s\ge \Delta_j^-, j \in \{1,\dots,m\}\}
$$
This method also works for unbounded Petri Nets.

We can also convert a transition system into a Petri net. For a given transition system $(S,\{S_0\},R)$ we can create the following petri net:
$$
(P=S,T=\{t_r:r\in R\},F,w,M_0)
$$
Where

- $F = \{(s,t_{(s,s')}:(s,s')\in R\} \cup \{(t_{(s,s')},s'):(s,s')\in R\}$
- Weight function $w:w(x,y) = 1$
- $M_0: M_0(s_0) = 1 \land M_0(p) = 0$ if $p \neq s_0$

