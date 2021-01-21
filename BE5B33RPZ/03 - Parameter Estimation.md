# Parameter Estimation

Here we are going to estimate parameters using the **Maximum Likelihood (ML)** method, the **Maximum a Posteriori (MAP)** method and the **Bayesian** method. 

In the previous classes we assumed that we know all necessary probabilities, but in reality that's hardly the case, and we need to estimate these parameters from training data.

According the the form of the model for the distribution, we have two types of estimation methods:

- **Parametric**: The distribution has a knows form of a function which has parameters $\theta = (\theta_1,\theta_2,\dots,\theta_D)$, but the number of parameters is low. A good example of this is the Normal distribution, which has the parameters $\theta=(\mu,\sigma^2)$
- **Non-Parametric**: It's similar to the parametric distribution but it has a lot of parameters. In these cases the parameters tend to disappear from the estimating methods procedure. Examples of this kind are Parzen window and Histogram.

## Maximum Likelihood Principle

Here we have the following training set:
$$
\mathcal T=\{(x_1,k_1),\dots, (x_X,k_N)\}
$$
Where each observation ($x_i$) has the correct class ($k_i$) assigned.

We also know the parametric form of the likelihood:
$$
L(\theta) = p(\mathcal T/\theta)
$$
The ML principle says that the maximum likelihood estimate $\hat\theta$ for the observed data $\mathcal T$ is defined as:
$$
\hat\theta = \underset \theta {\arg\max}~  L(\theta) = \underset \theta {\arg\max} ~p(\mathcal T / \theta) 
$$
The intuition behind this method is that if the parameters are correct, then they will give larger probabilities for the objections, compared to wrong parameters. Usually the parameters for different classes are independent, and the likelihood function can be factorized as:
$$
\mathcal {p(T/\theta) = p(T_1/\theta_1) p(T_2/\theta_2)\dots p(T_K/\theta_K)}
$$
Where $\mathcal T_i$ corresponds to all members of $\mathcal T$ that are assigned the class $i$.

Now, because the samples in $\mathcal T$ are independent and identically distributed, we know that:
$$
p(\{x_1,\dots,x_N\}/\theta) = \prod_{i=1}^N p(x_i/\theta)
$$
And the ML estimation for the class is:
$$
\hat\theta = \underset \theta {\arg\max} \prod_{i=1}^N p(x_i/\theta)
$$
Because we are maximizing an argument and the logarithm function is an increasing function, we can maximize the log-likelihood and obtain the same results, making our calculations easier.

Under general conditions, as the number of observations grows to infinity, the estimates approach the actual parameters. Also, the probability density function approaches the Gaussian Distribution with large training sets.

The problem with this method is when our training set is small, because the parameter estimations can be biased to our small dataset and not represent the actual values we are estimating.

### Binomial Distribution

We can present this method with an example over the Binomial distribution. Let's say that we are taking randomly elements from a drawer that contains $R$ red balls and $G$ green balls, and the total of balls in the drawer is $N = G + R$. We want to estimate the percentage $\pi$ of red balls in the drawer.

Because it's a binomial distribution, we know that the likelihood function is:
$$
p(R,N/\pi)=\left(\array{N\\ R}\right) \pi^R (1-\pi)^{N-R}
$$
Because we want to maximize the parameter $\pi$, we will derivate the likelihood function with respect to $\pi$, equal it to zero and solve for $\pi$:
$$
\left(\array{N\\ R}\right) R \pi^{R-1}(1-\pi)^{N-R}- \left(\array{N\\ R}\right) \pi^{R}(1-\pi)^{N-R-1}(N-R ) = 0
$$
After solving the equation, we will find our estimate $\hat\pi_{ML}$:
$$
\hat\pi_{ML} = \pi = \frac R N
$$

### Normal Distribution

We can also apply this to the normal distribution with $N$ observations from the training data $(\mathcal T = \{x_1,\dots,x_N\})$. The likelihood function in this case is:
$$
P(\mathcal T/\mu,\sigma) = \frac 1 {\sigma^N \sqrt{(2\pi)^N}} e^{-\frac 1 {2 \sigma^2}\sum_{i=1}^N (x_i - \mu)^2}
$$
Now we are maximizing two parameters $(\mu, \sigma)$ so we need the partial derivative for both. We'll start with the mean estimation:
$$
\frac {\partial {P(\mathcal T/\mu,\sigma)}} {\partial\mu} =P(\mathcal T/\mu,\sigma) \frac 1 {\sigma^2} \left(\sum_{i=1}^N (x_i - \mu) \right) = 0
$$
After solving this equation we get:
$$
\hat\mu_{ML} = \mu = \frac 1 N \sum_{i=1}^N x_i
$$
Now for the variance:
$$
\frac {\partial {P(\mathcal T/\mu,\sigma)}} {\partial\sigma} =P(\mathcal T/\mu,\sigma) \frac N \sigma + P(\mathcal T/\mu,\sigma) \frac 1 {\sigma^3} \left( \sum_{i=1}^N (x_i - \mu)^2 \right) = 0
$$
And solving the equation we get:
$$
\hat \sigma _{ML} = \sigma =\frac 1 N \sum_{i=1}^N(x_i- \hat\mu_{ML})^2
$$

## Maximum A Posteriori Estimation

Here we have the following training set:
$$
\mathcal T=\{(x_1,k_1),\dots, (x_X,k_N)\}
$$
Where each observation ($x_i$) has the correct class ($k_i$) assigned.

We also know the parametric form of the likelihood:
$$
L(\theta) = p(\mathcal T/\theta)
$$
And the prior distribution $p(\theta)$ of the model parameters $\theta$ is known.

The MAP principle says that the Maximum A Posteriori estimate $\hat \theta$ of the distribution parameters for the observed data $\mathcal T$ is defined as:
$$
\hat\theta = \underset \theta {\arg\max}~ p(\theta/\mathcal T)
$$
And we can use the Bayes Theorem to obtain the following formula:
$$
\hat \theta = \underset \theta {\arg\max}~p(\mathcal T/\theta)p(\theta)
$$
 In this approach we are not maximizing the likelihood, but the product of the likelihood and the prior probability of $\theta$, which shifts the optimum $\hat\theta$ when the number of observations is low.

### Binomial Distribution

 We can present this method with an example over the Binomial distribution. Let's say that we are taking randomly elements from a drawer that contains $R$ red balls and $G$ green balls, and the total of balls in the drawer is $N = G + R$. We want to estimate the percentage $\pi$ of red balls in the drawer.

Because it's a binomial distribution, we know that the likelihood function is:
$$
p(R,N/\pi)=\left(\array{N\\R}\right) \pi^R (1-\pi)^{N-R}
$$
Now we need to find a suitable prior for $\pi$:
$$
p(\pi) = \pi^A(1-\pi)^B
$$
Now, after deriving the product of the prior and the conditional probability and solving for $\pi$, we obtain the following estimate:
$$
\hat\pi_{MAP} = \frac {R + A} {N + A + B}
$$
But we still have two unknown parameters $A,B$. These hyperparameters appear because the prior distribution $p(\pi)$ is also known as the **Beta distribution**. We can think about them as *virtual* observations done before any real observation has been done. $A$ would be the amount of red balls and $B$ the amount of green balls.

The Beta distribution is defined as:
$$
\beta(\pi/a,b) = \frac 1 {B(a,b)} \pi ^{a-1} (1-\pi) ^ {b-1}
$$
Where $A = a-1, B = b-1$, and the function $B(a,b)$ is a normalizing constant.

## Bayesian Parameter Estimation

Here we have the following training set:
$$
\mathcal T=\{(x_1,k_1),\dots, (x_X,k_N)\}
$$
Where each observation ($x_i$) has the correct class ($k_i$) assigned.

We also know the parametric form of the likelihood:
$$
L(\theta) = p(\mathcal T/\theta)
$$
And the prior distribution $p(\theta)$ of the model parameters $\theta$ is known.

The Bayesian Parameter estimation tries to minimize the risk $R(\theta)$ of the estimate $\theta$. The risk function is defined as:
$$
R(\theta) = \int_{-\infty}^\infty p(t/\mathcal T) (t-\theta)^2 dt\\
\theta_{MSE} = \underset \theta {\arg\min}R(\theta)
$$
Where $MSE$ is the Mean Squared Error.

This leads to:
$$
\theta_{MSE} = \int_{-\infty}^\infty t p(t/\mathcal T)dt
$$

### Binomial Distribution

