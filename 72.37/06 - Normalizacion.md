# Teoría de Normalización

Una base de datos relacional es un conjunto de esquemas relacionados y sus restricciones. La mala representación de la información produce ciertas anomalías.

### Anomalías

- **Anomalía de inserción**: 

  Cuando se carga una entrada que no tiene todos los valores se lo indica con null, entonces hay entradas con muchos valores necesarios en null

- **Anomalía de Modificación**:

  Cuando hay muchas entradas con datos repetidos y hay que actualizar alguno de estos datos, es muy ineficiente ir cambiándolo en todas las entradas donde esta actualmente.

- **Anomalía de Borrado**:

  Similar a la anomalía de inserción. Causa los mismos problemas.



**Enfoque sintético**: tomar tablas gigantes y empezar a partirlo en pedacitos.

**Enfoque analítico**: consiste en hacer un modelo de entidad/relaciona bien realizado y generar a las tablas. Luego tengo que chequear que en las tablas creadas no haya anomalías.

La teoría de normalización presenta un mecanismo con dos importantes utilidades:

- Reorganizar viejos sistemas donde no se conocen detalles de la implementación inicial.
- Evaluar la calidad de diseño.

### Dependencia Funcional

Sea $X$ e $Y$ dos conjuntos de atributos de un esquema de relación $R$. Se dice que $X$ determina funcionalmente a $Y$ o que $Y$ depende funcionalmente de $X$ ($X\rightarrow Y$), si se cumple:
$$
\forall t_1,t_2 \in R :(t_1[X] =t_2[X] \Rightarrow t_1[Y] = t_2[Y])
$$
Al conjunto de dependencias funcionales básicas se lo llama $F$.

##### Propiedades

$$
\text{La dependencia }X\rightarrow Y \text{ es trivial} \Leftrightarrow Y \subseteq X
$$

### Claves y Superclaves

Podemos utilizar el concepto de dependencia funcional para definir la superclave y clave y de un esquema relación.

Podemos definir a una <u>superclave</u> de la siguiente forma:
$$
\text{Sea un esquema de relacion $R$, } X \subseteq R \text{ es superclave para } R \text{ si cumple:}\\
\array{
 (1) && X \rightarrow R &\text{(determina funcionalmente todo el esquema)}
}
$$
De la misma forma, tenemos una nueva definición para la <u>clave</u>:
$$
\text{Sea un esquema de relacion $R$, } X \subseteq R \text{ es clave para } R \text{ si cumple:}\\
\array{
 (1) && X \rightarrow R &\text{(es superclave)}\\
 (2) && \not \exists Y \subset X / Y \rightarrow R & \text{(condicion minimal)}
}
$$
También tenemos una nueva definición. Podemos definir a un <u>atributo primo</u> como un atributo que forma parte de alguna clave.

### Clausura de Dependencias Funcionales

Denotaremos con $F$ al <u>conjunto de dependencias funcionales</u> de un esquema de relación $R$. Dicho conjunto se obtiene con las dependencias que son semánticamente obvias sobre dicho esquema. Sin embargo, de estas dependencias obvias pueden surgir muchas otras.

Se denomina <u>clausura</u> del conjunto $F$, correspondiente a un esquema,  al conjunto que contiene todas las posibles dependencias funcionales de dicho esquema. También se lo puede definir de la siguiente forma:
$$
\text{Se denomina } F^+ \text{ a la clausura de } F \text{ y es el conjunto de todas las dependencias}\\ \text{ funcionales inferidas logicamente de } F :\\
F^+ = \{X \rightarrow Y / F \mid= X\rightarrow Y\}
$$

### Axioma de Armstrong y Reglas de Inferencia

Sean $X, Y, Z$ conjuntos de atributos de un esquema de relación $R$, los siguientes axiomas constituyen un conjunto:

- **Correcto**: Significa que no se pueden derivar dependencias funcionales que no se puedan implicar lógicamente de $F$. Al aplicar los axiomas solo se obtienen dependencias funcionales que están en $F^+$ (No por fuera de $F^+$).

  En otras palabras: Si $X\rightarrow Y$ se deriva lógicamente de $F$ usando axiomas de Armstrong, entonces $X\rightarrow Y$ vale para toda relación $R$ en la cual valgan las dependencias funcionales en $F$.

- **Completo**: Significa que al aplicar dichos axiomas se generar todo $F^+$.

  Si una dependencia funcional de $X\rightarrow Y$ pertenece a $F^+$, entonces puede deducirse usando los axiomas de Armstrong sobre $F$.

Los Axiomas de Armstrong son los siguientes:

- Reflexividad:
  $$
  Y \subseteq X \Rightarrow X\rightarrow Y
  $$

- Aumentación:
  $$
  X\rightarrow Y \Rightarrow XZ\rightarrow YZ
  $$

- Transitividad:
  $$
  \left .
  \array{
  	X \rightarrow Y\\
  	Y \rightarrow Z
  }
  
  \right \}
  \Rightarrow 
  X \rightarrow Z
  $$

Además, a partir de estos axiomas, se pueden obtener las siguientes reglas:

- Unión:
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

- PseudoTransitividad:
  $$
  \left .
  \array{
  	X \rightarrow Y\\
  	UY \rightarrow Z
  }
  
  \right \}
  \Rightarrow 
  XU \rightarrow Z
  $$

- Descomposición:
  $$
  X \rightarrow YZ
  \Rightarrow 
  \left \{
  \array{
  	X \rightarrow Y\\
  	X \rightarrow Z
  }
  
  \right .
  $$

Para encontrar una clausura $F^+$ hay que aplicar estas reglas y axiomas a todas las dependencias funcionales de $F$ hasta que no se encuentren mas. Este problema tiene una dificultad exponencial y es muy costoso.

Existe un problema mas acotado pero igual de útil llamado <u>Pertenencia de una dependencia Funcional</u>:
$$
\text{Dado un esquema } R \text{ y el conjunto de dependencias funcionales } F \text{. Siempre es posible} \\ \text{ decidir si una dependencia funcional } X\rightarrow Y \text{ con } X \text{ y } Z \text{ atributos de } R \text{, pertenece a }F^+.
$$
Lo interesante de ese problema es que no es necesario calcular $F^+$ para resolverlo.

### Clausura de Atributos

En muchos casos se necesita saber si una dependencia funcional $X \rightarrow B$ pertenece a $F^+$. En este caso conviene trabajar con la clausura del conjunto de atributos que se encuentran a la izquierda de la dependencia a investigar y evitar calcular $F^+$.

La clausura de atributos se puede definir como:
$$
\text{Si } X \text{ es un conjunto de atributos de } R \text{, la clausura de } X \text{, denotada como } X^+ \text{, respecto del } \\ \text{conjunto de dependencias } F \text{ de dicho esquema, es el conjunto de atributos} \\ \text{ determinados por } X \text{ a traves de las dependencias de } F^+:\\
X^+:\{ A / X \rightarrow A \in F^+ \}
$$

A continuación vamos a ver un algoritmo de tiempo lineal para calcular $X^+$:

```pseudocode
X+ = {X}

while( X+ cambie ) {
	for( cada dependencia funcional Y-> X que pertenece a F ) {
		if(Y esta incluido en X+) {
			X+ = X+ union {Z}
		}
	}
}
```

### Proceso de Normalización

La normalización de una base de datos consiste en un proceso por el cual los esquemas de relaciona que presentan anomalías se descomponen en esquemas mas peque;os que cumplen con propiedades deseables para el mantenimiento de la misma.

El proceso de normalización consiste en verificar que un esquema de relación cumple con 4 <u>formas</u> llamadas formas normales **primera**, **segunda** y **tercera**. Además existe una forma Codd-Boyce. Estas 4 formas se basan en dependencias funcionales entre atributos.

Sin embargo, la descomposición que introduce toda normalización no garantiza un buen diseño. Para lograrlo se tienen que considerar las siguientes propiedades:

- **No perder información**
- **Preservar Dependencias**

#### Descomposición sin perdida de información

Cuando un sistema maneja información redundante, puede ser necesario descomponerlo en otros esquemas, pero esta división no puede ser arbitraria.
$$
\text{El conjunto de subesquemas }R_1, R_2,\dots,R_k \text{ es una descomposicion } \\ \text{sin perdida de informacion } R \text{ si cumple:}\\
\array{
(1) && R = \bigcup^{k}_{i=1}R_i \\
(2) && r_1 \Join r_2 \Join \dots \Join r_k = r \text{ donde } r_i = \pi_{R_i}(r)
}
$$
#### Condición de Descomposición sin Perdida para Dos Esquemas

Si un esquema de relación $R$ se descompone solo en $R_1, R_2$, la descomposición debe realizarse de manera tal que por lo menos una de las siguientes dependencias funcionales pertenezcan a $F^+$:
$$
\array{
	(R_1 \cap R_2) \rightarrow R_1 - R_2 \\
	(R_1 \cap R_2) \rightarrow R_2 - R_1
}
$$
#### Condición de Descomposición sin Perdida para N Esquemas

Para determinar si al descomposición en mas de dos esquemas tienen perdida de información o no hay que usar una matriz especial denominada <u>tableau</u>.

Esta matriz consiste en una matriz bidimensional que tiene una columna por cada atributo del esquema al cual corresponde dicho tableau. Sus filas están compuestas por variables distinguidas (representadas por la letra *a*, que aparece subindicador con el numero de la columna) y por variables ligadas o no distinguidas (representadas por la letra *b*, que aparece subindicada con el numero de fila y columna). Cada variable puede aparecer solo en una columna y en una misma columna no puede haber mas de una variable distinguida.

Para poder detectar la perdida de información en una descomposición, se arma un tableau inicial con una fila por cada subesquema $R_i$, completando dicha fila de la siguiente forma:
$$
T(i,j) =

\left \{
\array{
	a_j & \text{Si } R_i \text{ contiene al atributo } A_j	\\
	b_{ij}& \text{Si } R_i \text{ no contiene al atributo} A_j
}
\right .
$$
A partir de la configuración inicial se van haciendo los cambios necesarios para que se cumplan las dependencias funcionales de $R$, obteniendo nuevos tableaus equivalentes al inicial.

Para que una descomposición de N esquemas no tenga perdidas, se tiene que cumplir que:
$$
\text{Si un esquema de relacion } R \text{ se descompone en } R_1, R_2, \dots, R_N \\
\text{esquemas, la descomposicion debe realizarse de manera tal que por lo menos exista } \\ \text{una fila de variables distinguidas en el tableau correspondiente o en uno equivalente}
$$
#### Descomposición Preservando Dependencias (Sin perdida de DFs)

Mediante el método anterior podemos asegurar que no haya perdida de información, pero podemos haber perdido alguna dependencia funcional. Para asegurarse que no se pierdan estas dependencias, hay que seguir la siguiente regla:
$$
\text{Dado un esquema } R \text{, se dice que no haya perdida de dependencias al descomponerlo } \\ \text{ en } N \text{ esquemas } R_i \text{, si sus clausuras de dependencias funcionales son equivalentes:}\\\\
\ \\
{F'}^+ = F^+ \text{ donde } F' = \bigcup_{i=1}^N \pi_{R_i}(F^+)
$$
Básicamente tengo que hacer unión de todas las $F_i$ y a partir de esta unión tenes que poder crear todas las dependencias del $F$ original.

A continuación se puede ver un algoritmo que permite calcular la proyección de $F^+$ sobre un subesquema de $R$

```pseudocode
F_1 = F
X = R - R_i
while( X != NULL){
	A / A pertenece a X
	X = X - A
	RES = NULL
	for (cada dependencia del tipo Y -> A en F_1){
		for (cada dependencia del tipo AZ -> B en F_1){
			H = YX -> B
			if (H no es trivial){
				RES = RES union { H }
			}
		}
	}
	for (cada dependencia f en F_1){
		if(A esta en f){
			F_1 = F_1 - { f }
		}
	}
	F_1 = F_1 union RES
}
```



## Formas Normales sobre Dependencias entre Atributos

A continuación veremos las condiciones que se deben cumplir para que un esquema cumpla las 4 formas normales que se basan en las dependencias entre atributos

#### Primera forma normal (1NF)
$$
\text{Un esquema de relacion } R \text{ se encuentra en }\bold{\text{primera forma normal }} \\ \text{si sus atributos son atomicos}
$$
#### Segunda forma normal (2NF)

Esta forma normal se basa en el concepto de dependencia funcional total. A continuación vamos a definir los conceptos dependencia total y parcial.

- **Dependencia total**:
$$
  \text{Una dependencia } \alpha \rightarrow\beta 
  \text{ es total si } \forall A \in \alpha :(\alpha - \{A\}) \not \rightarrow \beta
$$
En otras palabras, una dependencia $\alpha \rightarrow \beta$ es total si $\beta$ no depende funcionalmente de ningún subconjunto de $\alpha$.

- **Dependencia parcial**:
$$
  \text{Una dependencia } \alpha \rightarrow\beta 
  \text{ es parcial si } \exists A \in \alpha :(\alpha - \{A\})  \rightarrow \beta
$$
En otras palabras, $\beta$ depende parcialmente de $\alpha$ si depende funcionalmente solo de algún subconjunto de $\alpha$. Obviamente que $\alpha \rightarrow \beta$ sea parcial obliga a que $\alpha$ sea compuesto.

La definición de 2NF es:
$$
\text{Un esquema de relacion } R \text{ se encuentra en } \bold{\text{segunda forma normal}}  \text{ si no existe } \\ \text{ningun atributo } A  \text{ no primo en } R \text{ que no sea parcialmente dependiente de alguna clave}
$$
Tradicionalmente se decía que un esquema estaba en 2NF si estaba en 1NF y además todo atributo no primo era totalmente dependiente de la clave.

**Normalización de un esquema $R$ en 2NF**
$$
\text{Para normalizar un esquema que viona 2NF hay que quitarle los atributos no primos } \\ \text{ que dependen parcialmente de la clave y formar un nuevo esquema con ellos y la } \\ \text{ porcion de clave de la que dependian}
$$
#### Tercera forma normal (3NF)

El **recubrimiento minimal** de $F$  es un conjunto $F_m$ de dependencias funcionales que cumple con:

- $F_m$ es equivalente a $F$
- El lado derecho de cada dependencia funcional de $F_m $es un atributo simple
- Ninguna dependencia funcional en $F_m $ contiene atributos redundantes a izquierda
- $F_m $ no tiene dependencias funcionales redundantes

También vamos a definir a las **dependencias transitivas**:
$$
\text{Una dependencia } X \rightarrow Y \text{ es transitiva si existe un conjunto de  atributos} \\ Z\text{ no primos para el cual } X \rightarrow Z \text{ y } Z \rightarrow Y
$$
Tradicionalmente se definía como 3NF a aquellos esquemas que estaban en 2NF y que además para todo conjunto de atributos no primos $\alpha$ se cumplía que $\alpha$ no depende transitivamente de una clave.

Por otro lado, la definición formal de la **tercera forma normal** es :
$$
\text{Un esquema de relacion } R \text{ se encuentra en tercera forma normal si para toda} \\ \text{dependencia } \alpha \rightarrow \beta \text{ no trivial de } F^+ \text{ se cumple:}
\\
\array{
	\alpha \text{ es superclave} & \text{o} & \beta \text{ es primo}
}
$$
 Para realizar una normalización hacia la tercera forma normal, se deben seguir los siguientes pasos:

1. Hallar $F_m$, un recubrimiento minimal de $F$
2. Juntar las dependencias que coincidan en su lado izquierdo (aplicar regla de unión)
3. Para cada $X \rightarrow Y$ de $F_m$, crear una relación con el esquema $XY$
4. Eliminar toda relación cuyo esquema sea subconjunto de otro.
5. Si ninguno de los esquemas creados contiene una clave candidata de $R$, agregar un esquema conteniéndola, a los efectos de que no tenga perdida de información.

Esta forma asegura la <u>no perdida de información</u> y la <u>conservación de las dependencias funcionales</u>



























