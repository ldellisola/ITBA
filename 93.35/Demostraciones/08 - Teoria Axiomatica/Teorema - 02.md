# Demostración

**Teorema <u>de la Deducción</u>**:

Sea $\alpha,\beta \in F, \Gamma \sube F$:
$$
\Gamma \vdash (\alpha\rightarrow\beta) \Leftrightarrow \Gamma \cup \{\alpha\} \vdash \beta
$$

#### Demo

La Ida es trivial, y la vuelta se hace por induccion en la longitudo de la prueba.

$\Rightarrow )$

Sabemos que $\Gamma \vdash (\alpha \rightarrow \beta) \Rightarrow \Gamma\cup \{\alpha\}\vdash (\alpha \rightarrow\beta)$  ya que $\Gamma \subseteq \Gamma \cup \{\alpha\}$ y $\Gamma \cup \{\alpha\} \vdash \alpha$ pues $\alpha \in \Gamma \cup \{\alpha\}$

Entonces, por $MP$ entre ambos datos:
$$
\Gamma \cup \{\alpha\} \vdash \beta
$$
$\Leftarrow )$

Por dato sabemos que:
$$
\Gamma \cup \{\alpha\} \vdash \beta
$$
Y queremos ver por inducción en la longitud de la prueba que:
$$
\Gamma \cup \{\alpha\} \vdash (\alpha \rightarrow \beta)
$$

- **Caso Base**: Sea $\alpha_1 = \beta$ prueba a partir de $\Gamma \cup \{\alpha\}$

  Hay distintos casos:

  1. $\beta$ es un axioma:	

     Entonces hago la prueba:
     $$
     \array{
     
     (1)&&& \beta &&&\text{ axioma}\\
     (2)&&& \beta \rightarrow (\alpha \rightarrow \beta) &&&\text{ axioma 1}\\
     (3)&&& \alpha \rightarrow \beta &&&\text{ MP entre (1) y (2)}
     
     }
     $$
     Como $\empty \vdash (\alpha \rightarrow \beta) \Rightarrow$ particularmente $\Gamma \vdash(\alpha \rightarrow \beta)$

  2. $\beta \subseteq \Gamma$

     Hago la prueba:
     $$
     \array{
     (1)&&& \beta &&&\text{ dato}\\
     (2)&&& \beta \rightarrow(\alpha \rightarrow \beta) &&&\text{ axioma 1}\\
     (3)&&& \alpha \rightarrow\beta &&&\text{ MP entre (1) y (2)}
     
     }
     $$

  3. $\beta = \alpha$

     En la teoría vimos que $\empty \vdash (\alpha \rightarrow \alpha)$, entonces en particulas $\Gamma \vdash (\alpha \rightarrow \alpha)$

- **Hipotesis Inductiva**: 

  Sea $\alpha_1,\dots,\alpha_k~~k\le n$, una prueba de $\beta$ a partir de $\Gamma \cup \{\alpha\} \Rightarrow $
  $$
  \Gamma \vdash (\alpha \rightarrow \beta)
  $$

- **Tesis Inductiva**:

  Sea $\alpha_1,\dots,\alpha_{n+1}$, una prueba de $\beta$ a partir de $\Gamma \cup \{\alpha\} \Rightarrow $
  $$
  \Gamma \vdash (\alpha \rightarrow \beta)
  $$

Sea $\alpha_1,\dots,\alpha_{n+1}=\beta$ una prueba a partir de $\Gamma \cup \{\alpha\}$, hago una prueba de $(\alpha\rightarrow\beta)$ a partir de $\Gamma$

Hay 3 casos:

1. $\beta$ es axioma

   Este caso se resuelve en el caso base.

2. $\beta \in \Gamma\cup \{\alpha\}$

   Este caso se resuelve en el caso base.

3. $\beta$ se obtiene por $MP$ a partir de $\alpha_j=(\alpha_i \rightarrow \beta)$ con $i,j \le n$

   Notemos que $\alpha_1,\dots,\alpha_i$ es prueba a partir de $\Gamma \cup \{\alpha\}$, con $i\le n$, entonces, por **Hipotesis Inductiva**:
   $$
   \Gamma \vdash (\alpha\rightarrow\alpha_i)
   $$
   Notemos que $\alpha_1,\dots,\alpha_j$ es prueba a partir de $\Gamma \cup \{\alpha\}$, con $j\le n$, entonces, por **Hipotesis Inductiva**:
   $$
   \Gamma \vdash (\alpha\rightarrow\alpha_j),~~~~~\alpha_j=(\alpha_i\rightarrow \beta)
   $$
   Queremos probar que $\Gamma \vdash (\alpha \rightarrow \beta)$:

   Sabemos que:
   $$
   \array{
   (1)&& \Gamma \vdash (\alpha \rightarrow \alpha_i) \\
   (2)&& \Gamma \vdash (\alpha \rightarrow (\alpha_i \rightarrow \beta))
   }
   $$
   Ahora voy a hacer una prueba:
   $$
   \array{
   (1) &&& (\alpha \rightarrow (\alpha_i \rightarrow \beta))\rightarrow((\alpha \rightarrow\alpha_i)\rightarrow (\alpha \rightarrow \beta)) &&& \text{Axioma 2}\\
   (2) &&& (\alpha\rightarrow (\alpha_i \rightarrow\beta)) &&& \text{Por Dato}\\
   (3) &&& (\alpha \rightarrow \alpha_i) \rightarrow (\alpha\rightarrow \beta) &&& \text{ MP entre (1) y (2)}\\
   (4) &&& (\alpha \rightarrow \alpha_i) &&& \text{Por Dato}\\
   (5) &&& (\alpha\rightarrow \beta) &&& \text{ MP entre (3) y (4)}\\
   }
   $$

$\therefore \Gamma \vdash (\alpha \rightarrow \beta)$

