# Combinación Lineal

Se dice que $v\in V$ es combinación lineal de $v_1,v_2,\dots,v_n\in V$ si $\alpha_1,\alpha_2,\dots,\alpha_n \in \mathbb K/$
$$
v = \alpha_1 v_1+\alpha_2 v_2+\dots+\alpha_n v_n = \sum_{i=1}^{n}\alpha_iv_i
$$

## In/Depenencia Lineal

El conjunto de vectores $v_1,v_2,\dots,v_n$ es **Linealmente Independiente** ($LI$) si:
$$
\alpha_1 v_1+ \alpha_2 v_2+\dots+ \alpha_nv_n = 0 \Leftrightarrow\alpha_1 = \dots=\alpha_n = 0
$$
De no ser lineamente independiente, el conjunto es **Linealmente Dependiente** ($LD$)

### Teorema

Sea $\{v_1,\dots,v_n\}~~n\geq2$
$$
\{v_1,\dots,v_n\}~es~LD~~~(1) \Leftrightarrow \exist v_i/~ v_i~es~combinacion~lineal~de~v_1,\dots,v_n~~~(2)
$$

- Demostracion $(2) \Rightarrow (1)$

Vamos a probar que $\exists \alpha_1,\dots,\alpha_n \neq 0 /~\alpha_1v_1+\dots + \alpha_nv_n=0$

Como suponemos que vale $(2)$, hay un vector $v_i$ que es combinacion lineal del resto. Sin perder generalidad, podemos asumir que ese vector es $v_1$.
$$
v_1 = \alpha_2v_2+\dots + \alpha_nv_n
$$
$\therefore$ El conjunto $\{v_1,v_2,\dots,v_n\}$ es $LD$.

- Demostracion $(1)\Rightarrow (2)$

Sabemos que $\{v_1,v_2,\dots,v_n\}$ es $LD$. Entonces $\exists \alpha_1,\dots,\alpha_n$ con algun $\alpha_n \neq 0 /~~$
$$
\alpha_1v_1+\dots + \alpha_nv_n=0
$$
Si  perder generalidad, podemos suponer que $\alpha_1 \neq 0$, entonces:
$$
\alpha_1v_1 = -\alpha_2v_2-\dots - \alpha_nv_n
$$
Multiplicando $\alpha_1^{-1}$ a ambos lados:
$$
v_1 = \frac {-\alpha_2} {\alpha_1}  v_2-\dots - \frac {\alpha_n} {\alpha_1}v_n
$$


 

