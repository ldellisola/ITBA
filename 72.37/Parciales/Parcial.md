## 1

### 1.1

Las claves candidatas son:
$$
GB\\GAC\\GAD\\GAE
$$
Para obtenerlas comence viendo que elementos no estaban presentes a la derecha de ninguna dependencia funcional, y con eso llegue a que $G$ tiene que ser la clave o parte de la clave.

Luego, al calcular $(G)^+$ me di cuenta que $G$ solo no puede ser la clave por que:
$$
(G)^+ = \{G\}
$$
Entonces tiene que ser parte de la clave.

Por otro lado, calculando el resto de las claves me encontre con:
$$
(A)^+ = \{A\}\\
(B)^+ = \{A,B,C,D,E\}\\
(C)^+ = \{C,D,E\}\\
(D)^+ = \{D\}\\
(E)^+ = \{E\}\\
$$
De este calculo puedo obtener que $GB$ es parte del conjunto de claves, ya que:
$$
(GB)^+ = \{A,B,C,D,E,G\}
$$
Pero puede haber otras claves. Por eso volvi a revisar las dependencias y descubri que la unica forma de calcular $A$, sin utilizar $B$ es mediante la reflexividad, por lo que puede llegar a ser parte de una clave:
$$
(AC)^+ = \{C,D,E,B,A\}\\
(AD)^+ = \{A,D,B,E,C\}\\
(AE)^+ = \{A,E,C,D,B\}\\
$$
Entonces puedo ver que todas esas combinaciones, en conjunto con $(G)$, pueden definir a la relacion.



### 1.2.1

$R_1(A,B,D)$ $R_2(A,C,D,E,G)$



Calculo para $R_1$

$f1 = C -> DE,AE -> C , AD -> B,B -> AE$

$X = CEG$

Defino Tomo a $C$ y lo elimino de $X$ ($X=EG$ )

Agarro la dependencia $AE -> C$ y la dependencia $C -> DE$. 

Las uno y obtengo $AE -> DE$. Como no es trivial la guardo.

Como no hay mas dependencias que tengan a $C$, paso a la proxima etapa.

Saco de $f1$ las dependencias que contienen a $C$ y agrego la nueva dependencia calculada.

$f1 = AD -> B, B -> AE, A->D$

Como $X != \empty$, tomo $E$ y lo elimino de $X$. ($X=G$ )

Agarro las dependencias $B -> AE$ y $AE -> DE$.

Las uno y obtengo $B-> DE$. Como no es trivial la guardo.

Como no hay mas dependencias que tengan a $E$, paso a la proxima etapa.

Saco de $f1$ las dependencias que contienen a $E$ y agrego la nueva dependencia calculada.

$f1 = AD -> B, A->D$

Como $X != \empty$, tomo $G$ y lo elimino de $X$. ($X=0$ )

Como no hay dependencias que contengan a $G$ en $f1$, termino con esta variable.

Como $X = \empty$, entonces termine el algoritmo



$\pi_{R_{1}} = \{ AD \rightarrow B , A \rightarrow D\}$



Para calcular el de $R_2$ es analogo, pero no me da el tiempo. El resultado seria:
$$
\pi_{R_2} = \{ AD \rightarrow AE, C \rightarrow DE, AE \rightarrow C \}
$$

### 1.2.2

$R_1(A,B,D)$ $R_2(A,C,D,E,G)$

Como solo tengo dos esquemas, puedo verificar si que no se perdio informacion si alguna de las siguentes dependencias funcionales pertenecen a $F^+$:
$$
\array{
	(R_1 \cap R_2) \rightarrow R_1 - R_2 \\
	(R_1 \cap R_2) \rightarrow R_2 - R_1
}
$$
A partir de los valores que tengo, puedo calcular:
$$
R_1 \cap R_2 = AD \\
R_1 - R_2 = B \\
R_2 - R_1 = ACEG
$$
Entonces, obtendria la siguentes dependencias:
$$
\array{
	(1) && AD \rightarrow B \\
	(2) && AD \rightarrow ACEG \\
}
$$
Y como $(1) \in F^+$, puedo decir que no hay perdida de informacion.



## 2

### 2.1

| A        | B        | C     | D     | E        |
| -------- | -------- | ----- | ----- | -------- |
| $a_1$    | $a_2$    | $a_3$ | $a_4$ | $a_5$    |
| $b_{11}$ | $b_{12}$ | $a_3$ | $a_4$ | $b_{15}$ |

 Aplico $CD \rightarrow E$:

| A        | B        | C     | D     | E     |
| -------- | -------- | ----- | ----- | ----- |
| $a_1$    | $a_2$    | $a_3$ | $a_4$ | $a_5$ |
| $b_{11}$ | $b_{12}$ | $a_3$ | $a_4$ | $a_5$ |

Aplico $E \rightarrow A$

| A     | B        | C     | D     | E     |
| ----- | -------- | ----- | ----- | ----- |
| $a_1$ | $a_2$    | $a_3$ | $a_4$ | $a_5$ |
| $a_1$ | $b_{12}$ | $a_3$ | $a_4$ | $a_5$ |

Creo la junta $J(ADE,ABC)$ para utilizar la dependencia multivaluada, :

| A       | B        | C     | D     | E       |
| ------- | -------- | ----- | ----- | ------- |
| $a_1$   | $a_2$    | $a_3$ | $a_4$ | $a_5$   |
| $a_{1}$ | $b_{12}$ | $a_3$ | $a_4$ | $a_{5}$ |

obtengo que $BD(CE) =\{EA\}$

### 2.2

Mediante axiomas, puedo decir que :
$$
CD \rightarrow E \rightarrow A\\ \Rightarrow \\ CD \rightarrow A
$$


## 3

Es falso, lo voy a probar con un ejemplo:

| G    | E    | B    |
| ---- | ---- | ---- |
| 1    | 2    | 3    |
| 2    | 2    | 4    |
| 3    | 4    | 7    |

En esta tabla se puede ver que $B$ depende de $GE$, ya que $B = G+E$. Pero podemos ver en las primeras dos columnas, que mientras que el valor de $B$ es único para cada par $GE$, el valor no es único para cada valor de $E$. 

Vemos claramente que $2 \rightarrow 3$ y $2 \rightarrow 4$.