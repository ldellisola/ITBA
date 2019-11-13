# Codificación

La codificacion tiene como objectivo asignarle un numero natural a cada programa en lenguaje S, definiendo un numero unico para cada instruccion y luego un numero unico para cada programa.

Para poder hacer esto necesitamos codificar los tipos de instrucciones, las variables y los tags:

- Etiquetas:

  Las etiquetas se almacenan de forma similar a las variables, en un arreglo de la siguente forma:

  ```
  A1,B1,C1,D1,E1,A2,...
  ```

  Donde si la intruccion no tiene ninguna etiqueta se le asigna 0 y si tiene se le asigna la posicion de la etiqueta en el arreglo anterior, comenzando con el valor de `A1` en 1, `B1` en 2, etc.

- Variables:
  Las variales se ordenan en un arreglo de la siguente manera:

  ```
  Y,X1,Z1,X2,Z2,X3,Z3,...
  ```

  Asignandole el valor $0$ a Y, $1$ a X1, $2$ a Z1 y asi continua con el resto de las variables.

- Tipo de Instruccion:

  Se agrega una nueva instruccion al conjunto de operaciones del lenguaje S, pero esta no tiene ningun efecto. Entonces, segun la instruccion utilizada se le va a asignar el siguente valor:
  $$
  \array{
  	0	&&	V \leftarrow V\\
  	1	&&	V \leftarrow V+1\\
  	2	&&	V \leftarrow V-1\\
      \#L+2 && IF~V\neq0~GOTO~L
  }
  $$

Estos valores se van a guardar de la siguente forma:
$$
\#I=<a,<b,c>>
$$
Siendo $a$ el valor obtenido de la etiqueta, $b$ el valor obtenido del tipo de instruccion y $c$ el valor obtenido de la variable utilizada.

Luego, el codigo de un programa se calcula de la siguiente forma:
$$
\#P=[\#I_1,\dots,\#I_k]-1
$$
es decir, con el numero de Gedel calculado a partir del codigo de cada instrucción.

## Definiciones

- **Funcion de Halt**:

  La funcion de Halt sirve para decidir si un programa es computable o no, y por esta misma razon halt no es computable.
  $$
  halt:\N^2\rightarrow\N/halt(x,y)=
  \left\{
  	\array{
  		1	&& \text{El programa de codigo 'y' con entrada 'x' termina}\\
  		0	&&	else
  	}
  \right.
  $$

## Teoremas

- **Teorema de Churc**:

  Las funciones que no son computables en lenguaje S no lo son en ningun otro lenguaje.

- Halt no es computable

  [Demo]()















