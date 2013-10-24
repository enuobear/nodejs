#! /bin/sh

cardpath="/Users/xiongshaole/Movies/jpg/"

ls ${cardpath} | grep -v '.txt' > ${cardpath}1.txt

for i in $(cat ${cardpath}1.txt | awk -F '.' '{print $1}')
do
echo mv ${cardpath}$i\.jpg ${cardpath}$i\_$1\_special\.jpg
done
