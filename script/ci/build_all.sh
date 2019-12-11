#!/bin/bash

texfile=zjuthesis.tex

function build() {
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

    echo -e "Build degree[$1]\tmajor[$2]\ttype[$3]\tperiod[$4]\tblind[$5]\tgrad_level[%6]\tlanguage[$7"
    latexmk -xelatex -outdir=out

    blind_suffix=""
    if [ $5 == "true" ]
    then
        blind_suffix="-blind"
    fi

    grad_suffix=""
    if [ $1 == "graduate" ]
    then
        grad_suffix="-master"
    fi

    lang_suffix=""
    if [ $7 == "english" ]
    then
        lang_suffix="-english"
    fi

    mv out/zjuthesis.pdf dist/zjuthesis-$1-$2$grad_suffix-$3-$4$blind_suffix$lang_siffix.pdf
}

project_dir="$( cd "$(dirname "$0")" ; pwd -P )"/../../
echo "CD $project_dir"
cd $project_dir


# Build undergraduate

degree="undergraduate"
main_majors=("general" "cs")
sample_majors=("isee" "math" "physics")
types=("design" "thesis")
periods=("final" "proposal")

mkdir -p dist

build $degree "general" "thesis" "final" "true"

for major in ${main_majors[@]}; do
    for period in ${periods[@]}; do
        for type in ${types[@]}; do
            build $degree $major $type $period "false" "doctor" "chinese"
        done
    done
done

for major in ${sample_majors[@]}; do
    build $degree $major "thesis" "final" "false" "doctor" "chinese"
done


# Build graduate

degree="graduate"
types=("design" "thesis" "equal")

build $degree "general" "thesis" "final" "true" "doctor" "chinese"

for type in ${types[@]}; do
    build $degree "general" $type "final" "false" "doctor" "chinese"
done

build "graduate" "cs"      "thesis" "final" "false" "master" "chinese"
build "graduate" "general" "thesis" "final" "false" "doctor" "english"