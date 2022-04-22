# OpenSSL y JCA

# 1

> 1. ¿Qué algoritmos de cifrado simétrico soporta openssl?

Para averiguar esto hay que usar el comando:

```bash
$ openssl enc -list
```

Este comando devuelve todos los cifrados que soporta junto a sus variaciones. Resumidamente, obtenemos que soporta:

```
base64, Blowfish, CAST, DES, IDEA, RC2, RC4, RC5, AES
```


> 2. ¿Qué modos de cifrado de bloque soporta openssl?

```
cbc, cfb, cfb1, cfb8, ctr, ecb, ofb               
```


> 3. ¿Qué modos de cifrado tiene AES en openssl? ¿A qué hace referencia?

Los modos de cifrado de `AES` en OpenSSL dependen del largo de la llave:

- 128b
- 192b
- 256b

Ademas de los cifrados de bloque:

- cbc
- cfb
- cfb1
- cfb8
- ctr
- ecb
- ofb


> 4. ¿Cómo se establece el vector de inicialización para comenzar el cifrado?

Se establece mediante el parametro `-iv` y toma valores hexadecimales

```bash
$ openssl enc -aes -iv ...
```


> 5. ¿ Qué relación hay entre clave, vector de inicialización y password en openssl?

==??==

> 6. ¿Para qué sirve el “SALT” y como se indica en openssl?

Es una secuencia de caracteres que se le va a agregar al principio de nuestro texto antes de ser encriptado. Esto permite que nuestro texto cifrado cambie y no sea vulnerable a ataques de diccionario. 

Para indicarlo hay que usar el parámetro `-s salt`

## 2

> Cifrar la cadena “me estoy asando” con DES, modo CBC (es el default) y en modo ECB usando
> como contraseña “reloj”. Buscar una opción para codificar en base64 el resultado y que salga
> algo legible.

```bash
$  echo "me estoy asustando" | openssl enc -des -k reloj -pbkdf2 -base64
U2FsdGVkX18D61EAEXeQ+JZswVzmE48owBXuMBLcPemco4KRINQ92g==
$  echo "me estoy asustando" | openssl enc -des-ecb -k reloj -pbkdf2 -base64
U2FsdGVkX1+HiYSJ72e25ISIwHF6PqhfQEFFrPtNw4joVeD+XKI9wg==
```

> Volver a cifrar y comparar los resultados ¿Se usó el SALT?

Se uso salt por que todos los resultados son distintos.

> Volver a cifrar sin SALT y observar en qué se diferencia la salida.

```bash
$  echo "me estoy asustando" | openssl enc -des -k reloj -pbkdf2 -base64 -nosalt
hevB/Vol2HSAx/DEgzfv9YcrxwEzSSFE
$  echo "me estoy asustando" | openssl enc -des-ecb -k reloj -pbkdf2 -base64 -nosalt
JmYg41wn1sUg8TpHk+DcEdUf0L3LnOHH
```

Esta vez, si se repite el comando el output es siempre el mismo

> Cifrar con DES modo CBC y con modo ECB la cadena `buen diabuen dia`.(NO usar base 64)
> ¿Qué cambia en cada caso?

```bash
$  echo "buen diabuen dia" | openssl enc -des -k reloj -pbkdf2
Salted__�ɓ"KrՏ��.�P���F���V�n�%��^
$  echo "buen diabuen dia" | openssl enc -des-ecb -k reloj -pbkdf2
Salted__�jJ��]Z���vW�4j<��p��l��
```

Se puede ver que en el caso de ECB, podemos identificar que se está repitiendo la misma cadena en el input, mientras que en el caso de CBC no se puede notar.

# 3

> Descifra la cadena siguiente, sabiendo que está cifrada con AES128 y la contraseña es “margarita”
> (observa que cada comando de cifrado tiene una opción de cifrar y otra de descrifrar).
>
> ```
> eWEgZXN0YW1vcyBlbiBTZW1hbmEgU2FudGEK
> ```

Para descifrarlo hay que hay que usar el parámetro `-d`:

```bash
$ echo "U2FsdGVkX1/RG05P2VAvozotgotRo2r4M/Vc8wt+T+jrdX/zvxSic6XbfSy8CaqL" | openssl enc -d -aes128 -k margarita -a -pbkdf2
ya estamos en Semana Santa
```

# 4

> Descifra la cadena siguiente, sabiendo que está cifrada con AES128, que la clave es “1234A” y el iv es
> “AAFF” 
>
> ```
> OLhfDpOmkHFkujdSbLGIpRvVnBINKPJRVjdq5S8NxkTuiu8kS30QoVuzAo9otQwD
> ```

```bash
$ echo "OLhfDpOmkHFkujdSbLGIpRvVnBINKPJRVjdq5S8NxkTuiu8kS30QoVuzAo9otQwD" | openssl enc -d -a -aes128 -K 1234A -iv AAFF  -pbkdf2
por ahora es fácil Criptografia
```

> ¿De cuántos bytes es una clave para AES128?

16 bytes

> En este caso, ¿Cuál es, en hexa, la clave que realmente se utilizó?

```
1234A00000000000
```

# 5

> Construir un archivo de 1KB de longitud con todos sus bytes en 0. Encriptarlo con AES usando la misma clave pero una vez en modo ECB y otra en modo CBC. Comparar los resultados.

Creo un archivo vacio con el comando:

```bash
$ dd if=/dev/zero of=zero-file bs=1 count=10000000000
```

Y luego lo encripto utilizando cvc:

```bash
$ openssl enc -aes-128 -k hola -nosalt -in zero-file -pbkdf2
}���6A�M��{��G��D�l���^><����|H�=���أ�Js�(V����%���L�0Y���Ra����M(��6w0�Hǹzδ���?s�l�B)8}%^y��{炅[^�#Iװ4h�OF�,Q�!k�
                         ײ��l�@Exe��Ƞ��:]'"	��꿐~=t� +���P��"�����ІM)�WO6%r&�ќ���?f�ls�`��


















���!���`�o��/]����oQ�$���1�0��r}Y�M<�].TM��K�/��
                                                 P�Z�*��o5� :*���I��ƴ
a�`�Z��%���7�R�S�$�ߒ"�W�����jP��f	K���!B�qɦF�z�:��4'��~���R��y#8
                                                                       ��D!�n�s�@V�/S�Xܝw��r(޹������0�:��
�5CӒώpA��5���uk^�U�V��A|VZU�dɻ��%�@�#HR�
                                         .��n�I%��!�wŅ����P�
                                                            ,`�-��?JVA�a�>�j�Ckׅ4�^���
                                                                                     X)�OcL_�ל�`7�xK��R�J�D�uɫHc�����G{���4�����$���A�-�Vb�E�
                                                    f���W*^��ę�4��o���¢8v�6����mF7���6%�:�:ֺ*�<ei͌�TWӲ�aBqk�1�@�)�ho԰8,x�9��H���kc����T���{`�"�:�Mٶ���
  a��ce2P�I#`����ǵ���\C`r`/c�LA'm�W@�8?U�aMu�b
                                               �/�M^6[����� �R�&6#�J0���Lmg�ʀ��ܕ�F�U2\��N�c�c6��[����	R��F�|���7W�=�?����l������'<��O@-�J���5�E�Mu
                                                                1A^
,�.�T����%#|�!6�Wy18�κ�2�HB����'�����/��̘!d�t���)�v$?�:�ty��S�6s����
```

Y luego lo hago con ecb:

```bash
$ openssl enc -aes-128-ecb -k hola -nosalt -in zero-file -pbkdf2
��?2����
�̶E#���?2����
�̶E#���?2����
�̶E#���?2����
�̶E#���?2����
�̶E#���?2����
�̶E#���?2����
�̶E#���?2����
�̶E#���?2����
�̶E#���?2����
�̶E#���?2����
�̶E#���?2����
�̶E#���?2����
�̶E#���?2����
�̶E#���?2����
�̶E#���?2����
�̶E#���?2����
�̶E#���?2����
�̶E#���?2����
�̶E#���?2����
�̶E#���?2����
�̶E#���?2����
�̶E#���?2����
�̶E#���?2����
�̶E#���?2����
�̶E#���?2����
�̶E#���?2����
�̶E#���?2����
�̶E#���?2����
�̶E#���?2����
�̶E#���?2����
�̶E#���?2����
�̶E#���?2����
�̶E#���?2����
�̶E#���?2����
�̶E#���?2����
�̶E#���?2����
�̶E#���?2����
�̶E#���?2����
�̶E#���?2����
�̶E#���?2����
�̶E#���?2����
�̶E#���?2����
�̶E#���?2����
�̶E#���?2����
�̶E#���?2����
�̶E#���?2����
�̶E#���?2����
�̶E#���?2����
�̶E#���?2����
�̶E#���?2����
�̶E#���?2����
�̶E#���?2����
�̶E#���?2����
�̶E#���?2����
�̶E#���?2����
�̶E#���?2����
�̶E#���?2����
�̶E#���?2����
�̶E#���?2����
�̶E#���?2����
�̶E#���?2����
�̶E#��ֹ!y99+c�i3�
```

Claramente se puede ver que el mensaje encriptado con ECB es bastante mas predecible que con CBC.
