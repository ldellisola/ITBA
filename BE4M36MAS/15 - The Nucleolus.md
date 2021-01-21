# The Nucleolus

## Bankruptcy Games

Let $N =\{1,\dots,n\}$ be the set of claimants, the **bankruptcy problem** is a pair $(e,d)$ where $e \ge 0$ is the state and $d=(d_1,\dots,d_n) \in \R_+^n$ are the demands such that:
$$
e \le d_1 + \dots + d_n
$$
A **bankruptcy game ** associated with the bankruptcy problem $(e,d)$ is a coalitional game given by:
$$
\array{v(A) = \max\{e - d(N\setminus A),0\} & A \subseteq N}
$$
Every bankruptcy game is super-modular, which implies that The core $C(v)$ is non-empty and that the Shapley value belongs to $C(v)$.

## The Nucleolus

The nucleolus is an alternative to the Shapley value that also applies to all coalitional games and the idea is that the maximal dissatisfaction of coalitions with an allocation should be minimized.

Let $v$ be a game with $I(v) \neq \empty$, the **nucleolus** of $v$ is the set:
$$
N(v) =\{x \in I(V) : e(x) \preceq e(y), \forall y \in I(v)\}
$$
 The nucleolus is non-empty and has only a single value. Amon its properties, we can find that if the core $C(v)$ is not empty, then the nucleolus is contained within the core, and it also presents efficiency, Symmetry and the Null Player Property.  

The Nucleolus is calculated using the following algorithm:

1. Find $X_1\subseteq I(v)$ minimizing the maximal excess:

   This is done solving the following linear program:
   $$
   \array{\text{minimize}& t_1\\ 
   \text{subject to}& e(A,x) \le t & \empty \neq A \subset N, x \in I(v)}
   $$
   Where $t_1$ is the value of the LP and $X_1 \times \{t_1\}$ is the set of optimal solutions.

   If $X_1$ is a singleton, then $N(v) = X_1$ and exit the algorithm. Else we create the following set:
   $$
   F_1 = \{A\subset N : e(A,x) = t_1, \forall x\in X_1\}
   $$
   

2. We will continue with set $X_{i}, i \ge 2$:

   This is done solving the following linear program:
   $$
   \array{\text{minimize}& t_i\\ 
   \text{subject to}& e(A,x) \le t & A\notin F_{i-1},\empty \neq A \subset N, x \in X_{i-1}}
   $$
   Where $t_i$ is the value of the LP and $X_i \times \{t_i\}$ is the set of optimal solutions.

   If $X_i$ is a singleton, then $N(v) = X_i$ and exit the algorithm. Else we create the following set:
   $$
   F_i = \{A\subset N : e(A,x) = t_i, \forall x\in X_i\}
   $$

3. We increment $i$ and repeat step 2.

The algorithm will stop when $X_k$ is a singleton at step $k \le 2^n$. Each $t_i$ is the $i^{th}$ highest excess, and each $F_i$ is a collection of coalitions with excess $t_i$.

### Excess of a Coalition

The **excess of a coalition** $A \subseteq N$ at allocation $x \in \R^n$ is:
$$
e(A,x) v(A) - x(A) 
$$
 The **excess vector** is defined as:
$$
e(x) = (e(A_1,x),\dots,(A_{2^n},x)) \in \R^{2^n}
$$
Where the coalitions $A_i$ are enumerated from the highest excess such that:
$$
e(A_1,x) \ge \dots\ge e(A_{2^n},x)
$$
The excess vector whose maximal excess is minimal are preferred.

>For every $\alpha,\beta \in \R^m$, we define the following symbols:
>$$
>\alpha \prec \beta \iff \exists k \in \{1,\dots,m\}. \forall j < k. \alpha_j = \beta_j \land \alpha_k < \beta_k\\
>\alpha \preceq \beta \iff \alpha \prec \beta \lor \alpha = \beta
>$$

### Imputations

We seek a lexicographic minimizer of excess vectors $e(x)$ over a set of allocation $x$ in game $v$. The core is not a good choice as a base set because it can be empty. This is why we are defining the set of **imputations** as:
$$
I = \{x\in \R^n : x(N) = v(N) \land \forall i\in N.~ x_i \ge v(i)\}
$$
If the game $v$ is super-additive, the $I(v) \neq \empty$. 