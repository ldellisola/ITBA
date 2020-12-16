# Interacting System Components

There are several ways to integrate systems together:

### Synchronous Parallel Composition

The Synchronous Parallel Composition is represented with the symbol $\otimes$. This can be applies both to systems and automata. Given the automaton $A_1,A_2$, that represents the systems $[A_1],[A_2]$:
$$
[A_1 \otimes A_2] = [A_1]\otimes [A_2]
$$
Given two discrete-time systems $S^1,S^2$ with input set $I^1,I^2$ and output sets $O^1,O^2$, the result of integrating them in a synchronous parallel composition is a system $S$:
$$
S = S^1 \otimes S^2, I = I^1 \times I^2, O = O^1 \times O^2
$$
<img src="Resources/04 - Interacting System Components/image-20201108143148408.png" alt="image-20201108143148408" style="zoom:100%;" />

Here we have to combine all possible states from all systems and connect them with all possible transitions.

This process can be formalized as:
$$
(S^1S_0^1,I^1,O^1,R^1) \otimes(S^2,S_O^2,I^2,O^2,R^2)  \dot = 
(S^1\times S^2,S_0^1 \times S_0^2,I^1 \times I^2,O^1 \times O^2,R^\otimes)
$$
Where:
$$
R^\otimes=\{((i^1,i^2),(s^1,s^2),(s'^1,s'^2),(o^1,o^2)) / (i^1,s^1,s'^1,o^1) \in R^1, (i^2,s^2,s'^2,o^2) \in R^2\}
$$

### Cascade Composition of Systems

In this composition, the behavior of a component may result in a reaction of other components. Here the output of one system is the input of the second system. This operation can be applied both to systems and automata:
$$
[A_1 \leadsto A_2] = [A_1] \leadsto [A_2]
$$
Given two systems $S^1,S^2$ with input set $I^1,I^2$ and output sets $O^1,O^2$ that **complies with the condition** $O_1 \subseteq I_2$, we get the following system:
$$
S^1  \leadsto S^2 :=\{(i_1,o_2)/ \exists i_0 (i_1,i_0)\in S^1 \land (i_0,0_2) \in S^2\}
$$
If we want to represent this operation with automaton, we can do it this way:
$$
(S^1S_0^1,I^1,O^1,R^1) \leadsto (S^2,S_0^2,I^2,O^2,R^2)  \dot = 
(S^1\times S^2,S_0^1 \times S_0^2,I^1,O^2,R^\leadsto)
$$
Where
$$
R^\leadsto = \{(i^1,(s^1,s^2),(s'^1,s'^2),o^2 / \exists x (i^1,s^1,s'^1,x) \in R^1 \land (x,s^2,s'^2,o^2)\in R^2\}
$$

### Table Lookup

For certain relations $R \subseteq I_1 \times \dots \times I_r \times O_1 \times \dots \times I_s$, a table lookup in $R$ (denoted as $\mathcal L_R$) is a system with input sets $I_1,\dots,I_r$ and output sets $O_1,\dots,O_r$ such that:
$$
(i_1,\dots,i_r,o_1,\dots,o_s) \in \mathcal L_R \iff \\
\forall k \in \N_0 ~~(i_1(k),\dots,i_r(k), o_1(k), \dots, o_s(k)) \in R
$$
The result is a memoryless system that can also be non-deterministic and non-receptive.

## General Composition

This type of composition allows for **Reactive Synchronous Models**, which can be composed of several different systems using arbitrary connection of input and outputs.

Given a network of components $N$, with $r$ inputs and $s$ outputs, then $(i_1,\dots,i_r,o_1,\dots,o_s) \in N$ if there exists a corresponding signal for every connection between two components of the network, such that for every component $S$ with corresponding input signals $(i_1^C,\dots,i_{r^C}^C)$ and output signals $(o_1^C,\dots,o_{r^C}^{C})$:
$$
(i_1^C, \dots, i_{r^C}^C,o_1^C,\dots,o_{r^C}^C) \in S
$$

### Delays

Whenever we have loops inside of our programs, they can break our models. Because of this we created delays. With this systems, they will return one predetermined output the first time, and then  after that they will return the previous input with a delay of one.

Here we can see a mode formal definition:

For sets $S_0,I, O$ such that $I \subseteq O, S_0 \subseteq O$, the delay with set of initial states $S_0$, inputs $I$ and outputs $O$ is:
$$
\mathcal D_{S_0,I,O} = \{(i,o) / o(0) \in S_0, \forall k \in \N, o(k)= i(k-1)\}
$$
If $I$ and $O$ are clear from the context, we can also denote it as $\mathcal D_{S_0}$

