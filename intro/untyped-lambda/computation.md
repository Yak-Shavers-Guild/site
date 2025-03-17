---
title: Computation
---
<nav class="crumbs">
- [ysg](../../index.md)
- [introduction](../index.md)
- [untyped lambda calculus](./index.md)
- computation
</nav>

# Computation

We don't have an adequate definition of "computation" (or "computable functions").

That's a problem if we want to, you know, compute stuff.

Historically, a "computer" referred to a human being capable of doing
complicated calculations. This led to criteria offered by Turing and
Church in the 1930s for "computable numbers" and "computable
functions" of numbers.

## Turing's Thesis

Alan Turing invented an abstract machine for discussing computability
called a "Turing Machine". This resembles an idealized computer (of
sorts).

There's a finite set of symbols, an infinite tape consisting of **'cells'**
which are either 'blank' or has exactly 1 symbol written on it, and a
'head' which can read or write to a cell or move 1 cell to the left or
right. A program is then a finite sequence of instructions for the
machine. It is common to make the possible instructions part of the
alphabet, and the program is written to the tape. (Some authors have a
separate tape for the program --- this is convenient but not _necessary_.)

There are many different hypothetical "machines" equivalent to Turing
machines. My favorite is Lambek's Abacus Machine introduced in his
paper "How to Program an Infinite Abacus" (<cite>Canadian Mathematical
Bulletin</cite> **4**, no. 3 (1961) 295-302, [doi:10.4153/CMB-1961-032-6 ](https://doi.org/10.4153/CMB-1961-032-6)). It consists of $k$
"registers" (which can hold an arbitrary number of "beads" --- i.e.,
each register stores a non-negative integer) and there are two
instructions:
1. Add one bead to register $n$ and then go to instruction number $i$
2. Check if register $n$ has at least one bead. If so, then remove one
   bead from register $n$ and go to instruction number $j$; otherwise
   (there are no beads in register $n$) go to instruction number $i$
   (possibly different from $j$).

When I say "equivalent", I mean: for any Turing machine, we can write
a program for the Abacus Machine such that it is an emulator for the
given Turing machine. Moreover, for any Turing machine, we can write a
program for the Turing machine which emulates any Abacus Machine.

This means there's some class of abstract machines which are equally
as good as each other. Turing asserts that this captures our informal
concept of computation.

<div class="proclaim theorem">
**Turing's Thesis.**<br>
Turing machines adequately capture our intuitive notion of computation.
<br>(End of Turing's Thesis)
</div>

This is a "thesis" because we don't have a well-defined notion of
computation. Otherwise we could _prove_ (or disprove) this claim.

Where did he state this "thesis"? Well it was in Turing's "Intelligent
Machinery" (National Physical Laboratory Report, 1948) states on page 7:

> LCMs [logical computing machines: Turing's expression for Turing
> machines] can do anything that could be described as "rule of thumb"
> or "purely mechanical". This is sufficiently well established that
> it is now agreed amongst logicians that "calculable by means of an
> LCM" is the correct accurate rendering of such phrases.

Some authors give a formalization of a Turing machine with
instructions resembling what we might find in modern digital computers.

Note that modern digital computers are technically not Turing machines
but mere approximations to them. This is because there's only a finite
amount of RAM and a finite 'word size', whereas a Turing machine would
want infinite RAM and arbitrary large registers. But this is
physically impossible, so we must resign ourselves to approximations.

## Church's Thesis

Alonzo Church, who introduced lambda calculus, offered an equivalent
notion of computability using lambda calculus.

The strategy is to use [Church encodings](church-encoding.md) of non-negative integers, and
then call a function of non-negative integers "lambda-definable" if
there is an expression in lambda calculus such that it produces
equivalent outputs when applied to equivalent inputs. More formally:

<div class="proclaim definition">
**Definition 1:** _Lambda-definable functions_.<br>
A function $f\colon\mathbb{N}_{0}^{k}\to\mathbb{N}_{0}$
is called <dfn>Lambda-Definable</dfn> if there is some expression in
lambda calculus $e$ such that for any $k$ non-negative integers
$n_{1}$, ..., $n_{k}$ with Church encoding $\overline{n_{1}}$, ...,
$\overline{n}_{k}$, if 
\[m=f(n_{1},\dots,n_{k})\]
and if $\overline{m}$ is the Church encoding of $m$,
then 
\[\overline{m}=e~\overline{n_{1}}\cdots\overline{n_{k}}.\]
Essentially this means $e$ is "the same as" $f$.
<br>(End of Definition 1)
</div>

**Example 1.1:** Consider the successor function $f(n)=n+1$. This is
lambda-definable. 

**Example 1.2:** Consider addition $f(n_{1},n_{2})=n_{1}+n_{2}$. This
is lambda-definable. (Multiplication is also lambda-definable.)

...

Enough examples of lambda-definable functions.

This led to one version of Church's thesis:

<div class="proclaim theorem">
**Church's Thesis.**<br>
Lambda-definable functions adequately describe our informal notion of
computability. 
<br>(End of Church's Thesis)
</div>

We could give a more general notion of Church's thesis, and assert
that lambda calculus is an adequate model of computation.

There are other variants of Church's thesis (also stated by Alonzo
Church) giving different, equivalent ways to describe the informal
notion of "computation".

## References

There is a lot of literature on this topic. The interested reader may
consult the [Stanford Encyclopedia of Philosophy](https://plato.stanford.edu/)
for more about the 
[Church-Turing thesis](https://plato.stanford.edu/entries/church-turing/)
asserting that Turing machines and untyped lambda calculus capture our
intuition for computation.

The [Open Logic Project](https://openlogicproject.org/)
has a good introduction to [lambda-definability](https://builds.openlogicproject.org/content/lambda-calculus/lambda-definability/lambda-definability.pdf).

<footer>
**[** [Back](church-encoding.md) **|** [Up](untyped-lambda-calculus.md) **]**
</footer>
