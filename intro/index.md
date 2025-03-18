---
title: Introduction - YSG
---
<nav class="crumbs">
- [ysg](../index.html)
- introduction
</nav>

# Introduction to Yak Shavers Guild

We are building proof assistants because it's fun.

A proof assistant may be thought of as a sort of "interpreter" for a
particular foundations of mathematics. But we can use proof assistants
for verifying a computer program implements a specification, too.

From a different perspective, we could look at proof assistants as
studying the foundations of mathematics using the tools of computer
science. 

The goal of this "chapter" is to discuss some of the more
_philosophical_ aspects of this endeavour, as well as place
discussions of implicit notions like "formal language", "judgements",
and so on.

**Assumption:** We will be assuming some level of Mathematical
maturity. Specifically we assume the reader has some level of
familiarity with basic set theory and logic at the level of a mediocre
upper-division undergraduate at university studying Mathematics.

- [Language](language.md)
- [Deductive Systems](deductive-system.md) as described in terms of
  "judgements" and "inference rules"
- Type Theory
  - [Untyped Lambda Calculus](untyped-lambda/index.md)
    - [Syntax](untyped-lambda/syntax.md) introduces the underlying
      formal language
    - [Operational Semantics](untyped-lambda/operational-semantics.md)
      discusses "how to work" with untyped lambda calculus
    - Church--Rosser theorem
    - [Church encoding](untyped-lambda/church-encoding.md) for describing how
      to do arithmetic and "program" with untyped lambda calculus
    - [Computation](untyped-lambda/computation.md) can be treated as logically
      equivalent to Turing machines or untyped lambda calculus.
  - [Typed Arithmetic](typed-arithmetic.md)
  - Simply-Typed Lambda Calculus
  - System F
- Logic
  - Propositional Logic
  - First-Order Logic