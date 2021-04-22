# Combinatorial Auctions

Combinatorial Auctions are used to sell bundles of goods. Let $G= \{g_1,\dots,g_n\}$ be a set of items to be auctioned, the valuation function $v_i:2^G \mapsto \R$ indicates how much a bundle is worth to agent $i$. We typically assume the following properties:

- Normalization: 
  $$
  v(\empty) = 0
  $$

- Free Disposal:
  $$
  G_1 \subseteq G_2 \implies v(G_1) \le v(G_2)
  $$

This type of auctions are interesting with the valuation function is not additive. There are two main types of  non-additivity:

- **Substitutability**: The valuation function $v$ exhibits substitutability if there exists two sets of goods for whom the sum of their individual valuations is greater than the valuation of the union of both sets:
  $$
  \exists G_1,G_2 \subseteq G. G_1 \cap G_2  = \empty \land v(G_1 \cup G_2) < v(G_1) + v(G_2)
  $$
   If this condition holds, then we say the function $v$ is sub-additive. A good example of this are two different brands of TVs.

- **Complementarity**: The valuation function $v$ exhibits complementarity if there are two sets of goods such that the valuation of the union of both sets is greater than the sum of the individual valuations:
  $$
  \exists G_1,G_2 \subseteq G. G_1 \cap G_2  = \empty \land v(G_1 \cup G_2) > v(G_1) + v(G_2)
  $$
  If this condition golds, then we say that the valuation function $v$ is super-additive. A good example of this are left and right shoes.

Selling goods with non-additive valuations is different than normal goods. We have 3 different options:

1. Ignore valuation dependencies and sell sequentially via a sequence of independent single-item auctions. The problem here is that a bidder may bid aggressively for a set of goods hoping to win a bundle but ends not winning all the wanted items.
2. Run separate but connected single-item auction simultaneously. The bidder bids in one auction eh has a reasonably good indication of what is transpiring in the other auctions of interest.
3. Combinatorial Auction. Bid directly on a bundle of goods.

## Allocations

Allocation is a list of sets $G_1,\dots,G_n \subseteq G$, one for each agent $i$ where no good is allocated to more than one agent. We have different ways to choose an allocation for a combinatorial auction, but the simplest one is to maximize social welfare:
$$
U(G_1,\dots,G_n,v_1,\dots,v_n) = \sum_{i=1}^{n} v_i(G_i)
$$

### Simple Combinatorial Auction Mechanism

This mechanism determines the social welfare maximizing allocation and then charges the winners their bid for the bundle they have won.

## VCG Auction

A **Vickrey-Clarke-Groves (VCG) auction** is a type of sealed-bid auction of multiple items. The auction system assigns the items in a socially optimal manner, by charging each individual the harm they cause to other bidders.

The VCG auction is an analogy to the second-price sealed bid single-unit auctions but for combinatorial settings and the dominant strategy is still being truthful and it is efficient.

In a VCG auction the payments are calculated as follows:

Let $V^*$ be the total value of the optimal allocation, and for each bidder $i$ let $V^*_{-i}$ be the total value of the optimal allocation when $i$ does not participate. Let $V_I$ be the value of $i$'s winning subset, losing bidders pay $0$ and the payment made by each winning bidder is:
$$
p_i = V_i - (V^* - V^*_{-i})
$$

## The Winner Determination Problem

The **winner determination problem** for combinatorial auctions, given the agents' declared valuations $\hat v_i$ is to find the social welfare-maximizing allocation of goods to agents. This problem can be expressed as the following integer linear program:
$$
\array{
\text{maximize}& \sum_{i\in N}\sum_{Z \subseteq \mathcal Z} \hat v_i(Z) x_{Z,i}\\
\text{subject to:}&&\\
&\sum_{Z,j\in Z} \sum_{i\in N} x_{Z,i} & \forall j \in \mathcal Z\\
& \sum_{Z \subseteq \mathcal Z}x_{Z,i} & \forall i \in N\\
& x_{Z,i} = \{0,1\} & \forall Z\subseteq \mathcal Z,i\in N
}
$$
This problem is equivalent to the set packing problem, which is NP-Complete and it cannot be approximated uniformly to a fixed constant. We can solve this issue one of two wats:

- Limit to instance where polynomial-time solutions exist. To do this we can relax our requirements and solve the program as a regular linear program, The solution is guaranteed to be integral when the constraints matrix is unimodular. Here are some good examples on when to implement this:

  <img src="Resources/12 Combinatorial Auctions/image-20210116111043991.png" alt="image-20210116111043991" style="zoom:33%;" />

- Use heuristic methods that drop the guarantee of polynomial runtime, optimality, or both. Incomplete methods do not guarantee to find the vest possible solution, but we can be sure that the solution is within $1/\sqrt k$ of the optimal solution, where $k$ is the number of goods.

  This methods work well in practice, making it possible to solve large auctions.

## Bid Representation

We have another problem, how do we encode the bid in a succinct (polynomial-size) form? Here there is a debate between expressivity and conciseness. 

<img src="Resources/12 Combinatorial Auctions/image-20210116113949068.png" alt="image-20210116113949068" style="zoom:33%;" />

### Atomic Bids

In this case the bidders only bid for one particular subset of goods. An atomic bid is a pair $(S,p)$ indicating that the agent is willing to pay price $p$ for the subset of goods $S$. This representation has very limited expressive power and is not even even a basic additive valuation can be represented.

### OR Bids

OR bids are more expressive than atomic bids. They are a disjunction of atomic bids:
$$
(S_1,p_1) \lor \dots \lor(S_m,p_m)
$$
that  indicate that the agent is willing to pay price $p_i$ for the subset of goods $S_i$. We interpret OR as an operator for combining valuation functions. Let $V$ be the space of possible valuation functions, and $v_1,v_2\in V$ be arbitrary valuations:
$$
(v_1 \lor v_2)(S) = \max_{R,T\subseteq S, R\cap T = \empty} (v_1(R) + v_2(T))
$$
OR bids can express additive valuations but are still quite limited, according to the following theorem:

> OR bids can express all valuation function that exhibit no substitutability

We can simulate the effect of XOR by allowing bids to include dummy items. This is possible with the **OR$^*$ bid language**, given a set of dummy items $G_i$ for each agent $i\in N$, an OR$^*$ bid is a disjunction of atomic bids:
$$
(S_i,p_m) \lor \dots \lor (S_m,p_m)
$$
where for each $l=1,\dots,m$ , the agent is willing to pay price $p_l$ for the set of items $S_l \subseteq G \cup G_i$. OR$^*$ can express all bids and is more concise that OR, XOR and their combinations.

### XOR Bids

XOR Bids are more powerful and they are the result of an exclusive OR of atomic bids:
$$
(S_1,p_1) \oplus \dots \oplus (S_m,p_m)
$$
And it indicates that the agent is willing to accept only one of the atomic bids. The operator is defined on the space of valuation functions, and $v_1,v_s \in V$ be arbitrary valuation functions:
$$
(v_1 \oplus v_2)(S) = \max(v_1(S),v_2(S))
$$

> XOR bids can represent all possible valuation functions, but not every valuation function can be represented efficiently by XOR bids.

