# Equivalencia entre Autómatas Finitos

## AFD $\rarr$ AFND

Sea un AFD:
$$
M = <K,\Sigma,\delta,q_0,F>
$$
Existe un AFND $M'/L(M) = L(M'):$
$$
M'=<K,\Sigma,\delta',q_0,F>
$$
Con:
$$
\delta': K \times \Sigma \rarr P(K)/ \delta'(q,a) = \{\delta(q,a)\}
$$

## AFD $\rarr \text{AFND}-\lambda$

Sea un AFND:
$$
M = <K,\Sigma,\delta,q_0,F>
$$
Existe un $\text{AFND-$\lambda$ } M'/L(M) = L(M'):$
$$
M'=<K,\Sigma,\delta',q_0,F>
$$
Con:
$$
\delta': K \times \Sigma \cup \{\lambda\} \rarr P(K)/ \delta'(q,a) = \delta(q,a) \land \delta'(q,\lambda) = \{q\}
$$

## $\text{AFND}-\lambda \rarr$ AFD

Sea $M$ un $\text{AFND-}\lambda,$ con $K$ conjunto de estados y $q \in K,$ se define a la clausura $\lambda$ como:
$$
\array{
\text{clausura-}\lambda:L \rarr P(K)/ \\
\text{clausura-}\lambda(q) = \{q' \in K / (q,\lambda) \vdash^* (q',\lambda)\}
}
$$
 Es decir, la clausura de un estado es el conjunto de todos los estados a los cuales puedo llegar con una transición $\lambda.$

Con el siguiente algoritmo, podemos construir la $\text{clausura-}\lambda$ de un conjunto de estados $Q:$

```pseudocode
// Clausura-lambda
Q = {}; // Set de para obtener la clausura
V = {}; // Set de elementos a explorar
T = {}; // Set de elementos marcados

V = Q;

while not empty(V):
	i = pop(V);
	T += i;
	for q in transition(i,empty):
		if q not in V:
			V += q
    end
	end
end

return T;
```

Podemos hacer un calculo similar para ver como pasar de un conjunto de estados a otro, mediante un caracter:

```pseudocode
// Mover
Q = {}; // Set de para obtener la clausura
V = {}; // Set de elementos a explorar
T = {}; // Set de elementos marcados
a;			// Simbolo de la transicion


V = Q;

while not empty(V):
	i = pop(V);
	T += i;
	for q in transition(i,a):
		if q not in V:
			V += q
    end
	end
end

return T;
```

> Dado un autómata $\text{AFND-}\lambda$:
> $$
> M = <K,\Sigma,\delta,q_0,F>
> $$
> Existe un autómata AFD:
> $$
> M' = <K',\Sigma,\delta',q_0,F'>
> $$
> Con:
> $$
> \delta':K'\times \Sigma \rarr K'/ \delta'(Q,a) =\{p/(q,a) \vdash^*(p,\lambda),q\in Q\}
> $$

[Demo](#Teorema)

Para poder crear a este nuevo autómata, tenemos que utilizar al siguiente algoritmo:

```pseudocode
Q0 = clausura-lambda({q0});
Kp = {Q0};
while not empty(unmarked(Kp)):
	T = unmarked(Kp).First();
	mark(T);
	foreach sym in Symbols:
		U = Mover(T,a);
		if U not in Kp:
			Kp += U;
		deltap[T,a] = U;
	end
end
Fp = [x for x in Kp if x.Any(t=> t in F)]
return <Kp,Symbols,deltap,q0,Fp>
```

> **Lema 1:**
>
> Sean $M,M'$ los $\text{AFND-}\lambda$ y AFD presentados en el teorema:
> $$
> (q_0,\alpha) \vdash^*(r,\lambda) \implies \exists Q \in K'/r\in Q \land (Q_0,\alpha) \vdash^*(Q,\lambda)
> $$

[Demo](#Lema 1)

> **Lema 2**:
>
> Sean $M,M'$ los $\text{AFND-}\lambda$ y AFD presentados en el teorema:
> $$
> (Q_0,\alpha) \vdash^* (Q,\lambda)\implies \forall q \in Q/(q_0,\alpha) \vdash^*(q,\lambda)
> $$

[Demo](#Lema 2)

## Demo

### Lema 1

Por Inducción en la longitud de $\alpha:$

- **Caso Base**: $\alpha = \lambda$
  $$
  \array{
  (q_0,\alpha)& \vdash^*& (q_0,\lambda)\\
  & \vdash^*& (r,\lambda)\\
  } 
  \implies r \in \text{clausura-}\lambda(q_0)
  \implies r \in Q_0
  $$
  Ademas sucede que:
  $$
  (Q_0,\lambda) \vdash^*(Q_0,\lambda)
  $$

- **Paso Inductivo**:

  Reescribo $\alpha = \alpha'\cdot a.$

  En el $\text{AFND-}\lambda$ sucede que:
  $$
  (q_0,\alpha'\cdot a) \vdash^*(q',a) \vdash^*(r,\lambda)
  $$
  Por hipótesis inductiva, esto implica que:
  $$
  (Q_0,\alpha') \vdash^* (Q',\lambda) \land q'\in Q' \in K'
  $$
  Entonces, podemos reescribirlo como:
  $$
  (Q_0,\alpha'\cdot a) \vdash^*(Q',a) \vdash^*(Q,\lambda) \land r \in Q
  $$

### Lema 2

==falta==

### Teorema

Para demostrar que ambos autómatas general al mismo lenguaje, tenemos que ver dos cosas:

- $L(M) \subseteq L(M')$
- $L(M') \subseteq L(M)$

Para probar la primera parte, tenemos que verificar que se cumpla lo siguiente:
$$
\alpha \in L(M) \implies (q_0,\alpha) \vdash^* (q_f,\lambda), q_f \in F 
$$
Por el lema 1, podemos decir