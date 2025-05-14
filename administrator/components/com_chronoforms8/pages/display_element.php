<?php
/**
* ChronoForms 8
* Copyright (c) 2023 ChronoEngine.com, All rights reserved.
* Author: (ChronoEngine.com Team)
* license:     GNU General Public License version 2 or later; see LICENSE.txt
* Visit http://www.ChronoEngine.com for regular updates and information.
**/
defined('_JEXEC') or die('Restricted access');

if(!empty($element["behaviors"])){
	foreach($element["behaviors"] as $behavior){
		$bv_path = __DIR__.'/chronoforms/behaviors/'.$behavior;
		if(str_contains($behavior, ".")){
			$bv_path = __DIR__.'/chronoforms/'.$element["type"].'/'.$element["name"].'/behaviors/'.explode(".", $behavior)[1];
		}
		// echo $bv_path;
		if(file_exists($bv_path."/output.php")){
			require($bv_path."/output.php");
		}
	}

	if(isset($element["settings"]["disabled"]) && !empty($element["settings"]["disabled"])){
		return;
	}
}

$formElementToField = function($element){
	$field = [
		"type" => str_replace("field_", "", $element["name"]),
		"name" => $element["fieldname"],
		"label" => isset($element["label"]) ? $element["label"] : null,
		"toplabel" => isset($element["toplabel"]) ? $element["toplabel"] : null,
		"options" => isset($element["options"]) ? $element["options"] : null,
		"value" => isset($element["default_value"]) ? $element["default_value"]["value"] : (isset($element["value"]) ? $element["value"] : ""),
		"hint" => isset($element["hint"]) ? $element["hint"]["text"] : "",
		"tooltip" => isset($element["tooltip"]) ? $element["tooltip"]["text"] : "",
		"placeholder" => isset($element["placeholder"]) ? $element["placeholder"]["text"] : "",
		"icon" => isset($element["icon"]) ? $element["icon"]["name"] : "",
		"code" => isset($element["code"]) ? $element["code"] : "",
		"styles" => isset($element["styles"]) ? $element["styles"] : "",
		"column_count" => isset($element["column_count"]) ? $element["column_count"] : "1",
		"labeled" => isset($element["labeled"]) ? $element["labeled"] : false,
		"selected" => isset($element["selected"]) ? $element["selected"] : [],
	];

	if(!empty($element["icon"]["position"])){
		$field["icon_pos"] = $element["icon"]["position"];
	}

	// if(!empty($element["btype"])){
	// 	$field["btype"] = $element["btype"];
	// }

	// if(!empty($element["rows"])){
	// 	$field["rows"] = $element["rows"];
	// 	$field["cols"] = $element["cols"];
	// }

	// if(!empty($element["input_type"])){
	// 	$field["input_type"] = $element["input_type"];
	// }

	foreach($element as $k => $v){
		if(in_array($k, ["max", "min", "step", "input_type", "rows", "cols", "btype", "field_class", "display"])){
			$field[$k] = $v;
		}
	}

	if(!empty($element["checked"])){
		$field["checked"] = true;
	}

	// if(!empty($element["selected_values"])){
	// 	$field["selected"] = [];
	// 	foreach((array)$element["selected_values"] as $value){
	// 		$field["selected"] = array_merge($field["selected"], (array)CF8::parse($value));
	// 	}
	// 	// $field["selected"] = $element["selected_values"];
	// }

	// if(!empty($element["field_class"])){
	// 	$field["field_class"] = $element["field_class"];
	// }

	if(!empty($element["state"]["hidden"])){
		$field["field_class"] = (isset($field["field_class"]) ? $field["field_class"] : "")." hidden";
	}

	if(!empty($element["state"]["disabled"])){
		$field["field_class"] = (isset($field["field_class"]) ? $field["field_class"] : "")." disabled";
	}

	if(!empty($element["color"]["name"])){
		$field["color"] = $element["color"]["name"];
	}

	if(isset($element["fields_layout"])){
		$field["layout"] = $element["fields_layout"];
	}

	if(!empty($element["extensions"])){
		$field["extensions"] = $element["extensions"];
	}

	if(!empty($element["dynamic_options"])){
		$datasource = CF8::parse($element["dynamic_options"]["datasource"]);
		
		if(is_array($datasource)){
			foreach($datasource as $k => $row){
				$field["options"] .= "\n".CF8::parse($element["dynamic_options"]["value"], ["row" => $row])."=".CF8::parse($element["dynamic_options"]["text"], ["row" => $row]);
			}
		}
	}

	if(!empty($element["attributes"])){
		$lines = CF8::multiline($element["attributes"]);
		
		foreach($lines as $line){
			if($line->name == "class"){
				$field["class"] = htmlspecialchars($line->value);
			}else{
				$field["code"] .= " ".$line->name.'="'.htmlspecialchars($line->value).'"';
			}
		}
	}

	foreach($element as $kp => $kv){
		if(str_starts_with($kp, "data-")){
			if(is_array($kv)){
				$kv = json_encode($kv, JSON_NUMERIC_CHECK);
			}
			$field["code"] .= " ".$kp.'="'.htmlspecialchars($kv).'"';
		}
	}

	if(!empty(ChronoApp::$instance->errors[$element["fieldname"]])){
		$field["errors"] = (array)ChronoApp::$instance->errors[$element["fieldname"]];
	}

	if(!empty($element["behaviors"])){
		$rules = [];
		foreach($element["behaviors"] as $behavior){
			if(str_starts_with($behavior, "validation_") && !empty($element[$behavior])){
				$rule = [
					"type" => str_replace("validation_", "", $behavior),
					// "prompt" => $element[$behavior]["prompt"],
				];
				$rule = array_merge($rule, $element[$behavior]);
				if(isset($rule["php"])){
					unset($rule["php"]);
				}
				$rules[] = $rule;
			}
		}
		if(count($rules) > 0){
			$validations = ["rules" => $rules];
			if($field["type"] == "radios" || $field["type"] == "checkboxes"){
				$validations["multiple"] = true;
			}
			$field["code"] .= " data-validations='".json_encode($validations)."'";
		}

		if(in_array("multi_selection", $element["behaviors"])){
			$field["multiple"] = true;
		}
	}

	$field['name'] = CF8::parse($field['name']);

	return $field;
};

if($element["type"] == "actions"){
	$action = $element;
	// foreach($action as $k => $v){
	// 	if(!in_array($k, ["id", "name", "type", "parent", "section", "fieldname", "behaviors"])){
	// 		if(!is_array($v)){
	// 			$action[$k] = CF8::parse($v);
	// 		}else{
	// 			foreach($v as $vk => $value){
	// 				$action[$k][$vk] = CF8::parse($value);
	// 			}
	// 		}
	// 	}
	// }
	// $action["name"] = !empty($element["settings"]["name"]) ? $element["settings"]["name"] : $element["name"].$element["id"];
}else{
	$view = $element;
	// $view["name"] = !empty($element["settings"]["name"]) ? $element["settings"]["name"] : $element["name"].$element["id"];
}

$view_path = __DIR__.'/chronoforms/'.$element["type"].'/'.$element["name"];

$json_path = $view_path . "/info.json";
if(file_exists($json_path)){
	$myfile = fopen($json_path, "r");
	$data = fread($myfile, filesize($json_path));
	fclose($myfile);
	$json = json_decode($data, true);

	if(!empty($json["premium"]) && !$this->isAdmin() && !$this->validated(true)){
		ChronoSession::setFlash("warning", "Using ".$json["title"]." on the frontend is limited to premium installs, please support us with a purchase.");
		return;
	}
	
	ob_start();
	require($view_path."/output.php");
	$output = ob_get_clean();

	$output = CF8::parse($output);
	echo $output;
}
?>