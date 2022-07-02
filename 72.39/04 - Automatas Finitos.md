# Autómatas Finitos

Un autómata finito es una tupla:
$$
M = <K,\Sigma, \delta, q_0,F>
$$
Donde:

- $K$ es el conjunto de estados

- $\Sigma$ es el alfabeto

- $\delta$ es la función de transición definida según:
  $$
  \delta:K \times \Sigma \cup \{\lambda\} \rarr P(K)
  $$
  Donde $P(K)$ expresa el conjunto de partes de $K$

- $q_0$ es el estado inicial

- $F$ es el conjunto de estados finales, $F\subseteq K$

Los autómatas se pueden representar de varias formas, pero la más legible es un **diagrama de transición**. Estos representan al autómata:

- Con un circulo a cada estado
- Con un circulo doble a cada estado final
- Con una flecha apuntando a un estado se indica que es inicial
- Con un arco dirigido se representa una parte de la función de transición
- El símbolo sobre el arco indica que produjo a esa transición.

Por ejemplo:

<img src="Resources/04 - Automatas Finitos/Screen Shot 2022-06-30 at 15.06.23.jpg" alt="Screen Shot 2022-06-30 at 15.06.23" style="zoom:50%;" />

La **configuración instantánea** de un autómata finito es una representación de la situación actual del autómata. La forma de notarlo es:
$$
(q,\alpha) \in K \times \Sigma^*
$$
donde $q$ es el estado y $\alpha$ la cadena que queda consumir.

Un cambio de configuración se nota:
$$
(q,a\cdot \alpha) \vdash (r,\alpha) \iff r\in \delta(q,a)
$$
Para que un lenguaje sea aceptado por un autómata finito, entonces se debe cumplir:
$$
L(M) = \{\alpha\in\Sigma^*/ (q_0,\alpha) \vdash^*(f,\lambda) \land f \in F\}
$$

## Autómata Finito Deterministico

<img src="Resources/04 - Automatas Finitos/Screen Shot 2022-06-30 at 15.36.30.jpg" alt="Screen Shot 2022-06-30 at 15.36.30" style="zoom:50%;" />

Un autómata finito determinístico se define igual que un autómata finito normal:
$$
M = <K,\Sigma,\delta,q_0,F>
$$
Pero con la diferencia que la función de transición se define:
$$
\delta: K\times \Sigma \rarr K
$$
Estos autómatas no permiten que del mismo estado haya dos transiciones que utilicen el mismo símbolo.

## Autómata Finito No Deterministico

<img src="Resources/04 - Automatas Finitos/Screen Shot 2022-06-30 at 15.36.41.jpg" alt="Screen Shot 2022-06-30 at 15.36.41" style="zoom:50%;" />

Un autómata finito determinístico se define igual que un autómata finito normal:
$$
M = <K,\Sigma,\delta,q_0,F>
$$
Pero con la diferencia que la función de transición se define:
$$
\delta: K\times \Sigma \rarr P(K)
$$

## Autómata Finito No Determinístico con Transiciones Lambda

<img src="Resources/04 - Automatas Finitos/Screen Shot 2022-06-30 at 15.36.52.jpg" alt="Screen Shot 2022-06-30 at 15.36.52" style="zoom:50%;" />

Un autómata finito determinístico se define igual que un autómata finito normal:
$$
M = <K,\Sigma,\delta,q_0,F>
$$
Pero con la diferencia que la función de transición se define:
$$
\delta: K\times \Sigma \cup \{\lambda\} \rarr P(K)
$$

## Demos

### Determinismo de un AFD

$$
\array{\forall \alpha,\beta \in L \\((\alpha = \beta) \land (q,\alpha) \vdash ^*(r,\lambda) \land (q,\beta) \vdash (r',\lambda)) \implies r = r'}
$$

Demostramos por Inducción en la longitud de $\alpha:$

- **Caso base**: $|\alpha| = 0$
  $$
  |\alpha| = 0 \implies \alpha = \lambda \implies \beta = \alpha = \lambda
  $$
  Por lo que podemos decir:
  $$
  (q,\alpha) \vdash^*(r,\lambda) = (q,\lambda) \vdash ^0(r,\lambda)
  $$
  Ademas de que $r = q.$

  Por otro lado:
  $$
  (q,\beta) \vdash^*(r,\lambda) = (q,\lambda) \vdash ^0(r',\lambda)
  $$
  Ademas de que $r' = q.$

  Entonces, podemos decir que $r = r'.$

- **Paso Inductivo**: La hipótesis inductiva es verdadera para $|\alpha| = n$

  Reescribimos a $\alpha,\beta$ como $\alpha = \beta = a \cdot \alpha' / |\alpha'| = n.$
  $$
  \array{
  (q,\alpha) & \vdash_a & (q',\alpha') \\
  &\vdash^* & (r,\lambda)
  }
  $$

  $$
  \array{
  (q,\beta) & \vdash_a & (q'',\alpha') \\
  & \vdash^*&(r',\lambda)
  }
  $$

  Sabiendo que $|\delta(q,a)| = 1,$ podemos decir que $q' = q''.$ Entonces, por hipótesis inductiva, podemos decir que:
  $$
  r = r'
  $$
  