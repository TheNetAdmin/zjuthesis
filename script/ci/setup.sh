#!/bin/bash

set -e
set -x

this_path="$(dirname "$(realpath "$0")")"
project_path="$(realpath "$this_path/../../")"

targets=${1:-all}
setup_lipsum=${setup_lipsum:-y}

if [ "$targets" == "all" ] || [ "$targets" == "fonts" ]; then
    echo "Setup fonts"

    # get fonts
    mkdir -p fonts
    pushd fonts
    echo "Getting TimesNewRoman fonts"
    wget -c https://raw.githubusercontent.com/Haixing-Hu/latex-chinese-fonts/master/english/Serif/TimesNewRoman.ttf
    wget -c https://raw.githubusercontent.com/Haixing-Hu/latex-chinese-fonts/master/english/Serif/TimesNewRomanBold.ttf
    wget -c https://raw.githubusercontent.com/Haixing-Hu/latex-chinese-fonts/master/english/Serif/TimesNewRomanItalic.ttf
    wget -c https://raw.githubusercontent.com/Haixing-Hu/latex-chinese-fonts/master/english/Serif/TimesNewRomanBoldItalic.ttf
    echo "Getting FangSong fonts"
    wget -c https://raw.githubusercontent.com/Haixing-Hu/latex-chinese-fonts/master/chinese/%E4%BB%BF%E5%AE%8B%E4%BD%93/FangSong.ttf
    echo "Getting SimSun fonts"
    wget -c https://raw.githubusercontent.com/Haixing-Hu/latex-chinese-fonts/master/chinese/%E5%AE%8B%E4%BD%93/SimSun.ttc
    echo "Getting SimHei fonts"
    wget -c https://raw.githubusercontent.com/Haixing-Hu/latex-chinese-fonts/master/chinese/%E9%BB%91%E4%BD%93/SimHei.ttf
    echo "Getting SimKai fonts"
    wget -c https://raw.githubusercontent.com/Haixing-Hu/latex-chinese-fonts/master/chinese/%E6%A5%B7%E4%BD%93/Kaiti.ttf
    wget -c https://raw.githubusercontent.com/Halfish/lstm-ctc-ocr/master/fonts/simkai.ttf
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
        sed -ri 's/(\\setcjkmainfont.*?)]/\1, Path=.\/fonts\/]/gi' $font_spec

        # Change all the lines like:
        #    \setCJKfamilyfont{...}{...}[...]
        # to:
        #    \setCJKfamilyfont{...}{...}[..., Path=./fonts/]
        sed -ri 's/(\\setcjkfamilyfont.*?)]/\1, Path=.\/fonts\/]/gi' $font_spec
    done
fi


if [ "$setup_lipsum" == "y" ]; then
    if [ "$targets" == "all" ] || [ "$targets" == "content" ]; then
        echo "Setup testing content"

        echo "\usepackage{lipsum}" >> "$format_dir/../packages.tex"
        echo "\usepackage{zhlipsum}" >> "$format_dir/../packages.tex"

        cp $this_path/template/content.tex $project_path/body/graduate/content.tex
        cp $this_path/template/content.tex $project_path/body/undergraduate/final/content.tex
        cp $this_path/template/content.tex $project_path/body/undergraduate/proposal/content.tex
    fi
fi
