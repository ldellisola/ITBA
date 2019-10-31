# Semántica

## Valuación

Una valuación es una función.

$v:Form \rightarrow \{0,1\}/v$ cumple con:
$$
\array{
a)	&	\alpha \in F \Rightarrow v(\neg \alpha) = 1 - v(\alpha)\\
b)	&	\alpha,\beta \in F \Rightarrow v(\alpha \or \beta) = v(\alpha) \times v(\beta) = \max\{v(\alpha),v(\beta)\} \\
c)	&	\alpha,\beta \in F \Rightarrow v(\alpha \and \beta) = min\{v(\alpha),v(\beta)\}\\
d)	&	\alpha,\beta \in F \Rightarrow v(\alpha \rightarrow \beta) = max\{1-v(\alpha),v(\beta)\}
}
$$

- **Teorema**: Sea $f:Var \rightarrow \{0,1\}/ f$ es una función, $\Rightarrow \exist !v$ valuación que extiende a $f$.
- **Teorema**: Sea $\alpha \in F, v,w\ $valuaciones $/~~v|Var(\alpha)= w|Var(\alpha) \Rightarrow v(\alpha)=w(\alpha)$, entonces $Var(\alpha)=\{p_j\in Var/ p_j \text{ aparece en }\alpha\}$.

### Equivalencia

Sean $\alpha,\beta \in F$, decimos que son equivalentes si $v(\alpha)=v(\beta) ~~ \forall v$ valuación. Se lo nota como $\alpha \equiv \beta$.

## Clasificación de Fórmulas

Sea $\alpha \in F$, puede ser parte de una de las siguientes categorías:

1. $\alpha$ es una <u>tautología</u> si $v(\alpha) = 1 ~~\forall v $.
2. $\alpha$ es una <u>contradicción</u> si $v(\alpha) = 0 ~~\forall v$
3. $\alpha$ es una <u>contingencia</u> si no es tautología o contradicción.

## Función Booleana

Una función se llama booleana si se puede escribir como:
$$
f:\{0,1\}^n\rightarrow\{0,1\}/n\in \N_{\ge1}
$$
Se pueden mapear funciones booleanas a valuaciones y viceversa.

## Conectivos Adecuados

Sea $C$ un conjunto de colectivos, sea $F_C$ el conjunto de fórmulas inducidas por $C$, decimos que $C$ es adecuado si $\forall \alpha \in F, \exist \beta \in F_C / \alpha \equiv \beta$.

Otra forma de decirlo es que se deben poder hacer los 4 conectivos comunes $\{\rightarrow,\neg,\and,\or\}$ a partir de estos conectivos.