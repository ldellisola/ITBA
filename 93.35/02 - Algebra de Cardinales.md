# Algebra de Cardinales

## Operaciones

### Suma

Sea $a=\#A, b=\#B, k=\#K, A \cap B= \empty$
$$
a+b = \#(A\cup B)
$$

- Verificamos que este bien definido:

  Tomo $A' \sim A,B'\sim B/ A' \cap B'=\empty$ y quiero probar que $\#(A'\cup B') = \#(A\cup B)$

  Puedo definir $f$ :
  $$
  \text{Como } A' \sim A \Rightarrow \exist f:A\rightarrow A' \text{ biyectiva}
  $$
  Puedo definir $g$:
  $$
  \text{Como } B' \sim B \Rightarrow \exist g:B \rightarrow B' \text{ biyectiva}
  $$
  Tambien defino $h$ tal que:
  $$
  h:A\cup B \rightarrow A' \cup B'/h(x)=
  \left\{
  	\array{
  	f(x) &	x\in A\\
  	g(x)	&	x \in B
  	}
  \right.
  $$
  Vemos que $h$ es biyectiva:

  - $h$ es inyectiva:

    - Caso 1) $x,y \in A$
      $$
      h(x)=h(y)\\f(x)=f(y)\\
      \text{Como $f$ es inyectiva}\\
      x=y
      $$

    - Caso 2) $x,y \in B$
      $$
      h(x)=h(y)\\
      g(x)=g(y)\\
      \text{Como $g$ es inyectiva}\\
      x=y
      $$

    - Caso 3)$x\in A, y\in B \Rightarrow x\neq y$

      Quiero ver que $h(x) \neq h(y)$
      $$
      \array{
      	h(x)=f(x) \in A'\\
      	h(y)=g(y) \in B'
      }
      $$
      Pero como sabiamos que $A'\cap B' = \empty$, entonces:
      $$
      h(x) \neq h(y)
      $$

    $\therefore h$ es inyectiva

  - $h$ es sobreyectiva:

    Sea $z \in A' \cup B'$

    - Caso 1) $z \in A'$
      $$
      h(a)=f(a)=z
      $$
      Por que $f$ es sobreyectiva

    - Caso 2) $z \in B'$
      $$
      /h(b)=g(b)=z
      $$
      Por que $g$ es sobreyectiva

  Como $h$ es inyectiva y sobreyectiva, entonces es biyectiva.
  $$
  \Rightarrow\#(A'\cup B') = \#(A\cup B)
  $$

#### Ejemplo

- Calcular $\chi_o + \chi_o$

  Sea $A=\{x\in \N/x \text{ es par}\} \sim \N$

  Sea $B=\{x \in \N/ x \text{ es impar}\} \sim \N$

  Notamos que $A \cap B = \empty$
  $$
  \chi_o + \chi_o = \#(A\cup B)= \#\N = \chi_o
  $$

### Producto

Sea $a=\#A, b=\#B$
$$
A \cdot B= \#(A \times B)
$$

#### Ejemplo

- Calcular $\chi_o \cdot \chi_o$

  Sea $A= \N, B = N$
  $$
  \chi_o \cdot \chi_o=\#(A\times B ) = \#(\N \times \N) = \chi_o
  $$

### Potencia

Sea $a=\#A, b=\#B$ conjuntos finitos
$$
a^b=\#\{f:B \rightarrow A/ \text{$f$ es funcion} \}
$$
Notación: $A^B=f:B \rightarrow A/ \text{$f$ es funcion}$

#### Ejemplo

- $\{0,1\}^\N$

  Sea $A = \N, B=\{0,1\}$
  $$
  B^A=\#\{f:A\rightarrow B/ \text{$f$ es funcion}\}=\#\{0,1\}^\N=2^{\chi_o}
  $$

## Teoremas

- $\#\rho(X)=2^{\#X}$

  - Demostración:

    Sea $f$:
    $$
    f:\rho(X) \rightarrow\{0,1\}^X
    $$
    defino $F$ tal que:
    $$
    F(A)=C_A
    $$
    Siendo $C_A$ la [ función caracteristica](#Función Caracteristica) de $A~(A\sub X)$.

    Veo que $F$ es inyectiva:
    $$
    F(A)=F(B) \Leftrightarrow C_A = C_B \Leftrightarrow\\
    t\in A \Leftrightarrow C_A(t)=1 \Leftrightarrow C_B(t)=1\Leftrightarrow t \in B \\
    \therefore A=B
    $$
    Veo que $F$ es sobreyectiva:

    Sea $g \in \{0,1\}^X$, quiero encontrar $C \sub X / F(C) = g$, es decir $C=\{t\in X/g(t)=1\}$

    Pido que $F(C) = C_C-X_C$

    Quiero ver que $X_C = g$
    $$
    t\in X \Rightarrow X_C(t)=1 \Leftrightarrow t\in C \Leftrightarrow g(t)=1\\
    
    \left.
    	\array{
    		X_C(t)=1 \Leftrightarrow g(t)=1 \\
    		X_C(T)\neq 0 \Leftrightarrow g(t) \neq 1
    	}
    \right\}
    
    g=X_C
$$
    Entonces $F$ es sobreyectiva.
    
Como $F$ es sobreyectiva e inyectiva, entonces es biyectiva, entonces:
    $$
    \#\rho(X)=2^{\#X}
    $$
    
- Corolario: $\chi_o < 2 ^{\chi_o}$
    $$
    \#\N < \# \rho(X)
    $$
  
- $2^{\chi_o} = C$

  Sea $T=\{0,1\}^\N=\{f:\N \rightarrow\{0,1\}/ \text{$f$ es funcion} \}$, $U=[0,1]$

  Defino $F$ tal que:
  $$
  F:T \rightarrow U/ F(f)=[0,f(0)f(1)f(2)\dots]_2
  $$
  Podemos ver que $F$ es sobreyectiva por que en base 2 se cumple que:
  $$
  F(\mu_0,\mu_1\mu_2\mu_3 \dots)=[0,\mu_0\mu_1\mu_2\mu_3\dots]_2 \rightarrow \sum_{n=1}^\infty \frac {\mu_n} {2^n}
  $$
  Pero tenemos problemas para ver la inyectividad por que no podemos encontrar una notación con escritura unica

  Propongo el conjunto $T_0$ tal que:
  $$
  T_0=\{f\in T/ \text{$f$ hace cola de ceros}\}\\
  (f(n)=0 ~~ \forall n)
  $$
  $\#T_0=\chi_o$ por que: 
  $$
  T_0= \bigcup_{k\in \N} T_{0k},
  
  \left.
  	\array{
  	T_{00}=\{f/f(n)=0\}\\
  	T_{01}=\left\{f \left/ \array{f(0)=1\\ f(n)=0} \right. \right\}\\
  	\vdots\\
  	T_{0k}=\left\{f \left/ \array{f(k-1)=1\\ f(n)=0} \right. \right\}\\
  	}
  \right.
  $$
  

  $T_0$ es finito $\Rightarrow$ $\# T_0=2^{k-1} \Rightarrow T_0$ es numerable por ser union de conjuntos numerables, entonces:
  $$
  \#T_0 \leq \chi_o
  $$
  Entonces observo que:
  $$
  \#(T-T_0)= \#T= 2^{\chi_o}
  $$
  Ahora puedo redefinir a $F$ como:
  $$
  F:T-T_0 \rightarrow (0,1] \sim[0,1]/ f(\mu_1\mu_2\mu_3\dots)=[0,\mu_1\mu_2\mu_3\dots]_2
  $$
  A partir de esta nueva función voy a ver si es biyectiva:

  - Veo que $F$ sea inyectiva:
    $$
    F(f)=F(g)\\
    [0,f(0)f(1)f(2)\dots]_2=[0,g(0)f(1)g(2)\dots]_2\\
    f(i)=g(i) ~~\forall i\\
    f = g
    $$

  - Veo que $F$ sea sobreyectiva:

    Sea $x \in (0,1]$ $x$ se puede escribir en base 2 sin colas de ceros:
    $$
    x=[0,x_0x_1x_2\dots]_2 ~~~x_i\in\{0,1\}\\
    \therefore F(x_0,x_1x_2\dots)= [x]_2
    $$

  Como $F$ es biyectiva, entonces:
  $$
  2^{\chi_o}=\#(T-T_0)=\#(0,1] = \#[0,1] = C
  $$
  





















# Anexo

## Función Caracteristica

$C_A$ es la función caracteristica de $A~(A\sub X )$  tal que:
$$
C_A :X \rightarrow \{0,1\}/ C_A(t)=
\left\{
	\array{
		1 & t \in A\\
		0 & t \notin A
	}
\right.
$$
