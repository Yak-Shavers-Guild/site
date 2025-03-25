---
title: Deductive Systems
---
<nav class="crumbs">
- [ysg](../index.html)
- [introduction](./index.md)
- deductive systems
</nav>

# Deductive Systems

The goal is to describe a foundations of Mathematics as a deductive
system, which just exchanges one undefined phrase for another.

The phrase "deductive system" is not well-defined, but we can offer a
definition which covers most foundations of Mathematics.

The intuition will be to describe a deductive system by (1) a
collection of "judgements", predicates in the [metalanguage](./language.html#object-and-metalanguage) about
sentences in the object language; and (2) a collection of axioms and
inference rules which tell us how to use judgements to form new
judgements.

## Judgements

The first ingredient in a deductive system are judgements. We offer
the following definition for us to get started:

<div class="proclaim definition">
**Definition 1:** _Judgement Form and Judgement_.<br>
Let $L_{\text{ob}}$ be an object language and $L_{\text{meta}}$ be a
metalanguage for $L_{\text{ob}}$.
We define a <dfn>Judgement Form</dfn> is a predicate in the
metalanguage $L_{\text{meta}}$.

When a judgement form is applied to words in the object language, we
obtain a <dfn>Judgement</dfn> or proposition in the metalanguage.
<br>(End of Definition 1)
</div>

<div class="proclaim remark">
**Remark:** _Spelling of 'judgement'_.<br>
Note that we will be adopting the convention that Courts of Law issue
_judgments_ with only one 'e', whereas we will work with lesser
'judgements' with two 'e' letters.
<br>(End of Remark)
</div>

The idea is that we're taking elements of the object language and
_judge_ them to satisfy some property (expressed in the metalanguage)
or stand in some relation to one another (again, expressed in the
metalanguage).

One family of judgement form which is useful is to check if we can
attach a label $\ell$ to a word $w$. This underpins type theory.

Another family of judgement form which computer scientists use asserts
an expression $e$ can be evaluated to produce an expression $e'$ in
finitely many steps.

Logicians would recognize the judgement form asserting that a
proposition is true. Each proof calculus has its own _distinct_
version of this judgement form.

A common typographical convention is to use sans serif font when
writing the Judgement form.

For example, the judgement
"$P~\mathsf{true}$" asserts the formula $P$ in the object language is
true.

Or "$w~\mathsf{has\ label}~\ell$" for the judgement that word $w$ can
labeled with the label $\ell$.

But other times the notation is "grandfathered in". For example,
evaluating expressions is usually written "$e\to e'$" even though $\to$
is a symbol in the metalanguage.

## Inference Rules

The second ingredient to deductive systems tell us how to use judgements.

<div class="proclaim definition">
**Definition 2:** _Inference rules_.<br>
Let $J$, $J_{1}$, ..., $J_{n}$ be judgement forms where $n\geq0$ is a
non-negative number.
We define an <dfn>Inference Rule</dfn> (or "Rule of Inference") to be
an $(n+1)$-ary second-order predicate written
\[\frac{J_{1}\quad\cdots\quad J_{n}}{J}\hbox{rule name}\]
The name for the rule is written to the right. We call:
- the horizontal line the "inference line";
- the judgements above the inference line $J_{1}$, ..., $J_{n}$ are
  called "premises"
- the judgement $J$ below the inference line is the "conclusion".

The rule for working with inference rules: the conclusion holds
whenever all the premises hold. That is to say, the premises must be
_sufficient_.

Further, if there are any metavariables (variables in the
metalanguage) parametrizing the judgement forms, then we call this a
<dfn>Schema</dfn> or <dfn>Scheme</dfn>. When a schema is applied to
phrases from the object language, we call the result an
<dfn>Instantiation</dfn> (or "instance") of the schema.

When there are $n=0$ premises, we call the inference rule either an
<dfn>Axiom</dfn> (or if there are metavariables present, an <dfn>Axiom Schema</dfn>).
<br>(End of Definition 2)
</div>

<div class="proclaim example">
**Example 2.1:** The familiar [modus ponens](https://en.wikipedia.org/wiki/Modus_ponens)
is an inference rule schema in most proof calculi for logic
\[\frac{(A\implies B)\mathsf{true},\quad A~\mathsf{true}}{B~\mathsf{true}}\hbox{MP}(A,B)\]
where the rule name "MP" is explicitly parametrized by the
metavariables $A$ and $B$ ranging over the object language.
</div>

<div class="proclaim example">
**Example 2.2:** We can describe proof steps for formal proofs using
inference rules.

For example, the [Mizar](https://mizar.uwb.edu.pl/) proof step `let`
is an inference rule of the form
\[\frac{\Gamma,y\vdash P[y]~\mathsf{true}}{\Gamma\vdash\forall x,P[x]~\mathsf{true}}~\mathtt{let}~y\]
where the judgements are of the form $\Gamma\vdash\varphi~\mathsf{true}$
for some finite list of formulas $\Gamma$ and a formula $\varphi$,
and interpreted as "Assuming the formulas appearing in $\Gamma$ are
all true, then we have $\varphi$ also be true".
</div>

...

That's enough examples for the moment.

We see that these examples suggest an inference rule tells us _how to use_
our object language. Modus ponens tells us how to use the implication
connective in the object language. This gives _meaning_ to the object
language, in the sense of Wittgenstein's "the meaning of a word is its
use in the language".

We can compose inference rules to form a _tree_ describing "legal"
judgements.

<div class="proclaim definition">
**Definition 3:** _Derivation trees_.<br>
In a system of judgements and inference rules, a <dfn>Derivation</dfn>
is inductively defined by:
1. If we have an axiom $\displaystyle\frac{}{J}$, then it is also a
   derivation of $J$
2. If we have an inference rule
   \[\frac{J_{1}\quad\cdots\quad J_{n}}{J}\]
   and if $\mathcal{D}_{1}$ is a derivation of $J_{1}$, ...,
   and $\mathcal{D}_{n}$ is a derivation of $J_{n}$, then we may form
   a derivation of $J$ written as
   \[\frac{\mathcal{D}_{1},\quad\cdots\quad\mathcal{D}_{n}}{J}\]

Informally, these derivations provide _evidence_ for its conclusion
$J$ (and most Mathematicians recognize these as "proof trees").
<br>(End of Definition 3)
</div>

## Hypothetical Judgements

<div class="proclaim definition">
**Definition 4:** _Derivable judgements_.<br>
In a system of judgements and inference rules $\mathcal{R}$,
a <dfn>Derivable Judgement</dfn>
$J$ is any judgement such that there exists a derivation $\mathcal{D}$
for it.

The notation to indicate that $J$ is a derivable judgement is
\[\vdash_{\mathcal{R}}J\]
and if the system of inference rules is clear from context, we can
just write $\vdash J$ instead.
<br>(End of Definition 4)
</div>

In logic, a derivable judgement is better known as "provable" (since
we only know there exists a derivation, and we don't necessarily
_have_ a derivation).

<div class="proclaim remark">
**Remark:** _Turnstile notation_.<br>
The symbol $\vdash$ is called the turnstile. Frege introduced it in
his <cite class="book">Begriffsschrift</cite> and then Russell and
Whitehead incorporated it in <cite class="book">Principia Mathematica</cite>.
Then it was grandfathered into Mathematical Logic.

Unfortunately, it is also one of the most overloaded symbols in the
Foundations of Mathematics. Care must be taken when encountering
turnstiles "in the wild".
<br>(End of Remark)
</div>

<div class="proclaim definition">
**Definition 5:** _Hypothetical Judgements and Validity_.<br>
In a system $\mathcal{R}$ of judgements and inference rules,
let $J_{1}$, ..., $J_{n}$ be $n\geq0$ judgements and let $J$ be a
judgement. We define a <dfn>Hypothetical Judgement</dfn>, denoted
$J_{1},\cdots,J_{n}\vdash_{\mathcal{R}}J$, to reflect the assertion
there exists a derivation $\mathcal{D}$ of $J$ using the modified
system with inference rules 
\[\mathcal{R}' = \{\frac{}{J_{1}},\dots,\frac{}{J_{n}}\}\cup\mathcal{R}\]
obtained by adding axioms for $J_{1}$, ..., $J_{n}$.

When we have a derivation $\mathcal{D}$ in our hands (not just our
heads) for the hypothetical judgement $J_{1},\dots,J_{n}\vdash_{\mathcal{R}} J$ then
we call the hypothetical judgement <dfn>Valid</dfn> (in analogy to the
situation in logic where a valid argument properly applies inference
rules, but may not have true premises).

Observe when $n=0$ we recover the notion of a "derivable judgement".
<br>(End of Definition 5)
</div>

The main properties which can be proven for hypothetical judgements
include
- Reflexivity: for any list of judgements $\Gamma$, for any judgement
  $J$, we have $\Gamma,J\vdash J$
- Transitivity: for any list of judgements $\Gamma$, for any judgements
  $J$ and $K$, if we have $\Gamma,J\vdash K$ and also $\Gamma\vdash J$,
  then we have $\Gamma\vdash K$
- Weakening: for any list of judgements $\Gamma$, for any judgements
  $J$ and $K$, if we have $\Gamma\vdash J$,
  then we also have $\Gamma,K\vdash J$ --- i.e., "adding unnecessary
  hypotheses changes nothing"
- Stability: let $\mathcal{R}$ and $\mathcal{R}'$ are finite sets of
  inference rules.
  1. If $\vdash_{\mathcal{R}}J$ is a derivable judgement,
     then $\vdash_{\mathcal{R}\cup\mathcal{R}'}J$ is a derivable
     judgement.
  2. For any finite list of judgements $\Gamma$,
     if $\Gamma\vdash_{\mathcal{R}}J$ is a hypothetical judgement,
     then $\Gamma\vdash_{\mathcal{R}\cup\mathcal{R}'}J$ is a
     hypothetical judgement.

All these results combine to tell us a valid derivable judgement
$\vdash_{\mathcal{R}}J$ is valid in the family of systems with
inference rules $\mathcal{R}\cup\mathcal{R}'$ obtained by adjoining
more inference rules.

It is natural to ask: which inference rules $\mathcal{R}'$ will leave
the set of valid derivable judgements invariant?

## Derivable and Admissible Inference Rules

<div class="proclaim definition">
**Definition 6:** _Derivable inference rules_.<br>
Let $\mathcal{J}$ be a finite list of judgement forms and
$\mathcal{R}$ a finite set of inference rule schemas.
We call an inference rule
\[\frac{J_{1}\quad\cdots\quad J_{n}}{J}\]
a <dfn>Derivable Inference Rule</dfn> (or "deducible inference rule")
if there exists a valid hypothetical judgement $J_{1},\cdots,J_{n}\vdash_{\mathcal{R}}J$.
<br>(End of Definition 6)
</div>

If we want to _prove_ an inference rule is derivable, then we need to
prove the associated hypothetical judgement is valid. That amounts to
finding a derivation using the augmented inference rules $\mathcal{R}'=\{\overline{J_{1}},\dots,\overline{J_{n}}\}\cup\mathcal{R}$.

We should think of a derivable inference rule as an "abbreviation" for
a derivation.

<div class="proclaim theorem">
**Theorem 7:** _Adjoining derivable inference rules is safe_.<br>
Let $R$ be a derivable inference rule relative to the system of
judgements $\mathcal{J}$ and inference rules $\mathcal{R}$.
Then any derivable judgement $\vdash_{\mathcal{R}}J$ is valid if and
only if $\vdash_{\mathcal{R}\cup\{R\}}J$ is valid.

Conversely, any derivable judgement $\vdash_{\mathcal{R}\cup\{R\}}J$
is valid if and only if $\vdash_{\mathcal{R}}J$ is valid.
<br>(End of Theorem 7)
</div>

Or more succinctly, derivable inference rules do not affect valid
derivable judgements.

Is this the only way to leave the set of valid derivable judgements
invariant?

There's another way we could do this: if we can demonstrate that given
any derivations for all the premises of a proposed inference rule,
then there exists a derivation of its conclusion. That is to say,
given evidence the premise holds, we can construct evidence for the
conclusion to hold. This gives us the following definition.

<div class="proclaim definition">
**Definition 8:** _Admissible inference rules_<br>
Let $\mathcal{J}$ be a finite list of judgement forms and
$\mathcal{R}$ a finite set of inference rule schemas.
We call an inference rule
\[\frac{J_{1}\quad\cdots\quad J_{n}}{J}\]
a <dfn>Admissible Inference Rule</dfn> (or a "sound inference rule")
if whenever we have derivations $\mathcal{D}_{1}$ of $J_{1}$, ...,
and $\mathcal{D}_{n}$ of $J_{n}$,
then there exists a derivation $\mathcal{D}$ of $J$.
<br>(End of Definition 8)
</div>

Observe if one of the premises $J_{i}$ is always false, then the
inference rule is vacuously admissible. But this is not terribly
interesting. 

We can also observe that every derivable inference rule is also an
admissible inference rule. This tells us that admissible inference rules
_generalize_ the notion of derivable inference rules.

However, not every admissible inference rule is a derivable inference rule.
A counter-example: Harrop's rule in Intuitionistic Logic is admissible
but not derivable.

An analogous result as Theorem 7 holds for admissible inference rules.
We will not get bogged down with this, but the interested reader can
consult the first chapter of Bob Harper's 
<cite class="book">Practical Foundations for Programming Languages</cite>
(Second ed., CUP, 2016) for the discussion and proof.

## Deductive Systems

Some people define:
1. A "Deductive System" to consist of a system of judgement forms and inference rules. That's it, nothing more.
2. A "Formal System" is a deductive system such that we may equip it with an "effective" procedure for generating valid derivations in a technical sense (we have a Turing machine capable of doing this).

Depending on the strength of the metatheory, it may not be possible to
have an effective method producing derivations.

Why is there this requirement of some "effective" procedure yielding
derivations? It has its roots tracing back to [Hilbert's programme](https://plato.stanford.edu/entries/hilbert-program/)
where we work with a "finitary metatheory" and encode judgements as
"arithmetical equations" in the finitary metatheory. Hilbert's system
had only one inference rule, so there was only one way to generate new
results from old.

When Gödel proved his incompleteness theorems, his results concerned
Formal Systems in this technical sense (which was _effectively_ the
last nail in the coffin for Hilbert's programme).

### Metatheory

It's common to refer to the metalanguage employed in describing a
deductive system as the <dfn>metatheory</dfn>.

Confusingly, it's also common to refer to the theorems proven about a
particular "object logic" as the _metatheory_ of the (object)
logic. The theorems are called <dfn>Metatheorems</dfn>.

Care must be taken when encountering this terminology.

We will consistently use the former sense of "metatheory" (to describe
the metalanguage of a deductive system).

## Concluding Remarks

We may describe deductive systems (judgements, inference rules, etc.)
using category theory. For a review on this subject, see (for example)
Greta Coraglia and Ivan Di Liberti's "Context, Judgement, Deduction" ([arXiv:2111.09438](https://arxiv.org/abs/2111.09438)).

Computer scientists have developed a rich family of judgements for
reasoning about computer programs. Bob Harper's 
<cite class="book">Practical Foundations for Programming Languages</cite>
(Second ed., CUP, 2016) explores this in rigorous detail.

We can describe programming languages using deductive systems.

We can use these to prove properties about computer programs written
in these languages.

That's one of the goals for our Yak Shaving endeavour.

### History

The notion of a "judgement" in logic can be traced back to Immanuel Kant.
Frege borrowed it for his work on logic and the foundations of
Mathematics, and then it continued on implicitly in Mathematical Logic 
throughout the 20th century.

Hegel's <cite class="book">Science of Logic</cite> (vol. II, part 1,
chapter 2) points out that the etymology of "judgement" [German:
_Urteil_] reflects the primary ["_Erste_", forming prefixes "_Er-_" or "_Ur-_"]
role as a building block in deduction, while simultaneously having a
clear division ["_Teilung_"] into subject and "existing in _someone's_
head" a predicate. This means Hegel was probably the first person to
recognize judgement forms are predicates in the metalanguage, and said
it as obscurantistically as possible.

Russell and Whitehead's <cite class="book">Principia Mathematica</cite> 
(CUP, 1910) called judgements "assertions".

Per Martin-Löf's work (starting with his 1984 lectures on
Intuitionistic Type Theory) introduced judgements as we would now
recognize them.

## Exercises

1. Think about how to describe a grammar as a deductive system.
   (Hint: have judgements for "the following string `s` belongs to the
   syntactic category `<cat>`" and another judgement for production
   rules, as well as a judgement that a string is "well-formed" in the
   sense that it belongs to the generated grammar.)
2. We can think of a **proof calculus** for logic as a deductive
   system with the judgement $\varphi~\mathsf{true}$ which is usually
   just abbreviated to the formulas themselves (or worse, written as
   <span style="white-space: nowrap">$\vdash\varphi$</span>). The crucial connective is implication, which
   allows us to transform <span style="white-space: nowrap">$\alpha,\beta\vdash\gamma$</span> to
   <span style="white-space: nowrap">$\alpha\vdash\beta\implies\gamma$</span> and vice-versa.
3. If we have two deductive systems, is there a natural "morphism"
   from one to the other? Is there a way to take the "product" of
   deductive systems? In short, is there a way to describe deductive
   systems using category theory?
4. A **logical framework** is a deductive system capable of
   representing deductive systems. You don't need much to have a
   logical framework (for example, first-order logic works: judgements
   are predicates, and an inference rule is just the conjunction of
   the premises implies the conclusion).
   
   - What's a more rigorous definition of a logical framework?
   - Is first-order logic really an adequate system for acting like a
     logical framework? (Hint: think about encoding propositional
     logic, how would this be done? Must we need sets?)
   - Can some fragment of Peano arithmetic or Heyting suffice as a
     logical framework? (This was part of Hilbert's programme; hint:
     look at [PRA](https://en.wikipedia.org/wiki/Primitive_recursive_arithmetic))
   - Can we prove properties about a deductive system in a logical
     framework? (Hint: think about the previous situation where
     a fragment of arithmetic is the logical framework.)
5. Our presentation of deductive systems is two-dimensional (inference
   rules is two-dimensional). Can you come up with a formal language
   for deductive systems?
6. Since Hilbert's programme in the 1920s, we typically work with a
   finitary metatheory --- the metalanguage used when working with
   deductive systems is "finitistic" and Intuitionistic (in the sense
   of [Brouwer](https://en.wikipedia.org/wiki/L._E._J._Brouwer)'s
   Intuitionism).
   - Research Feferman's $\mathsf{FS}_{0}$ set theory as a finitary
     metatheory for deductive systems. See Feferman's "Finitary
     inductively presented logics"
     ([eprint](https://virtualmath1.stanford.edu/~feferman/papers/presentedlogics.pdf))
     and Séan Matthews's "A Theory and its Metatheory in $\mathsf{FS}_{0}$" ([eprint](https://pure.mpg.de/rest/items/item_1834288_2/component/file_1857794/content)) for further details.
     Write an essay summarizing how
     to use it to describe a deductive system, as well as its positive
     and negative qualities.
   - If we consider a programming language instead of a finitary
     metatheory, what could possibly go wrong?


<footer>
**[** [Back](./index.md) **]**
</footer>
