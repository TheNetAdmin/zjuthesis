#! /bin/bash

this_path="$( cd "$(dirname "$0")" ; pwd -P )"
project_path=$this_path/../../../

source $this_path/build_zjuthesis.sh

echo "CD $project_dir"
cd $project_dir

degree="graduate"
types=("design" "thesis" "equal")

build_zjuthesis $degree "general" "thesis" "final" "true" "doctor" "chinese"

for type in ${types[@]}; do
    build_zjuthesis $degree "general" $type "final" "false" "doctor" "chinese"
done

build_zjuthesis $degree "cs"      "thesis" "final" "false" "master" "chinese"
build_zjuthesis $degree "general" "thesis" "final" "false" "doctor" "english"
