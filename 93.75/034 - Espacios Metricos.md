# Espacios

El producto interno o escalar definido sobre $\mathbb V$ es una aplicación entre el conjunto de todos los pares de vectores $(\vec u, \vec v)$ y $\mathbb K,$ cuyo resultado es un escalar, denotado por $<u,v>.$ Este satisface las siguientes propiedades para todo $\vec u,\vec v, \vec w \in \mathbb {V}$ y todo escalar $\alpha \in \mathbb K:$
$$
<\cdot; \cdot> : \mathbb {V} \times \mathbb {V} \rarr \mathbb {K}
$$

- $<\vec u+ \vec v; \vec w> = <\vec u ;\vec w> + <\vec v; \vec w>$
- $<\alpha \vec u; \vec v> = \alpha <\vec u;\vec v>$
- $<\vec u,\vec v> = <\vec v;\vec u>^*$ donde $*$ denota el conjugado del numero complejo.
- $<\vec u;\vec u> \in \mathbb {R}, <\vec u;\vec u> = 0 \iff \vec u = 0 $

Sean $\vec u, \vec v \in \mathbb {R}^n,$ se define al **producto interno canónico** como:
$$
<\vec u; \vec v> = \sum_{i=1}^n u_i v_i
$$
Se usa en todos los espacios vectoriales. (No en los funcionales)

## Espacios Normados con una Norma Inducida

Sea $\mathbb V$ un espacio vectorial sobre un cuerpo $\mathbb K,$ se define una **norma** sobre $\mathbb {V}$ a una función $||\ ||:\mathbb {V} \rarr \mathbb {R}_0^+$ que cumple con:

- $\vec u \in \mathbb {V}; ||\vec u|| \ge 0 \iff \vec u = 0_{\mathbb {V}}$
- $\alpha \in \mathbb {K} \land \vec u \in \mathbb {V} \implies ||\alpha \vec u|| = |\alpha| ||\vec u||$
- $\vec u,\vec v \in \mathbb {V} \implies ||\vec u + \vec v|| \le ||\vec u|| + ||\vec v||$ (Desigualdad triangular)

Dado el espacio vectorial $\mathbb {V}$ con el producto interno $<\cdot ; \cdot>$ este induce la norma en $\mathbb {V}$ según:
$$
||\vec u||_2 = \sqrt{<\vec u;\vec u>}
$$
A partir de ahora se asume que toda norma que usamos es **norma 2** y no se lo va a indicar en el resto del curso.

Dado un espacio vectorial $\mathbb {V}$ normado, se define la **distancia** entre dos vectores como:
$$
d(\vec u;\vec v) = ||\vec u - \vec v||
$$
Esta distancia calculada con norma 2 se la conoce como **distancia euclidiana**. Tiene las siguientes propiedades:

1. $d(\vec u;\vec v) \ge 0$
2. $d(\vec v; \vec u) = 0 \iff \vec v = \vec u$
3. $d(\vec u;\vec v) = d(\vec v ;\vec u)$
4. $\forall v \in \mathbb {V}: d(\vec u ; \vec w) \le d(\vec u;\vec v) + d(v ; \vec w)$ 
5. $|<\vec u;\vec v>| \le ||\vec u|| ||\vec v ||$

Sea $\mathbb {V}$ un espacio vectorial real con producto interno $<\cdot>$ y la norma que el induce $||\cdot||.$ Se define el angulo entre los vectores $\vec u,\vec v \in \mathbb {V}$ como:
$$
\cos \theta_{\vec u\vec v} = \frac{<\vec u>}{ ||\vec u|| ||\vec v||}
$$
La desigualdad de Cauchy-Schwarz establece que:
$$
-1 \le \cos \theta _{\vec u\vec v} \le 1
$$
Al tener definido el ángulo entre dos vectores, se puede definir dos conceptos importantes:

- **Ortogonalidad**: $\vec v,\vec u \in \mathbb {V}, <\vec u;\vec v> = 0$ y se lo nota como $\vec u \bot \vec v$
- **Colinealidad**: $\vec v,\vec u \in \mathbb {V}, \alpha \in \mathbb {K}: \vec u = \alpha \vec v \iff\vec u || \vec v$

## Bases Ortonormales

Un conjunto de vectores $B=\{\vec b_1, \dots,\vec b_n\}$ se llama **ortogonal** si:
$$
\forall i \neq j:<\vec b_i; \vec b_j> =0
$$
Si el conjunto es linealmente independiente, entonces forman una **base ortogonal**. Si ademas, $<\vec b_i;\vec b_j>=1$ el conjunto es una **base ortonormal**.

Si la base es ortonormal, se pueden obtener sus coordenadas de forma inmediata. Sea $B = \{\vec v_1,\dots,\vec v_n\}$ una base ortonormal de $\mathbb {V}$ y sean $\vec u \in \mathbb {V},$ entonces:
$$
\vec u = \sum_{i=1}^n \alpha_i \vec v_i
$$
Tomando el producto interno con cada uno de los elementos de la base
$$
<\vec v_j,\vec u> = \sum_{i=1}^n \alpha_i <\vec v_j; \vec v_i> = \alpha_j
$$

## Subespacios Ortogonales

Sean $\mathbb {S}_1, \mathbb {S}_2$ subespacios de $\mathbb {V}, B_1$ una base ortogonal de $\mathbb {S}_1$ y $B_2$ una base ortogonal de $\mathbb {S}_2.$ Podemos decir:
$$
B_1 \cup B_2 \text{ es un conjunto ortogonal}\\ \implies \mathbb {S}_1 \bot \mathbb {S}_2 
$$
 Si la union de las bases generan $\mathbb {V}$ entonces $ \mathbb {S}_1$ se denomina **completamente ortogonal** de $\mathbb {V}.$

Es util dividir a un vector $\vec u$ en dos subespacios ortogonales:
$$
\vec u = \vec v + \vec w / \vec v \in \mathbb {S}_1 \land \vec w \in \mathbb {S}_2
$$

## Proyectores Ortogonales

Los proyectores ortogonales nos permiten descomponer a un vector en un conjunto de subespacios ortogonales. Estos se definen como:
$$
\mathbb {B}_{\vec u}(\vec v) = \frac{<\vec u;\vec v>}{||\vec u||^2} \vec u
$$
Esta expresión nos da la parte $L$ del vector. La parte $\Pi$ se obtiene por diferencia:
$$
\vec v_\bot = \vec v - \mathbb {P}_{\vec u}(\vec v)
$$
<img src="Resources/Untitled/Screen Shot 2022-08-18 at 17.53.13.jpg" alt="Screen Shot 2022-08-18 at 17.53.13" style="zoom:50%;" />

El **método de Gramd-Schmidt clasico** nos permite lograr el objetivo. Estos son los pasos:

1. Elegir un vector de $B \in \mathbb {R}^n$ y asignamos a $\hat q_1$ el verso correspondiente:
   $$
   \hat q_1 \larr \frac{\vec u_1}{||\vec u_1||}
   $$

2. Elegimos $\hat q_2$ como el vector complementario:
   $$
   \vec q_2 = \vec u_2 - \mathbb {P}_{\hat q_1}(\vec u_2) = \vec u_2 - <\hat q_1;\vec u_2> \hat q_1
   $$

3. Y lo normalizamos:
   $$
   \hat q_2 \larr \frac{\vec q_2}{\vec q_2}
   $$

4. Elegimos $q_3:$
   $$
   \vec q_2
   $$
   ==FALTA==

Este método tiene los siguientes problemas:

==FALTA==

**Método de Gramd-Schmidt Modificado** ==FALTA==





