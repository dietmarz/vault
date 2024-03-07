#!/bin/bash

baseDir=$1;

if [ "$baseDir" = "" ]; then
	baseDir=.
fi

echo "Sorting baseDir: ${baseDir}";

files=`find ${baseDir} | egrep -i 'jpeg|jpg'`;

for file in ${files}
do
	photoDate=`exif -t 0x9003 ${file} | grep Value | awk '{print $2}' | sed 's/:/_/g'`;
	echo "The date: $photoDate"

        if [ "$photoDate" = "" ]; then
		photoDate="unknown"
        fi

	targetDir=${baseDir}/${photoDate}

	if [ ! -d "${targetDir}" ]; then
		echo "Creating baseDir: ${targetDir}"
		mkdir ${targetDir}
	fi

	echo "Moving: `basename ${file}` to ${targetDir}"
        mv ${file} ${targetDir}
done


