OUT_DIR := .out
ROOT_FILE := thesis
SOURCE_DIR := src
BIB_FILE := bibliography
TEX_CMD := lualatex --interaction=nonstopmode --output-directory=$(OUT_DIR)
BIB_CMD := biber

# Default target: builds the PDF in draft mode
.PHONY: default
default: _init quick

# Create output directories and symlink bibliography
.PHONY: _init
_init:
	@mkdir -p $(OUT_DIR)
	@mkdir -p $(OUT_DIR)/$(SOURCE_DIR)
	@ln -fs $(shell pwd)/$(BIB_FILE).bib $(OUT_DIR)/$(BIB_FILE).bib

# Quickly build the PDF without ensuring correct citations
.PHONY: draft
quick: _init
	$(TEX_CMD) $(ROOT_FILE)

# Full build: builds the PDF and ensures correct citations
.PHONY: full
full: _init
	$(TEX_CMD) $(ROOT_FILE); true
	cd $(OUT_DIR) && $(BIB_CMD) $(ROOT_FILE); true
	$(TEX_CMD) $(ROOT_FILE); true
	$(TEX_CMD) $(ROOT_FILE)

# Delete the output folder
.PHONY: clean
clean:
	find $(OUT_DIR) -not -name $(ROOT_FILE).pdf -not -path $(OUT_DIR) -delete

# Watch for changes and rebuild the PDF in quick mode
.PHONY: watch
watch:
	watchexec -w $(SOURCE_DIR) -w $(ROOT_FILE).tex "make draft"
