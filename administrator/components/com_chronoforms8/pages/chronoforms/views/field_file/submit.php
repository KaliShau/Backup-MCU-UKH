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
$name = CF8::parse($element["fieldname"]);
if(str_ends_with($name, '[n]')){
	$name = str_replace('[n]', '', $name);
}
if(!isset($_FILES[$name]) || (is_string($_FILES[$name]["name"]) && strlen($_FILES[$name]["name"]) == 0)){
	return;
}

if(is_array($_FILES[$name]["name"])){
	if(count($_FILES[$name]["name"]) == 0){
		return;
	}
	foreach($_FILES[$name]["name"] as $k => $filename){
		if(is_string($filename) && strlen($filename) == 0){
			return;
		}
	}
}

$target_dir = $this->front_path."uploads/";

if(!empty($element["upload_dir"])){
	$element["upload_dir"] = CF8::parse($element["upload_dir"]);
	if(file_exists($element["upload_dir"])){
		$target_dir = $element["upload_dir"];
	}else{
		if(!empty($element["create_upload_dir"])){
			if (mkdir($element["upload_dir"], 0755, true)) { // 0755 sets permissions, 'true' allows recursive creation
				$target_dir = $element["upload_dir"];
			}else{
				$this->errors[$name] = "Error, Could not create upload directory.";
				$this->debug[$element['name'].$element['id']]['error'] = "Upload dir not available: ".$element["upload_dir"];
				return;
			}
		}else{
			$this->errors[$name] = "Error, upload directory does not exist.";
			$this->debug[$element['name'].$element['id']]['error'] = "Upload dir not available: ".$element["upload_dir"];
			return;
		}
	}
}
$target_dir = "/".ltrim($target_dir, "/\\");

// Chrono::pr($_FILES[$name]);
// die();

$_files = $_FILES[$name];
$multiple = true;
if(!is_array($_FILES[$name]["name"])){
	$multiple = false;
	foreach($_FILES[$name] as $key => $value){
		$_files[$key] = [$value];
	}
}

foreach($_files["name"] as $fk => $_file_name){
	$pathinfo = pathinfo(basename($_files["name"][$fk]));

	$file_extension = strtolower($pathinfo["extension"]);
	$file_name = basename($pathinfo["filename"]);
	$file_slug = Chrono::slug($file_name);

	$file_safename = $file_slug."_".gmdate('YmdHis').".".$file_extension;
	if(!empty($element["filename_provider"])){
		$element["filename_provider"] = CF8::parse($element["filename_provider"]);
		$file_safename = CF8::parse($element["filename_provider"], ["file" => [
			"name" => $file_name,
			"safename" => $file_slug,
			"extension" => $file_extension,
		]]);
		// $file_safename = str_replace(["NAME", "SLUG", "EXTENSION"], [$file_name, $file_slug, $file_extension], $element["filename_provider"]);
	}

	$target_file = $target_dir . $file_safename;
	$target_file = str_replace(["/", "\\"], "/", $target_file);
	
	if (file_exists($target_file) && !in_array("field_file.overwrite", $element["behaviors"])) {
		$this->errors[$name] = "Sorry, file already exists.";
		return;
	}

	// Check file size
	if ($_files["size"][$fk] > intval($element["max_size"]) * 1000) {
		$this->errors[$name] = sprintf("Sorry, your file is too large, the maximum file size is %s KB.", intval($element["max_size"]));
		return;
	}

	// Allow certain file formats
	$element["extensions"] = !empty($element["extensions"]) ? $element["extensions"] : [];
	if (!in_array($file_extension, (array)$element["extensions"])) {
		$this->errors[$name] = "Sorry, only ".implode(", ", (array)$element["extensions"])." files are allowed.";
		return;
	}

	if (move_uploaded_file($_files["tmp_name"][$fk], $target_file)) {
		if($multiple){
			$prev = $this->data($name, []);
			$prev[] = $file_safename;
			$this->SetData($name, $prev);
		}else{
			$this->SetData($name, $file_safename);
		}

		$this->debug[$element['name'].$element['id']]['success'][] = "File ".$file_name.".".$file_extension." was uploaded to ".$target_file;
	} else {
		$this->errors[$name] = "Sorry, there was an error uploading your file.";
		return;
	}
}

$path = $target_dir . $file_safename;
if($multiple){
	$path = [];
	$files = $this->data($name, []);
	foreach($files as $file){
		$path[] = $target_dir . $file;
	}
}
$this->set($element['fieldname'], [
	"path" => $path,
]);