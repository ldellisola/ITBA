# Demostración

Sea $G$ plano y conexo, tal que $\#V_G=v,\#E_G=e,\#Regiones=r$, entonces:
$$
v-e+r=2
$$

#### Demo

(Por inducción en la cantidad de aristas)

- Caso Base:

  Sea $e=1$, tengo 2 casos de grafos conexo:

  - Caso $I$: Tengo el grafo $K_2$, entones $2 - 1 + 1=2$. Lo valida.
  - Caso $II$: Tengo un lazo, entonces $1-1+2=2$. Lo valida.

- Hipótesis Inductiva:

  La proposición es verdadera si $e\le n$.

- Tesis Inductiva:

  La proposición es verdadera si $e = n+1$.

Supongamos que un grafo $G$ conexo con $n+1$ aristas. Si quitamos una arista, tenemos 2 casos:

- Caso $I$: Al quitar la arista el grafo sigue siendo conexo, es decir, no quito una arista de corte

  <img src="../../Resources/clip_image001-1568035083348.png" alt="img" style="zoom:20%;" />

  En todos estos casos, al tomar la arista tengo una arista menos y tengo una region menos. Entonces por Hipotesis inductiva:
  $$
  v-n+r=2\\r-(n+1)+(r+1) = 2 \\v-n+r =2
  $$

- Caso $II$:

  <img src="../../Resources/clip_image001-1568035566686.png" alt="img" style="zoom:25%;" />

  $v_1 + v_2 = v$, $e_1 + e_2 = e-1$  y $r_1 + r_2 = r+1$. Entonces, por HI
  $$
  v-n+r=\\
  v_1-e_1+r_1 +v_2 - e_2 +r_2 = \\
  v-e+1 + r+1
  $$
  ==PEDIR==