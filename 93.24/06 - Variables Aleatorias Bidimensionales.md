# Variables Aleatorias Bidimensionales

### Rango

El recorrido de las variables aleatorias bidimensionales es la combinación del recorrido de ambas variables aleatorias.
$$
Sean~X,Y\ \ Variables~Aleatorias~Discretas:\\
\therefore R_{X,Y}=R_X \cup R_Y
$$


## Variables Aleatorias Bidimensionales Discretas

### Probabilidad de $Y$ dado $X$

$$
P_{Y|X}(x,y)=P(Y=y,X=x)=\frac{P(X=x,Y=y)}{P(X=x)}=\frac{P_{x,y}(x,y)}{P_x(x)}
$$

### Probabilidad Conjunta de $X$ e $Y$

$$
P_{X,Y}(x,y)=P_{Y|X}(x,y)\ .\ P_X(x)
$$

### Probabilidad Marginal

$$
P_X(x)=P(X=x)=\sum_{y\in R_Y}P_{X,Y}(x,y)
$$

### Valor Esperado

$$
E[g(x,y)]=\sum_{x\in R_X} \sum_{y\in R_Y} g(x,y)\ .\ P_{X,Y}(x,y)
$$

### Independencia

#### Definición

Dos VAD $X$,$Y$  son Independientes $\Leftrightarrow$ $P_{X,Y}(x,y)=P_X(x)\ .\ P_Y(y)$

#### Corolario

1. Si  $P_Y(y) \neq0~y~P_{X|Y}(x|y) = P_X(x) \Rightarrow No~depende~de~Y$
2. Si  $P_X(x)\neq0~y~P_{Y|X}(x|y)=P_Y(y)\Rightarrow~No~depende~de~X$

### Covarianza

$$
Cov(x,y)=E[(x-\mu_X)(y-\mu_Y)]=E[x\ .\ y]-\mu_X\ .\ \mu_Y
$$

Si $X$,$Y$ son independientes $\Rightarrow~~Cov(x,y)=0$

### Coeficiente de Correlación

#### Definición

$$
\rho(x,y)=\frac{Cov(x,y)}{\sigma_X~.~\sigma_Y} 
$$

#### Teorema

1. $\rho(x,y)\in[-1,1]$
2. $\rho(x,y)= \pm1 \Leftrightarrow \exists~a,b \in\R~/~P(y=a\ .\ x+b)=1$

## Variables Aleatorias Bidimensionales Continuas

Además de todas las definiciones de covarianza, coeficiente de correlación, se definen las siguientes funciones.

### Densidad Conjunta

$$
f_{X,Y}(x,y)/ \int_{-\infty}^{\infty}\int_{-\infty}^{\infty}f_{X,Y}(x,y)~dx~dy=1\\
P((x,y)\in A) = {\int\int}_{A}f_{X,Y}(x,y)~dx~dy
$$

### Densidad Marginal

$$
f_X{(x)}=\int_{-\infty}^\infty f_{X,Y}(x,y)~dy
$$

### Densidad Condicional

$$
f_{Y|X}(y|x)=\frac{f_{X,Y}(x,y)}{f_X(x)}~~~~~f_{X|Y}(x|y)=\frac{f_{X,Y}(x,y)}{f_Y(y)}
$$

Si $X$,$Y$ son independientes $\Rightarrow f_{y|x}=f_y~~,~~f_{x|y}=f_x$

### Valor Esperado

$$
E[g(x,y)]=\int_{-\infty}^{\infty}\int_{-\infty}^{\infty} g(x,y)\ .\ f_{X,Y}(x,y)~dx~dy
$$

