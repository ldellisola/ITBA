# Protocolos

 ==falta==

## TLS

Es la evolución de SSL y ofrece seguridad a nivel transporte y necesita de un canal confiable para poder ser utilizado (por ejemplo TCP). Ademas, el protocolo ofrece :

- Confidencialidad
- Integrada
- Autenticación de los participantes

<img src="Resources/06 - Protocolos/Screen Shot 2022-04-28 at 16.26.20.jpg" alt="Screen Shot 2022-04-28 at 16.26.20" style="zoom:50%;" />

<img src="Resources/06 - Protocolos/Screen Shot 2022-04-28 at 16.26.33.jpg" alt="Screen Shot 2022-04-28 at 16.26.33" style="zoom:50%;" />

Cuando TLS tiene que enviar un mensaje:

1. Divide al mensaje en no mas de $2^{16}$ bloques
2. A cada bloque se le calcula un hash y se los comprime juntos.
3. Se envía este par de bloque y hash comprimidos y se los envia al servicio inferior (TCP).

<img src="Resources/06 - Protocolos/Screen Shot 2022-04-28 at 16.28.18.jpg" alt="Screen Shot 2022-04-28 at 16.28.18" style="zoom:50%;" />

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

   <img src="Resources/06 - Protocolos/Screen Shot 2022-04-28 at 17.16.53.jpg" alt="Screen Shot 2022-04-28 at 17.16.53" style="zoom:50%;" />

2. Server Hello:

   <img src="Resources/06 - Protocolos/Screen Shot 2022-04-28 at 17.17.13.jpg" alt="Screen Shot 2022-04-28 at 17.17.13" style="zoom:50%;" />

3. Certificate (Si el servidor es autenticado)

   <img src="Resources/06 - Protocolos/Screen Shot 2022-04-28 at 17.17.40.jpg" alt="Screen Shot 2022-04-28 at 17.17.40" style="zoom:50%;" />

4. Server Key Exchange

   <img src="Resources/06 - Protocolos/Screen Shot 2022-04-28 at 17.17.58.jpg" alt="Screen Shot 2022-04-28 at 17.17.58" style="zoom:50%;" />

5. Certificate Request (Si el cliente es autenticado)

   <img src="Resources/06 - Protocolos/Screen Shot 2022-04-28 at 17.18.36.jpg" alt="Screen Shot 2022-04-28 at 17.18.36" style="zoom:50%;" />

6. Server Hello Done

   <img src="Resources/06 - Protocolos/Screen Shot 2022-04-28 at 17.19.05.jpg" alt="Screen Shot 2022-04-28 at 17.19.05" style="zoom:50%;" />

7. Client Certificate (Si fue solicitado)

   <img src="Resources/06 - Protocolos/Screen Shot 2022-04-28 at 17.19.33.jpg" alt="Screen Shot 2022-04-28 at 17.19.33" style="zoom:50%;" />

8. Client Key Exchange

   1. Versión RSA:

      <img src="Resources/06 - Protocolos/Screen Shot 2022-04-28 at 17.19.53.jpg" alt="Screen Shot 2022-04-28 at 17.19.53" style="zoom:50%;" />

   2. Versión DH:

      <img src="Resources/06 - Protocolos/Screen Shot 2022-04-28 at 17.21.46.jpg" alt="Screen Shot 2022-04-28 at 17.21.46" style="zoom:50%;" />

9. Change Cipher Spec:

   <img src="Resources/06 - Protocolos/Screen Shot 2022-04-28 at 17.22.42.jpg" alt="Screen Shot 2022-04-28 at 17.22.42" style="zoom:50%;" />

10. Finish:

    <img src="Resources/06 - Protocolos/Screen Shot 2022-04-28 at 17.23.17.jpg" alt="Screen Shot 2022-04-28 at 17.23.17" style="zoom:50%;" />

11. Change Cipher Spec:

    <img src="Resources/06 - Protocolos/Screen Shot 2022-04-28 at 17.23.55.jpg" alt="Screen Shot 2022-04-28 at 17.23.55" style="zoom:50%;" />

12. Finish:

    <img src="Resources/06 - Protocolos/Screen Shot 2022-04-28 at 17.24.31.jpg" alt="Screen Shot 2022-04-28 at 17.24.31" style="zoom:50%;" />

Donde las variables son:

- $V_c$: Versión cliente, $V_s$: Versión server $V = \min(V_c,V_s)$
- $r_1,r_2:$ nonces
- $S_{id}:$ Id de la sesión. 0 para iniciar una nueva sesión.
- Ciphers: 















































