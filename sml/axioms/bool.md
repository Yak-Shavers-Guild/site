---
title: Booleans - SML
---
<nav class="crumbs">
- [ysg](../../index.html)
- [sml](../index.md)
- [axioms](./index.md)
- boolean
</nav>

# Booleans

**Type:** `bool`

**Values:** `true` and `false`

**Operations:** the primitive operations defined which we provide
specifications for, include:
- $e_{1}$ `orelse` $e_{2}$
- $e_{1}$ `andalso` $e_{2}$
- `not` $e$
- `if` $e_{1}$ `then` $e_{2}$ `else` $e_{3}$
- $e_{1} \lt e_{2}$ (and $e_{1}\gt e_{2}$ and $e_{1}$ `<=` $e_{2}$ and
  $e_{1}$ `>=` $e_{2}$)

## Typing Rules

\[\begin{array}{c}
\displaystyle\frac{e_{1} : \mathtt{bool},\quad e_{2} : \mathtt{bool}}{e_{1}~\mathtt{orelse}~e_{2} : \mathtt{bool}}\hbox{T-Orelse}\\[12pt]
\displaystyle\frac{e_{1} : \mathtt{bool},\quad e_{2} : \mathtt{bool}}{e_{1}~\mathtt{andalso}~e_{2} : \mathtt{bool}}\hbox{T-Andalso}\\[12pt]
\displaystyle\frac{e : \mathtt{bool}}{\mathtt{not}~e : \mathtt{bool}}\hbox{T-Not}\\[12pt]
\displaystyle\frac{e_{1} : \mathtt{bool},\quad e_{2} : T,\quad e_{3} : T}{\mathtt{if}~e_{1}~\mathtt{then}~e_{2}~\mathtt{else}~e_{3} : T}\hbox{T-If}
\end{array}\]
If $T$ is `string`, `char`, `int`, or `word`, then:
\[\begin{array}{c}
\displaystyle\frac{e_{1} : T,\quad e_{2} : T}{e_{1}\mathrel{\texttt{>}} e_{2} : \mathtt{bool}}\hbox{T-Less}\\[12pt]
\displaystyle\frac{e_{1} : T,\quad e_{2} : T}{e_{1}\mathrel{\texttt{<=}} e_{2} : \mathtt{bool}}\hbox{T-Leq}\\[12pt]
\displaystyle\frac{e_{1} : T,\quad e_{2} : T}{e_{1}\mathrel{\texttt{>}} e_{2} : \mathtt{bool}}\hbox{T-Greater}\\[12pt]
\displaystyle\frac{e_{1} : T,\quad e_{2} : T}{e_{1}\mathrel{\texttt{>=}} e_{2} : \mathtt{bool}}\hbox{T-Geq}
\end{array}\]
If $T$ is `unit`, `int`, `bool`, `char`, `string`, `word`, then:
\[\displaystyle\frac{e_{1} : T,\quad e_{2} : T}{e_{1} \mathrel{\texttt{=}} e_{2} : \mathtt{bool}}\hbox{T-Eq}\]
We can define `e1 <> e2` as an abbreviation for `not (e1 = e2)`.

<div class="proclaim remark">
**Remark:** _Equality types_.<br>
One wart of Standard ML is that equality is _polymorphic_. There is a
family of types called <dfn>Equality Types</dfn> which have equality
defined for them. Functions and exceptions lack equality. Other
languages like Haskell have a type class which allows the user to
define equality for their own types. Standard ML was too early to take
advantage of this.
<br>(End of Remark)
</div>

## Evaluation Rules

\[\begin{array}{c}
\displaystyle\frac{e_{1}\stackrel{1}{\Longrightarrow}e_{1}'}{\mathtt{if}~e_{1}~\mathtt{then}~e_{2}~\mathtt{else}~e_{3}\stackrel{1}{\Longrightarrow}\mathtt{if}~e_{1}'~\mathtt{then}~e_{2}~\mathtt{else}~e_{3}}\hbox{E-If}\\[18pt]
\displaystyle\frac{}{\mathtt{if}~\mathtt{true}~\mathtt{then}~e_{2}~\mathtt{else}~e_{3}\stackrel{1}{\Longrightarrow}e_{2}}\hbox{E-IfTrue}\\[12pt]
\displaystyle\frac{}{\mathtt{if}~\mathtt{false}~\mathtt{then}~e_{2}~\mathtt{else}~e_{3}\stackrel{1}{\Longrightarrow}e_{3}}\hbox{E-IfFalse}\\[12pt]
\end{array}\]

We have some rules which describe `andalso`, `orelse`, `not` as
"syntactic sugar" (abbreviations):
\[\begin{array}{c}
\displaystyle\frac{}{e_{1}~\mathtt{andalso}~e_{2}\stackrel{0}{\Longrightarrow}\mathtt{if}~e_{1}~\mathtt{then}~e_{2}~\mathtt{else~false}}\hbox{E-Andalso}\\[12pt]
\displaystyle\frac{}{e_{1}~\mathtt{orelse}~e_{2}\stackrel{0}{\Longrightarrow}\mathtt{if}~e_{1}~\mathtt{then}~\mathtt{true}~\mathtt{else}~e_{2}}\hbox{E-Orelse}\\[12pt]
\displaystyle\frac{}{\mathtt{not}~e\stackrel{0}{\Longrightarrow}\mathtt{if}~e~\mathtt{then}~\mathtt{false}~\mathtt{else}~\mathtt{true}}\hbox{E-Not}
\end{array}\]

The equality and comparison operators are defined "in the obvious way".
