# Modelo Entidad-Relación

### Entidades

Son las tablas de la base de datos, puede ser cualquier cosa del mundo real que posee existencia independiente. Cada entidad tiene **atributos** que serian los campos (o valores) que cada entidad posee. Se llama **esquema** al conjunto de entidades.

Hay dos tipos de entidades: 

- **Fuertes**: Es identificable solo con los atributos que posee.
- **Débil**: Los atributos que la identifica no se pueden tomar solo de ella, sino que hay que conseguirlos de otras entidades.

Los atributos pueden ser **simples** (Para una entidad concreta tiene un unico valor) o **compuestos**. En el caso de compuesto suelen ser datos muy relacionados que forman parte de un dato mayor, pero no merecen una tabla por si mismos, entonces fsiciamente se almacenan con los demas atributos

Tambien pueden ser **univaluado** o **multivaluado**.

Otra clasificacion es **almacenado** o **derivado**. Los datos derivados son aquellos que se pueden inferir a partir de otros datos almacenados.

### Relaciones

Una relación es una asociación entre entidades particulares. Un conjunto de relaciones es la colección de todas las relaciones del mismo tipo.

La **ariedad de una relación** es la cantidad de entidades que participan en la relación.

El **rol de una relación** es la función que desempeña una entidad en una relación.

Una **relación recursiva** sucede cuando la misma entidad participa mas de una vez en el conjunto de relaciones con distintos roles. Estas son las relaciones unarias.

La **cardinalidad**  es el numero de relaciones en que una entidad puede participar.

La **participacion** especifica si la existencia de una entidad depende o no de la existencia de una relacion. Por ejemplo, si al eliminar una relacion desaparece una entidad, se dice que la participacion es <u>total</u>.

### Representación

Toda esta informacion se puede representar dibujándolo, siguiendo las siguientes reglas:

- Las **entidades** se marcan con un cuadrado.
  - Los **atributos** se denotan como circulos que se unen a la entidad con una linea
    - A los atributos **identificatorios** se los marca subrayando al nombre del atributo. En caso de tener mas de un atributo identificatorio, se suelen indican en palabras. Tambien puede suceder que dos o mas campos juntos sirvan para identificar a un elemento, en ese caso se escribe tambien pero se usa el símbolo '+'.
    - Si es **multivaluado**, se lo marca con un color.
    - Si es **derivado** se lo marca con linea punteada.
- Las **relaciones** se las indican con rombos, uniendo a las entidades que se relacionan.
  - No se suele indicar el **rol** en el grafico, salvo en el caso de las relaciones **recursivas**.
  - Tambien se suele indicar si la relación es 1 - 1, 1 - muchos o muchos - muchos. Si la relación es de muchos, se lo indica poniendo una 'n' cerca de la otra entidad. Si la relación es de uno, se le indica poniendo un 1.
  - Si una entidad tiene participacion total, entonces se la indica con una doble raya.
