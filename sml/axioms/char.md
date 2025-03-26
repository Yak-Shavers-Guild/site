---
title: Characters - SML
---

# Characters

The idea is that a character, as far as Standard ML cares, is
basically a "wrapper" around an integer between 0 and 127 called its
<dfn>Code Point</dfn>.

**Type:** `char`

**Values:** There are various ways to write character literals;
- Printable characters (numbered 33--126 in ASCII) can be written
  directly within quotation marks after a hashtag as `#"..."`
- Some characters need to be escaped, for example `#"\\"` for a backslash, and `#"\""` for a double quote
- Some special nonprintable character literals: 
  `#"\a"`, `#"b"`, `#"\t"`, `#"\n"`, `#"\v"`, `#"\f"`, `#"\r"` are for
  the ASCII characters 7--13 respectively
- All characters can be written as `#"\uXXXX"` where `X` is a
  hexadecimal digit --- for example `#"\u0063"` is the same as `#"c"`
  (NB: some Standard ML implementations do not handle this properly,
  for example SML/NJ fails in this regard).

**Operations:**
- `ord e : char -> int` translates a character to its code point
- `char e : int -> char` translates the code point to its corresponding
  character value
- `str e : char -> string` gives the one-character length string for
  the character

## Typing Rules

\[\frac{e : \mathtt{char}}{\texttt{ord}~e : \mathtt{int}}\hbox{T-Ord}\]

\[\frac{e : \mathtt{int}}{\texttt{chr}~e : \mathtt{char}}\hbox{T-Chr}\]

\[\frac{e : \mathtt{char}}{\texttt{str}~e : \mathtt{string}}\hbox{T-Str}\]

## Evaluation Rules

These are "obvious": evaluate the argument until it is a value, then
look up on the [ASCII table](https://en.wikipedia.org/wiki/ASCII) the associated information.

