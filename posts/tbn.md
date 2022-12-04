---
title: creating a tiny big number library
abrv-title: tbn
published: 2022-03-24
tags: math
status: incomplete
---

# Tiny Big Number Library - Background
Tiny Big Number Library \([tbnlib](https://github.com/u20n/tbnlib)\) was written so that I could do physics projects and other large simulations in C++ without a huge amount of dependency overhead. It aims to implement the **bare minimum** necessary to do these calculations.

---
# Big(s)

We can represent bigs as $\langle n_i \dots n_0\rangle \leftrightarrow n_0 \dots n_i$, where $n \in [0, 9]\cup\mathbb{N}$ is a digit, and $i \in \mathbb{N}_{0\leq}$ is a index. 

There are three states of a `big`; `positive`, `negative`, and `point`. They are referenced as members of the `big` struct; `big.sign = (0 || 1)`, where `0` is negative, and `1` is positive (`1` by default). Similarly, `big.point` contains the decimal place of the `big`; by default, `point` is `0`.


---

# Subtraction & Addition

*The process of subtraction is described below; addition is left as an exercise to the reader*

This is fairly straight forward; given two `big`, $a$ and $b$;

We equalise the two `big` by appending $0$ in `big` format until the digit counts are equal. Functionally, we're prepending zeros to an integer; 
$$
\langle n_0, \dots, n_i \rangle \equiv \langle n_0, \dots, n_i, 0, \dots, 0 \rangle \iff n_i \dots n_0 \equiv 0 \dots 0\space n_i \dots n_0
$$

We assume that we are taking the difference of $a$ and $b$. If the size of $b$ is more than the size of $a$, or if the size of $b$ is equal to that of $a$, and any digit of $a_x < b_x$, we invert the sign of the difference big, and flip $a$ and $b$. With the $a$ and $b$ of equal size (and proper order), we can now apply the very simple logic of one digit subtraction.

---

# Fourier Division

Procedure:
1. Set bigs to two digit base terms (see power modifier)
2. Apply General Form
3. Apply inverse power modifier
4. Condense $b$ term
5. Place Decimal

> Problem: We want to divide `big` $a$ by `big` $c$.

## Two Digits
> The following exposition assumes that the numbers are broken into two-digit pieces, separated by commas: e.g. $3456$ becomes $34,56$. In general $x,y$ denotes $x\cdot100 + y$ and $x,y,z$ denotes $x\cdot10000 + y\cdot100 + z$, etc. 

Of all the $a$ terms, only $a_0$ needs to be a two-digit number; because we only manipulate the successive partial quotients, we can have $\lnot \left[a | 2\right]$. We assume that $1 \leq |\left<a\right>|$, given this is `big mod big`, but worst case, you can append $0$, and proportionally increase the returned big's decimal place.

## General Form

Generally, $\frac{c}{a} \to b$ expands to $\frac{c_0 \space\dots\space c_i}{a_0 \space\dots\space a_i} \to \left<b_0 \space\dots\space b_i\right>$.

The general form follows:
$$
\begin{aligned}
b_i = \frac{r_{i-1},c_{i+1}-\sum_{j=2}^i b_{i-j+1}\cdot a_j}{a_1}
&\implies \text{ remainder } r_i \\
\dots &\implies r_0 = c_1
\end{aligned}
$$

Variables on negative indices are nullified. The only **real** deviation from the general form is $b_1$;

$$
b_1 = \frac{c_1,c_2}{a_1} \implies \text{remainder } r_1
$$

## Power Modifier

*Storing the bigs in a flipped format means that we can use the vector index to easily determine the appropriate power modifier.*

We can induce the 'Power Modifier' by applying $p(x_i)$; 

$$
\begin{aligned}
p(x_i) = \begin{cases}
x\cdot 10^{i+1} &&\mid 0<i \\
x &&\mid i = 0
\end{cases}
\end{aligned}
$$

We apply $p(x_i)$ and its inverse to our $a$, $b$, and $c$ terms to translate them between terms and bigs, respectively;

$$
\begin{aligned}
n_i \space\dots\space n_0 &\to p(n_0) \space\dots\space p(n_i) \\
p^{-1}(n_i) \space\dots\space p^{-1}(n_0) &\to n_i \space\dots\space n_0
\end{aligned}
$$

## Gathered Analysis
Analysis that I found valuable in the process of researching this is listed below, along with their original sources, backed up to internet archive to prevent link death.
> There is another intuition to be gained from studying the flow of data in the standard multiplication algorithm. If you write it out in computer hardware, you can see that a square array of 8-bit multiplicative units takes two 32-bit numbers arranged along their bottom and right sides and moves the data up and left, exiting at the top edge of the array in a 64-bit answer. The topmost leftmost unit delivers the top TWO (8-bit) digits of the product, using the top digits of the multiplicands and carry in from the rest of the array to its right. OK? Well, imagine the array running in reverse to take as input the 64-bit divident along the top edge and a 32-bit divisor, say along the right hand edge of the array. Then it outputs the 32-bit quotient along the bottom edge (a remainder needs to be generated too ..\[.\] forget about\[ \]it for the mo\[ment\]). Now the topmost left unit in the array takes IN the top two digits of the dividend from the top of the array, the top digit of the divisor from the right hand side of the array, and emits the top digit of the quotient DOWNWARDS into the array (and out the bottom) and a remainder RIGHTWARDS into the array.
> 
> Whew! That was just for the first digit output. It's only the beginning. Fourier's genius was in seeing how one can feed in the accumulating remainders in order to keep the inputs limited to just three (say 8-bit) digits, and the outut at just two (say 8-bit) digits for every unit in the modified multiplicative array running in reverse (which we can call a division array now).
> And of course, that's how we can do division in hardware, no microcode required, in a computer ALU.
> 
> At least, I presume this method is used where microcode has been eschewed in favour of a few more billion transistors. I'm not privy to the interior of the latest CPUs, but they have transistors to burn.
> 
> [Source](https://web.archive.org/web/20221201161030/https://stackoverflow.com/questions/1447484/what-is-the-logic-behind-fourier-division-algorithm/3845144)

---

Reference:
[Wikipedia](https://web.archive.org/web/20221201161732/https://en.wikipedia.org/wiki/Fourier_division)