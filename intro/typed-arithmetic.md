---
title: Typed Arithmetic
---

# Typed Arithmetic

As a warmup to simply-typed lambda calculus, let us investigate Peano
arithmetic as a simple type system.

The steps involved when studying a type system (or a type theory) are
usually as follows:
1. Introduce the syntax --- every type theory has an underlying formal
   language to describe the expressions and types. The standard
   terminology in the literature is to call these expressions
   <dfn>Pseudo-Terms</dfn> (or _Pseudo-Expressions_)
2. Introduce the typing rules, which govern which pseudoterms are
   well-typed (morally that they are "meaningful"). Well-typed
   pseudoterms are called <dfn>Terms</dfn> (or _Expressions_)
3. Introduce other judgements (like evaluation), if there are any
4. Prove properties about the system

## Syntax

We will have Boolean expressions and numeric expressions. The standard
way we present the syntax is using a pseudo-BNF style grammar,
parametrized by metavariables.

We have pseudoexpressions described by the grammar (with metavariables
ranging over the syntactic categories, and informal comments flushed right):
\[\begin{array}{rclr}
e & ::= & & \hbox{pseudoexpressions}\\
& & \mathtt{true} & \hbox{constant true}\\
& & \mathtt{false} & \hbox{constant false}\\
& & \mathtt{if}~e~\mathtt{then}~e~\mathtt{else}~e & \hbox{conditional}\\
& & \mathtt{0} & \hbox{constant zero}\\
& & \mathtt{succ}~e & \hbox{successor}\\
& & \mathtt{pred}~e & \hbox{predecessor}\\
& & \mathtt{isZero}~e & \hbox{test for zero}
\end{array}\]
Observe that this allows strings like "`succ false`" to be considered
grammatically well-formed. And, they are _grammatically_
correct. They're just "meaningless". Types will fix this for us, but
we will get there in a moment.

We should also introduce the grammar for values, which allows us to
determine which expressions cannot be evaluated any further:
\[\begin{array}{rclr}
nv & ::= & & \hbox{numeric values}\\
& & \mathtt{0} & \hbox{value zero}\\
& & \mathtt{succ}~nv & \hbox{successor of value}\\
v & ::= & & \hbox{values}\\
& & nv & \hbox{numeric values} \\
& & \mathtt{true} & \hbox{value true}\\
& & \mathtt{false} & \hbox{value false}
\end{array}\]
What about, say, addition or multiplication? We can _define_ them as
"abbreviating symbols", or introduce a rather complicated
"definitional mechanism" (which we will get to in another page).

We also have two labels or <dfn>Types</dfn> for our system. These
labels _have_ a syntax, since we will be writing them down and
affixing them to expressions. The grammar for them are simply two new strings:
\[\begin{array}{rclr}
T & ::= & & \hbox{types}\\
& & \mathtt{Bool} & \hbox{type of Booleans}\\
& & \mathtt{Nat} & \hbox{type of natural numbers}
\end{array}\]
Do types "live" in our underlying language or not? Well, if they did,
wouldn't they also be pseudoexpressions?

There are two ways to look at this:
1. Church's view: Types live in the language, but the language is
   partitioned into pseudoexpressions and types. (Most type theories
   follow this perspective.)
2. Curry's view: Types do not live in the language, they are just
   useful metalinguistic labels which are used before we evaluate
   things to weed out "bad expressions". (Most statically typed
   functional programming languages follow this philosophy, but allow
   optional type annotations.)

## Typing Judgements and Rules

We now introduce a typing judgement or relation. Typed arithmetic is
quite simple, but to be consistent with our future notation we will
denote this by $e : T$ where the colon is called the "esti
operator" (but few people care that much about its proper name, they
just read it as "The pseudoexpression $e$ has $T$ as its type").

<div class="proclaim remark">
**Remark:** _Origin of colon_<br>
The choice of colon for the esti operator appears to be traced back to
the Pascal programming language, or at least its creator Niklaus
Wirth. Early type theorists simply wrote the type as a subscript. Nick
de Bruijn used semicolon for the esti operator in his Automath proof
assistant. But Wirth's 1971 Pascal was the earliest instance of the
colon used as esti.

Also note that "esti" is the transliteration of the word "ἐστί" used by Peano in his <cite class="book">Arithmetices principia, nova methodo exposita</cite>
(1889), and probably used earlier in his notes.
<br>(End of Remark)
</div>

We have the following typing rules for Boolean expressions:
\[\begin{array}{cr}
\mathtt{true} : \mathtt{Bool} & \hbox{(T-True)}\\
\mathtt{false} : \mathtt{Bool} & \hbox{(T-False)}\\[12pt]
\displaystyle\frac{t_{1} : \mathtt{Bool},\quad t_{2} : T,\quad t_{3} : T}{(\mathtt{if}~t_{1}~\mathtt{then}~t_{2}~\mathtt{else}~t_{3}) : T} & \hbox{(T-If)}
\end{array}\]
...and for Natural Number expressions:
\[\begin{array}{cr}
\mathtt{0} : \mathtt{Nat} & \hbox{(T-Zero)}\\[12pt]
\displaystyle\frac{t_{1} : \mathtt{Nat}}{\mathtt{succ}\ t_{1} : \mathtt{Nat}} & \hbox{(T-Succ)}\\[12pt]
\displaystyle\frac{t_{1} : \mathtt{Nat}}{\mathtt{succ}\ t_{1} : \mathtt{Nat}} & \hbox{(T-Pred)}\\[12pt]
\displaystyle\frac{t_{1} : \mathtt{Nat}}{\mathtt{isZero}\ t_{1} : \mathtt{Bool}} & \hbox{(T-IsZero)}
\end{array}\]

<div class="proclaim definition">
**Definition 1:** _Typing relation of arithmetic pseudoexpressions_<br>
The <dfn>Typing Relation</dfn> for typed arithmetic is the smallest
binary relation (in the metalanguage) satisfying these rules and axioms.
<br>(End of Definition 1)
</div>

<div class="proclaim definition">
**Definition 2:** _Expressions_<br>
We call a pseudoexpression $e$ an <dfn>Expression</dfn> if there
exists a type $T$ such that we can derive $e : T$ from the typing rules.
<br>(End of Definition 2)
</div>

## Evaluation of Expressions

We can now introduce a judgement describing the evaluation of
well-typed _expressions_ written $e_{1}\to e_{2}$ (the notation varies
in the literature).

We have the following rules describing the evaluation of Boolean expressions:
\[\begin{array}{cr}
\displaystyle\frac{\quad t_{2} : T,\quad t_{3} : T}{(\mathtt{if}~\mathtt{true}~\mathtt{then}~t_{2}~\mathtt{else}~t_{3}) \to t_{2}} & \hbox{(E-IfTrue)}\\[12pt]
\displaystyle\frac{\quad t_{2} : T,\quad t_{3} : T}{(\mathtt{if}~\mathtt{false}~\mathtt{then}~t_{2}~\mathtt{else}~t_{3}) \to t_{3}} & \hbox{(E-IfFalse)}\\[12pt]
\displaystyle\frac{t_{1} : \mathtt{Bool},\quad t_{2} : T,\quad t_{3} : T,\quad t_{1}\to t_{1}'}{(\mathtt{if}~t_{1}~\mathtt{then}~t_{2}~\mathtt{else}~t_{3}) \to (\mathtt{if}~t_{1}'~\mathtt{then}~t_{2}~\mathtt{else}~t_{3})} & \hbox{(E-If)}
\end{array}\]
We have rules for evaluating numeric expressions:
\[\begin{array}{cr}
\displaystyle\frac{t_{1} : \mathtt{Nat},\quad t_{1}\to t_{1}'}{\mathtt{succ}~t_{1}\to\mathtt{succ}~t_{1}'} & \hbox{(E-Succ)}\\[12pt]
\displaystyle\frac{t_{1} : \mathtt{Nat},\quad t_{1}\to t_{1}'}{\mathtt{pred}~t_{1}\to\mathtt{pred}~t_{1}'} & \hbox{(E-Pred)}\\[12pt]
\displaystyle\frac{t_{1} : \mathtt{Nat},\quad t_{1}\to t_{1}'}{\mathtt{isZero}~t_{1}\to\mathtt{isZero}~t_{1}'} & \hbox{(E-IsZero)}\\[12pt]
\mathtt{pred}~\mathtt{0}\to\mathtt{0} & \hbox{(E-PredZero)}\\[12pt]
\displaystyle\frac{\mathtt{succ}~nv_{1} : \mathtt{Nat}}{\mathtt{pred}(\mathtt{succ}~nv_{1})\to nv_{1}} & \hbox{(E-PredSucc)}\\[12pt]
\mathtt{isZero~0}\to\mathtt{true} & \hbox{(E-IsZeroZero)}\\[12pt]
\displaystyle\frac{\mathtt{succ}~nv_{1} : \mathtt{Nat}}{\mathtt{isZero}(\mathtt{succ}~nv_{1})\to\mathtt{false}} & \hbox{(E-IsZeroSucc)}
\end{array}\]

<div class="proclaim definition">
**Definition 3:** _Evaluation Relation_<br>
We define the <dfn>Evaluation Relation</dfn> to be the smallest binary
relation in the metalanguage satisfying the preceding rules and axioms
governing the $\to$ judgement.
<br>(End of Definition 3)
</div>

When we define a relation by means of inference rules and axioms, we
will understand this is done by working with the smallest relation
satisfying the rules and axioms (and so we will not explicitly state
this in the future).

## Properties of the System

It's not hard to check that if $e : T$ and $e\to e'$ are both
derivable from these rules, then we also necessarily have $e' : T$ ---
that is to say, evaluation "preserves" the type. This should be one of
the first things we check (evaluation and typing "play nice together").

<div class="proclaim theorem">
**Theorem 4:** _Preservation_<br>
If $t : T$ and $t\to t'$, then we have $t' : T$.
<br>(End of Theorem 4)
</div>

<div class="proclaim theorem">
**Theorem 5:** _Progress_<br>
If $t$ is a well-typed term (i.e., there exists a type $T$ such that
$t : T$), then either $t$ is a value or there exists a $t'$ such that
$t\to t'$.
<br>(End of Theorem 5)
</div>

These two theorems together establish the <dfn>Soundness</dfn> of the
type system, which loosely mean that "Well-typed terms cannot 'go wrong'."

We can also check that the evaluation relation will produce values
when (repeatedly) applied finitely-many times to well-typed expressions.
This immediately follows from the progress theorem.

## References

This has probably been discussed in the literature in various
places. I relied upon Benjamin C. Pierce's <cite class="book">Types
and Programming Languages</cite> (MIT Press, 2002).
This has probably also been discussed in [Software Foundations](https://softwarefoundations.cis.upenn.edu/).

<footer>
**[** [Up](index.md) **]**
</footer>