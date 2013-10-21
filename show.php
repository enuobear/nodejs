<?php   
	header('Access-Control-Allow-Origin: *');
	// $dir = $_REQUEST;
	$getDir = $_POST;
	$dir = $getDir['filedir'];
	//$dir = "ru502";
	$return_result = array();
	$return_result = "";
	if(is_dir($dir)){   
		if($dh = opendir($dir)){
			while (($file = readdir($dh)) !== false) {   
				if($file!="." && $file!=".." && strpos($file, '_200_special')>0){ 
					$return_result[] = array(
						'fileName' => $file,
						'fileDir'  => $dir
					);
				}   
			}   
			closedir($dh);   
		}   
	}
	echo json_encode($return_result);
	//echo $return_result['fileName'];
	// $myjson = my_json_encode($return_result);
	// echo $myjson;

	// function my_json_encode($tfile){
	// 	return json_encode($file);
	// }
?>
