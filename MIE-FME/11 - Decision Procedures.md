# Decision Procedures

Until now we discussed about the need to check verification conditions and conditions for execution paths, that can, to an extent, be done automatically due to advances on solvers in recent years. 

## Abstraction

On very complicated formulas, we can use abstraction and boolean solvers to determine if the program can run. We start by ignoring details and incrementally use more and more properties:

1. Properties of Boolean constants
2. Properties of Boolean operations
3. $<$ is the negation of $\ge$

By removing these details, we can say that if the abstraction is unsatisfiable, then the original formula will be as well, but not the other way around. If the abstraction is satisfiable, and we want to prove unsatisfiability, we have to add additional properties.

For example, if we have the following program:

```pseudocode
q <- False
if 10 * x > 0 AND w < 1 then:
	q <- True
if  [10 * x <= 0 OR w >= 1] AND q then:
	Throw Exception()
```

If we want to be sure that an exception is not going to be thrown, we can reduce the program to:
$$
\neg q \land 10 \times x > 0 \land w < 1 \land q_1 \land  [10 \times x \le 0 \lor w \ge  1 ] \land q_1
$$
We can reduce this to:
$$
\neg Q \land A \land B \land Q_1 \land  [\neg A \lor C] \land Q_1
$$
This is still satisfiable, we need to see that $B \equiv \neg C$:
$$
\neg Q \land A \land B \land Q_1 \land  [\neg A \lor \neg B] \land Q_1
$$
Now all possible cases will result in a contradiction.

## Equality

We know the equality has the following axioms:

- **Reflexivity**: 	$\forall x. x = x$

- **Symmetry**:      $\forall x,y.  x = y \implies y = x$

- **Transitivity**:    $\forall x,y,z. [x = y \land y = z] \implies x = z$

- For every function symbol $f$ of arity $n$:
  $$
  \forall x_1,\dots,x_n. [x_1 = y_1,\dots,x_n = y_n] \implies f(x_1,\dots,x_n) = f(y_1,\dots,y_n)
  $$

If the first three axioms hold, it is a equivalence relation, if the fourth axiom holds as well, then it is a congruence relation.

## Congruence Closure Algorithm

This algorithm will take as input a formula like:
$$
s_1 = t_1 \land \dots\land s_m = t_m \land s_{m+1} \neq t_{m+1} \land\dots\land s_{n} \neq t_{n}
$$
And it will tell us if the formula is satisfiable or not, using the theory of free function symbols. The algorithm goes like this:

Let $\tau$ be the set of sub-terms of:
$$
s_1 = t_1 \land \dots\land s_m = t_m \land s_{m+1} \neq t_{m+1} \land\dots\land s_{n} \neq t_{n}
$$
And  $\sim $ a equivalence relation on $\tau$ such that:
$$
\forall u,v \in \tau. u\neq v \implies u \nsim v
$$

```pseudocode
while there is i in {1,...,m}, u,v in tau such that
		u !~ v AND (u[s_i <- t_i] = v OR u[t_i <- s_i] = v) do:
	merge equivalence classes of u and v in ~
	while there is u,v in tau, p,q in tau such that
			u !~ v AND p ~ q AND (u[p <- q] = v OR u[q <- p] = v) do:
		merge equivalence classes of u and v in ~

if there is i in {m+1,...,n} such that s_i ~ t_i then:
	return unsatisfiable
else:
	return satisfiable
```

### Example

An example of this is the following formula:
$$
f(a,b) = a \land f(f(a,b),b) \neq a
$$
 Initially we assume that every sub-term is in a separate class:
$$
\{\{a\},\{b\},\{f(a,b)\},\{f(f(a,b),b)\}\}
$$
From $f(a,b) = a$ we get:
$$
\{\{a, f(a,b)\},\{b\},\{f(f(a,b),b)\}\}
$$
Applying congruence propagation from $\{a,f(a,b)\}$ we get that $f(a,b) = f(f(a,b),b)$:
$$
\{\{a, f(a,b),f(f(a,b),b)\},\{b\}\}
$$
And we reach a contradiction with inequality!

### Extension to Disjunctions and Quantifiers

To prove that a formula with disjunctions $\phi_1 \lor \dots\lor \phi_n $ is satisfiable, we need to show that at least one of the sub formulas $\phi_i$ is satisfiable. So, in our case we want to probe unsatisfiability, so we must be sure that all of the sub formulas are not satisfiable.

If we have the $a \implies b$ operator in a formula, it can easily be converted to $\neg a \lor b$ and solved.

If quantifiers are present, then the problem is undecidable.

### Extension using the Theory of Free Function Symbols

This theory says that anything can be transformed into a function, whether it is access to a element of a data structure, an array or a pointer. This is also called abstraction. For example:
$$
a[x] = 0 \land x = y \land a[y] = 1
$$
We can abstract the formula into:
$$
f(a,x) = c \land x = y \land f(a,y) = d
$$
This formula is satisfiable, but only because we forgot of a condition:
$$
f(a,x) = c \land x = y \land f(a,y) = d \land c \neq d
$$
Now we can see that it is not satisfiable.

## Witnesses

Decision procedures sometimes also return satisfying assignments, meaning a witness for satisfiability. This allows automatic execution of I/O specifications. 

For a given input $a$, the corresponding output is the witness of satisfiability of $I(a)\land O(a,y)$.