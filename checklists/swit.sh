#!/bin/sh
localfiles="PICnPAX.pdf katana.pdf archer2.pdf c172r.pdf c182s.pdf"
remotePath="xonqnopp.ch/fly/pdf"

remotefiles=""
for fil in $localfiles; do
	remotefiles="$remotefiles $remotePath/$fil"
done
##
echo " Removing old PDF on server..."
ssh $switchplus "rm -v $remotefiles"
echo " Copying new PDF..."
scp $localfiles $switchplus:$remotePath/
