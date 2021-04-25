# Correctness of Programs without Control Structures

In order to determine if a program is correct, we need to stablish assertions. This assertions come in two different forms:

- **Assumptions**: To be ensured by the user, from outside. When validating the correctness of a program we need to respect this conditions.
- **@**: To be ensured by the program. The result of the program should comply with these conditions.

Assertions can also be internal or external. For example in a function we can only check the input and output and call the assertion external. If we also have assertions in the middle of the code then they are internal assertions.

A program execution is **regular** if it satisfies all the **assume**-assertions. The program is **partially correct** if for every regular execution of the program, from the first program line to a program line with an **@**-assertion, satisfies the final **@**-assertion.

We also have **input** commands that stablish the need for the user to input a value during runtime.

## Static Single Assignment Form (SSA)

SSA is an optimization technique utilized by compilers to avoid compiling variables that are useless. This consists on renaming variables to avoid rewriting information on the same variables, variables are not modifiable.

In the case of assignments, we have the following cases:

- **Variable Assignment**: 
  $$
  x \larr 1\\
  x \larr x+1
  $$
  Would be translated to:
  $$
  x_0 \larr 1\\
  x_1 \larr x_0 +1
  $$

- **Array Assignment**:
  $$
  a[i] \larr 1\\
  a[i] \larr 1 + a[1]
  $$
  Would be translated to:
  $$
  a_1 = \text{write}(a,i,1)\\
  a_2 = \text{write}(a_1,i,a_1[i] + 1)
  $$

- **User Input**:
  $$
  x \larr 7 \\
  \bold{\text{input }} x \\
  x \larr x + 2
  $$
  Would be translated to:
  $$
  x_0 \larr 7\\
  \bold{\text{input }}x_1\\
  x_2 \larr x_1 + 2
  $$

## Verification Condition

After obtaining the SSA form for our basic path, we can formulate the verification condition. This condition is formulated with the following formula:
$$
F(\bold{\text{assume }} \phi) := \phi\\
F(\bold{\text{input }} v) := \top\\
F(v\larr t) := v=t\\
F(c_1,\dots,c_n,\bold{@}\alpha)=\left[\bigwedge_{i\in\{i,\dots,n\},F(c_i)\neq \top} F(c_i)\right] \implies \alpha
$$
Now we can say that a basic path $P$ is correct $\iff \models F(SSA(P))$. This is proven true with a formal proof or false with a counter example.

