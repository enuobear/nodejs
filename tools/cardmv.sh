#! /bin/sh

for i in $(cat ~/Movies/jpg/1.txt | awk -F '.' '{print $1}')
do
mv ~/Movies/jpg/$i\.jpg ~/Movies/jpg/$i\_$1\_special\.jpg
done
