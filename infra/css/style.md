---
title: Stylesheet of the Yak Shavers Guild
---
<nav class="crumbs">
- [ysg](../../index.html)
- [infrastructure](../index.html)
- [css](./index.html)
- style.css
</nav>

# CSS Style

## Common CSS Code for all readers

### Basic design: column of text

I want to have the text presented in a single column, presented in the
center of the page, with some background.

Initially, I thought the Bourbaki cover's cream color (`#fff3a6`) would
be wonderful, but it was too light. I then switched to several darker
tones (`#4f4b36`).

The `min-height: 100vh` property ensures that for pages which lack a
lot of text, the center column will fill up the entire screen
vertically (and not "stop short", being a fraction of the screen).

### Fonts

Generically, the font should be a serif, so I just picked
Palatino. 

The font size 20px was, again, just a random choice. The
heuristic among graphic designers seems to be 16px to 20px, with text
heavy sites preferring larger fonts.

<div class="proclaim remark">

**Remark:** _Font size and text width._<br>
If I wanted to adhere to the 12-8-4 heuristic among graphic designers,
then I should use 19.2px font size. (This yields a paragraph width
being 576px or 8 "columns" wide. If I also wanted a 24px gutter, then
the padding should be adjusted to 1.25rem.)
<br>(End of Remark)

</div>

The line height calculation was, again, a heuristic which graphic
designers seem to agree upon.

```css {file=style.css}
html {
    /* font: normal 12pt/18pt serif; */
    /* font: normal 16pt/24pt Palatino, serif; */
    font-family: "Palatino Linotype", Palatino, Palladio, "URW Palladio L", "Book Antiqua", Baskerville, "Bookman Old Style", "Bitstream Charter", "Nimbus Roman No9 L", Garamond, "Apple Garamond", "ITC Garamond Narrow", "New Century Schoolbook", "Century Schoolbook", "Century Schoolbook L", Georgia, serif;
    font-size: 20px;
    line-height: calc(1ex / 0.32);
}

body {
    background-color: #4f4b36;
    /* background-color: #565656; */
    /* background-color: #fff3a6; */
    margin: 0px;
    min-height: 100vh;
}

main {
    background-color: white;
    min-height: 100vh;
}
```

### Footers

For the footer, which will contain links to the parent directory's
`index.html` and the current directory's `index.html`, I thought it
should be smaller font and separated by a horizontal black line.

```css
footer {
    border-top: 1px solid black;
    text-align: center;
}
```

### Figures and captions

Figures should be centered and have a maximum width no larger than the
main body of text.

The caption for figures (which should always be present) should have a
noticeably smaller font size.

```css
/* figures should be centered and have max-width */
figure {
    max-width: 100%;
    text-align: center;
}
figcaption {
    font-size: smaller;
}
```

### Theorems, Remarks, Propositions

This is a "mathematical text", so I am prone to write theorems (and
definitions and proofs and...). It would be nice to format these
specially.

Since each "register" has its own stylistic idiosyncracies, I will
discuss them here as I implement them.

**Remarks** are inspired from Bourbaki's style, but with an HTML
flavor. Specifically, remarks are indented (like Bourbaki) and with a
dotted vertical line to its left. The consensus among CSS designers is
to use `rem` as the units for indentation. (We also want to include
_some_ margin for printed versions to "look nice".)

The `font-size` for remarks are `smaller`, but we also adjust the
line-height accordingly. It's the same calculation as we did for the
body font's line-height.

I am thinking some remarks are so tangential that they might warrant
being inside a [`<details>` tag](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/details).
But I will cross that bridge when I get there...

Also observe that a remark should **not** be a `<section>` element,
since the heuristic [offered by the HTML5 spec](https://html.spec.whatwg.org/multipage/sections.html#the-section-element)
is that a `<section>` element is appropriate when its contents would
appear in the "outline" (table of contents in tree order), which is
generically **not true** for remarks, theorems, definitions, etc. So
they should be `<div>` elements.

```css
div.remark {
    border-left: 1px dotted black;
    font-size: smaller;
    line-height: calc(1ex / 0.32);
    margin-left: 0.5rem;
    padding-left: 0.5rem;
}
```

I think it's wise to make the body of a "register" change background
when hovering. A light green would be pleasant and welcoming.

We will also want to make the `remark` not change its left margin.

The margins and paddings are chosen to make the rest of the HTML
"stable" --- i.e., it won't shift one iota.

``` css
.proclaim:not(.remark):hover {
    background-color: #D9FEE5;
    border: 1px solid #265F39;
    margin: -1px -0.5rem;
    padding: 0 calc(0.5rem - 1px);

}

.proclaim > p:last-of-type {
    margin-bottom: 0px;
}

.remark.proclaim:hover {
    background-color: #D9FEE5; /* #90EE90; */
}
```

### Inline citations, abbreviations, definitions

The citation tags should be italicized, though I may want to carve out
different classes of citations (e.g., books, websites, lectures, etc.).
We will default to italicizing its contents.

Remember, the [HTML5 specification](https://html.spec.whatwg.org/multipage/text-level-semantics.html#the-cite-element)
for `<cite>` states that we wrap it around the work's _title_.

For article titles (which should be in quotes), the HTML should look
like `"<cite>article title</cite>"` according to the 
[HTML5 specification](https://html.spec.whatwg.org/multipage/grouping-content.html#the-blockquote-element) examples for `<blockquote>`.

```css
cite {
    font-style: italic;
}
```

Abbreviations should have a dotted underlining, to indicate they are
abbreviations. (Though I seriously doubt I would use `<abbr>` tags
anywhere...)

The [MDN documentation](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/abbr)
for `<abbr>` tag is worth reading, if I decide to use it.

```css
abbr {
    text-decoration: underline dotted 1px;
}
```

The `<dfn>` element wraps around a newly defined term (a <i>definiendum</i>).
The [MDN docs](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/dfn)
are worth reading.

Definitions should be in green and dotted underline (it's different enough to be
noticeable, not confused as a link). Upon hover, the underline becomes
wavy. There should also be an opening and closing quotation mark.

```css
dfn {
    color: green;
    font-style: normal;
    text-decoration: underline dotted green 1px;
}
dfn::before {
    content: open-quote;
}
dfn::after {
    content: close-quote;
}
dfn:hover {
    text-decoration: underline wavy green 1px;
}
```

### Headers

The line-height for headers must not be too big, though this really only
matters for mobile viewers.

```css
h1 {
    line-height: 32pt;
}
```

### Block Quotes

At first I thought: blockquotes should not have huge left margins, but
a dotted line on the left-hand side.

But then I started using this style for remarks, which made it hard to
distinguish from blockquotes.

So I switched to imitate Stackoverflow's style for blockquotes.

I also chose to make the font-size a little bit smaller.

I deliberated betwen usign 1em or 10px for the padding (and left
margin). The consensus among CSS designers seems to be: use `rem` for
white space dimensions.

```css
blockquote {
  background: #f9f9f9;
  border-left: 3px solid #ccc;
  font-size: 92.7%; /* 1.5/phi */
  line-height: calc(1ex / 0.32);
  margin: 0 0 0 0.5rem;
  padding: 0.5rem 0 0.5rem 0.5rem;
}
```

I want to avoid "excessive vertical space" for paragraphs within a
blockquote. Specifically the first and last paragraphs should have no
top (respectively, bottom) marin.

```css
blockquote > p:first-of-type {
    margin-top: 0;
}
blockquote > p:last-of-type {
    margin-bottom: 0;
}
```

### Lists

The whitespace for lists inherits a lot of whitespace due to the items
consisting of one or more paragraph `<p>` elements.

Similarly, when we have a `p` followed by a list, we should want to
lessen the margin beneath the paragraph.

```css
ol,ul {
    margin: 0px;
}

li p:first-child {
    margin-top: .125rem;
}
li p:last-child, li p:has(+ul), li p:has(+ol) {
    margin-bottom: .125rem;
}
```

### Code blocks and inline code

Code blocks should have a light grey background, and inline code should
have a little padding to make it fit snuggly on a line of text.

If I change the `body` font to, say, `normal 21.3333px/32px Palatino, serif`,
then I need to change the padding for `code` to reflect this (for `12px`
code font, I'd need `padding: 4.6667px 2px;` or something similar; and
for `14px` code font, I'd need `padding: 3.6667px 2px;`).

The `example` blocks use [Selenize](https://github.com/jan-warchol/selenized/blob/master/the-values.md) light font color scheme.

The default `pre` block elements use Selenize dark's color
scheme, specifically as suggested by the [VS Code style](https://github.com/jan-warchol/selenized/blob/master/editors/visual-studio-code/themes/selenized-dark.json)
(but also see the [Emacs style](https://github.com/jan-warchol/selenized/blob/master/editors/emacs-WIP/Selenized-dark-theme.el)).

The `code` elements are used for inline code elements, which is
jarring to see as a dark background (when embedded in a white
background). It's _too effective_ at making the reader pause,
preventing the reader from continuing to read. So I opted to use
Selenize white.

```css
pre, code {
    font-size: 13px;
}
#cdcdcd   #c2c2c2
code {
    background: #ffffff; /* bg_0 */
    color: #373737;      /* fg_0, AppleRGB */
}

pre {
    background: #112e38; /* bg_0, AppleRGB */
    color: #adbcbc;      /* fg_0 */
    /* background: #f6f8fa; */
    /* color: #1f2328; */
    /* background: #afb8c133; */
    /* background: #f1f1f1; */
}

pre .comment {
    color: #72898f;      /* dim_0 */
    font-style: italic;
}

pre.example {
    background: #fbf3db; /* bg_0 */
    color: #43545a;      /* fg_0, using AppleRGB for darkness */
}

pre.example .comment {
    color: #909995;      /* dim_0 */
    font-style: italic;
}
/*
keyword: #cf222e;
entity: #6639ba;
constant: #0550ae;
comment: #57606a;
*/

code {
    padding: 2px;
}
pre {
    line-height: 18px;
    white-space: pre-wrap;
    word-break: break-word;
}
@media only screen {
    pre {
        margin: 0 -6px;
        padding: 6px;
    }
}
```

Note to future self: if we want to remove the underline from links
which appear in a `pre` block, we would do this using the following
code (but it will keep the underline on hover):

```css {example}
pre a {
    /* text-decoration: none; */ /* ??? */
    text-decoration-style: dashed; /* dotted??? */
    
}
pre a:hover {
    text-decoration: underline;
}
```

### Show programming language hovering above pre blocks

Now, we can use CSS and `data-lang` attribute of `pre.src` to show the
language of source code blocks as a little blurb of text on the top
right-hand side.

Since we're using Selenized color schemes for syntax highlighting, we
need to specify the font color for this "blurb" to be
black. Otherwise, it will be "dark-ish grey".

```css
@media screen {
    /* Show the language name when hovering over
       the PRE block, using the data-lang attribute. */
    pre.src, pre.example {
        position: relative;
    }
    
    pre.src::before, pre.example::before {
        display: none;
        position: absolute;
        top: 0px;
        right: 0px;
        padding: 0px 3px;
    }
    
    /* Use white as the background, to "alert" the
       reader that this is not some "dynamic code change"
       (or whatever), but an "English text addendum".
   */
    pre.src:hover::before {
        display: inline;
        background: #fff;
        border: 1pt solid #909090;
        color: black;
        content: attr(data-lang);
        z-index: 1000;
    }
```

Similarly, hovering on an example should display the language name
with "(example)" afterwards.

```css
    pre.example:hover::before {
        display: inline;
        background: #fff;
        border: 1pt solid #909090;
        content: attr(data-lang) "(example)";
        z-index: 1000;
    }
}
```

### Navigation trees

Above a title, we might want to include a "tree" for the path to the
file.

It's rendered in a smaller font, with less vertical space for its
body. After a few experiments, it appears $1.5\phi$ multiples of `ex`
is visually appealing (where $\phi\approx1.618$ is the golden ratio).

We use inline lists, separating the elements by `>`. If there are any
paragraphs after the `nav` but before the `h1` title, then we should
not display them.

I wish I had a "first principles derivation" for the `margin-top`
being `-5.5ex`, but I don't have one. It just "looks about right".

```css
nav.crumbs {
    border-bottom: 1px solid #ccc;
    font-size: smaller;
    line-height: 2.42705098ex; /* == 1.5*phi*ex */
}

@media only screen {
    nav.crumbs {
        margin-top: -5.5ex; /* eye-ball estimate */
        max-height: 5ex;
    }
}

@media only print {
    nav.crumbs {
        padding-left: 1ex;
    }
}

nav.crumbs ul {
  list-style-type: none;
  padding-left: 0;
}

nav.crumbs ul li{
  display: inline-block;
}

nav.crumbs a::after {
  display: inline-block;
  color: #000;
  content: ">";
  font-size: 80%;
  font-weight: bold;
  padding-left: 1ex;
}

nav.crumbs > p, nav.crumbs + p {
    display: none;
    margin: 0;
}
```

### Directory Trees

Last, we have directory trees to act as ["city directories"](https://en.wikipedia.org/wiki/City_directory) for subprojects (and
elsewhere). We should render this in a suitably nice way.

```css
/* Directory trees should be suitably
   different from normal text */
div.tree {
    font: 13px mono;
    line-height: 15px;
}
```

## Desktop specific rendering

Broadly, we consider a "desktop reader" to be when the user is using
some kind of "screen" (as opposed to
[`print`](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_paged_media))
which is **at least 600px wide.**

This particular width is just the consensus among graphic designers
for "medium" screens (i.e., tablet screens and desktop monitors) ---
but this has changed over time (e.g., the
[Malayasian Government](https://design.digital.gov.my/en/docs/design/12-8-4-grid)
uses 768px width and larger as the breakpoint for desktop monitors nowadays).

Graphic designers have a consensus that the main column should be
centered for "large" monitors, so that's what I ended up doing.

The tree directory should be indented by `2.5rem` on the left for
computer screens.

Further, the text width for the main column should be near 60
characters. Using `width: 60ch` produces something _near_ this limit,
though slightly more generous. (Again, this is the wisdom of graphic
designers, though there is some scientific evidence backing this idea
of 60 characters per line for text heavy websites.)

We will also restrict KaTeX's font-size to be reasonable. It defaults
to a `font-size: 1.21em` which makes it look fine relative to a
sans-serif font, but it's huge for a serif font (like what we have).

```css
/* End of showing the language name
   when hovering over the PRE block */
@media only screen and (min-width: 600px) {
    main {
        margin: 0 auto;
        /* margin: 0 auto 0 40%; */
        width: 60ch;
        padding: 1rem;
    }
    
    div.tree {
        padding-left:2.5rem;
    }

    .katex {
        font-size: 1em !important;
    }
}
```

## Screen paragraph margins

Generically, the paragraph margin should be `0.25ex` top and bottom,
with 0 margin left and right.

```css
@media only screen {
    p {
        margin: 2.25ex 0;
    }
    pre {
        margin: -2ex -6px;
    }
}
```

## Mobile specific rendering

For any reader with no more than 599px width, we need to adjust some of
the styling to avoid needless whitespace.

Further, there is no background anymore: the centered text is now the
entire content rendered. (This is idiomatic 12-8-4 convention.)

```css
@media only screen and (max-width: 599px) {
    body {
        width: 100vw;
    }
    main {
        padding: 0.5rem;
    }
    .katex {
        font-size: 1em !important;
    }
    pre {
        /* font-size: 20px; */
        overflow-x: scroll;
        /* background-image: linear-gradient(180deg, #eee 50%, #fff 50%); */
        /* background-size: 100% 48px; */
        /* line-height: 24px; */
    }
    blockquote {
        margin-right: 0px;
        margin-left: 0.25rem;
        padding-left: 0.25rem;
    }
    ol,ul {
        padding-left: 1.25rem;
    }
    li p:first-child {
        margin-top: .75rem;
    }
    li p:last-child {
        margin-bottom: .75rem;
    }
}
```

## Printed version

Printing versions of this out should indent paragraphs. Specifically, 
`p + p` is for list items to not indent its first paragraph, and 
`main > p` indents all paragraphs in the main text (not quoted), etc.

I should think about how Blockquotes indent paragraphs. The 
`p + p` rule will indent the second (and later) paragraphs, which seems
suitable. 

Furthermore, for code blocks (really, anything in a `pre` block), I
want to include a top and bottom border (as well as a small
padding). This will make it easier to separate code snippets from the
text. 

**TODO:** Think about adding a prefix for "examples", as well as what
to do about the language. (End of TODO)

```css
/* Printed versions should indent the text */
@media only print {
    p + p, main > p {
        text-indent: 2rem;
        margin: 0 auto;
    }
    pre {
        color: black;
        background-color: white;
        border-top: 1px solid black;
        border-bottom: 1px solid black;
        padding: 1ex;
    }
```

Also note: when printing things out, the first paragraph _after_ a
remark should not be indented (it just looks weird).

``` css
    div.remark + p {
        text-indent: 0px;
    }
}
```

<footer>
**[** [Back](./index.md) **|** [Up](../index.md) **]**
</footer>
