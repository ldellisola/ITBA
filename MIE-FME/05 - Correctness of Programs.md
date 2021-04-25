# Correctness of Programs with Control Structures

Control structures multiply the number of basic paths our program may take. In order to validate the correctness of a program with control structures we need to linearize it.

But first we will redefine a correct program and basic path. A **basic path** is a basic path of a program $P$ if the basic paths:

- Corresponds to a sequence of program lines of $P$ that can be executed in this order
- Either begins at the beginning of $P$, or at an **@**-assertion that is replaced by the corresponding **assume**-assertion.
- Contains **assume** $\phi$ instead of control structures, where $\phi$ is the condition under which program execution follows this path.

If for all basic paths $\pi$ of a program $P$, $\models VC(\pi)$, then the program is correct.

## Linearization of if-then-else

In the most basic case, our code looks like the following:

```
if P then
    ...
else
    ...
```

We can linearize this with only two paths:

1. Path following $\text{if: } \bold{\text{assume }} P$
2. Path following $\text{else: } \bold{\text{assume }} \neg P$

If we have a cascade of $\text{if-then-else}$ paths, we have to apply this to all possible paths, resulting in $2^n$ basic paths.

## Linearization of while loops

While loops contain at least one **@**-assertion inside, and they look like this:

```
while P do
    ...
    @ assertion
    ...
```

This control structure can be divided into 4 basic paths:

1. When the program does not meet the $P$ condition and skips all together the while loop.
2. When the program meets the $P$ condition and enters the while loop.
3. When the program is inside the while loop, but on the next iteration it will leave it.
4. When the program is inside the while loop and in the next iteration it will not leave it.

## Linearization of for loops

In a similar way to while loops, for loops must contain at least one **@**-assertion. Also, they cannot modify the $i$ value inside the loop. They usually look like this:

```
for i <- l to u do
	...
	@ assertion
	...
```

Here we also have 4 different basic paths that can happen:

1. The program jumps into the loop from outside.
   $$
   \array{\bold{\text{assume }}i = l \land l \le u}
   $$

2. The program skips the loop from outside.
   $$
   \array{\bold{\text{assume }}\neg l \le u}
   $$

3. The program is inside the loop and it will stay within the loop in the next iteration. 
   $$
   \array{i \larr i +1 &;& \bold{\text{assume }} i \le u}
   $$
   

4. The program is inside the loop and it will come outside after this iteration.
   $$
   \array{i \larr i +1 &;& \bold{\text{assume }}\neg i \le u}
   $$

## Program Correctness and Loops

A program with loops may have infinitely many basic paths and corresponding verification conditions. To ensure that we have a finite number of basic paths, every loop mist have at least one assertion (loop invariant).

This loop invariant can be at any position in the loop, and if we have nested loops then we need to have an assertion on every loop, not just the innermost one.

In general finding loop invariants is an art and requires creativity. Invariants must be involved in three verification conditions:

- Holds in the first loop iteration.
- If it holds, and the loop is re-entered, then it must hold again.
- If it holds, and the loop is left, then the assertion after the loop must hold.

## Assertions and Verification Conditions

Assertions and verification conditions are different tools used to verify correctness. When an assertion holds it is a global condition, if we want to check it, we need to understand the whole program. On the other side, verification conditions hold on locally checkable conditions.

In practice manually checking all the verification conditions is unrealistic. It is better to make assertions as locally as possible.