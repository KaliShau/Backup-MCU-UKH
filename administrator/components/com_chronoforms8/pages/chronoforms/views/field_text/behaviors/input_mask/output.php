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
$options = [];

if(!empty($element['imask_variable'])){
	$options = trim($element['imask_variable']);
}else if(!empty($element['imask_options'])){
	$imask_options = trim($element['imask_options']);
	
	$lines = CF8::multiline($imask_options);

	$replaces = [];
	
	foreach($lines as $line){
		$options[$line->name] = CF8::parse($line->value);

		if($options[$line->name] == "false"){
			$options[$line->name] = false;
		}else if($options[$line->name] == "true"){
			$options[$line->name] = true;
		}else if(is_numeric($options[$line->name]) && !in_array($line->name, ["mask"])){
			$options[$line->name] = (int)$options[$line->name];
		}else if($line->name == "mask" && str_starts_with($options[$line->name], "/")){
			$replaces[] = $options[$line->name];
		}
	}

	$options = json_encode($options, JSON_UNESCAPED_SLASHES);
}

$element["code"] = (!empty($element["code"]) ? $element["code"] : "").' data-imask=\''.$options.'\'';