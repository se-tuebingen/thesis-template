# LaTeX Thesis Template
Template for bachelor's and master's theses.

## Building
With `make` installed, the included Makefile can be used to compile the
bibliography and document:
- `make` generates the PDF if any of the source files have changed.
- `make verbose` compiles in `errorstopmode`. This may be useful to check for
  errors in the output of `pdflatex`.
- `make view` opens the generated PDF.
- `make clean` removes all build artefacts, aside from the generated PDF itself.
- `make full` compiles the bibliography and the LaTeX document, using three
  compilation runs to obtain the correct references.

## Structure
The main file is `thesis.tex`. It contains some macros for the author name,
thesis title and date, which are used for the title page, page headers and
document metadata. The files `macros.tex` and `packages.tex` are intended for
further macro definitions and package imports, respectively.

Files containing the written content for each section are stored in `sections/`
and are included in the base document using `\input{...}` commands. Images and
diagrammes can be added in the `assets/` subfolder.
