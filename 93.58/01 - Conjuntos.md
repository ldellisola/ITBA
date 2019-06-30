# Conjuntos

### Relación de Inclusión

Sean $A$, $B$ conjuntos, entonces $A\sub B \Leftrightarrow x\in A \Rightarrow x\in B$

### Conjunto de Partes de un Conjunto

Dado un conjunto $U$, el conjunto de partes de $U$ es:
$$
P(U) = \{A/A\sub U\}
$$

### Conjunto Universal

El conjunto universal es el conjunto $U$ definido de antemano, a partir del cual se forman todos los conjuntos de interés.

## Operaciones

1. Unión:

$$
A\cup B=\{ x/ x\in A \or x\in B \}
$$

2. Intersección:

$$
A \cap B =\{ x/ x\in A \and x \in B  \}Diferencia:
$$

3. Diferencia:

$$
A-B=\{ x/ x\in A \and x \notin B \}
$$

4. Complemento:

$$
\overline A = U-A = \{x/ x\notin A\}
$$

## Propiedades

1. $A\cup B = B\cup A$
2. $(A\cup B)\cup C = A\cup (B\cup C)$
3. $A\cup (B\cap C) = (A \cup B )\cap (A\cup C)$
4. $\overline {\overline{A}} = A$
5. $A \cup \empty = A$
6. $\overline \empty = U$
7. $A \cup U = U$
8. $A=B \Leftrightarrow A \sub B \and B \sub A$

## Leyes de Morgan

1. $\overline{A \cup B} = \overline A \cap \overline B$
   - Demostración:

$$
z\in \overline{A\cup B}\\
\Leftrightarrow~~z \notin A\cup B\\
\Leftrightarrow~~!(z \in A\cup B)\\
\Leftrightarrow~~!(z \in A \or z \in B)\\
\Leftrightarrow~~!(z\in A) \and !(z\in B)\\
\Leftrightarrow~~z\notin A \and z\notin B\\
\Leftrightarrow~~ z\in \overline A \cap \overline B
$$



2. $\overline {A\cap B} = \overline A \cup  \overline B$
   - La demostración es análoga al primero.

## Diferencia Simétrica

Son los elementos que están en un conjunto pero no están en el otro.
$$
A \triangle B= (A\cup B)-(A\cap B)
$$

## Familias de Subconjuntos

### Operaciones

Dada una familia $F$ de subconjuntos de  $U$:

1. Unión:

$$
\bigcup_{A\in F}A = \bigcup F=\{ x\in U/~x\in A~para~algun~A ~de~F \}
$$

2. Intersección:

$$
\bigcap_{A\in F}A = \bigcap F = \{x\in U / x\in A~,~~\forall A\in F\}
$$

#### Ejemplo

Sea $U=\{1,2,3,4,5\}$ y $F = \{\{1,2,3\}, \{1,3,5\},\{1,3\}\}$ :
$$
\bigcup F = \{1,2,3,5\}\\
\bigcap F = \{1,3\}~~~~~~~~
$$


