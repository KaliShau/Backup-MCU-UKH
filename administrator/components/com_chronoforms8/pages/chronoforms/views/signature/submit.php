<?php
/**
* ChronoForms 8
* Copyright (c) 2023 ChronoEngine.com, All rights reserved.
* Author: (ChronoEngine.com Team)
* license:     GNU General Public License version 2 or later; see LICENSE.txt
* Visit http://www.ChronoEngine.com for regular updates and information.
**/
defined('_JEXEC') or die('Restricted access');
?>
<?php
$data_uri = $this->data($element["fieldname"]);
if(!empty($data_uri)){
	$encoded_image = explode(",", $data_uri)[1];
	$decoded_image = base64_decode($encoded_image);

	$target_dir = $this->front_path."uploads/";

	if(!empty($element["upload_dir"])){
		$element["upload_dir"] = CF8::parse($element["upload_dir"]);
		if(file_exists($element["upload_dir"])){
			$target_dir = $element["upload_dir"];
		}else{
			$this->errors[$name] = "Error, upload directory does not exist.";
			$this->debug[$element['name'].$element['id']]['error'] = "Upload dir not available: ".$element["upload_dir"];
			return;
		}
	}

	$file_safename = $element['fieldname']."_".gmdate('YmdHis').".png";
	if(!empty($element["filename_provider"])){
		$element["filename_provider"] = CF8::parse($element["filename_provider"]);
		$file_safename = CF8::parse($element["filename_provider"], ["file" => [
			"name" => $file_name,
			"safename" => $file_slug,
			"extension" => $file_extension,
		]]);
	}

	$target_file = $target_dir . $file_safename;
	$target_file = str_replace(["/", "\\"], "/", $target_file);

	file_put_contents($target_file, $decoded_image);
	
	$this->set($element['fieldname'], [
		"path" => $target_file,
	]);
}