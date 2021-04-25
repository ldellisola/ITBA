# Proofs

## 2.D

>  Find the second largest number in an array of integers

$$
\text{Input: arr} \subseteq \Z \\
\text{Output: } t \in \text{arr} / t \text{ is the second largest number}
$$

$$
t \in \text{arr} \text{ such that } 
\exists x \in \text{arr}.
	\forall y \in \text{arr}.[x \ge y] 
	\land 
	\forall z \in \text{arr}\setminus\{x\}.[t \ge z ]
$$

First I select with x the largest number in the set:
$$
\forall y \in \text{arr}.[x \ge y] 
$$
And then I take out the largest element from the set and I choose the largest element in this new set, which would be the second largest element from the original set:
$$
\forall z \in \text{arr}\setminus\{x\}.[t \ge z ]
$$

## 3

### E

> Prove the following formula:
> $$
> q \implies [(p\land q) \lor (\neg p \land q)]
> $$


$$
\array{
\text{My assumptions: } && \\
&&q\\&&\neg(p \land q)

\\\\
\text{To prove: }&& (\neg p \land q)
}
$$
To prove this I have to prove each part independently. I will begin with $\neg p$:
$$
\array{
\text{My assumptions: } && \\
&&q\\&&\neg(p \land q) \\ &&p \\ &&(p\land q)

\\\\
\text{To prove: }&& \neg p
}
$$
We can see that I have arrived to a contradiction, because my assumptions include a formula and its negation:
$$
\array{(p\land q) & \neg(p\land q)}
$$
So the formula $\neg p$ is true.

Now we will prove $q$:
$$
\array{
\text{My assumptions: } && \\
&&q\\&&\neg(p \land q)

\\\\
\text{To prove: }&& q
}
$$
In this case we can see that $q$ was already part of our assumptions.

With both sections proven, we have proven that the formula holds.

### F

> Prove the following formula:
> $$
> \neg (p \land q) \implies (\neg p \lor \neg q)
> $$

$$
\array{
\text{My assumptions: } && \\
&& \neg( p \land q) \\ && \neg \neg p \equiv p \\ && q \\ && (p \land q)

\\\\
\text{To prove: }&& \neg q
}
$$

To prove this formula we have to arrive at a contradiction, so we assume $q$ as well and we reach to a contradiction because:
$$
\array{\neg (p \land q)&(p \land q)}
$$

 ### H

> Prove the following formula:
> $$
> (p \land q) \implies \neg (\neg p \lor \neg q)
> $$

$$
\array{
\text{My assumptions: } && \\
&& ( p \land q) \\ &&  p \\ && q \\ && (\neg p \lor \neg q)

\\\\
\text{To prove: }&& \neg (\neg p \lor \neg q)
}
$$

Here we also need to reach a contradiction, but instead we have to try two different cases:

In the first case, we are assuming $\neg p$:
$$
\array{
\text{My assumptions: } && \\
&& ( p \land q) \\ &&  p \\ && q \\ && (\neg p \lor \neg q) \\ && \neg p

\\\\
\text{To prove: }&& \neg (\neg p \lor \neg q)
}
$$
And we see we reach a contradiction, because between our assumptions we have:
$$
\array{ \neg p &p}
$$
For our second case we will assume $\neg q$:
$$
\array{
\text{My assumptions: } && \\
&& ( p \land q) \\ &&  p \\ && q \\ && (\neg p \lor \neg q) \\ && \neg q

\\\\
\text{To prove: }&& \neg (\neg p \lor \neg q)
}
$$
And we see we reach a contradiction, because between our assumptions we have:
$$
\array{ \neg q &q}
$$
Having reached a contradiction in both cases, we can say that we have successfully proven the original formula.