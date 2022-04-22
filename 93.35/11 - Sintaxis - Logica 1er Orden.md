# Sintaxis

## Definiciones

- **Alfabeto**: Un alfabeto es el conjunto de simbolos que se pueden utilizar en las formulas y terminos. Se lo define de la siguente manera:
  $$
  A=Var \cup \{(,)\} \cup C \cup \scr{P} \cup \scr{F} \cup \scr{C}
  $$
  Donde:

  - $Var$ son las variables y estan definidas de la siguente forma: $x_i,y_i,z_i~~i\in \N$.

  - $\{(,)\}$ ==PREGUNTAR==

  - $C$ son los conectivos, que son los mismos de la logica proposicional pero se le agrega el cuantificador universal y el cuantificador existencial:
    $$
    C=\{\land,\lor,\rightarrow,\lnot,\forall,\exist\}
    $$

  - $\scr P$ son los simbolos del predicado, y siempre debe existir por lo menos uno para que se pueda considerar al conjunto de simbolos un alfabeto. Estos siguen la siguiente notacion: 
    $$
    P_i^k,Q_i^k,R_i^k
    $$
    Siendo $k$ la ariedad del predicado, es decir, la cantidad de elementos que toman.

  - $\scr F$ son los simbolos de funciones. No es necesario tener funciones dentro de un alfabeto y se las nota de la siguente forma:
    $$
    f_i^k,g_i^k,h_i^k
    $$
    Donde $k$ es la ariedad de la función.

  - $\scr C$ son las constantes del alfabeto. Estas tienen la siguente notacion:
    $$
    c_i,d_i
    $$
  
- **Término**: Sea $TERM$ el conjunto de los terminos, un termino es un expresion que sigue las siguentes reglas:

  1. $Var \in TERM$
  2. $\scr{C}~ \in \text{TERM}$ 
  3. $f^k \in \scr{F}$  $~~, t_1,\dots,t_k \in TERM \Rightarrow f^k(t_1,\dots,t_k) \in TERM$
  4. Cualquier expresion de $A^*$ que se obtenga aplicando finitas veces $1, 2$ o $ 3$ es un termino.  

  Se llama **Término cerrado** a un termino que no tiene variables.

- **Formula**: Sea $FORM=F$ el conjunto de formulas, una formula es una expresion que sigue las siguentes reglas:

  1. $P^k \in \scr{P}, t_1,\dots,t_k \in$ $~TERM \Rightarrow P^k(t_1,\dots,t_k) \in F$
  2. $\alpha \in F \Rightarrow \lnot \alpha \in F$
  3. $\alpha,\beta \in F \Rightarrow (\alpha\lor \beta), (\alpha \land\beta), (\alpha \rightarrow \beta) \in F$ 
  4. $x_i \in Var, \alpha \in F \Rightarrow \forall~x_i~~\alpha \in F$
  5. $x_i \in Var, \alpha \in F \Rightarrow \exist~x_i~~\alpha \in F$
  6. Cualquier expresion de $A^*$ que se obtenga aplicando $1,2,3,4$ o $5$ finitas veces es una formula.

- **Lenguaje**: Un lenguaje de primer orden se define en base a un alfabeto, eligiendo al conjunto de predicados ($\scr P$), al conjunto de constantes ($\scr C$) y al conjunto de funciones ($\scr F$).

- **Aparicion Ligada y Libre** : Decimos que $x$ es una aparición <u>ligada</u> si es alcanzada por un cuantificador universal ($\forall x$) o por un cuantificador existencial ($\exist x$). De no serlo decimos que es una aparicion <u>libre</u>.

- **Variable Libre**: Decimos que una variable es libre si todas sus apariciones son libres.

- **Variable Ligada**: Decimos que una variable es ligada si todas sus apariciones son ligadas.

- **Enunciado**: Una formula es un enunciado si todas sus variables son ligadas.















