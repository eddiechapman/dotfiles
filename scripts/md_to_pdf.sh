#!/bin/bash

md_filename="$1"
pdf_filename="${md_filename%.*}.pdf"

pandoc "$1" \
    -f gfm \
    --highlight-style /home/eddie/dotfiles/scripts/pygments.theme \
    -V linkcolor:blue \
    -V geometry:a4paper \
    -V geometry:margin=2cm \
    --pdf-engine=xelatex \
    -o "$pdf_filename"

