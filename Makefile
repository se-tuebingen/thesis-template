ROOT_DOC = thesis
BIB_FILE = bibliography

MODE = batchmode

LATEX = pdflatex -interaction=$(MODE) -synctex=1
LATEX_VERBOSE = pdflatex -interaction=errorstopmode -synctex=1
BIB = bibtex

.PHONY: all verbose view clean full

all: $(ROOT_DOC).pdf

verbose:
	$(LATEX_VERBOSE) $(ROOT_DOC)

view: @xdg-open $(ROOT_DOC).pdf &

clean:
	@find . -name "*.aux" -type f -delete
	@find . -name "*.log" -type f -delete
	@find . -name "*.bbl" -type f -delete
	@find . -name "*.blg" -type f -delete
	@find . -name "*.bcf" -type f -delete
	@find . -name "*.run.xml" -type f -delete
	@find . -name "*.out" -type f -delete
	@find . -name "*.toc" -type f -delete
	@find . -name "*.synctex.gz" -type f -delete
	@echo "Cleanup complete."

full: $(ROOT_DOC).tex $(BIB_FILE).bib
	$(LATEX) $(ROOT_DOC) ;true
	$(BIB)   $(ROOT_DOC) ;true
	$(LATEX) $(ROOT_DOC) ;true
	$(LATEX) $(ROOT_DOC) ;true

$(ROOT_DOC).pdf: $(ROOT_DOC).tex *.tex sections/** # Add further dependencies here
	$(LATEX) $(ROOT_DOC)
