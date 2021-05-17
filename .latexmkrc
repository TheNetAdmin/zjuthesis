$out_dir="out";
$pdf_mode=5;
$xelatex="xelatex -synctex=1";
$xdvipdfmx="xdvipdfmx -q -E -o %D %O %S";
$clean_ext = 'thm bbl hd loe xdv run.xml nlg nls';
$makeindex = 'makeindex -s gind.ist %O -o %D %S';

# Custom dependency and function for nomencl package 
add_cus_dep( 'nlo', 'nls', 0, 'makenlo2nls' );
sub makenlo2nls {
 system("makeindex \"$_[0].nlo\" -s nomencl.ist -o \"$_[0].nls\" -t \"$_[0].nlg\"" );
}

@default_files=('zjuthesis.tex')
