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
	if(empty($element_info)){
		$element_path = $this->path.'/pages/chronoforms/'.$this->data("type").'/'.$this->data("name");

		$info_path = $element_path."/info.json";
		if(!file_exists($info_path)){
			ChronoSession::setFlash("error", "Element json file not found:".$info_path);
			return;
		}
		$myfile = fopen($info_path, "r") or die("Unable to open file $info_path");
		$data = fread($myfile, filesize($info_path));
		fclose($myfile);
		$element_info = json_decode($data);
	}
	
	$options = [];
	if(!empty($element_info->areas)){
		foreach($element_info->areas as $area){
			$options[] =  new Option(text:$area->title, value:$area->name, html:'<span class="nui label '.$area->color.'">'.$area->title.'</span>');
		}
	}

	$selected = [];
?>
<?php new FormField(name: "elements[$id][events][]", type:"select", label: "Events", multiple:true, selected:$selected, options:$options, code:"data-formbuilder_dynamicevents='$id'", hint:"Select which events to listen to."); ?>