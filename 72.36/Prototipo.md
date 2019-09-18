# Informe

Al comenzar a diseñar la interfaz web, pensamos en las reglas de oro definidas por Ben Sheiderman. 

Nuestra pragina web es consistente consigo misma, ya que se utilizo la misma paleta de colores, el mismo conjunto de iconos y la misma tipografia en todo el sitio. 

Nuestra implementacion utiliza shortcuts de dos tipos distintos, por un lado permite que el usuario marque a dispositivos y rutinas como favoritos y luego los ejecute directamente desde la pagina principal, mientras que por el otro permite agregar un dispositivo desde cualqueir vista.

Otro tema importante es el tema del feedback, el cierre de dialogos y la posibilidad de deshacer cambios, en este aspecto se le notifica al usuario cuando realizo un cambio mediante una snackbar y esta permite deshacer la accion recien cometida, en caso de que no querer deshacerla, esta desaparece un unos segundos. Tambien se permite deshacer la modificacion de parametros del menu de cada dispositivo y recuperar los valores actuales.

En el manejo de errores es un tema importante y lo tomamos como tal, permitiendo que el usuario solo ingrese informacion por el teclado cuando sea absolutamente necesario, como es el caso de los nombres. En todo otro caso el usuario debe utilizar dropdown list o sliders para poder interactuar con el sistema, y todas estas interacciones estan moderadas por nosotros.

Pero no solo utilizamos las reglas de oro, sino que tambien nos basamos en la definicion de usabilidad provista en clase. Gracias a esto podemos decir que nuestro sistema tiene un gran grado de usabilidad ya que nuestro sistema es <u>eficaz</u> ya que trata de minimizar los errores de ingreso de datos por parte del usuario, como explicamos en la quinta regla de oro. Es <u>eficiente</u>, por que permite configurar dispositivos y hasta ejecutar acciones de distintas formas, estando las formas mas comunes a menos de 2 clicks de distancia de cualquier pagina. Y ,por ultimo, tiene un <u>alto grado de satisfaccion</u> segun a la prueba de usabilidad, ya que aunque los usuarios consideraron mas completa a la pagina web que a la app, no expresaron frustracion y les gusto utilizarla.

Pero esas no fueron las unicas tecnicas utilizadas, ya que tambien aplicamos los principios de Gestalt para asegurarnos de que los usuarios entiendan cuando un conjunto de elementos estan relacionados, y donde continua y finaliza cada seccion. la Ley de Fitts nos sirvio para hacer botones que sean mas faciles de presionar, y que el usuario no tenga que estar intentando de apretarlo varias veces, haciendo que se frustre.









---



Primero nuestra pagina web debe ser **consistente**, es decir, utilizar las mismas tipografias, iconos y colores, entre otros elementos en toda la pagina. 

Esto se ve reflejado en la totalidad del prototipo, ya que usa siempre la misma paleta de colores, los menues, submenues y las cartas tienen aspecto de rectangular con las puntas redondeadas. De la misma forma se pueden ver los botones, donde todo boton de color azul representa que se esta iniciando una accion nueva o se esta terminando de forma satisfactoria a una accion. En el caso de los botones de color rojo, indican la eliminacion o la finalizacion de forma insatisfactoria de un proceso, y por ultimo, los botones de color violeta indican acciones contenidas dento de un menu, que son necesarias para continuar con proceso actual.

La segunda regla establecida son los **shortcuts**, que permiten a los usuarios mas avanzados realizar acciones comunes de forma mas rapida.

En este caso nuestra implementacion de shortcuts se baso en 2 partes, la primera fue permitir que los usuarios puedan registrar dispositivos sin tener que entrar directamente hasta el cuarto donde quieren registrarlo. La segunda parte tiene forma de 'favoritos', donde los usuarios pueden marcar tanto a dispositivos como a rutinas como favoritas, y que estas sean accesibles desde la pagina 'home'. En el caso de las rutinas, estas tienen su propia seccion especian el la pagina de rutinas ademas de figurar en 'home'.

La tercera regla y cuarta tiene que ver con la interaccion directa del usuario con el sistema y su respuesta. Debido a sus similaridades decidimos explicarlas juntas en un mismo parrafo. El **feedback** es fundamental para el usuario ya que lo mantiene al tanto de lo que esta sucediendo, mientras que el **cierre de los dialogos**.

Nuestro sistema implementa ambas reglas en la forma de snackbars, los cuales avisan al usuario que realizo una accion de forma satisfactoria (Elimino un cuarto o agrego un dispositivo) y le da la opcion de revertir la opcion.

La quinta regla, el **manejo de errores** no fue complicada de implementar, debido a la pequeña cantidad de opciones que tiene el usuario a la hora de ingresar informacion. Decidimos utilizar unicamente cuadros de texto para cuando el usuario debia de ingresar nombres, dropdown list cuando debia de elegir un cuarto o una region ya existente y en otros casos simplemente se utiliza un slider (Para elegir un color o la intensidad de una luz) o un boton para indicar que se encendio. Salvo en el caso de los cuadros de texto, el usuario debe elegir entre una de las opciones que el sistema provee. Tambien marcamos que cuadros son obligatorios para completar. Otra forma en la que simplificamos el manejo de errores es a la hora de crear un nuevo dispositivo, ya que si lo hace desde dentro de un cuarto se autocompleta la region y el cuarto.

La sexta regla, **revertir facilmente los errores** esta muy relacionada con las tercera y cuarta, por lo que creo que fue explicado en su momento, pero tambien permitimos que los usuarios cancelen la actualizacion de la configuracion de un dispositivo y permitan recuperar los valores originales, mediante un boton 'cancelar'.



La septima regla habla de **hacer sentir el control** al usuario. En nuestro caso esto se ve a la hora de definir las rutinas, donde el usuario puede elegir configuraciones especificas ????



Por ultimo, la octava regla habla de **reducir lo que el usuario debe recordar**. El mejor ejemplo de una implementacion que hay en nuestro prototipo es el control del aire acondicionado, donde el usuario puede elegir la velocidad de las aspas, hacia donde apuntan y hasta el modo del aire con un simple ==slider== como se llama??.



En cuanto a la **usabilidad** del sistema, si nos guiamos por la definicion provista en clase, podemos decir que nuestro sistema es <u>eficaz</u> ya que trata de minimizar los errores de ingreso de datos por parte del usuario, como explicamos en la quinta regla de oro, es <u>eficiente</u>, por que permite configurar dispositivos y hasta ejecutar acciones de distintas formas, estando las formas mas comunes a menos de 2 clicks de distancia de cualquier pagina, y por ultimo tiene un <u>alto grado de satisfaccion</u> segun a la prueba de usabilidad, ya que aunque los usuarios consideraron mas completa a la pagina web que a la app, no expresaron frustracion y les gusto utilizarla.



Pero el diseño y la usabilidad tambien estan relacionados con el usuario, por lo que entender como percibe al sitio es muy importante. Para esto utilizamos modelos mentales junto a la percepcion visual y motriz para poder hacer el mejor diseño posible.

Para que el usuario reconozca a los iconos del sistema de forma rapida y evite tener que pensar, utilizamos los iconos provistos por google para diseños con Material Design, por lo que como ya utilizo sitios y aplicaciones con esos iconos, ademas tenemos una sidebar y una barra de busqueda, elementos muy utilizados en las paginas web hoy en dia. 





