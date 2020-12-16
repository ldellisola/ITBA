# Bounded Model Checking

We have system models based on automata and their interactions and their formal specification based on temporal logic, but how do we check that a certain model fulfills a specification?

Given a transition system and a formula $\phi$, we have two possible outcomes, either all paths hold that formula or we find a counter-example. The problem here is that there may be infinite paths of infinite length and it's impossible to test them all.

Traditionally, we solved this problem by selecting a subset of all possible paths and use them as **test cases** to check the model for correctness. But this does not mean that the model is correct, just that it works with the selected test cases.

We can start solving this problem by using only **finite paths**.

### Formula $G \text{goal}$ 

We have to adapt this formula to use only finite paths. This is why we are adding a parameter $n$ that selects a prefix if the infinite length path:
$$
t\models G\text{ ok} \iff\forall k \in \{0,\dots,n-1\}~~t(k) \models \text{ok}
$$
This is a **necessary condition for correctness**:

> For every finite path $t$ of the given transition system:
> $$
> \models G \text{ ok} \Rightarrow t \models G \text{ ok}\\
> \not\models G \text{ ok} \Rightarrow t \not\models G \text{ ok}\\
> $$

#### Formula $F \text{goal}$ 

Loop detection. Loops are problems if we reach them before we reach our goal. Taking loops into consideration, we can say redefine this formula as:
$$
\array{
t \models F \text{ goal}: \Leftrightarrow &
\\
& \exists l \in \{0,\dots,n-2\} / t(n-1) = t(l)  \\&\Rightarrow
\\ & \exists k \in \{0,\dots,n-1\} / t(k) \models \text{goal}
}
$$
This is a **necessary condition for correctness**:

> For every finite path $t$ of the given transition system:
> $$
> \models F \text{ goal} \Rightarrow t \models F \text{ goal}\\
> \not\models F \text{ goal} \Rightarrow t \not\models F \text{ goal}\\
> $$

## Bounded Semantics of LTL

Bounded Semantics uses almost all operators from LTL. Given a finite path $t$ of length $n$ and LTL formulas $p,q$:

<img src="Resources/06 - Bounded Model Checking/image-20201108193950241.png" alt="image-20201108193950241" style="zoom:50%;" />

Here negation is only allowed where it appear before the state property. If it appears in other part we need to allow

We also have a similar **Necessary Condition for Correctness**:

> For every finite path $t$ of the given transition system:
> $$
> \models F \text{ goal} \Rightarrow t \models F \text{ goal}\\
> \not\models F \text{ goal} \Rightarrow t \not\models F \text{ goal}\\
> $$

## Testing Transition Systems

Instead of checking correctness for all paths, we are going to check correctness for some finite paths (test cases):
$$
\text{Test}(\phi,T) :\Leftrightarrow \forall t \in T/ t \models \phi
$$
Where $T$ is the set of test cases.

If $\models \phi$ that implies $\text{Test}(\phi,T)$ 

### How do I select test cases

Transition systems can have infinitely many paths of infinite length. There are systematic methods for choosing finite paths for testing:

-  black-box testing
- white-box testing
- Coverage criteria
- ...

The problems with testing is that you can easily miss bugs and this is not reliable enough for many safety critical systems. Because of this, we are going to use methods for proving correctness.

### Bounded Model Checking

 This does exhaustive testing, meaning that it will test *all finite paths* of a given length.
$$
BMC(\phi,n) \iff \forall \pi \in \{t \in S/ |t| = n\} \pi \models \phi \iff \text{Test}(\phi,\{t/ \text{is a path of length n}\})
$$
Every finite path that is longer that the amount of states contains a cycle/ Also, if there exists a counter-example for $G\text{ ok}$ that is longer than the amount of states, then there also exists a counter-example that is shorter. From these 2 observation we san say that:
$$
\models G \text{ ok} \iff BMC(G\text{ ok},|S|)
$$
 We also have the following theorem:

> For all finite transition systems, for all LTL formulas $\phi$
>
> there is a bound $n$ such that for all $n' \ge n$, $BNC(\phi,n') \iff \models \phi$ 

But his bound may be huge. 