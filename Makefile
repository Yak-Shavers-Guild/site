.POSIX:

YSG=$(HOME)/ysg

MD=$(YSG)/md/md
PAGES=$(YSG)/pages
SITE=$(YSG)/site
MDFLAGS=--katex --css $(PAGES)/css
TANGLE=$(YSG)/tangle-md/tangle-md

SUBDIRS!= ls -d */ | cut -f1 -d'/'

all: extract_css $(SUBDIRS)
	touch $(PAGES)/.nojekyll
	$(MD) $(MDFLAGS) --output $(PAGES) index.md
	$(MD) $(MDFLAGS) --output $(PAGES) about.md

.PHONY: extract_css
extract_css:
	mkdir -p $(PAGES)/css
	$(TANGLE) --output=$(PAGES)/css \
--extract style.css \
infra/css/style.md

.PHONY: $(SUBDIRS)
$(SUBDIRS):
	mkdir -p $(PAGES)/$@
	$(MD) $(MDFLAGS) --output $(PAGES)/$@ --r $@

extract_makefile:
	$(TANGLE) --output=$(SITE) --extract Makefile \
infra/makefile.md

clean:
	rm -rf $(PAGES)/*/
	rm -rf $(PAGES)/*.html

