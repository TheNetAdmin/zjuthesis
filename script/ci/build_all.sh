#!/bin/bash

texfile=zjuthesis.tex

function build() {
    # $1 degree
    # $2 major
    # $3 type
    # $4 period
    # $5 blind
    sed -i -r "s/Degree\s*=\s*.*/Degree = $1,/" $texfile
    sed -i -r "s/MajorFormat\s*=\s*.*/MajorFormat = $2,/" $texfile
    sed -i -r "s/Type\s*=\s*.*/Type = $3,/" $texfile
    sed -i -r "s/Period\s*=\s*.*/Period = $4,/" $texfile
    sed -i -r "s/BlindReview\s*=\s*.*/BlindReview = $5,/" $texfile

    echo -e "Build degree[$1]\tmajor[$2]\ttype[$3]\tperiod[$4]\tblind[$5]"
    latexmk -xelatex -outdir=out

    blind_suffix=""
    if [ $4 == "true" ]
    then
        blind_suffix="-blind"
    fi

    mv out/zjuthesis.pdf dist/zjuthesis-$1-$2-$3-$4$blind_suffix.pdf
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
            build $degree $major $type $period "false"
        done
    done
done

for major in ${sample_majors[@]}; do
    build $degree $major "thesis" "final" "false"
done


# Build graduate

degree="graduate"
types=("design" "thesis" "equal")

build $degree "general" "thesis" "final" "true"

for type in ${types[@]}; do
    build $degree "general" $type "final" "false"
done