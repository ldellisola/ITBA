# Bounded Software Model Checking

BSMC is a method for automatic program correctness proof. We say that a program execution is **regular** if it satisfies all the assume-assertions. The program is **partially correct** if for every regular execution, from the first line to a program line with the @-assertion, it satisfies the final @-assertion.

A program is **correct** if for all states $s$ such that $s \models I$, for all states $s'$ such that $s\rarr_P^* s'$:
$$
s' \models O
$$
Where $I \equiv pc =1 \land \phi_I $ and $O \equiv \bigwedge_{l \in L} pc = l \implies \phi_l$, and $L$ is the set of all program lines with @-assertions and $\phi_l$ is the corresponding line.

Now everything relates to program states, but we need to define it in a first-order formula. This formula can be translated to:
$$
\not \exists x,x'.[I(x) \land R(x,x') \land O(x')]
$$
If this holds, then the program is not satisfiable, meaning there is a bug. Here, the $R(x,x')$ formula contains all the states of the program.

## Bounded Program Correctness

Even though programs can have an arbitrary large set of states, we can assume that this number is fixed to $n$ and try to solve them using solvers. Here is here $\text{BMC}$ comes into play:
$$
\text{BMC}_{I,O,P}(n) := \neg \exists v_1,\dots,v_n. I[v \larr v_1]\land \bigwedge_{i = 1,\dots,n-1} \phi_P[v\larr v_i,v' \larr v_{i+1}] \land \neg O[v \larr v_n]
$$
Where $v$ is a placeholder for all program variables, with respective indices and primes. If we only use data types from decidable theories, we can check this formula automatically. 

A sequence of states $s_1,\dots,s_n$ such that:
$$
\pi^1(s_1) \sqcup\dots \sqcup \pi^n(s_n) \models  I[v \larr v_1]\land \bigwedge_{i = 1,\dots,n-1} \phi_P[v\larr v_i,v' \larr v_{i+1}] \land \neg O[v \larr v_n]
$$
Where for a state $s$, $\pi^i(s)$ is a function that assigns the same values to variables with index $i$. This is called a **counter-example** or **error trace**.

## Bounded Verification

We can prove the correctness for a program within a given number of steps:
$$
\models \text{BMC}(n)
$$
But proving that $\text{BMC(i+1)}$ does not imply that $\text{BMC(i)}$ holds. Another thing to denote is that $\models \text{BMC}_{I,O,P}$ does not imply that the program $P$ is correct if there is I/O involved, but $\not \models \text{BMC}_{I,O,P}(n)$ means that there is a bug in $P$.

Counter-examples always have a certain length, so we can always find them if we have enough time. Hence, finding errors in programs with decidable data types is semi-decidable.

## Testing

For software in safety critical applications, there are standards that require completeness of tests according to certain criteria. Usually this criteria is that the tests must cover the code in a certain way, for example, all lines must be in at least one test.

