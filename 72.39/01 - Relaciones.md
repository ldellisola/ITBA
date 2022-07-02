# Relaciones

Dado dos conjuntos $A$ y $B$ se define a una **relación** como el conjunto de pares ordenados $(a,b)/ a\in A,b\in B$. La notación utilizada es:
$$
\array{
aRb \\
R:A\rarr B
}
$$
Toda relación $R:A\rarr B$ esta incluida en el producto cartesiano de $A\times B$ :
$$
R:A\rarr B \implies R \subseteq A \times B
$$

## Propiedades

Las relaciones tienen las siguientes propiedades:

- **Reflexividad**: Sea $R$ una relación en $A$ :
  $$
  R \text{ es reflexiva } \iff \forall a \in A: aRa
  $$

- **Simetria**: Sea $R$ una relación en $A$ :
  $$
  R \text{ es simetrica } \iff \forall a,b \in A: aRb \implies bRa
  $$

- **Transitividad**: Sea $R$ una relación en $A$ :
  $$
  R \text{ es transitiva } \iff \forall a,b,c \in A: aRb \land bRc \implies aRc
  $$

## Tipos de Relaciones

Existen distintos tipos de relaciones:

- **Relación de Equivalencia**: Es una relación que cumple con las tres propiedades vistas. Es decir, es transitiva, simétrica y reflexiva. La característica principal es que inducen clases de equivalencias (dividen al conjunto en grupos).

- **Relación de Composición**: Sean $A,B,C$ conjuntos y $R,G$ relaciones tal que :
  $$
  \array{R:A\rarr B & G:B\rarr C}
  $$
  Se define a la relación de composición $RoG$ como:
  $$
  \{ (a,c), a\in A, c\in C/\exists b \in B \land aRb \land bGc \}
  $$

- **Relación de Identidad**: Sea $R$ una relación sobre $A,$ esta es de identidad si se cumple:
  $$
  \forall a,b \in A: a \text{ id}_A b \implies a = b
  $$

- **Relación de Potencia**: Sea $R$ una relación sobre $A,$ se cumple que:
  $$
  R^n \left\{ 
  \array{
  \text{id}_A & n=0\\
  RoR^{n-1} &n\gt 0 
  }
  
  \right.
  $$

## Clausuras

Sea $R$ definida sobre $A,$ una **clausura transitiva** esta definida por:
$$
R^+ = \bigcup_{i\in \N, i\ge 1} R^i = \bigcup_{i=1}^{\infty} R^i
$$
Sea $R$ definida sobre $A,$ una **clausura transitiva reflexiva** esta definida por:
$$
R^* = R^+ \cup \text{id} =\bigcup_{i=0}^{\infty} R^i
$$

### Algoritmo de Warshall

Sea $R$ una relación sobre $A,$ $T$ la matriz de la relación y $n$ el cardinal de $A,$ la clausura de la matriz estara dada por:

```pseudocode
for k:1..n
	for i:1..n
		for j:1..n
			T[i,j] = T[i,j] || (T[i,k] && T[k,j])
		end
	end
end
```