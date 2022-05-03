# Cifrados Polialfabeticos

Este tipo de cifrados actúa mediante una sustitución polialfabetica, es decir que un mismo símbolo puede transformarse en diferentes.

## Cifrado de Vigenere

<img src="Resources/02 - Cifrado Polialfabetico/image-20220430173114972.png" alt="image-20220430173114972" style="zoom:50%;" />

- $\text{Gen}() = k \in \{a,\dots,z\}^*/ \#k = n$
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