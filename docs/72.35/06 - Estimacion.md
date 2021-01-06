# Estimacion

Los clientes esperan tanto una estimacion cuanto tiempo y plata costara su proyecto.

Los costos estan divididos en **costos fijo**, es decir los costos que hay que pagar todos los meses, como lo serian el alquiler, las computadoras, etc. Por otro lado estan los **costos variables**, que se refieren a las horas-hombre de trabajo.

La estimacion del esfuerzo trae probelams pro la incorporacion de requerimientos tardios y cambios de dise;o, ya que estos crean dificultades que no se calcularon al principio del desarrollo. Las tecnicas de estimacion se pueden dividir en 3 tipos:

- **Juicio de Expertos**: Es una tecnica informal basado en la experiencia del grupo de programadores. Consiste en sentarse y debatir cuanto tiempo deberian tardar en cada tarea. Los expertos generan tres predicciones, una <u>pesimista</u> (x), una <u>optimista</u> (y) y la <u>mas probable</u> (z). Luego estas predicciones se normalizan con una distribucion beta, que tiene la siguente formula:
  $$
  \frac {(x + 4\times y + z)} {6}
  $$
  
- **Metodos Algoritmicos**: Este tipo de metodos utilizan formulas matematicas para calcular el esfuerzo requerido. Voy a presentar a las variables utilizadas:

  - $E$: Esfuerzo estimado en persona-mes.
  - $D$: Tiempo de desarrollo en meses.
  - $K$: Lineas de codigo estimadas para el proyecto (en miles)
  - $P$: Es el numero de personas necesarias.
  - $S$: Es el tama;o estimado.
  - Por ultimo tenemos el multiplicador $M$ y un vector $X=[a,b,c,d]$ ==VER QUE RESPONDEN==

  En la forma mas basica estimacion algoritmica, se puede usar la siguiente funcion para calcular $E$:
  $$
  E=(a+b\times S^c)\times M \times X
  $$
  Por otro lado, se crearon modelos a partir de grandes grupos de proyectos que simplifican este calculo:

  - **Alston and Felix Model**:
    $$
    \array{ E=5.25 \times S^{0.91}
    &	D = 2.47 \times E^{0.35} &
    P = 0.54 \times E^{0.06}
    
    }
    $$

  - **Bailey and Basili Model**:
    $$
    E = 5.5 + 0.73 \times S \times 1.16
    $$

  - **Cocomo Basico**:
    $$
    \array{
    E = a \times K ^{b} &
    D = c\times E \times d &
    P = \frac E D
    }
    $$

  - **Cocomo Intermedio**:
    $$
    E = \frac {3.2 \times K \times D \times S} {1.05}
    $$
    

- **Aprendizaje automático**: Esta técnica utiliza arboles de decisión e informacion sobre datos de proyectos anteriores, para crear un modelo que permite estimar automaticamente el esfuerzo de los proyectos.

- **Use Case Points**: Es un método que permite calcular el esfuerzo en base a casos de uso y actores. En este metodo de desarrollan varias tablas:

  ***Total Actor Weight Factor (UAW)***:

  Es una tabla que especifica la cantidad de actores que participan en el sistema. Hay <u>tres tipos de actores,</u> simples, promedio y complejo. Cada uno de estos tiene asignado un factor 1,2,3 respectivamente. Ademas se indican cuantos actores de cada tipo tenemos en el sistema. 

  Para calcular el *UAW* se suma el producto del factor por la cantidad de actores de cada tipo.

  ***Unadjusted Use Case Weight (UUCW)***:

  Esta tabla es similar a la anterior pero se centra en casos de uso. Aquí se agrupan los casos de uso por tipo, siendo estos simple (1 a 3 transacciones), promedio (4 a 7 transacciones) y complejo (mas de 8 transacciones). A estos tipos de usos se le asignan factores (5, 10, 15 respectivamente). Por ultimo se anotan la cantidad de casos de usos por tipo.

  Para calcular el *UUCW* se suma el producto del factor por la cantidad de casos de uso de cada tipo.

  Podemos obtener otra métrica llamada ***Unadjusted Use Case Points (UUCP)*** si sumamos *UAW* y *UUCW*.

  ***Adjusted Use Case Points (AUCP)***

  Esta metrica se obtiene multiplicando a *UUCP* por ***TCF*** y ***EF***. Estos utlimos dos valores son:

  - ***Total Technical Factor (TCF)***: Son las caracteristicas tecnicas de nuestro sistema.
  - ***Total Enviroment Factor (EF)***: Similar a la metrica anterior, pero relacionado con el staff que va a desarrollar al sistema. Un ejemplo de esto es si los desarrolladores estan familiarizados con el lenguaje de programacion que se va a utilizar.

## Planificacion

Para estimar el esfuerzo se necesita conocer la cantidad de gente que trabaja en el proyecto. Se deben conocer las tareas que se realizaran y las capacidades y experiencias que tienen que tener las personas que se realicen. Por esto no todas las tareas puede ser relaizadas por cualquier persona, para cada tarea hay que tener en cuanta la capaidad, interes y experiencia de la persona.



























