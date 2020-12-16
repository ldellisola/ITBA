# Solving EFGs

## Strategies with Imperfect Information

There are no guarantees that a pure NE exists in imperfect information games but every finite game can be represented as an EFG with imperfect information.

Backward induction does not work here, because there's a dependence between the information sets. Our only options are solve an EFG as a normal-form game or to convert them to sequence form and solve it using linear programing.

## Linear Programming 

The algorithms that run on linear programming can't accept game trees, that's why we need to convert them to **sequence form**. An ordered list of actions of player $i$ executed from the room of the game tree to some node $h \in \mathcal H$ is called a sequence $\sigma_i$. The set of all possible sequences of plater $i$ is denoted as $\Sigma_i$.

Here's an example of sequence form:

<img src="Resources/08 - Solving EFGs/image-20201028200937274.png" alt="image-20201028200937274" style="zoom:50%;" />

We need to extend the utility function to operate over this sequences:
$$
g:\Sigma_1 \times \Sigma_2 \rightarrow \R/
g(\sigma_1,\sigma_2) = 
\left\{
\array{
u(z) && \text{if $z$ corresponds to a leaf represented by  sequences $\sigma_1$ and $\sigma_2$ }
\\
0	&& \text{otherwise}
}
\right.
$$
There are games with chance a combination of sequences can lead to multiple nodes/leafs. For these cases we will define our utility function as:
$$
g(\sigma_1,\sigma_2) = 
\left \{
\array{
\sum_{z\in\mathcal Z'} \mathcal C(z)u(z) & \text{if $\mathcal Z'$ is a set of leafs that correspond to history}\\
&\text{ represented by the sequences $\sigma_1$ and $\sigma_2$, and}\\
&\text{$\mathcal C(z)$ represents the probability of leaf $z$ being reached}\\
0 & \text{otherwise}

}\right.
$$

### Realization plans

We need to express a mixed strategy using sequences,and we need to prepare for all possible situations. A **realization plan** $(r_i(\sigma_i))$ is a probability that sequence $\sigma_i$ will be played assuming player $-i$ plays such actions that allow actions from $\sigma_i$ to be executed.