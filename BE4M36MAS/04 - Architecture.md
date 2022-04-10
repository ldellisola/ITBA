## Architecture

The world may be a finite set $E =\{e,e',\dots\}$ of discrete instantaneous states.

Agents are assumed to have a repertoire of possible actions $A_C=\{\alpha,\alpha',\dots\}$ available to them, which transform the world. The actions themselves can be non-deterministic.

**Reactive Agent**: Doesn't have an inner representation of the world and only reacts to new changes in the environment.

**Model Based Reactive Agent**: It has also a representation of the environment (simple memory). For example can remember what happened, but what could have happened in the future.

**Model Based Goal Based Agent**: The agents has a purpose or goal that it wants to achieve. They will only know it when they are close to achieve it.???

**Model Based Utility Based Agent**: ???

**Learning  Based Agent**: 

==MORE==

### Runs

A run ($r$) of an agent in an environment is a sequence of interleaved world states and actions:
$$
{r: e_0}   \xrightarrow {\alpha_0} e_1  \xrightarrow {\alpha_1} \dots \xrightarrow {\alpha_{n-1}} e_n
$$
When an action is deterministic, each state has only one successor. When they are not deterministic, the run (or **trajectory**) is the same, but the set of possible runs is more complex.

A few definitions:

- $R$ is the set of all such possible finite sequences.
- $R^{A_C}$ is the subset of $R$ that ends with an action.
- $R^E$ is the subset of $R$ that ends with a state.

These sets of runs contain all runs from all starting states.

Lets call $R$ as the set of all possible runs. We have to subsets of it, where  $R^{A_C}$

### Environments

A **state transformer** function represents the behavior of the environment:
$$
\tau:R^{A_C} \rightarrow 2^E
$$
Environments are **history dependent**, as earlier actions of agents can have significant impacts on it. They are also **non-deterministic** as there is same uncertainty about the result.

If $\tau(r) = \empty$, then there's no possible successor states to $r$, so we say that run has ended.

An environment can be defined as a triple:
$$
Env = <E,e_0,\tau>
$$
Where $E$ is the set of states, $e_0 \in E$  is the initial state and $\tau$ is the state transformer.

### Agents

We can define $A_g$ as the set of all agents. ==PREGUNTAR==

We can think of an agents as being a function which maps runs to actions:
$$
A_g:R^E\rightarrow A_C
$$
Thus an agent makes a decision about what action to perform, based on the history of the system that has witnessed to date.

### System

A system is a pair containing an agent and an environment. Any system will have associated with it a set of possible runs, we denote the set of runs of an agent $A_g$ in an environment $Env$ by:
$$
R(A_g,Env)
$$
We also assume that this only contains the runs that have ended.

Formally, a sequence:
$$
(e_0,\alpha_0,e_1,\alpha_1,e_2,\alpha_2,\dots)
$$
represents a run of an agent $A_g$ in the environment $Env = <E,e_0,\tau>$ if:

- $e_0$ is the initial state of $Env$

- $\alpha_0 = A_g(e_0)$

- $$
  \array{
  \text{for } u \gt 0,\\
  & e_u\in \tau((e_0,\alpha_0,\dots,\alpha_{u-1}))\\
  & \alpha_u = A_g((e_0,\alpha_0,\dots,e_{u})
  }
  $$

Two agents are equal when they have the same set of runs:
$$
R({A_g}_1, Env)=R({A_g}_2, Env)
$$

