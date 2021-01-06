# Demostración

Sea $A$ un alfabeto, $E,F,G,H \in A^*$, sean $EF = GH$ y $long(E) = long(G)$, entonces:
$$ {sds}
E=G \land F=H
$$

#### Demo

Sea $EF=GH$ y $long(E)=long(G)$

Entonces:
$$
long(E)\ge long(G)
$$
por la propiedad anterior, $\exists H'\in A^*/E=GH'$, entonces:
$$
long(E)=long(G)+long(H’)
$$
Como $long(E)=long(G)$:
$$
long(H')=0 \Rightarrow H'=\lambda
$$
$\therefore E=G \land \text{ como } EF=GH \Rightarrow F=H$

