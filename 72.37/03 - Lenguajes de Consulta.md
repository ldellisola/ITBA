# Lenguajes de Consulta

Hay dos tipos de lenguajes, unos que son procedurales que permite especificar bien las operaciones, mientras que tienen lenguajes no procedurales donde se describe bien la informacion buscada.

## Algebra Relacional

Es un lenguaje **procedural** y de consulta puro. Este es el lenguaje propuesto por Codd, el inventor del modelo relacional. 

Este lenguaje tiene operaciones binarias y unarias, y permite anidaciones. Se dice que los operadores son conjuntistas, es decir, toman una relacion y garantizan que lo que se obtiene es una nueva relacion (no hay objetos repetidos).

Los operadores se pueden clasificar de dos formas:

- **Fundamentales**: Son los operadores mas importantes y los mas usados. Entre ellos se encuentran los siguentes operadores:

  - <u>Selección</u> $(\sigma)$: Selecciona el subconjunto de tuplas de una relacion que satisfacen cierta condicion de seleccion.
  - <u>Proyección</u> $(\pi)$: Genera una nueva relacion seleccionando ciertas columnas de la relacion original
  - <u>Unión</u> $(\cup)$: Se aplican a dos relaciones **compatibles** y se obtiene una nueva relacion que incluye todas las tuplas que estan en cualquiera de las dos relaciones.
  - <u>Diferencia</u> $(-)$: Se aplica dos relaciones compatibles $(r,s)$ y de obitene una nueva relacion que incluye a todas las tuplas de $r$ y no de $s$.
  - <u>Producto Cartesiano</u> $(\times)$: Se obtiene una nueva relacion con una tupla por cada combincion de tuplas de las relaciones originales.
  - <u>Asignacion</u>: No es propiametne una operacion pero es util para simplificar querys.
  - <u>Renombramiento</u> $(\rho)$: Sirve para cambiar el nombre de la relacion. Si se pone entre parentesis se le pasa una lista con nuevos nombres de atributos.

- **Delegados**: No son operadores necesarios, pero sirven como shortcuts para evitar complicarse con los poeradores fundamentales. Operaciones:

  - <u>Interseccion</u> $(\cap)$: Se aplica a dos relaciones $(r,s)$ compatibles y se obtiene una nueva relacion que incluye todas las tuplas que esten en ambas.
  - <u>Equijoin</u>: Funciona de forma similar al theta join pero iguala los atributos con el mismo nombre.
  - <u>NaturalJoin</u> $(\Join)$: Realiza un producto cartesiano de las relaciones, aplica la seleccion forzando la igualdad de todos los atributos y remueve los atributos duplicados. Saca las filas que no tengan a al mismo atributo clave.
  - <u>Left Outer Join</u> $(r\rtimes s)$: Me conserva solo las tuplas de $r$ que no matchean. Si $s$ no tiene valores para $r$, se los carga con `null`.
  - <u>Right Outer Join</u> $(r\ltimes s)$: Me conserva solo las tuplas de $s$ que no matchean. Si $r$ no tiene valores para $s$, se los carga con `null`.
  - <u>Total Outer Join</u>: Combina left y right.
  - <u>Cociente</u> $(\%)$: Sirve para las consultas que incluyen la expresion *'for all'*.

   

Dos **relaciones** son **compatibles** si tienen el mismo grado N y cada elemento tiene el mismo dominio en ambas relaciones.

## Calculo Relacional de Tuplas

Se basa en indicar una tupla y una funcion de la siguente forma:
$$
\{\ T\ |\  formula(T)\ \}
$$

#### Atomos

- $r(V)$: $V$ es una variable mientras que $r$ seria una relacion. Esto significa que la variable **pertenece** a la relacion.
- $V[i]\text{ op } U[j]$: Siendo $V,U$ variables, con los corchetes se referencian solo a un atributo de la tupla. $op$ se refiere a un operador, que son los usales mayor, menor, igual, etc.
- $V[i] \text{ op } C$: $C$ es una contante del dominio de atributo al que lo quiero comparar.

#### Variables

La variables puede ser libres o ligadas. Las ligadas son las que estan dentro del alcance de un cuantificador, similar a logica.

#### Formulas

Las formulas pueden tomar muchas formas:

- Un atomo: el atomo solo ya forma una formula.
- $f_1 \land f_2$
- $f_1 \lor f_2$
- $\neg f$
- $(\exist U)\ \ (f_U)$
- $(\forall U)\ \ (f_U)$

Las formulas que usamos tienen que ser seguras, es decir, que termine de ejecutarse en un intervalo finito de tiempo. Las formulas inseguras pueden ser formulas validas, pero suelen devolver infinitos resultados.

### Dominios

El dominio de una **base de datos** son la informacion almacenadna en la misma. 

El domino activo de una **formula** son los valores constantes que aparecen en la formula y los valores que los atributos toman en las tuplas de todas las relaciones que aparecen mencionadas en dicha formula.

#### Equivalencias con Algebra Relacional

$$
r \cup s \Leftrightarrow \{T\ |\  r(T) \lor s(T)\}\\
t \times s \Leftrightarrow \{T\ |\ (\exist U) (r(U)\land (\exist V)(s(V)\land T[1]=U[1]\land \dots\land T[n]= U[n]\and T[n+1]=V[1]\land \dots T[n+m] = V[m])) \}\\
r - s \Leftrightarrow
$$
















