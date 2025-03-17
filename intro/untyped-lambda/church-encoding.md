---
title: Church Encoding in Untyped Lambda Calculus
---
<nav class="crumbs">
- [ysg](../../index.md)
- [introduction](../index.md)
- [untyped lambda calculus](./index.md)
- church encoding
</nav>

# Church Encoding in Untyped Lambda Calculus

We can use untyped lambda calculus to encode natural numbers and
operators acting on them. Well, we can do this for useful stuff like
lists and Booleans.

## Natural Numbers

Remember how Peano axioms for natural numbers introduced two primitive
notions: a "zero" constant, and a "successor" term constructor.

We can even write a BNF grammar for these numbers as:

```bnf
<Peano natural number> ::= <zero>
                        |  <succcessor> <Peano natural number>
                        |  "(" <Peano natural number> ")"

<zero> ::= "Z"

<successor> ::= "S"
```

We identify `Z` with 0, `S Z` with 1, `S S Z` with 2, `S S S Z` with
3, and so on.

Using lambda abstraction expressions, we can identify these as follows:
- 0 is $\lambda s\ldotp\lambda z\ldotp z$
- 1 is $\lambda s\ldotp\lambda z\ldotp s~z$
- 2 is $\lambda s\ldotp\lambda z\ldotp s(s~z)$
- 3 is $\lambda s\ldotp\lambda z\ldotp s(s(s~z))$
- $n$ is $\lambda s\ldotp\lambda z\ldotp s^{\circ n}~z$
  where $s^{\circ n}=s~s~\cdots~s$ is $s$ composed $n$ times.

Observe then that $m$ expects two arguments: an endomorphism and an
initial value. So we would have $m~f~x=f^{\circ m}~x$ and this is
useful when we want to do arithmetic.

The trick is to supply successor and zero parameters. We have addition
defined as the lambda-expression
\[\operatorname{plus} := \lambda m\ldotp\lambda n\ldotp\lambda s\ldotp\lambda z\ldotp m~s~(n~s~z).\]
The "increment by 1" operator is then just 
$\lambda m\ldotp\operatorname{plus}~1~m$ and this $\beta$ reduces to
\[\operatorname{inc} := \lambda m\ldotp\lambda s\ldotp\lambda z\ldotp s(m~s~z).\]
We should read this as `s` applied to `m` when we construct `m` using
the given successor and zero terms.

## Ordered Pairs

We can represent ordered pairs using untyped lambda calculus. The
"constructor" for a pair will expect two expressions, then return an
expression ready to apply a function to both of them:
\begin{equation}
\operatorname{pair} := \lambda a\ldotp\lambda b\ldotp\lambda f\ldotp f~a~b
\end{equation}
Then we have projection operators which will just pick out which
argument to return
\begin{equation}
\operatorname{first} := \lambda p\ldotp p(\lambda x\ldotp\lambda y\ldotp x)
\end{equation}
\begin{equation}
\operatorname{second} := \lambda p\ldotp p(\lambda x\ldotp\lambda y\ldotp y)
\end{equation}
The reader can verify that $\operatorname{first}(\operatorname{pair}~x~y)$
really $\beta$ reduces to $x$, and similarly 
$\operatorname{second}(\operatorname{pair}~x~y)$ reduces as expected.

### Predecessor from Pairs

We can now define a predecessor operator `P` on Peano natural numbers
by induction as follows:
- `P Z = Z` the predecessor of zero is zero
- `P (S n) = n` the predecessor of the successor of $n$ is just $n$

We can implement it in untyped lambda calculus using pairs of
numbers. The code speaks for itself:
- $\operatorname{step} := \lambda p\ldotp\operatorname{pair}~(\operatorname{second}~p)~(\operatorname{inc}~(\operatorname{second}~p))$
- $\operatorname{zero} := \lambda s\ldotp\lambda z\ldotp z$
- $\operatorname{pz} := \operatorname{pair}~\operatorname{zero}~\operatorname{zero}$
  for the predecessor when applied to zero
- $\operatorname{pred} := \lambda n\ldotp\operatorname{first}~(n~\operatorname{step}~\operatorname{pz})$

This applies $\operatorname{step}$ $n$ times to the pair $(0,0)$.
The first application produces $(0,1)$; the second application
produces $(1,2)$; the third application produces $(2,3)$; ...; the
$(k+1)^{\text{th}}$ application produces $(k,k+1)$, and so on.
Then once the dust settles, we have $\operatorname{first}~(n-1,n)$
when $n\neq 0$, and $\operatorname{first}~(0,0)$ when $n=0$.

This is useful for trying to create a _monus_ operation,
\[ m\mathbin{∸}n = \max(0,m-n). \]
It's "just" subtraction, but returns 0 for negative results. That is
to say, it is the predecessor of $m$ applied $n$ times. We have:
\begin{equation}
\operatorname{monus} := \lambda m\ldotp\lambda n\ldotp n~\operatorname{pred}~m.
\end{equation}
Neat.

## Problem: Meaningless Expressions

There's nothing stopping us from doing something like:
\begin{equation}
\operatorname{add}~\operatorname{pair}~\operatorname{monus}.
\end{equation}
This is a grammatically well-formed lambda-expression, but it's
meaningless among human beings. What is the sum of the data constructor
of ordered pairs with a binary operator of numbers? Well, what is it?

We should avoid this situation ideally, by catching it before we
contemplate its evaluation.

This leads us to the idea of "types". We should attach "labels" to
expressions called "types". Lambda-expressions should have a label
which states it expects an expression with a certain type, and
promises to produce an expression with a (possibly different) specific
type. Then we only require we apply expressions to expressions when
the types "make sense" (the operator "looks like" a function expecting
the argument's "type").

This would avoid such embarrassment.

<footer>
**[** [Back](operational-semantics.md) **|** [Up](index.md) **|** [Next](computation.md) **]**
</footer>
