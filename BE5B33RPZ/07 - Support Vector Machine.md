# Support Vector Machine

In a linear classifier, classification is done by using the $sign$ of appropriate function of $x$:
$$
q(x) = sign( w \times x + b)
$$
Let $d(x)$ be the distance function from the point $x$ to the decision boundary of a linear classifier given by parameters $(w,b)$. The margin $m$ of a linear classifier $(w,b)$ is defines as follows:

- If the classifier classifies all data correctly, then:
  $$
  m = 2 \min_{x\in\mathcal T}d(x)
  $$
  The points $x\in \mathcal T$ satisfying this formula are called **support vectors**.

- If the classifier has errors on $\mathcal T$, then $m = 0$

In **Maximum Margin Linear Classifiers**, we try to find a classifier $(w,b)$ such that it maximizes the margin $m$. We can justify the use of maximum margin from the viewpoint of Structural Risk Minimization using Vapnik.

Let us define the signed distance function $d(x,y)$:
$$
d:\R^d \times \{-1,1\} \rightarrow \R/  d(x,y) = \frac{y (w \times x + b)} {||w||}
$$
 Where $x$ is a point of the dataset belonging to the class $y$.

Now we have to search for $(w,b)$ such that $d(x,y) > 0$ for all training data, meaning that all training points are in their class' half-space. The optimization task is the following:
$$
(w^*,b^*) = \underset {w,b} {\arg\max}~ \min_{(x,y)\in\mathcal T} 2 d(x,y)
$$
Subject to:
$$
y(w\times x + b) > 0 ~~\forall(x,y) \in \mathcal T
$$
In this case, changing the scale of the parameters $(w,b)$ does not affect the outcome. But we can also break this scale ambiguity:
$$
y(w\times x + b) > \epsilon ~~\forall(x,y) \in \mathcal T
$$
And forcing $\epsilon = 1$. With this we are fixing the scale.

Now that the parameters are fixed, all points must be outside the strip between the following lines:
$$
x\times w + b = 1\\
x\times w + b = -1
$$
The width of this strip is:
$$
\frac 2 {||w||}
$$
And we can obtain the maximum margin $m^*$ from:
$$
m^* = \max_{w,b} \min_{(x,y) \in \mathcal T}2d(x,y) = \max_{w,b} \frac 2 {||w||}
$$
Subject to:
$$
y(w\times x + b) \ge 1,\forall(x,y) \in \mathcal T
$$
<img src="Resources/07 - Support Vector Machine/image-20201117155623101.png" alt="image-20201117155623101" style="zoom:50%;" />

From this, we can get that the optimum parameters $(w^*,b^*)$ are:
$$
(w^*,b^*) = \underset {(w,b)} {\arg\min} ~0.5 {||w||}^2
$$
Subject to:
$$
y(w\times x + b) \ge 1,\forall(x,y) \in \mathcal T
$$
This is a quadratic programming (QP) problem.

## Soft Margin SVM

If the dataset is not linearly separable, we need to introduce **slack variables** $\xi_i$. Now position and size of the margin is calculated form $w,b$ as before, but we are adding penalties now. If a point $(x,y)$ fulfills the condition $y(w\times x + b )\ge 1$, no penalty is added. 

If the condition is not met, then we will relax the condition to $y(w\times x + b )\ge 1 - \xi$ and we have to pay a penalty of $C \xi$

Now we can define the primal problem as:
$$
(w^*,b^*) = \underset {(x,b)} {\arg\min}~0.5 {||w||}^2 + C \sum_i^N \xi_i
$$
Subject to:
$$
y_i(w\times x_i + b )\ge 1 - \xi_i
\\
\forall i = 1,\dots,N ~~ \xi_i \ge 0
$$
And the dual problem is defined as:
$$
\alpha = \underset \alpha {\arg\max} \left\{

\sum_i^N\alpha_i - 0.5 \sum_{i,j}^N \alpha_i\alpha_j y_i y_j x_i \times x_j

\right\}
$$
Subject to:
$$
\sum_i^N\alpha_iy_i = 0\\
0 \le \alpha_i \le C, \forall i \in \{1,\dots,N\}
$$

## Linear SVM

The classifier is a separating hyperplane, where the most important training points are called **support vectors**, this points are the ones that define the hyperplane. To identify the support vectors we need to use Quadratic Optimization algorithms with non-zero Lagrarian multipliers $h_i$.

Linear SVM work well with linearly separable datasets, specially if they have some noise. If the dataset is not separable, then we can map the data to higher dimensions. We can always map the original space to a higher dimension where the training set becomes separable.

SVM only relies on the inner-product between vectors $x_i\times x_j$. If every data point is mapped into a higher dimension, the kernel function becomes:
$$
K(x_i,x_j) = \phi(x_i)\times \phi(x_j)
$$
For SVM we only need to specify the kernel, without need to know the corresponding noon-linear mapping $\phi$.

## Non-Linear SVM

Here we have the following dual problem:
$$
\array{
\text{maximize}: & L(h) = \sum_i^Nh_i - 0.5 h Dh \\
\text{subject to:}& hy = 0, ~~ 0 \le h \le C
}
$$
Where $D_{ij} = y_iy_jK(x_i,x_j)$.

And the optimization techniques for finding $h_i$ is the same.

## Kernels

In theory, every function $K$ that holds:
$$
K(x_i,x_j) = \phi(x_i)\times \phi(x_j)
$$
Can be a kernel function, but proving this can be very long. To solve this we have **Mercer's Theorem**:

> Every semi-positive definite symmetric function is a kernel

We have a list with some common kernel functions:

- **Linear Kernel**: $K(x_i,x_j) =  x_i \times x_j$
- **Polynomial Kernel** of power $p$: $K(x_i,x_j) = (1 + x_i \times x_j )^p$
- **Gaussian Kernel**: $K(x_i,x_j) = e^{-{||x_i-x_j||}^2 / 2\sigma^2}$
- **Two-layer Perceptron**: $K(x_i,x_j) = \tanh(\alpha x_i \times x_j + \beta)$