# HTTP

## 12

> En la siguiente URI https://tools.ietf.org/html/rfc2616#section-14.19 ¿Cómo
> se llama la parte “section-14.19”? ¿Se envía por la red al hacer el request? ¿Por qué?

Se llama etiqueta o fragmento

## 13

> ¿Cuál es la diferencia entre una URI y una URI reference?

Es la misma mierda.

## 14

> Dada la URI base http://a/b/c/d:p?q resuelva las referencias enumeradas en la sección 5.4.1. del [RFC3986]

Nope

## 15

> ¿Según la interpretación que tiene HTTP sobre las URIs: las siguientes URL son equiva-
> lentes?
>
> - http://abc.com:80/~smith/home.html
> - http://ABC.com/%7Esmith/home.htm
> - http://ABC.com:/%7esmith/home.htm

Son todas equivalentes

## 16

> En el siguiente elemento XML ¿Cuales de las siguientes URL tienes sentido que sean
> propiamente URL y cuales pueden ser URNs?
>
> ```xml
> <foo 
>      xmlns="http://www.springframework.org/schema/beans"
>      xmlns:xsi="http://www.w3.org/2001/XMLSchemainstance"
>      xmlns:util="http://www.springframework.org/schema/util"
>      xsi:schemaLocation="http://www.springframework.org/schema/beans
>                          http://www.springframework.org/schema/beans/springbeans.xsd
>                          http://www.springframework.org/schema/util
>                          http://www.springframework.org/schema/util/springutil.xsd"
>      >
> ```

La primer linea es una URL, mientras que las otras son URN. Te podes dar cuenta por el uso de los `:`, separando la especificación del esquema del identificador del espacio de nombres.

## 17

> Comunique dos terminales utilizando netcat

Una terminal  empieza a escuchar en un puerto especifico con el comando:

```bash
$ nc -l 8080
```

Y la contra terminal se conecta a esta terminal con el comando:

```bash
$ nc localhost 8080
```

Sabiendo que ambas terminales están en la misma red y se conectan mediante la ip `localhost`

## 18

> HTTP/1.1 y otros protocolos utilizan las secuencias CR LF como marcas de fin de línea.
> ¿Cómo hacer que netcat utilice `\n\r` al poner una nueva linea en vez de usar solo `\n`?

Para hacer esto, tanto en la terminal que se conecta como la que espera la conexión se debe usar el parámetro `-C`:

```bash
$ nc -C -l 8080
$ nc -C localhost 8080
```

## 19

 >Con netcat escuche en el puerto TCP 9090. Ingrese la URL http://localhost:9090/
 >en un User Agent:
 >
 >1. Analizar detalladamente la estructura del request y en particular los headers que el user
 >     agent envió

La estructura es la siguiente:

```
GET / HTTP/1.1
Host: localhost:9090
User-Agent: curl/7.68.0
Accept: */*
```

 >2. Desde el server (netcat) retorne una respuesta que no siga las reglas de HTTP. ¿Qué
 >     sucede en el user agent?

No hay detalles de la response, solo imprime en pantalla el contenido

 >3. Vuelva a realizar el request y desde el server (netcat) retorne una respuesta de formato
 >     válido. Verifique comportamiento en el user agent

Imprime el contenido en pantalla y agrega los headers y datos del protocolo HTTP.

## 20

> Con netcat conéctese a www.google.com.ar al puerto 80, y envíe de header GET /
> HTTP/1.1\r\n\r\n (sin ningún otro header).
>
> 1. ¿Qué código de respuesta retorna el servidor? ¿Qué significa? ¿Qué header es reque-
>    rido que esté presente en dicho código?

Devuelve el codigo 200, significa que OK. No se require ningún header para esto.

> 2. Realizar los cambios necesarios en el request para que el servidor envíe como repre-
>    sentación a nuestro pedido el formulario de búsqueda (es un html).

Ningun cambio

> 3. Analizar todos los headers que aparecen en la respuesta y su impacto en los UA (Ejem-
>    plo: Date, Cache-Control, Content-Type, Set-Cookie).

No gracias.

## 21

> Investigue el comando curl y el comando wget. ¿En que situación utilizaría cada una?.
> Preste atención a las opciones -0 --http1.1 --http2 --compressed -d -H -i -s
> --socks5 del comando curl.

Utilizaría `curl` cuando tengo que hacer una request a un servidor y `wget` cuando estoy intentando de descargar un archivo.

- `curl -0`: curl utiliza el protocolo `http 1.0`
- `curl --http1.1`:  curl utiliza el protocolo `http 1.1`
- `curl -http2.0`: curl utiliza el protocolo `http 2.0`
- `curl --compressed`: curl pide una request comprimida y lo descomprime
- `curl -d`: envia data con POST
- `curl -H`: Agrega un header.
- `curl -i`: incluye los headers de response en el output
- `curl -s`: no muestra mensajes de error
- `curl --socks5`: usa un proxy `socks5` pero hace la resolución del nombre local.

## 22

> Con la utilidad wget descargue un archivo “grande”. En el medio de la descarga cancele
> la misma; y luego intente resumir la descarga (--continue).
> ¿Qué headers participan para resumir las descargas?
> ¿Funciona con todas las páginas? Si no funciona; busque un contra ejemplo.

Hay dos headers:

- Length
- SavingTo

La diferencia es que con el argumento `--continue` el header de length tiene ademas cuanto le falta descargar.

## 23

> Los siguientes headers HTTP... ¿Son equivalentes? Accept: text/plain y AccEpT:
> text/plain

Si, son equivalentes. Los headers son case insensitive.

## 24

> 1. ¿Qué significa en la respuesta del servidor un header Transfer-Encoding: chunked?

Los datos se envían en una serie de fragmentos.

> 2. ¿Qué otras codificaciones existen?

- Transfer-Encoding: compress
- Transfer-Encoding: deflate
- Transfer-Encoding: gzip
- Transfer-Encoding: identity

> 3. ¿Para que sirven?

- Transfer-Encoding: compress

  Se comprime al contenido utilizando el algoritmo LZW

- Transfer-Encoding: deflate

  Se usa la estructura lib con el algoritmo de compresión defalte

- Transfer-Encoding: gzip

  Se codifica al contenido usando con el cifrado LZ77, con un CRC de 32 bits.

- Transfer-Encoding: identity

  Indica la función de identidad

> 4. ¿En que ocasiones utilizaría cada uno?

Que se yo. Lu sabe

## 25

> 1. ¿Qué es un media type?

Es un identificador de formatos de archivos transmitidos por internet (MIME)

> 2. ¿Para que se usa?

Para identificar formatos de archivos transmitidos por internet.


> 3. ¿Cómo está estructurado?

Indica el tipo de archivo, seguido del subtipo. Por ejemplo: `text/json`

## 26

> ¿Cuales son los requisitos para que un cliente pueda utilizar el esquema de conexiones
> persistentes de HTTP?

Utilizar los headers `keep-alive`.

>  ¿Qué ventajas brinda frente al esquema de pedidos tradicional?

Que no hay que restablecer la conexión con el servidor para cada request.

> ¿De qué se trata el pipelining?

Permite a los clientes hacer múltiples requests sin esperar a la respuesta de cada una.

## 27

> ¿Qué métodos provee HTTP?

GET, POST, HEAD, DELETE, PUT, OPTIONS, TRACE, PATCH, CONNECT

> ¿Qué significa que un método es idempotente?

Que siempre devuelve lo mismo.

> Piense del efecto de la idempotencia en el siguiente caso:
>
> > Se cuenta con una extensión al user-agent (ej: plugin de Firefox) que
> > una vez cargada las página web (de formato HTML) el mismo recolecta
> > todos los links en el documento, y con el objetivo de acelerar la expe-
> > riencia del usuario, comienza a descargar todos los links recolectados.
> > De esta forma el usuario cuando siga algún link de interés no tendrá
> > que esperar. Suponga que el usuario visita un sitio web que tiene una
> > página web que presenta un listado de cosas, y cada ítem, además de
> > presentar su nombre, presenta un link para editar su contenido, y otro
> > link para eliminar el mismo (es decir el clásico ABM). El desarrollador
> > decidió que realizando un GET a los link de eliminación (/items/123/
> > delete).
> >
> > • ¿Qué sucederá cuando el usuario que tiene el acelerador de internet activado acceda al ABM?

Se borra todo a la mierda. See IOL 1900-2016 RIP

> ¿Quién tiene la culpa de ese comportamiento?

El programador, como siempre

> ¿Como se podría solucionar el problema?

Programas bien y cambias los endpoints a DELETE

> ¿Por qué se dice que DELETE es idempotente si es que el método borra el recurso de
> la misma forma que el comando rm borra un archivo?

Por que la segunda llamada no cambia el estado del sistema.

> ¿Cuando utilizaría POST? (Además del RFC, revise [whenToUseGet])

Cuando quiero crear un recurso.

## 28

> Utilice el método TRACE contra www.google.com.ar para detectar si hay un proxy entre su computadora y el servidor de Google. Si ocurre algún error elabore una hipótesis de por que sucede.

Hay un proxy por que no me dejan hacerlo. Se que pasa esto por que me devuelve el codillo de estado 405 Method Not Allowed

## 29

No gracias.

## 30

> Si se encuentra snifeando la red y se encuentra con el siguiente pedido:
> GET / HTTP/1.1
> Authorization: Basic YWxndW51c3VhcmlvOmFsZ3VuYXBhc3N3b3Jk
> ¿De qué se trata el header Authorization?

De autorización 

> ¿Podría recuperarse el usuario y la password? Si es así...¿cuales son?

Esta codificado en base64, se obtiene:

```
algunusuario:algunapassword
```





















