.POSIX:

YSG=$(HOME)/ysg

MD=$(YSG)/md/md
OUTDIR=$(YSG)/pages
SITE=$(YSG)/site
MDFLAGS=--katex --css $(OUTDIR)/css
TANGLE=$(YSG)/tangle-md/tangle-md

all: extract_css infra
	touch $(OUTDIR)/.nojekyll
	$(MD) $(MDFLAGS) --output $(OUTDIR) index.md
	$(MD) $(MDFLAGS) --output $(OUTDIR) about.md

.PHONY: extract_css
extract_css:
	mkdir -p $(OUTDIR)/css
	$(TANGLE) --output=$(OUTDIR)/css \
--extract style.css \
infra/css/style.md

.PHONY: infra
infra: 
	mkdir -p $(OUTDIR)/infra
	$(MD) $(MDFLAGS) --output $(OUTDIR)/infra --r infra

extract_makefile:
	$(TANGLE) --output=$(SITE) --extract Makefile \
infra/makefile.md

