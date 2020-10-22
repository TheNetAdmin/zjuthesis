#!/bin/bash

echo "Setup fonts"

# get fonts
mkdir -p fonts
pushd fonts
echo "Getting TimesNewRoman fonts"
wget https://raw.githubusercontent.com/Haixing-Hu/latex-chinese-fonts/master/english/Serif/TimesNewRoman.ttf
wget https://raw.githubusercontent.com/Haixing-Hu/latex-chinese-fonts/master/english/Serif/TimesNewRomanBold.ttf
wget https://raw.githubusercontent.com/Haixing-Hu/latex-chinese-fonts/master/english/Serif/TimesNewRomanItalic.ttf
wget https://raw.githubusercontent.com/Haixing-Hu/latex-chinese-fonts/master/english/Serif/TimesNewRomanBoldItalic.ttf
echo "Getting FangSong fonts"
wget https://raw.githubusercontent.com/Haixing-Hu/latex-chinese-fonts/master/chinese/%E4%BB%BF%E5%AE%8B%E4%BD%93/FangSong.ttf
echo "Getting SimSun fonts"
wget https://raw.githubusercontent.com/Haixing-Hu/latex-chinese-fonts/master/chinese/%E5%AE%8B%E4%BD%93/SimSun.ttc
echo "Getting SimHei fonts"
wget https://raw.githubusercontent.com//Haixing-Hu/latex-chinese-fonts/master/chinese/%E9%BB%91%E4%BD%93/SimHei.ttf
echo "Getting SimKai fonts"
wget https://raw.githubusercontent.com//Haixing-Hu/latex-chinese-fonts/master/chinese/%E6%A5%B7%E4%BD%93/Kaiti.ttf
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
    sed -i "s/setmainfont{Times New Roman}/setmainfont[Path=.\/fonts\/, BoldFont={*Bold}, ItalicFont={*Italic}, BoldItalicFont={*BoldItalic}]{TimesNewRoman}/g" $font_spec

    # Change all the lines like:
    #    \setCJKmainfont[...]{...}
    # to:
    #    \setCJKmainfont[..., Path=./fonts/]{...}
    sed -rie 's/(\\setcjkmainfont.*?)]/\1, Path=.\/fonts\/]/gi' $font_spec

    # Change all the lines like:
    #    \setCJKfamilyfont{...}{...}[...]
    # to:
    #    \setCJKfamilyfont{...}{...}[..., Path=./fonts/]
    sed -rie 's/(\\setcjkfamilyfont.*?)]/\1, Path=.\/fonts\/]/gi' $font_spec
done
