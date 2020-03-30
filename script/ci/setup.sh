#!/bin/bash

echo "Setup for CI"

# get fonts
echo "Getting FangSong.ttf"
wget https://raw.githubusercontent.com/Haixing-Hu/latex-chinese-fonts/master/chinese/%E4%BB%BF%E5%AE%8B%E4%BD%93/FangSong.ttf
echo "Getting TimesNewRoman.ttf"
wget https://raw.githubusercontent.com/Haixing-Hu/latex-chinese-fonts/master/english/Serif/TimesNewRoman.ttf
echo "Getting SimSun.ttc"
wget https://raw.githubusercontent.com/Haixing-Hu/latex-chinese-fonts/master/chinese/%E5%AE%8B%E4%BD%93/SimSun.ttc

pwd
ls -la

# change fonts
format_dir=config/format
font_specs=("$format_dir/general/fonts.tex"
            "$format_dir/major/cs/fonts.tex"
)

for font_spec in ${font_specs[@]}; do
    echo "Updating $font_spec"
    sed -i 's/{Times New Roman}/{TimesNewRoman.ttf}/' $font_spec
    sed -i 's/setCJKmainfont{\\FangSongFontName}/setCJKmainfont{FangSong.ttf}/' $font_spec
    sed -i 's/{SimSun}/{SimSun.ttc}/' $font_spec
done
