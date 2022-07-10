# Aseguramiento y Seguridad

Para decir que tenemos un sistema **confiable**, tenemos que tener suficiente evidencia creíble para que no crea que el sistema va a cumplir con un conjunto de requerimientos. Esta confianza es obtenida a través de técnicas especificas.

Para establecer confianza, hay que implementar procesos de aseguramiento, que lleva a la adhesion de estándares y documentación. Ademas, es importante que el sistema sea revisado por expertos, y esta revision es más efectiva si se siguieron los pasos anteriores y existe documentación.

El **aseguramiento** es la justificación de que el mecanismo sigue la política, a traves de la evidencia. El **mecanismo** son los ejecutables diseñados para hacer cumplir las **políticas**, y estas son los requerimientos que definen explícitamente las expectativas de seguridad.

La evidencia se puede clasificar en 3 clases:

- **Formal**: Con métodos matemáticos y lenguajes formales de demostración de teoremas.
- **Semiformal**: Con pseudocodigo y analisando caso por caso.
- **Informal**: Con enunciados y analogias.

## Fuentes de Problemas

1. Requerimientos incompletos, incorrectos o faltantes.
2. Fallos en el diseño.
3. Fallos en la Implementación del hardware.
4. Fallos en la implementación del software
5. Errores de uso por errores de operación
6. Uso indebido del sistema
7. Fallos de los equipos o medio de comunicación
8. Casos de fuerza mayor.
9. Errores al actualizar, mantener o decomisar

## Aseguramiento en el Ciclo de Vida

El aseguramiento se puede implementar en todas las etapas del proyecto:

- **Requerimientos**: Se puede realizar un análisis de amenazas y definir las politicas.
- **Diseño**: Se plantea el modelo de seguridad.
- **Implementación**: Consistencia y trazabilidad.
- **Mantenimiento**: Control y configuración.

Ademas, se puede adaptar a cualquier ciclo de vida.

## Análisis de Requerimientos

Una **amenaza** es un evento potencial que tiene como consecuencia un efecto no deseado en el sistema. Son distintos de las vulnerabilidades, ya que estas permiten que ocurra una amenaza.

Se pueden clasificar por consecuencia:

- **Perdida de Confidencialidad**
- **Perdida de Integridad**
- **Denegación de Servicio**

## Modelado de Amenazas

Este proceso documenta aspectos de seguridad que interesan en el sistema. Las políticas del sistema deben eliminar a todas las amenazas documentadas. Se puede centrar en 3 perspectivas:

- **Centrado en el Atacante**: Explota objetivos de un atacante.
- **Centrado en el Software**: Explota tipos de ataques a componentes.
- **Centrado en Productos**: Explota ataques a productos o servicios.

<img src="Resources/18 - Aseguramiento y Seguridad/ff648006.f01tmwa01(en-us,pandp.10).gif" alt="Ff648006.f01tmwa01(en-us,PandP.10).gif" style="zoom:75%;" />

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

## OWASP

Existen distintos tipos de ataques definidos según OWASP:

- **Injection**: Tiene que ver con datos de control mezclados con los datos de nuestra aplicación. Un ejemplo de esto es una SQL injection.
- **XSS**: Es un script que ejecuta un navegador que se cruza de un sitio a otro. Esto sucede cuando no se sanitiza la entrada de un campo y pueden ejecutar código en el navegador de otro usuario.
- **CSRF**: Se utilizan las cookies de un usuario logeado en un sitio web para hacer requests en su nombre. Se soluciona con la generación de un antiforgery token.