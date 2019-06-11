#!/bin/bash

texfile=zjuthesis.tex

function build() {
    # $1 major
    # $2 type
    # $3 period
    # $4 blind
    sed -i -r "s/MajorFormat\s*=\s*.*/MajorFormat = $1,/" $texfile
    sed -i -r "s/Type\s*=\s*.*/Type = $2,/" $texfile
    sed -i -r "s/Period\s*=\s*.*/Period = $3,/" $texfile
    sed -i -r "s/BlindReview\s*=\s*.*/BlindReview = $4,/" $texfile

    echo -e "Build major[$1]\ttype[$2]\tperiod[$3]\tblind[$4]"
    latexmk -xelatex -outdir=out -quiet >out/$1-$2-$3-$4.log 2>&1

    blind_suffix=""
    if [ $4 == "true" ]
    then
        blind_suffix="-blind"
    fi

    mv out/zjuthesis.pdf dist/zjuthesis-$1-$2-$3$blind_suffix.pdf
}

project_dir="$( cd "$(dirname "$0")" ; pwd -P )"/../../
echo "CD $project_dir"
cd $project_dir

source script/ci/setup.sh

main_majors=("general" "cs")
sample_majors=("isee" "math" "physics")
types=("design" "thesis")
periods=("final" "proposal")

mkdir -p dist

build "general" "thesis" "final" "true"

for major in ${main_majors[@]}; do
    for period in ${periods[@]}; do
        for type in ${types[@]}; do
            build $major $type $period "false"
        done
    done
done

for major in ${sample_majors}; do
    build $major "thesis" "final" "false"
done