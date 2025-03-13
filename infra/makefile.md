---
title: Makefile for YSG
---
<nav class="crumbs">
- [ysg](../index.html)
- [infrastructure](./index.html)
- Makefile
</nav>

# Makefile for YSG

I know I will forget why I ordered my Makefile for building the HTML
from Markdown, so I should make a literate program annotating the
Makefile.

## Portable Makefile

We will generate a _portable_ Makefile which adheres to the POSIX
[specification](https://pubs.opengroup.org/onlinepubs/9699919799/utilities/make.html)
for make.

Towards that end, the first line of the `Makefile` will indicate we
are working with this portable standard.

(Plus, working on Ubuntu, you can check it against BSD Make by
installing the `bmake` package; on a Debain system, you can also check
it against `fmake` if you install the `freebsd-buildutils` package.)

```Makefile {file=Makefile}
.POSIX:
```

## YSG Directory Location

First, the location of the Yak Shavers Guild directory may change, so
I have a variable for the location of the directory.

```Makefile
YSG=$(HOME)/ysg
```

Now I will use the Markdown engine and `tangle-md` code extractor, so
I introduce variables for them and the flags passed to them by
default.

The Markdown engine will default to using the [style.css](./css/style.md)
file as well as toggle KaTeX on.

To support Codeberg pages, we will stick the HTML output (and
extracted CSS) into a `pages` directory.

```Makefile
MD=$(YSG)/md/md
PAGES=$(YSG)/pages
SITE=$(YSG)/site
MDFLAGS=--katex --css $(PAGES)/css
TANGLE=$(YSG)/tangle-md/tangle-md
```

We will also be generating HTML from subdirectories. The rules
describing this are the same, and can be streamlined using a single
rule and pattern matching.

This requires us to introduce a variable for all the subdirectories we
will be using. We can do this by assigning the variable to be equal to
the result of running `ls -d */` (matching all subdirectories,
including the postfix slash) and pipe it through the [cut utility](https://pubs.opengroup.org/onlinepubs/9799919799/utilities/cut.html) to
remove the trailing backslash from the directory names.

``` Makefile
SUBDIRS!= ls -d */ | cut -f1 -d'/'
```

## Default build rule

The `all` rule will invoke rules to extract the CSS stylesheet as well
as building the documentation associated with the infrastructure of
the project.

Then it will perform three things:
1. Create an empty `.nojekyll` file, so github pages will be happy with
   the static HTML output and avoid needlessly invoking Jekyll;
2. Translate the `index.md` file to HTML, generated in the pages
   directory;
3. Translate the `about.md` file to HTML, generated in the pages
   directory.

If we add anymore top-level files, we'll need to add more
steps. Similarly, if we add any subdirectories, we should add a rule
to "compile" them into HTML artifacts.

```Makefile
all: extract_css $(SUBDIRS)
	touch $(PAGES)/.nojekyll
	$(MD) $(MDFLAGS) --output $(PAGES) index.md
	$(MD) $(MDFLAGS) --output $(PAGES) about.md
```

## Extracting CSS

We have to ensure the `pages/css/` directory exists, then extract the
CSS code from the literate file for it.

The `.PHONY` rule ensures this will always be executed, since Make
will try to "help" us by caching outputs.

We have a "long-ish" command to extract the CSS code, which we split
into a [multline command](https://www.gnu.org/software/make/manual/html_node/Splitting-Lines.html)
using the backslash `\` to wrap the command onto the next line. This
is a Makefile convention, and demanded **only by stylistic concerns
rendering the HTML artifact.**

Also note: as a "postcondition" for this rule, the `pages/` directory
is guaranteed to exist, so we can extract HTML to it safely.

```Makefile
.PHONY: extract_css
extract_css:
	mkdir -p $(PAGES)/css
	$(TANGLE) --output=$(PAGES)/css \
--extract style.css \
infra/css/style.md
```

## Generating HTML for each subdirectory

Now, we want to generate the HTML artifact for each subdirectory. 
The name of the subdirectory being processed is stored in the `$@`
variable. 

This requires building the `pages/$@/` directory if it is absent.

Then we can invoke our Markdown engine to recursively generate HTML
artifacts for everything found in the `$@` literate code
directory, including subdirectories.

The `.PHONY: $(SUBDIRS)` trick I learned from [Stackoverflow](https://stackoverflow.com/a/3095711).

```Makefile
.PHONY: $(SUBDIRS)
$(SUBDIRS):
	mkdir -p $(PAGES)/$@
	$(MD) $(MDFLAGS) --output $(PAGES)/$@ --r $@
```

## Extracting this Makefile as a Makefile

If we want to extract the code contained in this literate program, we
should have a rule allowing it.

```Makefile
extract_makefile:
	$(TANGLE) --output=$(SITE) --extract Makefile \
infra/makefile.md
```

## "Clean" target

It is considered "good practice" to have a `clean` rule, which will
nuke all the generated output. This allows us to start fresh.

For us, this is simply "delete the `$(PAGES)` visible subdirectories (if any
exist) plus html files".

```Makefile
clean:
	rm -rf $(PAGES)/*/
	rm -rf $(PAGES)/*.html
```

<footer>
**[** [Up](../index.md) **]**
</footer>
