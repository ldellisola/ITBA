# Auctions

An **auction** is a protocol that allows agents (bidders) to indicate their interest in one or more resources and that uses these indications of interest to determine both an allocation of the resources and a set of payments by the agents.

Auctions can be described as mechanisms with money that employ cardinal preferences to express interest. They can also be viewed as games of a specific structure.

Auctions are a good way for the market to dynamically asses the price of a good and they are also flexible to any object type that can be allocated. Revenue-maximizing and efficient allocations are achievable.

## Rules

Auctions are structured negotiations governed by auction rules, meaning the rules of the game. There are three types of rules:

- **Bidding rules**: This set of rules talk about how the offers are made, by whom, when and their content.
- **Clearing rules**: These rules decide who gets which goods and what money changes hands.
- **Information rules**: It discusses what information about the state of the negotiation is revealed to whom and when.

## Payoff

An agents payoff for participating in an auction is determined by the result of the auction. The payoff is calculated as:
$$
\text{payoff} = 
\left\{
\array{
\text{valuation of the item} - \text{price paid } & \text{won}
\\
\text{0} &\text{lost}
}
\right.
$$
Agents can also have different **risk attitudes**:

- **Risk Neutrality**: the payoff is a linear function as we calculated before.
- **Risk Seeking**: the payoff is a convex function of the difference, aggressively seeking high gains.
- **Risk Aversion**: The payoff is a concave function of the difference, where ensuring at least some gains is prioritized.  

There are also 2 valuation models for agents:

-  **Independent Private Value (IPV)**: Here an agent's valuation of a good is independent from the other agent's valuation of the same good.
- **Correlated Value**: The valuation of the good is related between agents. An example of this situation is when the winner is planning to resell the items later.

## Types of Auctions

There are several different types of auctions, their difference can be in the quantity or composition of the items, whether agents are buying or selling (or both), etc.

### Single Item Auctions

There are different types of single item auctions:

- **English Auction**: Here, the auctioneer start the bidding at a reservation price and the bidders will shout out ascending prices with minimum increments. Once the bidders stop shouting, the highest bidder gets the good at that price. 
- **Japanese Auction**: The overall mechanism is similar to the English auction but there all bidders start standing up while the auctioneer calls out the prices, when the price reaches a level they are not willing to pay, they sit down. The last bidder standing wins the auction.
- **Dutch Auction**: This auction starts up at  high price and it starts descending with a timer. The first person who claims the lot wins the auction and pays the price. This is a good method when goods need to be sold quickly. No information is revealed during the auction.
- **First-Price Sealed Auction**: All bidders write down their bids in a piece of paper. The auctioneer awards the good to the highest bidder and has to pay for his bid.
- **Second-Price Sealed Auction**: Similar to the first-price version, all bidders write their bids in a piece of paper and the auctioneer awards the good to the highest bidder. The difference now is that the winner has to pay the second highest bid.

## Analyzing Auctions

Auction analysis is useful to solve two problems:

- **Analysis of Auction Mechanisms**: It is useful to determine the properties of a given auction mechanism. To do this, we need to treat the auction as an extended-form Bayesian Game and analyze bidder's strategies.
- **Design of Auction Mechanisms**: It is useful when we need to create an auction with some specific properties and we apply mechanisms design techniques.

### Bayesian Games

A Bayesian Game is a tuple
$$
<N,A,O,p,u>
$$
where:

- $N$ is the set of players
- $A = A_1 \times \dots \times A_n$, where $A_i$ is the set of actions for player $i$
- $O = O_1 \times\dots\times O_n$ where $O_i$ is the type space of player $i$
- $p:O \mapsto[0,1]$ is a common prior over types
- $u = (u_1,\dots,u_n)$ where $u_i:A \times O\mapsto \R$ is the utility function of player $i$

We assume that all of the above is common knowledge among players and that each agent know his own type. In this game we have a **Bayes-Nash Equilibrium** where rational, risk-neutral players are seeking to maximize their expected payoff, given their beliefs about the other players' types.

#### Relation to Auctions

We can formulate a sealed bid auction as a Bayesian game where:

- Player $i$'s actions correspond to his bids $\hat v_i$
- Player types $O_i$ correspond to players' private valuations $v_i$ over the auctioned items
- The payoff of player $i$ corresponds to their valuation minus the paid price or 0 if they lose.

We can formulate similar analogies with more complicated auction mechanisms.

#### Desired Properties

- **Truthfulness**: bidders are incentivized to bid their true valuations:
  $$
  \array{v_i = \hat v_i && \forall i \forall v_i}
  $$

- **Efficiency**: The aggregated value of bidders is maximized:
  $$
  \array{ \sum_i v_i(x) \ge \sum_i v_i(x') && \forall v \forall x,x',}
  $$

- **Optimality**: It maximizes the seller's revenue.

- **Strategy**: Existence of a dominant strategy.

- **Manipulation vulnerability**: we must minimize collusion, lying, cheating, etc.

### Second-price Sealed Bid

In this type of auction, truth-telling is a dominant strategy, assuming independent private values. This auction has the following advantages:

- Truthful bidding is a dominant strategy
- No incentive for counter-speculation.
- Computational efficiency

But it also has its own disadvantages:

- Lying auctioneer
- Bidder collusion self-enforcing
- Reveals true valuations
- Not revenue maximizing

### First-Price Sealed Bid

The Dutch auction and the first-price sealed bid are strategically equivalent. The agents bid without knowing about the other agents' bids. The only difference between these auctions is that the first-price auctions are held asynchronously and the Dutch auctions are fast.

In this case there is a trade-off between the probability of wining and the amount paid upon wining. Here there is not dominant strategy because individually optimal strategies depend on the assumption about others' valuation.

In a first-price sealed bid auction with $n$ risk-neutral agents whose valuations $v_1,\dots,v_n$ are independently drawn from a uniform distribution on the same bounded interval of real numbers, the unique symmetric equilibrium is given by the strategy profile:
$$
\left(\frac{n-1}{n}v_1 , \dots,\frac{n-1}{n}v_n \right)
$$
 For non-uniform valuation distributions, each bidder should bid the expectation of the second-highest valuation, conditioned on the assumption that their own valuation is the highest.

Here we have incentives to counter-speculate.

### English and Japanese Auctions

Within this two types of auctions, their strategy space is much more complicated, but intuitively the revealed information does not make any difference in the independent-private value setting.

Under the IPV model, it is a dominant strategy to bid up to their own valuations and not more. In correlated-value auctions it can be worthwhile to counter-speculate.

### Revenue Equivalence

Up to some extent, the type of auction an auctioneer chooses doesn't have a big effect on profit. 

> Assuming that each of $n$ risk-neutral agents has an independent private valuation for a single good at auction, drawn from a common cumulative distribution $F(v)$ that is strictly increasing and atomless on $[\underline v,\overline v]$. Then the any auction mechanism in which both items hold
>
> 1. The good will be allocated to the agent with the highest valuation
> 2. Any agent with valuation $\underline v$ has an expected utility of zero
>
> Yields the same expected revenue, and hence results in any bidder with valuation$v$ making the same expected payment.

Informally, as long as two mechanisms allocate in the same way and they don't charge anything to the agent with the lowest valuation, the rest of the payment functions is the same. This holds beyond IPV and a single good.

### Efficiency

Efficiency in a single-item auction is measured as the item allocated to the agent with values it the most. With IPV all auctions are efficient except for Dutch and First-Price Sealed Bid. When we change to correlated value, the efficiency is often lost.