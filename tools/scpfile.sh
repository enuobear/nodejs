#! /bin/sh

# scpfile get|push <hostname> <filename>
arr=( $@ )

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
	for i in "${arr[@]:2}"
	do
		echo scp -i ~/kr_white.pem mgsys@"${hostip}":~/sg-gcard-kr/${i} ~/sg-gcard-kr/${i}
		scp -i ~/kr_white.pem mgsys@"${hostip}":~/sg-gcard-kr/${i} ~/sg-gcard-kr/${i}
	done
fi

#push files
if [ $1 == 'push' ]; then
	for i in "${arr[@]:2}"
	do
		echo scp -i ~/kr_white.pem ~/sg-gcard-kr/${i} mgsys@"${hostip}":~/sg-gcard-kr/${i}
		scp -i ~/kr_white.pem ~/sg-gcard-kr/${i} mgsys@"${hostip}":~/sg-gcard-kr/${i}
	done
fi
