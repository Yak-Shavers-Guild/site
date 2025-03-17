---
title: Operational Semantics of Untyped Lambda Calculus
---
<nav class="crumbs">
- [ysg](../../index.md)
- [introduction](../index.md)
- [untyped lambda calculus](./index.md)
- operational semantics
</nav>

# Operational Semantics of Untyped Lambda Calculus

Now we can offer a [deductive system](../deductive-system.md) for the
"operational semantics" of lambda calculus. There is a single judgment
describing $\beta$ reduction, denoted $e\to_{\beta}e'$ which
rewrites $e$ (if possible).

## Substitution

Before we can jump to it, we need to define the process of
substitution. We denote "substitute $e$ for each instance of the free
variable $x$ in the expression $e'$" as $e'[e/x]$ (but other variants
are common in the literature, like $[x\e]e'$ or $e'[x:=e]$ or whatever).

<div class="proclaim definition">
**Definition 1:** _Capture-free substitution_<br>
Let $x$ be a variable, let $e$ and $e'$ be lambda-expressions.
We define the <dfn>Capture-Free Substitution</dfn> of $e$ for $x$
in $e'$ to be a lambda-expression such that:

- **Variables:**
  - $x[e/x] = e$ --- this justifies the notation, it "looks like"
    $a(b/a)=b$ in elementary algebra
  - $y[e/x] = y$ if $y\neq x$
- **Abstraction:** This boils down to several cases, sadly...
  - $(\lambda x\ldotp e')[e/x] = \lambda x\ldotp e'$ because we cannot
    replace bound variables
  - If $x\neq y$ and $y\notin\operatorname{FV}(e)$,
    then $(\lambda y\ldotp e')[e/x] = \lambda y\ldotp (e'[e/x])$
  - If $\neq y$ and $y\in\operatorname{FV}(e)$,
    and if $z\notin(\operatorname{FV}(e)\cup\operatorname{FV}(e')\cup\{x\})$ is a fresh variable in $e$ and $e'$,
    then $(\lambda y\ldotp e')[e/x] = \lambda z\ldotp (M[z/y])[e'/x]$
- **Application:** $(e_{1}~e_{2})[e/x] = (e_{1}[e/x])~(e_{2}[e/x])$

And that's it.
<br>(End of Definition 1)
</div>

## Alpha Congruence

We assume that bound-variables can be freely renamed as needed. This
is an equivalence relation conventionally called alpha-congruence in
the literature. We can define it using contexts.

<div class="proclaim definition">
**Definition 2:** _Change of bound variables_<br>
A <dfn>Change of Bound Variables</dfn> in $e$ replaces a subexpression
$\lambda x\ldotp e'$ with $\lambda y\ldotp (e'[y/x])$ where
$y\notin\operatorname{Sub}(e')$ is fresh.
<br>(End of Definition 2)
</div>

<div class="proclaim definition">
**Definition 3:** _Alpha congruence_<br>
Let $e_{1}$ and $e_{2}$ be two lambda-expressions.
We say that $e_{1}$ is <dfn>Alpha Congruent</dfn> to $e_{2}$ if we can
obtain $e_{2}$ by a finite series of changes of bound variables
applied to $e_{1}$ --- and we denote this by
$e_{1}\cong_{\alpha}e_{2}$ or $e_{1}\equiv_{\alpha}e_{2}$ (though the
literature has its fair share of variant notations).
<br>(End of Definition 3)
</div>

## Full Beta Reduction

Now we can define beta reduction. Well, there are many different
semantics we could choose for beta reduction. Let us discuss _full_
beta reduction.

<div class="proclaim definition">
**Definition 4:** _Full beta reduction_<br>
We define the judgement of <dfn>Full Beta Reduction</dfn>, denoted
$e_{1}\to_{\beta}e_{2}$ by the rules:
\[\frac{e_{1}\to_{\beta}e_{1}'}{e_{1}~e_{2}\to_{\beta}e_{1}'~e_{2}}\]
\[\frac{e_{2}\to_{\beta}e_{2}'}{e_{1}~e_{2}\to_{\beta}e_{1}~e_{2}'}\]
\[\frac{e\to_{\beta} e'}{\lambda x\ldotp e\to_{\beta}\lambda x\ldotp e'}\]
\[\frac{}{(\lambda x\ldotp e_{1})~e_{2}\to_{\beta}e_{1}[e_{2}/x]}\]
<br>(End of Definition 4)
</div>

Most programming languages based on lambda calculus do not use this,
it's _too much_. 

## Call-by-value beta reduction

One approach which programming languages take is to avoid beta
reduction in the body of a lambda abstraction --- that is to say, we
do not beta reduce $\lambda x\ldotp e$ regardless whether we could
beta reduce $e$ or not.

We describe this by introducing a new subset of lambda-expressions
called "values" which cannot be reduced any farther. For untyped
lambda calculus, this is just the set of all lambda abstractions.

<div class="proclaim definition">
**Definition 5:** _Values in untyped lambda calculus_<br>
We define the set of <dfn>Values</dfn> of untyped lambda calculus to
be the lambda expressions described by the pseudo-BNF grammar
\[ v ::= \lambda x\ldotp e\]
That is to say, it's the set of all lambda abstractions.
<br>(End of Definition 5)
</div>

We then define the call-by-value beta reduction judgement.

<div class="proclaim definition">
**Definition 6:** _Call-by-value beta reduction_<br>
We define the judgement for <dfn>Call-by-Value Beta Reduction</dfn>
denoted $e_{1}\to_{cbv}e_{2}$ by the rules
\[\frac{e_{1}\to_{cbv}e_{1}'}{e_{1}~e_{2}\to_{cbv}e_{1}'~e_{2}}\]
\[\frac{e_{2}\to_{cbv}e_{2}'}{v~e_{2}\to_{cbv}v~e_{2}'}\]
\[\frac{}{(\lambda x\ldotp e)~v\to_{cbv}e[v/x]}\]
where $v$ ranges over all values.
<br>(End of Definition 6)
</div>

This is how [Standard ML](../../sml/index.md) behaves.

## Call-by-Name Beta Reduction

There's (at least) one middle ground between full beta reduction and
call-by-value beta reduction: apply the function as soon as possible,
even if the argument supplied is not a value.

<div class="proclaim definition">
**Definition 7:** _Call-by-Name Beta Reduction_<br>
We define the judgement of <dfn>Call-by-Name Beta Reduction</dfn>
denoted $e_{1}\to_{cbn}e_{2}$ by the rules
\[\frac{e_{1}\to_{cbn} e_{1}'}{e_{1}~e_{2}\to_{cbn} e_{1}'~e_{2}}\]
\[\frac{}{(\lambda x\ldotp e_{1})e_{2}\to_{cbn}e_{1}[e_{2}/x]}\]
<br>(End of Definition 7)
</div>

Wait, we've introduced three different ways to perform beta
reduction. What's the difference? Are they all the same?

It's when we have problematic lambda-expressions there's a difference
between the semantics. For example: $\Omega = (\lambda x\ldotp x~x)(\lambda y\ldotp y~y)$.
Evaluate this. In one step, we have (performing beta reduction on the
first line, then substitutions in the next two lines):
\[\begin{array}{rcl}
(\lambda x\ldotp x~x)(\lambda y\ldotp y~y)&\to&(x[(\lambda y\ldotp y~y)/x])~(x[(\lambda y\ldotp y~y)/x])\\
&=&(\lambda y\ldotp y~y)~(x[(\lambda y\ldotp y~y)/x])\\
&=&(\lambda y\ldotp y~y)~(\lambda y\ldotp y~y)\\
&=_{\alpha}&(\lambda x\ldotp x~x)~(\lambda y\ldotp y~y)\\
&=&\Omega
\end{array}\]
Hence under all the possible ways to perform beta reduction, we get
$\Omega\to\Omega$ in one step. This is called a <dfn>Divergent</dfn>
term, since it leads to an infinite loop when we try to evaluate it.

So what do we have when we consider $K=\lambda x\ldotp\lambda y\ldotp x$
when we evaluate
\[ K~e~\Omega\to???\]
We see that $K~v_{1}~v_{2}\to v_{1}$ when we work with values. We also
see that $K~v~e\to_{cbn}v$ for any lambda-expression $e$ including
divergent terms.

Call-by-value semantics would produce $K~v~\Omega\to_{cbv}\Omega$ which is
not what we would typically want.

Full beta reduction permits both reductions.

That's...not good. We get three completely different answers from the
three different beta reduction rules.

Let us ask the opposite question: do these three rules agree at all?

<div class="proclaim theorem">
**Theorem 8:** _Beta reduction is confluent_<br>
Let $e_{1}\to e_{2}$ be beta reduction according to any of the
rules. Let $e_{1}\to^{*}e_{2}$ be the reflexive transitive closure of
the beta reduction relation. 

Let $e$ be any lambda-expression.
If $e\to^{*}e_{1}$ and $e\to^{*}e_{2}$,

If $e_{2}$ is a normal form (so there is
no $e'$ such that $e_{2}\to e'$), and if $e_{1}\to^{*} e_{2}$ 
<br>(End of Theorem 8)
</div>

<footer>
**[** [Back](syntax.md) **|** [Up](index.md) **|** [Next](church-encoding.md) **]**
</footer>
