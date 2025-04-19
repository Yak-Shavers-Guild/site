---
title: About - YSG
---
<nav class="crumbs">
- [ysg](./index.html)
- about
</nav>

# About the Yak Shavers Guild

The Yak Shavers Guild is a study of how to implement proof assistants,
as literate programs (in Knuth's sense, but producing HTML artifacts
which you are reading).

The "big picture" resembles [Hilbert's programme](https://plato.stanford.edu/entries/hilbert-program/) in the foundations
of mathematics. The broad contours consists of the following steps:

1. We replace Hilbert's "finitary metatheory" with "a fragment of [Standard ML](./sml/index.md)".
2. We build a proof assistant called "Myo" based on intuitionistic
   HOL. The goal is to be able to reason about code written using our
   fragment of Standard ML (from step 1) with Myo, and possibly
   generate Standard ML code using Myo.
   
   These two steps constitute a "computational approximation" of the
   informal metatheory of Hilbert's programme.
3. We use Myo to build proof assistants for formalizing mathematics
   and prove properties about these proof assistants.

Schematically, we could doodle the plan as something like:

**Phase one:** with Standard ML, build a logical framework Myo, and
use it to build a HOL proof assistant and specifically a code
generation tool.

<table style="margin: 0 auto"><tbody>
<tr><th style="border: 1px solid">Code Generation</th><th></th><th></th></tr>
<tr><th style="border: 1px solid">HOL</th>
<th style="min-width:1rem">&nbsp;</th>
<th style="min-width:8rem"></th></tr>
<tr><th style="border: 1px solid" colspan="3">Bootstrap Myo (logical framework)</th></tr>
<tr><th style="border: 1px solid" colspan="3">Standard ML bedrock</th></tr>
</tbody></table>

**Phase two:** specify the behaviour of the logical framework in terms
of HOL, and use the code for Myo produced by the code generator module
in HOL. We reason about Myo using the HOL formalization of it.

We jettison the privional parts (in light gray text).

New components are written in green italicized bold text.

<table style="margin: 0 auto"><tbody>
<tr><th style="border: 1px solid; color: green; font-style: italic; font-weight:700">Myo-in-Myo</th><th></th><th></th></tr>
<tr><th style="border: 1px solid">Code Generation</th><th></th>
<th style="min-width:8rem"></th></tr>
<tr><th style="border: 1px solid">HOL</th>
<th style="min-width:1rem">&nbsp;</th>
<th style="min-width:8rem"></th></tr>
<tr><th style="border: 1px solid; color: green; font-style: italic; font-weight:700" colspan="3">Myo (logical framework)</th></tr>
<tr><th style="border: 1px solid; color: #888" colspan="3">Bootstrap Myo (logical framework)</th></tr>
<tr><th style="border: 1px solid; color: #888" colspan="3">Standard ML bedrock</th></tr>
</tbody></table>

**Phase three:** start investigating declarative proof styles.
This is specifically "working mathematics" (pure and applied
mathematics, not the foundations of mathematics, and certainly not programming).

<table style="margin: 0 auto"><tbody>
<tr><th style="border: 1px solid">Myo-in-Myo</th><th></th><th style="border: 1px solid; color: green; font-style: italic; font-weight:700">Working Mathematics</th></tr>
<tr><th style="border: 1px solid">Code Generation</th><th></th><th style="border: 1px solid; color: green; font-style: italic; font-weight:700">Axiomatic Set Theory</th></tr>
<tr><th style="border: 1px solid">HOL</th>
<th style="min-width:2rem">&nbsp;</th>
<th style="border: 1px solid; color: green; font-style: italic; font-weight:700">First-Order Logic</th></tr>
<tr><th style="border: 1px solid" colspan="3">Myo (logical framework)</th></tr>
<tr><th style="border: 1px solid; color: #888" colspan="3">Bootstrap Myo (logical framework)</th></tr>
<tr><th style="border: 1px solid; color: #888" colspan="3">Standard ML bedrock</th></tr>
</tbody></table>

Want to study what happens if we vary the axioms of the set theory
used to formalize mathematics? Or if we want to track the usage of the
axiom of choice? Or if we want to add proof steps? Or if we want to
follow Bourbaki and use [epsilon calculus](https://plato.stanford.edu/entries/epsilon-calculus/) instead of first-order logic?

One manner to study these questions has been sketched out in Markus
Wenzel's [PhD dissertation](https://mediatum.ub.tum.de/doc/601724/601724.pdf) (&sect;&sect;2--3): introduce an "abstract machine" for the
proof assistant which acts as the specification for the proof
assistant's behaviour. Then we prove that the code implements the
specification, and prove properties about the proof assistant from the
abstract machine.

This requires both "stacks" in the diagram describing "phase three":
"HOL + code generation" allows us to program proof assistants and
prove properties about them, then the "Set theory" tower describes the
different foundations for the Working Mathematician.

## Inspirations

This project is motivated from Hilbert's programme broadly.

**Links.** How we're implementing it as a website which links
identifiers back to their definitions (all the way back to Standard
ML's "basis" [prelude] library) was heavily inspired by
[Emacs's](https://www.gnu.org/software/emacs/manual/html_node/emacs/Looking-Up-Identifiers.html)
<kbd>M-.</kbd> taking the user to the definition of identifiers all
the way back to the C code.

This useful quality has been appreciated elsewhere. As Martin Escardo
[wrote](https://mathstodon.xyz/@MartinEscardo/114236504243093715) on Mathstodon:

> The great virtue proof assistants, more than verifying correctness, is the ability to organize mathematical knowledge so that it is recorded and can be inspected to any level of detail by just following links.

**Using a logical framework.** The basic 3-language strategy (use (1) a programming language to build
(2) a logical framework to implement (3) a proof assistant) was
proposed in Robert Pollack's "On extensibility of proof checkers" (in
Dybjer, Nordström, and Smith (eds),
<cite>International Workshop on Types for Proofs and Programs</cite> TYPES
1994, Springer, pp. 140-161, [`doi:10.1007/3-540-60579-7_8`](https://doi.org/10.1007/3-540-60579-7_8)). 

**Exploring Mizar-like proof languages.**
But it stemmed from trying to explore [Mizar](https://mizar.uwb.edu.pl/)-like declarative style
proof assistants, and see how we could support "variations of the axioms"
(like using Feferman universes instead of Grothendieck universes).

Using the "usual mathematical language" for proofs is a natural and
desirable quality, which has not been adequately explored. In the same
thread I cited earlier, Martin Escardo [writes](https://mathstodon.xyz/@MartinEscardo/114242173963261741):

> One open question, regarding proof assistants, is whether they will change in the way of accepting proofs written in a more natural language, or whether people will get used to the kind of language currently used, or something in between.
> 
> What I observe is that students (both UG and PhD), from both mathematics and computer science departments, are very quick to absorb the current existing languages and effectively use them. But this is a different story for older mathematicians who are exploring this new territory.
> 
> Personally, I wish the languages used by proof assistants evolve to look more like the language we use in mathematical prose. But this may be because I am old enough.

**Exploring the Metatheory.**
It'd be nice to reason about the metatheory of a Mizar-like proof
assistant. [Isabelle](https://isabelle.in.tum.de/) is an
extraordinarily extensible logical framework (which acts like an
"engine" for emulating deductive systems), but it is not a
_metalogical_ framework (which allows us to _reason about_ deductive
systems, i.e., prove metatheoretic properties about a deductive
system). HOL is a metalogical framework.

A similar project is Cezary Kaliszyk and Karol Pąk's Isabelle/Mizar
research programme. Many of the papers reporting results concerning
Isabelle/Mizar may be found on [Karol Pąk's homepage](https://alioth.uwb.edu.pl/~pakkarol/publications.php).

**Other software: Emacs and Smalltalk.**
Daniel de Haas's observations about
[what Emacs got right](https://danielde.dev/blog/what-emacs-got-right)
is applicable to our endeavour, as is Smalltalk's "extreme" philosophy
(where "you live in the program" --- see Ralf Johnson's 
[Smalltalk is different](http://perchta.fit.vutbr.cz/smalltalk/7)).

## Languages as Ontological Committment

The basic idea underlying the presentation: everything is built out of
[languages](intro/language.md). Philosophers would say we are taking
languages as an [ontological committment](https://plato.stanford.edu/entries/ontological-commitment/),
i.e., it's the basic "building block" for our endeavours.
"It's [languages all the way down](https://en.wikipedia.org/wiki/Turtles_all_the_way_down)."

We start with an informal metalanguage (English), describe a formal
metalanguage ([Standard ML](sml/index.md)), and use it to construct proof assistants.

After all, we will be describing one language after another,
implementing interpreters for one language after another.

Isn't this just an [infinite regression](https://plato.stanford.edu/entries/infinite-regress/)
of languages? Well, no, I assume the reader knows English already and
some mathematical maturity. That is to say, there is some "ground" for
the turtles to stand on.

## FAQ

Let's be serious, no one is reading this site. But here's some
questions people would ask (if anyone did read this site).

### What about Yak Shaving?

This may sound all well and fine, but what gives with the name of this
effort ("the Yak Shavers Guild")?

Well, we need to implement tools for producing this website as a
literate program (`tangle-md` extracts code from Markdown files, and
`md` produces HTML from Markdown files).

We need a suitable collection of libraries which are not present in
Standard ML: an XUnit-style testing framework (`sml-xunit`),
persistent binary search trees (`sml-bst`), parsers, and so on.

Once we've implemented Myo, we need to circle back to prove the
correctness of these libraries.

But once we're done, there are "obvious" problems that plagues us: how
do we know the computer's circuitry is "correct"? Or that the Standard
ML compiler satisfies the formal Definition for the language?

Well, we will have built the tools to answer these questions. 

### Why Standard ML?

Several reasons:

1. **Nastalgia.** The "primordial" ML language was introduced for the
   LCF family of proof assistants.
2. **Rigor.**
   "Primordial" ML diverged into the CAML (later becoming OCaml) and
   Standard ML programming languages. But only Standard ML received a
   formal Definition. This degree of rigor is the second reason for using
   Standard ML.
   
   Other languages make it difficult to reason about, and anyone who's
   building proof assistants _wants to reason about stuff_.
3. **Small memory footprint.**
   Other statically-typed functional languages have a heavy memory
   footprint (I'm looking at you, Haskell). But Standard ML is so [Spartan](https://en.wiktionary.org/wiki/spartan#English)
   it might as well be called [Leonidas](https://en.wikipedia.org/wiki/Leonidas_I).
4. **Sufficiently simple language.**
   Standard ML is simple enough to learn, which lowers the barrier for
   readers, and simple enough to reason about.

Coincidentally, a program written in Standard ML (or any
statically-typed functional programming language) may be viewed as a
sequence of definitions of new functions and words. That is to say, we
are effectively building a dictionary atop a simple language. This
plays into the ontological committment of languages.

### Why not [other programming language]?

OCaml could ostensibly be a good alternative, but I dislike it's
double semicolon syntax and using `let` to bind everything.

Haskell is too memory intense and I can't get it to run on my
Raspberry Pi (so it's not portable).

C++ is not a programming language, it's a nuclear-powered way to shoot
yourself in the foot and then in the face. Trying to reason about C++
is like trying to hold back the sea by punching it.

Most imperative languages are difficult to reason with, so I won't
bother enumerating them all here.

This left the scales tipped heavily in favor of Standard ML.

### Why is the proof assistant called "Myo"?

This is a bit of a joke. I wrote about the [MYSTIC Challenge](https://pqnelson.github.io/2024/06/11/MYSTIC-challenge.html)
("Make Yourself a Simplified Toy Isabelle Clone Challenge"). Myo is an
attempt at solving it, to some degree.

And if you know Japanese Buddhism, you know [妙](https://en.wiktionary.org/wiki/%E5%A6%99#Japanese) (Jpn: _myō_) is the word for
"mystic". 

The word isn't used by any other proof assistant or programming
language, it's short enough to be used as a suffix (`file.myo`), and
it's memorable ("Mayo without the 'a'"). What more could you want for
a name?

<footer>
**[** [Back](./index.md) **]**
</footer>
