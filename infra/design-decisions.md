---
title: Design Decisions
---
<nav class="crumbs">
- [ysg](../index.html)
- [infrastructure](./index.md)
- design decisions
</nav>

# Design Decisions

There have been a number of design decisions made when writing (and
building) this project.

One design decision I will not discuss: write a literate program which
generates an HTML artifact. For better or worse, I was inspired by
Isabelle, Emacs, and Knuth...so blame them for this choice.

## Bootstrappable Code

I will provide the code extracted from the literate program alongside
the literate program itself, so as to make sure this endeavour is
[bootstrappable](https://bootstrappable.org/). 

For example, I intend to have Myo be an intuitionistic HOL with a code
generator (i.e., it will generate Standard ML code). In theory, I
could then write Myo in Myo and have it generate the Standard ML code
to be compiled. If I do this, I should include the generated code (so
users can just "grab it and go" without worrying about needing Myo to
generate the code).

## As Portable As Convenient

I am striving to be as portable as possible without driving myself
crazy. 

**For operating system environments:**
I am going to be working with the [POSIX 2024 Specification](https://pubs.opengroup.org/onlinepubs/9799919799/)
even though this would "technically" preclude Haiku, BeOS, DragonFly
BSD, Solaris, Darwin (Mac OS), among others.

Really only Windows users would be impacted.

**For programming:**
I am going to be working with Standard ML, which is so minimal there
shouldn't be much of a problem (except when trying to specify the
"main" program and the build tools). I'll be using [polymlb](https://github.com/vqns/polymlb)
to have [Poly/ML](https://polyml.org/) compile `.mlb` "basis" files (which is how [MLton](http://mlton.org/) and
MLkit builds projects).

If I need shell scripts, I will use the [POSIX shell command language](https://pubs.opengroup.org/onlinepubs/9799919799/utilities/V3_chap02.html#tag_19)
(i.e., I try to avoid Bash-isms; see also the [grymoire](https://www.grymoire.com/Unix/Sh.html)),
and I will try to adhere to the [POSIX utility conventions](https://pubs.opengroup.org/onlinepubs/9799919799/basedefs/V1_chap12.html)
for command-line arguments.

**For the website:**
I am minimizing the amount of Javascript (limited to only KaTeX) and
CSS. There is no tracking cookies, no data analytics, no interactive
demo which runs in the browser. Nothing.

<div class="proclaim remark">
**Remark:** _Tools for testing portability?_<br>
I actually do not know of any tools which will test scripts for POSIX
portable adherence. Is this even possible?

It's easy to _accidentally_ write some small snippet of code which is
not portable, so it would be nice to have a tool double-check I avoid
this. 
<br>(End of Remark)
</div>

