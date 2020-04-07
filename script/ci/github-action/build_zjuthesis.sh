#!/bin/bash

texfile=zjuthesis.tex

function build_zjuthesis() {
    # $1 degree
    # $2 major
    # $3 type
    # $4 period
    # $5 blind
    # $6 grad_level
    # $7 language
    sed -i -r "s/Degree\s*=\s*.*/Degree = $1,/" $texfile
    sed -i -r "s/MajorFormat\s*=\s*.*/MajorFormat = $2,/" $texfile
    sed -i -r "s/Type\s*=\s*.*/Type = $3,/" $texfile
    sed -i -r "s/Period\s*=\s*.*/Period = $4,/" $texfile
    sed -i -r "s/BlindReview\s*=\s*.*/BlindReview = $5,/" $texfile
    sed -i -r "s/GradLevel\s*=\s*.*/GradLevel = $6,/" $texfile
    sed -i -r "s/Language\s*=\s*.*/Language = $7,/" $texfile

    echo -e "BUILD zjuthesis" \
        "\n\tdegree     [$1]" \
        "\n\tmajor      [$2]" \
        "\n\ttype       [$3]" \
        "\n\tperiod     [$4]" \
        "\n\tblind      [$5]" \
        "\n\tgrad_level [$6]" \
        "\n\tlanguage   [$7]"
    
    blind_suffix=""
    if [ $5 == "true" ]
    then
        blind_suffix="-blind"
    fi

    grad_suffix=""
    if [ $1 == "graduate" ]
    then
        grad_suffix="-$6"
    fi

    lang_suffix=""
    if [ $7 == "english" ]
    then
        lang_suffix="-english"
    fi
    
    local build_suffix=$1$grad_suffix-$2-$3-$4$blind_suffix$lang_suffix
    local out_path=out-ci/$build_suffix
    latexmk -xelatex -outdir=$out_path

    cp $out_path/zjuthesis.pdf dist/zjuthesis-$build_suffix.pdf
}
