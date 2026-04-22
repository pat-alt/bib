LIBS := bib peer pre soft thesis vardsa sup_bachelors sup_masters other
BIBS := $(addsuffix .bib,$(LIBS))

export PAPIS_CONFIG_DIR := $(CURDIR)/.papis

.PHONY: bib clean-bib render all
all: bib

bib: $(BIBS)

%.bib: papis/%/
	@echo "==> exporting $@ from library $*"
	@papis -l $* export --all --batch --format bibtex --out $@

clean-bib:
	rm -f $(BIBS)

render: bib
	quarto render
