# Unbounded Model Checking

Before we learnt how to test our models in bounded time, but we have transition systems with infinitely many paths of infinite length, if we want to be certain that a model fulfills its specification we need to validate them.

To solve this problem we are introducing Unbounded Model Checking, a method for proving LTL properties. 

One tool that we are using now are **safety certificates**. They are a set of states $V$ that comply with:

- $V$ contains every initial state : $S_0 \subseteq V$
- No transition leads out of $V$: $\text{Post}_R(V) \subseteq V$
- $V$ contains only safe states: $V \subseteq \mathcal I(\text{ok})$

where  $\text{Post}_R(V) = \{x'/x \in V, (x,x') \in R\}$.

These conditions are know as **safety verification conditions**. And the first two conditions are called **inductivity conditions**. The inductivity conditions implies that $V$ contains the **reach set**, the set that contains all the reachable states:
$$
\{\pi(k)/ \pi \text{ path},k \in \N_0\} \subseteq V
$$
The third condition helps us determine that all reachable states are safe.

An arbitrary set that contains all reachable states, meaning a superset of the reach set is called **inductive variant**. When talking about transition systems, we refer to the **trivial indictive invariant** as the set that contains all the states of the system.

## How to Check $G$ Conditions

Checking for small sets is not a problem as most times we can brute force it or guess $V$ from an expert estimation or from the documentation, but this strategy is not valid for large or infinite transition systems.

In those cases we are going to implement **symbolic checking of safety verification conditions**. For this ne are assuming we have the transition system, $V$ and $\text{ok}$ given symbolically, using logical formulas:
$$
(S,\{x/S_0(x)\},\{(x,x')/R(x,x')\}), \{x/\text{ok}(x)\}, \{x/V(x)\}
$$
We can now substitute them in our 3 safety verification conditions:

- $S_0 \subseteq V$
- $\{x'/x\in V, (x,x') \in R\} \subseteq V$
- $V \subseteq \mathcal I (\text{ok})$

We can also simplify those conditions into predicate logical formulas:

- $\forall x. S_0(x) \implies V(x)$
- $\forall x \forall x'. [V(x) \land R(x,x')] \implies V(x')$
- $\forall x. V (x) \implies \text{ok}(x)$

Now we need to prove this 3 conditions, but SAT solvers don't prove, they only check satisfiability. In order to prove them we need to check the satisfiability of the negation of the conditions:

- $\neg [\forall x. S_0(x) \implies V(x)]$
- $\neg [\forall x \forall x'. [V(x) \land R(x,x')] \implies V(x')]$
- $\neg [\forall x. V (x) \implies \text{ok}(x)]$

### Safety Certificates

Even after that, we do not have the safety certificates yet. In **finite cases** we can view the transition relation as directed graph. Here we can apply **depth first-search**:

```pseudocode
input: t // finite path with all the states in V
output: False or True

serch(t,V):
	if last(t) in V then:
		return True
	else if last(t) not in I(ok) then:
		return False
	else:
		V.insert(last(t))
		return for all s :  not R(last(t),s) or search(ts,V)
```

 Where if the algorithm return $\bot$ it means that $\not \models G\text{ok}$, else it says that every states that can be reached from `last(t)` without reaching a state in $V^{in}$ is in $V$. 

In order for this algorithm to function properly, we wrap in other code to return either False or the reach set (a safety certificate):

```pseudocode
V = {}
if for all s in S0: search(s,V) then:
	return V
else:
	return False
```

Using DFS tends to have low memory requirements, but it has some drawbacks:

- Resulting counter examples tend to be too long
- The algorithm may get lost on long, useless paths
- It does not work for systems with infinite states.

Using **breadth-first search** solves all those problems, but it has high memory requirements, making them not practical for systems with large or infinite states.

Our approach is called **Best-First Search** (also known as **directed model checking**), it is useful in cases where we have good heuristics and the goal is mainly to find counter examples.

A different approach is a **set based algorithm**.:

```pseudocode
V = S0
while exists transition(x,xp): x in V and xp not in V:
	V = V union Post(V)
return V
```

If the resulting set is included in $\mathcal I(\text{ok})$, then $V$ fulfills the verification conditions.

This algorithm still has some problems though, as it can't terminate when working with infinite systems, general slow convergence and problems running on complex sets.

Because of this, in practice we use a modification of this algorithm that uses supersets:

```pseudocode
V = supersetOf(S0)
while exists transition(x,xp): x in V and xp not in V:
	V = supersetOf(V union Post(V))
return V
```

This new algorithm conserves the same properties as the one before but now the resulting set $V$ is a superset of the reach set.

This creation of a super set can troublesome though:

- If we overapproximate too much, it might result in violation of $V \subseteq \mathcal I(\text{ok})$
- If we overapproximate too little, it might result in termination problems or the set representation blows up

#### Backward Computation

Instead of looking for a set that fulfills the safety verification conditions, we can also compute its complement, a set of states that leads to an unsafe state, also known as **backward reach set**.

All the algorithms we've seen on this lecture can be used to calculate this set if we use a modified version of their transition system:
$$
(S,S_0^-,R^-)
$$
where:
$$
S_0^- = S \setminus \mathcal I(\text{ok}) = \{s/s \models \neg ok\}\\
R^- = \{(x',x) | (x,x')\in R\}
$$
And we are going to check for:
$$
\models G \neg \text{ok}^-
$$
Where $\mathcal I(\text{ok}^-) = S_0$

## How to Check $F$ Conditions

In order to obtain a Safety Certificate we need to convert our model with a topological sort into a strict linear order on all states. After the topological sort, we cannot have transitions that "go back" to a state that is before. 

To avoid this we can usually remove transitions that go back and rearrange the topological sort. For example, if we have the following model:

<img src="Resources/08 - Unbounded Model Checking/image-20201127151518287.png" alt="image-20201127151518287" style="zoom:67%;" />

We can see that if we were to create a topological sort, it would have some transitions that go back, for example $C\rarr D$:

<img src="Resources/08 - Unbounded Model Checking/image-20201127151744804.png" alt="image-20201127151744804" style="zoom:67%;" />

If we remove that transition, we can rearrange the topological sort into a better solution:

<img src="Resources/08 - Unbounded Model Checking/image-20201127152447386.png" alt="image-20201127152447386" style="zoom:67%;" />

In this case, the certificate is defined as a pair $(V,\succ)$ where $\succ$ is a struct linear order on $V$ such that:

- $S_0 \subseteq V \subseteq S$
- $\forall (s,s') \in R, s \in V, s'\not \in V \implies s' \in \mathcal I(\text{goal})$
- $\forall (s,s') \in (R \cap V \times V), s \succ s'$

Here we also have a few algorithms to solve this problem, for example **Depth-First Search**:

```pseudocode
input: finite path t, list V
output: True or False // Depeding in the property holds

search(t,V):
	if last(t) not in I(goal) and Exists 0 <= i <= |t|-2 t(i) == last(t) then:
		return False
	else if last(t) in I(goal) or last(t) in V then:
		return True
	else:
		r = for all s  not R(last(t),s) or search(ts,V)
        V.insert(last(t))
        return r
```

Similar to the other algorithms, we are going to wrap this one in some code to return either false or the set $V$:

```pseudocode
V = {}
if for all s in S0, search(s,V) then:
	return V
else:
	return False
```

## How to Check $R$ Conditions

To check for this formula, we can use the following equivalence:
$$
G\phi \equiv \bot R\phi
$$


















