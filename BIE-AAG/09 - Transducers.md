# Transducers

A **formal translation** is a binary relation $Z \subseteq L \times V$ where the domain is the set $L$ and the range is the set $V$. The relation $Z$ maps a set of translations $Z(w) \subseteq V$ to each element $w$ of the set $L$. If $Z(w)$ contains at most one element for every $w\in L$, the set $Z$ is a function and the translation is an **unambiguous translation**. 

Let $\Sigma, D$ be alphabets, an **homomorphism** is every mapping $h$ from $\Sigma$ to $D^*$. The domain of homomorphism $h$ can be extended to $\Sigma^*$ as follows:
$$
\array{
h(\epsilon) = \epsilon\\
h(xa) = h(x)h(a) & \forall x\in \Sigma^*, \forall a \in \Sigma

}
$$
It is basically an injective translation.

A **prefix** and **postfix** notation of an expression $E$:

1. if $E$ is a variable or a constant, then the prefix or postfix notation of $E$ is $E$.
2. If $E$ is an expression of the form $E_1~op~E_2$ where $op$ is a binary operator, then:
   1. $op~E_1'~E_2'$ is a prefix notation of $E$, where $E_1'$ and $E_2'$ are prefix notations of $E_1$ and $E_2$
   2. $E_1''~E_2''~op$ is a postfix notation of $E$, where $E_1''$ and $E_2''$ are postfix notations of $E_1$ and $E_2$.
3. If $E$ is an expression of the form $(E_1)$, then:
   1. $E_1'$ is a prefix notation of $E$, where $E_1'$ is a prefix notation of $E_1$.
   2. $E_1''$ is a postfix notation of $E$, where $E_1''$ is a postfix notation of $E_1$.

## Translation Grammar

A **translation grammar** is $TG = (N,\Sigma,D,R,S)$ where:

- $N$ is a finite set of nonterminal symbols
- $\Sigma$ is a finite set of input symbols
- $D$ is a finite set of output symbols
- $R$ is a finite set of rules in the form $A \rarr \alpha$ where $A \in N$
- $S \in N$ is the starting symbol

For a given $TG$, we say that $\alpha$ derives in one step to $\beta$:
$$
\alpha \Rarr \beta
$$
if $\exists \tau,w,\gamma \in (N \cup\Sigma \cup D)^*,\exists A \in N$:
$$
 \alpha = \tau A w, \beta = \tau \gamma w, (A \rarr \gamma) \in R
$$
We say that $\alpha$ derives $\beta$:
$$
\alpha \Rarr^* \beta 
$$
If $\exists \alpha_1,\dots,\alpha_n \in (N \cup\Sigma\cup D)^*, n\ge1$:
$$
\alpha = \alpha_1 \Rarr\alpha_2 \Rarr \dots \Rarr \alpha_n = \beta
$$
The sequence $\alpha_1,\dots,\alpha_n$ is called **translation derivation** of length $n$ if string $\beta$ from string $\alpha$.

We can also have a **transitive closure** $(\Rarr^+)$ and a **transitive and reflexive closure** $(\Rarr^*)$.

For a translation grammar $TG = (N,\Sigma,D,R,S)$, an **input homomorphism** is defined as:
$$
h^{TG}_i(a) = 
\left\{
\array{
a&\forall a \in \Sigma\cup N\\
\epsilon& \forall a \in D
}
\right.\\
h_i^{TG}(x) = h_i^{TG}(x_1) \times \dots \times h_i^{TG}(x_n),~~\forall x_j\in (\Sigma \cup N \cup D)^*
$$
We can also define an **output homomorphism**:
$$
h^{TG}_0(a) = \left\{\array{\epsilon&\forall a \in \Sigma\\ a& \forall a \in D \cup N}\right.\\h_o^{TG}(x) = h_o^{TG}(x_1) \times \dots \times h_o^{TG}(x_n),~~\forall x_j\in (\Sigma \cup N \cup D)^*
$$
A **translation defined by a translation grammar** $TG = (N,\Sigma,D,R,S)$ is:
$$
Z(TG) = \{(h_i^{YG}(w),h_O^{TG}(w)):w \in (\Sigma \cup D)^*, S \Rarr^*w\}
$$
An **Input translation grammar** $TG$ is a Context-Free Grammar $G_i = (N,\Sigma,P_i,S)$ where $P_i = \{A \rarr h_i(\alpha): (A\rarr \alpha) \in R\}$. An **Output translation grammar** $TG$ is a Context-Free Grammar $G_o = (N,\Sigma,P_o,S)$ where $P_o = \{A \rarr h_o(\alpha):(A\rarr \alpha) \in R\}$

A CFG $G = (N,\Sigma \cup D, R,S)$ is a **characteristic grammar of translation grammar** $TG = (N,\Sigma,D,R,S)$, in the same way, $L(G)$ is the **characteristic language of translation** $Z(TG)$ and $w\in L(G)$ is a **characteristic sentence of pair** $(x,y)$

A **regular translation grammar** is a $TG = (N,\Sigma,D,R,S)$ such that all the rules are of the form:
$$
\array{
A \rarr axB\\
A\rarr ax\\
S\rarr \epsilon
}
$$
Where $A,B \in N, a \in \Sigma, x \in D^*$, and in the case of the last rule, $S$ cannot be in the right side of any other rule.

## Finite Transducers

A finite transducer is a sextuple $FT = (Q,\Sigma,D,\delta,q_0,F)$ where:

- $Q$ is a finite set of states
- $\Sigma$ is a finite set of input symbols
- $D$ is a finite set of output symbols
- $\delta$ is a mapping function from $Q \times (\Sigma \cup\{\epsilon\})$ into a set of finite subsets $2^{Q \times D^*}$
- $q_0 \in Q$ is the start state
- $F \subseteq Q$ is the set of final states

There are two ways to represent the transition function. We will show now an example from the state $S$ with the input symbol $a$ to the state $A$ and output $x$:

- Formal Representation:
  $$
  \delta(S,a) = \{(A,x)\}
  $$

- State Diagram:
  $$
  S \overset {a/x} \rarr |A|
  $$
  

A **configuration of a transducer** $FT = (Q,\Sigma,D,\delta,q_0,F)$ is a triple:
$$
(q,x,y) \in Q \times \Sigma^* \times D^*
$$
The initial configuration is described as $(q_0,x,\epsilon)$. We can also describe the relation $\vdash_{FT}$ in the same way as for the pushdown automata, as well as a move.

A translation if defined by a finite transducer $FT = (Q,\Sigma,D,\delta,q_0,F)$:
$$
Z(FT) = \{(u,v):u \in \Sigma^*, v \in D^*, \exists q \in F, (q_0,u,\epsilon) \vdash_{FT}^*(q,\epsilon,v)\}
$$
The **finite transducer is deterministic** if for all states $q \in Q$ it holds:
$$
\array{
|\delta(q,a)| \le 1 & \forall a \in \Sigma \land \delta(q,\epsilon) = \empty\\
|\delta(q,\epsilon)|\le 1 & \forall a \in \Sigma \land \delta(q,a) = \empty
}
$$

Basically it is deterministic if it has no $\epsilon$-transitions and for each state we can distinguish each exit transition by its input symbol.

## Sequential mapping

A sequential mapping $S$ is a mapping such that:

- It preserves the length of the string.
- If two inputs have the same prefix of length $k$, then the corresponding output has the same identical prefixes of length of at least $k$ characters.

## Mealy/Moore Automaton

A **Mealy Automaton** $M$ is a sextuple $(Q,\Sigma,D,\delta,\lambda,q_0)$ where:

- $Q$ is a finite set of states
- $\Sigma$ is a finite set of input symbols
- $D$ is a finite set of output symbols
- $\delta$ is a mapping function from $Q \times \Sigma$ into $Q$ called **transition function**.
- $\lambda$ is a mapping function from $Q\times \Sigma$ into $D$ called **output function**.
- $q_0 \in Q$ is the start state.

A **Moore Automaton** $M$ is a sextuple $(Q,\Sigma,D,\delta,\lambda,q_0)$ where:

- $Q$ is a finite set of states
- $\Sigma$ is a finite set of input symbols
- $D$ is a finite set of output symbols
- $\delta$ is a mapping function from $Q \times \Sigma$ into $Q$ called **transition function**
- $\lambda$ is a mapping function from $Q$ into $D$ called **output function**.
- $q_0 \in Q$ is the start state

The difference between the Mealy automaton and the Moore Automaton is that the output of the Mealy automaton is decided by the current state and current input, while in the Moore Automaton it is only affected by the current state.

Another difference between this automaton is that for the same input of length $n$, the Moore automaton will output  a string of length $n+1$ while the Mealy automaton will output one with length $n$. This difference is due to the fact that the Moore automaton first output symbol is not meaningful because it does not depend on the input.

The Moore and Mealy automata can be equivalent if the output of the Moore automaton is the same as the output from the mealy automaton if we exclude the first symbol of the Moore's output.  

We can also define an **extended transition function** for both a Mealy and Moore automata as $\hat \delta:Q \times \Sigma^* \mapsto Q$ defined as:
$$
\array{
\hat \delta(q,\epsilon) = q & \forall q \in Q\\
\hat\delta(q,a) = \delta(q,a) & \forall a \in \Sigma, \forall q \in Q\\
\hat \delta (q,ua) = \delta (\hat \delta(q,u),a)& \forall a \in \Sigma, \forall u \in \Sigma ^* , \forall q \in Q
}
$$

### Transformations

For any Moore automaton $M = (Q,\Sigma,D,\delta,\lambda,q_0)$ there exists a Mealy automaton $M'$ with the same number of states such that:
$$
Z(M) = Z(M')
$$
The Mealy automaton is constructed as follows:

- $\lambda'(q,a) \larr \lambda(\delta(q,a))$   $\forall q \in Q, \forall a \in \Sigma$
- $M' = (Q,\Sigma,D,\delta,\lambda',q_0)$

Also, for any Mealy automaton $M'=(Q',\Sigma,D,\delta',\lambda',q_0')$ there exists a Moore automaton $M$ with $|Q'||D|$ states such that:
$$
Z(M') = Z(M)
$$
The Moore automaton is constructed as follows:

- $Q \larr Q' \times D$
- $\delta((q,b),a) \larr (\delta'(q,q),\lambda'(q,a))$   $\forall q \in Q',\forall a \in \Sigma, \forall b\in D$
- $q_0 \larr (q_0',c)$ for some arbitrary fixed $c\in D$
- $\lambda((q,b)) \larr b$    $\forall q \in Q',\forall b \in D$
- $M = (Q,\Sigma,D,\delta,\lambda,q_0)$

## Pushdown Translation Automata

The pushdown translation automaton is an octuple:
$$
\text{PTA} = (Q,\Sigma,G,D,\delta,q_0,Z_0,F)
$$
where

- $Q$ is a finite set of states
- $\Sigma$ is a finite set of input symbols
- $G$ is a finite set of pushdown symbols
- $D$ is a finite set of output symbols
- $\delta$ is a mapping function from $Q\times (\Sigma\cup\{\epsilon\}) \times G^*$ to a set of subsets of $Q\times G^* \times D^*$
- $q_0 \in Q$ is the initial state
- $Z_0 \in G$ is the initial symbol of the pushdown store
- $F \subseteq Q$ is the set of final states 

The configuration of a $\text{PTA} = (Q,\Sigma,G,D,\delta,q_0,Z_0,F)$ is defined as a quadruple:
$$
(q,x,\alpha,y) \in Q \times \Sigma^*\times G^* \times D^*
$$
The moves and transition relation is defined in the same way as it previously was, but it is represented differently. In this example we are going from state $S$, input $a$ and pushdown store symbol $b$ to state $A$, output $x$ and pushing the symbol $c$ into the pushdown store:

-  Formal Representation:
  $$
  \delta(S,a,b) = \{(A,c,x)\}
  $$

- State Diagram:
  $$
  S \overset {a,b/c,x} \longrightarrow |A|
  $$

The translation defined by a $\text{PTA} = (Q,\Sigma,G,D,\delta,q_0,Z_0,F)$ by a move into final state is a set of pairs:
$$
Z(\text{PTA}) = \{(x,y): x \in \Sigma^*, y\in D^*, \exists q \in F,\exists \alpha \in G^*,(q_0,x,Z_0,\epsilon)\vdash^*(q,\epsilon,\alpha,y)\}
$$
The translation defined by a $\text{PTA} = (Q,\Sigma,G,D,\delta,q_0,Z_0,F)$ by a move into configuration with empty pushdown store is a set of pairs:
$$
Z_\epsilon(\text{PTA}) = \{(x,y): x \in \Sigma^*, y\in D^*, \exists q \in Q,(q_0,x,Z_0,\epsilon)\vdash^*(q,\epsilon,\epsilon,y)\}
$$
A **pushdown translation automaton is deterministic** if the following holds for$\text{PTA} = (Q,\Sigma,G,D,\delta,q_0,Z_0,F)$:

- $|\delta(q,a,\gamma)| \le 1$   $\forall q \in Q,\forall a \in (\Sigma\cup\{\epsilon\}),\forall \gamma \in G^*$
- If $\delta(q,a,\alpha) \neq \empty \land \delta(q,a,\beta)\neq \empty \land \alpha \neq \beta$, then $\alpha$ is not a prefix of $\beta$ and vice versa.
- If $\delta(q,a,\alpha) \neq \empty \land \delta(q,\epsilon,\beta)\neq \empty$, then $\alpha$ is not a prefix of $\beta$ and vice versa.

We can also convert translation grammars into pushdown translation automata such that:
$$
Z_\epsilon(PTA) = Z(TG)
$$
For a given $TG = (N,\Sigma,D,R,S)$ we can construct
$$
PTA = (\{q\},\Sigma,N,N\cup \Sigma\cup D,D,\delta,q,S,\empty)
$$
where:
$$
\array{
\delta(q,\empty,A) \larr \{(q,\alpha,\epsilon):(A\rarr \alpha)\in R\}& \forall A\in N\\
\delta(q,a,a) \larr \{(q,\epsilon,\epsilon)\}& \forall a \in \Sigma \\
\delta(q,\epsilon,b) \larr \{(a,\epsilon,b)\} & \forall b \in D
}
$$
