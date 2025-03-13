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

1. We replace Hilbert's "finitary metatheory" with "a fragment of Standard ML".
2. We build a proof assistant called "Myo" based on intuitionistic
   HOL. The goal is to be able to reason about code written using our
   fragment of Standard ML (from step 1) with Myo, and possibly
   generate Standard ML code using Myo.
   
   These two steps constitute a "computational approximation" of the
   informal metatheory of Hilbert's programme.
3. We use Myo to build proof assistants for formalizing mathematics
   and prove properties about these proof assistants.

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

## Languages as Ontological Committment

The basic idea underlying the presentation: everything is built out of
languages. It's [languages all the way down](https://en.wikipedia.org/wiki/Turtles_all_the_way_down).

We start with an informal metalanguage (English), describe a formal
metalanguage (Standard ML), and use it to construct proof assistants.

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
