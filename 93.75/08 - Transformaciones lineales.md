# Transformaciones Lineales

En el marco del algebra lineal, las funciones se llaman **transformaciones**  y vamos a estudair un subconjunto llamado transformaciones lineales. Una transformacion lineal es una función cuyo dominio es $\mathbb V$ y su imagen es $\mathbb W:$
$$
T: \mathbb V \rarr \mathbb W
$$
La dimensión del dominio y la imagen no tienen por que ser la misma,

> **Definición 3.1**
>
> Sea $(\mathbb V,\oplus,\otimes)$ un espacio vectorial dominio y $(\mathbb W,\boxplus,\boxtimes)$ otro espacio vectorial dominio. Diremos que una **transformación** $T: \mathbb V \rarr \mathbb W$ es **lineal** si y solo si se cumple con:
> $$
> \forall \vec u,\vec v \in \mathbb V,\alpha \in \mathbb K:T(\vec u \oplus\alpha \otimes \vec v) = T(\vec u) \boxplus \alpha \boxtimes T(\vec v)
> $$

Una transformación lineal $T$ se llama:

- **Monomorfismo**: Si $T$ es inyectiva.
- **Epimorfismo**: Si $T$ es sobreyectiva.
- **Isomorfismo**: Si $T$ es biyectiva.
- **Endomorfismo**: Si $\mathbb{V = W}.$
- **Automorfismo**: Si $\mathbb{V = W}$ y $T$ es biyectiva.
- **Funcional Lineal**: Si $\mathbb{W = K}.$

> **Proposición 3.1.1**
>
> Para conocer el comportamiento de una transformación lineal solo hace falta saber los valores que toma sobre los elementos de una base.

Se puede demostrar de la siguiente forma. Si $\vec u$ pertenece al dominio de $T$ y $B=\{\vec u_{1B},\dots,\vec u_{nB}\}$ es una base de este espacio, entonces:
$$
\vec u = \sum_{i=1}^n\alpha_i\vec u_{iB}
$$
Aplicando $T$ y sabiendo que es lineal, puedo obtener:
$$
\array{
T(\vec u) &= & T\left(\sum_{i=1}^n \alpha_i \vec u_{iB}\right)
\\
&=&\sum_{i=1}^n \alpha_i T(\vec u_{iB})

}
$$
Por lo tanto, para concer el valor que toma $T(\vec u)$ solo hace falta conocer $T(\vec u_{iB})$

## Matriz Asociada a una Transformación Lineal

Sea la transformación lineal $T:$
$$
T:\mathbb{V \rarr W}
$$
Vamos a obtener la matriz asociada a la misma. Los elementos de la matriz dependeran de cuales sean las bases que se utilicen en $\mathbb V$ y $\mathbb W.$ Sean $B,B'$ las bases respectivamente, si $\vec w \in \mathbb W$ y $\vec v \in \mathbb V$ y se cumple con:
$$
T(\vec v) = \vec w
$$
Veremos que existe una matriz $T_{BB'}$ tal que:
$$
T_{BB'}\vec v_B = \vec w_{B'}
$$
Para obtener esta matrix vamos a utilizar a la base del dominio $B.$ Sean $\vec u_i \in B$ entonces la matriz se define como:
$$
T_{BB'} = (T(\vec u_1);T(\vec u_2),\dots,T(\vec u_n))
$$
Es importante saber que la entrada de una transformación lineal debe estar en una base especifica definida en la transformación lineal. De estar en otra base debemos realizar un cambio de base para poder utilizarlo.

## Matriz de Cambio de Base

La matriz de cambio de base es equivalente a realizar una transformación lineal donde el dominio y la imagen son el mismo cuerpo:
$$
C: \mathbb {V\rarr V}
$$
 Sean $B,B'$ bases de $\mathbb V$ la matriz asociada a esta transformación es $C_{BB'}$ y convierte a un vector en base $B$ a uno en base $B'.$

> **Definición 3.3**
>
> La matriz de cambio de base tendrá como columnas las coordenadas de los vectores de $B'$ expresadas en la base $B.$ Como la matriz $C_{BB'}$ tiene rango máximo, es invertible y la matriz de cambio de base inversa es implemente la inversa de esta matriz:
> $$
> C_{B'B} = C_{BB'}^{-1}
> $$

## Imagen y Nucleo de una Transformación Lineal

Existen tres subespacios fundamentales asociados a una matriz $A\in \mathbb K^{m\times n}:$

- El espacio columna $\text{col(A)} \in \mathbb {K}^m.$ Es el espacio generado por las columnas de la matriz, es decir la imagen de la transformación lineal asociada con $A.$

- El espacio fila $\text{row}(A) \in \mathbb K^n.$ Es el espacio generado por las filas de la matriz, es decir la imagen de la transformación lineal asociada con $A'.$

- El espacio nulo $\text{nul}(A) \in \mathbb K^n.$ Es el subespacio representado por:
  $$
  \text{nul}(A) = \{\vec x \in \mathbb K^n:A\vec x = \vec 0\}
  $$

La dimensión del subespacio $\text{col}(A)$ nos dice la cantidad de columnas linealmente independientes, es decir $\text{rango}(A).$ Como el número de columnas linealmente independientes es el mismo que el de las filas:
$$
\text{rango}(A)  = \dim(\text{col}(A)) = \dim(\text{row(A)})
$$
Si $\dim(row(A))=n$ entonces el espacio nulo solo va a contener al vector $\vec 0.$

> **Proposición 3.1.2**
>
> Sean $\mathbb{V,W}$ dos espacios vectoriales de $\mathbb K,$ sea $\mathbb{V}$ de dimensión finita y $T:\mathbb {V\rarr W}$ una transformación lineal cuya matrizx asociada es $A\in \R^{m\times n}$ entonces:
> $$
> \array{
> \dim(\mathbb{V}) = \dim(\text{nul}(A)) + \dim(\text{col}(A)) & \dim(\text{col}(A)) \le \dim(\mathbb{W})
> }
> $$

El **nucleo** de una transformación lineal se obtiene a partir del espacio nulo:
$$
\text{nucleo(T)} = \text{gen}(\text{nul}(A))
$$
La imagen de una transformación lineal se obtiene a partir del espacio columna. Sea $B$ la base del espacio columna:
$$
\text{imagen}(T) = \text{gen}(\vec u_1,\dots,\vec u_n)/ \vec u_i \in B
$$
 