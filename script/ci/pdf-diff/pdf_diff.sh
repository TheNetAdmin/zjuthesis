#!/bin/bash

# This script is from:
# https://gist.githubusercontent.com/brechtm/891de9f72516c1b2cbc1/raw/760936b65956e523e0d5227bf471c9a1fea0744e/diffpdf.sh

# usage: diffpdf.sh file_1.pdf file_2.pdf

# requirements:
# - ImageMagick
# - Poppler's pdftoppm and pdfinfo tools (works with 0.18.4 and 0.41.0,
#                                         fails with 0.42.0)
#   (could be replaced with Ghostscript if speed is
#    not important - see commented commands below)

DIFFDIR="pdfdiff"                        # directory to place diff images in
MAXPROCS=$(getconf _NPROCESSORS_ONLN)    # number of parallel processes

pdf_file1=$1
pdf_file2=$2

function diff_page {
    # based on http://stackoverflow.com/a/33673440/438249
    pdf_file1=$1
    pdf_file2=$2
    page_number=$3
    page_index=$(($page_number - 1))

    # 2+x faster
    (cat $pdf_file1 | pdftoppm -f $page_number -singlefile -gray - | convert - miff:- ; \
     cat $pdf_file2 | pdftoppm -f $page_number -singlefile -gray - | convert - miff:- ) | \
    convert - \( -clone 0-1 -compose darken -composite \) \
            -channel RGB -combine $DIFFDIR/$page_number.jpg

    # 2x faster (breaks when using TIFF format instead of JPEG, and PNG is slow)
#    (pdftocairo -f $page_number -singlefile -jpeg $pdf_file1 -gray - | convert - miff:- ; \
#     pdftocairo -f $page_number -singlefile -jpeg $pdf_file2 -gray - | convert - miff:- ) | \
#    convert - \( -clone 0-1 -compose darken -composite \) \
#            -channel RGB -combine $DIFFDIR/$page_number.jpg

    # 1x (using Ghostscript for PDF to bitmap conversion)
#    convert -respect-parenthesis \
#            \( $pdf_file1[$page_index] -flatten -colorspace gray \) \
#            \( $pdf_file2[$page_index] -flatten -colorspace gray \) \
#            \( -clone 0-1 -compose darken -composite \) \
#            -channel RGB -combine $DIFFDIR/$page_number.jpg

#    compare $pdf_file1[$page_index] $pdf_file2[$page_index] \
#            -highlight-color blue $DIFFDIR/$page_number.png

    if (($? > 0)); then
        echo "Problem running pdftoppm or convert!"
        exit 1
    fi
    grayscale=$(convert $DIFFDIR/$page_number.jpg -colorspace HSL -channel g -separate +channel -format "%[fx:mean]" info:)
    if [ "$grayscale" != "0" ]; then
        echo "page $page_number ($grayscale)"
        return 1
    fi
    return 0
}

function num_pages {
    pdf_file=$1

    pdfinfo $pdf_file | grep "Pages:" | awk '{print $2}'
}

function minimum {
    echo $(( $1 < $2 ? $1 : $2 ))
}

# guard against accidental deletion of files in the root directory
if [ -z "$DIFFDIR" ]; then
    echo "DIFFDIR needs to be set!"
    exit 1
fi

pdf1_num_pages=$(num_pages $pdf_file1)
pdf2_num_pages=$(num_pages $pdf_file2)

min_pages=$(minimum $pdf1_num_pages $pdf2_num_pages)

if [ "$pdf1_num_pages" -ne "$pdf2_num_pages" ]; then
    echo "PDF files have different lengths ($pdf1_num_pages and $pdf2_num_pages)"
    rc=1
fi

if [ -d "$DIFFDIR" ]; then
    rm -f $DIFFDIR/*
else
    mkdir $DIFFDIR
fi


# get exit status from subshells http://stackoverflow.com/a/29535256/438249

function wait_for_processes {
    local rc=0

    while (( "$#" )); do
        # wait returns the exit status for the process
        if ! wait "$1"; then
            rc=1
        fi
        shift
    done
    return $rc
}

function howmany() {
    echo $#
}

rc=0
pids=""
for page_number in `seq 1 $min_pages`;
do
    diff_page $pdf_file1 $pdf_file2 $page_number &
    pids+=" $!"
    if [ $(howmany $pids) -eq "$MAXPROCS" ]; then
        if ! wait_for_processes $pids; then
            rc=1
        fi
        pids=""
    fi
done

if ! wait_for_processes $pids; then
    rc=1
fi

exit $rc
