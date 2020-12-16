# Games in Extensive Form

We can represent very dynamic games such as poker with normal-form representation, but because we have to reflect all possible situations, this situation will grow exponentially.

Here we will use extensive-form representation in the form of a tree (for finite games):

<img src="Resources/07 - Games in Extensive Form/image-20201028165109677.png" alt="image-20201028165109677" style="zoom:50%;" />

The formal definition for **extensive-form games** is contains:

- Any number of players $\mathcal N = \{1,\dots,n\}$
- Actions $\mathcal A$
- Choices nodes, also known as histories $\mathcal H$
- Action functions $\chi:\mathcal H \rightarrow 2^{\mathcal A}$
- Player functions $\rho:\mathcal H \rightarrow \mathcal N$
- Terminal nodes $\mathcal Z$
- Successor functions $\varphi: \mathcal {H\times A \rightarrow H \cup Z}$
- Utility function $u= (u_1,\dots,u_n); u_i :\mathcal {Z \rightarrow \R}$

A pure strategy of player $i$ in an EFG is an assignment of an action for each state where $i$ acts:
$$
S_i := \prod_{h\in \mathcal H, \rho(h) =i} \chi(h)
$$
And now we'll try to identify the actions and strategies in following fame:

<img src="Resources/07 - Games in Extensive Form/image-20201028170442790.png" alt="image-20201028170442790" style="zoom:50%;" />
$$
\mathcal A_1 = \{2-0,1-1,0-2\}\\
\mathcal S_1 = \{2-0,1-1,0-2\}\\
\mathcal A_2 = \{\text{no},\text{yes}\}\\
\mathcal S_2 = \{(\text{no,no,no}), (\text{no,no yes}),\dots,(\text{yes,yes,yes})\}
$$
We can also replace the function $\chi$  by multiplying actions so that an action can be applied only in a single state:
$$
\mathcal A_2 = \{\text{no}_{\{2-0\}},\text{yes}_{\{2-0\}}, \text{no}_{\{1-1\}},\dots,\text{yes}_{\{0-2\}}\} \\
\mathcal S_2 = \{(\text{no}_{\{2-0\}},\text{no}_{\{1-1\}},\text{no}_{\{0-2\}}), \dots,(\text{yes}_{\{2-0\}},\text{yes}_{\{1-1\}},\text{yes}_{\{0-2\}}) \}
$$

## Nash Equilibria

Not all Nash strategies are entirely *sequentially rational* in EFGs. Off the equilibrium path, the players may use irrational actions. We use refinements of NE in EFGs to avoid this. The best known is **Subgame-perfect equilibrium**.

Given a perfect-information extensive-form game $G$, the **subgame** of $G$ rooted at the node $h$ is the restriction of $G$ to descendants of $h$. The set of subgames of $G$ consists of all of subgames of $G$ rooted at the same node in $G$.

A **subgame-perfect equilibrium** of a game $G$ are all the strategy profiles $s$ such that for any subgame $G'$ of $G$ the restriction of $s$ to $G'$ is a Nash equilibrium of $G'$.

Every EFG with perfect information has at least one Nash equilibria in pure strategies that is also subgame-perfect equilibrium.

## EFG with Chance

Now we will introduce a new player called *chance* or *nature* that plays using a fixed randomized strategy. Its formal definition is quite similar to the regular EFG with some variations:

- Any number of players $\mathcal N = \{1,\dots,n\} \cup \{c\}$ 
- Actions $\mathcal A$
- Choices nodes, also known as histories $\mathcal H$
- Action functions $\chi:\mathcal H \rightarrow 2^{\mathcal A}$
- Player functions $\rho:\mathcal H \rightarrow \mathcal N$
- Terminal nodes $\mathcal Z$
- Successor functions $\varphi: \mathcal {H\times A \rightarrow H \cup Z}$
- Stochastic transitions $\gamma:\Delta \{\chi(h) / h \in \mathcal H, \rho(h) = c\}$
- Utility function $u= (u_1,\dots,u_n); u_i :\mathcal {Z \rightarrow \R}$

## EFG with Imperfect information

When players are not able to observe the state of the game perfectly, we talk about *imperfect information games*. The states that are not distinguishable to a player belong to a single information set. They are defined as:

- $\mathcal {G = (N,A,H,Z,\chi.\rho,\varphi,\gamma,u)}$  is a perfect information EFG.
- $\mathcal{ I = (I_1,I_2,\dots,I_n)}$ where $\mathcal I_i$ is a set of equivalence classes on choice nodes of a player $i$ with the property that $\rho(h) = \rho(h')$ and $\chi(h) = \chi(h')$ whenever $h,h' \in I$ for some information set $I \in \mathcal I_i$.
- We can use $\chi(I)$ instead of $\chi(h)$ for some $h\in I$

<img src="Resources/07 - Games in Extensive Form/image-20201028174819008.png" alt="image-20201028174819008" style="zoom:50%;" />

Here we have the following Actions and Strategies:
$$

\array{
\mathcal A_1 = \{2-0,1-1,0-2\}\\
\mathcal S_1 = \{2-0,2-2,0-2\}\\
\mathcal A_2 = \{\text{yes},\text{no}\}\\
\mathcal S_2 = \{\text{yes},\text{no}\}
}
$$
There are no guaranties that a pure NE exists in imperfect information games. But every finite game can ge represented as an EFG with imperfect information. 

## Other Strategies

There are other strategies in EFGs, the most known one being **behavioral strategies**. A behavioral strategy of player $i$ is a product of probability distributions over actions in each information set:
$$
\beta_i : \prod_{I\in \mathcal I_I} \Delta(\chi(I))
$$
There is a broad class of imperfect-information games in which the expressiveness of mixed and behavioral strategies coincide. They are called **perfect recall games**. In this games no player forgets any information he previously know in this games.

Player $i$ has **perfect recall** in an imperfect-information game $G$ if for any two nodes $h,h'$ that are in the same information set for player $i$, for any path $h_0,a_0,\dots,h_n,a_n,h$ from the root of the game tree to $h$ and for any path $h_0,a_0',h_m',a_m',h'$ from the root to $h'$ it must be the case that:

- $n=m$
- $\forall j, 0\le j\le n, h_j$ and $h_j'$ are in the same equivalence class for player $i$
- $\forall i, 0 \le j \le n$ if $\rho(h_j) = i $ then $a_j = a_j'$

We say that EFG has a perfect recall if all players have perfect recall. Otherwise the game has **imperfect recall**.



