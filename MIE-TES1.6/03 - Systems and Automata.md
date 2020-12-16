# Systems and Automata

In the **Black-box description** of a system, we treat the system as a mystery box that we don't know what it contains. We can only know the inputs and outputs of the system.

We say that a system is **reactive** if their inputs and outputs have infinite length, such as a signal.

A discrete time system with input $I$ and output $O$ is a relation between signals over $I$ and signals over $O$, a subset of $\Sigma_I \times \Sigma_O$. If $(i,o)$ is an element of this subset, then we say it is a **behavior** of the system.  

We say a system$S_1$ if a **refinement** of another system $S_2$ if is it a part of that system $S_1 \subseteq S_2$.

In the **white-box description** of a system, we can actually look at how it works and makes decisions. 

### Properties

We will assume the system $S$ is a discrete system with input set $I$ and output set $O$. We say $S$ is **receptive** if for every input there's an output. The formal definition is as follows:
$$
\forall i \in \Sigma_I, \exists o \in \Sigma_O / (i,o) \in S
$$
We say $S$ is **causal** if the output given at some time is determined by another input up to that time. Formally, we say that:
$$
\forall i_1,i_2 \in \Sigma_I, x\in O, t\in \N_0 /
\\
\forall t' \in \{0,\dots,t\}/ i_1(t') = i_2(t') \land \exists o \in \Sigma_O/(i_1,o) \in S, o(t) = x
\\
\iff
\\
\exists o \in \Sigma_O/ (i_2,o) \in S, o(t) = x
$$
$S$ is **deterministic** if every input has an unique output.

$S$ is **memoryless** if the output at a given time is determined only by the input at this time.

## Discrete Time Automata

A discrete time automata is a quintuple $(S,S_0,I,O,R)$ where:

- $S$ is a set of states.
- $S_0 \subseteq S$ is a set of initial states
- $I$ is the set of inputs.
- $O$ is the set of outputs
- $R\subseteq I \times S \times S \times O$ is the set of transitions.

The difference with the classical automata is that there are no terminal states.

We call the **behavior of a system** to the pair of signals $(i,o) \in \Sigma_I \times \Sigma_O$ if:
$$
\forall t \in \{0,1,\dots\} (i(t),s(t),s(t+1),o(t))\in \R
$$
The following automaton represents the system:
$$
[T] = \{(i,o) \in \Sigma_I \times \Sigma_O / (i,o) \text{ is a behavior of the system }T\}
$$
We say that two automata are equivalent if they represent the same system.

The system represented by an automaton is always receptive and causal, but it can be nondeterministic. An automaton is **deterministic** if it only has one initial state and and there is only 1 receiving state and output for every input and state. 