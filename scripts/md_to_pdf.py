#!/usr/bin/env python3

import pathlib
import subprocess
import sys

bib = '/home/eddie/bibs/library.bib'
csl = '/home/eddie/.pandoc/csl/transactions-on-computer-human-interaction.csl'
options = 'markdown+simple_tables+table_captions+yaml_metadata_block+smart'

p = pathlib.Path(sys.argv[1])

md = p.with_suffix('.md')
pdf = p.with_suffix('.pdf')

command = (
    f'pandoc -r {options} -s '
    f'--pdf-engine=pdflatex '
    f'--filter pandoc-citeproc '
    f'--csl="{csl}" '
    f'--bibliography="{bib}" '
    f'-o "{pdf}" "{md}"'
)

proc = subprocess.Popen(command)

