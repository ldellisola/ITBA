# Normalizacion

## 1

Demostrar las reglas de Inferenca para dependencias funcionales a partir de los axiomas de armstrong.

- <u>Reflexividad:</u>
  $$
  Y \subseteq X \Rightarrow X \rightarrow Y
  $$

- <u>Aumentación:</u>
  $$
  X \rightarrow Y \Rightarrow XZ \rightarrow YZ
  $$

- <u>Transitividad:</u>
  $$
  \left .
  	\array{
  	X \rightarrow Y \\
  	Y \rightarrow Z
  	}
  \right \}
  \Rightarrow 
  X \rightarrow Z
  $$

A partir de esas reglas demostrar:

- **Union:**
  $$
  \left .
  	\array{
  		X \rightarrow Y\\
  		X \rightarrow Z
  	}
  \right \}
  
  \Rightarrow 
  X \rightarrow YZ
  $$
  Demo:
  $$
  \array{
  	(1)	&	X \rightarrow Y \\
  	(2)	&	XZ \rightarrow YZ \\
  	(3) &	X \rightarrow Z  \Rightarrow X\rightarrow XZ\\
  	(4) &	\left . \array{
  					X \rightarrow XZ\\
  					XZ \rightarrow YZ
  					}
  			\right \} \Rightarrow X \rightarrow YZ
  }
  $$
  $(1)$ Por dato.

  $(2)$ Por aumentacion.

  $(3)$ Por dato $X \rightarrow Z$ y por reflectividad $X\rightarrow X$

  $(4)$ Por transitividad

- **PseudoTransitividad:**
  $$
  \left .
  	\array{
  		X \rightarrow Y \\
  		UY \rightarrow Z
  	}
  \right \}
  \Rightarrow XU \rightarrow Z
  $$
  Demo:
  $$
  \array{
  	(1)	&	X \rightarrow Y \\
  	(2)	&	XU \rightarrow YU \\
  	(3) &	\left \{
  				\array{
  					XU \rightarrow YU \\
  					YU \rightarrow Z
  				}
  			\right . \\
  	(4)	&	XU \rightarrow Z 
  }
  $$
  $(1)$ Por dato

  $(2)$ Por aumentacion

  $(3)$ Por dato

  $(4)$ Por transitividad

- **Descomposicion:**
  $$
  X \rightarrow YZ
  
  \Rightarrow
  \left\{
  	\array{
  		X \rightarrow Y \\
  		X \rightarrow Z
  	}
  \right.
  $$
  Demo:

  Por reflexividad, si $X \rightarrow YZ$, entonces $YZ \subset X$. Entonces: $X \rightarrow Z$ y $X\rightarrow Y$

## 2

Probar:
$$
\{XY \rightarrow Z, X\rightarrow Y\} \models X\rightarrow Z
$$

1. Utilizando los axiomas de Armstrong
   $$
   \array{
   	(1) && X \rightarrow Y && \text{Dato} \\
   	(2) && X \rightarrow XY && \text{Aumentacion sobre } (1) \\
   	(3) && XY \rightarrow Z && \text{Dato} \\
   	(4) && X \rightarrow Z && \text{Transitividad entre (2) y (3)} \\
   }
   $$

2. Aplicando la definicion de dependencia funcional

   ==???????==



## 3

Sea $R( A1, A2, \dots , An)$ y su descomposición en $R_1$ y $R_2$ tal que $R_1 \cap R_2 = A_n$ y $\forall X → Y \in F^+$ se cumple que $A_n \not \subseteq XY$. 

Decidir si dicha descomposición es o no sin pérdida.

==???==



## 4

Dado $Expediente(C, E, A, R)$ con las restricciones $F = \{ C→E; E→A; C,A→R\}$

1. **Hallar F minimal.**

   Enumero 1
   $$
   \array{
   	(1) && C \rightarrow E\\
   	(2) && E \rightarrow A\\
   	(3) && CA \rightarrow R
   }
   $$
   Busco atributos redundntes:

   Como $C \rightarrow E$ y $E \rightarrow A$, entonces por transitividad $C \rightarrow A$. Entonces en la dependencia $(3)$ podemos decir que $A$ es redundante, ya que se puede obtener a partir de $C$.
   $$
   \array{
   	(1) && C \rightarrow E\\
   	(2) && E \rightarrow A\\
   	(3) && C \rightarrow R
   }
   $$
   Finalmente obtengo que $F_m = \{ C\rightarrow E ; E \rightarrow A ; C \rightarrow R  \}$

2. **Determinar todas las claves de R.**

   El conjunto de las claves es $\{C\}$ por no estar a la derecha de ninguna dependencia.

3. **Hallar una descomposición en BCNF sin pérdida de información y que preserve las dependencias funcionales.**

   Como $E \rightarrow A$ rompe con BCNF por que no es una dependencia funcional trivial y $E$ no es parte de la clave, tengo que dividir a nuestra tabla en dos tablas:

   Tabla 1: $\{C, E,R\}$ Clave: $C$

   Tabla 2: $\{E,A\}$ Clave: $E$

4. **Hallar una descomposición en 3NF sin pérdida de información y que preserve las dependencias funcionales.**

   Básicamente lo hace a ojo. Tomo $F_m$ y uno todo lo que pueda usando el axioma de la union. Esto me da el siguiente conjunto:
   $$
   \{ C\rightarrow ER, E \rightarrow A \}
   $$
   Entonces puedo dividirlo en las mismas tablas que antes:

   Tabla 1: $\{C, E,R\}$ Clave: $C$

   Tabla 2: $\{E,A\}$ Clave: $E$



## 5

Dado $R(A, B, C, D, E, F)$ y $F = \{ A→BC, B→C, C→AC, AD→E, AE→F \}$ 

1. **Hallar F minimal.**

   Listo las dependencias  con un solo atributo a la derecha:
   $$
   \array{
   	(1) && A \rightarrow B \\
   	(2) && A \rightarrow C \\
   	(3) && B \rightarrow C \\
   	(4) && C \rightarrow C \\
   	(5) && C \rightarrow A \\
   	(6) && AD \rightarrow E \\
   	(7) && AE \rightarrow F
   }
   $$
   Elimino las redundancias:

   - $(4)$ se va por que es trivial
   - $(2)$ se va por que se obtiene por transitividad $(1) \Rightarrow (2)$

   $$
   \array{
   	(1) && A \rightarrow B \\
   	(3) && B \rightarrow C \\
   	(5) && C \rightarrow A \\
   	(6) && AD \rightarrow E \\
   	(7) && AE \rightarrow F
   }
   $$

   Entonces obtengo que $F_m$:
   $$
   \{ A\rightarrow B, B\rightarrow C, C \rightarrow A, AD \rightarrow E, AE \rightarrow F \}\\
   \{A,E,F\} \{A,B,C,D\}
   $$

2. **Determinar todas las claves de R.**

   Primero busco todos los atributos que no se encuentren a la derecha de ninguna dependencia funcional:
   $$
   \{D\}
   $$
   Pero como veo que solo puedo generar $D$ a partir de esa clave $[(D)^+=\{D\}]$, ${D}$ no puede ser la clave completa. Entonces lo combino con todos los otros atributos para ver si consigo una clave compuesta:
   $$
   \array{
   	(AD)^+ = \{ A,D,B,C,E,F \}\\
   	(BD)^+ = \{ A,D,B,C,E,F \}\\
   	(CD)^+ = \{ A,D,B,C,E,F \}\\
   	(ED)^+ = \{ D,E \}\\
   	(FD)^+ = \{ D,F \}\\
   }
   $$
   Como $(AD)^+, (BD)^+, (CD)^+$ generan a todos los demas atributos, las claves son:
   $$
   \{ AD, BD, CD \}
   $$

3. **Hallar una descomposición en BCNF sin pérdida de información y que preserve las dependencias funcionales.**

   

1. Hallar una descomposición en 3NF sin pérdida de información y que preserve las dependencias funcionales.
2. Estudiar si la descomposición de R en R1(A, B, C) y R2(D, E, F) es sin pérdida.





















