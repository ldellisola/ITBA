# Teorema Chino del Resto

### Definición

Si consideramos las congruencias:
$$
x\equiv a_1~(m_1),~~x\equiv a_2~(m_2),~~\dots,~~x\equiv a_i~(m_i)
$$
con $a_i,m_i\in\N$, $m_i\bot m_j ~~\forall i\neq j$,  $i \in \N$

Entonces $\exist !x_0 \in [0,(m1\ .\ m_2\ .\ \dots\ .\ m_i)-1] $ tal que $x_0$ es solución del sistema de congruencias. Además todas las soluciones del sistema cumple con:
$$
x \equiv x_0~~~(mod~m_i)~~\forall i
$$
Si los $m_i$ no son coprimos, entonces no se puede asegurar que haya una solución, pero puede que la haya.

### Ejemplo

Encontrar el resto de dividir $x$ por $385$ dado que:
$$
x\equiv 1~~(5)~~~~x\equiv 2~~(7)~~~~x\equiv 4~~(11)
$$

- Verifico que puedo aplicar el TCR

$$
5\bot 7~~~y~~~7\bot11~~~y~~~11\bot 5
$$

Entonces $\exist!x_0\in[0,384]$ y cumple con las congruencias previamente establecidas.

- Resuelvo de a partes las congruencias:

$$
\begin{array}{}
    x\equiv 1~~(5)\rightarrow~~~~1,6,11,\underline {16},\dots	\\
    x\equiv 2~~(7)\rightarrow~~~~2,9,\underline {16},\dots		\\
\end{array}

\left\}
\begin{array}{} 
\\
\therefore x\equiv16~~(35)\\
\\

\end{array}
\right.
$$

$$
\begin{array}{}
    x\equiv 16~~(35)\rightarrow~~~~16,51,86,121,156,\underline {191},\dots	\\
    x\equiv 4~~(11)\rightarrow~~~~4,15,26,37,48,\dots,\underline {191},\dots		\\
\end{array}

\left\}
\begin{array}{} 
\\
\therefore x\equiv191~~(385)\\
\\

\end{array}
\right.
$$

Entonces, podemos ver que el resto de dividir $x$ por $385$ es $191$.