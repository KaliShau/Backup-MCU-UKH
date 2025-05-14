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
	$class = "";
	if(!empty($element["color"])){
		$class .= "colored ".$element["color"]["name"];
	}else{
		$class .= "colored "."slate";
	}
	if(!empty($element["icon"])){
		if(!empty($element["icon"]["position"])){
			$class .= " ".$element["icon"]["position"];
		}
		$class .= " iconed";
	}
	if(!empty($element["position"])){
		$class .= " ".$element["position"];
	}

	$field = $formElementToField($element);
	$field["class"] = $class.(!empty($field["class"]) ? " ".$field["class"] : "");
	// $field = array_merge($formElementToField($element), ["class" => $class]);

	if($element["btype"] == "clear"){
		$field["btype"] = "button";
		$field["code"] .= " data-clear='*'";
	}
	
	if($element["btype"] == "lastpage"){
		$active_page_id = intval($this->get("app_active_page", 0));
		if(array_search($active_page_id, $next_pages) !== false){
			$icon = !empty($field["icon"]) ? Chrono::ShowIcon($field["icon"]) : "";
			echo '<a class="nui button '.$field["class"].'" href="'.Chrono::r(Chrono::addUrlParam($this->current_url, ["chronopage" => $pages_ids_to_alias[array_search($active_page_id, $next_pages)]])).'">'.$icon.$field["label"].'</a>';
		}
	}else if($element["btype"] == "link"){
		$icon = !empty($field["icon"]) ? Chrono::ShowIcon($field["icon"]) : "";
		$url = isset($element["url"]) ? CF8::parse($element["url"]) : "";
		$params = [];
		if(!empty($element['url_parameters'])){
			$lines = CF8::multiline($element['url_parameters']);
			
			foreach($lines as $line){
				$params[$line->name] = CF8::parse($line->value);
			}
		}
		echo '<a class="nui button '.$field["class"].'" '.$field["code"].' href="'.Chrono::r(Chrono::addUrlParam($url, $params)).'">'.$icon.$field["label"].'</a>';
	}else{
		new FormField(... $field);
	}
?>