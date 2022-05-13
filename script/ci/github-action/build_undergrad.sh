#! /bin/bash

this_path="$( cd "$(dirname "$0")" ; pwd -P )"
project_path=$this_path/../../../

source $this_path/build_zjuthesis.sh

echo "CD $project_path"
cd $project_path

degree="undergraduate"
main_majors=("general" "cs")
sample_majors=("isee" "math" "physics")
types=("thesis")
periods=("final" "proposal")

mkdir -p dist

# The last two arugments "doctor" and "chinese" takes no effect for "undergraduate"
# Should improve the build_zjuthesis.sh::build_zjuthesis function
build_zjuthesis $degree "general" "thesis" "final" "true" "doctor" "chinese"

for major  in "${main_majors[@]}"; do
for period in "${periods[@]}";     do
for type   in "${types[@]}";       do
    build_zjuthesis $degree $major $type $period "false" "doctor" "chinese"
done
done
done

build_zjuthesis $degree "cs" "design" "proposal" "false" "doctor" "chinese"
build_zjuthesis $degree "cs" "design" "final"    "false" "doctor" "chinese"

for major in ${sample_majors[@]}; do
    build_zjuthesis $degree $major "thesis" "final" "false" "doctor" "chinese"
done
