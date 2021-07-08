# Automatic Synthesis of Loop Invariants

## Weakest Preconditions

A formula $I$ is a **precondition** of a program $P$ and a formula $O$ if:

- Every free variable of $I$ is a program variable of $P$
- The program $\bold{\text{assume }} I;P;@O$ is correct

Every precondition $I$ of a program $P$ and a formula $O$ is a **weakest precondition** of $P$ and $O$ if for every precondition $I'$ of $P$ and $O$:
$$
\models I' \implies I
$$

### Computation

We can see the weakest precondition in quantified form:
$$
\forall \vec v. \text{VC}(P;@O)
$$
Where $\vec v$ is a tuple of the auxiliary variables of $\text{VC}(P;@O)$. From here we have to remove the quantifiers corresponding to the variables introduced by assignments. This is a very difficult problem, but the idea is to start from the formula $\phi$ and to find a formula $\phi'$ such that $\models \phi \iff \phi'$ but that is quantifier free.

For example, we have the program:

```pseudocode
input x
@ x * x + a >= 1
```

We can compute the weakest precondition as:
$$
\forall x. \ x^2 + a \ge 1\\
\forall x.\ x^2 \ge 1-a \\
0 \ge 1-a\\
a \ge 1
$$

## Strongest Postconditions

A formula $O$ is a **postcondition** of a program $P$ and a formula $I$ if:

- Every free variable of $O$ is a program variable of $P$
- The program $\bold{\text{assume }}I;P;@O$ is correct

Every postcondition $O$ of a program $P$ and a formula $I$ is a **strongest postcondition** of $P$ and $I$ if for every postcondition $O'$ of $P$ and $I$:
$$
\models O \implies O'
$$

### Computation

We can see the strongest postcondition in quantifies for, with indexed variables is:
$$
\exists \vec v.\ F_{\text{pre}}(\bold{\text{assume }}I;P)
$$
Where $\vec v$ is a tuple of the variables in $F_{\text{pre}}(\bold{\text{assume }}I;P)$ not corresponding to the final value. Now we just need to get rid of the quantifiers. Here's an example:

```pseudocode
assume x >= 10
y <- x
x <- -10
z <- x + y
@ O(x,y,z)
```

We can execute the program before the assertion if:
$$
x\ge 10 \land y_1 = x \land x_1 = -10 \land z_1 = x_1 + y_1
$$
is satisfiable. We can define $O$ as:
$$
\exists x,y,z. [x \ge 10 \land y_1 = x \land x_1 = -10 \land z_1 = x_1 + y_1 ]
$$
We can add one more constraint based on these ones:
$$
\exists x,y,z. [x \ge 10 \land y_1 = x \land y_1 \ge 10\land x_1 = -10 \land z_1 = x_1 + y_1 ]
$$
and now we can remove the quantifiers:
$$
 y_1 \ge 10 \land x_1 = -10 \land z_1 = x_1 + y_1 
$$

## Loop Invariant Computation

The loops invariants have to hold on three verification conditions:

1. Hold in the first loop iteration.
2. If it holds, and the loop is re-entered, then it must hold again.
3. If it holds and the loop is left, then the assertion after the loop must hold.

### Forward Direction

When we are calculating the loop invariant in a forward direction, we need to calculate the strongest postcondition. The loop invariant will be composed with 3 formulas united by $\lor$, where each formula represents the strongest postcondition for each basic path.

This approach is based on iteratively adding (using disjunctions) strongest postconditions, with the strongest possible assertion after $0,1,2,\dots$ loop iterations.

For example, if we have the program:

```pseudocode
r <- False
for i <- 1 to n do:
	@ ??
	if a[i] = 7 then:
		r <- True
@ r <=> [Exists k. 1 <= k <= n AND  a[k] = 7]
```

We have the following basic paths:

```pseudocode
t <- False
ASSUME i = 1
```

The strongest postcondition is:
$$
i = 1 \land \neg r
$$
Now our program looks like this:

```pseudocode
r <- False
for i <- 1 to n do:
	@ [i=1 AND NOT r]
	if a[i] = 7 then:
		r <- True
@ r <=> [Exists k. 1 <= k <= n AND  a[k] = 7]
```

And we will look into the basic paths that stay within the loop:

```pseudocode
ASSUME i = 1 AND NOT r
ASSUME a[i] = 7
r <- True
i<- i + 1
```

The strongest postcondition is:
$$
a[i] = 7 \land r \land i = 2
$$

```pseudocode
ASSUME i = 1 AND NOT r
ASSUME a[i] != 7
i<- i + 1
```

The strongest postcondition is:
$$
a[1] \neq 7 \land \neg r \land i=2
$$
So the program will look like:

```pseudocode
r <- False
for i <- 1 to n do:
	@ [i=1 AND NOT r] OR [a[1] = 7 AND r AND i=2] OR [a[1] != 7 ANd NOT r AND i=2]
	if a[i] = 7 then:
		r <- True
@ r <=> [Exists k. 1 <= k <= n AND  a[k] = 7]
```

We can start to see a pattern. It looks like the invariant will look like:
$$
r \iff [\exists k. 1 \le k \le i-1 \land a[k] = 7]
$$

### Backward Direction

We can also place the invariant after the `if`, for this process we can use the weakest precondition, to ensure that the result is correct when we leave the loop.

The process iteratively adds (using conjunctions) the weakest preconditions to ensure the correct result after $0,1,2,\dots$ loop iterations.

