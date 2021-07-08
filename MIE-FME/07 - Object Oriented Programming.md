# Object Oriented Programming

## Abstract Data Type

An abstract data type is a data type with certain operations that is independent of any implementation. It is described as a signature and a set of axioms. For example if we have the class `counter`:

```
Class counter:
	constructor init(n)
	method 		val():N
	methhod		dec()
```

It will be translated into the following signature:
$$
\array{
\text{init}:\mathcal N \rarr \text{counter}\\
\text{val}:\text{counter} \rarr \mathcal N \\
\text{dec}:\text{counter} \rarr \text{counter}
}
$$
And there are two ways to call out the methods of a class:
$$
\array{i \larr c.\text{val()} & \text{or}& i \larr \text{val}(c)}
$$
The axioms can also be converted into assertions for the functions. This example class has the following axioms defined:
$$
\forall n \in \mathcal N. \text{val}(\text{init}(n)) = n \\
\forall c \in \text{counter}. \left[ \array{
\text{val}(c) = 0 \implies \text{val}(\text{dec}(c)) = 0 
~~\land \\
\text{val}(c) \neq 0 \implies \text{val}(\text{dec}(c))= \text{val}(c)-1
}\right]
$$
We can convert it to:

```
Class counter:
	constructor	init(n):
		assume n in N
		...
		@ val() = n
	method		val():N
	method 		dec():
		v = val()
		...
		@[ v = 0 => val() = 0 ] && [ v != 0 => val() = v-1 ]
```

###  Internal Consistency of Data Types

This type of consistency deals with assertions of the internal variables of classes. This would amount to an assertion at the beginning and and end of every method. Some object oriented languages have support for this type of assertions. We are going to be using the following convention:
$$
\bold{\text{invariant  }} x \ge 0
$$

### Implementation 

Let $\Sigma$ be a signature over types $T_1,\dots,T_n$, a **$\Sigma-$structure** $S$ is defined as a tuple $(\Omega_1,\dots,\Omega_n,\mathcal I)$ where:

- $\Omega_1,\dots,\Omega_n$ are sets (The carrier sets of $S$).
- $\mathcal I$ assigns to:
  - Every function symbol $f:T_{i_1}\times \dots, \times T_{i_a} \rarr T_j$ from $\Sigma$ to a function $f:\Omega_{i_1}\times \dots \times \Omega_{i_a} \rarr \Omega_j$
  - Every predicate symbol $p:T_{i_1} \times \dots \times T_{i_a}$ from $\Sigma$ to a relation $r \subseteq \Omega_{i_1} \times \dots \times\Omega_{i_a}$

We can think of this structure of a concrete class in C++.

### Semantics

A $\Sigma-$structure $(\Omega_1,\dots,\Omega_n,\mathcal I)$ is a model of a data type $T$ if:

- $T$ has the signature $\Sigma$
- For every axiom $\phi$ of $T$, $(\Omega_1,\dots,\Omega_n,\mathcal I) \models \phi$

A intuitive way to look at this is:

- **Abstract Data Type**: Interface
- **Model**: Implementation

### Extensions of Data Types

Extensions are useful for adding properties to an existing specification.

> Given two data types $(\check\Sigma, \check A)$ and $(\hat\Sigma, \hat A)$:
> $$
> (\check\Sigma, \check A) \text{ is an extension of } (\hat\Sigma, \hat A)\\
> \iff\\
> \hat \Sigma\subseteq\check\Sigma  \land \hat A \subseteq \check A
> $$
> It is denoted as :
> $$
> (\check\Sigma, \check A) \preceq (\hat\Sigma, \hat A)
> $$
