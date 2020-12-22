#!/bin/bash

# https://gist.github.com/steinwaywhw/a4cd19cda655b8249d908261a62687f8
out_dir=${1:-out/standard}
repo=${2:-thenetadmin/zjuthesis}
tag=${3:-latest}
standard_url=https://api.github.com/repos/${repo}/releases/tags/${tag}

mkdir -p $out_dir
pushd $out_dir
curl -s $standard_url | grep url | grep pdf | cut -d '"' -f 4 | wget -qi -
popd