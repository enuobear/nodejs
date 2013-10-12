#! /bin/sh

for i in $(ls ~/sg-gcard-kr/html.kr/i/gcard/common/card/ | grep $1 | grep 'enemy' | awk -F '_' '{print $3}')
do
echo cp ~/sg-gcard-kr/html.kr/i/gcard/common/card/$1\_enemy\_$i ~/sg-gcard-kr/html.kr/i/gcard/common/card/$1\_$i
done
