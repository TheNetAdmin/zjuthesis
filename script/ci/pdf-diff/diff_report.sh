#!/bin/bash

set -x

echo "Install Python package diff-pdf-visually"
pip3 install diff-pdf-visually

echo "Install pdftocairo if not exists"
if ! [ -x "$(command -v pdftocairo)" ]; then
    sudo apt install poppler-utils
fi

echo "Downloading standard baseline pdf files"
if ! [[ -d out/standard ]]; then
    bash ./script/ci/pdf-diff/download_standard_pdf.sh
fi

echo "Start comparing and generating pdf diff report"
mkdir -p diff

pushd diff || exit 1

rm -f report.txt
touch report.txt
# PDF diff report
# 0: two pdf files visually match
# 1: two pdf files has slight visually mismatch
# 2: two pdf files has significant visually mismatch
# 3: standard baseline pdf is missing

for fname in $(ls ../dist/*.pdf); do
    fname=$(basename "$fname")
    fbase=${fname%.*}
    echo Checking "$fbase"
    echo -n "$fbase: " >>report.txt
    mkdir -p "$fbase"
    cp "../dist/$fname" "$fbase/cur-$fname"
    if [[ -f ../out/standard/$fname ]]; then
        cp "../out/standard/$fname" "$fbase/std-$fname"
        pushd "$fbase" || exit 1
        python3 -m diff_pdf_visually -v "cur-$fname" "std-$fname" >"$fbase.log"
        echo $? >>../report.txt
        popd || exit 1
    else
        echo "3" >>report.txt
    fi
done

popd || exit 1

result=$(cat diff/report.txt | cut -d ' ' -f 2 | paste -sd+ - | bc)
if [[ $result -ne 0 ]]; then
    echo "Some pdf diff checks failed, see GitHub artifact for details"
    exit 1
fi