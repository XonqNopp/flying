#!/bin/sh
if [ $# != 2 ]; then
	echo "usage:   $0 printer list"
	return
fi
printer=$1
list="$2.pdf"
echo " Printing $list on printer $printer..."
lp \
	-d $printer \
	-o media=a4 \
	-o sides=two-sided-short-edge \
	-o page-top=0 \
	-o page-bottom=0 \
	-o page-left=0 \
	-o page-right=0 \
	-o fit-to-page \
	$list
