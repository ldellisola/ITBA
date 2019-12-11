# Demostración

$$
\text{$P^k,Q^k$ son computables $\Rightarrow \neg P^k$ y $P^k \land Q^k$ son computables}
$$

#### Demo

Como $P^k, Q^k$ son RP, entonces $C_P,C_Q:\N\rightarrow\{0,1\}$ son RP

Defino $C_{\neg P}$ tal que:
$$
C_{\neg P}: \N^k\rightarrow\N/C_{\neg P} = \alpha_oC_P
$$
Entonces $C_{\neg P}$ es computable por ser composición de computables

Defino $C_{P\cap Q}$:
$$
C_{P\cap Q}:\N^k \rightarrow \{0,1\}/C_{P\cap Q}=PROD_o(C_P \times C_Q)
$$
Entonces $C_{P\cap Q}$ es computable por ser composición de computables