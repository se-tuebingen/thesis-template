# Thesis Template

This repository includes a template for your thesis.

## Getting started

1. Click the "Use this template" button on GitHub and make a new private repository for your thesis.
2. Clone your new repository with `git`.
3. Run `make` to check that everything works. The resulting thesis file should be in `thesis.pdf`.
4. Fill in the blanks in `metadata.tex`.
5. Read through the example code, then erase it.
6. Write your thesis.
7. Remove the `todos.tex` file before submitting, making sure to not leave any $${\color{red}}$$ text in the thesis.
8. Submit and defend the thesis!

### Installing LaTeX

Make sure to install a LaTeX toolchain with `lualatex` support.

- On a unix-style system, use TeXLive, your package manager has something like `texlive-full` or `texlive-scheme-full`.
- On Windows, use [MiKTeX](https://www.tug.org/texlive/windows.html).

#### Editor support

- For a local-first Overleaf-like experience (viewing the PDF on-the-fly, SyncTeX, completions, etc.), we recommend using VSCode with the `james-yu.latex-workshop` package.
- For local-first rule-based spell-checking and grammar, we recommend using VSCode with the `ltex-plus.vscode-ltex-plus` package based on LanguageTool.

## Disclaimer

This template provides a basic thesis structure and a brief description of what to put in each chapter.
While this is a good starting point, we offer no guarantee that this structure is appropriate for your particular thesis or covers all requirements for a good grade.
It is _your_ responsibility to appropriately adjust this template to fit your needs and requirements.

## License

Most of the default text and the overall structure is based on <https://github.com/exaexa/better-mff-thesis>,
which is available in the public domain. Thanks!
