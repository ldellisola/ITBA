# COCOMO II

COCOMO II es un modelo de estimación que utiliza tecnicas para estimar el esfuerzo y duración de un proyecto de desarrollo. Esta pensado para modelos de ciclo de vida incrementales o evolutivos. Las entradas para este modelo son los puntos de función y las lineas de código.

A su vez, este modelo tiene 3 submodelos de estimación:

- **Composición de Aplicaciones**: Sirve para proyectos construidos a partir de prototipos y se aplica para las primeras fases del MCVS incremental. Toma como entrada los puntos de función.
- **Diseño Anticipado**: Obtiene el costo del proyecto sin tener la arquitectura completa y se puede aplicar en las primeras fases del MCVS incremental o evolutivo. Toma como entrada las lineas de código obtenidas a partir de los requerimientos y puntos de función, y sirve para explorar distintas alternativas.
- **Post-Arquitectura**: Obtiene el costo del proyecto luego de tener la arquitectura definida a partir de las lineas de código obtenidas de los puntos de función modificados para la reutilización de objetos. Se aplica en las etapas de desarrollo y mantenimiento del software e incorpora variables de producción de para que la estimación sea más precisa.

A partir de estos métodos se puede tener el **esfuerzo nominal en meses hombre**. El objetivo es poder resolver la siguiente formula y el esfuerzo nominal en meses hombre:
$$
\text{MM Nominal} = A \times {\left(\frac{\text{PF} \times \text{KLoC}}{1000}\right)}^b
$$
Donde:

- $\text{PF}$ es el factor de ajuste de lineas de código en miles que depende del lenguaje de implementación.
- $\text{KLoC}$ es una estimación de la cantidad de lineas de código que tienen los prouectos en el lenguaje elegido.
- $A = 2.94$ es una constante que captura los efectos multiplicativos del esfuerzo.
- $b = 0.91 + 0.01 \times \sum F_e$ representa el ahorro o gasto por factores de escala, donde $F_e$ es un conjunto de factores de escala que dependen del proceso de desarrollo. Dependiendo del valor de $b,$ podemos decir:
  - $b < 1:$ El proyecto tiene ahorros de escala. La productividad escala con el tamaño del proyecto y requiere menos esfuerzo.
  - $b=1:$ Los ahorros y los gastos están equilibrados.
  - $b>1:$ Los gastos aumentan considerablemente con el tamaño del proyecto. Requiere más esfuerzo.

Los factores de escala son:

- **Precedencia**: Experiencia previa del equipo.
- **Flexibilidad de Desarrollo**: Cumplimiento de requisitos previos, especificaciones de interfaz y tiempos de finalización anticipada.
- **Resolución de Riesgos**: Diseño tecnologico y gestión de riesgos.
- **Cohesión**: Relación del equipo y comunicación entre sus integrantes.
- **Madurez del Proceso**: Que tan maduro es el equipo en la ejecución de procesos.

Luego, debemos ajustar el MM nominal según los drivers de costo:
$$
\text{Esfuerzo} = \text{MM Nominal} \times \prod{M_e}
$$
Donde $M_e$ es el conjunto de multiplicadores de esfuerzo:

- **RCPX**: Fiabilidad del producto y complejidad.
- **RUSE**: Reutilización requerida.
- **PDIF**: Dificultades de la plataforma.
- **PERS**: Habilidades del personal.
- **PREX**: Experiencia del personal.
- **FCIL**: Herramientas disponibles para trabajar en el proyecto.
- **SCED**: Restricciones en tiempo de ejecución.

