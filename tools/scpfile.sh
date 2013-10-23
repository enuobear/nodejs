#! /bin/sh

# scpfile get|push <hostname> <filename>

if [ $2 == 'dev02' ]; then
	hostip="54.249.47.219" #等号两边都不能有空格，有空格就出错
fi

if [ $2 == 'dev08' ]; then
	hostip="54.250.141.112" #等号两边都不能有空格，有空格就出错
fi

if [ $2 == 'beta' ]; then
	hostip="54.249.19.134" #等号两边都不能有空格，有空格就出错
fi

if [ $2 == 'beta2' ]; then
	hostip="54.250.186.215" #等号两边都不能有空格，有空格就出错
fi

#get files
if [ $1 == 'get' ]; then
	if [ ! $4 ]; then
		echo scp -i ~/kr_white.pem mgsys@"$hostip":~/sg-gcard-kr/$3 ~/sg-gcard-kr/$3
		scp -i ~/kr_white.pem mgsys@"$hostip":~/sg-gcard-kr/$3 ~/sg-gcard-kr/$3
	else
		echo scp -i ~/kr_white.pem mgsys@"$hostip":~/sg-gcard-kr/$3 ~/sg-gcard-kr/$4
		scp -i ~/kr_white.pem mgsys@"$hostip":~/sg-gcard-kr/$3 ~/sg-gcard-kr/$4
	fi
fi

#push files
if [ $1 == 'push' ]; then
	if [ ! $4 ]; then
		echo scp -i ~/kr_white.pem ~/sg-gcard-kr/$3 mgsys@"$hostip":~/sg-gcard-kr/$3
		scp -r -i ~/kr_white.pem ~/sg-gcard-kr/$3 mgsys@"$hostip":~/sg-gcard-kr/$3
	else
		echo scp -i ~/kr_white.pem ~/sg-gcard-kr/$3 mgsys@"$hostip":~/sg-gcard-kr/$4
		scp -i ~/kr_white.pem ~/sg-gcard-kr/$3 mgsys@"$hostip":~/sg-gcard-kr/$4
	fi
fi

#open files
if [ $1 == 'open' ]; then
	echo scp -i ~/kr_white.pem mgsys@"$hostip":~/sg-gcard-kr/$3 ~/temp/
	echo open ~/temp/"$filename"
fi

# echo scp -i ~/kr_white.pem mgsys@54.249.47.219:~/sg-gcard-kr/$1 ~/sg-gcard-kr/$2
