# Thesis Template
This repository includes a template for your bachelor's or master's thesis.
You may use the the command runner tool [`just`](https://github.com/casey/just) ([justfile](/justfile)) for easily building the PDF.
The build process assumes that you already have a functioning LaTeX toolchain with `lualatex` installed.
The file `thesis.tex` is the main file and includes each chapter as a separate file located in the [src](/src/) folder.

# Tips

- Use `git` for organising your thesis files. This allows you to easily revert changes and backup your files to Github.
- For ensuring your `.tex` source files remain readable, we adivse you to put every sentence on a separate line.

# Disclaimer

This template provides a basic thesis structure and a brief description of what to put in each chapter.
While this is a good starting point, we offer no guarantee that this structure is appropiate for your particular thesis or covers all requirements for a good grade.
It is your responsibility to appropiately adjust this template to fit your needs and requirements.
