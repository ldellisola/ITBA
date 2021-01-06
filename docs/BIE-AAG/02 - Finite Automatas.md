# Finite Automata

### Configuration of a Finite Automaton

Let $M=(Q,\Sigma, \delta,q_0,F)$ be a finite automaton, we'll define:

- **Configuration of finite automaton $M$** is the pair $(q,w) \in Q \times \Sigma^*$.
- **Initial configuration of finite automaton $M$** is the initial input of an automaton, $(q_0,w)$.
- **accepting configuration of finite automaton $M$** is the pair after the automaton completely processed the initial configuration. It is expressed as $(q,\epsilon) / q \in F$

### Accessible State

We say that a state $q \in Q$ is accessible if  there exists a string $w\in \Sigma^*$ such that there exists a sequence of moves that leads from the initial state $q_0$ into state $q$:
$$
(q_0,w) \vdash_M^* (q,\epsilon)
$$
 Basically, it is accessible if  there is a transition from any other state to this one.

We can identify and remove all the unreachable states with the following algorithm (<u>only for NFA</u>):

<img src="Resources/02 - Finite Automatas/image-20201030170334563.png" alt="image-20201030170334563" style="zoom:50%;" />

### Useful States

We say that a state $q\in Q$ is useful if there exists a string $w\in \Sigma^*$ such that there is a sequence of moves that lead from state $q$ to a final state:
$$
\exists p \in F/ (q,w\vdash_M^*(p,\epsilon))
$$
If there is a state that is not connected to any other state (it's a sink) we call it **redundant state**.

We also have an algorithm to identify and remove these states:

<img src="Resources/02 - Finite Automatas/image-20201030171319106.png" alt="image-20201030171319106" style="zoom:50%;" />

## Deterministic Finite Automata

A deterministic finite automaton is a quintuple $M = (Q,\Sigma, \delta,q_0, F)$ where:

- $Q$ is a finite set of **states**.
- $\Sigma$ is a finite set of symbols, an **alphabet**.
- $\delta$ is a **transition function** from a state and a symbol to a new state.
- $q_0$ is the **initial state**.
- $F$ is the set of **final states**.

### Move of Deterministic Finite Automata

Let $M = (Q,\Sigma, \delta,q_0, F)$  be an DFA. Let $\vdash_M$ be a relation over $Q\times \Sigma^*$ such that: 
$$
(q,w) \vdash_M (p,w')
$$
if $w = aw'$ and $\delta (q,a) = p$ for some $a\in\Sigma, w\in\Sigma^*$. An element of this relation $\vdash_M$ is called a **move** in automaton $M$.

What this operator does is specify that in the automaton $M$, it will accept the string $w$ at the node $q$ and then it will return a string $w'$ when arriving at the node $p$. 

We can expand this operator to the $n^{th}$ power. For example $(t,hola)\vdash_M^3 (r,a)$ means that we can get from state $t$ with the string $hola$ to the state $r$ with the string $a$ in only 3 steps.

The same applies with $\vdash_M^+$ and $\vdash_M^*$, where the first one demands that at at least one transition is required, while the latter one says that zero or more transitions are required.

### Language Accepted by a Deterministic Finite Automata

We say that a string $w \in \Sigma^*$ is accepted by a DFA $M = (Q,\Sigma, \delta,q_0, F)$  if:
$$
\exists(q_0,w) \vdash^*_M(q,\epsilon), q\in F
$$
From this we can say that the language accepted by the automaton $M$ is defined as:
$$
L(M) = \{ w\in \Sigma^*/ M \text{ accepts } w\}
$$

### Total Deterministic Finite Automata

Let  $M = (Q,\Sigma, \delta,q_0, F)$ be a DFA. We say that this is automata is total if the mapping $\delta$ is defined for all pairs of states$q\in Q$ an symbol $a\in\Sigma$.

In order to transform a DFA into a total DFA we have to add one more "empty" state and redirect all the transitions that are not defined to that state. To do this, we have the following algorithm:

<img src="Resources/02 - Finite Automatas/image-20201030165309241.png" alt="image-20201030165309241" style="zoom:50%;" />

  ## Non-Deterministic Finite Automaton

A non-deterministic finite automaton is a quintuple $M = (Q,\Sigma, \delta,q_0, F)$ where:

- $Q$ is a finite set of **states**.
- $\Sigma$ is a finite set of symbols, an **alphabet**.
- $\delta$ is a **transition function** from a state and a symbol to a set of states.
- $q_0$ is the **initial state**.
- $F$ is the set of **final states**.

### Move of Non-Deterministic Finite Automata

Let $M = (Q,\Sigma, \delta,q_0, F)$  be an DFA. Let $\vdash_M$ be a relation over $Q\times \Sigma^*$ such that: 
$$
(q,w) \vdash_M (p,w')
$$
if $w = aw'$ and $\delta (q,a) = p$ for some $a\in\Sigma, w\in\Sigma^*$. An element of this relation $\vdash_M$ is called a **move** in automaton $M$.

What this operator does is specify that in the automaton $M$, it will accept the string $w$ at the node $q$ and then it will return a string $w'$ when arriving at the node $p$. 

We can expand this operator to the $n^{th}$ power. For example $(t,hola)\vdash_M^3 (r,a)$ means that we can get from state $t$ with the string $hola$ to the state $r$ with the string $a$ in only 3 steps.

The same applies with $\vdash_M^+$ and $\vdash_M^*$, where the first one demands that at at least one transition is required, while the latter one says that zero or more transitions are required.

### Language Accepted by Non-Deterministic Finite Automata

We say that a string $w \in \Sigma^*$ is accepted by a NFA $M = (Q,\Sigma, \delta,q_0, F)$  if:
$$
\exists(q_0,w) \vdash^*_M(q,\epsilon), q\in F
$$
From this we can say that the language accepted by the automaton $M$ is defined as:
$$
L(M) = \{ w\in \Sigma^*/ M \text{ accepts } w\}
$$

### Finite Automata with $\epsilon$-transitions

A Non-deterministic finite automaton with $\epsilon$-transitions is a quintuple  $M = (Q,\Sigma, \delta,q_0, F)$ defined in the same way as the NFA except for the mapping function. Here the mapping is defined from:
$$
\delta : Q \times (\Sigma \cup \{\epsilon\}) \rightarrow R / R \subseteq Q
$$

#### $\epsilon$-closure

The $\epsilon$-closure function goes from one state to a set of states and it expresses the states that you can go from state $q$ using only $\epsilon$-transitions.
$$
\epsilon\text{-closure}: Q \rightarrow 2^Q : \epsilon\text{-closure}(q) - \{p\in Q/ (q,\epsilon)\vdash_M^*(p,\epsilon)\}
$$
 There's an algorithm to remove this $\epsilon$-transitions of an NFA:

<img src="Resources/02 - Finite Automatas/image-20201030173402684.png" alt="image-20201030173402684" style="zoom:50%;" />

### NFA with Multiple Initial States

The quintuple $M = (Q,\Sigma, \delta,I, F)$ is a NFA with a set of initial states $I$ where:

- $Q,\Sigma,\delta,F$ are the same as in the NFA definition
- $I$ is a nonempty subset of the states $I\subseteq Q$

The sequence of moves on this automaton can start with any value of $I$.

We can transform this automaton to a regular NFA with the following algorithm:

<img src="Resources/02 - Finite Automatas/image-20201030174102264.png" alt="image-20201030174102264" style="zoom:50%;" />