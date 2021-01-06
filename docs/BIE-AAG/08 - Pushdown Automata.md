# Pushdown Automata

A pushdown automaton is a 7-tuple $R=(Q,\Sigma,G,\delta,q_0,Z_0,F)$ where:

- $Q$ is a finite set of states.
- $\Sigma$ is a finite input alphabet.
- $G$ is a finite pushdown store alphabet.
- $\delta$ is a mapping function from  $Q\times (\Sigma \cup \{\epsilon\}) \times G^*$ into $Q\times G^*$.
- $q_0 \in Q$ is the initial state.
- $Z_0 \in G$ is the initial pushdown store symbol.
- $F\subseteq Q$ is a set of final states.

The **configuration of a pushdown automaton** $R:(q,w,\alpha) \in Q \times \Sigma^* \times G^*$  where:

- $q$ is the current state.
- $w$ is the yet unprocessed part of the input string.
- $\alpha$ is the pushdown store content.

The initial configuration of the PDA $R$ is:
$$
(q_0,w,Z_0), w\in \Sigma^*
$$
This type of automaton can change their state in two ways:

- The PDA reads the symbol $a$ and moves to a new state, removing the symbol $a$ from the input and the string in the top of the pushdown store it replaced by a new one.
- The PDA transitions into a new state and it changes the pushdown store content without reading any input symbol.

A **move in a pushdown automaton** $R$ is an element of the relation $\vdash_R$. This relation is defined as:

Let $R=(Q,\Sigma,\delta,q_0,Z_0,F)$ be a pushdown automaton and $\vdash_R$ be a relation over $Q\times\Sigma^*\times G^*$ such that:
$$
(q,w,\alpha\beta) \vdash_R (p,w',\gamma\beta) \\\iff\\ w = aw' \land \exists a\in \Sigma \cup\{\epsilon\},w \in \Sigma^*, \alpha,\beta\gamma \in G^* /
(p,\gamma) \in \delta(q,a,\alpha)
$$
We can also define other relations based on $\vdash_R$:

- **$k$-th power of relation $\vdash$**: $\vdash^k$
- **Transitive closure of relation $\vdash$** : $\vdash^+$
- **Transitive and reflexive closure of relation $\vdash$**: $\vdash^*$

## Properties

> Let $P=(Q,\Sigma,G,\delta,q_0,Z_0,F)$ be a PDA. 
>
> If $(q,e,A)\vdash_P^n(q',\epsilon,\epsilon)$ then:
> $$
> \array{(q,w,A\alpha) \vdash_P^n (q',\epsilon,\alpha) &\forall A\in G, \forall \alpha \in G^*}
> $$



> Let $L$ be a language. Then a $P_\epsilon$ PDA exists accepting $L$ by empty pushdown store if there exists a PDA $P_f$ accepting $L$ by a transition into a final state

## Parsing

Given $G=(N,\Sigma,P,S)$ a derivation $S \Rightarrow^* \alpha$  $\alpha \in (N\cup \Sigma)^*$ is called **leftmost derivation** if the leftmost nonterminal symbol is a sentential form is replaced in each step. The **rightmost derivation** is defined in the same way.

A leftmost derivation (or rightmost) corresponds to only one parse tree and vice versa. Therefore there is a linear representation of a parse tree called **parse**.

Given $G=(N,\Sigma,P,S)$, let's assume the rules in $P$ are numbered by $1,2,\dots,|P|$. The **parse of a sentential form** $\alpha$ in $G$ is the sequence of the rule numbers used in the derivation $S\Rightarrow^*\alpha$.

The **left parse of a sentential form** $\alpha$ in $G$ is the sequence of the rule numbers used in the leftmost derivation $S\Rightarrow^*\alpha$. The **right parse of a sentential form is equivalent**.

We can construct the parse tree in two different ways:

- **Top Down (LL)**

  Top-down parsing is the process of finding a left parse of a given sentence in a given grammar.

- **Bottom Up (LR)**

  Bottom-up parsing is the process of finding a right parse of a given sentence in a given grammar.

## Relationship with Context-Free Grammars

> Given a Context-Free Grammar $G=(N,\Sigma,P,S)$ we can create a pushdown automaton $R$ such that:
> $$
> L(G) = L_\epsilon(R)
> $$

From that theorem we can create a PDA (using Top-down parsing) in the following way:
$$
R = (\{q\},\Sigma,N\cup \Sigma,\delta,q,S, \emptyset)
$$
where the mapping function is defined as:

- $\delta(q,\epsilon,A) \leftarrow \{(q,\alpha) : (A \rightarrow \alpha) \in P\}$   $\forall A \in N$
- $\delta(q,a,a) \leftarrow \{(q,\epsilon)\}$    $\forall a \in \Sigma$

The top of the pushdown store for this type of automaton is always on the left.

In a similar way, we can create a PDA using bottom up parsing:
$$
R=(\{q,r\},\Sigma,N \cup \Sigma\cup\{\#\},\delta,q,\#,\{r\})
$$
Where the mapping function is defined as:

- $\delta(q,a,\epsilon) \leftarrow \{(q,a)\}$   $\forall a\in \Sigma$
- $\delta(q,\epsilon,\alpha) \leftarrow \{(a,A):(A \leftarrow \alpha) \in P\}$
- $\delta(q,\epsilon,\#S) \leftarrow \{(r,\epsilon)\}$

Compared to the definition of the pushdown automaton and its configurations, the top of the pushdown store for this type of pushdown automaton is always on the right.

## Deterministic PDA

$R=(Q,\Sigma,G,\delta,q_0,Z_0,F)$ is a **deterministic pushdown automaton** if:

- $|\delta(q,a,\gamma)| \le 1$  $\forall q \in Q,\forall a \in (\Sigma \cup\{\epsilon\}), \forall \gamma \in G^*$
- If $\delta(q,a,\alpha) \neq \emptyset$ and $\delta(q,a,\beta) \neq \emptyset$ and $\alpha \neq \beta$ then $\alpha$ is not a prefix of $\beta$ and vice versa.
- If $\delta(q,a,\alpha) \neq \emptyset$ and $\delta(q,\epsilon, \beta) \ne \emptyset$ then $\alpha$ is not a prefix of $\beta$ and vice versa.

Using the top-down method we can construct a deterministic PDA. To do this we need to prepare our CFG $G$ first. This algorithm takes a CFG $G = (N,\Sigma,P,S)$ where all the rules are in the form:
$$
\array{A \rightarrow a\alpha & a\in \Sigma, \alpha \in (\Sigma\cup N)^*}
$$
And for each two different rules:
$$
\array{A \rightarrow a\alpha  &  B \rightarrow b\beta}
$$
it holds that $a \neq b$

Once we have the correct grammar, we can convert it to the following automaton:
$$
R = (\{q\},\Sigma,N\cup\Sigma,\delta,q,S,\emptyset)
$$
where the mapping function is defined as:

- $\delta(q,a,A) \leftarrow \{(a,\alpha) :(A\rightarrow a\alpha) \in P\}$   $\forall A \in N$
- $\delta(q,a,a) \leftarrow \{(q,\epsilon)\}$   $\forall a \in \Sigma$ 

