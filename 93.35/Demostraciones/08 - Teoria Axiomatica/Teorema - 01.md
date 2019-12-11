# Demostración

$$
\alpha \text{ es demostrable} \Rightarrow \alpha \text{ es una tautologia.}
$$

#### Demo

Se demuestra mediante <u>inducción en la longitud de la prueba</u>

- **Caso Base**: Sea $\alpha_1 = \alpha$ una prueba de $\alpha$ 

  Entonces:
  $$
  \text{$\alpha_1$ es un axioma}\\
  \Rightarrow \alpha_1 \text{ es una tautología}
  $$

- **Hipotesis Inductiva**:
  $$
  \text{Sea } \alpha_1, \dots,\alpha_n \text{ una prueba de } \alpha
  $$

- **Tesis Inductiva**:
  $$
  \text{Sea } \alpha_1,\dots,\alpha_{n+1} \text{ una prueba de }\alpha
  $$

Tenemos 2 casos:

- $\alpha_{n+1}$ es una axioma

  Entonces:
  $$
  \alpha_{n+1}=\alpha \text{ es una tautología}
  $$

- $\exist j,k \le n / a_j = (a_k \rightarrow a_{k+1})$

  1. $\alpha_k \rightarrow \alpha_{n+1}$
  2. $\alpha_k \text{ dato}$
  3. $\alpha_{n+1} \text{ por MP de (1) y (2)}$

  $\alpha_1,\dots,\alpha_k$ es una prueba de $\alpha_k$ por que cada $\alpha_i$ es un axioma o se obtiene por modus ponens $(MP)$ a partir de dos pruebas anteriores, dado que $\alpha_1, \dots,\alpha_k,\alpha_{k+1}, \dots,\alpha_{n+1}$ es una prueba

  Como $k \le n$, entonces, por **Hipotesis Inductiva**, $\alpha_k$ es una tautología.

  Analogamente, $\alpha_1,\dots.\alpha_j$ es una prueba de $\alpha_j$ y $j\le n$, entonces por **Hipotesis Inductiva** $\alpha_j$ es una tautología.

  Ahora queremos ver que $\alpha_{n+1}$ es una tautología:

  Sea $v$ una valuación:
  $$
  v(\alpha_j)=v(\alpha_k)=1 \text{ por que son tautologías}
  $$
  Entonces obtengo que:
  $$
  1 = v(\alpha_j) = v(\alpha_k \rightarrow \alpha_{n+1}) = max\{1-v(\alpha_k),v(\alpha_{n+1})\}=v(\alpha_{n+1})
  $$

$\therefore \alpha_{n+1}$ es una tautología.