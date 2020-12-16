# Logistic Regression

Consider a classification problem with $0/1$ loss matrix. If we have only two classes, we call the ratio of posterior the **odds ratio**:
$$
\frac {p(1/x)}{p(2/x)}
$$
And the logarithm of the ratio is called **log odds**:
$$
\ln\frac{p(1/x)}{p(2/x)}
$$
We are interested in the log odds because they are linear, and thus simple function of the observation variable $x$, whether it is one of the following distributions:

- Normal distributions with equal variance.
- Independent features with binary outcomes.
- Multinomial naïve Bayes.

In all cases, we can obtain the log odds in the following shape:
$$
a(\vec x) = \vec w \times \vec x + w_0
\\ \vec w\in \R^D
$$
Where $w_0$ is the bias term. We ca rewrite this equation as:
$$
a(\vec x) = w_0 \times 1 + \vec w \times \vec x = 
\left[\array{w_0,w_1,\dots,w_D}\right]\times 
\left[\array{1 \\ x_1\\\vdots \\x_D}\right] =
\vec w' \times \vec x'
$$
Here we added the bias term to the front of the $\vec w$ vector and to match it we inserted the number $1$ in front of the $\vec x$ vector. From now on we will write $x,w$ assuming we are talking about $\vec x',\vec w'$ respectively.

Considering the log odds again, we can obtain the probability density function as:
$$
\array{
\frac {p(1/x)}{p(2/x)} = e^{w \times x} && \frac {p(2/x)}{p(1/x)} = e^{-w \times x} \\
p(1/x) = \frac 1 {a+e^{-w\times x}} && p(2/x) = \frac 1 {a+e^{w\times x}}
}
$$
We can also use the *logistic sigmoid function* $\sigma(u) = \frac{1}{1+e^{-u}}$ and rename the classes from $\{1,2\}$ to $\{-1,1\}$. We will obtain the following function:
$$
p(k/x) = \frac 1 {1 + e^{-k w\times x}}
$$
With $k \in \{-1,1\}$.

Now we need to find $w$, to do this we will apply the *Maximum Likelihood*. Let us have a training set $\mathcal T$:
$$
\mathcal T = \{(x_1,k_1),\dots,(x_N,k_N)\}
$$
The optimal $w^*$ would be the one maximizing the log-likelihood $l(w)$:
$$
l(w) = \sum_{(x,k) \in \mathcal T}\ln p(k/x) + \sum_{(x,k) \in \mathcal T}\ln p(k)
$$
Because there are no assumptions about the form of the prior probability as a function of $w$, logistic regression uses the maximization of conditional log-likelihood $l'(w)$:
$$
l'(w) = \sum_{(x,k) \in \mathcal T}\ln p(k/x) = - \sum_{(x,k) \in \mathcal T}\ln (1 + e^{-kw\times x})\\
w^* = \underset w {\arg\max}~~ l'(w)
$$
In order for the optimization to fit into the minimization framework, we define the objective function $E(w)$ as the negative conditional log likelihood:
$$
E(w) = - l'(w)
$$
This objective function corresponds to **cross entropy**. We need to find the optimal $w^*$, and for this we need to calculate the point where $\nabla E(w) = 0$. The problem here is that we can't solve it analytically, so we resort to numerical methods.

For this we need to probe that $E(w)$ is convex, so we need to calculate the Hessian matrix. If the Hessian matrix is positive for all  $w$, the we can say it is convex, and thus has an unique minimum. We can now implement the gradient descent algorithm to solve this problem:

```pseudocode
# input: x (observations), k (class labels), w_init (initial w)

w = w_init
step_size = 1.0
E,g = compute_E_and_Gradient(x,k,w)

while not TERMINATION_CONDITION:
	E_new, g_new = compute_E_and_Gradient(x, k, w - step_size * g)
	
	if E_new < E:
		# success
		w -= step_size * g
		g = g_new
		E= E_new
		step_size *= 2
	else:
		step_size /= 2
		
return w
```

The logistic regression cannot provide the two thresholds the optimal strategy requires, but it provides a the one threshold which matters more in reducing the classification error

## Logistic Regression with Multiple Classes

The logistic regression can be generalized to multiple classes using the **softmax** function. For each class $k\in\{1,2,\dots,K\}$ there exists an associated weight vector $w_k$, and the conditional probability for the $k^{th}$ function is computed as:
$$
p(k/x) = \frac{e^{w_k \times x}}{\sum_i^K e^{w_i\times x}}
$$
This function should sum to 1 to be considered a probability.

Having the same training set as before $(\mathcal T)$, we have to find the set of parameters $W = [w_1,\dots,w_K]$. We are using the conditional log likelihood $(l'(W))$ to fund the optimal parameters $W^*$:
$$
l'(W) = \sum_{(x,k)\in \mathcal T}\ln p(k/x) = \sum_{(x,k)\in \mathcal T} w_k\times x - \sum_{(x,k)\in \mathcal T} \ln \left(\sum_i^K e^{w_i\times x} \right)\\
W^* = \underset W {\arg\max} ~l'(W) = \underset W {\arg\min} ~ E(W)
$$
Where $E(W)$ is the cross entropy, as in the previous case.