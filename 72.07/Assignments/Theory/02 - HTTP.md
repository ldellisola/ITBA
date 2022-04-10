# HTTP

## 1

> ¿De qué forma puede un Proxy HTTP saber que para el recurso que le solicita un cliente aún es válida la copia que tiene en caché?

Lo puede hacer con los headers de `max-age` y `last-modified`.

## 2

>  El modelo de capas TCP/IP no ofrece un nivel de Sesión. El protocolo HTTP no es orientado a conexión. ¿Cómo puede entonces una aplicación web mantener una “sesión” abierta?

La sesión en el protocolo HTTP se mantiene en las cookies.

## 3

> ¿Es correcto afirmar que “la única posibilidad de solicitar un recurso desde mi browser y obtenerlo sin acceder al servidor HTTP es porque el proxy tiene una copia del mismo”?

Falso, el recurso puede estar cacheado en mi navegador.

## 4

> Una empresa tiene una aplicación web interna, que –por cuestiones de seguridad- sólo acepta conexiones desde el proxy. A fin de asegurarse que quien se conecta sea realmente el proxy, espera en el encabezado una frase secreta usando un “custom header”, por ejemplo una línea conteniendo el encabezado “X-PHRASE:I AM THE PROXY”. En este servidor HTTP, ¿habilitaría o no la opción TRACE?

No se habilitaría la opción `TRACE`. Esto haría que se pueda leer la frase secreta del reader.

## 5

> Indicar si las siguientes afirmaciones son válidas o no:
>
> 1. HTTP es un protocolo de texto

Depende de la version. La version 2 es un protocolo binario.

> 1. MIME es un protocolo que pertenece a la capa de presentación del modelo OSI

Verdadero.

> 1. “Third party cookies” hace referencia a una cookie que un servidor HTTP deja para ser enviada luego a otro servidor HTTP

Falso, ya que las cookies estan relacionadas si o si con el servidor en el cual esta alojado el recurso.

## 6

> ¿Por qué puede ser que algunos recursos -por ejemplo imágenes- que se obtienen de un mismo servidor HTTP se guardan en la caché y otras no, siendo que todos ellos tienen el mismo header de Cache-Control ? 

Por que algunos recursos fueron solicitados con el comando `GET` (permite el cache) mientras que otros pueden haber sido obtenidos con el comando `POST`.

## 7

> Si un recurso enviado por un servidor HTTP es cacheado en mi browser, ¿significa eso que también será cacheado en mi proxy? Para poder responder correctamente ver https://stackoverflow.com/questions/3492319/private-vs-public-in-cache-control

Depende del modo de cacheo utilizado. Si el recurso utiliza el modo de cacheo privado, esta solo cacheado en el navegador. Por el contrario, si utiliza el cacheo publico, entonces esta cacheado tanto en el navegador como en el proxy.