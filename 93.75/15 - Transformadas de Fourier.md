# Transformadas de Fourier

## Transformada Discreta de Fourier

Cuando convertimos a una señal del mundo real a una computadora, obtenemos una secuencia ordenada de números que se denomina **muestra**. A $T_s$ se lo denomina **periodo de muestreo** y a su inversa **frecuencia de muestreo** $f_S = \frac 1 {T_s}.$

Si tenemos $N$ muestras de una función $f(t)$ supondremos que se la extiende periódicamente con el periodo $N\times T_s:$
$$
f[n+N] = f[n]
$$
Podemos pensar a la función $f$ como:
$$
f[n] = \sum_{n=0}^{N-1} f(t) \delta(t-n\times T_s)
$$
Y la transformada de Fourier de la señal original es:
$$
F(w) = \int_{-\infty}^{\infty} f(t) e^{-inwt}dt = \sum_{n=0}^{N-1} f[n] e^{-inwt}
$$

#### Calculo de DTF

1. Definimos $W=e^{i\frac 2N\pi}$

2. Obtenemos:
   $$
   \array{
   F[k] = \sum_{n=0}^{N-1}f[n] W_N^{kn} \\
   f[n] = \frac 1 N \sum_{k=0}^{N-1} F[k]W_N^{-nk}
   }
   $$

3. La transformada se puede escribir de forma matricial:

   <img src="Resources/Untitled/Screen Shot 2022-10-06 at 16.29.50.jpg" alt="Screen Shot 2022-10-06 at 16.29.50" style="zoom:50%;" />

Si $f$ es real, entonces no todos los coeficientes de la serie de Fourier son relevantes ya que $c_n = c_{-n}^*$