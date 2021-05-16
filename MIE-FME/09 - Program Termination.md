# Program Termination

>  According to Turing, the problem of verifying termination (halting problem) is undecidable.

We are going to say that a partially correct program $P$ is **terminating** if ever regular execution of $P$ reaches a program line with the statement **return**. We also implicitly assume that there's a return statement after the very last line.

But termination does not imply that there's an upper bound on the number of loop iterations.

## Well-Founded Relation

A relation $\succ \subseteq \Omega \times \Omega$ is a well-founded relation on $S \subseteq \Omega$ if there is no infinite sequence $s_1,s_2,\dots \in S$ such that:
$$
s_1 \succ s_2 \succ \dots
$$
A good example of this is the $<$ operator defined on the natural numbers. It is a well-founded relation, but if we use it on $\R^{\ge0}$, then it is not.

## Lexicographic Relation

Lexicographic relations $\prec_1,\dots,\prec_n$ are well-founded relations on $S_1,\dots,S_n$ respectively, then $\prec$ is also a well-founded relation on $S_1 \times \dots \times S_n$
$$
(s_1,\dots,s_n) \prec (t_1,\dots,t_n) \iff \bigvee_{i=1}^n \left(\bigwedge_{j=i}^{i-1} s_j = t_j \land s_i \prec_i t_i\right)
$$
  A good example of this type of relation are  phone numbers or $8$-bit representation of integers.

## Partial vs Total Correctness

If all the assertions of a program hold, then we say that the program is partially correct, but this does not mean that it terminates. Take the following program as an example:

```pseudocode
assume x = 5
while True do:
	@ x = 5
@ x = 5
return x
```

All the assertions will hold, but the program will never exit the loop. For this reason we need to define **total correctness**, which means that the program is partially correct and that it terminates.

### Loop Termination

If we want to ensure termination, we only need to be sure that all the loops will terminate. This is where well-founded relations come to play. If we can define a well founded relation, then we know the loop will end.

We can also add another type of assertion, the $\dot @$ assertion implies that the condition must only be met upon re-entrance of the loop.

To prove program termination, for each loop we must have:

- A term $t$ over program variables denoting a function to a set $S$
- A well-founded relation $\prec$ on $S$ such that the value of $t$ decreases for each execution of the loop.

This is called a **Loop Variant**, or ranking function.

### Extra Basic Paths

This new assertion will modify how we create basic paths. For those paths that do not contain the new assertion $\dot @$, we construct them as usual. For the rest we must add that assertion in the last line of the path.

### Temporal Logic

The formulation of termination in temporal logic LTL is defined as:
$$
F\text{ pc} = r
$$
Where $r$ is the program line with the command return.

## Automatization

Because of the halting problem, we cannot completely automatize these systems, but there are techniques to get around it.

One way to solve this issue is by using all the safety conditions at the same time, and reduce them so simpler forms. If this formula does not hold, it doesn't mean that the program doesn't terminate, but we have to try with different forms to validate it.

