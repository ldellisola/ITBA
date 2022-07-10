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

## Autenticación

El objetivo de la autenticación es asociar una identidad a un principal. La identidad corresponde a una entidad externa, mientras que el principal es una representación interna del sistema.

<img src="Resources/17 - Seguridad en Aplicaciones/Screen Shot 2022-06-22 at 10.43.58.jpg" alt="Screen Shot 2022-06-22 at 10.43.58" style="zoom:50%;" />

Para confirmar una identidad hay 3 pasos:

1. Obtener información de identidad.
2. Analizarla
3. Determinar si corresponde a la entidad

Esto implica que hay que almacenar información de cada entidad y contar con los mecanismos para procesar la información.

 Un sistema de autenticación tiene los siguientes componentes:

- $A =\{a\}$ **Información de autenticación**: La designación de la entidad e información provista. Esto puede ser algo que conozco, algo que soy, algo que tengo o donde estoy.
- $C =\{c\}$ **Información complementaria**: Contiene la especificación de un principal e información almacenada por el sistema. Por ejemplo, el hash derivado de la contraseña.
- $F = \{F:A\rarr C \}$ **Funciones de complementación**: Deriva información complementaria. Por ejemplo, la función que calcula el hash de la contraseña.
- $L=\{L : A\times C \rarr \{0,1\}\}$ **Funciones de autenticación**:Determina si un par $A,C$ son una asociación valida. Por ejemplo, funciones de autenticación.
- $S=\{s\}$ **Funciones de selección**: Funciones que permiten crear y actualizar $A$ y $C$. Por ejemplo, una función para cambiar la contraseña del usuario.

### Ataques a un Sistema de Autenticación

El objetivo del sistema es identificar correctamente a una entidad, por lo que el objetivo del atacante sera ser identificado como una entidad distinta.

Los ataques se pueden reducir a dos tipos:

- **Ataques Offline**: El atacante tiene acceso a la base de datos y a las funciones de complementación. Luego prueba varias entradas de la información de autenticación, genera su información complementaria y la compara con la almacenada en la base de datos.
- **Ataques Online**: El atacante prueba con varias entradas de la información de autenticación.

Estos ataques pueden ser con entradas aleatorias, o se pueden usar diccionarios de contraseñas conocidas para que sea más certero, entre otras técnicas.

Se pueden prevenir estos ataques evitando que $a \in A, c \in C, f \in F$ sean conocidas simultáneamente. También se puede prevenir el mal uso de la función de autenticación, deshabilitándola después de varios intentos fallidos o utilizando captchas. 

Otra forma de prevenirlo es aumentando la complejidad de las claves. Esta complejidad se estima utilizando la **formula de Anderson**:
$$
P \ge \frac{T \times G}{N}
$$
Donde:

- $P$ es la probabilidad de adivinar una clave.
- $T$ es el tiempo dedicado a las pruebas.
- $G$ es el numero de pruebas realizables por segundo.
- $N$ es el tamaño del espacio de claves.

### Selección de Claves

A la hora de elegir una contraseña, hay 3 formas principales:

1. Se genera una **clave aleatoria**. Esto es ideal, ya que todas las opciones son equiprobables, pero es difícil de memorizar para el usuario.
2. Se genera una **clave pronunciable**. Estas incluyen palabras sin sentido, pero formadas por fonemas. Estas son fáciles de memorizar pero el espacio de claves se ve muy reducido.
3. **El usuario genera su clave**. El usuario puede elegir cualquier clave, pero tiende a elegir claves que son fáciles de adivinar.

La **expiración de claves** es una herramienta para forzar a los usuarios a cambiar su clave luego de algún tiempo o evento. Este método limita el daño producido por una clave comprometida, pero tiene los siguientes problemas:

- Se deben almacenar las ultimas $n$ claves para evitar que el usuario reutilice claves viejas.
- Se debe evitar que se puedan cambiar las claves varias veces dentro de un periodo de tiempo reducido.
- Fuerza a los usuarios a pensar claves nuevas.

Otra herramienta importante es el **salting**. Este método tiene como objetivo aumentar el tiempo requerido para adivinar claves, ademas de generar hashes distintos para la misma contraseña.

#### PBKDF2

Este método convierte a nuestra contraseña en una calve criptográfica, utilizando las funciones de derivación de clave para resolver el problema de que la contraseña no sea reversible ni atacable.

El algoritmo es el siguiente:

```c#
string password = "...";
byte[] salt = GetSalt();

// Funcion pseudoaleatoria (criptosistema simetrico o MAC)
byte[] u = PRF(password,salt);
byte[] result = u;

for(int i = 1 ; i < N ; i ++){
  u = PRF(password,u);
  result |= u
}

return result;
```

#### Challenge - Response

Generalmente autenticar a un usuario remoto require que se énvienles las claves hasta el servidor. Esto require un canal seguro, y ser utilizado en una comunicación no segura puede comprometer a la calve. 

Este método viene a solucionar este problema, al no enviar la clave directamente.

<img src="Resources/17 - Seguridad en Aplicaciones/Screen Shot 2022-07-09 at 11.42.03.jpg" alt="Screen Shot 2022-07-09 at 11.42.03" style="zoom:100%;" />

La idea es que el servidor le envíe un desafío al cliente y este deba resolverlo, pero sin enviar su contraseña.

#### OTP

Este método consiste en generar claves que solo sirvan una vez. Para esto tanto el cliente como el servidor comparten un secreto $K$ y un contador $C.$

Hay dos variantes de este método:

- **HOTP**: OTP basado en hmac. Este método tiene un contador que se incrementa en cada uso, pero requiere que ambos dispositivos estén sincronizados. También es común implementar throtling para asegurar que los clientes sigan sincronizados.
  $$
  \text{HTOP}(K,C) = \text{Truncate}(\text{HMAC-SHA1}(K,C))
  $$

- **TOPT**: Time based OTP. Este método utiliza timestamps como su contador. Este mecanismo siempre mantiene a los clientes sincronizados.
  $$
  \text{TOTP}(K) = \text{HOTP}\left(K,\frac{\text{current unix time}}{\text{tiempo de vida}}\right)
  $$

#### Multi-Factor Authentication

Consiste en requerir dos o más factores de diferente tipo a la hora de iniciar sesión, ya que si son del mismo tipo, ambos factores son susceptibles al mismo tipo de ataques. Aunque se puede usar cualquier cantidad de factores, se recomienda solo utilizar dos ya que el nivel de seguridad es lo suficientemente alto.

#### Autenticación Remota (SSO)

Consiste en la delegación de la autenticación a un sistema externo. Hoy en dia esta implementado utilizando OpenID Connect, una plataforma open source basada en OAuth2. 

