# Probabilistic Transition Systems

Probabilistic Transition Systems are modeled by Markov Chains. This transition systems have:

- A set of states $S$
- An initial distribution $S_0:S\rarr[0,1]/\sum_{s\in S} S_0(s) = 1$
- A transition probability matrix $R: S\times S \rarr [0,1]/ \forall s\in S. \sum_{s'\in S} R(s,s')=1$

In the graphical representation, if there is not edge between the nodes, then they have a zero transition probability.

Here we will define a **path** as any sequence of states. This paths have an associated probability. If the path is finite, we can define it as:
$$
\mathcal P_{(S,S_0,R)}(s_0,\dots,s_{n-1}) = S_0(s_0) \prod_{i\in\{1,\dots,n-1\}}R(s_{i-1},s_i)
$$
We can use a shortcut for the notation such a:
$$
\mathcal P() \equiv \mathcal P_{(S,S_0,R)}()
$$


If we need to calculate the probability of infinite paths, we need to use probability measurement methods.

We call **cylinder** $C_{s_0,\dots,s_{n-1}}$ to the set of paths with prefix $s_0,\dots,s_{n-1}$. We assign the symbol $C.$ to the set of all paths. The probability of a cylinder is defined as:
$$
\mathcal P_{(S,S_0,R)}(C_{s_0,\dots,s_{n-1}})= \mathcal P_{(S,S_0,R)}(s_0,\dots,s_{n-1})
$$
We can extend the probability measure from sets to all sets of paths:
$$
\array{
\mathcal P(\empty) = 0\\
\mathcal P(\Sigma_S) = 1 \\
\mathcal P(A\cup B) = \mathcal P(A) + \mathcal P(B) \iff A \cap B = \empty
}
$$

## Temporal Logic

In Probabilistic transition systems, whenever we want to check if a model fulfills a given set of properties we can do it like this:
$$
\mathcal P_{(S,S_0,R)}(\phi) = \mathcal P_{(S,S_0,R)}(\{\pi \in \Sigma_S: \pi \models \phi \land \pi(0) = S_0\})
$$
This can be translated into 
$$
\mathcal P_{(S,S_0,R)}(\phi) = \sum_{s\in S} S_0(s) \times \mathcal P_{(S,s,R)}(\phi)
$$
The idea for computing LTL formulas is to follow this 3 steps:

1. $\mathcal P_{(S,s',R)} (\phi)$  $s'\in S$ for formulas $\phi$ without any temporal operators and then continue to the following step recursively.

2. 
   $$
   \array{
   \mathcal P_{(S,s',R)}(X\phi)& s'\in S\\
   \mathcal P_{(S,s',R)}(F\phi)& s'\in S\\
   \mathcal P_{(S,s',R)}(\neg\phi)& s'\in S\\
   \text{from }\mathcal P_{(S,s',R)}(\phi) &s'\in S\\
   }
   $$

3.  $\mathcal P_{(S,s_0,R)}(\phi)$  from $\mathcal P_{(S,s',R)}(\phi), s'\in S$

Logical operators work in the following way:
$$
\array{
\mathcal P(\neg \phi) & \Rarr & 1- \mathcal P(\phi)\\
\mathcal P(\phi \lor \gamma) &\Rarr & \mathcal{P(\phi) + P(\gamma)}\\
\mathcal P(\phi \land \gamma)& \Rarr & \mathcal{P(\phi) \times P(\gamma)}
}
$$
And for temporal operators:
$$
\array{
\mathcal P(F \phi) & \Rarr & \left\{\array{1& s \models \phi \\\sum_{s'\in S}R(s,s')\mathcal P_{(S,s',R)}(F\phi)&s\not\models \phi}\right.  \\
\mathcal P(G\phi) & \Rarr & \mathcal P(\neg F\neg \phi) \\
\mathcal P(X \phi) & \Rarr & \sum_{s'\in S}R(s,s')\mathcal P_{(S,s',R)}(\phi)
}
$$
In general LTL can be handled as a recursive combination of operators from the following formula:
$$
\mathcal P_{(S,S_0,R)} = \sum_{s'\in S} R(s_0,s') \times \mathcal P_{(S,s',R)}(\phi)
$$


## Expected Cost

The **cost of a finite path** is defined as:
$$
c(s_0,\dots,s_n) = \sum_{i\in \{0,\dots,n-1\}} c(s_i)
$$
And, for **the cost of the property $Fp$ on path $\pi$**:
$$
c_\pi(Fp) =
\left\{
\array{
c(s_0,\dots,s_n) & \pi \models Fp\\
\infty & \text{else}
}

\right.
$$
Where $s_0,\dots,s_n$ is the prefix of $\pi$ with $s_0 \not \models p ,\dots, s_n \not\models p$ 

We can calculate the **expected cost of a property** as:
$$
E(Fp) = \sum_{(s_0,\dots,s_n) \in \Sigma_S} c(s_0,\dots,s_n) \mathcal P(s_0,\dots,s_n)
$$
