#!/bin/sh

rm ~/tempscp/*
scp -i ~/kr_white.pem mgsys@54.249.47.219:~/sg-gcard-kr/$1 ~/tempscp
echo ls ~/tempscp | xargs open
