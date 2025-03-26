---
title: Axiomatization of Standard ML
---
<nav class="crumbs">
- [ysg](../../index.html)
- [sml](../index.md)
- axioms
</nav>

# Axiomatization of Standard ML

We will present our fragment of Standard ML as "just another deductive system".
This will be done by presenting the "basic" types and their
operations, then the rules governing the static semantics for our
fragment of Standard ML. 

## References

The axiomatization is not my own creation, [Dan Licata](https://dlicata.wescreates.wesleyan.edu/) and
[Bob Harper](https://www.cs.cmu.edu/~rwh/) used it when teaching 
[CS 150](http://www.cs.cmu.edu/~15150/) at Carnegie--Mellon University
back in 2011, and subsequent professors have refined it over time. But
it is so much more _convenient_ for reasoning about Standard ML code!

There are a lot of interesting papers in the discourse of proving
properties using the [<cite class="book">Definition of Standard ML</cite>](https://smlfamily.github.io/sml97-defn.pdf), including:

- Myra VanInwegen,
  [Towards Type Preservation for Core SML](http://web.archive.org/web/20040430162745/http://www.myra-simon.com/myra/papers/JAR.html)
  (1997) --- a summary of work done in VanInwegen's [PhD thesis](http://web.archive.org/web/20040501010753/http://myra-simon.com/myra/papers/thesis.html).
- Myra VanInwegen, Elsa Gunter,
  "HOL-ML". 
  In _Higher Order Logic Theorem Proving and Its Applications_,
  Springer-Verlag Lecture Notes in Computer Science Vol. 780,
  February 1994, pp. 61--73. [Eprint (ps.gz)](http://web.archive.org/web/20040415023421/http://myra-simon.com/myra/papers/holML.ps.gz)

## Contents

- [Judgements](judgements.md)
- [Booleans](bool.md)
- [Integers](int.md)
- [Characters](char.md)
- Strings
- Product Types
- Functions
- Lists
- Options
- Algebraic Datatypes
