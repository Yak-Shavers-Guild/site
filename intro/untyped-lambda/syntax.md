---
title: Syntax Untyped Lambda Calculus
---
<nav class="crumbs">
- [ysg](../../index.md)
- [introduction](../index.md)
- [untyped lambda calculus](./index.md)
- syntax
</nav>

# Syntax of Untyped Lambda Calculus

When we introduce a deductive system (in this case, untyped lambda
calculus), the first step is to introduce the _syntax_ --- that is to
say, the underlying [formal language](../language.md).

## Formal Language

The formal language underlying untyped lambda calculus requires a
countably infinite set of variables $\mathcal{V}$ which we assume is
given. It cannot include $\lambda$, $.$, or parentheses as variables.

The elements of the formal language are called <dfn>Lambda Expressions</dfn>
and are inductively defined by the following rules:
- **Variables:** Every variable is a lambda expression
- **Abstractions:** If $x$ is a variable and $e$ is a lambda expression,
  then $\lambda x\ldotp e$ is a lambda expression
- **Applications:** If $e_{1}$ and $e_{2}$ are lambda expressions,
  then $e_{1}~e_{2}$ is a lambda expression
- **Parentheticals:** If $e$ is a lambda expression, then $(e)$ is a lambda expression.

And that's it. Strictly speaking, the parenthetic rule is a "quality
of life" rule: it simplifies our lives, but it's not strictly
necessary.

This can be given as formal definition.

<div class="proclaim definition">
**Definition 1:** _Lambda-expressions_.<br>
Let $\mathcal{V}$ be a countably infinite set of variables. We
inductively define the set $\mathcal{E}$ of <dfn>Lambda-Expressions</dfn> over
$\mathcal{V}$ by the following rules governing intermediate sets:
- For all $x\in\mathcal{V}$ we have $x\in\mathcal{E}_{0}$
- For any $x\in\mathcal{V}$ and $e\in\mathcal{E}_{n}$ 
  we have $\lambda x\ldotp e\in\mathcal{E}_{n+1}$
- For any $e_{1},e_{2}\in\mathcal{E}_{n}$
  we have $(e_{1}~e_{2})\in\mathcal{E}_{n+1}$
- For any $n\in\mathbb{N}_{0}$ we have $\mathcal{E}_{n}\subseteq\mathcal{E}_{n+1}$

Then we have
\[\mathcal{E} = \bigcup_{n\in\mathbb{N}_{0}}\mathcal{E}_{n}.\]
This allows us to prove properties about lambda-expressions by
structural induction (which, in this case, coincides with induction over $n$).
<br>(End of Definition 1)
</div>

<div class="proclaim remark">
**Remark:** _BNF-ish presentation_<br>
It's conventional to use metavariables to define the grammar for the
underlying language as follows:
\[\begin{array}{rcl}
e & ::= & x \\
  & \mid & \lambda x\ldotp e\\
  & \mid & e~e
\end{array}\]
This is how computer scientists present it, and it's shorthand for the
more explicit version in Definition 1.
<br>(End of Remark)
</div>

Informally, we think of abstractions as "an expression parametrized by
other expressions represented by a variable". Applications then are
used to "replace" variables in abstractions $e_{1}$ with concrete
expressions $e_{2}$ --- and really substitution is the heart of lambda
calculus. 

## Syntactic Operations

We will need a few notions to discuss the syntactic aspects of untyped
lambda calculus.

<div class="proclaim definition">
**Definition 2:** _Free Variables_<br>
We inductively define the set of <dfn>Free Variables</dfn> of a
lambda-expression by
- $\operatorname{FV}(x)=\{x\}$
- $\operatorname{FV}(\lambda x\ldotp e)=\bigl(\operatorname{FV}(e)\bigr)\setminus\{x\}$
- $\operatorname{FV}(e_{1}~e_{2})=\operatorname{FV}(e_{1})\cup\operatorname{FV}(e_{2})$

<br>(End of Definition 2)
</div>

"Free variables" are "fixed but unknown expressions".

<div class="proclaim definition">
**Definition 3:** _Bound Variables_<br>
We inductively define the set of <dfn>Bound Variables</dfn> of a
lambda-expression by
- $\operatorname{BV}(x)=\emptyset$
- $\operatorname{BV}(\lambda x\ldotp e)=\{x\}\cup\operatorname{BV}(e)$
- $\operatorname{BV}(e_{1}~e_{2})=\operatorname{BV}(e_{1})\cup\operatorname{BV}(e_{2})$

And that's it.
<br>(End of Definition 3)
</div>

We should interpret "bound variables" as "stage instructions": they
are literally placeholders for other lambda-expressions.

<div class="proclaim definition">
**Definition 4:** _Subexpressions_<br>
We may inductively define the <dfn>Set of Subexpressions</dfn> for a
lambda-expression as follows:
- $\operatorname{Sub}(x)=\{x\}$
- $\operatorname{Sub}(\lambda x\ldotp e) = \{\lambda x\ldotp e\}\cup\operatorname{Sub}(e)$
- $\operatorname{Sub}(e_{1}~e_{2}) = \{e_{1}~e_{2}\}\cup\operatorname{Sub}(e_{1})\cup\operatorname{Sub}(e_{2})$

If $e\in\operatorname{Sub}(e')$, then we say that $e$ is a
<dfn>Subexpression</dfn> of $e'$ --- moreover, if $e\neq e'$ we call
$e$ a <dfn>Proper Subexpression</dfn>.
<br>(End of Definition 4)
</div>

<footer>
**[** [Back](index.md) **|** [Up](index.md) **|** [Next](operational-semantics.md) **]**
</footer>
