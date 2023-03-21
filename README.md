# fha-thesis-template

Dieses Repository enthält eine LaTeX-Vorlage für die Bachelorarbeit im Fachbereich Medizintechnik und Technomathematik der Fachhochschule Aachen.

## Features

### Contents
- [x] Titelseite / Title page
- [x] Eidesstattliche Erklärung / Declaration of originality
- [x] Zusammenfassung / Abstract
- [x] Danksagung / Acknowledgements
- [x] Inhaltsverzeichnis / Table of contents

### Design
- [x] Verdana font (Corporate Design)
- [x] Page numbers
    - [x] Roman numerals for front matter
    - [x] Arabic numerals for main and back matter
- [x] Chapters always starting on a right page
- [x] Page margings fitted for DIN A4 printing

## Prerequisites

- [TeX Live](https://www.tug.org/texlive/)
- [VS Code](https://code.visualstudio.com/)
- [LaTeX Workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop)
- [LaTeX Utilities](https://marketplace.visualstudio.com/items?itemName=tecosaur.latex-utilities)
- Verdana font (see below for installation instructions for Linux, comes preinstalled on Windows)

## Installing the Verdana font (Linux using `apt`)

```
sudo apt install ttf-mscorefonts-installer
```

## VS Code Setup

```json
"latex-workshop.latex.tools": [
        {
            "name": "xelatexmk",
            "command": "latexmk",
            "args": [
                "-xelatex",
                "-synctex=1",
                "--shell-escape",
                "-interaction=nonstopmode",
                "-file-line-error",
                "-outdir=%OUTDIR%",
                "%DOC%"
            ]
        },
        {
            "name": "latexmk",
            "command": "latexmk",
            "args": [
                "-synctex=1",
                "-interaction=nonstopmode",
                "-file-line-error",
                "-pdf",
                "-outdir=%OUTDIR%",
                "%DOC%"
            ],
            "env": {}
        },
        {
            "name": "pdflatex",
            "command": "pdflatex",
            "args": [
                "--shell-escape",
                "-synctex=1",
                "-interaction=nonstopmode",
                "-file-line-error",
                "%DOC%"
            ]
        },
        {
            "name": "biber",
            "command": "biber",
            "args": [
                "%DOCFILE%"
            ],
            "env": {}
        },
    ],
    "latex-workshop.latex.recipes": [
        {
            "name": "latexmk (xelatex)",
            "tools": [
                "xelatexmk"
            ]
        },
        {
            "name": "latexmk",
            "tools": [
                "latexmk"
            ]
        },
        {
            "name": "pdflatex",
            "tools": [
                "pdflatex"
            ]
        },
        {
            "name": "pdflatex ➞ biber ➞ pdflatex × 2",
            "tools": [
                "pdflatex",
                "biber",
                "pdflatex",
                "pdflatex"
            ]
        }
    ],
```

## Usage

This template needs to be compiled with `xelatex` to support the Verdana font. The `latexmk` tool is recommended for this.

In VS Code, you can use the `latexmk` recipe to compile the document using `pdflatex`. 
Alternatively, you can use the `latexmk (xelatex)` recipe to compile the document using `xelatex` - **this is the recommended way**.

Alternatively, you can use the `latexmk` tool from the command line:

```sh
latexmk -xelatex -synctex=1 --shell-escape -interaction=nonstopmode -file-line-error -outdir=build example.tex
```

## Options 

- `showframe`: Show page frames
- `english`: Use English language (TODO: not implemented yet)


## License

[GPLv3](LICENSE)