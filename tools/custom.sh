#! /bin/sh

arr=( $@ )	#以”参数1””参数2”...形式保存所有参数
command=$1

#定义常量
pathItem=~/sg-gcard-kr/html.kr/i/gcard/common/item
pathShop=~/sg-gcard-kr/html.kr/i/gcard/common/item/shop
pathBanner=~/sg-gcard-kr/html.kr/i/gcard/gacha/hall_banner

#card images
pathCard=~/Movies/jpg/
tmpFile="${cardPath}tmp"

#scp file
if [ ${command}=='scp_get' || ${command}=='scp_push' ]; then
	case $2 in
		dev02)
			hostip="54.249.47.219"
			;;
		beta)
			hostip="54.249.19.134"
			;;
		beta2)
			hostip="54.250.186.215"	
			;;
		dev08)
			hostip="54.250.141.112"
			;;
	esac
fi

case ${command} in
	item_to_item)
		cp ${pathItem}/$2\_400.jpg ${pathItem}/$3\_400.jpg 
		cp ${pathItem}/$2\_200.jpg ${pathItem}/$3\_200.jpg 
		cp ${pathItem}/$2\_100.jpg ${pathItem}/$3\_100.jpg 
		cp ${pathItem}/$2\_50.jpg ${pathItem}/$3\_50.jpg 
		;;
	item_to_shop)
		cp ${pathItem}/$2\_400.jpg ${pathShop}/$3\_400.jpg 
		cp ${pathItem}/$2\_200.jpg ${pathShop}/$3\_200.jpg 
		cp ${pathItem}/$2\_100.jpg ${pathShop}/$3\_100.jpg 
		cp ${pathItem}/$2\_50.jpg ${pathShop}/$3\_50.jpg 
		;;
	shop_to_shop)
		cp ${pathShop}/$2\_400.jpg ${pathShop}/$3\_400.jpg 
		cp ${pathShop}/$2\_200.jpg ${pathShop}/$3\_200.jpg 
		cp ${pathShop}/$2\_100.jpg ${pathShop}/$3\_100.jpg 
		cp ${pathShop}/$2\_50.jpg ${pathShop}/$3\_50.jpg 
		;;
	shop_to_item)
		cp ${pathShop}/$2\_400.jpg ${pathItem}/$3\_400.jpg 
		cp ${pathShop}/$2\_200.jpg ${pathItem}/$3\_200.jpg 
		cp ${pathShop}/$2\_100.jpg ${pathItem}/$3\_100.jpg 
		cp ${pathShop}/$2\_50.jpg ${pathItem}/$3\_50.jpg 
		;;
	banner)
		cp ${pathBanner}/$2\_190.jpg ${pathBanner}/$3\_190.jpg
		cp ${pathBanner}/$2\_230.jpg ${pathBanner}/$3\_230.jpg
		cp ${pathBanner}/$2\_240.jpg ${pathBanner}/$3\_240.jpg
		cp ${pathBanner}/$2\_456.jpg ${pathBanner}/$3\_456.jpg
		cp ${pathBanner}/$2\_640.jpg ${pathBanner}/$3\_640.jpg
		;;
	scp_get)
		for i in "${arr[@]:2}"
		do
			echo scp -r -i ~/kr_white.pem mgsys@"${hostip}":~/sg-gcard-kr/${i} ~/sg-gcard-kr/${i}
		done
		;;
	scp_push)
		for i in "${arr[@]:2}"
		do
			scp -i ~/kr_white.pem ~/sg-gcard-kr/${i} mgsys@"${hostip}":~/sg-gcard-kr/${i}
		done
		;;
	csv_merge_ko)
		./gccenv i18n csv-merge conf/gcard/locales/ko.csv $2 > tmp.csv
		mv tmp.csv conf/gcard/locales/ko.csv
		echo "merge ko.csv ok!"
		;;
	csv_merge)
		./gccenv i18n csv-merge $2 $3 > $4
		;;
	card_mv)
		ls ${pathCard} | grep -v 'tmp' | grep -v '_special' | grep -v '_' > ${tmpFile}

		if [ ! -s ${tmpFile} ]; then 
			echo "no file change!"
		else
			for i in $(cat ${tmpFile} | awk -F '.' '{print $2}')
			do
				if [ ! $3 ]; then
					echo $i\_$2\_special\.jpg
					mv ${pathCard}$i\.jpg ${pathCard}$i\_$2\_special\.jpg
				else
					echo $i\_$2\.jpg
					mv ${pathCard}$i\.jpg ${pathCard}$i\_$2\.jpg
				fi
			done
		fi
		rm ${tmpFile}
		;;
esac