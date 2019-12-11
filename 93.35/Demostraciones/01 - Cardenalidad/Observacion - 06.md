# Demostración

$$
\le  \text{ es una relación de orden}
$$

#### Demo

Para ser una relación de orden, la relacion tiene que ser reflexiva, transitiva y antisimetrica.

- **Reflexiva**:

  $\#A\le \#A$ pues $\exist f:A\rightarrow A/ f\text{ es inyectiva}$ y esta funcion $f$ es la identidad.

  Entonces, se cumple con que $\le$ es reflexiva.

- **Antisimetrica**:

  Si $\#A \le \#B$ y $\#B \le \#A$, entonces por el Teorema de Bernstein, $\#A = \#B$.

  Entonces, se cumple con que $\le$ es antisimetrica.

- **Transitiva**:

  Sea $\#A \le \#B$ y $\#B \le \#C$

  Entonces existen dos funciones inyectivas $f,g$ tal que:
  $$
  \array{ f:A\rightarrow B&& g:B\rightarrow C}
  $$
  Y como la composición de funciones inyectivas resulta en una función inyectiva, puedo definir a una funcion $h$:
  $$
  h:A\rightarrow C/h(x)=g_of(x)
  $$
  Y como esta función es inyectiva, puedo decir que  $\#A \le \#C$.

  Entonces, se cumple con que $\le$ es transitiva.

Como $\le$ es <u>reflexiva</u>, <u>antisimetrica</u> y <u>transitiva</u>, puedo decir que $\le$ es una relación de orden