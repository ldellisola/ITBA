# K-Means

The **K-Means** algorithm comes to solve the Least-Squares Clustering Problem. The main objective for this algorithm is to find points that represent the center of the best distribution of $K$ clusters of points. The algorithm looks like this:

1. Initialize the cluster centers $\{c_k\}^K_{k=1}$ with some value. This can be a random selection of data points from the training set $\mathcal T$.

2. Split the training set $\mathcal T$ into $k$ groups $(\mathcal T_k)$. This decision will be based on de closes cluster center to each data point:
   $$
   \array{\mathcal T_k=\{x \in \mathcal T : \forall j.|\!|x-c_k|\!| ^2 \le |\!| x - c_j |\!|^2 \} &\forall k \in 1,\dots,K}
   $$

3. Now we will analyze the classification and decide the new cluster centers:
   $$
   \array{c_k = 
   \left\{\array{
   \frac{1}{|\mathcal T_k|} \sum_{x\in \mathcal T_k} x&|\mathcal T_k| > 0\\
   \text{re-initialize}& \mathcal T_k = \empty
   }\right. & \forall k = 1,\dots, K}
   $$

4. If $\forall k: \mathcal T^{t+1}_k = \mathcal T^t_k$ then we can exit the algorithm, otherwise go back to step 2.

This algorithm always converges and the least squares criterion $J$ monotonically decreases. Also, because of the finite number of assignments and that no assignment is visited twice, the algorithm reaches a *local minimum* after a finite number of steps.

The complexity of this algorithm depends on the amount of clusters $(K)$ and size of the training data set $(L)$. The complexity is $O(KL)$, but it can be speed up.

## K-Means++

A good initialization can help you avoid bad local minima. This is the motivation for the K-means++ algorithm.

1. Choose the first cluster center $c_1$ uniformly at random from $\mathcal T$ and set $\mathcal C=\{c_1\}$

2. For each data point $x_l$, compute the distance $d_l$ to its nearest cluster in $\mathcal C$:
   $$
   \array{d_l = \min_{c\in\mathcal C} |\!|x_l - c|\!| & \forall l \in 1,\dots,L}
   $$

3. Select a point $x_l$ from $\mathcal T$ with probability proportional to $d_l^2$ . This involves construction a distribution $p(l)$ with $d_n$ as $p(n)= \frac{d_n^2}{\sum_{i=1}^L d_i^2}$ and sampling from it to get the index $l$

4. We add that new point $x_l$ to our set of cluster centers:
   $$
   \mathcal C \larr \mathcal C \cup \{x_l\}
   $$

5. If $|\mathcal C| = K$, we exit the algorithm, else go back to step 2.

After running the algorithm we have a good set of initial cluster centers that we need to run through the normal K-means algorithm.

If we initialize K-means with the K-means++ algorithm, then we can have an upper bound on the expectation on the criterion value $E(J)$:
$$
E(J) \le 8 (\ln(K) + 2) J_{opt}
$$

## Generalizations

K-means can be generalized for minimized a criterion other than squared Euclidean distance. For this we are going to modify the algorithm:

The input for the algorithm now is the set of observations $\mathcal T =\{x_l\}^L_{l=1}$, the desired number of clusters $K$ and the distance function $d(x,y)$.

The output is the same as before, a set of cluster centers $\{c_k\}^K_{k=1}$ and the partition of the set data based on the centers $\{\mathcal T_k\}^K_{k=1}$.

Now the algorithm looks like this:

1. Initialize the cluster centers $\{c_k\}^K_{k=1}$ with some value. This can be a random selection of data points from the training set $\mathcal T$.

2. Split the training set $\mathcal T$ into $k$ groups $(\mathcal T_k)$. This decision will be based on de closes cluster center to each data point:
   $$
   \array{\mathcal T_k=\{x \in \mathcal T : \forall j.d(x-c_k) \le d(x,c_j) \} &\forall k \in 1,\dots,K}
   $$

3. Now we will analyze the classification and decide the new cluster centers:
   $$
   \array{c_k = 
   \left\{\array{
   \text{argmin}_c\sum_{x\in \mathcal T_k} d(x,c)&|\mathcal T_k| > 0\\
   \text{re-initialize}& \mathcal T_k = \empty
   }\right. & \forall k = 1,\dots, K}
   $$

4. If $\forall k: \mathcal T^{t+1}_k = \mathcal T^t_k$ then we can exit the algorithm, otherwise go back to step 2.

