ROOT_FILE := thesis.tex
TEX_CMD := latexmk -lualatex -interaction=nonstopmode -f

.PHONY: default
default: pdf clean

# Full build: builds the PDF and ensures correct citations
.PHONY: pdf
pdf:
	$(TEX_CMD) $(ROOT_FILE)

# delete all output files but not the PDF
.PHONY: clean
clean:
	$(TEX_CMD) -c

# delete all output files including the PDF
.PHONY: full-clean
full-clean:
	$(TEX_CMD) -C

# Rebuild the PDF on changes in the source files
.PHONY: watch
watch:
	$(TEX_CMD) -pvc $(ROOT_FILE)
