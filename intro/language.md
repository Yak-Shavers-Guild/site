---
title: Language - YSG
---
<nav class="crumbs">
- [ysg](../index.html)
- [introduction](./index.md)
- language
</nav>

# Language

The notion of "language" plays a critical role in the foundations of
Mathematics since Frege's <cite class="book">Begriffsschrift</cite>,
if not earlier.

Unfortunately, "language" tends to be a vague notion at times, so let
us focus on trying to make the notion more precise.

There are two disjoint types of language: a natural language (like
English or Latin) and a formal language.

## Formal Language

Informally, a "formal language" may be understood as just "a set of words".
This would be like taking English as consisting of all the words
defined in the Oxford English dictionary.

Words are built out of "letters" --- most seven year-old children know
this as "spelling". The basic strategy for defining a formal language
follows this gambit.

### Alphabets and Strings

<div class="proclaim definition">
**Definition 1:** _Alphabet_<br>
An <dfn>Alphabet</dfn> consists of a nonempty set of 'letters' (or
'symbols', 'signs', etc.).
<br>(End of Definition 1)
</div>

What are some examples of alphabets?

**Example 1.1:** The "Latin alphabet" is an example of an alphabet
consisting of either 26 or 52 letters (depending on if we include both
lowercase and uppercase letters, or just lowercase letters, or just
uppercase letters). 

We will denote the set of 52 uppercase and lowercase Latin letters
as $\Sigma_{\text{Latin}}$.

**Example 1.2:** The collection of Chinese characters is another example
of an alphabet. This is an example of an "alphabet" which is not an
alphabet in the sense of natural language: Chinese characters consist
of ideograms ("standardized pictograms"). The Unicode encoding of
Chinese-Japense-Korean characters offers 97,680 entries in the
alphabet.

**Example 1.3:** The collection of digits written as Arabic numerals
forms a finite alphabet $\Sigma_{\text{Digits}}=\{0,1,2,3,4,5,6,7,8,9\}$.

Note we may abbreviate this as $\{0,1,\cdots,9\}$ when it is clear we
are enumerating all possibilities within an ordered range.

**Example 1.4:** Bourbaki's <cite class="book">Elements of Mathematics</cite>
develops a formal language for Mathematics using the alphabet
consisting of the set $\{\neg,\lor,\tau,\Box,\in,=,'\}\cup\Sigma_{\text{Latin}}\cup\{0,1,2,\cdots,9\}$ where
$\Sigma_{\text{Latin}}$ is the set of Latin letters.

Observe we can take the union of alphabets and we obtain again an
alphabet. The intersection of alphabets may or may not return an
alphabet (the intersection of two disjoint alphabets is not an alphabet).

This presentation for Bourbaki's formal language is a bit of a
simplification. Bourbaki included a complicated mechanism of linkages,
which is baroque by today's standards. We would instead use something
like de Bruijn indices for bound variables if we were doing it today.

**Puzzle:** How do we store an alphabet on the computer? Computers are
designed to crunch numbers, not wrangle text.

<div class="proclaim definition">
**Definition 2:** _Character encodings._<br>
Let $\Sigma$ be an alphabet. A <dfn>Character Encoding</dfn> of $\Sigma$
consists of an injective partial function $e\colon \mathbf{N}\rightharpoonup\Sigma$
where $\mathbf{N}\subseteq\mathbb{N}_{0}$ is either 
all of the natural numbers
(including zero) or there exists an $N_{\text{max}}\in\mathbb{N}$ such that every
number less than or equal to $N_{\text{max}}$ is an element of $\mathbf{N}$.

More explicitly regarding "injectiveness": for all $x,y\in\mathbf{N}$
if $e(x)=e(y)$, then either $e(x)$ and $e(y)$ are both undefined (and so
possibly $x\neq y$) or it is defined and $x=y$.
<br>(End of Definition 2)
</div>

**Example 2.1:** The [ASCII](https://en.wikipedia.org/wiki/ASCII)
character encoding emerged from the primordial swap of earlier
computer science. It encodes anything you'd like from a typewriter.

Here $N_{\text{max}}^{(\text{ASCII})}=127 = 2^{8}-1$, hence may be
encoded using an 8-bit integer.

**Example 2.2:** The [Unicode standard](https://www.unicode.org/main.html) 
offers several character encodings each with $N_{\text{max}}^{(\text{Uni})}=1\,112\,064$
possible symbols.

This is organized into 17 "planes", each plane consisting of
$2^{16}=65536$ symbols, minus the 2048 "surrogates". Lo and behold:
\[ 17\times65526 - 2048 = 1112064. \]
Note that Unicode 12.1 (finalized in May 2019) uses only 137,994 of
the possible 1,112,064 code points.

In practice, the UTF-8 encoding is "the way to go" when working with
the Unicode standard, but some programming languages use UTF-16 (e.g.,
Java). 

Now, where are we? Well, we have formalized the notion of an
"alphabet", now we just need to formalize a notion of "words". We do
this by just forming finite sequences of letters. But randomly
throwing letters together doesn't always form a word. So we introduce
a notion describing this more general _thing_:

<div class="proclaim definition">
**Definition 3:** _String over an alphabet_.<br>
Let $\Sigma$ be an alphabet. 
We define a <dfn>String</dfn> over $\Sigma$ to be a finite sequence
$a$ of letters from $\Sigma$.

We write $|a|$ for the <dfn>String Length</dfn> of $a$, which is the
length of the finite sequence.
<br>(End of Definition 3)
</div>

The convention is to write a string $a=(a_{1},a_{2},\dots,a_{n})$ as 
we would if we were just spelling: $a=a_{1}a_{2}\cdots a_{n}$.

**Abuse of notation:** It is common to treat letters $a_{1}\in\Sigma$
as strings of length 1 $(a_{1})$ written just as $a_{1}$. (End of
abusing notation)

Since I am assuming the reader has familiarity with sequences, we will
not prove this is well-defined (you should know finite sequences exist).

Linguists observed humans use "fragments" of words when working with
natural languages called [Morphemes](https://en.wikipedia.org/wiki/Morpheme).
Humans combine morphemes together to form words and sentences. This
strategy works well with strings, too. We just need a notion of
"combining strings together".

<div class="proclaim definition">
**Definition 4:** _String concatenation_.<br>
Let $\Sigma$ be an alphabet.
Let $a$ and $b$ be strings over $\Sigma$.
We define the <dfn>Concatenation</dfn> of $a$ followed by $b$ to
consist of a string $c$ over $\Sigma$ of length $|c|=|a|+|b|$ with
symbols
\begin{equation}
c_{i} = \begin{cases}a_{i} & \hbox{if }i\leq|a|\\
b_{i-|a|} & \hbox{otherwise}
\end{cases}
\end{equation}
For $a=a_{1}a_{2}\cdots a_{m}$ and $b=b_{1}b_{2}\cdots b_{n}$,
we find the first $m$ letters of $c$ are precisely those found in $a$
and the last $n$ letters of $c$ are precisely those found in $b$;
i.e., we have $c=a_{1}a_{2}\cdots a_{m}b_{1}b_{2}\cdots b_{n}$.

For this reason, we often just write $ab$ for the string concatenation
of $a$ followed by $b$.
<br>(End of Definition 4)
</div>

Now, we _could_ use the set of morphemes as an "alphabet" for a
language.

For example, we could take all the words defined in Webster's
dictionary as the "alphabet" and form strings by concatenating them
together to try to form sentences. This is basically what "Large
Language Models" attempt to do.

But for Mathematicians, it is more interesting to look at the
algebraic properties of string concatenation. We have a fun result:

<div class="proclaim theorem" id="string-monoid">
**Theorem 5:** _String concatenation is associative and has a unit_.<br>
Let $\Sigma$ be an alphabet.

1. String concatenation is associative: For any strings $a$, $b$, $c$
   over $\Sigma$ we have $(ab)c=a(bc)$.
2. Empty string is identity element for string concatenation: for any
   string $a$ over $\Sigma$ and the empty string $\varepsilon$ over
   $\Sigma$ (which consists of zero letters), we have
   $a\varepsilon=\varepsilon a=a$.

That is to say, the set of strings over $\Sigma$ equipped with string
concatenation as a binary operator forms a [monoid](https://en.wikipedia.org/wiki/Monoid).
<br>(End of Theorem 5)
</div>

Mathematicians will recognize the set of _all_ strings over $\Sigma$
to be the _free monoid_ generated by $\Sigma$. It's a neat fact which
will be useful much later on.

<div class="proclaim definition">
**Definition 6:** _Iterates of a set of strings_.<br>
Let $\Sigma$ be an alphabet and let $A$ be a set of strings over
$\Sigma$.
We inductively define <dfn>Iterates</dfn> of $A$ to be the sets
denoted by $A^{n}$ where $n$ is a non-negative integer such that

- $A^{0}=\{\varepsilon\}$ consists just of the empty string over
  $\Sigma$
- $A^{n+1}=\{ab\mid a\in A,b\in A^{n}\}$

Observe that $A^{1}=A$.
<br>(End of Definition 6)
</div>

We will frequently want to take _all_ the iterates of a set of
strings, possibly discarding the empty string. This occurs so
frequently, we have a name for it.

<div class="proclaim definition">
**Definition 7:** _Kleene star and plus_.<br>
Let $\Sigma$ be an alphabet, let $A$ be a set of strings over
$\Sigma$.
We define the <dfn>Kleene Plus</dfn> of $A$ to consist of the set of
strings over $\Sigma$ defined as the set of all positive power iterates:
\begin{equation}
A^{+} = \bigcup_{n\in\mathbb{N}} A^{n} = A^{1} \cup A^{2} \cup\cdots.
\end{equation}

We similarly define the <dfn>Kleene Star</dfn> of $A$ to consist of
the set of strings over $\Sigma$ equal to the set of all iterates of $A$:
\begin{equation}
A^{*} = \bigcup_{n\in\mathbb{N}_{0}} A^{n} = A^{0}\cup A^{+}.
\end{equation}
It is common to abuse notation to write 
$\Sigma^{*}$ for the set of all strings over $\Sigma$.
<br>(End of Definition 7)
</div>

### Formal Languages and Grammars

We now have enough notions defined for us to turn our focus towards
languages. 

<div class="proclaim definition">
**Definition 8:** _Formal languages_.<br>
Let $\Sigma$ be an alphabet. We define a <dfn>Formal Language</dfn>
over $\Sigma$ to be some set $L$ of strings over $\Sigma$,
that is to say: $L\subseteq\Sigma^{*}$.

If we refer to elements of the alphabet $\Sigma$ as "letters", then we
call elements of the language $L$ <dfn>Words</dfn>.

We may also refer to a subset $L_{\text{sub}}\subseteq L$ as a
<dfn>Sublanguage</dfn> of $L$, and we see that it is also a language
over $\Sigma$.
<br>(End of Definition 8)
</div>

There's nothing magical here about a formal language...which is
good. When the magic disappears, it's because we understand the thing.

**Example 8.1:** We could define "Webster English" as the formal
language over $\Sigma_{\text{Latin}}$ consisting of all words which
are defined in Webster's dictionary.

More generally, one manner of defining a formal language over a given
alphabet is to literally enumerate all words in the language. This is
usually infeasible practically.

**Example 8.2:** Any programming language is also a formal
language. Its alphabet corresponds to the character encoding usually
provided by ASCII or Unicode.

**Example 8.3:** Consider the alphabet $\Sigma=\{=,+,-,\times,/,(,)\}\cup\Sigma_{\text{Digits}}$
(where we introduced $\Sigma_{\text{Digits}}$ back in Example 1.3).
We could consider the sublanguage $L_{\text{num}} = (\{1,2,\cdots,9\}\Sigma_{\text{Digits}}^{*})\cup\{0\}$
which consists of non-negative numbers written as Arabic numerals.

We also have the sublanguage of binary operators $L_{\text{op}}=\{+,-,\times,/\}$.

We can form the family of sublanguages $L_{k,\text{pexp}}$ by
inductively defining it as:
- $L_{0,\text{pexp}}=L_{\text{num}}$
- $L_{k+1,\text{pexp}}=\bigcup_{0\leq j\leq k} \{(\}L_{j,\text{pexp}}\{)\}L_{\text{op}}\{(\}L_{k-j,\text{pexp}}\{)\}$

These $L_{k,\text{pexp}}$ sublanguages are just arithmetical
expressions with $k$ binary operators and parentheses inserted
around subexpressions for "clarity". Then we form the language of
arithmetical expression by taking:
\begin{equation}
L_{\text{pexp}} = \bigcup_{k\in\mathbb{N}_{0}}L_{k,\text{pexp}}.
\end{equation}
This allows for _any finite number_ of binary operators to appear in
an expression.

Similarly, we could assemble all possible "equations" by writing
$L_{\text{eqns}}=L_{\text{pexp}}\{=\}L_{\text{pexp}}$. These include
false formulas like $3=2$. We include these in the language so we may
speak of both correct and incorrect equations --- errors are in fact
"speakable". 

This approach generalizes to give us a way to _construct_ a language
out of sublanguages (of sorts). We define a language by offering rules for
constructing the words in the language. Constructing words from letters
uses a tool called a "grammar" stemming from the Greek
γραμματικὴ τέχνη (_grammatikḕ téchnē_) meaning "the art of [writing] letters".

<div class="proclaim definition">
**Definition 9:** _Formal grammar_.<br>
A <dfn>Formal Grammar</dfn> $G$ consists of
- a nonempty set of <dfn>Terminal Symbols</dfn> $\Sigma$
- a nonempty set of <dfn>Nonterminal Symbols</dfn> $N$ (also called
  "syntactic categories")

equipped with
- a special <dfn>Start Symbol</dfn> $S\in N$
- a nonempty set of <dfn>Production Rules</dfn> $P\subset((\Sigma\cup N)^{*}N(\Sigma\cup N)^{*})\times(\Sigma\cup N)^{*}$

such that
- the terminal and nonterminal symbols are drawn from different
  alphabets $N^{+}\cap\Sigma^{+}=\emptyset$.

Also note that we will refer to $V=N\cup\Sigma$ as the <dfn>Vocabulary</dfn>
of the grammar $G$.
<br>(End of Definition 9)
</div>

If we have a grammar $G$, then compiler textbooks will often write it
as a tuple $G=(\Sigma,N,S,P)$. Just be prepared for that if you refer
to any textbooks on writing a compiler or interpreter.

If we have a production rule $(\alpha,\beta)\in P$, then it is common
to write this as either $\alpha\to\beta$ or $\alpha ::= \beta$. We
read this as "We may replace $\alpha$ with $\beta$". The nonterminal
symbols are viewed as placeholders for morphemes in the language
generated by the grammar.

Also be warned: there may be multiple production rules in the grammar
of the form $\alpha\to\beta_{1}$, $\alpha\to\beta_{2}$, ...,
$\alpha\to\beta_{n}$. These are different possible chocies for
rewriting $\alpha$. The conventional notation is to write this as
\begin{equation}
\alpha\to\beta_{1}\mid\cdots\mid\beta_{n}
\end{equation}
where the vertical lines "$\mid$" is read as "...or...".

<div class="proclaim remark">
**Remark:** _Backus-Naur Form for Grammars_.<br>
Computer scientists have devised a way to write formal grammars as
follows:
- nonterminal symbols are any sequence of letters, numbers, or symbols
  except angled brackets, surrounded in angled brackets `<example nonterminal>`,
- terminal symbols are any sequence of letters, numbers, or symbols,
  written inside double quotes or single quotes (e.g.,
  `"terminal symbol"`); and if we want double quotes in the terminal
  symbol, we can either "escape" it by writing a backslash before it
  (`"a \"terminal\" symbol"`) or use single quotes (`'a "terminal" symbol'`)
- production rules are written $\alpha ::= \beta_{1}\mid\cdots\mid\beta_{n}$

This is especially useful when every production rule has only a
nonterminal symbol on the right-hand side; i.e., when $P\subset N\times V^{*}$.
Linguists call such a grammar a <dfn>Context-Free Grammar</dfn>
because there's no "context" surrounding the left-hand side of the
production rules.
Programming languages fall into this category of grammars.
<br>(End of Remark)
</div>

<div class="proclaim definition">
**Definition 10:** _Derivations in a grammar_.<br>
Let $G$ be a formal grammar.
We may define the binary relation on strings over $V$
<dfn>$G$ Derives in One Step</dfn> $\Longrightarrow_{G}$ by
$a\Longrightarrow_{G}b$ if and only if there exist strings $\alpha$,
$\beta_{1}$, $\beta_{2}$, $\gamma$ over $V$ such that
$a=\alpha\beta_{1}\gamma$ and $b=\alpha\beta_{2}\gamma$ and
$\beta_{1}\to\beta_{2}$ is a production rule in $G$.

The reflexive transitive closure of $\Longrightarrow_{G}$ is the
binary relation $\Longrightarrow_{G}^{*}$ called 
<dfn>$G$ Derives in Zero or More Steps</dfn>.
<br>(End of Definition 10)
</div>

The intuition of "$G$ derives in one step" is that we rewrite a string
by replacing a nonterminal symbol with a terminal symbol ("morpheme").

<div class="proclaim definition">
**Definition 11:** _Language generated by a grammar_.<br>
Let $G$ be a formal grammar. 
We define the <dfn>Language Generated</dfn> by $G$ to be the set of
strings over terminal symbols by derivations beginning with the start symbol
$L(G)=\{w\in\Sigma^{*}\mid S\Longrightarrow_{G}^{*} w\}$.

We refer to "intermediate steps" as <dfn>Sentential Forms</dfn>. That
is, a string $x$ over $V$ is a sentential form if and only if
$S\Longrightarrow_{G}^{*}x$. 
<br>(End of Definition 11)
</div>

A formal grammar describes a sort of rewriting system. The production
rules tell us how we can rewrite sentential forms until we get a
string over the terminal symbols.

**Example 11.1:** We may offer a formal language for writing
Mathematical proofs, following Freek Wiedijk's [<cite class="article">Mathematical Vernacular</cite>](https://www.cs.ru.nl/~freek/notes/mv.pdf)
(unpublished manuscript, <i>c</i>.2000). Assuming that we have some understood way for
writing formulas, terms, labels, and variables, we have the following
BNF for the grammar:

```bnf
<statement> ::= <proposition> <justification>
<proposition> ::= <label> ": " <formula>
  |  <formula>
<justification> ::= <empty>
  |  "by" <label list>
  |  "proof" <optional proof steps> <optional cases> "end"
<label list> ::= <label>
  |  <label> "," <label list>
<optional proof steps> ::= <empty>
  |  <proof step> <optional proof steps>

<proof step> ::= <statement>
  |  "thus" <statement> ";"
  |  "let" <variable list> ";"
  |  "assume" <proposition> ";"
  |  "consider" <variable list> 
     "such that" <proposition> <justification> ";"
  |  "take" <term list> ";"

<term list> ::= <term> | <term> "," <term list>
<variable list> ::= <variable> | <variable> "," <variable list>

<optional cases> ::= <empty>
  |  "per cases" <justification> ";" <suppositions>
<suppositions> ::= <empty>
  | "suppose" <proposition> ";" <optional proof steps>
    <suppositions>

<empty> ::=
```

This allows us to write a formula and its proof. For example:

> $(\exists x)(P(x)\implies(\forall y)(P(y)))$ <br>
> proof
>> per cases; <br>
>> suppose H1: $(\forall x)P(x)$;
>>> consider $a$ such that $\top$; <br>
>>> take $a$; <br>
>>> thus $P(a)\implies(\forall x)P(x)$ by H1;
>> suppose H2: $(\exists x)(\neg P(x))$;
>>> consider $a$ such that H3: $\neg P(a)$ by H2; <br>
>>> take $a$; <br>
>>> assume H4: $P(a)$; <br>
>>> H5: $\bot$ by H2,H4; <br>
>>> thus $(\forall y)P(y)$ by H5;
> end;

This is not only grammatically correct, but it's also a valid
logical proof. 

Further, this example demonstrates the sort of thing we're interested
in studying: what's a formal grammar approximating how Mathematicians
"write mathematics"?

## Object Language and Metalanguage

We use languages for a lot of things. Have you noticed we have been
using a language all along? We have used English to talk about formal
languages.

Later we will be using a _programming language_ to implement a proof
assistant (which is to say, it describes the proof assistant's
_language of definitions and proofs_).

This tendency to use languages to communicate about languages is so
prevelant, we have some terminology to clarify which language is being
studied and which language mediates the discussion.

<div class="proclaim definition" id="object-and-metalanguage">
**Definition 12:** _Object language and Metalanguage_.<br>
Let $L_{1}$ and $L_{2}$ be languages.
We call $L_{2}$ a <dfn>Metalanguage</dfn> for language $L_{1}$ if we
use $L_{2}$ to communicate about $L_{1}$. 

Since $L_{1}$ is the object of study, we call it an
<dfn>Object Language</dfn>.
<br>(End of Definition 12)
</div>

Usually we would like either the alphabet $\Sigma_{1}$ underlying the
object language $L_{1}$ to be a subset of the alphabet $\Sigma_{2}$ of
the metalanguage $L_{2}$, or for morphemes of $L_{1}$ to be terminal
symbols in a grammar for $L_{2}$. We want to discuss fragments of
words of $L_{1}$ in the metalanguage $L_{2}$, and there are various
ways to do this.

### Towers of Languages

We could construct a tower of languages. For example, we are
communicating in English. But we could then construct a formal
language, which we then use to construct a programming language, which
we then use to program a proof assistant.

The reader may be worried about infinite regression problems ("Is it
languages all the way down?"), but we assume the reader has some
familiarity with English and Mathematics. We do not care _how_ the
reader knows these languages.

Foreshadowing future steps, we will discuss a fragment of the Standard
ML programming language --- a "Pure ML". The reader may be pleased to
learn that "ML" in "Standard ML" abbreviates "**M**eta **L**anguage".

We then use Pure ML to implement a proof assistant ("Myo") for
Intuitionistic HOL for reasoning about Standard ML and possibly
generating Standard ML code.

Then we will use Myo to (1) implement proof assistants for axiomatic
set theory atop first-order logic (or epsilon calculus), and (2) prove
properties about these proof assistants. The goal will be to
approximate what Working Mathematicians "do".

## Syntax and Semantics

Thus far, we have described a formal language as "just" some set of
strings. A language is "just words" and we have spent our time talking
about "properly spelling words" in the language. The technical term
for this aspect of a language is its <dfn>Syntax</dfn>.

But what does a word "mean"? This is a thorny question, and the
question has different tenor depending on the context.

For Mathematicians, we could give meaning by a function from the
language to some "semantic domain". This is [denotational semantics](https://en.wikipedia.org/wiki/Denotational_semantics).

Platonists would find this "obvious" since them semantics maps syntax
to "reality".

<div class="proclaim remark">
**Remark:** _Categorical semantics_<br>
More broadly, if we can describe the formal language as a category (in
the sense of [category theory](https://ncatlab.org/nlab/show/category+theory)), then denotational semantics
generalizes to [categorical semantics](https://ncatlab.org/nlab/show/categorical+semantics).
This fits naturally for the semantics of type theory and certain kinds
of programming languages.
<br>(End of Remark)
</div>

For Linguists, there are many schools of thought about
semantics. Perhaps the most relevant reference from the most relevant
school of thought is Marcolli, Berwick, and Chomsky's "Syntax-semantics interface: an algebraic model" ([arXiv:2311.06189](https://arxiv.org/abs/2311.06189)).
The basic idea is that there's a "semantic space" --- a topological space of meanings, and
semantics is then a mapping from syntactically well-formed sentences
to the semantic space.

We should also acknowledge there is a more sophisticated notion of
"syntax" in Linguistics, since they need to study _spoken language_
and how sounds form words (phonetics and phonology) as well as
_written language_ (morphology). This fascinating subject gives us far
more than necessary for our purposes, and we can only encourage the
motivated reader to consult their local university's linguistics
department for further study.

For Computer Scientists, [operational semantics](https://en.wikipedia.org/wiki/Operational_semantics)
offers a way to give meaning to words and phrases of an object
language by using "judgements" (i.e., predicates in the metalanguage)
whose meaning is given in the form of "inference rules". Logicians
recognize this as eerily similar to [proof-theoretic semantics](https://plato.stanford.edu/entries/proof-theoretic-semantics/),
and gold star to them: proof-theoretic semantics is precisely
operational semantics applied to logic.

<div class="proclaim remark">
**Remark:** _Meaning induced from the metalanguage_.<br>
Arguably, what we are doing here resembles operational semantics: we
introduce an object language (technical terms describing formal languages)
and explicate the informal intended meaning in English (a metalanguage).

We should stress that the object language **is a formal language**, at
least for our purposes. When the object language is a natural language,
I am uncertain this strategy works and I do not want to get
distracted. Our intent is to describe Mathematics using the tools of
Computer Science (i.e., in formal languages).
<br>(End of Remark)
</div>

These are only a small representative sample of some notions of
"semantics" across multiple disciplines. And it's not even exhaustive
within any discipline! Computer scientists working in imperative
programming languages have [axiomatic semantics](https://en.wikipedia.org/wiki/Axiomatic_semantics).
Linguists have more schools of thought than I can count (five, I think),
each with a different theory of semantics.

## Language as a System

From the completely different perspective of 
[Systems theory](https://en.wikipedia.org/wiki/Systems_theory),
a language is a system for creating "messages". This is the
perspective taken by the [<cite>Principia Cybernetica</cite>](http://pespmc1.vub.ac.be/LANG.html).

There are different types of messages among agents.

A [command](http://pespmc1.vub.ac.be/COMMAND.html) instructs an agent
to update its state. A programming language consists of commands for
the computer.

When the agents communicating have some "model of the world" (even if
it's a database of "facts"), then messages communicated may include
[statements](http://pespmc1.vub.ac.be/STATEM.html). A statement
reflects some knowledge of the sender. The meaning of the message is
the knowledge communicated.

Note that the same message may be communicated to multiple agents. For
example, declarative-style proof assistants have its language consist
of commands to the computer but statements to humans. On the other
hand, procedural-style proof assistants only have commands to the
computer. 

<footer>
**[** [Back](./index.md) **]**
</footer>
