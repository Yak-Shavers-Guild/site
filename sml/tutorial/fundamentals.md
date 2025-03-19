---
title: Fundamentals of Programming
---
<nav class="crumbs">
- [ysg](../../index.md)
- [sml](../index.md)
- [tutorial](./index.md)
- fundamentals
</nav>

# Fundamentals of Programming

We begin with three fundamental claims which serve as a starting point
for programming as an activity:

<div class="proclaim">
**Claim 1:** The <dfn>computer</dfn> is a magic box which performs the
evaluation of expressions.
</div>

(This first claim is a convenient lie, close enough to the truth to
work for our purposes.)

<div class="proclaim">
**Claim 2:** A <dfn>program</dfn> written in a functional programming language
(like Standard ML) consists of a finite ordered sequence of <dfn>Declarations</dfn>
which grows a "vocabulary" (each declaration adds a new
<dfn>identifier</dfn> and its associated "meaning") atop the primitive
notions provided by the functional programming language.
</div>

<div class="proclaim">
**Claim 3:** Programming is an activity which attempts to solve a
<dfn>problem</dfn> by producing a program.
</div>

Therefore computer programming is fundamentally an explanatory
linguistic problem-solving process.

## Explanations and Problems

Programming begins with the **Problem Statement**. These may be of
various degrees of informality like:
- "Shuffle a deck of cards",
- "Determine if the given proposition is a tautology", 
- "Sort a given list of integers in ascending order",
- "Search a given collection for a given value".

We translate this into a **Specification** which expresses the problem
using a more precise language for the expectations of the
program. This requires thinking hard about the meaning of some
informal terms (e.g., what does it mean to "shuffle" a deck of cards?).

Functional programming languages can express specifications as
mathematical statements, and be reasoned about algebraically.

An "explanation" is harder to pin down. When we have a specification
stated mathematically, we can _transform_ it by manipulating
expressions. We can successively transform it until we have an
implementation --- this is the heart of "Correct-by-Construction"
techniques found in Roland Backhouse's <cite class="book">Program
Construction: Calculating Implementations from Specifications</cite>
(John Wiley and Sons, 2003).

In effect, we are **elucidating** statements from informal to formal.

<div class="proclaim advice">
**Advice 1:** _Use examples_.<br>
A great trick to elucidating a problem statement is to work with
small-ish examples. Instead of shuffling a 52-card deck, what would
shuffling a 6 card deck look like?

These examples are useful later on, because they can later serve as
unit tests to check the program works as we hoped.
<br>(End of Advice 1)
</div>

