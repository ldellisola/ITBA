# Perceptron Multicapa

<img src="Resources/06 - Perceptron Multicapa/Screen Shot 2022-04-19 at 10.13.15.jpg" alt="Screen Shot 2022-04-19 at 10.13.15" style="zoom:50%;" />

Que mierda significa todo esto:

- $O_i$: Salida de la capa visible, de la neurona $i$.
- $w_{ij}$: ==FALTA==

Para un ejemplo $\mu$ de la red, cada unidad en la capa oculta alcanza un estado de exitacion $h_j^\mu$ dado por:
$$
h_j^\mu = \sum_k w_{jk} \xi_k^\mu
$$
Lo cual produce un estado de activación de las unidades de la capa oculta $V_j^\mu$:
$$
V_j^\mu = g(h_j^\mu) = g\left(\sum_k w_{jk}\xi_k^\mu\right)
$$
Cada unidad de la capa de salida alcanza un estado de exitacion $h_i^\mu$ dado por:
$$
h_i^\mu = \sum_j W_{ij}V_j^\mu = \sum_j W_{ij}g\left( \sum_k w_{jk} \xi_k^\mu \right)
$$
Lo cual produce un estado de activación de las unidades de salida $O_i^\mu$:
$$
O_i^\mu = g(h_i^\mu) = g\left(\sum_j W_{ij}V_j^\mu \right)= g\left(\sum_j W_{ij}g\left( \sum_k w_{jk} \xi_k^\mu \right)\right)
$$
Para calcular la función de costo, podemos hacerlo de la siguiente manera:
$$
E(w)= \frac 1 2 \sum_{\mu,i} \left(\zeta_i^\mu - g\left( \sum_j W_{ij}\times g\left(\sum_k w_{jk} \times \xi_k^\mu \right)\right)\right)^2
$$
No hace falta conocer explícitamente el estado de activación deseado para cada uno de las unidades en la capa oculta. Esta estrategia implica retropropragar el error $\zeta_i^\mu - O_i^\mu$ de cada unidad de la capa de salida hacia las capas inferiores, a partir de esto se podrán actualizar los pesos de las conexiones $w_{jk}$.

Utilizando la tecnica del gradiente descendiente, podemos transformar el la función de costo a una forma de actualizar los pesos de las conexiones $W_{ij}$:
$$
\Delta W_{ij} = \eta \sum_\mu \delta_i^\mu \times V_k^\mu
$$
Donde $\delta_i^\mu = (\zeta_i^\mu - O_i^\mu)\times g'(h_i^\mu)$

Y para cada $\Delta w_{jk}$ se calcula:
$$
\Delta w_{jk} = \eta \sum_{\mu,i} (\zeta_i^\mu - O_i^\mu) \times g'(h_i^\mu) \times W_{ij} \times g'(h_j^\mu) \times \xi_k^\mu
$$
==FALTA==

## Retropropagación 

### Consideraciones 

Para obtener la red necesitamos saber solo los pesos de las conexiones entre neuronas, pero este peso es un valor real, por lo que las combinaciones son infinitas.



