# Demostración

$$
\text{$P^k,Q^k$ son RP $\Rightarrow \neg P^k$ y $P^k \land Q^k$ son RP}
$$



#### Demo

Como $P^k, Q^k$ son RP, entonces $C_P,C_Q:\N\rightarrow\{0,1\}$ son RP

Defino $C_{\neg P}$ tal que:
$$
C_{\neg P}:\N^k\rightarrow \{0,1\}/C_{\neg P}(x_1,\dots,x_k)= 1 \dot - C_P(x_1,\dots,x_k)\\
C_{\neg P}=\dot -_o({h_1}_o\pi_1 \times C_P)
$$
Como podemos ver, $C_{\neg P}$ es una composicion de funciones RP:
$$
h_1:\N\rightarrow\N/h_1(x)=1\\
\dot-:\N^2\rightarrow\N/x\dot-y=
\left\{
	\array{
		x-y		&&	x\ge y\\
		0		&&	else
	}
\right.\\
\pi_1:\N\rightarrow\N/\pi(x)=1\\
C_p:\N^k\rightarrow\N
$$
Entonces $C_{\neg P}$ es RP

Defino $C_{p_k \cap q_k}$:
$$
C_{p_k \cap q_k}:\N^k\rightarrow\{0,1\}/ C_{p_k \cap q_k}(\vec x)=
\left\{
	\array{
		1 && \text{si }\vec x \in  p_k \cap q_k\\
		0 && \text{sino}
	}
\right.
$$
Como:
$$
C_{p^k \cap q^k} = PROD_o(C_{p^k} \times C_{q^k})
$$
Entonces $C_{p^k \cap q^k}$ es RP por composición de RP.

 

