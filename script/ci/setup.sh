#!/bin/bash

echo "Setup fonts"

# get fonts
mkdir -p fonts
pushd fonts
echo "Getting FangSong fonts"
wget https://raw.githubusercontent.com/Haixing-Hu/latex-chinese-fonts/master/chinese/%E4%BB%BF%E5%AE%8B%E4%BD%93/FangSong.ttf
echo "Getting TimesNewRoman fonts"
wget https://raw.githubusercontent.com/Haixing-Hu/latex-chinese-fonts/master/english/Serif/TimesNewRoman.ttf
wget https://raw.githubusercontent.com/Haixing-Hu/latex-chinese-fonts/master/english/Serif/TimesNewRomanBold.ttf
wget https://raw.githubusercontent.com/Haixing-Hu/latex-chinese-fonts/master/english/Serif/TimesNewRomanItalic.ttf
wget https://raw.githubusercontent.com/Haixing-Hu/latex-chinese-fonts/master/english/Serif/TimesNewRomanBoldItalic.ttf
echo "Getting SimSun fonts"
wget https://raw.githubusercontent.com/Haixing-Hu/latex-chinese-fonts/master/chinese/%E5%AE%8B%E4%BD%93/SimSun.ttc
popd

pwd
ls -la

# change fonts
format_dir=config/format
font_specs=(
    "$format_dir/general/fonts.tex"
    "$format_dir/major/cs/fonts.tex"
)

for font_spec in ${font_specs[@]}; do
    echo "Updating $font_spec"
    sed -i 's/{Times New Roman}/[Path=.\/fonts\/, BoldFont={*Bold}, ItalicFont={*Italic}, BoldItalicFont={*BoldItalic}]{TimesNewRoman}/' $font_spec
    sed -i 's/setCJKmainfont{\\FangSongFontName}/setCJKmainfont[Path=.\/fonts\/]{FangSong}/' $font_spec
    sed -i 's/{SimSun}/[Path=.\/fonts\/]{SimSun}/' $font_spec
done
