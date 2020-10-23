#!/bin/bash

git pull

old_ver=$(perl -lne 'print $1 if /([0-9]+\.[0-9]+\.[0-9]+[\-\drc]*)/' config/version.tex)
new_ver=$1

if [ -z $new_ver ]
then
  echo "No new version specified, current version $old_ver"
  echo "Usage: $0 version_number(without leading 'v')"
  exit 1
fi

echo "$old_ver ==> $new_ver"
echo Commit message: "Bump to $new_ver"
echo "Press any key to proceed (no changes made so far)"
read

echo "Update config/version.tex"
sed -r -i "s/[0-9]+\.[0-9]+\.[0-9]+[0-9rc\-]*/$new_ver/" config/version.tex || true
cat config/version.tex
git add config/version.tex
git commit -am "Bump to $new_ver"

echo "Press any key to tag current commit"
read
git tag -a "v$new_ver" -m "Bump to $new_ver"
git push
git push --tags
