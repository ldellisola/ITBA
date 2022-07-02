# Seguridad en Aplicaciones

## Principios de Diseño

Los principios de diseño son bases que promueven un diseño que tenga como resultado un sistema robusto y seguro. Son principios de guía de alto nivel y se basan en dos ideas:

- **Simplicidad**: Menos cosas pueden salir mal, y es fácil de entender y verificar.
- **Restricción**: Minimizar el acceso y la comunicación.

### Menor Privilegio

Un sujeto debe recibir solo los privilegios necesarios para completar su tarea, y estos deben ser asignados por función, no por identidad. Si una tarea require derechos adicionales, asignarlos y desecharlos luego de su uso.

### Valores Iniciales Seguros

El acceso a cualquier objeto debe ser denegado por defecto, y si una acción falla por seguridad, el sistema debe volver al estado de seguridad inicial.

### Economia de Mecanismos

Los mecanismos de seguridad deben ser simples, ya que menos cosas pueden salir mal y la verificación es mucho más fácil.

### Mediación Completa

Todos los accesos a objetos deben ser verificados, incluso si el objeto es accedido varias veces. Este principio puede ir en contra de la eficiencia, ya que implica que no se permite cachear los permisos.

### Diseño Abierto

La seguridad no debe depender del secreto del diseño o la implementación. Esto no se aplica a las claves, sino a los algoritmos. La violación de este principio se llama *”Seguridad por Oscuridad”*.

### Separación de Privilegios

Un sistema no debe otorgar permisos basados en una sola condición. Este principio busca evitar que un sujeto pueda obtener privilegios y usarlos.

### Mecanismos Exclusivos

Los mecanismos de seguridad no deben compartirse y se debe promover la aislación de los sistemas.

### Aceptación Psicologica

Los mecanismos de seguridad no deben dificultar el acceso al recurso. Esto require ocultar el mecanismo y en general es muy difícil o imposible. Se puede acercar a este principio simplificando la instalación y configuración, así como también vitando la necesidad de tener conocimientos técnicos.

## Aseguramiento y Seguridad

Para decir que tenemos un sistema **confiable**, tenemos que tener suficiente evidencia creíble para que no crea que el sistema va a cumplir con un conjunto de requerimientos. Esta confianza es obtenida a través de técnicas especificas.

Para establecer confianza, hay que implementar procesos de aseguramiento, que lleva a la adhesion de estándares y documentación. Ademas, es importante que el sistema sea revisado por expertos, y esta revision es más efectiva si se siguieron los pasos anteriores y existe documentación.

El **aseguramiento** es la justificación de que el mecanismo sigue la política, a traves de la evidencia. El **mecanismo** son los ejecutables diseñados para hacer cumplir las **políticas**, y estas son los requerimientos que definen explícitamente las expectativas de seguridad.

La evidencia se puede clasificar en 3 clases:

- **Formal**: Con métodos matemáticos y lenguajes formales de demostración de teoremas.
- **Semiformal**: Con pseudocodigo y analisando caso por caso.
- **Informal**: Con enunciados y analogias.

### Fuentes de Problemas

1. Requerimientos incompletos, incorrectos o faltantes.
2. Fallos en el diseño.
3. Fallos en la Implementación del hardware.
4. Fallos en la implementación del software
5. Errores de uso por errores de operación
6. Uso indebido del sistema
7. Fallos de los equipos o medio de comunicación
8. Casos de fuerza mayor.
9. Errores al actualizar, mantener o decomisar

### Aseguramiento en el Ciclo de Vida

El aseguramiento se puede implementar en todas las etapas del proyecto:

- **Requerimientos**: Se puede realizar un análisis de amenazas y definir las politicas.
- **Diseño**: Se plantea el modelo de seguridad.
- **Implementación**: Consistencia y trazabilidad.
- **Mantenimiento**: Control y configuración.

Ademas, se puede adaptar a cualquier ciclo de vida.

### Análisis de Requerimientos

Una **amenaza** es un evento potencial que tiene como consecuencia un efecto no deseado en el sistema. Son distintos de las vulnerabilidades, ya que estas permiten que ocurra una amenaza.

Se pueden clasificar por consecuencia:

- **Perdida de Confidencialidad**
- **Perdida de Integridad**
- **Denegación de Servicio**

### Modelado de Amenazas

Este proceso documenta aspectos de seguridad que interesan en el sistema. Las políticas del sistema deben eliminar a todas las amenazas documentadas. Se puede centrar en 3 perspectivas:

- **Centrado en el Atacante**: Explota objetivos de un atacante.
- **Centrado en el Software**: Explota tipos de ataques a componentes.
-  **Centrado en Productos**: Explota ataques a productos o servicios.

<img src="Resources/16 - Seguridad en Aplicaciones/ff648006.f01tmwa01(en-us,pandp.10).gif" alt="Ff648006.f01tmwa01(en-us,PandP.10).gif" style="zoom:75%;" />

1. **Identificar Objetivos de Seguridad**: Los objetivos apuntan a garantizar confidencialidad, integridad y disponibilidad. A partir de estos se considera que casos no queremos que sucedan.

2. **Conceptualizar Aplicación**: Se esquematiza el escenario del deployment, con sus capas, componentes críticos y tecnologías. También se identifican los mecanismos de seguridad.

3. **Descomponer Aplicación**: Identifica zonas donde cambia el nivel de confianza requerido:

   - Zonas externas: Acceso al sistema de archivos, base de datos y web services.
   - Zonas privilegiadas: Partes accesibles solo para un rol particular.

   En esta etapa se identifican los flujos de datos entre ambas zonas. Este análisis comienza a alto nivel y luego refina sus resultados. 

4. **Identificar Amenazas**: Se puede plantea de dos formas:

   - Comenzar con una lista de amenazas recurrentes.
   - Derivar amenazas mediante preguntas.

   Las preguntas se pueden clasificar según STRIDE:

   - **S**poofing
   - **T**ampering
   - **R**epudiation
   - **I**nformation Discusure
   - **D**enial of Service
   - **E**levation of Privilege

5. **Identificar Vulnerabilidades**: Desde el análisis anterior, hay que revisar las zonas que se derivan del análisis anterior. El objetivo es encontrar las vulnerabilidades que permitan que ocurran las amenazas.

   Hay 7 lugares clave para buscar vulnerabilidades:

   - **Input Validation and Representation**
   - **API Abuse**
   - **Security Features**
   - **Time and State**
   - **Error Handling**
   - **Code Quality**
   - **Encapsulation**

## Autenticación

El objetivo de la autenticación es asociar una identidad a un principal. La identidad corresponde a una entidad externa, mientras que el principal es una representación interna del sistema.

<img src="Resources/16 - Seguridad en Aplicaciones/Screen Shot 2022-06-22 at 10.43.58.jpg" alt="Screen Shot 2022-06-22 at 10.43.58" style="zoom:50%;" />

Para confirmar una identidad hay 3 pasos:

1. Obtener información de identidad.
2. Analizarla
3. Determinar si corresponde a la entidad

Esto implica que hay que almacenar información de cada entidad y contar con los mecanismos para procesar la información.

 Un sistema de autenticación tiene los siguientes componentes:

- $A =\{a\}$ **Información de autenticación**: La designación de la entidad e información provista. 
- $C =\{c\}$ **Información complementaria**: Contiene la especificación de un principal e información almacenada por el sistema.
- $F = \{F:A\rarr C \}$ **Funciones de complementación**: Deriva información complementaria.
- $L=\{L : A\times C \rarr \{0,1\}\}$ **Funciones de autenticación**:Determina si un par $A,C$ son una asociación valida.
- $S=\{s\}$ **Funciones de selección**: Funciones que permiten crear y actualizar $A$ y $C$.

