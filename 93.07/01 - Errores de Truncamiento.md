# Error de Truncamiento

Los errores pueden ser representados de dos formas distintas:

- Error Absoluto:

$$
\mid X_{aprox} - X_{exacto} \mid
$$

- Error Relativo:

$$
\frac{ErrorAbs}{X_{exacto}}
$$

Dentro de los errores, hay dos tipos de errores:

- Error de Redondeo: Corresponden a los problemas donde la computadora no puede guardar todos los decimales de la respuesta, entonces lo redondea hacia un valor.
- Error de  Aproximación: Dependiendo de la implementación del algoritmo. Esto significa que el algoritmo no da una respuesta perfecta, sino que se trata de acercarse al valor exacto.

## Aproximaciones Iterativas Simples

Se pueden resolver ecuaciones de forma iterativa aplicando un simple algoritmo, pero primero debe cumplir con las siguientes hipótesis:

1. Sea $f:[a,b]\rightarrow R$ continua en $[a,b]$
2. Sea $f(a) \cdot f(b) \lt 0$
3. Sea $f$ derivable en $(a,b)/~ Sign(f')$ sea constante en $(a,b)$

Entonces $\exist!x_0 \in (a,b) /~~f(x_0) = 0$

### Implementación del Algoritmo

Pasos del algoritmo:

1. Igualo la función al valor de $y$ donde quiero encontrar $x_0$
2. Despejo la ecuación para que me quede de la siguiente forma: $x = q(x)$
3. Reescribo la ecuación de la forma $x_{n+1} = q(x)$
4. Itero varias veces hasta llegar al error deseado.

### Ejemplo

Tengo la función $f(x)=x^3-x-1$ y quiero encontrar $x/f(x)=0$

- Hipótesis:

  Como $f$ es un polinomio, es continua en $\R$. Elijo $a = 1$ y $b=2$, por lo que $f(1) \cdot f(2) = -1 \cdot5=-5 \lt 0$. Por ultimo, como es un polinomio, $f$ es derivable $n$ veces. Como queremos ver si la derivada es constante, derivo $f'$ y veo que $f''(x)=6 \cdot x$ y $f''(x) \neq 0~~ \forall x\in(1,2)$, entonces el signo de $f'$ es constante .

- Algoritmo

  1. $x^3-x-1 = 0$
  2. $x = \root{3} \of{x+1} = q(x)$
  3. $x_{n+1} = q(x_n) = \root 3 \of {x_n+1}$
  4. $x\sim 1.324717$

## Punto Flotante

El punto flotante es un estándar de la IEEE que permite crear números con alta precisión. Este tipo de notación permite mucha precisión en números muy peque;os, pero a medida que los números se van agrandando, el espacio entre los números tambien va creciendo.

La notación correspondiente es:
$$
x = (-1)^b \cdot(1+m) \cdot 2^{exp}
$$
Siendo:

- $b= \left\{ \array{   0 & x>0 \\ 1 & x \le 0   } \right.$
- $m \in \{0, 2^{-52}, 2^{-51}, \dots, 1 - 2^{-52} \} $
- $exp \in [-1022,1023]$

### Como Convertir un numero en decimal a Punto Flotante

Sea $d$ un numero en decimal.

Pasos:

1. Busco el exponente:

$$
sea~exp/~~2^{exp} \leq d \leq2^{exp+1}
$$

2. Busco la Mantisa:

   1. Busco $m$:
      $$
      m=\frac d {2^{exp}}-1
      $$

   2. Reescribo $m$ como una suma de potencias de $2$:
      $$
      m = 2^q+2^w + \dots+2^z
      $$

### Ejemplo

Quiero convertir 23 a punto flotante:

1. Busco el exponente: $exp = 4$
   $$
   16 = 2^4 \leq 23 \leq 2^5 = 32
   $$

2. Busco la mantisa::

$$
m=\frac {23} {16} - 1 = \frac 7 {16} = 7 \cdot 2^{-4} = (4+2+1) \cdot 2^{-4}=2^{-2} + 2^{-3} + 2^{-4}
$$

Entonces 23 se puede expresar como:
$$
23 = (-1)^0 \cdot (1+ 2^{-2} + 2^{-3}+2^{-4}) \cdot 2^4
$$


















