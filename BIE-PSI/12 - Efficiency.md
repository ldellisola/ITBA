# Efficiency

The efficiency of a communication protocol is defined either by the number of useful bits we sent in a given interval compared to the number we could send in the interval, or  using the time we spent sending useful data compared to the total length of time. We denote efficiency with the letter $\eta$ and in errorless channels we use $\eta_0$.

## Parameters

- $C$: Channel Capacity (bits/s)
- $l_m$: Length of the message (bits)
- $l_a$: Length of the acknowledgment (bits)
- $T_d$: Channel Delay Time (s)
- $T_o$: Length of Timeout (s)
- $p$: Bit Error Probability ($0 \le p \le 1$)
- $P_p$: Probability of Packet Error ($0 \le P_p \le 1$)

## Stop and Wait

In an **errorless channel**:
$$
\eta = \frac {\text{useful}}{\text{useful} + \text{unuseful}}
$$
<img src="Resources/12 - Efficiency/image-20210527140721079.png" alt="image-20210527140721079" style="zoom:33%;" />

We can think of **useful** time as the time it takes to send a certain amount of data:
$$
\text{useful time} = \frac {l_m} C
$$
For **unuseful** time, we have to take into consideration the time needed to send the acknowledge as well as the channel delay:
$$
\text{unuseful time} = \frac{l_m}{C} +\frac{l_a}{C} + 2 \times T_d
$$

$$
\eta_0 = \frac{l_m}{l_m + l_a + 2 \times T_d} = \frac{1500 \times8 }{1500\times8 + 50\times 8 + \frac{ 2\times 5\times 10^7}{10^3}}= 0.1067
$$




Another way to look at this is by total time. We can say that $T$ is the total time we are sending data (useful and non-useful) and here the efficiency can be measured by the time sending useful data divided by $T$:
$$
\eta_0 = \frac{l_m}{C\times T}
$$
In a **channel with errors**, the same logic applies but now we need to take into account the possibility that $n$ transfers are not successful.

<img src="Resources/12 - Efficiency/image-20210527142951139.png" alt="image-20210527142951139" style="zoom:33%;" />

Now the non-useful data changes, and each transfer will take the given time plus the probability of timeout. In the end the formula would look like this:
$$
\eta = \frac{l_m}{(l_m + l_a + 2\times T_d\times C) + (l_m + T_o \times C) \times \frac{P_p}{1-P_p}} \\
\eta =\frac{1500\times 8}{(1500\times 8+ 50 \times 8 + 2 \times 5\times 10^{-3} \times 10^7) + (1500 \times 8 + 15 \times 10^{-3}\times 10^7)}\\
\eta = 1.037
$$


## Sliding Window

In errorless case, this calculation is much simpler. The idea here is that the server sender will send a window if a given size and the receiver will confirm the first package. If the window is big enough, the client and the receiver can avoid all non-useful transfers.

<img src="Resources/12 - Efficiency/image-20210527143632169.png" alt="image-20210527143632169" style="zoom:33%;" />

For an **errorless channel** we have:
$$
\eta_0 = \min\left(\frac{W \times l_m}{l_m + l_a + 2 \times T_d \times C}, 1\right)
$$
 