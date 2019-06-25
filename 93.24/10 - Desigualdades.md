# Desigualdades Famosas

## Desigualdad de Márkov

Sea $X$ una VAC que solo toma valores positivos:
$$
P(X\gt\alpha) = \int_\alpha^\infty f_X(x)dx \leq \int_\alpha^\infty \frac x \alpha \cdot f_X(x)dx \leq \frac 1 \alpha \int_\alpha^\alpha x \cdot f_X(x) dx = \frac {E[x]} \alpha
$$
Entonces, podemos decir que:
$$
P(X\gt \alpha) \leq \frac {E[x]} \alpha
$$
Y esta desigualdad es valida para **todas** las variables aleatorias, incluidas las discretas.

## Desigualdad de Chebyshev

$$
P(\mid x-\mu_X \mid \gt \Epsilon )=P(\mid x-\mu_X \mid^2 \gt \Epsilon^2) \leq \frac 1{\Epsilon^2} \cdot E[(x-\mu_X)^2] = \frac {\sigma^2} {\Epsilon^2}
$$

Si $X$ es una VA con media $\mu_X$ y varianza $\sigma_X^2$:
$$
P(\mid x-\mu_x \mid \gt \Epsilon)\leq\frac {\sigma_X^2} {\Epsilon^2}
$$




