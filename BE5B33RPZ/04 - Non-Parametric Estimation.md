# Non-Parametric Estimation

Parametric estimation is a great tool if there are only a few number of parameters to estimate, but the results can be wrong if the underlying distribution does not agree with the assumed parametric model.

## Histogram

The idea behind this approach is to put all the samples into distinct *buckets*, and from there we will formulate our own distribution. 

Let's say we have a distribution $q(x)$ on the interval $[0,1]$, we will fit the distribution with a *'histogram'* with $B$ bins. We want to estimate a constant-split function on the interval $[0,1]$ with $B$ segments of the same width. This function is denoted as:
$$
p(x/\{d_1,\dots,d_B\})
$$
Also, for any number $B$ of bins, $d_1,\dots,d_B$ mist conform the following constraint:
$$
1 = \int_{-\infty}^\infty p (x/\{d_1,\dots,d_B\}) dx= \sum_{i=1}^B \int_{\frac {i-1}{B}}^{\frac i B} d_i dx = \sum_{i=1}^B d_iw = \sum_{i=1}^B \frac {d_i} B
$$
Where $w$ is the **bin width**.

We will estimate $\{d_i/i \in [0,B]\}$ using the Maximum Likelihood approach. Let $N_i$ be the number of samples that belong to the $i^{th}$ bin and $\sum_{i=1}^{B} N_i = N$, we will calculate the estimate of $d_k$:
$$
d_k = B \frac {N_k} N
$$
Now we need to find the correct number of bins to model the distribution correctly. To do this we can obtaining the log-likelihood:
$$
l(\mathcal T) = \sum_i^B N_i \log d_i
$$
Because we also want to find good values, we are going to implement **cross-validation**. This takes out a point of the data set, estimates the distribution and then sees if the estimate is correct, for every single point in the dataset. This will give us the best possible $B$.

We can also use different methods to estimate $d_i$:

- MAP: 
  $$
  d_i = B \frac {N_i + \alpha_i -1} {N + \sum_j^B\alpha_j - B}
  $$

- Bayes Estimate:
  $$
  d_i = B \frac {N_i + \alpha_i} {N + \sum_j^B \alpha_j}
  $$

Inn both cases we can interpret $\alpha_i$ as virtual observations, like if $\alpha_i$ points have already been assigned to the bin $i$.

## $K$-Nearest Neighbor

This algorithm works under the following assumptions:

- The training set is $\mathcal T =\{(x_1,k_1),\dots,(x_N,k_N)\}$, where there are $R$ classes.
- There exists a distance functions between the data points $d:X\times X \rightarrow R^+_0$

The algorithm is:

1. Given $x$, find $K$ points $S = \{(x_1',k_1'), \dots,(X_K',k_K')\}$ from the training set $\mathcal T$ which are closest to $x$ in the metric $d$. Rank the set according to the distance.
2. Classify $x$ to the class $k$ which has majority of entries in $S$.

### Properties

This algorithm has a very trivial implementation. If we are using the $1$-NN variant, then the Bayes error $\epsilon_B$ is the lower bound of error of classification $\epsilon_{NN}$, the upper bound can also be constructed, for example $\epsilon_{NN} \le 2 \epsilon_B$.

There's an issue with this algorithm, the implementation. It tends to work very slowly when the naïve algorithm is written, but it can be sped up. Another issue here is that the memory requirements are huge for large datasets, but again, it can be solved with a few optimizations.

### Optimizations

There are 2 types of optimizations that can improve the runtime of this algorithm: **memory-wise** and **speed-wise**.

To solve the speed issue, we can apply $K-d$ trees, calculating easily the nearest data points.

On the other hand, we need to use a condensation algorithm to use less memory. The idea here is to run an algorithm that will exclude the data points that do not affect the boundaries. This algorithm is as follows:

1. Create two lists $A,B$ and insert randomly samples from $\mathcal T$ in $A$, and the rest in $B$.
2. Classify the samples from $B$ using $1$-NN with the training set $A$. if $x\in B$ is misclassified, move it from $B$ to $A$.
3. If the move was triggered, then go back to step 2.

### Classification Error

The classification error $\bar \epsilon$ for strategy $q: X \rightarrow R$ is computed as:
$$
\bar \epsilon = \int \epsilon(x)p(x) dx
$$
 We also know that the bayesian strategy $q_B$ decides for the highest posterior probability, thus the partial error for a given $x$ is:
$$
\epsilon_B(x) = 1 - \max_kp(k/x)
$$
Assuming the asymptotic case, we can show that the following bounds hold for the partial error $\epsilon_{NN}(x)$ and for the classification error $\bar \epsilon_{NN}(x)$ in the $1$-NN classification:
$$
\epsilon_B(x) \le \epsilon_{NN}(x) \le 2 \epsilon_B(x) - \frac R {R-1}\epsilon^2_B(x)\\
\bar \epsilon_B \le \bar \epsilon_{NN} \le  2 \bar\epsilon_B - \frac R {R-1}\bar\epsilon^2_B
$$

### The Edit Algorithm

The primary goal of this method is to reduce the classification error. The algorithm goes as follows:

1. Partition $\mathcal T$ in two sets $A,B$.
2. Classify samples in $B$ using $K$-NN with the training set $A$. Remove all samples from $B$ which have been misclassified.

This will gives us the training set $B$ for $1$-NN classification with the following classification error:
$$
\bar \epsilon_{\text{edit}} = \bar\epsilon_B \frac{1-\bar \epsilon_B}{1-\bar \epsilon_{K\text{NN}}}
$$
If $\bar\epsilon_{KNN}$is small ($\sim 0.05$), then the edited $1$-NN is quasi-Bayes (almost the same performance as Bayesian Classification).

