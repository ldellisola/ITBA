# Demostración

Sea $L$ un lenguaje de $1^{er}$ orden e $I_1,I_2$ interpretaciones isomorfas via $h$ ($I_1 \simeq_h H_2$). 

Sea $v$ una valuación sobre $I_1$, entonces:
$$
\overline{h_ov} = h_o\overline v
$$

#### Demo

La demostración se hace por inducción en el tamaño de los terminos $(tam(t))$, que son la cantidad de funciones que aparecen en $t$

Defino las valuaciones:
$$
v:VAR \rightarrow U_{1}\\
\overline v:TERM \rightarrow U_1
$$
Ademas, por dato se que:
$$
h:U_1 \rightarrow U_2
$$
Entonces, componiendo estas funciones obtengo:
$$
h_o\overline v:TERM \rightarrow U_2\\
h_ov :VAR \rightarrow U_2\\
\overline{h_ov}: TERM \rightarrow U_2
$$
Ahora vamos a hacer la inducción:

- **Caso Base**: $tam(t)=0$

  Entonces tenemos 2 casos:

  1. $t=x_i \in VAR$
     $$
     h_o\overline v(x_i) = h(\overline v(x_i))
     $$
     Y como  $\overline v|_{VAR}=v$
     $$
     h(\overline v(x_i))=h(v(x_i)) = h_ov(x_i)
     $$
     Y como $\overline {h_0v}|_{VAR}=h_ov$
     $$
     h_ov(x_i)=\overline {h_ov}(x_i)
     $$

  2. $t =c\in C$

     Utilizando la definición de isomorfismo:
     $$
     h_o\overline v(c)=h(\overline v(c)) = h(C_{I_1})=C_{I_2}=\overline{h_ov}(c)
     $$

- **Hipótesis Inductiva**:

  Sea $tam(t)\le n, t\in F$:
  $$
  h_o\overline v(t)=\overline{h_ov}(t)
  $$

- **Tesis Inductiva**:

  Sea $tam(t)=n+1, t\in F$:
  $$
  h_o\overline v(t)=\overline{h_ov}(t)
  $$

Como $t\in F/tam(t)=n+1$