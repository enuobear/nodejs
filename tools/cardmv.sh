#! /bin/sh

cardPath="/Users/xiongshaole/Movies/jpg/"
tmpFile="${cardPath}tmp"

ls ${cardPath} | grep -v 'tmp' | grep -v '_special' | grep -v '_' > ${tmpFile}

if [ ! -s ${tmpFile} ]; then 
	echo "no file change!"
else
	for i in $(cat ${tmpFile} | awk -F '.' '{print $1}')
	do
		if [ ! $2 ]; then
			echo $i\_$1\_special\.jpg
			mv ${cardPath}$i\.jpg ${cardPath}$i\_$1\_special\.jpg
		else
			echo $i\_$1\.jpg
			mv ${cardPath}$i\.jpg ${cardPath}$i\_$1\.jpg
		fi
	done
fi
rm ${tmpFile}
