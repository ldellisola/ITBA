# Regular Expressions

A *Regular Expression* $V$ over the alphabet $\Sigma$ is defined as:

1. $\empty,\epsilon,a$ are regular expressions for all $a\in \Sigma$.

2. If $x,y$ are regular expressions, then the result of the following operations is a regular expression over $\Sigma$:
   $$
   \array{
    (a) &&(x+y) && (\text{union, alternation}) \\
    (b) && (x.y) && (\text{concatenation}) \\
    (c) && (x)^* && (\text{Kleene star})
   }
   $$

The **value $h(x)$** of a regular expression $x$ is defined as follows:

1. $h(\empty) = \empty, h(\epsilon)=\{\epsilon\}, h(a) = \{a\}, a\in \Sigma$
2. $h(x+y) = h(X) \cup h(y)$
3. $h(x.y) = h(x).h(y)$
4. $h(x^*) = (h(x))^*$

Two regular expressions $x,y$ are **identical** $(x \equiv y)$ if $x$ and $y$ are exactly the same string of symbols.

Two regular expressions $x,y$ are **equivalent** $(x = y)$ if $x$ and $y$ have the same value $(h(x) = h(y))$.

Two regular expressions $x,y$ are **similar** $(x \tilde{=} y)$ if $x$ and $y$ can be converted into each other using the following identities:
$$
\array{
A_1 &&x+x = x\\
A_2 && x + y = y + x \\
A_3 && (x + y) + z = x + (y+z) \\
A_4 && x + \empty = x \\
A_5 && x.\empty = \empty.x = \empty \\
A_6 && x.\epsilon = \epsilon . x = x
}
$$

## Properties

Let $x,y,z$ be regular expressions, it holds that:
$$
\array{
P_1 && x + (y+z) = (x+y) + z && (\text{associativity of union}) \\
P_2 && x + y = y + x && (\text{commutativity of union})\\
P_3 && x + \empty = x && (\text{$\empty$ is the identity of the union})\\
P_4 && x + x = x && (\text{idempotence of union})\\
P_5 && x.(y.z) = (x.y).z && (\text{associativity of concatenation}) \\
P_6 && \epsilon.x = x.\epsilon = x && (\text{$\epsilon$ is the identity of concatenation})\\
P_7 && \empty.x = x.\empty = \empty && (\text{$\empty$ is the null element of concatenation}) \\
P_8 && x.(y + z) = x.y + x.z && (\text{left distributivity})\\
P_9 && (y + z).x = y.x + z.x && (\text{right distributivity})\\
P_10 && x^* = \epsilon + x^*x \\
P_11 && x^* = (\epsilon + x)^*\\
P_12 && \\
}
$$

## Theorems

Let $x,y,z$ be regular expressions:
$$
\array{
V_1 && x = x.y + z \Rightarrow x = z.y^* && (\text{solution of left regular equation}) \\
V_2 && x = y.x + z \Rightarrow x = y^*.z && (\text{solution of rigth regular equation}) \\
V_3 &&  \empty^* = \epsilon\\
V_4 &&  x^* + x = x^*\\
V_5 &&  (x^*)^* = x^*\\
V_6 &&  (x+y)^* = (x^*.y^*)*\\
V_7 &&  x^*.y = y + x^*.x.y \\
V_8 &&  x^*.y = y + x.x^*.y \\
V_9 &&  x^*.y = x.x^* = x^*, \text{if } \epsilon \in h(x) \\
V_10 && (x.y)^*.x = x.(y.x)^* \\
V_11 && (x+y)^* = (x^* + y^*)^* \\
}
$$

## Regular Equations

The standard system of regular equations ahs the following form:
$$
X_i = \alpha_{i0}+\alpha_{i1}X_1 + \dots +\alpha_{in}X_n\\
1 \le i \le n
$$
Where $X_1,\dots,X_n$ are variables and $\alpha_{ij}$ are regular expressions over the alphabet $\Sigma$, which does not contain $X_1,\dots,X_n$.

To solve this systems we need to rewrite the equations as:
$$
X_i = \alpha_i X_i + \beta_i
$$
with $\alpha_i = \alpha_{i1}$ and $\beta_i = \alpha_{i0} + \sum_{k\le n \land k\neq i} \alpha_{ik} X_k$

And start replacing them.

## Derivatives

We can say that the intuitive version of the derivative of a regular expression $V$ with respect to an string $x \in \Sigma^*$ is:
$$
h\left(\frac{\partial V}{\partial x}\right) = \{y : xy \in h(V)\}
$$
 The actual definition for this operation is:

<img src="Resources/04 - Regular Expresions/image-20201027200821403.png" alt="image-20201027200821403" style="zoom:50%;" />

## Integrals

The integral is defined in a similar way as the derivative. We can say that the intuitive version of the integral of a regular expression $V$ with respect to an string $x \in \Sigma^*$ is:
$$
h\left(\int V d x\right) = \{ xy : y \in h(V)\}
$$
 The actual definition for this operation is:

<img src="Resources/04 - Regular Expresions/image-20201027201118704.png" alt="image-20201027201118704" style="zoom:50%;" />

## Relation Between Grammar, Automata and Regular Expression

According to **Kleene's Theorem**, we can say that a language over an alphabet is regular if it can be accepted by a finite automaton.

We can convert regular Grammars to Nondeterministic Finite automata with the following algorithm:

<img src="Resources/04 - Regular Expresions/image-20201027201452992.png" alt="image-20201027201452992" style="zoom:50%;" />

In the same way, we can use the following algorithm to revert that action:

<img src="Resources/04 - Regular Expresions/image-20201027201554845.png" alt="image-20201027201554845" style="zoom:50%;" />

