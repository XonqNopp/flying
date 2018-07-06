#!/bin/sh
##
ssh="ssh-728988-gi@188.93.15.140"
remotePath="xonqnopp.ch/fly/pdf"
##
localfiles="RoadMap.pdf"
remotefiles=""
for fil in $localfiles; do
	remotefiles="$remotefiles $remotePath/$fil"
done
##
echo " Removing old PDF on server..."
ssh $ssh "rm -v $remotefiles"
echo " Copying new PDF..."
scp $localfiles $ssh:$remotePath/
