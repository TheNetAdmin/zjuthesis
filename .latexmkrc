$out_dir="out";
$pdf_mode=5;
$xelatex="xelatex -outdir=out";
$xdvipdfmx="xdvipdfmx -q -E -o %D %O %S";
$clean_ext = 'thm bbl hd loe synctex.gz xdv run.xml';
$makeindex = 'makeindex -s gind.ist %O -o %D %S';

@default_files=('zjuthesis.tex')

