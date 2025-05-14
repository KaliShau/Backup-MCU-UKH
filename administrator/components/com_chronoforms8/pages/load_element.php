<?php
/**
* ChronoForms 8
* Copyright (c) 2023 ChronoEngine.com, All rights reserved.
* Author: (ChronoEngine.com Team)
* license:     GNU General Public License version 2 or later; see LICENSE.txt
* Visit http://www.ChronoEngine.com for regular updates and information.
**/
defined('_JEXEC') or die('Restricted access');

$id = ChronoApp::$instance->data("id");
$pid = ChronoApp::$instance->data("pid");
$section = ChronoApp::$instance->data("section");
$name = ChronoApp::$instance->data("name");
$type = ChronoApp::$instance->data("type");

$element_path = __DIR__.'/chronoforms/'.$type.'/'.$name;

$info_path = $element_path."/info.json";
if(!file_exists($info_path)){
	ChronoSession::setFlash("error", "Element json file not found:".$info_path);
	return;
}
$myfile = fopen($info_path, "r") or die("Unable to open file $info_path");
$data = fread($myfile, filesize($info_path));
fclose($myfile);
$info = json_decode($data);
$element_info = $info;

$element = [];
if(isset(ChronoApp::$instance->data["elements"][$id])){
	$element = ChronoApp::$instance->data["elements"][$id];
}

$behaviors_path = __DIR__.'/chronoforms/behaviors/';
$listBehaviors = function($id, $list, $default = []) use($element_info){
	$options = [];
	
	usort($list, function($a, $b){
		if(str_contains($a, ".")){
			return -1;
		}else if(str_contains($b, ".")){
			return 1;
		}else{
			return strcmp($a, $b);
			if(str_starts_with($a, "validation_")){
				return 1;
			}
			return 0;
		}
	});
	$list[] = "acl";
	$list[] = "wizard_settings";
	$list[] = "run_conditions";
	
	foreach($list as $behavior){
		$info_path = __DIR__.'/chronoforms/behaviors/'.$behavior."/info.json";
		if(str_contains($behavior, ".")){
			$info_path = __DIR__.'/chronoforms/'.ChronoApp::$instance->data("type").'/'.ChronoApp::$instance->data("name").'/behaviors/'.explode(".", $behavior)[1]."/info.json";
		}
		$myfile = fopen($info_path, "r");
		if($myfile === false){
			continue;
		}
		$data = fread($myfile, filesize($info_path));
		fclose($myfile);
		$info = json_decode($data);
		$color = "";
		if(str_contains($behavior, ".")){
			$color = "blue";
		}else if(str_contains($behavior, "validation_")){
			$color = "red";
		}
		$options[] =  new Option(text:$info->text, value:$behavior, html:'<span class="nui label '.$color.'">'.(isset($info->icon) ? Chrono::ShowIcon($info->icon) : "").$info->text.'</span><span class="nui right">'.$info->description."</span>");
	}

	if(empty(ChronoApp::$instance->data["elements"][$id]) && !empty($default)){
		foreach($default as $behavior){
			ChronoApp::$instance->data["elements"][$id]["behaviors"][] = $behavior;
		}
	}

	// $element = [];
	// if(isset(ChronoApp::$instance->data["elements"][$id])){
	// 	$element = ChronoApp::$instance->data["elements"][$id];
	// }

	new FormField(name: "elements[".$id."][behaviors][]", type:"select", label: "Behaviors", multiple:true, options:$options, code: 'data-behaviors="1"');
	
	$saved = Chrono::getVal(ChronoApp::$instance->data, ["elements", $id, "behaviors"]);
	echo '<div class="nui flex vertical p1 divided rounded accordion behaviors_list">';
	if((!is_null($saved) && count($saved) > 0) || !empty($default)){
		if(!is_null($saved) && count($saved) > 0){
			foreach($saved as $behavior){
				ChronoApp::$instance->SetData("behavior", $behavior);
				require(__DIR__ . "/load_behavior.php");
			}
		}else{
			// foreach($default as $behavior){
			// 	ChronoApp::$instance->SetData("behavior", $behavior);
			// 	require(__DIR__ . "/load_behavior.php");
			// }
		}
		
	}
	echo '</div>';
};
// $loadElements = function ($elements, $pid, $section) use(&$loadElements) {
// 	foreach ($elements as $element) {
// 		if ($element["type"] != "page") {
// 			if ($element["parent"] == $pid && $element["section"] == $section) {
// 				$element["pid"] = $pid;
// 				ChronoApp::$instance->MergeData($element);
// 				require(__DIR__ . "/load_element.php");
// 			}
// 		}
// 	}
// };

$label = "";

if(!empty($element["type"])){
	if($element["type"] == "actions"){
		$label .= '&nbsp;<span class="nui label rounded blue link show-settings">'.CF8::getname($element).'</span>';
	}
}else{
	$label .= '&nbsp;<span class="nui label rounded blue link show-settings">'.$name.$id.'</span>';
}

if(!empty($element["fieldname"])){
	$label .= '&nbsp;<span class="nui label rounded bordered dashed">'.$element["fieldname"].'</span>';
}

if(!empty($element["label"])){
	$label .= '&nbsp;<span class="nui label rounded grey">'.(strlen($element["label"]) > 50 ? substr(strip_tags($element["label"]), 0, 50)."..." : $element["label"]).'</span>';
}

if(!empty($element["settings"]["designer_label"])){
	$lcolor = "grey";
	if(!empty($element["settings"]["designer_label_color"])){
		$lcolor = "colored ".$element["settings"]["designer_label_color"];
	}
	$label .= '&nbsp;<span class="nui label rounded '.$lcolor.'">'.$element["settings"]["designer_label"].'</span>';
}
if(!empty($element["behaviors"])){
	if(in_array("run_conditions", $element["behaviors"])){
		$label .= '&nbsp;<span class="nui label red small" title="This element has Run Conditions set">'.Chrono::ShowIcon("question").'</span>';
	}
	if(in_array("acl", $element["behaviors"])){
		$label .= '&nbsp;<span class="nui label red small" title="This element has ACL set">'.Chrono::ShowIcon("shield").'</span>';
	}
	if(in_array("validation_required", $element["behaviors"])){
		$label .= '&nbsp;<span class="nui label red small" title="This element is required">'.Chrono::ShowIcon("asterisk").'</span>';
	}
	if(in_array("events_triggers", $element["behaviors"])){
		$label .= '&nbsp;<span class="nui label red small" title="This element has Events Triggers">'.Chrono::ShowIcon("bolt").'</span>';
	}
	if(in_array("events_listeners", $element["behaviors"])){
		$label .= '&nbsp;<span class="nui label red small" title="This element has Events Listeners">'.Chrono::ShowIcon("headphones").'</span>';
	}
}

$color = "teal inverted";
if($type == "actions"){
	$color = "purple inverted";
}
// $areas = "";
// if(!empty($info->areas)){
// 	foreach($info->areas as $area){
// 		$areas .= '<div class="nui p1 flex vertical spaced bottom block dashed thick bordered rounded droppable sortable '.$area->color.'" data-pid="'.$id.'" data-section="'.$area->name.'" data-title="'.$area->title.'" style="min-height:50px;" data-hint="'.(isset($area->note) ? $area->note : "").'">';
// 		if(isset($elements) && isset($loadElements)){
// 			ob_start();
// 			//$loadElements($elements, $id, $area->name);
// 			$areas .= ob_get_clean();
// 		}
// 		$areas .= '</div>';
// 	}
// }
$layout = '<div class="nui flex" '.(!empty($element["settings"]["disabled"]) ? 'style="opacity:0.4;"' : '').'><span class="nui label rounded colored '.$color.'">'.Chrono::ShowIcon($info->icon).$info->title.(!empty($info->premium) ? Chrono::ShowIcon("dollar-sign nui black") : "").'</span>'.$label.'</div>';
if(!empty(Chrono::getVal($this->settings, "items_hints", "1")) && !empty($info->hints)){
	$hints = '<div class="nui flex bottom block">';
	$hints_found = false;
	foreach($info->hints as $hint_name => $hint_title){
		if(str_starts_with($hint_name, "behaviors.")){
			if(in_array(str_replace("behaviors.", "", $hint_name), $element["behaviors"])){
				$hints_found = true;
				$hints .= '<span class="nui label rounded grey"><strong>'.$hint_title.'</strong></span>&nbsp;';
			}
		}else{
			$hints_found = true;
			$hints .= '<span class="nui label rounded grey">'.$hint_title.": <strong>".(!empty($element[$hint_name]) ? implode(", ", (array)$element[$hint_name]) : "").'</strong></span>&nbsp;';
		}
	}
	$hints .= "</div>";

	if($hints_found){
		$layout .= $hints;
	}
}

ob_start();
if($type == "actions"){
?>
<div class="equal fields nui hidden block settings-box">
	<?php new FormField(name: "elements[$id][settings][disabled]", type:"select", label: "Disabled", options:[
		new Option(text:"No", value:""),
		new Option(text:"Yes", value:"1"),
	], hint:"Disable this Element so that it will not run"); ?>
	<?php new FormField(name: "elements[$id][settings][name]", label: "Name", value:"", hint:"The element name to use in shortcodes"); ?>
</div>
<?php
}
$layout .= ob_get_clean();

ob_start();
require($element_path."/config.php");
$config = ob_get_clean();
?>
<div data-pid='<?php echo $id; ?>' data-title='<?php echo $info->title; ?>' class='nui p1 bordered white rounded draggable form_item dropped'>
	<input type="hidden" name="elements[<?php echo $id; ?>][id]" value='<?php echo $id; ?>'>
	<input type="hidden" name="elements[<?php echo $id; ?>][parent]" value='<?php echo $pid; ?>'>
	<input type="hidden" name="elements[<?php echo $id; ?>][section]" value='<?php echo $section; ?>'>
	<input type="hidden" name="elements[<?php echo $id; ?>][name]" value='<?php echo $name; ?>'>
	<input type="hidden" name="elements[<?php echo $id; ?>][type]" value='<?php echo $type; ?>'>

	<?php echo $layout; ?>

	<div class="nui hidden actions source">
		<div class="nui label blue rounded link edit_item" title="Edit"><?php echo Chrono::ShowIcon("wrench"); ?></div>
		<!-- <div class="nui label grey rounded link copy_item"><?php echo Chrono::ShowIcon("copy"); ?></div> -->
		<div class="nui label yellow rounded link drag_item" title="Move"><?php echo Chrono::ShowIcon("sort"); ?></div>
		<div class="nui label red rounded link remove_item" title="Remove"><?php echo Chrono::ShowIcon("xmark"); ?></div>
	</div>

	<div class="nui form p1 block config bordered rounded grey">
		<?php echo $config; ?>
	</div>

	<?php 
	$areas = "";
	if(empty($info->areas)){
		$info->areas = [];
	}
	if(!empty($element["events"])){
		foreach((array)$element["events"] as $event){
			foreach($info->areas as $k => $area){
				if((!isset($area->custom) OR ($area->custom == false)) && ($area->name == $event)){
					$info->areas[$k]->custom = true;
					continue 2;
				}
			}
			$area = new stdClass();
			$area->color = "blue";
			$area->name = isset($event["name"]) ? $event["name"] : $event;
			$area->title = isset($event["name"]) ? $event["name"] : $event;
			$area->custom = true;
			$info->areas[] = $area;
		}
	}
	if(!empty($info->areas)){
		foreach($info->areas as $area){
			$result = "";
			if(isset($elements) && isset($loadElements)){
				ob_start();
				$loadElements($elements, $id, $area->name);
				$result = ob_get_clean();
			}
			if(!empty($result) || !empty($area->custom)){
				$areas .= '<div class="nui p1 flex vertical spaced bottom block dashed bordered rounded droppable sortable '.$area->color.'" data-pid="'.$id.'" data-section="'.$area->name.'" data-title="'.$area->title.'" data-eventname="'.$area->title.'" style="min-height:50px;" data-hint="'.(isset($area->note) ? $area->note : "").'">';
				$areas .= $result;
				$areas .= '</div>';
			}
		}
	}
	echo $areas;
	?>
</div>