# Adaboost

Adaboost is an algorithm for designing a strong classifier $H(x)$ from weak classifiers $h_t(x), t = 1,\dots,T$ selected from the weak classifier set $\mathcal B$. The string classifier is constructed as:
$$
H(x) = sign(f(x))\\
f(x) = \sum^T_{t=1} \alpha_th_t(x)
$$
$f$ is a linear combination of weak classifiers $h_t(x)$ with positive weights $\alpha_t > 0$. Every weak classifier is a binary classifier that outputs $\{1,-1\}$. Adaboost deals with both the selection of $h_t(x)$ and with choosing $\alpha_t$ for gradually increasing $t$. The set of weak classifiers $\mathcal B$ can be infinite.

The Adaboost algorithm is as follows:

**Input**: $(x_1,y_1),\dots,(x_L,y_L) / x \in \chi , y \in \{-1,1\}$

1. Initialize the data weights:
   $$
   D_1(i) = \frac 1 L
   $$

2. For $t = 1,\dots,T$

   1. Find $h_t, \epsilon_t$ using **WeakLearn**:
      $$
      h_t = \underset {h\in \mathcal B} {\arg\min } ~\epsilon_t\\
      \epsilon_t = \sum_{i=1}^LD_t(i)\langle y_i \neq h(x_i)\rangle
      $$
      Where:
      $$
      \langle \text{true} \rangle = 1, \langle\text{false}\rangle = 0
      $$

   2. If $\epsilon_t \ge 0.5$, exit.

   3. Set $\alpha_t = 0.5 \log\left(\frac {1-\epsilon_t}{\epsilon_t}\right)$

   4. Update $D$:
      $$
      D_{t+1}(i) = \frac {D_t(i) e^{-\alpha_ty_ih_t(x_i)}}{Z_t}\\
      Z_t = \sum_{i=1}^L D_t(i)e^{-\alpha_ty_ih_t(x_i)}
      $$
      Where $Z_t$ is the normalization factor chosen so that $D_{t+1}$ is a distribution.

The final classifier is:
$$
H(x) = sign(f(x))\\
f(x) = \sum_{t+1}^T \alpha_th_t(x)
$$

### Error Upper Bound 

The following upper bound holds, in iteration $T$, for the training error $\epsilon$ of $H_T$:
$$
\epsilon = \frac 1 L \sum_{i=1}^L \langle y_i \neq H_T(x_i)\rangle \le \prod _{t=1}^T Z_t
$$

## Minimizing the Upper Bound of the Empirical Error

The main objective is to minimize the empirical error $\epsilon$:
$$
\epsilon = \frac 1 L \sum_{i=1}^L \langle y_i \neq H_T(x_i)\rangle
$$
Adaboost will minimize the upper bound by greedily minimizing $Z_t$ in each iteration.

We are going to minimize $Z_t$ with respect to $\alpha_t$:
$$
\frac {\partial Z_t} {\partial \alpha_t} = 0 \\
-e^{-\alpha_t}(1-\epsilon_t) + e^{\alpha_t}\epsilon_t = 0\\
\alpha_t = \frac 1 2 \log\frac {1-\epsilon_t}{\epsilon_t}
$$
Having found our $\alpha_t$, we need to substitute it into $Z_t$ and obtain:
$$
Z_t = 2 \sqrt{\epsilon_t(1-\epsilon_t)}
$$
And $Z_t$ is minimized selecting $h_t$ with minimal weighted error $\epsilon_t$