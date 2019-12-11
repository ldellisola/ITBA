# Demostración

$$
\#[0,1] \gt \chi_o
$$

#### Demo

Primero voy a ver que  $\#[0,1] \ge \chi_o$

- Propongo la funcion $F$:
  $$
  F:\N \rightarrow[0,1]/F(n)=\frac 1 {n+1}
  $$
  Como $F$ es inyectiva, podemos decir que $\#[0,1] \geq \# \N = \chi_o$ 

Ahora quiero ver que $\#[0,1] \neq \chi_o$

- Supongamos que $[0,1] \sim \N$
  $$
  \exist f:[0,1]\rightarrow \N \text{ biyectiva}\\
  \Rightarrow Im(f)=\{f(0),f(1),\dots\}= [0,1]
  $$
  Con $f(i)=\mu_i=0,\mu_{i0}\mu_{i1}\mu_{i2} \dots$ , $\mu_{i,j}=\{0,1,2,3,4,5,6,7,8,9\}$ 

  Defino un numero $d$ para que me de el absurdo tal que $d = 0,d_0d_1d_2\dots d_i/ d_i \neq \mu_{ii}$. 

  Y digo que $d_i \in \{1,2,3,4,5,6,7,8\}$, donde saco el $0$ y el $9$ para asegurarme de que todos los numeros tengan escritura unica. Ahora puedo comparar a los numeros como secuencias de chars

  Entonces obtengo que $d\in [0,1]$

  Pero tambien sabemos que:
  $$
  d \neq \mu_i
  $$
  por que $d_i \neq \mu_{ii}$

  Por lo que 
  $$
  d \notin \{ \mu_0,\mu_1,\dots\} = \{f(0),f(1),\dots\}=[0,1]
  $$
  **ABS!**, por que vimos antes que $d \in [0,1]$

