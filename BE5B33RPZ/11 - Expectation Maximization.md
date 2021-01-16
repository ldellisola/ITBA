# Expectation Maximization Algorithm

The EM algorithm is used to find maximum likelihood parameters of a statistical model when the equations cannot be directly solved. The typical two use cases are:

- Missing Data: Some observations are incomplete
- Latent Variables: The observations are complete but the model can be formulated and solved in a simpler way if further variables are introduced to it.

The EM algorithm atemps to maximize the log-likelihood by instead maximizing the lower bound. The log-likelihood is composed og the lower bound $\mathcal L$ and a gap $D_{KL}$:
$$
\ln p(o|\theta)= \mathcal L(q,\theta) + D_{KL}(q||p)
$$
The algorithm goes as follows:

1. Initialize the parameters:
   $$
   \theta = \theta^{(0)}
   $$
   

2. Expectation Step:
   $$
   q^{(t+1)} = \text{argmax}_{q} ~~\mathcal L(q,\theta^{(t)})
   $$
   

3. Maximization Step:
   $$
   \theta^{(t+1)} = \text{argmax}_\theta~~ \mathcal L(q^{(t+1)},\theta)
   $$

### Kullback Leibler Divergence

The KL Divergente

We say that the bound it tight when:
$$
p = q
$$
