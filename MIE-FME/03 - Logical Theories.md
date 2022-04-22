# Logical Theories

## Pairs

Pairs are data types that contains 2 elements. The type is represented as $\mathcal P$ and if the elements are of type $\mathcal T$ we can write it as $\mathcal {P[T]}$. Pairs have the following function symbols:
$$
\text{pair:}\mathcal T \times \mathcal T \rarr \mathcal{P[T]}\\
\text{fst}:\mathcal{P[T] \rarr T}\\
\text{snd}:\mathcal {P[T]\rarr T}
$$
This functions are used to create a pair, and then to obtain the first or second element of it. We also have a set of axioms:
$$
\forall x,y. \text{fst}(\text{pair}(x,y)) = x\\
\forall x,y. \text{snd}(\text{pair}(x,y)) = y\\
\forall p . \text{pair}(\text{fst}(p),\text{snd}(p)) = p
$$

## Lists

Lists with elements of type $\mathcal T$ have type $\mathcal {L[T]}$. 

It contains the following function symbols:
$$
\text{const}:\mathcal{T \times L[T] \rarr L[T]} \\
\text{first}:\mathcal{L[T]\rarr T}\\
\text{rest}: \mathcal{L[T]\rarr L[T]}\\
\text{empty}: \mathcal{\rarr L[T]}
$$

A list can be represented in two different ways:
$$
<x_1,x_2,\dots,x_n> \equiv \text{cons}(x_1,\text{cons}(x_2,\text{cons}(\dots,\text{cons}(x_n,\text{empty}()))))
$$
Axioms:
$$
\forall l,x. \text{ first}(\text{cons}(x,l)) = x\\
\forall l,x. \text{ rest}(\text{cons}(x,l)) = l\\
\forall l, \neg [l = \text{empty}()] \implies \text{cons}(\text{first}(l),\text{rest}(l)) = l\\
\forall l,x. \neg [\text{cons}(x,l) = \text{empty}()]\\
\forall l_1,l_2. [l_1 = l_2] \implies [l_1 = \text{empty}() \iff l_2 = \text{empty}()]
$$

## Natural Numbers

Type: $\mathcal N$.

Function symbols:

- $0:\rarr \mathcal N$
- $1:\rarr \mathcal N$
- $+: \mathcal {N \times N \rarr N}$
- $\cdot: \mathcal {N \times N \rarr N}$

For the axioms, we are using Peano Arithmetic:

- $\forall x. \neg[x+1 = 0]$
- $\forall x,y.~~ x + 1= y+1 \implies x = y$
- $\forall x.~~x+0 = x$
- $\forall x,y.~~ x + (y + 1) = (x+y)+1$
- $\forall x.~~ x \cdot0=0$
- $\forall x,y.~~x\cdot(y+1) = x \cdot y + x$



## Arrays

Its type is defined as $\mathcal A[T]$.

Function symbols:

- $\cdot[\cdot]: \mathcal{A[T]\times N \rarr T}$
- $\text{write}: \mathcal{A[T]\times N \times T \rarr A[T]}$

Axioms:

- $\forall a,v,i,j.~~ i = j \implies \text{write}(a,i,v)[j] = v$
- $\forall a,v,i,j.~\neg[i=j] \implies \text{write}(a,i,v)[j]=a[j]$
- $\forall a,b.~[\forall i.~~a[i] = b[i]] \iff a = b$

