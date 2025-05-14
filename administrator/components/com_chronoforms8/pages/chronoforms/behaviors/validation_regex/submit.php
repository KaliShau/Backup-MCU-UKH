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
$data = Chrono::getVal($this->data, $name);

if(!empty($element["listeners"])){
	foreach($element["listeners"] as $k => $listener){
		if(!empty($listener["actions"]) && in_array("disable_validation", $listener["actions"])){
			return;
		}
	}
}

if(strlen($data) > 0 && !empty($element["validation_regex"]["regex"])){
	$result = preg_match($element["validation_regex"]["regex"], $data);
	if($result != 1){
		$this->errors[$name] = $element["validation_regex"]["prompt"];
	}
}