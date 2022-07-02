# Gramáticas

Una gramática $G,$ según la definición de Chomsky es una tupla:
$$
G= <V_N,V_T,P,S>
$$
Donde:

- $V_N$ es el conjunto de símbolos **no terminales**.
- $V_T$ es el conjunto de símbolos **terminales**.
- $P$ es el conjunto de **reglas gramaticales**.
- $S$ es el conjunto de **símbolos** distinguidos o iniciales.

## Reglas de Producción 

Las reglas de producción, o reglas gramaticales son pares ordenados en:
$$
(V_T\cup V_N)^+ \times (V_T \cup V_N)^*
$$
Para estas reglas se usa la siguiente notación:
$$
\array{\alpha \rarr \beta & \text{o} &(\alpha,\beta) }
$$
Y se interpretan como:

- $\alpha$ produce $\beta$
- $\beta$ se deriva de $\alpha$

Toda cadena de un lenguaje se forma utilizando las reglas de producción a partir del símbolo distinguido.

## Clasificación de Chomsky

Las gramáticas se pueden clasificar en 4 clases, según la forma de sus reglas gramáticas:

- **Gramáticas sin restricciones (tipo 0)**:
  $$
  \array{\alpha \rarr \beta\\
  \alpha \in (V_N\cup V_T)^+, \beta \in (V_N\cup V_T)^*
  }
  $$

- **Gramáticas sensibles al contexto (tipo 1)**:
  $$
  \array{\alpha A \beta \rarr \alpha \gamma \beta
  \\
  \alpha,\beta \in (V_N\cup V_T)^*, \gamma \in (V_N\cup V_T)^+, A \in V_N
  }
  $$

- **Gramáticas independientes del contexto (tipo 2)**:
  $$
  \array{A \rarr \beta
  \\
  \alpha \in (V_N\cup V_T)^*, A \in V_N
  }
  $$

- **Gramáticas regulares (tipo 3)**: Se puede definir de dos formas:
  $$
  \array{
  A \rarr aB \\ A \rarr a\\
  a \in \Sigma, A,B \in V_N
  }
  $$
  O:
  $$
  \array{
  A \rarr Ba \\ A \rarr a\\
  a \in \Sigma, A,B \in V_N
  }
  $$

Los lenguajes generados por las distintas clases gramáticas están incluidos en las clases de grupo inferior.

<img src="Resources/03 - Gramaticas/Screen Shot 2022-06-30 at 14.45.20.jpg" alt="Screen Shot 2022-06-30 at 14.45.20" style="zoom: 33%;" />

## Lenguajes

Un lenguaje es un conjunto de cadenas $L/ L\subseteq \Sigma^*.$

Se define a un lenguaje generado por una gramática como:
$$
L(G)= \{\alpha \in V_T^*, s\in S /s \rarr^+ \alpha\}
$$

Para que un lenguaje sea de un tipo determinado, entonces tiene que existir una gramática de ese tipo tal que lo genere. Para que este sea estrictamente de un tipo, entonces ademas no debe existir una gramática de un tipo superior que genere al lenguaje.

### Operaciones

Sea $\Sigma$ un alfabeto y $A,B$ lenguajes sobre $\Sigma:$

- **Concatenación de lenguajes**: 
  $$
  A\cdot B = AB = \{\alpha + \beta/ \alpha \in A, \beta\in B\}
  $$

- **Potencia de Lenguajes**:
  $$
  A^n = \left\{
  \array{
  \{\lambda\} & n=0\\
  A\cdot A^{n-1} & n\gt 0
  }
  \right.
  $$

-  **Clausura de un lenguaje**:
  $$
  A^+= \bigcup_{i=1}^\infty A^i
  $$

- **Clausura de Kleene de un lenguaje**:
  $$
  A^* = A^+ \cup \{\lambda\}
  $$

