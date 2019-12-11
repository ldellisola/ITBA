# Isomorfismo

## Definiciones

- **Isomorfismo**: Sea $L$ un lenguaje de $1^{er}$ orden y sea $I_1,I_2$ interpretaciones de $L$ con universos $U_1,U_2$. Sea una función $f:U_1\rightarrow U_2$ se dice que es $I_1$ es isomorfo a $I_2$ si:

  1. $f$ es biyectiva.
  2. Si $c \in \scr C$, y $c_1,c_2$ son sus interpretaciones $\Rightarrow f(c_1)=c_2$
  3. Si $g^k \in \scr F\Rightarrow$ $f(g_I^k(t_1,\dots,t_k)) = g_I^k(f(t_1),\dots,f(t_k))$  $t_i \in U_1$
  4. Si $P^k \in \scr P \Rightarrow$ $(t_1,\dots,t_k) \in P^k_{I_1} \Leftrightarrow (f(t_1),\dots,f(t_k)) \in P^k_{I_2}$  $t_i \in U_1$

  En caso de ser isomorfos, se lo nota como $I_1\simeq I_2$

## Lemas

- Sea $L$ un lenguaje de $1^{er}$ orden e $I_1,I_2$ interpretaciones isomorfas via $h$ ($I_1 \simeq_h H_2$). 

  Sea $v$ una valuación sobre $I_1$, entonces:
  $$
  \overline{h_ov} = h_o\overline v
  $$
   [Demostración](Demostraciones\13 - Isomorfismo\Lema - 01.html) 

## Teoremas

- Sea $L$ un lenguaje de $1^{er}$ orden, $I_1 \simeq_h I_2, v:Var \rightarrow U_I$ y $\alpha \in F$:
  $$
  I_1 \models\alpha[v] \Leftrightarrow I_2 \models \alpha [h_ov]
  $$
  [Demostración](Demostraciones\13 - Isomorfismo\Teorema - 01.html) 

  - **Corolario 1:**

    Sea $L$ un lenguaje de $1^{er}$ orden, $I_1 \simeq_h I_2$ y $\alpha $ un enunciado:
    $$
    \alpha \text{ es valido en }I_1 \Leftrightarrow \alpha \text{ es valido en } I_2
    $$
    [Demostración](Demostraciones\13 - Isomorfismo\Corolario - 01.html) 

  - **Corolario 2**:

    Sea $L$ un lenguaje de $1^{er}$ orden e $I$ una interpretación:
    $$
    \text{Si }\exist h/ h:U_I\rightarrow U_I \text{ es un isomorfismo y } a \in U_I \text{ es distinguible}\\
    \Rightarrow h(a)=a
    $$
    [Demostración](Demostraciones\13 - Isomorfismo\Corolario - 02.html) 

  - **Corolario 3**:

    Sea $L$ un lenguaje de $1^{er}$ orden e $I$ una interpretación:
    $$
    \text{Si }\exist h/ h:U_I\rightarrow U_I \text{ es un isomorfismo y } A\subseteq U_I/ \text{ $A$ es expresable}
    \\
    \Rightarrow h(a) \in A~~~\forall a\in A
    $$
    [Demostración](Demostraciones\13 - Isomorfismo\Corolario - 03.html) 

  - **Corolario 4**:

    Sea $L$ un lenguaje de $1^{er}$ orden e $I_1 \simeq_h I_2$:
    $$
    a\in U_I \text{ es distinguible en }I_1 \Leftrightarrow h(a) \in U_2 \text{ es distinguible en }I_2
    $$
    
    [Demostración](Demostraciones\13 - Isomorfismo\Corolario - 04.html)