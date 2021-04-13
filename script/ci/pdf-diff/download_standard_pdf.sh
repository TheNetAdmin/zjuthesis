#!/bin/bash

# https://gist.github.com/steinwaywhw/a4cd19cda655b8249d908261a62687f8
out_dir=${1:-out/standard}

mkdir -p "$out_dir"
pushd "$out_dir" || exit 1
git clone --depth=1 https://github.com/TheNetAdmin/zjuthesis-std.git
cp zjuthesis-std/baseline/*.pdf .
popd || exit 1