# Teoria de Normalizacion

### Anomalias

- **Anomalia de insercion**: 

  Cuando se carga una entrada que no tiene todos los valores se lo indica con null, entonces hay entradas con muchos valores necesarios en null

- **Anomalia de Modificacion**:

  Cuando hay muchas entradas con datos repetidos y hay que actualizar alguno de estos datos, es muy ineficiente ir cambiandolo en todas las entradas donde esta actualemnte.

- **Anomalia de Borrado**:

  Similar a la anomalia de insercion. Causa los mismos problemas.



**Enfoque sintetico**: tomar tablas gigantes y empezar a partirlo en pedacitos.

**Enfoque analitico**: consiste en realizar un modelo de entidad/relacion bien realizado y genero a las tablas. Luego tengo que chequear que en las tablas creadas no haya anomalias.

### Dependencia Funcional

Sea $X$ e $Y$ dos conjuntos de atributos de un esquema de relacion $R$. Se dice que $X$ determina funcionalmente a $Y$ o que $Y$ depende funciona,metne de $X$ ($X\rightarrow Y$), si se cumple:
$$
\forall t_1,t_2 \in R :(t_1[X] =t_2[X] \Rightarrow t_1[Y] = t_2[Y])
$$
Al conjunto de dependencias funcionales basicas se lo llama $F$.

### Claves y Superclaves

Utilizando este nuevo convepto de 

==COMPLETAR==



### Representacion en las bases de datos

Las dependencias funcionales se pueden usar para calcular las claves, y esto es lo que se representa en la bases de datos.
$$
\emptyset
\empty
$$
