# Transformadas de Fourier

## Transformada Continua de Fourier

La transformada continua de Fourier se usa cuando se esta trabajando con señales finitas o infinitas, pero que decaen a 0 cuando $t\rarr \infty.$

Dada una función $f$ con un desarrollo de Fourier $\hat f,$  se puede obtener la transformada continua de Fourier de la siguiente manera:
$$
F(w) = \int_{-\infty}^{\infty} f(t) e^{-iwt} dt
$$

De tener solo la frecuencia $f$, también podemos decir que la transformada de Fourier se calcula de la siguiente forma:
$$
F(f) = \int_{-\infty}^{\infty} f(t) e^{-2\pi ift} dt
$$

## Transformada Inversa de Fourier

Se puede revertir la operación anterior para obtener una función a partir de su transformada continua:
$$
f(t) = \frac 1 {2\pi} \int_{-\infty}^{\infty} F(w) e^{iwt}dw
$$

## Transformada Discreta de Fourier

Cuando convertimos a una señal del mundo real a una computadora, obtenemos una secuencia ordenada de números que se denomina **muestra**. A $T_s$ se lo denomina **periodo de muestreo** y a su inversa **frecuencia de muestreo** $f_S = \frac 1 {T_s}.$

<img src="Resources/15 - Transformadas de Fourier/Screenshot 2022-11-04 at 08.58.33.jpg" alt="Screenshot 2022-11-04 at 08.58.33" style="zoom:50%;" />

Si tenemos $N$ muestras de una función $f(t)$ supondremos que se la extiende periódicamente con el periodo $N\times T_s:$
$$
f[n+N] = f[n]
$$
Podemos pensar a la función $f$ como:
$$
f[n] = \sum_{n=0}^{N-1} f(t) \delta(t-n\times T_s)
$$
El profesor no tiene idea de que es la función $\delta$ y no lo explica en ningun lado. Según los ejemplos $f[n]$ es básicamente $f(x)$ evaluada en puntos específicos.

Los valores de la transformada discreta de Fourier se obtienen de la siguiente forma:
$$
F[k] = \sum_{n=0}^{N-1} f[n] e^{-\frac{i2n\pi}Nk}
$$
Y la transformada de Fourier de la señal original es:
$$
F(w) = \int_{-\infty}^{\infty} f(t) e^{-inwt}dt = \sum_{n=0}^{N-1} f[n] e^{-inwt}
$$

### Frecuencias Presentes en la Señal

A partir de las muestras obtenidas de una señal podemos descubrir las frecuencias presentes en la misma. 

La frecuencia de muestreo necesaria para conocer el espectro de una función con es:
$$
f = 2\times f_\max
$$

### Aliasing

Se produce aliasing cuando no se respeta el teorema de Nyquist y se utiliza una frecuencia de sampleo menor al doble de la maxima frecuencia de la función. En estos casos puede suceder que algunas de las frecuencias armónicas sean representadas por otra frecuencia percibida.

Para poder predecir por que frecuencia percibida van a ser representadas estas frecuencias armónicas se puede utilizar la siguiente formula:
$$
f_{\text{percibida}} = \left|f - f_{\text{sampleo}}\times \text{round}\left(\frac f {f_{sampleo}}\right)\right|
$$
Donde $f$ es la frecuencia armónica, $f_{\text{sampleo}}$ es nuestra frecuencia de sampleo que no cumple con el teorema de Nyquist y $\text{rondeo}()$ es una función que redondea un numero real al entero más cercano. 

Una forma no analítica más fácil de obtener la frecuencia percibida es pararse en la frecuencia de sampleo y ver si hay alguna frecuencia de la función que sea mayor a esa. De existir, podemos predecir como sera percibida si 

### Transformada Discreta Inversa de Fourier

Luego de obtener la transformada discreta de Fourier, es fácil obtener la señal a partir de la cual esta fue creada:
$$
f[n] = \frac 1 N \sum_{k=0}^{N-1} F[k]e^{i\frac{2\pi n}N k}
$$

### Computo de la Transformada Discreta de Fourier

1. Definimos $W=e^{i\frac 2N\pi}$

2. Obtenemos:
   $$
   \array{
   F[k] = \sum_{n=0}^{N-1}f[n] W_N^{-kn} \\
   f[n] = \frac 1 N \sum_{k=0}^{N-1} F[k]W_N^{nk}
   }
   $$

3. La transformada se puede escribir de forma matricial:

   <img src="Resources/Untitled/Screen Shot 2022-10-06 at 16.29.50.jpg" alt="Screen Shot 2022-10-06 at 16.29.50" style="zoom:50%;" />

Si $f$ es real, entonces no todos los coeficientes de la serie de Fourier son relevantes ya que $c_n = c_{-n}^*$

### Espectro en Amplitud

El espectro en amplitud de una señal real se construye como:
$$
A(k) = \left\{
\array{
\frac{|F[k]|}{N}&k = 0,k=\frac N 2\\
\frac{2|F[k]|}N & \text{else}
}

\right.
$$
