# Decision Trees

## Top-Down Induction of a DT

This process is made up of 2 phases:

- **Growth Phase**: The tree is constructed top-down.:
  1. We find the *"Best"* attribute
  2. We partition examples based on on the attribute's value
  3. We apply recursively to each partition
- **Pruning Phase**: The tree is pruned button-up. For each node, we keep the subtree or change it for a  leaf by comparing the estimated error.

When splitting a node into branches, we need to define a splitting function $S(P,\theta)$ as a mapping which takes a set $P$ (data points at a node) and splitting parameters $\theta$ and partitions $P$ into $\{P_1,\dots,P_k\}$:
$$
S:P,\theta \rarr \{P_1,\dots,P_k\}\\
P_i \cap P_j =\empty \Leftrightarrow i \neq j \\
\cup_{i=1}^k P_i = P
$$
Where $\theta$ is a set of parameters that may contain the breaching factor $k$, the index $i$ of the splitting dimension $X_i$.

### Maximization of Information Gain

One approach to splitting is **greedy maximization of information gain**, where information gain $(IG)$ measures the expected reduction in entropy $(H)$ when a set $P$ is partitioned to subsets $P_1,\dots,P_k$. The information gain for an attribute $A$ is $IG(A)$:
$$
IG(A) = H(P) - \sum_{i=1}^k\frac{|P_i|}{|P|} H(P_i)\\
H(P) = - \sum_{j}\frac{|P^{j}|}{|P|} \log\frac{|P^{j}|}{|P|}\\
H(P_i) = -\sum_j \frac{|P^{j}_i|}{|P_i|} \log \frac{|P_i^{j}|}{|P_i|}
$$
Where $P^{(j)}$ is the number of points of class $j$ in $P$.

The attributes with the highest entropy should be decided first. We can reformulate this process into an algorithm. The input is the training set $\mathcal T$ and a class $S$ of allowed splitting parameters:

1. Set the partition $P$ to the training set:
   $$
   P = \mathcal T
   $$
   

2. Find the best splitting function as measured by the Information Gain:
   $$
   S = \underset {\theta \in S}{\arg\min} \left(
   \sum_{P_i \in S(P,\theta)}\frac{|P_i|}{|P|} H(P_i)  
   \right)\\
   H(P_i) = - \sum_j \frac{|P_i^{(j)}|}{|P_i|} \log \frac{|P_i^{(j)}|}{|P_i|}\\
   $$

3. Go recursively to branches

### Minimization of Training Error

This algorithm is similar to the previous one but instead of using Information gain and entropy, it uses the training error:

1. Set the partition $P$ to the training set:
   $$
   P = \mathcal T
   $$
   

2. Find the best splitting function as measured by the Information Gain:
   $$
   S = \underset {\theta \in S}{\arg\min} \left(
   \sum_{P_i \in S(P,\theta)}\frac{|P_i|}{|P|} \epsilon(P_i)  
   \right)\\
   H(P_i) = 1- \max_j \frac{|P_i^{(j)}|}{|P_i|}
   $$

3. Go recursively to branches

## Random Decision Forests

Decision trees tend to overfit, but combining multiple decision trees offers a solution to this problem. This raises two problems:

- How should multiple trees be combined?

  Generally a majority of votes for a given class is used, similar to NNs

- How should multiple trees be constructed?

  Constructing multiple different trees requires randomization that can be employed for:

  - Randomly sampling the training set for individual decision trees, using **bagging**.
  - Randomly sampling a subset of features for individual decision trees.

