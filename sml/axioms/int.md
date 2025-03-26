---
title: Integers - SML
---
<nav class="crumbs">
- [ysg](../../index.html)
- [sml](../index.md)
- [axioms](./index.md)
- int
</nav>

# Integers

**Type:** `int`

**Values:** All the integers (we assume that the `int` is [arbitrary precision](https://en.wikipedia.org/wiki/Arbitrary-precision_arithmetic)).

**Operations:** We support the following primitive operations:

- $e_{1} \mathrel{\texttt{+}} e_{2}$
- $e_{1} \mathrel{\texttt{-}} e_{2}$
- $e_{1} \mathrel{\texttt{*}} e_{2}$
- $e_{1} \mathrel{\texttt{div}} e_{2}$
- $e_{1} \mathrel{\texttt{mod}} e_{2}$

...and possibly a few others.

<div class="proclaim remark">
**Remark:** _Specify as few primitives as possible_.<br>
We want to specify as few primitive operations as possible, so that we
can use them to define operations. This makes the framework for
axiomatizing our fragment of Standard ML as minimal as possible (so we
will have less work when/if we formalize this in a proof assistant).

For example, we could define an `int_to_string` operation, so we do
not need to provide an axiomatic specification for it.
<br>(End of Remark)
</div>

## Typing Rules

All the typing rules are of the form:
\[\frac{e_{1} : \mathtt{int},\quad e_{2} : \mathtt{int}}{e_{1} \mathbin{\langle\textit{op}\rangle} e_{2} : \mathtt{int}}\hbox{T-\textit{Op}}\]
...where _op_ is one of the operations we described.

## Evaluation Rules

Evaluation rules make sense if we abuse notation, writing $\ulcorner n\urcorner$
(["Quine quotes"](https://en.wikipedia.org/wiki/Quasi-quotation)) for the Standard ML integer literal corresponding to
the mathematical integer $n\in\mathbb{Z}$. 

The rules for the operations are all schematically the same. Let us
write down the rules for addition:

\[\begin{array}{c}
\displaystyle\frac{e_{1}\stackrel{1}{\Longrightarrow}e_{1}'}{e_{1}\mathrel{\texttt{+}}e_{2}\stackrel{1}{\Longrightarrow}e_{1}'\mathrel{\texttt{+}}e_{2}}\hbox{E-Add1}\\[18pt]
\displaystyle\frac{e_{2}\stackrel{1}{\Longrightarrow}e_{2}'}{v_{1}\mathrel{\texttt{+}}e_{2}\stackrel{1}{\Longrightarrow}v_{1}\mathrel{\texttt{+}}e_{2}'}\hbox{E-Add2}\\[18pt]
\displaystyle\frac{}{\ulcorner n_{1}\urcorner\mathrel{\texttt{+}}\ulcorner n_{2}\urcorner\stackrel{1}{\Longrightarrow}\ulcorner n_{1}+n_{2}\urcorner}\hbox{E-Add}
\end{array}\]

<div class="proclaim remark">
**Remark:** _Division by zero is...trouble?_<br>
We must make a decision how to handle "division by zero".

Initially, people thought it should raise an error --- and Standard
ML's primitive library [raises a `Div` exception](https://smlfamily.github.io/Basis/Basis/integer.html#SIG:INTEGER.div:VAL).

Later people working on proof assistants realized we could treat `n div 0` as zero, and we wouldn't run into much trouble.
We gain a lot by taking this strategy: all the primitive functions are
well-defined (and suitably nice) on all the integers.

We will probably take the approach that $v\mathrel{\texttt{div}}0\stackrel{1}{\Longrightarrow}\texttt{raise\ Div}$
is the "correct" evaluation rule.
<br>(End of Remark)
</div>
