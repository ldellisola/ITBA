# Game Theory

In Game theory, we need to specify a few details about the games:

- **Who** is playing? The agents that are involved in the game.
- **What** are the actions? and how do the agents know what action to use.

In this section we'll assume that players are rational and they only want to maximize their expected utility value.

## Normal Form Games

Normal-form (or matrix) representation is the most basic way to represent a game. We call Normal-Form Game (NFG) to a triplet $\mathcal G$:
$$
\mathcal G(\mathcal N, \mathcal A ,u)
$$
Where:

- $\mathcal N$ is a finite set of players. We user $n = |\mathcal N|$
- $\mathcal A_i$ is a finite set of actions (Pure strategies) for player $i$.
- $u_i$ is  a utility function of player $i$ that assigns the reward for joint action $a \in \mathcal A, a =(a_1,\dots,a_\mathcal{N})$ to player $i$.

### Strategies

Strategies are choices players make in a game (They can be multiple actions). We call $\mathcal s_i$ the strategy of the player $i \in \mathcal N$, and $\mathcal S_i$ the set of all strategies of the player $i$.

The set of strategies of all players is called **strategy profile**:
$$
\mathcal s = \langle \mathcal s_1, \dots,\mathcal s_{i-1},\mathcal s_{i+1}, \dots, \mathcal s_n \rangle
$$
We can also enumerate the strategies of all other players except $i$:
$$
\mathcal s_{-i} = \langle \mathcal s_1, \dots,\mathcal s_{i-1},\mathcal s_{i+1}, \dots, \mathcal s_n \rangle
$$
There are different types of outcomes for games:

- **Pareto Optimal Outcome**: It's an outcome $\mathcal s$ such that there's no other outcome $\mathcal s'$ where one player would be better of, and all other players have at least the same utility as in $\mathcal s$. <u>You have to find a strategy where your outcome is better than the Nash equilibrium and the other player's outcome is worse.</u>
- **Social Welfare Optimization**: It's a outcome that maximized the sum of all players.

### Dominance

Let $\mathcal G(\mathcal N, \mathcal A,u)$ be a normal-form game, there are 3 types of dominance:

-  We say that $s_i$ **strongly dominates** $s_i'$ if $\forall s_{-i} \in \mathcal S_{-i}$ $u_i(s_i,s_{-i}) > u_i(s'_i,s_{-i})$
- $s_i$ is **weakly dominates** $s_i'$ if $\forall s_{-i} \in \mathcal S_{-i}$ $u_i(s_i,s_{-i}) > u_i(s'_i,s_{-i})$ and $\exists s_{-i} \in \mathcal S_{-i}$ such that $u_i(s_i,s_{-i}) > u_i(s_i',s_{-i})$
- The strategy $s_i$ **very weakly dominates** $s_i'$ if $\forall s_{-i} \in \mathcal S_{-i} u_i(s_i,s_{-i}) \ge u_i(s'_i,s_{-i})$

Because a rational agent would never choose a strongly dominated strategy, we can remove them from the game. **The iterative removal of dominated strategies** is a simple algorithm that solve this problem for us.

The players may choose not to play the best outcome, because there may be a better future option. Because of this, given the strategy of the opponents $s_{-i}$ , if there's a better strategy for the player $i$, he is going to deviate from the best outcome.

With this we can define **Best Response**. Given a normal-form game, let $BR_i(s_{-i}) \subseteq \mathcal S_i$ such that $s_i^* \in BR_i(S_{-i})$ if $\forall s_i \in \mathcal S_i,$ $u_i(s_i^*,s_{-i}) \ge u_i(s_i,s_{-i})$

In normal form games we can also define **Nash Equilibrium**. We call a strategy profile $s = \langle s_1,\dots,s_n \rangle$ a Nash equilibrium if $\forall i \in \mathcal N, s_i \in BR_i(s_{-i})$.

The Nash Equilibrium is a descriptive solution concept that describes which strategy profile is stable, but not what the player should be playing. There may be multiple Nash Equilibriums in the same game.