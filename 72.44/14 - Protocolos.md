# Protocolos

Los protocolos vienen a solucionar un problema grande de los esquemas de intercambio de claves vistos hasta ahora, estos esquemas son susceptibles a ataques activos.

Si un atacante omite, altera, reordena o repite mensajes, el intercambio de claves no es seguro. Esto es conocido como un **Man in the Middle** Attack.

## Man in the Middle

El ataque de man in the middle actual de la siguiente forma:

<img src="Resources/14 - Protocolos/Screen Shot 2022-04-30 at 16.04.00.jpg" alt="Screen Shot 2022-04-30 at 16.04.00" style="zoom:50%;" />

<img src="Resources/14 - Protocolos/Screen Shot 2022-04-30 at 16.03.42.jpg" alt="Screen Shot 2022-04-30 at 16.03.42" style="zoom:50%;" />

## Infraestructura de Claves

El objetivo de este proceso es asociar la identidad a las claves. Se busca evitar problemas de suplantación de identidad (man-in-the-middle o spoofing). Este problema no es aplicable a los criptosistemas simétricos.

El motivo es que la selección de las claves depende entre las partes involucradas en la comunicación. Usar la clave equivocada implica que no hay garantías de confidencialidad o integridad.

## Certificados

Los protocolos son mensajes que contienen la siguiente información:

- Informacion de identidad
- Clave pública asociada
- Fecha de Emision
- Intervalo de Validez
- Tipo de uso de la clave
  - Firma de mensajes
  - Cifrado de emails
  - Firma de certificados
  - Cifrado de sitios web

A su vex, los certificados están firmados digitalmente por una autoridad competente.

### Uso de Certificados

Si $A$ solicita un certificado de $B$, el certificado puede ser provisto por $B$ o cualquier otra entidad. A partir de este certificado, $A$ puede:

- Verificar la identidad del certificado
  - Common Name
  - Emails
  - Servidores
  - Empresas
- Obtener la clave publica de $B$
- Verificar el tipo de uso permitido
- Verificar la integridad del certificado.

### Cadenas de Firmas

Las autoridades certificares tienen a su vez un certificado, el cual se adjunta junto al certificado provisto. Esta cadena de validaciones sube hasta llevar a las **Autoridades Certificantes** (CA) raíces. Estas autoridades firmar su propio certificado y son el punto de confianza del sistema.

Si dos clientes tienen dos certificados provistos por dos CA distintas, hay dos opciones:

- Un cliente confia en la CA del otro cliente
- Las CA de cada certificado están validadas entre si

En la practica, hay una lista de CA reconocidas dentro del sistema operativo, y los runtimes.

### Revocation de Certificados

A veces se necesita invalidar a una clave antes de que esta expire, ya sea por que fue publicada o por un cambio anticipado. En estos casos se utilizan listas de certificados revocados que incluyen:

- Un listado de certificados vigentes y revocados
- Un listado histórico de certificados expirados y revocados

## Intercambio Simétrico de Claves

Este proceso es el equivalente simétrico a Diffie-Hellman.

### Protocolo Needham-Schroeder

Es un protocolo de intercambio de claves simétrico y requiere de un servicio centralizado. La idea es generar claves de sesión entre pares, a partir de la clave que comparten con el KDC. En teoría, esto funciona de la siguiente forma:

<img src="Resources/14 - Protocolos/Screen Shot 2022-04-30 at 16.43.32.jpg" alt="Screen Shot 2022-04-30 at 16.43.32" style="zoom:50%;" />

Se usa la notación: $\text{Cod}_{k}(m) = \{m\} k$

Esto trae los siguientes problemas:

- **Repetición**: Un atacante puede grabar los mensajes de $A$ hacia $B$ y luego reenviar $\{k_s\}k_b$ y los mensaje siguientes. $B$ no tiene forma de saber que no esta hablando con $A$.
- **Reuso de claves**: Un atacante graba el mensaje de $B$ hacia $A$, y cuando $A$ quiere iniciar otra conversación se lo envia. En este caso $A$ y $B$ estarían usando la misma clave de sesión.

Este protocolo fue mejorado en una segunda iteración:

<img src="Resources/14 - Protocolos/Screen Shot 2022-04-30 at 16.47.47.jpg" alt="Screen Shot 2022-04-30 at 16.47.47" style="zoom:50%;" />

Este protocolo todavía tiene un problema: si el atacante tiene una clave de sesión antigua $k_s$, entonces puede evitar los primeros dos pasos y pasarse por $A$:

<img src="Resources/14 - Protocolos/Screen Shot 2022-04-30 at 16.51.42.jpg" alt="Screen Shot 2022-04-30 at 16.51.42" style="zoom:50%;" />

Con la modificación de **Demming-Sacco**, se cree que esto se soluciona. La idea detrás de esta modificación es utilizar timestamps ($T$):

<img src="Resources/14 - Protocolos/Screen Shot 2022-04-30 at 16.52.54.jpg" alt="Screen Shot 2022-04-30 at 16.52.54" style="zoom:50%;" />

## TLS

Es la evolución de SSL y ofrece seguridad a nivel transporte y necesita de un canal confiable para poder ser utilizado (por ejemplo TCP). Ademas, el protocolo ofrece :

- Confidencialidad
- Integrada
- Autenticación de los participantes

<img src="Resources/14 - Protocolos/Screen Shot 2022-04-28 at 16.26.20.jpg" alt="Screen Shot 2022-04-28 at 16.26.20" style="zoom:50%;" />

<img src="Resources/14 - Protocolos/Screen Shot 2022-04-28 at 16.26.33.jpg" alt="Screen Shot 2022-04-28 at 16.26.33" style="zoom:50%;" />

Cuando TLS tiene que enviar un mensaje:

1. Divide al mensaje en no mas de $2^{16}$ bloques
2. A cada bloque se le calcula un hash y se los comprime juntos.
3. Se envía este par de bloque y hash comprimidos y se los envia al servicio inferior (TCP).

<img src="Resources/14 - Protocolos/Screen Shot 2022-04-28 at 16.28.18.jpg" alt="Screen Shot 2022-04-28 at 16.28.18" style="zoom:50%;" />

### Tipos de Mensajes

Se pueden mandar distintos tipos de mensajes:

- **TLS Handshake**: Este mensaje informa de la configuración inicial ademas de la autenticación.
- **TLS Application Data**: Contiene información del protocolo encapsulado.
- **TLS Alert**: Informa de evento y problemas.
- **TLS Change Cipher Spec**: Inicia una renegociación de claves.

### Intercambio de Llaves

Los intercambios de llaves se pueden hacer de muchas formas:

- **RSA**
- **Diffie Hellman**:
  - Con Certificado o no
- **ECDH**: Diffie Hellman sobre curvas elipticas
- **Kerberos**

### Criptografia

TLS utiliza un cifrado simétrico, implementado con alguno de los siguientes métodos:

- ChaCha20
- Triple DES
- AES
- IDEA CBC
- ARIA

En cuanto a las funciones de Hash, se pueden elegir entre las siguientes:

- HMAC-MD5
- HMAC-SHA1
- HMAC-SHA2
- AEAD

Y para la autenticación se utilizan:

- Firmas RSA
- Firmas DSS

### Sesión 

Una sesión TLS es una asociación entre 2 clientes para poder realizar varias conexiones sin tener que hacer todo el intercambio de claves y autenticación en cada intercambio. La sesión utiliza la siguiente información:

- Identificador unico de sesion
- Certificado X.509v3 en el otro extremo (opcional)
- Metodo de compresión acordado
- Metodo de encriptacion y MAC acordado
- Clave de sesión compartida de 48 bytes, conocido como **Master Secret**.

### Conexión

Describe como intercambiar datos con el protocolo. Esto contiene:

- Una secuencia de bits aleatoria de calidad criptografica
- Claves de escritura para ambos lados
- Claves para MACs para ambos lados
- IVs si son necesarios
- Numero de secuencia para cliente y servidor

### Handshake

1. Client Hello:

   <img src="Resources/14 - Protocolos/Screen Shot 2022-04-28 at 17.16.53.jpg" alt="Screen Shot 2022-04-28 at 17.16.53" style="zoom:50%;" />

2. Server Hello:

   <img src="Resources/14 - Protocolos/Screen Shot 2022-04-28 at 17.17.13.jpg" alt="Screen Shot 2022-04-28 at 17.17.13" style="zoom:50%;" />

3. Certificate (Si el servidor es autenticado)

   <img src="Resources/14 - Protocolos/Screen Shot 2022-04-28 at 17.17.40.jpg" alt="Screen Shot 2022-04-28 at 17.17.40" style="zoom:50%;" />

4. Server Key Exchange

   <img src="Resources/14 - Protocolos/Screen Shot 2022-04-28 at 17.17.58.jpg" alt="Screen Shot 2022-04-28 at 17.17.58" style="zoom:50%;" />

5. Certificate Request (Si el cliente es autenticado)

   <img src="Resources/14 - Protocolos/Screen Shot 2022-04-28 at 17.18.36.jpg" alt="Screen Shot 2022-04-28 at 17.18.36" style="zoom:50%;" />

6. Server Hello Done

   <img src="Resources/14 - Protocolos/Screen Shot 2022-04-28 at 17.19.05.jpg" alt="Screen Shot 2022-04-28 at 17.19.05" style="zoom:50%;" />

7. Client Certificate (Si fue solicitado)

   <img src="Resources/14 - Protocolos/Screen Shot 2022-04-28 at 17.19.33.jpg" alt="Screen Shot 2022-04-28 at 17.19.33" style="zoom:50%;" />

8. Client Key Exchange

   1. Versión RSA:

      <img src="Resources/14 - Protocolos/Screen Shot 2022-04-28 at 17.19.53.jpg" alt="Screen Shot 2022-04-28 at 17.19.53" style="zoom:50%;" />

   2. Versión DH:

      <img src="Resources/14 - Protocolos/Screen Shot 2022-04-28 at 17.21.46.jpg" alt="Screen Shot 2022-04-28 at 17.21.46" style="zoom:50%;" />

9. Change Cipher Spec:

   <img src="Resources/14 - Protocolos/Screen Shot 2022-04-28 at 17.22.42.jpg" alt="Screen Shot 2022-04-28 at 17.22.42" style="zoom:50%;" />

10. Finish:

    <img src="Resources/14 - Protocolos/Screen Shot 2022-04-28 at 17.23.17.jpg" alt="Screen Shot 2022-04-28 at 17.23.17" style="zoom:50%;" />

11. Change Cipher Spec:

    <img src="Resources/14 - Protocolos/Screen Shot 2022-04-28 at 17.23.55.jpg" alt="Screen Shot 2022-04-28 at 17.23.55" style="zoom:50%;" />

12. Finish:

    <img src="Resources/14 - Protocolos/Screen Shot 2022-04-28 at 17.24.31.jpg" alt="Screen Shot 2022-04-28 at 17.24.31" style="zoom:50%;" />

Donde las variables son:

- $V_c$: Versión cliente, $V_s$: Versión server $V = \min(V_c,V_s)$
- $r_1,r_2:$ nonces
- $S_{id}:$ Id de la sesión. 0 para iniciar una nueva sesión.
- Ciphers: Lista de stacks criptográficos disponibles.
- Cipher: Stack crittografico elegido
- Comps: Metodos de compression disponibles
- Comp: Método de compresión elegido.
- $p$: parametros cirptograficos
- $K_s$: Clave privada del servidor correspondiente.
- Ctype: Tipo de certificados permitivos
- Cas: Lista de autoridades certificantes validas
- $g,p$: parametros de Diffie-Hellman
- Opad: 01011100 (binario, repetido durante todo un bloque – 20 bytes)
- Ipad: 00110110 (binario, repetido durante todo un bloque – 20 bytes)
- msgs: concatenación de todos los mensajes intercambiados hasta el momento

### TLS Change Cipher Spec

Es utilizado durante el handshake y puede aparecer en cualquier momento de la conversación. Este mensaje implica un cambio de las calves de sesión utilizadas, solicitado tanto por el cliente como el servidor.

### TLS Alert

Este mensaje envia eventos fuera de banda como lo son advertencias o errores.



















