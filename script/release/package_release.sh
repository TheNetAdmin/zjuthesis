#!/bin/bash

ver=$(git describe --abbrev=0 --dirty)
dir=$1
pkgname=zjuthesis-$ver

if [ -z $dir ]
then
  echo "No output dir specified"
  exit 1
fi

if [[ $(git diff --stat) != '' ]]; then
  echo "Git repo dirty, abort packaging"
  exit 1
fi

mkdir -p $dir

echo "Packaging $dir/$pkgname.zip"
git archive --format=zip --prefix=zjuthesis/ -o $dir/$pkgname.zip $ver

