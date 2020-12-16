# Tutorial 1

## Grammar design for a given language

- $L_{1-1} = \{a^i:i \ge 1\}$

  This language should only contain powers of $a$ and should not contain the empty string $\epsilon$
  $$
  G_{1-1}(T,N,P,S)\\
  T = \{a\}\\
  N = \{S\}\\
  P=\{S \rightarrow aS|a\}
  $$

- $L_{1-2} = \{ a^i : i \geq 0 \}$

  This language should only contain powers of $a$ 
  $$
  G_{1-2}(T,N,P,S)\\
  T = \{a\}\\
  N = \{S\}\\
  P=\{S \rightarrow aS|\epsilon\}
  $$

- $L_{1-3} = \{ w : w \in \{ a \}^*, |w| \% 2 = 0\}$

  This language should contains strings with only the symbol $a$ whose length is an even number
  $$
  G_{1-3}(T,N,P,S)\\
  T = \{a\}\\
  N = \{S\}\\
  P=\{S \rightarrow aaS|\epsilon\}
  $$

- $L_{1-4} = \{ w : w \in \{0, 1\}^*, (w)_2 \% 2 = 0\}$

  This language contains binary strings, where their decimal representation should be even
  $$
  G_{1-4}(T,N,P,S)\\
  T = \{1,0\}\\
  N = \{S\}\\
  P=\{S \rightarrow A0 , A \rightarrow A1|A0|\epsilon\}
  $$

- $L_{1-5} = \{ w : w \in \{0, 1\}^*, |w|_1 \% 2 = 0\}$

  ==????==

- $L_{1-6} = \{ a^i b^i : i \geq 1 \}$
  $$
  G_{1-6}(T,N,P,S)\\
  T = \{a,b\}\\
  N = \{S\}\\
  P=\{S \rightarrow aSb|\epsilon\}
  $$

- $L_{1-7} = \{ a^i b^j : i \geq j \geq 0 \}$
  $$
  G_{1-7}(T,N,P,S)\\
  T = \{a\}\\
  N = \{S\}\\
  P=\{S \rightarrow aSb|aS|\epsilon\}
  $$

- $L_{1-8} = \{ a^i b^j : j \geq i \geq 0 \}$

  It's very similar to $L_{1-7}$

- $L_{1-9} = \{ a^i b^j : i \neq j\}$

  We can think of this language as the union of the following languages:
  $$
  L_a = \{a^ib^j:i\gt j\} \\
  L_b = \{a^ib^j:i\lt j\}
  $$
  And the following grammars generate those languages:
  $$
  G(L_a) = G_a(T,N,P,S)\\
  T = \{a,b\}\\
  N = \{S\}\\
  P=\{S \rightarrow aS|a|aSb\} \\
  G(L_b) = G_b(T,N,P,S)\\
  T = \{a,b\}\\
  N = \{S\}\\
  P=\{S \rightarrow Sb|b|aSb\}
  $$

- $L_{1-10} = \{ a^i b^j c^k d^l : i + j = k + l \}$

  ==???????==

- $L_{1-11} = \{ a^i b^j : j = i \% 3\}$
  $$
  G_{1-11}(T,N,P,A)\\
  T = \{a,b\}\\
  N = \{S,A\}\\
  P=\{S \rightarrow \epsilon|aaaS, A \rightarrow Sab|Saabb|S\}
  $$

- $L_{1-12} = \{ a^i b^j : i = j \% 3\}$

  It's very similar to $L_{1-11}$

- $L_{1-13} = \{ a^i b^j c^k d^l: i \geq k \geq 0, j, l \geq 0 \}$

  ==????????==

- $L_{1-14} = \{ w : w = abab \}$

  This language only has the string $abab$
  $$
  G_{1-14}(T,N,P,A)\\
  T = \{a,b\}\\
  N = \{S\}\\
  P=\{S \rightarrow abab\}
  $$

- $L_{1-15} = \{ w : w \in \{ a, b \}^*, abab \in \texttt{prefix}(w) \}$

  All strings in the language must have the prefix $abab$
  $$
  G_{1-15}(T,N,P,S)\\
  T = \{a,b\}\\
  N = \{S,A\}\\
  P=\{S \rightarrow ababA, A \rightarrow \epsilon|aA|bA\}
  $$

- $L_{1-16} = \{ w : w \in \{ a, b \}^*, abab \in \texttt{suffix}(w) \}$

  It's very similar to $L_{1-15}$

- $L_{1-17} = \{ w : w \in \{ a, b \}^*, abab \in \texttt{factor}(w) \}$

  ==??==

  All strings should be a power of $abab$
  $$
  G_{1-17}(T,N,P,S)\\
  T = \{a,b\}\\
  N = \{S\}\\
  P=\{S \rightarrow ababS|\epsilon\}
  $$

- $L_{1-18} = \{ w : w \in \{ a, b \}^*, abab \in \texttt{subsequence}(w) \}$
  $$
  G_{1-18}(T,N,P,S)\\
  T = \{a,b\}\\
  N = \{S,A,B\}\\
  P=\{S \rightarrow AababB, A \rightarrow \epsilon | Aa |Ab, B \rightarrow \epsilon | aB | bB\}
  $$

- $L_{1-19} = \{ w : w \in \{ a, b \}^*, |w|_{ab} = |w|_{ba} \}$

  ==?????==

- $L_{1-20} = \{ w : w \in \{ a, b \}^*, w[0] = w[|w|-1]\}$

  All strings must end with the same letter they started
  $$
  G_{1-20}(T,N,P,S)\\
  T = \{a,b\}\\
  N = \{S,A\}\\
  P=\{S \rightarrow aSa|bSb, A \rightarrow aA|bA|\epsilon\}
  $$
  