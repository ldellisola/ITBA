# Demostración

$$
\alpha \in F \Leftrightarrow \exist X_1,\dots,X_n \text{ candea de formacion de } \alpha
$$

#### Demo

$\Rightarrow)$ <u>Por inducción en $long(\alpha)$</u> 

- **Caso Base**: $long(\alpha)=1$

  Entonces $\alpha = p_j \in$  ${VAR}$. 

  Luego $X_1=p_j$ es una cadena de formación de $\alpha$

- **Hipotesis Inductiva**:

  Sea $\alpha \in F, long(\alpha)=k\le n:$
  $$
  \exist X_1,X_2,\dots,X_k = \alpha \text{ cadena de formación}
  $$

- **Tesis Inductiva**:

  Sea $\alpha \in F, long(\alpha)=n+1$:
  $$
  \exist X_1,X_2,\dots,X_j = \alpha \text{ cadena de formación}
  $$

Sea $\alpha \in F/long(\alpha)=n+1$, tengo 3 casos:

1. $\alpha = p_j\in VAR$:

   Defino $X_1=p_j$, que es una cadena de formación de $\alpha$

2. $\alpha =\neg \beta$ con $\beta \in F$
   $$
   long(\alpha)=n+1 = long(\beta)+1 \Rightarrow long(\beta)=n
   $$
   Por **hipotesis inductiva**:
   $$
   \exist X_1,X_2,\dots,X_k = \beta \text{ cadena de formación}
   $$
   Entonces puedo definir la siguente cadena de formación de $\alpha$: 
   $$
   Y_1=X_1,Y_2=X_2,\dots,Y_k=X_k,Y_{k+1}=\neg X_k=\alpha
   $$

3. $\alpha = \beta_1 * \beta_2$ con $\beta_1,\beta_2\in F, *\in \{\land,\lor,\rightarrow\}$
   $$
   long(\alpha)= n+1 = long(\beta_1) + 1 + long(\beta_2)\\
   $$

   $$
   \text{ como }long(\beta_1) \ge 0 \and long(\beta_2)\ge 0\\
   $$

   $$
   \Rightarrow long(\beta_1) \le n \and long(\beta_2) \le n
   $$

   Entonces puedo usar la **hipotesis inductiva**, existen una cadena de formación para $\beta_1$ y otra para $\beta_2$:
   $$
   X_1,\dots,X_k=\beta_1 \text{ es una cadena de formación }\\
   Y_1,\dots,Y_t=\beta_2 \text{ es una cadena de formación}
   $$
   Defino una nueva cadena de formación para $\alpha$:
   $$
   Z_1=X_1,\dots,Z_k=X_k,Z_{k+1}=Y_1,\dots,Z_{k+t}=Y_t,Z_{k+t+1}=Z_k * Z_{k+t}=\alpha
   $$

$\Leftarrow )$ <u>Por inducción en el elemento $X_n$</u>

Sea $X_1,\dots,X_n$ una cadena de formación, vamos a provar por inducción en $n$ que $X_j\in F$ $1\le j\le n$

- **Caso Base**: $n=1$

  $X_1$ es una cadena de formación, entonces $X_1 \in VAR$, por lo que $X_1 \in F$

- **Hipotesis Inductiva**: 
  $$
  X_1,\dots,X_n \text{ es una cadena de formación } \Rightarrow X_j \in F~~~1\le j\le n
  $$

- **Tesis Inductiva**:
  $$
  X_1,\dots,X_{n+1} \text{ es una cadena de formación } \Rightarrow X_j \in F~~~1\le j\le n+1
  $$

Sea $X_1,\dots,X_{n+1}$ una cadena de formación,

Por una observación anterior, $X_1,\dots,X_n$ es una cadena de formación

Entonces, por **Hipotesis Inductiva**, $X_j \in F$  $1\le j \le n$

Ahora tengo 3 casos:

1. $X_{n+1} \in VAR$

   Entonces, $X_{n+1} \in F$

2. $\exist j \le n /X_{n+1} = \neg X_j$

   Como $X_j\in F$ por **hipotesis inductiva**, entonces:
   $$
   X_{n+1}=\neg X_j \in F
   $$

3. $\exist j,i \le n / X_{n+1} = X_j*X_i,$  $*\in\{\land,\lor,\rightarrow\}$

   Como $X_j,X_i \in F$ por **hipotesis inductiva**, entonces:
   $$
   X_{n+1}= X_j * X_i \in F
   $$
   