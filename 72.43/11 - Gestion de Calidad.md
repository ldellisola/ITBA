# Calidad

La calidad son las caracteristicas de un producto o servicio que influyen en la capacidad para satisfacer necesidades. Estas caracteristicas dependen del perfil del usuario al que apunto y están sujetas a restricciones. Los criterios de calidad no son independientes y suelen hacerse compromisos aceptables.

La calidad puede tomarse en cuenta desde el punto de vista del desarrollador o del usuario. 

Si tomamos en cuenta el punto de vista del desarrollador, hablamos de la **calidad del proceso**. Esto permite poner ordenar al equipo, los metodoslogias, elegir las herramientas y armar el plan de trabajo. 

La **calidad del producto** es en función del usuario final, no del equipo de desarrollo.

Las actividades y como se realiza el trabajo determina la calidad de los productos. Por eso solo pueede ser evaluada al final del proceso.

## Sistemas de Calidad

Los sistemas de calidad establecen estrategias, actividades y herramientas de calidad a utilizar. Es una forma de distribuir las tareas y responsabilidades entre miembros del proyecto. 

Tienen 3 etapas:

- **Gestión de Calidad**: Define como integrar las tareas de calidad en el modelo del proceso. Define un plan que debe identificar diferentes criterios de calidad considerados para cada fase del desarrollo.
- **Garantía de Calidad**: Son actividades que dan confianza de que el producto va a cumplir con los requisitos de desarrollo. Es un proceso de revisar objetivamente los entrañables, identificar defectos y hacer recomendaciones para mejorarlo. La idea es verificar que se esta construyendo el producto correctamente y validar que sea el producto correcto.
- **Control de Calidad**: Son actividades para evaluar la calidad de los productos desarrollados. Siguen los siguientes principios:
  - El desarrollador no prueba su propio código.
  - Inspeccionar el resultado de cada prueba.
  - Realizar casos de prueba para entradas validas esperadas e inesperadas.
  - No probar suponiendo que no se van a encontrar defectos.
  - Las pruebas son una tarea creativa y un desafío intelectual.

## Modelos de Calidad

### Factores de Calidad

Los factores de calidad son atributos de calidad desde el punto de vista del usuario. Estos pueden ser de:

- **Operación del Producto**:
  1. **Corrección**: Hasta que punto un software cumple sus especificaciones y satisface los objetivos del usuario.
  2. **Fiabilidad**: Hasta que punto se puede confiar en el funcionamiento sin errores del programa.
  3. **Eficiencia**: Cantidad de código y recursos informaticos que requiere el programa.
  4. **Integridad**: Hasta que punto se controlan los accesos ilegales a programas o datos.
  5. **Facilidad de Uso**: Esfuerzo de aprender a manejar un producto, realizar la entrada de datos e interpretar la salida del mismo.
- **Revisión del Producto**
  6. **Facilidad de Mantenimiento**: Esfuerzo para localizar y corregir defectos en el código durante el funcionamiento.
  7. **Facilidad de Prueba**: Esfuerzo para ejecutar las pruebas y validar que cumpla con los requisitos.
  8. **Flexibilidad**: Esfuerzo de modificación o adaptabilidad del producto cuando cambian sus especificaciones.
- **Transición del Producto**:
  9. **Portabilidad**: Costo de migrar el producto de una configuración de hardware a otra.
  10. **Facilidad de Reutilización**: Esfuerzo para reutilizar un modulo o parte del código en otra aplicación.
  11. **interoperabilidad**: Esfuerzo para hacer que un software pueda operar con otros sistemas o aplicaciones.

Se suelen elegir los 3 o 4 criterios más adecuados.

### Criterios de Calidad

Son atributos de calidad internos desde el punto de vista del equipo de desarrollo. Son subcategorias de los factores de calidad y son utilizados para elegir que factor de validad se va a usar.

<img src="Resources/11 - Gestion de Calidad/Screen Shot 2022-12-04 at 20.19.14.png" alt="Screen Shot 2022-12-04 at 20.19.14" style="zoom:50%;" />

### Métricas del Producto

Son métricas de los atributos internos que indican de que manera estoy cumpliendo con la calidad. Para cada criterio se define una o más métricas:

- **Exactitud**: Información sobre validez y precision del software y su estructura.
- **Usabilidad**: Determinar si la solución cumple con los requisitos del usuario.
- **Configuración**: Mide limitaciones, estilo de código y datos relativos.
- **Eficiencia**: Mide la velocidad de respuesta y capacidad.
