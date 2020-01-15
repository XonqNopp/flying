#!/bin/sh
localfiles="PICnPAX.pdf"
localfiles="$localfiles katana.pdf"
localfiles="$localfiles archer2.pdf"
#localfiles="$localfiles c172r.pdf"
#localfiles="$localfiles c182s.pdf"
localfiles="$localfiles robin400140b.pdf"

if [ $# -gt 0 ]; then
	localfiles="$@"
fi

remotePath="xonqnopp.ch/fly/pdf"

remotefiles=""
for fil in $localfiles; do
	if [ ! -f $fil ]; then
		echo "Missing: $fil"
		exit 1
	fi

	remotefiles="$remotefiles $remotePath/$fil"
done
##
echo " Removing old PDF on server..."
ssh $switchplus "rm -v $remotefiles"
echo " Copying new PDF..."
scp $localfiles $switchplus:$remotePath/
