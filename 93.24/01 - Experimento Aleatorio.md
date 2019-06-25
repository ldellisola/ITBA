# Experimento Aleatorio

Un experimento $(E)$ aleatorio se puede realizar un numero indefinido de veces sin cambiar las condiciones en las que se lo realiza.

El espacio muestral $(S)$ de un experimento son todos los posibles resultados del experimento.

## Sucesos

### Definición

Un Suceso $(A)$ es el conjunto de resultados posibles, un subconjunto del espacio muestral $(A \subset S)$.

### Ejemplo

Si  $S_1 = \{1,2,3,4,5,6\}$ si queremos que obtener el suceso $(A_1)$ tal que la suma de dos dados de 10, entonces $A_1=\{(4,6),(5,5),(6,4)\}$.

### Operaciones

Sean $A$ y $B$ sucesos asociados a un cierto experimento aleatorio:

- $A\cup B$: Ocurre al menos uno de los sucesos.
- $A\cap B$: Ocurren ambos sucesos.
- $A' , A^c,\overline{A}$: No ocurre $A$.
- $\phi$ : Suceso imposible.

### Propiedades

Dos sucesos son mutuamente excluyentes $\Leftrightarrow A\cap B=\phi$.

## Frecuencia Relativa de un Suceso

### Definición

Sean:

- $m$ la cantidad de veces que se repite el experimento.
- $m_A$ : la cantidad de veces que ocurrió el suceso $A$.

Entonces:
$$
f(A) = \frac{m_A}{m}
$$

### Propiedades

- $f(A)\geq 0$
- $f(A)\leq 1$
- $f(S)=\frac{m_S}{m}=\frac{m}{m}=1$
- $f(\phi)=0$
- $f(\overline{A}) = \frac{m-m_A}{m} = 1-f(A)$
- Si $A\cap B=\phi \Rightarrow f(A\cup B)=\frac{m_a +m_b}{m}=f(A)+f(B) $
- Si $A\cap B \neq \phi \Rightarrow f(A\cup B)=\frac{m_A +m_B-m_{A\cap B}}{m} = f(A)+f(B)-f(A\cap B)$

## Probabilidad de un Suceso (Axiomática de Kolmogorov)

### Axiomas de Kolmogorov

- $P(A)\geq0$

- $P(S)=1$
- Si $A\cap B = \phi \Rightarrow P(A\cap B) = P(A)+P(B)$

























