# Demostración

Sean $h,g:\mathbb{N}^k\rightarrow\mathbb{N}$ funciones RP y $P^m$ un predicado RP
$$
f:\mathbb{N}^m\rightarrow\mathbb{N}/f(\vec x ) = 
\left\{
	\array{
    q(\vec x)	&&	\vec x \in P^m \\
    h(\vec x)	&& 	else
	}
\right.
$$
$f$ es RP.

#### Demo

Como $P^m$ es un predicado RP, entonces $C_P:\mathbb{N}^m\rightarrow\{0,1\}$ es su funcion caracteristica.

Defino $f$:
$$
f:\mathbb{N}^m\rightarrow\mathbb{N}/f(x_1,\dots,x_n) =
\left\{
	\array{
		h(x_1,\dots,x_n)&&\text{si } (x_1,\dots,x_n)\in P\\
		g(x_1,\dots,x_n)&&\text{sino }
	}
\right.
$$
Y $f$ es RP por se composicion de RP.

