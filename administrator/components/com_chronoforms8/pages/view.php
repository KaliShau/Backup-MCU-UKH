<?php

/**
 * ChronoForms 8
 * Copyright (c) 2023 ChronoEngine.com, All rights reserved.
 * Author: (ChronoEngine.com Team)
 * license:     GNU General Public License version 2 or later; see LICENSE.txt
 * Visit http://www.ChronoEngine.com for regular updates and information.
 **/
defined('_JEXEC') or die('Restricted access');

$conditions = [['id', "=", $this->data("id")]];
if ($this->DataExists("chronoform")) {
	$conditions = [['alias', "=", $this->data("chronoform")]];
}
if (!$this->isAdmin()) {
	$conditions[] = "AND";
	$conditions[] = ['published', "=", 1];
}

$row =  CF8Model::instance()->Select(conditions: $conditions, single: true);
$elements = [1 => ["id" => 1, "type" => "page"]];
if (empty($row)) {
	echo "Form not found.";
	return;
}
$elements = $row["elements"];

if(ChronoApp::isJoomla() && !$this->isAdmin() && !empty($row["params"]["acl"])){
	if(!in_array($row["params"]["acl"], $this->user()->getAuthorisedViewLevels())){
		ChronoSession::setFlash("error", $row["params"]["acl_error"]);
		return;
	}
}
if(isset($this->vars["app_viewlevels"])){
	unset($this->vars["app_viewlevels"]);
}

$this->loadLanguageFile(alias:"/locales");

if(!empty($row["params"]["locales"])){
	foreach($row["params"]["locales"]["lang"] as $k => $lang){
		if($lang == $this->locale){
			$strings = $row["params"]["locales"]["strings"][$k];
			$lines = CF8::multiline($strings);
			foreach($lines as $line){
				CF8::$locales[$line->name] = !empty($line->value) ? $line->value : $line->name;
			}

			break;
		}
	}
}

$views_path = __DIR__ . '/chronoforms/views/';

// $active_page = 0;
$active_page_id = 0;
$active_page_group = "";
$active_section = "load";
$pages_ids = [];
$next_pages = [];
$pages = [];
$pages_alias_to_id = [];
$pages_ids_to_alias = [];
$pages_ids_to_pagegroup = [];
$pages_groups = [];
$elements_by_parent = [];
$elements_by_name = [];
$is_ending_page = false;

foreach ($row["elements"] as $element) {
	if ($element["type"] == "page") {
		$pages_ids[] = $element["id"];
		if(count($pages_ids) == 1){
			$active_page_id = $element["id"];
		}

		$pages[$element["id"]] = $element;
		if(isset($element["alias"]) && !empty(trim($element["alias"]))){
			$pages_alias_to_id[trim($element["alias"])] = $element["id"];//count($pages_ids) - 1;
			$pages_ids_to_alias[$element["id"]] = trim($element["alias"]);
		}else{
			$pages_alias_to_id["page".$element["id"]] = $element["id"];//count($pages_ids) - 1;
			$pages_ids_to_alias[$element["id"]] = "page".$element["id"];
		}

		if(!isset($element["pagegroup"])){
			$element["pagegroup"] = "";
		}

		$pages_ids_to_pagegroup[$element["id"]] = trim($element["pagegroup"]);

		if(!empty($pages_groups[trim($element["pagegroup"])])){
			$next_pages[$pages_groups[trim($element["pagegroup"])][count($pages_groups[trim($element["pagegroup"])]) - 1]] = $element["id"];
		}

		$pages_groups[trim($element["pagegroup"])][] = $element["id"];

		// if(!empty(trim($element["pagegroup"]))){
		// 	$pages_ids_to_pagegroup[$element["id"]] = trim($element["pagegroup"]);

		// 	$pages_groups[trim($element["pagegroup"])][] = $element["id"];

		// 	if(!empty($pages_groups[trim($element["pagegroup"])])){
		// 		$next_pages[$pages_groups[trim($element["pagegroup"])][count($pages_groups[trim($element["pagegroup"])]) - 1]] = $element["id"];
		// 	}
		// }else{
		// 	$next_pages[$pages_ids[count($pages_ids) - 1]] = $element["id"];
		// }
	}else if ($element["type"] == "actions"){
		$elements_by_name[CF8::getname($element)] = $element;
		CF8::$actions[CF8::getname($element)] = function($return = false)use($element){
			if($return){
				ob_start();
			}
			require(__DIR__ . "/display_element.php");
			if($return){
				return ob_get_clean();
			}
		};
	}else if ($element["type"] == "views"){
		$elements_by_name[CF8::getname($element)] = $element;
		CF8::$views[CF8::getname($element)] = function($return = false)use($element){
			if($return){
				ob_start();
			}
			require(__DIR__ . "/display_element.php");
			if($return){
				return ob_get_clean();
			}
		};
	}

	if ($element["type"] != "page") {
		$elements_by_parent[$element["parent"]][] = $element;
	}
}

// foreach ($row["elements"] as $element) {
// 	if ($element["type"] != "page") {
// 		$elements_by_parent[$element["parent"]][] = $element;
// 	}
// }

$sectoken = "";
$completed_pages = ChronoSession::get("chronoforms8_pages_" . $row["id"], []);
$completed_data = ChronoSession::get("chronoforms8_data_" . $row["id"], []);
$completed_vars = ChronoSession::get("chronoforms8_vars_" . $row["id"], []);
$completed_elements = ChronoSession::get("chronoforms8_elements_" . $row["id"], []);

if ($this->isPost && $this->data("chronoform") == $row["alias"] && ($this->data("output") != "ajax")) {
	if (!$this->DataExists("sectoken") || ChronoSession::get("sectoken". $row["id"], "") != $this->data("sectoken")) {
		$active_page_id = $pages_ids[0];
		$active_section = "load";
		$this->errors[] = CF8::parse(Chrono::getVal($row["params"], "session_token_error", "Your session has timed out or your tried to access a wrong page."));
	} else {
		if ($this->DataExists("chronopage") && strlen($this->data("chronopage"))) {
			// if(is_numeric($this->data("chronopage"))){
			// 	$active_page = intval($this->data("chronopage"));
			// }else{
			// 	$active_page = !empty($pages_alias_to_id[$this->data("chronopage")]) ? $pages_alias_to_id[$this->data("chronopage")] : 0;
			// }

			$active_page_id = !empty($pages_alias_to_id[$this->data("chronopage")]) ? $pages_alias_to_id[$this->data("chronopage")] : $active_page_id;
		}

		$active_section = "submit";

		// ChronoSession::clear("sectoken");
	}
} else {
	// if ($row["params"]["page_jump"] == "1") {
		if ($this->DataExists("chronopage") && strlen($this->data("chronopage"))) {
			// if(is_numeric($this->data("chronopage"))){
			// 	$active_page = intval($this->data("chronopage"));
			// }else{
			// 	$active_page = !empty($pages_alias_to_id[$this->data("chronopage")]) ? $pages_alias_to_id[$this->data("chronopage")] : 0;
			// }

			$active_page_id = !empty($pages_alias_to_id[$this->data("chronopage")]) ? $pages_alias_to_id[$this->data("chronopage")] : $active_page_id;
		}
	// }
}

// if ($active_page > count($pages_ids) - 1) {
// 	$active_page = count($pages_ids) - 1;
// } else if ($active_page < 0) {
// 	$active_page = 0;
// }

if ($row["params"]["next_page"] == "1") {
	if ($active_page_id != $pages_groups[$pages_ids_to_pagegroup[$active_page_id]][0]) {
		foreach($pages_groups[$pages_ids_to_pagegroup[$active_page_id]] as $pid) {
			if($pid == $active_page_id){
				break;
			}
			if (!in_array($pid, $completed_pages) && !isset($completed_vars["next_page"])) {
				$active_page_id = $pid;
				$active_section = "load";
				break;
			}
		}
	}
}

// if($active_page_id == 0){
// 	$active_page_id = $pages_ids[0];
// }
$active_page_group = isset($pages_ids_to_pagegroup[$active_page_id]) ? $pages_ids_to_pagegroup[$active_page_id] : "";

// Chrono::pr([
// 	"active_page_id" => $active_page_id, 
// 	"next_pages" => $next_pages, 
// 	"ending_page" => $is_ending_page, 
// 	"pages_ids" => $pages_ids, 
// 	"pages_groups" => $pages_groups, 
// 	"completed_pages" => $completed_pages,
// 	"pages_ids_to_pagegroup" => $pages_ids_to_pagegroup,
// ]);

$abort = false;
$DisplayElements = function ($elements_by_parent, $parent_id, $section) use ($row, &$DisplayElements, &$completed_elements, $elements_by_name, $active_page_id, $next_pages, $pages_ids_to_alias, $pages_ids, &$active_section, &$abort) {
	static $current_page_id, $current_page_section;
	if(in_array($parent_id, $pages_ids)){
		$current_page_id = $parent_id;
		$current_page_section = $section;
	}

	$elements = !empty($elements_by_parent[$parent_id]) ? $elements_by_parent[$parent_id] : [];
	$current_section = $active_section;

	// Chrono::pr(["current_page_id" => $current_page_id, '$parent_id' => $parent_id, '$section' => $section]);
	// Chrono::pr($completed_elements);
	// reset any previously completed elements on this page
	foreach($completed_elements as $element_id => $completed_element){
		// Chrono::pr($completed_element);
		// if ((in_array($parent_id, $pages_ids) && $completed_element["parent"] == $parent_id && $completed_element["section"] == $section) || 
		// 	(!in_array($parent_id, $pages_ids) &&  $completed_element["parent"] == $parent_id)
		// ) {
		// 	unset($completed_elements[$element_id]);
		// }

		if (in_array($parent_id, $pages_ids) && $completed_element["page_id"] == $parent_id && ($current_page_section == $completed_element["page_section"])){
			// Chrono::pr($completed_elements[$element_id]);
			unset($completed_elements[$element_id]);
		}
	}

	foreach ($elements as $ke => $element) {
		if(isset($element["settings"]["disabled"]) && !empty($element["settings"]["disabled"])){
			continue;
		}
		if(!empty($element["acl"])){
			if(ChronoApp::isJoomla() && !in_array($element["acl"], $this->user()->getAuthorisedViewLevels())){
				continue;
			}
		}
		if ($element["section"] == $section) {
			// $BuildElementEvents($element);

			if($element["name"] == "area_repeater"){
				if(!isset($this->vars2["repeater_parent"])){
					$this->vars2["repeater_parent"] = [];
				}
				$this->vars2["repeater_parent"][] = $element["id"];
			}

			require(__DIR__ . "/display_element.php");

			if($element["name"] == "area_repeater" && $element["id"] == $this->vars2["repeater_parent"][count($this->vars2["repeater_parent"]) - 1]){
				array_pop($this->vars2["repeater_parent"]);
			}
			
			// check this again because it can be set now by run_conditions
			if(isset($element["settings"]["disabled"]) && !empty($element["settings"]["disabled"])){
				continue;
			}
			
			$completed_elements[$element["id"]] = $element;
			if(isset($element["fieldname"])){
				$completed_elements[$element["id"]]["fieldname"] = CF8::parse($element["fieldname"]);
			}

			$completed_elements[$element["id"]]["page_id"] = $current_page_id;
			$completed_elements[$element["id"]]["page_section"] = $current_page_section;

			if(!empty($this->vars2["repeater_parent"])){
				$completed_elements[$element["id"]]["repeaters"] = $this->vars2["repeater_parent"];
			}

			// if($current_section == "submit" && $active_section == "load"){
			// 	$current_section = "load";
			// 	// $DisplayElements($elements_by_parent, $active_page_id, $active_section);
			// 	// $active_section = "submit";
			// }

			if($abort == true){
				break;
			}
		}
	}
};

$ProcessElementsSubmit = function ($elements_by_parent, $parent_id, $section) use ($row, &$ProcessElementsSubmit, &$completed_elements, &$DisplayElements) {
	$elements = $elements_by_parent[$parent_id];
	foreach ($elements as $element) {
		if(isset($element["settings"]["disabled"]) && !empty($element["settings"]["disabled"])){
			continue;
		}
		if(!empty($element["acl"])){
			if(ChronoApp::isJoomla() && !in_array($element["acl"], $this->user()->getAuthorisedViewLevels())){
				continue;
			}
		}
		if (((strlen($section) > 0) && $element["section"] == $section) || (strlen($section) == 0)) {
			if(isset($completed_elements[$element["id"]])){

				if(isset($completed_elements[$element["id"]]["fieldname"])){
					$element["fieldname"] = $completed_elements[$element["id"]]["fieldname"];
				}

				$view_path = __DIR__.'/chronoforms/'.$element["type"].'/'.$element["name"];
				if(file_exists($view_path."/submit.php")){
					require($view_path."/submit.php");
				}

				if(!empty($element["behaviors"])){
					foreach($element["behaviors"] as $behavior){
						$bv_path = __DIR__.'/chronoforms/behaviors/'.$behavior;
						if(str_contains($behavior, ".")){
							$bv_path = __DIR__.'/chronoforms/'.$element["type"].'/'.$element["name"].'/behaviors/'.explode(".", $behavior)[1];
						}
						// echo $bv_path;
						if(file_exists($bv_path."/submit.php")){
							require($bv_path."/submit.php");
						}
					}
				}

				if (isset($elements_by_parent[$element["id"]])) {
					$ProcessElementsSubmit($elements_by_parent, $element["id"], "");
				}
			}
			// if (!empty($this->errors)) {
			// 	break;
			// }
		}
	}
};

if (isset($completed_data["output"])) {
	unset($completed_data["output"]);
}
// $this->MergeData($completed_data);
$this->data = array_merge($completed_data, $this->data);
// $this->MergeVars($completed_vars);
$this->vars = array_merge($completed_vars, $this->vars);


if ($active_section == "submit") {
	$ProcessElementsSubmit($elements_by_parent, $active_page_id, "load");
	// $CheckSecurityElements($elements_by_parent, $active_page_id, "load");
	// $CheckFieldsValidations($elements_by_parent, $active_page_id, "load");

	if (!empty($this->errors)) {
		$active_section = "load";
	} else {
		// $FileUploadElements($elements_by_parent, $active_page_id, "load");

		if (!empty($this->errors)) {
			$active_section = "load";
		} else {
			// $completed_data = array_merge($completed_data, $this->data);
			// ChronoSession::set("chronoforms8_data_" . $row["id"], $completed_data);
		}
	}
}

ob_start();
$this->set("app_active_page", $active_page_id);
$DisplayElements($elements_by_parent, $active_page_id, $active_section);

$completed_vars = array_merge($completed_vars, $this->vars);
ChronoSession::set("chronoforms8_vars_" . $row["id"], $completed_vars);
ChronoSession::set("chronoforms8_elements_" . $row["id"], $completed_elements);

$completed_data = array_merge($completed_data, $this->data);
ChronoSession::set("chronoforms8_data_" . $row["id"], $completed_data);

$next_page_on = false;
$next_page_id = $active_page_id;
// if ($row["params"]["next_page"] == "1") {
// 	if ($active_section == "submit") {
// 		// else{
			
// 		// }
// 	}
// }

if ($active_section == "submit") {
	// Check what to do in this submit
	$log_data = false;
	if(isset($active_page_group)){
		if($pages_groups[$active_page_group][count($pages_groups[$active_page_group]) - 1] == $active_page_id){
			if($row["params"]["next_page"] == "1"){
				$is_ending_page = true;
				$log_data = true;
			}
		}
	}else{
		// auto next page enabled
		if($row["params"]["next_page"] == "1"){
			if($active_page_id == $pages_ids[count($pages_ids) - 1]){
				$is_ending_page = true;
				$log_data = true;
			}
		}else{
			// no auto next page enabled, do not run anything
		}
	}

	// if (($row["params"]["next_page"] == "1") && ($active_page < count($pages_ids) - 1)) {
	if(!$is_ending_page){
		$next_page_id = $next_pages[$active_page_id];

		if ($this->get("next_page") && strlen($this->get("next_page"))) {
			$next_page_id = isset($pages_alias_to_id[$this->get("next_page")]) ? (int)$pages_alias_to_id[$this->get("next_page")] : $active_page_id;
		}

		$this->set("app_active_page", $next_page_id);
		$DisplayElements($elements_by_parent, $next_page_id, "load");
		$next_page_on = true;

		// $completed_data = array_merge($completed_data, $this->data);
		// ChronoSession::set("chronoforms8_data_" . $row["id"], $completed_data);

		if (!in_array($active_page_id, $completed_pages)) {
			$completed_pages[] = $active_page_id;
			ChronoSession::set("chronoforms8_pages_" . $row["id"], $completed_pages);
		}

		$completed_vars = array_merge($completed_vars, $this->vars);
		ChronoSession::set("chronoforms8_vars_" . $row["id"], $completed_vars);
		ChronoSession::set("chronoforms8_elements_" . $row["id"], $completed_elements);

		$completed_data = array_merge($completed_data, $this->data);
		ChronoSession::set("chronoforms8_data_" . $row["id"], $completed_data);
	}

	if($log_data){
		if ($row["params"]["log_data"] == "1") {
			$data = [];
			foreach ($elements as $element) {
				if ($element["type"] == "views") {
					if (str_starts_with($element["name"], "field_") && $element["name"] != "field_button") {
						if (!empty($element["fieldname"])) {
							$fname = CF8::cleanfieldname($element["fieldname"]);
							$data[$element["id"]] = Chrono::getVal($this->data, $fname);
						}
					}
				}
			}
			$logdata = [
				"form_id" => $row["id"],
				"user_id" => $this->user()->id,
				"ip" => !empty(Chrono::getVal($this->settings, "datalog_save_ip", "1")) ? $_SERVER['REMOTE_ADDR'] : "",
				"created" => gmdate("Y-m-d H:i:s"),
				"data" => json_encode($data),
			];
			CF8LogModel::instance()->Insert($logdata);
			// $this->debug["log_data"]['confirm'] = "Data log saved";
			$this->debug["log_data"]['data'] = $logdata;
		}
	}

	// if ((($row["params"]["next_page"] == "1") && ($active_page == count($pages_ids) - 1)) || (($row["params"]["next_page"] == "0") && !empty($this->get("__ending_page")))) {
	if($is_ending_page){
		ChronoSession::clear("chronoforms8_pages_" . $row["id"]);
		ChronoSession::clear("chronoforms8_data_" . $row["id"]);
		ChronoSession::clear("chronoforms8_vars_" . $row["id"]);
		ChronoSession::clear("chronoforms8_elements_" . $row["id"]);
		ChronoSession::clear("sectoken". $row["id"]);

		$this->debug["form"]['info'] = (!empty($active_page_group) ? $active_page_group." page group" : "Form")." ending reached.";
	}
}

// Chrono::pr($completed_elements);
$form_html_id = "chronoform-".$row["alias"];
if(!empty($completed_elements)){
	$eventsCode = [
		"var form = document.querySelector('#$form_html_id');"
	];

	$triggers_fns = [];
	$triggers_calls = [];

	$triggers_actions = [];
	foreach($completed_elements as $complete_element){
		if($active_section == "load" && ($complete_element["page_id"] != $active_page_id)){
			continue;
		}else{
			if ($next_page_id != $active_page_id) {
				if($active_section == "submit" && ($complete_element["page_id"] != $next_page_id)){
					continue;
				}
			}
		}
		if($active_section == "submit" && !$next_page_on){
			continue;
		}

		if(isset($complete_element["fieldname"])){
			$fname = $complete_element["fieldname"];
			if($complete_element["name"] == "field_checkboxes"){
				$fname .= "[]";
			}else{
				if(!empty($complete_element["behaviors"]) && in_array("multi_selection", $complete_element["behaviors"])){
					$fname .= "[]";
				}
			}
			$field_selector = '[name="'.$fname.'"]';
			if(!empty($complete_element["repeaters"])){
				$field_selector = '[oname="'.$fname.'"]';
			}
		}else{
			$field_selector = ".".$complete_element["name"].$complete_element["id"];
		}

		if(!empty($complete_element["triggers"])){
			$change_event = "change";
			if(in_array($complete_element["name"], ["field_text", "field_password", "field_textarea"])){
				$change_event = "input";
			}
			foreach($complete_element["triggers"] as $trigger){
				if(!empty($trigger["name"])){
					$tnames = (array)$trigger["name"];
					foreach($tnames as $tname){
						$tname = str_replace([" ", "-"], "_", $tname);

						if(!isset($triggers_fns[$tname])){
							$triggers_fns[$tname] = [];
							$triggers_calls[$tname] = [];
						}
	
						switch($trigger["condition"]){
							case "ready":
								// if(!empty($trigger["value"])){
								// 	$triggers_fns[$tname][] = "HasValue($field_selector, ['".implode("','", $trigger["value"])."'])";
								// }else{
								// 	$triggers_fns[$tname][] = "true";
								// }
								$triggers_fns[$tname][] = "true";
								// $triggers_calls[$tname][] = "TestEvent_$tname();";
								$triggers_calls[$tname][] = "SetupEvent(form, '$field_selector', 'ready', () => {
									TestEvent_$tname();
								});";
								break;
							case "string_not_empty":
								$triggers_fns[$tname][] = "NotEmpty('".CF8::parse($trigger["value"][0])."')";
								$triggers_calls[$tname][] = "SetupEvent(form, '$field_selector', 'ready', () => {
									TestEvent_$tname();
								});";
								break;
							case "change":
								if(!empty($trigger["value"])){
									$triggers_fns[$tname][] = "HasValue(form, '$field_selector', ['".implode("','", $trigger["value"])."'])";
								}else{
									$triggers_fns[$tname][] = "true";
								}
								$triggers_calls[$tname][] = "SetupEvent(form, '$field_selector', '$change_event', () => {
									TestEvent_$tname();
								});";
								break;
							case "click":
								$triggers_fns[$tname][] = "true";
								$triggers_calls[$tname][] = "SetupEvent(form, '$field_selector', 'click', () => {
									TestEvent_$tname();
								});";
								break;
							case "empty":
								$triggers_fns[$tname][] = "isEmpty(form, '$field_selector')";
								$triggers_calls[$tname][] = "SetupEvent(form, '$field_selector', '$change_event', () => {
									TestEvent_$tname();
								});";
								break;
							case "not-empty":
								$triggers_fns[$tname][] = "!isEmpty(form, '$field_selector')";
								$triggers_calls[$tname][] = "SetupEvent(form, '$field_selector', '$change_event', () => {
									TestEvent_$tname();
								});";
								break;
							case "in":
								$triggers_fns[$tname][] = "HasValue(form, '$field_selector', ['".implode("','", $trigger["value"])."'])";
								$triggers_calls[$tname][] = "SetupEvent(form, '$field_selector', '$change_event', () => {
									TestEvent_$tname();
								});";
								$triggers_calls[$tname][] = "SetupEvent(form, '$field_selector', 'ready', () => {
									TestEvent_$tname();
								});";
								break;
							case "not-in":
								$triggers_fns[$tname][] = "!HasValue(form, '$field_selector', ['".implode("','", $trigger["value"])."'])";
								$triggers_calls[$tname][] = "SetupEvent(form, '$field_selector', '$change_event', () => {
									TestEvent_$tname();
								});";
								$triggers_calls[$tname][] = "SetupEvent(form, '$field_selector', 'ready', () => {
									TestEvent_$tname();
								});";
								break;
							case "regex":
								$triggers_fns[$tname][] = "Matches(form, '$field_selector', '".$trigger["value"][0]."')";
								$triggers_calls[$tname][] = "SetupEvent(form, '$field_selector', '$change_event', () => {
									TestEvent_$tname();
								});";
								break;
						}
					}
					
				}
			}
		}

		if(!empty($complete_element["listeners"])){
			foreach($complete_element["listeners"] as $listener){
				if(!empty($listener["trigger"])){
					$tnames = (array)$listener["trigger"];
					foreach($tnames as $tname){
						$tname = str_replace([" ", "-"], "_", $tname);

						if(!isset($triggers_actions[$tname])){
							$triggers_actions[$tname] = [];
						}
						if(!empty($listener["actions"])){
							$listener["actions"] = (array)$listener["actions"];
	
							if(in_array("show", $listener["actions"])){
								$triggers_actions[$tname][] = "ShowField(form, '$field_selector');";
							}
							if(in_array("hide", $listener["actions"])){
								$triggers_actions[$tname][] = "HideField(form, '$field_selector');";
							}
							if(in_array("enable", $listener["actions"])){
								$triggers_actions[$tname][] = "EnableField(form, '$field_selector');";
							}
							if(in_array("disable", $listener["actions"])){
								$triggers_actions[$tname][] = "DisableField(form, '$field_selector');";
							}
							if(in_array("disable_validation", $listener["actions"])){
								$triggers_actions[$tname][] = "DisableValidation(form, '$field_selector');";
							}
							if(in_array("enable_validation", $listener["actions"])){
								$triggers_actions[$tname][] = "EnableValidation(form, '$field_selector');";
							}
							if(in_array("select_all", $listener["actions"])){
								$triggers_actions[$tname][] = "SelectAll(form, '$field_selector');";
							}
						}
					}
				}
			}
		}

		if(!empty($complete_element["listeners2"])){
			foreach($complete_element["listeners2"] as $listener){
				if(!empty($listener["trigger"])){
					$tnames = (array)$listener["trigger"];
					foreach($tnames as $tname){
						$tname = str_replace([" ", "-"], "_", $tname);

						if(!isset($triggers_actions[$tname])){
							$triggers_actions[$tname] = [];
						}
						if(!empty($listener["action"])){
							if($listener["action"] == "call_fn" && !empty($listener["params"])){
								$params = (array)$listener["params"];
								$fname = $params[0];
								$triggers_actions[$tname][] = "CallFunction('$fname', form, '$field_selector');";
							}else if($listener["action"] == "set_value" && !empty($listener["params"])){
								$params = (array)$listener["params"];
								foreach($params as $k => $param){
									$params[$k] = CF8::parse($param);
								}
								$triggers_actions[$tname][] = "SetValue(form, '$field_selector', ['".implode("','", $params)."']);";
							}else if($listener["action"] == "clear_value"){
								$triggers_actions[$tname][] = "ClearValue(form, '$field_selector');";
							}else if($listener["action"] == "submit"){
								$triggers_actions[$tname][] = "SubmitForm(form, '$field_selector');";
							// }else if($listener["action"] == "select_all"){
							// 	$params = (array)$listener["params"];
							// 	$selectors_name = $params[0];
							// 	$triggers_actions[$tname][] = "SelectAll('$selectors_name');";
							}else if($listener["action"] == "ajax"){
								$params = (array)$listener["params"];
								$page = $params[0];
								$fn = !empty($params[1]) ? $params[1] : "";
								$url = Chrono::addUrlParam($this->current_url, ["chronoform" => $row["alias"], "output" => "ajax", "chronopage" => $page]);
								$triggers_actions[$tname][] = "AJAX(form, '$field_selector', '$url', '$fn');";
							}else if($listener["action"] == "reload"){
								$params = (array)$listener["params"];
								$page = $params[0];
								$url = Chrono::addUrlParam($this->current_url, ["chronoform" => $row["alias"], "output" => "ajax", "chronopage" => $page]);
								$triggers_actions[$tname][] = "Reload(form, '$field_selector', '$url');";
							}else if($listener["action"] == "load_options"){
								$params = (array)$listener["params"];
								$page = $params[0];
								$url = Chrono::addUrlParam($this->current_url, ["chronoform" => $row["alias"], "output" => "ajax", "chronopage" => $page]);
								$triggers_actions[$tname][] = "LoadOptions(form, '$field_selector', '$url');";
							}
						}
					}
				}
			}
		}
	}

	if(!empty($triggers_fns)){
		foreach($triggers_fns as $tname => $tconditions){
			if(!empty($triggers_actions[$tname])){
				$eventsCode[] = "function TestEvent_$tname(){
					let result = (".(implode(" && ", $tconditions)).");
					if(result){
						".implode("\n", $triggers_actions[$tname])."
					}
					return result;
				}";
			}
		}

		foreach($triggers_calls as $tname => $tcalls){
			foreach($tcalls as $tcall){
				if(!in_array($tcall, $eventsCode)){
					$eventsCode[] = $tcall;
				}
			}
		}
	}

	$eventsCode[] = "
		form.querySelectorAll('input, textarea, select, button').forEach(input => {
			input.dispatchEvent(new Event('ready', { bubbles:true }))
		});
	";
}

$buffer = ob_get_clean();

ob_start();
if(!empty($eventsCode)){
	Chrono::loadAsset("/assets/events.js");
	echo "
	<script>
	document.addEventListener('DOMContentLoaded', function (event) {
		".implode("\n", $eventsCode)."
	})
	</script>
	";
	// Chrono::pr($eventsCode);
}
if(!empty($row["params"]["css_vars"])){
	echo "<style>#".$form_html_id."{";
	foreach($row["params"]["css_vars"] as $var_name => $var_val){
		if(!empty($var_val)){
			echo "--".$var_name.":".$var_val.";";
		}
	}
	echo "}</style>";
}
?>
<?php if (!empty($this->errors)) : ?>
	<?php
	echo "
	<script>
	document.addEventListener('DOMContentLoaded', function (event) {
		Nui.Core.scrollToTargetwithOffset(document.querySelector('.form_errors'), 30)
	})
	</script>
	";
	?>
	<div class="nui alert red form_errors">
		<ul>
			<?php foreach ($this->errors as $error) : ?>
				<li><?php echo $error; ?></li>
			<?php endforeach; ?>
		</ul>
	</div>
<?php endif; ?>
<?php
	// if(!empty($row["params"]["navbar"]) && ($row["params"]["navbar"] == "1") && (count($pages_ids) > 1) && ($active_page <= count($pages_ids) - 1)){
	if(!empty($row["params"]["navbar"]) && ($row["params"]["navbar"] == "1") && (count($pages_groups[$active_page_group]) > 1) && !$is_ending_page){
		$navigation = '<div class="nui flex equal items stackable">';

		$next_page_reached = false;
		foreach($pages_groups[$active_page_group] as $k => $pid){
			if($next_page_id == $pid){
				$next_page_reached = true;
			}

			$page_title = !empty($pages[$pid]["title"]) ? $pages[$pid]["title"] : 'Page'.$pid;
			$page_num = !empty($pages[$pid]["icon"]) ? Chrono::ShowIcon($pages[$pid]["icon"]) : Chrono::ShowIcon(($k + 1));

			$navigation .= '<div class="item nui flex spaced justify-center align-center">';

			if(!$next_page_reached){
				$navigation .= '<span class="nui label circular green" style="--pad:1em;">'.Chrono::ShowIcon("check").'</span>';
			}else{
				$navigation .= '<span class="nui label circular slate" style="--pad:1em;">'.$page_num.'</span>';
			}

			if($next_page_id == $pid){
				$navigation .= '<span class="nui bold">'.$page_title.'</span>';
			}else{
				if(!$next_page_reached){
					$navigation .= '<a class="nui bold underlined" href="'.Chrono::r(Chrono::addUrlParam($this->current_url, ["chronopage" => $pages_ids_to_alias[$pid]])).'">'.$page_title.'</a>';
				}else{
					$navigation .= '<span class="nui disabled">'.$page_title.'</span>';
				}
			}
			$navigation .= '</div>';
		}
		$navigation .= '</div>';
		$navigation .= '<div class="nui divider block"></div>';

		echo $navigation;
	}
?>
<?php
	$action_url = Chrono::addUrlParam($this->current_url, ["chronoform" => $row["alias"]]);
	if(!empty($row["params"]["action"])){
		$action_url = CF8::parse($row["params"]["action"]);
	}
	$method = "post";
	if(!empty($row["params"]["method"])){
		$method = $row["params"]["method"];
	}

	$ajax = "";
	if (!empty($row["params"]["ajax"])){
		$ajax = "dynamic";
	}
?>
<form class="nui form <?php echo $ajax; ?> <?php echo (!empty($row["params"]["class"]) ? $row["params"]["class"] : ""); ?>" <?php if (!empty($row["params"]["ajax"])) : ?>data-output="#chronoform-<?php echo $row["alias"]; ?>" <?php endif; ?> id="<?php echo $form_html_id; ?>" action="<?php echo $action_url; ?>" method="<?php echo $method; ?>" enctype="multipart/form-data" accept-charset="UTF-8">
	<?php
	$top_scripts_and_html = ob_get_clean();

	if($this->data("output") == "ajax"){
		ob_start();
		echo $buffer;
		echo ob_get_clean();
		die();
	}else{
		echo $top_scripts_and_html;
		echo $buffer;
	}

	if ($active_section == "load" || $next_page_on) {
		$token = uniqid("", true);
		ChronoSession::set("sectoken". $row["id"], $token);

		echo '<input type="hidden" name="chronoform" value="' . $row["alias"] . '" >';
		echo '<input type="hidden" name="chronopage" value="' . $pages_ids_to_alias[$next_page_id] . '" >';
		echo '<input type="hidden" name="sectoken" value="' . $token . '" >';
	}

	if (!$this->isAdmin() && !$this->validated(true)) {
		echo '<a href="https://www.chronoengine.com/?ref=chronoforms8-form" target="_blank" class="chronocredits">This form was created by ChronoForms 8</a>';
	}
	?>

	<?php if ($row["params"]["debug"] == "1") : ?>
		<?php if(empty($row["params"]["debug_ips"]) OR in_array($_SERVER["REMOTE_ADDR"], (array)$row["params"]["debug_ips"])): ?>
		<div class="nui segment bordered rounded block">
			<h3>Debug</h3>
			<h4>Data</h4>
			<?php Chrono::pr($this->data); ?>
			<h4>Files</h4>
			<?php Chrono::pr($_FILES); ?>
			<h4>Vars</h4>
			<?php Chrono::pr($this->vars); ?>
			<h4>Info</h4>
			<?php Chrono::pr($this->debug); ?>
		</div>
		<?php endif; ?>
	<?php endif; ?>
</form>