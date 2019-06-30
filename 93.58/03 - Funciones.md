# Funciones

Sea $R \sub A \times B$, $R$ es una función de $A$ a $B$.

$f:A\rightarrow B$ es una función si cumplen simultáneamente:

- $aRb$ $\forall a \in A$/ $(a,b)\in R$ $\forall a \in A$
- $(a,b) \in R$ y $(a,c)\in R \Rightarrow b = c$

Entonces, $\forall a \in A$, $\exist b \in B$ único tal que $aRb$

Y $dom(f) = A$,  $codom(f) = B$ y $Im(f) \sub B$.



## Inyectividad

$f$ es inyectiva si $f(a) = f(b) \Rightarrow a = b$ 

## Sobreyectividad

$f$ es sobreyectiva si $\forall b \in B,~\exist a\in A/ f(a)=b$
$$
\Rightarrow Im(f) = B
$$

## Biyectividad

Si la función $f$ es Inyectiva y Sobreyectiva entonces es Biyectiva y $\exists f^{-1}$

## Función Inversible

Sea $f:A\rightarrow B$ una función, decimos que $f$ es inversible si $\exist g:B\rightarrow A/~g_of(x)=x$ y $f_og(x)=x$. Entonces podemos llamar a $g$ inversa de $f$ y se nota como $g = f^{-1}$

### Teorema

$$
f~es~inversible \Leftrightarrow f~es~biyectiva
$$

#### Demostración

- **IDA:**

Sabemos que  $f$ es inversible, entonces $\exist g:B\rightarrow A/~g_of(x)=x,~f_og(x)=x$ y $g=f^{-1}$ 

Veo que sea inyectiva:
$$
f(x_1) = f(x_2)\\
f^{-1}(f(x_1)) = f^{-1}(f(x_2))\\
x_1 = x_2
$$
Veo que es sobreyectiva:

Tomo $a = g(b)$
$$
f(a)=f(g(b))=f_og(b)=b
$$

- **VUELTA:**

Sabemos que $f$ es inyectiva y sobreyectiva.

Defino $g:B\rightarrow A/~g(b)=a$, siendo $a/f(a)=b$. $a$ existe por que $f$ es sobreyectiva y $a$ es único por que $f$ es inyectiva.
$$
\array{
	g_of(a)=g(f(a))=g(b)=a\\
	f_og(b)=f(g(b))=f(a)=b
}
$$
Entonces podemos ver que $g$ es la función inversa de $f$, por lo que $f$ es inversible.

## Función Característica

Sea $A \sub B$
$$
\chi_A:B \rightarrow \{0,1\}/~\chi_A(t)=
\left\{
	\array{
	1 	&	t\in A\\
	0	&	t \notin A
	}
\right.
$$
