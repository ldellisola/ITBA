# Cifrado Monoalfabetico

La idea de estos cifrados es que se utiliza un solo alfabeto para poder codificar a todo un mensaje. Estos alfabetos permiten mapear 1 a 1 los caracteres de un alfabeto a otro. Este tipo de criptosistemas son susceptibles a ataques de distribución de caracteres en el lenguaje inicial.

## Cifrado por Rotación

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

<img src="Resources/01 - Cifrado Monoalfabetico/image-20220430173034126.png" alt="image-20220430173034126" style="zoom:50%;" />

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