# Criptosistemas

Notación:

- $m$: mensaje de texto plano
- $c$: mensaje cifrado
- $k$: clave

- $c_i$: caracter en la posición $i$ del mensaje cifrado
- $m_i$: caracter en la posición $i$ del texto plano

## Cifrado por Rotación

Es un cifrado **monoalfabetico**

### Como funciona?

- $\text{Gen} = k \in \{1,\dots,26\}$
- $\text{Cod}_k(m) = c/ c_i = m_i >> k$
- $\text{Dec}_k(c) =m / m_i = c_i << k$

Este cifrado es simple, la clave es un numero entre $1$ y la longitud del alfabeto. Para codificar un mensaje tenemos que rotar cada letra $k$ veces en un sentido, y para decodificarlo debemos rotar a nuestro texto cifrado $k$ veces en el sentido opuesto.

### Ejemplo

```
m = "textoplano"
k = 2
c[0] = m[0] >> 2 = 't' >> 2 = 'v'
c[1] = m[1] >> 2 = 'e' >> 2 = 'g'
...
c = "vgzvqrncpq"
```

### Seguridad

Este sistema no es seguro, ya que hay una cantidad limitada de rotaciones que se pueden hacer (en este caso particular 25). Es susceptible a un ataque de **fuerza bruta** pero el atacante debe poder diferenciar un mensaje valido de uno invalido.

No tiene secreto perfecto.

No son **CCA-Secure**

## Cifrado por Sustitución

Es un cifrado **monoalfabetico**

### Como funciona?

- $\text{Gen} = k \subset \{(a,b)\}^*, a \in \text{Alphabet}_1,b \in \text{Alphabet}_2$
- $\text{Cod}_k(m) = c / c_i = k[m_i]$
- $\text{Dec}_k(c) = m / m_i = k^{-1}[c_i]$

Este cifrado opera con una clave $k$ que es un diccionario, donde se mapea de forma biyectiva (una a una) los caracteres del alfabeto con los caracteres de otro alfabeto. Ambos alfabetos pueden ser los mismos.

### Ejemplo

```
alfabeto_a =  {a,b,c,d,e}
alphabeto_b = {1,2,3,4,5}
m = "ddecb"
k = {(a,1),(b,3),(c,5),(d,2),(e,4)}
c[0] = k[m[0]] = k['d'] = '2'
c[1] = k[m[1]] = k['d'] = '2'
...
c = "22453"
```

### Seguridad

Este cifrado es susceptible a los ataques que aprovechan **las distribuciones de las letras** en los distintos lenguajes. Si el lenguaje del mensaje del texto plano tiene una cierta distribución de caracteres, la misma va a estar presente en el mensaje cifrado.

No tiene secreto perfecto.

No son **CCA-Secure**

## Cifrado de Vignere

Es un cifrado **polialfabetica**.

### Como funciona?

- $\text{Gen}() = k \in \{a,\dots,z\}^*/ \#k = n $
- $\text{Cod}_k(m) = c$
- $\text{Dec}_k(m) = c$

Este cifrado depende de una clave $k$, de la cual también es importante su longitud $n$. Para cifrar un mensaje, tenemos que dividirlo en particiones de tamaño $n$ y aplicar un cifrado de rotación en base al valor de la clave en esa posición.

### Ejemplo

```
k = "abcd"
m = "textoplano"
m_part = ["text", "opla", "no"]
c_part[0][0] = m_part[0][0] + k[0] - 'a' = 't' + 'a' - 'a' = 't' >> 0 = 't'
c_part[0][1] = m_part[0][1] + k[1] - 'a' = 'e' + 'b' - 'a' = 't' >> 1 = 'f'
c_part[0][2] = m_part[0][2] + k[2] - 'a' = 'x' + 'c' - 'a' = 't' >> 2 = 'z'
c_part[0][3] = m_part[0][3] + k[3] - 'a' = 't' + 'd' - 'a' = 't' >> 2 = 'w'
...
c = "tfzwoqndnp"
```

### Seguridad

Para romper este cifrado hay que hacer un ataque que afecte a este criptosistema hay que realizar dos pasos:

1. **Encontrar la longitud de la clave**: Para esto buscamos las secuencias repetidas y calculamos la cantidad de caracteres que hay entre ellos. La longitud de la clave es el múltiplo del MCD entre las distancias halladas. A esto se lo llama **Test de Kasiski**.
2. **Encontrar la clave**: Una vez que tenemos la longitud de la clave, podemos partir al texto en segmentos y analizar a estos segmentos con técnicas probabilísticas como la distribución de caracteres en un idioma.

Este cifrado tiene **secreto perfecto** si la clave utilizada es más larga que el mensaje. Esto es por qué el método para romper a este criptosistema depende en encontrar los patrones repetidos.

No son **CCA-Secure**

## One Time Pad (OTP)

Existe un isomorfismo entre OTP y todos los criptosistemas que tienen secreto perfecto. Es un criptosistema simétrico.

### Como Funciona?

- $\text{Gen}(): k \in \{0,1\}^*$
- $\text{Cod}_k(m)= m \oplus k$
- $\text{Dec}_k(c) = c \oplus k$

### Ejemplo

```
m = "11010101100"
k = "10011010101"

c = m xor k
c = "01001111001"
```

### Seguridad

Este criptosistema tiene secreto perfecto con dos condiciones:

- Las claves no se pueden reusar
- Las claves deben ser aleatorias

No son **CCA-Secure**

## Criptosistemas de Flujo

Es un criptosistema simétrico.

### Como funcionan?

- $\text{Gen}() = s$
- $\text{Cod}_s(m) = G(s) \oplus m$
- $\text{Dec}_k(c) = G(s)\oplus c$

Donde la función $G$ es un generador pseudoaleatorio a partir de una seed $s$. Se basan el el OTP, pero lo modifican para añadir un poco de aleatoriedad al proceso. 

La diferencia radica en que, debido a que $s$ no se utiliza en el proceso de xor, la salida del generador pseudoaleatorio puede ser más grande, permitiendo que cifremos mensajes mucho más grandes que la clave.

### Ejemplo

```
Equivalente a OTP
```

### Seguridad

No tienen secreto perfecto, sino que se basa en seguridad computacional.

Son susceptibles a un ataque de cifrado multiple.

Son **CPA-Secure** si utilizan un parametro extra, llamado IV, para evitar reutilizar exactamente la misma seed en el generador.

No son **CCA-Secure**

## Criptosistemas de Bloque

Utilizan primitivas de cifrado en bloque como lo son DES, AES y 3-DES, y las unen junto a un modo de encadenamiento.

Si este modo de encademaniento es CBC, Counter, OFB o CFB, entonces es **CPA-Secure**.

No son **CCA-Secure**































