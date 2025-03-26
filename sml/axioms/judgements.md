---
title: Judgements - Axiomatic SML
---
<nav class="crumbs">
- [ysg](../../index.html)
- [sml](../index.md)
- [axioms](./index.md)
- judgements
</nav>

# Judgements - Axiomatic SML

When presenting a deductive system, we need to give the underlying
language (usually in a terse pseudo-BNF grammar), the judgement forms,
and the inference rules giving us their inductive definition.

The [<cite class="book">Definition of Standard ML</cite>](https://smlfamily.github.io/sml97-defn.pdf) explains there are three
"phases" to executing a Standard ML:
1. **parsing** the input into a syntax tree
2. **elaboration** which performs type inference and type checking
3. **evaluation** which "does the work"

The evaluation phase contains the more interesting parts, then
elaboration contains the second most interesting parts, and finally
parsing...is a thing...

We will be annotating terms with their types, so type inference will
not really be needed to reason about the code.

And we will not need parsing judgements, but the really
dedicated/motivated reader may come up with some judgements for a
string being a grammatically well-formed pseudoexpression.

## Evaluation-related Judgements

<div class="proclaim definition">
**Definition 1:** _Reduction judgement_.<br>
Let $e$ and $e'$ be two Standard ML expressions of the same type. We
have the <dfn>Reduction</dfn> judgement forms:

- $e\stackrel{1}{\Longrightarrow}e'$
  meaning $e$ _reduces to_ $e'$ in one step
- $e\stackrel{k}{\Longrightarrow}e'$ meaning $e$ _reduces to_ $e'$ in $k$ steps
- $e\Longrightarrow e'$ (ASCII: `e ==> e'` for usage in comments in
  Standard ML) meaning $e$ _reduces to_ $e'$ in zero or more steps

These "steps" refer to steps in some hypothetical abstract
machine. They may or may not correspond to CPU cycles.
<br>(End of Definition 1)
</div>

We have times when an expression can be reduced any further. There are
three possible outcomes:
- A "value" is produced from the computation (`3 + 2` reduces to `5`
  and cannot reduce any farther)
- A "divergent" situation like an infinite loop or some other "bad"
  situation; this is denoted by the special "value" $\bot$ (pronounced
  <dfn>Bottom</dfn>) which can be given any type
- An exception could be raised, which propagates until it is handled
  (or reaches the main function).

The first situation merits its own cluster of judgements.

<div class="proclaim definition">
**Definition 2:** _Value and Valuable judgement form_.<br>
Let $e$ be an expression. We have the <dfn>Value</dfn> judgement form
$e~\mathsf{Value}$ asserts that $e$ is a value. In ASCII, we write `e value`.

We will use the metavariable $v$ for expressions which are values.

If $e$ is an expression of type $T$, then we have the judgement
$e~\mathsf{Valuable}$ which means there exists a value $v$ of type $T$ such that
$e\Longrightarrow v$ (including the case when $e=v$).
In ASCII, we write this judgement as `e valuable`.
<br>(End of Definition 2)
</div>

<div class="proclaim definition">
**Definition 3:** _Evaluation judgement form_.<br>
Let $e$ be an expression of type $T$ and let $v$ be a value of type
$T$.
We define the <dfn>Evaluation</dfn> judgement form, denoted
$e\hookrightarrow v$, which asserts _either_ $e$ is syntactically
identical to $v$ already _or_ there exists some non-negative integer $k$ such that $e\stackrel{k}{\Longrightarrow}v$.
<br>(End of Definition 3)
</div>

<div class="proclaim definition">
**Definition 4:** _Extensional equivalence_.<br>
Let $e$ and $e'$ be two expressions of the same type.
We define the judgement that $e$ and $e'$ are 
<dfn>Extensionally Equivalent</dfn>
$e\cong e'$ (ASCII: `e == e'`)
by cases.

**Case 1:** When $e$ and $e'$ both have the same nonfunction type $T$,
they are extensionally equivalent when one of the following holds:
1. $e$ evaluates to a value $v$ and we have $e'\Longrightarrow v$
   (i.e., they both evaluate to the same value)
2. evaluation of $e$ raises an exception which is extensionally
   equivalent to the exception raised by evaluating $e'$
3. evaluation of $e$ and evaluation $e'$ both loop forever.

Observe these are disjoint situations.

**Case 2:** When $e$ and $e'$ are exceptions, they are extensionally
equivalent if (1) they are the same kind of exception and (2) they
have payloads which are extensionally equivalent (i.e., $e$ is `raise (en v)`
and $e'$ is `raise (en v')` and we have `v == v'` be extensionally
equivalent values).

**Case 3:** When $e$ and $e'$ are values whose type is a function type
$T\to T'$. Then for all values $v$ and $u$ of type $T$ such that they
are extensionally equivalent $v\cong u$ we have $e(u)\cong e'(v)$
_if and only if_ they are extensionally equivalent $e\cong e'$.

**Case 4:** When $e$ and $e'$ are _expressions_ whose type is a
function type $T\to T'$, then they are extensionally equivalent
functions if exactly one of the following three situations holds:

1. $e$ evaluates to a value $v$ and we have $e'\Longrightarrow v$
   (i.e., they both evaluate to the same function value and we use
   case 3 to establish this)
2. evaluation of $e$ raises an exception which is extensionally
   equivalent to the exception raised by evaluating $e'$
3. evaluation of $e$ and evaluation $e'$ both loop forever.

Observe these cases are disjoint, and cover all possible situations.
<br>(End of Definition 4)
</div>

## Typing Judgements

We use the usual ternary typing judgements in Standard ML
<span style="white-space: nowrap">$\Gamma\vdash e : T$</span> where
$\Gamma$ is a list of type declarations of the form
<span style="white-space: nowrap">$x : T$,</span> and $e$ is a Standard ML expression, and $T$ is a Standard ML
type.

We could describe a kind of Hindley--Milner type system for our
fragment of Standard ML, but we will not need it.

## References

These judgements were first introduced by [Dan Licata](https://dlicata.wescreates.wesleyan.edu/) and
[Bob Harper](https://www.cs.cmu.edu/~rwh/) used it when teaching 
[CS 150](http://www.cs.cmu.edu/~15150/) at Carnegie--Mellon University
in 2011,
and it has been perfected by subsequent professors.

