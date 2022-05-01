# Cifrado Probabilistico

Si una función de cifrado es determinista, entonces no es segura bajo múltiples cifrados. El adversario puede aplicar el método anterior para cualquier criptosistema donde $e_k(x)$ es constante.

Es importante no reutilizar la clave, entonces se agrega un valor a la función generadora, que no deberá repetirse para una misma clave, a esto lo llamamos **nonce** o **IV**.

Hay dos formas de implementar esto, mediante:

- **Modo sincronizado** 

  <img src="Resources/07 - Cifrado Probabilistico/Screen Shot 2022-03-17 at 16.30.58.png" alt="Screen Shot 2022-03-17 at 16.30.58" style="zoom:50%;" />

- **Modo no sincronizado**

  <img src="Resources/07 - Cifrado Probabilistico/Screen Shot 2022-03-17 at 16.31.18.png" alt="Screen Shot 2022-03-17 at 16.31.18" style="zoom:50%;" />