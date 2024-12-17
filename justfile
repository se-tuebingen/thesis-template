out-dir := ".out"
root-file := "thesis"
source-dir := "src"
bib-file := "bibliography"
tex-cmd := "lualatex --interaction=nonstopmode --output-directory=" + out-dir
bib-cmd := "biber"

# By default the PDF is build in draft mode
default: _init quick

_init:
    @mkdir -p {{out-dir}}
    @mkdir -p {{out-dir}}/{{source-dir}}
    @ln -fs $(pwd)/{{bib-file}}.bib {{out-dir}}/{{bib-file}}.bib

# Quickly build the PDF without care for the correctness of citations. Useful if no new citations have been added.
quick: _init
    {{tex-cmd}} {{root-file}}

# Completely build the PDF and take care of citations.
full: _init
    {{tex-cmd}} --output-directory={{out-dir}} {{root-file}}
    cd {{out-dir}} && {{bib-cmd}} {{root-file}}
    {{tex-cmd}} --output-directory={{out-dir}} {{root-file}}
    {{tex-cmd}} --output-directory={{out-dir}} {{root-file}}

# Delete the output folder
clean:
    find {{out-dir}} -not -name {{root-file}}.pdf -not -path {{out-dir}} -delete

# Runs a file watcher indefinetly and re-builds the PDF in draft mode upon every saved change.
watch:
    watchexec -w {{source-dir}} -w {{root-file}}.tex "just draft"