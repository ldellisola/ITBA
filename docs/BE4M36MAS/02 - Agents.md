# Agents

The agent is a competent system that is situated in some environment, and that is capable of autonomous action in this environment to meet its goal.

Rationality depends on:

- Performance measure for the degree of success
- Percept sequence: how well the agents understand the environment and remember the past of the environment.
- agent's knowledge about the environment
- action available to the agent.

## Agents with State

<img src="Resources/02 - Agents/image-20200924193050652.png" alt="image-20200924193050652" style="zoom:33%;" />

The *see* function is the agent's ability to observe its environment whereas the action function represents the agent's decision making process.

The output of the see function is a perception:
$$
see:E\rightarrow Per
$$
This function maps environments states to perceptions.

Agents can sometimes store information about the environment state and history. We will call $I$ to the set of all internal states of the agent.

The *action* function in agents is defined by its internal state:
$$
action: I \rightarrow A_C
$$
The *next* function is an agent maps an internal state and a perception to an internal state:
$$
next:I\times Per \rightarrow I
$$
The *next* function says how the agent updates its view of the world when it gets a new perception.

The agent has an inner control loop, that follows this cycle:

1. Agents starts in some internal state $i_0$
2. Observes its environment state $e$, and generates a perception $see(e)$
3. Internal state of the agent is the updated via $next(i,see(e))$
4. The action selected by the agent is $action(next(i_0,see(e)))$
5. Go to step 2.

## Tasks

Agents are build to carry out tasks for us, but we want to the the agents to to this tasks without us telling them what to do every time. 

One idea is an **utility function**. We associate rewards with states that we want agents to bring about, and we associate utilities with individual states. A **task specification** is then a function that associates a real number with every environment state:
$$
u:E\rightarrow \mathbb R
$$

### Local Utility Function

Local utility functions actuate on the same run without accessing to memory, as they are common in reactive agents. They try to maximize or minimize the utility of a state on a run.

The main disadvantage is that it's difficult to specify a long term view when assigning utilities to individual states.

### Sequential Decision Making

It's used when we are dealing with a non-deterministic environment. Similar to the other method, calculates the best possible action for this agent. But that action is not always taken, as other actions also have some probability to be chosen.

### Utilities Over Runs

We can also assign utilities to runs instead of states. This approach takes a long term view. We can modify this approach by adding some probabilistic element to the way it chooses the action.

## Types of Agents

### Reactive Agents

This agents do not have any sort of memory and only decide their actions based on the present. Actions from this kind of agent can be represented as:
$$
action: E\rightarrow A_C
$$


































