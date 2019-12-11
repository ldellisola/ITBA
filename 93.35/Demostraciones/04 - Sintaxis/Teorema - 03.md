# Demostración

Sea $\alpha \in F/$ tiene un conectivo binario, llamo $E$ a la expresion a la izquierda del conectivo:
$$
P(E)>0
$$

#### Demo

==LA INDUCCION TIENE QUE SER EN LA COMPLEJIDAD Y HAY QUE HACER EL CASO $\neg B$==

Voy a hacer <u>induccion en $cb(\alpha)$</u>

- **Caso Base:** $cb(\alpha) =0$

  Este caso no cumple con el antecedente, por lo que es valida

- **Hipotesis Inductiva**: $cb(\alpha)\le n$

  Sea $\alpha \in F/$ tiene un conectivo binario, llamo $E$ a la expresion a la izquierda del conectivo:
  $$
  P(E)>0
  $$

- **Tesis Inductiva**: $cb(\alpha) = n+1$

  Sea $\alpha \in F/$ tiene un conectivo binario, llamo $E$ a la expresion a la izquierda del conectivo:
  $$
  P(E)>0
  $$

Como $cb(\alpha) = n+1$, entonces $\alpha = (\beta_1 * \beta_2)$  $\beta_1,\beta_2 \in F, *\in \{\land,\lor,\rightarrow\} $
$$
cb(\alpha) = n+1 = cb(\beta_1) + 1 + cb(\beta_2)
$$
Entonces, podemos ver que: 
$$
cb(\beta_1) \le n\\
cb(\beta_2) \le n
$$
Asi que puedo usar **hipotesis inductiva**.

Entonces tengo 3 casos:

1. El conectivo binario se encuentra en $\beta_1$:

   Llamo $E'$ a la expresion en $B_1$ que se encuentra a la izquirda del conectivo binario, entonces obtengo que:
   $$
   E = (E'
   $$
   Asi que al calcular el peso de $E$:
   $$
   P(E)=1 + P(E') >0
   $$

2. El conectivo binario se encuentra en $\beta_2$:

   Llamo $E'$ a la expresion en $B_2$ que se encuentra a la izquierda del conectivo binario, entonces obtengo que:
   $$
   E = (\beta_1*E'
   $$
   Asi que al calcular el peso de $E$:
   $$
   P(E)= 1 + 0 + 0 + P(E') > 0
   $$

3. El conectivo binario se encuentra en el medio de  $\alpha$:

   Obtengo:
   $$
   E= (\beta_1
   $$
   Asi que al calcular el peso de $E$:
   $$
   P(E)=1 + 0 > 0
   $$
   