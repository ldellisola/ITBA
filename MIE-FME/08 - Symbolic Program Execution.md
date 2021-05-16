# Symbolic Program Execution

We want to test programs as completely as possible, ideally covering all possible execution paths (sequence of program lines). 

To do this first we must formalize the lines of code into a basic path. Here we have an example where we want to extract the condition along the execution path $1,2,3,4,1,2,3,6$:

<img src="Resources/08 - Symbolic Program Execution/image-20210419165052209.png" alt="image-20210419165052209" style="zoom:33%;" />

This will also be noted as:
$$
\text{BP}_{1,2,3,4,1,2,3,6}(P)
$$
Later, we must apply SSA to be able to deal with this execution path:

<img src="Resources/08 - Symbolic Program Execution/image-20210419165331751.png" alt="image-20210419165331751" style="zoom:33%;" />

The lines $l_1,\dots,l_n$ of a program $P$ can be executed in this order if $X_{l_1,\dots,l_n}$(P) is satisfiable:
$$
X_{l_!,\dots,l_n}(P):\iff F_{\text{pre}}(\text{SSA}(\text{BP}_{l_1,\dots,l_n}(P)))
$$
where $F$ and $F_{\text{pre }}$ are defined as:
$$
F_{\text{pre}}(c_1;\dots;c_n; @\bot):= \bigwedge_{i \in \{1,\dots,n\}, F(c_i) \neq \top} F(c_i)\\

F(\bold{\text{assume }} \phi) := \phi\\
F(\bold{\text{input }} v) := \top\\
F(v \larr t) := v = t
$$
If it is satisfiable, then the satisfying assignment results in a test case.

This can also be accomplished with verification conditions:
$$
\text{The Lines $l_1,\dots,l_n$ of a program $P$ can be executed in this order}\\
\iff \\
x_{l_1,\dots,l_n}(P) \text{ is satisfiable}\\
\iff \\
F_{\text{pre}}(\text{SSA}(\text{BP}_{l_1,\dots,l_n}(P))) \text{ is satisfiable}\\
\iff \\
\text{verification condition } \text{VC}(\text{BP}_{l_1,\dots,l_n}(P)) \text{ does not hold} \\
\iff \\
\neg \text{VC}(\text{BP}_{l_1,\dots,l_n}(P)) \text{ is satisfiable}
$$

 ## Choosing Execution Paths

First we have to select a set of execution paths, and then for each execution path find the corresponding test case by computing a satisfiable assignment of $F_{\text{pre}}(\text{SSA}(\text{BP}_{l_1,\dots,l_n}(P)))$. This has it's own problems though:

- There are some undecidable theories
- Usage of external function with unknown source code.

For the second problem, we can work around it with some tricks:

- **Over-Approximation**:

  Here we are replacing our unknown constraint with a weaker constraint. If the result is *"unsatisfiable"* then the original formula is not satisfiable. If the result is *"satisfiable"*, then there is no guarantee that the original formula is satisfiable. 

  Because of this we do not want to use over-approximation in this case.

- **Under-Approximation**:

  Under-approximation is the opposite approach. Here we want to look for a stronger constraint so that if this formula is satisfiable, then the original one will also be satisfiable.

## Dynamic Test Generation

Dynamic test generation, or Concolic testing is a technique that runs the program both concretely and symbolically.

It creates the logical formula $X_{l_1,\dots,l_n}(P)$ line by line. As soon as formula creation arrives at a function that the solver cannot handle, let the program run until we receive the result of the function. This function does not find all test cases, it is only an approximation.

For the symbolic execution, we need to cover as much pieces of code as possible. For this we use a Cover tree of paths up to a certain depth. This brings a problem with the amount of paths that have to be covered, as they can be millions.

A way to solve this is by either merging paths or choosing them.