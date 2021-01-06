# Algebra de Cardinales

## Operaciones

### Suma

Sea $a=\#A, b=\#B, k=\#K, A \cap B= \emptyset$
$$
a+b = \#(A\cup B)
$$

 [Demostración](Demostraciones\02 - Algebra de Cardinales\Definicion- 01.html) 

#### Ejemplo

- Calcular $\chi_o + \chi_o$

  Sea $A=\{x\in \mathbb{N}/x \text{ es par}\} \sim \mathbb{N}$

  Sea $B=\{x \in \mathbb{N}/ x \text{ es impar}\} \sim \mathbb{N}$

  Notamos que $A \cap B = \emptyset$
  $$
  \chi_o + \chi_o = \#(A\cup B)= \#\mathbb{N} = \chi_o
  $$

### Producto

Sea $a=\#A, b=\#B$
$$
A \cdot B= \#(A \times B)
$$

#### Ejemplo

- Calcular $\chi_o \cdot \chi_o$

  Sea $A= \mathbb{N}, B = N$
  $$
  \chi_o \cdot \chi_o=\#(A\times B ) = \#(\mathbb{N} \times \mathbb{N}) = \chi_o
  $$

### Potencia

Sea $a=\#A, b=\#B$ conjuntos finitos
$$
a^b=\#\{f:B \rightarrow A/ \text{$f$ es funcion} \}
$$
Notación: $A^B=f:B \rightarrow A/ \text{$f$es funcion}$

#### Ejemplo

- $\{0,1\}^\mathbb{N}$

  Sea $A = \mathbb{N}, B=\{0,1\}$
  $$
  B^A=\#\{f:A\rightarrow B/ \text{$f$ es funcion}\}=\#\{0,1\}^\mathbb{N}=2^{\chi_o}
  $$

## Teoremas

- $\#\rho(X)=2^{\#X}$

   [Demostración](Demostraciones\02 - Algebra de Cardinales\Teorema - 01.html) 

- Corolario: $\chi_o < 2 ^{\chi_o}$
    $$
    \#\mathbb{N} < \# \rho(X)
    $$
  
- $2^{\chi_o} = C$

  [Demostración](Demostraciones\02 - Algebra de Cardinales\Teorema - 02.html) 




# Anexo

## Función Característica

$C_A$ es la función caracteristica de $A~(A\subset X )$  tal que:
$$
C_A :X \rightarrow \{0,1\}/ C_A(t)=
\left\{
	\array{
		1 & t \in A\\
		0 & t \notin A
	}
\right.
$$
