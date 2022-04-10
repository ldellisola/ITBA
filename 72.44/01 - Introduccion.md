# Introducción

La palabra *“Criptografía”* proviene del griego y significa “escritura secreta”. Para nosotros, es un conjunto de técnicas matemáticas sobre las cuales se implementan mecanismos de seguridad.

## Criptosistema

Es un sistema que define una función que transforme información en texto cifrado y que luego tenga otra función que permita revertir la transformación a texto plano. Debe tener una segunda entrada llamada **clave**.

<img src="Resources/01 - Introduccion/Screen Shot 2022-03-03 at 16.59.45.png" alt="Screen Shot 2022-03-03 at 16.59.45" style="zoom:50%;" />

### Cifrado

El cifrado es el proceso de transformación de un mensaje. Tiene dos parámetros, el mensaje y la clave. Sin clave, la transformación no puede ser invertida.

Según el **principio de Kerckhoffs**, La seguridad del criptosistema no debe depender de la implementación del algoritmo. El cifrado no debería ser mas fácil o difícil de romper si se conoce el código fuente. Se debe asumir que todo aspecto del sistema, excepto la clave, es conocido. Los sistemas que ocultan el código fuente se dice que *dan seguridad por oscuridad*, y esto no es verdad.

La idea de un mensaje cifrado puede ser publicado y enviado por canales no seguros. La seguridad reside en la clave, que usualmente tiene un tamaño considerablemente menor al mensaje.

## Cifrado por Rotación

La idea es considerar a cada letra como un numero (su posición en el alfabeto por ejemplo). La clave $k$ es un numero entre $1$ y $26$. Un cifrado posible seria reemplazar cada letra por la que ocupa $k$ posiciones a continuación del alfabeto. Este sistema no es seguro por la poca cantidad de rotaciones posibles, solo 25 opciones.

Siempre es valido poder utilizar fuerza bruta para romper el algoritmo, pero para esto es necesario poder discriminar entre un mensaje valido y uno invalido.

## Cifrado de Sustitución

Son cifrados donde se reemplaza un símbolo por otro.

<img src="Resources/01 - Introduccion/Screen Shot 2022-03-03 at 17.22.28.png" alt="Screen Shot 2022-03-03 at 17.22.28" style="zoom:50%;" />

Para decodificar mensajes encriptados con este cifrado, se suelen estudiar las propiedades estadísticas del lenguaje, ya que estas no se ven alteradas.

## Cifrado de Vigenere

Es una sustitución polialfabetica, es decir que un mismo símbolo puede transformarse en diferentes. Se toma una clave de longitud $n$ y se parte al mensaje en partes de longitud $n$. Entonces cada bloque se rota según la posición en la clave.

<img src="Resources/01 - Introduccion/Screen Shot 2022-03-03 at 18.17.56.png" alt="Screen Shot 2022-03-03 at 18.17.56" style="zoom:50%;" />

Este cifrado fue roto en 1863 por Friedrich Kasiski. El ataque tiene como objetivo determinar la longitud del bloque y luego analizar la clave de cada bloque por separado.

Para obtener la longitud del bloque se usa el **Test de Kasiski**:

1. Buscar secuencias repetidas
2. Calcular la distancia entre las secuencias
3. La longitud de la clave es múltiplo del MCD entre las distancias halladas.

El **metodo de coincidencia mutua** sirve para obtener la clave mediante un análisis estadístico de la distribución de las letras. Para hacer esto debemos hacer:

1. Determinar estadísticamente las letras mas probables en cada grupo.
2. Estimar las rotaciones que llevan a cada grupo a equipararse con las estadísticas del lenguaje.
3. Probar las rotaciones, eliminando caminos al encontrar combinaciones sin sentido.

## Hay Criptosistemas Seguros?

Primero tenemos que definir que consideramos *“seguro”*. Por mucho tiempo, un cifrado era seguro si no se lo lograba analizar. Los avances de la Segunda Guerra Mundial nos llevan a la criptografía moderna, donde se definen:

- Representaciones formales de criptosistemas
- Definiciones del modelo de amenaza.
- Pruebas de seguridad formales.

Un criptosistema es seguro, si ningún adversario puede computar cualquier función del texto plano a partir del mensaje cifrado que posee. A esta condición se la conoce como la **condición de secreto perfecto**.

## Cirptosistema Simetrico

Es una terna de algoritmos:

- Generation de claves
- Cifrado $Enc_k(m)$
- Descifrado $Dec_k(c)$

La salida de la función generadora se define como el espacio de claves $K$. La entrada de la función de cifrado es el espacio de mensajes y la entrada de la función de descifrados de define como el espacio de los mensajes cifrados.

En este sistema, siempre se tiene que cumplir que:
$$
\forall m,k \text{ validos }:Dec_k(Enc_k(m))=m
$$

## Secreto Perfecto

Dado un criptosistema:

- Gen: $k \larr k$
- Enc: $c \larr Enc_k(m)$
- Dec: $m = Dec_k(c)$

Tiene secreto perfecto si se cumple que para cualquier distribución de probabilidad en $M$, cada mensaje $m$ y cada mensaje cifrado $c$ tal que $Pr[C=c] > 0$:
$$
Pr[M=m|C=c] = Pr[M=m]
$$
Es una forma de decir que el texto plano y el cifrado son probabilísticamente independientes.

Hay cuatro definiciones para poder decir si un criptosistema tiene secreto perfecto:

1. Si la probabilidad de que el mensaje sea $m$ es igual a la probabilidad de que el mensaje sea $m$ sabiendo el cifrado $c$. Lo que conozco del mensaje tiene que ser lo mismo antes que después del cifrado.
   $$
   P(M=m) = P(M=m/C=c)
   $$

   $$
   \text{Sean los mensajes } M = \{m_1,m_2\},\text{ los mensajes cifrados }K=\{k_1,k_2\} \\ 
   \text{Sean los mensajes de texto plano y cifrados: }\\ 
   \array{
    & | & k_1 & | & k_2 \\ 
   m_1 & | & 1 & | & 2 \\ 
   m_2 & | & 2 & | & 1 \\ 
   }\\
   \text{Y sean las probabilidades: } \\
   \array{p(m_1) = 0.7 & p(m_2) = 0.3 & p(k1)=0.5 & p(k_2) = 0.5}\\
   p(m_1) = 0.5
   $$

   

2. Si la probabilidad de que el cifrado sea $c$ es igual a la probabilidad de que el cifrado sea $c$ sabiendo que el mensaje es $m$
   $$
   P(C=c) = P(C=c/M=m)
   $$

3. sda
   $$
   \array{P(C=c/m_1) = P(C=c/m_2) &&\forall m_1,m_2}
   $$
   

## Escenarios de Ataques

- **Ataque de texto cifrado**: El adversario solo dispone de mensajes cifrados y busca obtener los mensajes.
- **Ataque de otro texto plano conocido**: El adversario conoce pares con la misma clave, y busca obtener un mensaje a partir de otro texto cifrado.
- **Ataque de texto plano escogido**: El adversario puede obtener el cifrado de cualquier mensaje que quiera, y busca obtener el descifrado de un mensaje cifrado diferente.
- **Ataque de texto cifrado escogido**: El adversario puede obtener el descifrado de los mensaje que desee, y busca obtener el descifrado de un mensaje diferente.

Para que un criptosistema sea seguro, no debe ser afectado por esto cuatro ataques.