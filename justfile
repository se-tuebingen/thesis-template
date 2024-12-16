aux-dir := ".out"
root-file := "thesis"
source-dir := "src"
bib-file := "bibliography"
tex-cmd := "lualatex --interaction=nonstopmode"
bib-cmd := "biber"

# By default the PDF is build in draft mode
default: _aux draft

_aux:
    mkdir -p {{aux-dir}}
    mkdir -p {{aux-dir}}/{{source-dir}}
    ln -fs $(pwd)/{{bib-file}}.bib {{aux-dir}}/{{bib-file}}.bib

# Quickly build the PDF without care for the correctness of citations. Useful if no new citations have been added.
draft: _aux
    {{tex-cmd}} --output-directory={{aux-dir}} {{root-file}}

# Completely build the PDF and take care of citations.
pdf: _aux
    {{tex-cmd}} --output-directory={{aux-dir}} {{root-file}}
    cd {{aux-dir}} && {{bib-cmd}} {{root-file}}
    {{tex-cmd}} --output-directory={{aux-dir}} {{root-file}}
    {{tex-cmd}} --output-directory={{aux-dir}} {{root-file}}

# Clean the auxillary folder
clean:
    rm -r {{aux-dir}}/*

# Runs a file watcher indefinetly and re-builds the PDF in draft mode upon every saved change.
watch:
    watchexec -w {{source-dir}} -w {{root-file}}.tex "just draft"