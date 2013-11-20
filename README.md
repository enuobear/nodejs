#custom
	配置.bash_profile alias
	alias custom="~/nodejs/tools/custom.sh" 

###copy_item
	custom item_to_item [filename] [filename]
	custom item_to_shop [filename] [filename]
	custom shop_to_shop [filename] [filename]
	custom shop_to_item [filename] [filename]

###banner
	custom [原图片名称] [目标图片名称]

###scp_get/scp_push
	custom scp_get/scp_push [主机名] [文件名列表 ...]

###csv_merge_ko
	custom csv_merge_ko [需要导入csv文件]

###csv_merge
	custom csv_merge [主csv文件] [需要导入的csv文件] [合并后的csv文件]

###card_mv
	*custom card_mv [图片尺寸]
	例如：
	custom card_mv 400
	将会生存special图片

	*custom card_mv [图片尺寸] no
	将会生存不带special的图片