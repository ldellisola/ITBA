# Demostración

Sean $h,g:\N^k\rightarrow\N$ funciones RP y $P^m$ un predicado RP
$$
f:\N^m\rightarrow\N/f(\vec x ) = 
\left\{
	\array{
    q(\vec x)	&&	\vec x \in P^m \\
    h(\vec x)	&& 	else
	}
\right.
$$
$f$ es RP.

#### Demo

Como $P^m$ es un predicado RP, entonces $C_P:\N^m\rightarrow\{0,1\}$ es su funcion caracteristica.

Defino $f$:
$$
f:\N^m\rightarrow\N/f(x_1,\dots,x_n) =
\left\{
	\array{
		h(x_1,\dots,x_n)&&\text{si } (x_1,\dots,x_n)\in P\\
		g(x_1,\dots,x_n)&&\text{sino }
	}
\right.
$$
Y $f$ es RP por se composicion de RP.

