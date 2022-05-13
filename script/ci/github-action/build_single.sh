#! /bin/bash

this_path="$(dirname "$(realpath "$0")")"
project_path=$this_path/../../../

source "$this_path/build_zjuthesis.sh"

echo "CD $project_path"
cd "$project_path" || exit 1

mkdir -p dist

build_zjuthesis "$@"
