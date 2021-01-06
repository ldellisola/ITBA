# Antipatrones

### Origen de los antiparones

Los tres tipos de antropatrones (Desarrollo, Arquitectura y Management) tienen las mismas causas de fondo:

- <u>Prisa</u>
- <u>Apatia</u>
- <u>Mente Estrecha</u>
- <u>Pereza</u>
- <u>Avaricia</u>
- <u>Ignorancia</u>
- <u>Orgullo</u>

Luego hay fuerzas primarias de management como:

- Funcionalidad

...

### Antipatrones relacionados al Desarrollo

#### Spaghetti Code

Es codigo muy largo y muy complicado con poca o nula documentacion en el cual es muy complicado modifica o extender el uso del programa.

Los sintomas de este antipatron son:

- Son codigo que fue creado como una demostracion pero termino siendo codigo operacional
- Por lo general solo una persona trabaja en ellos.
- Muy poca documentacion

Puntualmente en OOP

- Muchos objetos sin metodos
- Variables globales
- Relaciones extra;as entre objectos

Para solucionar a este problema hay dos soluciones: Borras todo o lo refactoreas. A la hora de refractorear, se tiene que generalizar mas muchas clases que contiene el codigo, esto se hace con superclases abstractas donde se generalicen los metodos. Tambien es necesario, luego de generalizar, comenzar a especializar las clases necesarias con sus propios metodos.

#### The Blob

Es la perdida completa de funcionalidad y ventajas de OOP, donde hay clases monoliticas y no se separa la informacion  ni funcionalidad correctamente.

Para solucionar este problema hay que simplemente reconocer la informacion relacionada dentro de la super clase e ir creando clases mas peque;as que contengan esa funcionalidad.

#### Poltergeists

==???==

La solucion esta en unificar clases para aumentar la cohesión dentro del sistema.

### Antipatrones relacionados con la Arquitectura

#### Vendor Lock-In

Sucede cuando dependes completamente de otras empresas, ya que esta dependencia te deja completamente a la virtud de ellas. Si una de estas empresas decide aumentar precios, estas obligado a pagarlo por que no podes mudarte a otra empresa. Esto tambien implica que las funcionalidades nuevas tardan mucho mas tiempo en ser implementadas.

Este problema se soluciona creando interfaces y capas de contacto, donde implementamos metodos basicos para comunicarnos con las APIs. Esto permite que si en un momento queremos cambiar de programa, hay que simplemente recrear esta capa de contacto para la nueva API.

#### Stoppipe Enterprise





