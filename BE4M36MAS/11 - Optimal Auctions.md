# Optimal Auctions

The Seller's problem is to design an auction mechanism which has a Nash equilibrium giving him the highest possible expected utility.

## Design

Assuming the IPV setting and risk-neutral bidders, each bidder $i$'s valuation is drawn from some strictly increasing cumulative density function $F_i(v)$, having probability density function $f_i(v)$ that is continuous and bounded below.

The risk neutral seller knows each $F_j$ and has zero value for the object. The auction that maximizes the seller's expected revenue subject to individual rationality and Bayesian incentive-compatibility for the buyers is an **optimal auction**.

Auctions can be made with a base or **reserve price**, and bidding the true value is still the dominant strategy.

<img src="Resources/11 - Optimal Auctions/image-20210115121152259.png" alt="image-20210115121152259" style="zoom:33%;" />

The following holds:

- If both bidders are below $R$, then there is no sale. Also if this happens with probability $R^2$ then revenue is $0$.

- If one bid is above the reserve and another one below, the sale is at reserve price $R$. This happens with probability $2(1-R)R$ and the revenue is also $R$.

- If both bids are above the reserve price, then the sale is at the second highest bid and this happens with probability $(1-R)^2$. The revenue in this case is :
  $$
  \text{revenue} = E[\min v_i | \min v_i \ge R]= \frac{1 + 2R}{3}
  $$

Taking all three scenarios into account we can say that the expected revenue is:
$$
\text{expected revenue} = 2(1-R)R^2 + (1-R)^2\frac{1+2R}{3}
$$
And if we want to maximize it, we can select $R =0.5$. At this reserve price we can expect a revenue of $5/12$, while a reserve price of $0$ will lead to $4/12$. This has some tradeoffs:

- You may loose the sale hen both bids are below $0.5$, but the revenue would be very low if you accepted it. This can happen with a probability of $1/4$.
- You may increate the sale price when one bidder has a loss valuation and the other high. This happens with a probability of $0.5$

## Optimal Single Item Auction

In an IPV setting where bidders are risk-neutral, and each bidder $i$'s valuation is drawn from some strictly increasing cumulative density function $F_i(v)$, with a probability density function $f_i(v)$, we define:

- Bidder $i$'s **virtual valuation** as:
  $$
  \psi_i(v_i) = v_i- \frac{1-F_i(v_i)}{f_i(v_i)}
  $$

- Bidder $i$'s **bidder-specific reserve price** as :
  $$
  r_i^*/ \psi_i(r_i^*) = 0
  $$


> The optimal single good auction is a sealed-bid auction in which every agent is asked to declare his valuation. The good is sold to the agent $i = \arg\max_i \psi_i(\hat v_i)$ as long as $v_i > r_i^*$.
>
> If the good is sold, the winning agent $i$ is charged the smallest valuation that it could have declared while still remaining the winner:
> $$
> \inf\{v_i^*:\psi_i(v_i^*) \ge 0 \land \forall j \neq i. \psi_i(v_i^*) \ge \psi_j(\hat v_j)\}
> $$
> 

This can be understood as a second price auction with a reserve price, held in a virtual valuation space rather than the space of actual valuations. The dominant strategy is still to bid truthfully.

There is a symmetric case: the second-price auction with reserve price $r^*$ satisfying:
$$
\psi(r^*) = r^* - \frac{1-F(r^*)}{f(r^*)} = 0
$$
Here the truthful mechanisms is useful only when $\psi(v)$ is non-decreasing.

The second-price sealed bid auction with reserve price is not efficient.

## Remarks

For optimal revenue we must sacrifice some efficiency. Optimal auctions are not detail-free, they require the seller to incorporate information about the bidders' valuation distribution into the mechanism and are rarely used in practice.

We also know thanks to Bulow and Klemperer's theorem that its better to spend energy on attracting more bidders:

> Revenue of an efficiency maximizing auction with $k+1$ bidders is at least as high as that of the revenue-maximizing auction with $k$ bidders.



