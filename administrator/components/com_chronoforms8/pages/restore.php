<?php

/**
 * ChronoForms 8
 * Copyright (c) 2023 ChronoEngine.com, All rights reserved.
 * Author: (ChronoEngine.com Team)
 * license:     GNU General Public License version 2 or later; see LICENSE.txt
 * Visit http://www.ChronoEngine.com for regular updates and information.
 **/
defined('_JEXEC') or die('Restricted access');

if(!empty($_FILES)){
	$file = $_FILES['backup'];
	
	if(!empty($file['size'])){
		
		$ext = strtolower(pathinfo($file['name'], PATHINFO_EXTENSION));
		
		if($ext != 'cf8bak' && $ext != "cf6bak" && $ext != "cf7bak"){
			ChronoSession::setFlash("error", "Invalid backup file extension.");
			ChronoApp::$instance->Redirect(ChronoApp::$instance->extension_url."&action=restore");
		}
		
		$target = $file['tmp_name'];
		
		if($ext == 'cf8bak'){
			$data = file_get_contents($target);
			
			$rows = json_decode($data, true);
			// Chrono::pr($rows);die();
			if(!empty($rows)){
				foreach($rows as $row){
					if(isset($row['id'])){
						$row['id'] = 0;
						$row['alias'] .= "-".gmdate("Ymd-His");
						$row['title'] .= "-".gmdate("Ymd-His");
						$row['published'] = 0;
						// Chrono::pr($row);
						// die();
						$result = CF8Model::instance()->Insert($row);

						if (!empty($result)) {
							ChronoSession::setFlash("success", sprintf(Chrono::l("%s Form restored successfully."), $row["title"]));
						}else{
							ChronoSession::setFlash("error", sprintf(Chrono::l("%s Error restoring form."), $row["title"]));
							break;
						}
					}
				}

				ChronoApp::$instance->redirect(ChronoApp::$instance->extension_url . "&action=index");
			}
		}else if($ext == 'cf6bak'){
			$data = file_get_contents($target);
			
			$rows = json_decode($data, true);

			$views_map = [
				"area_fields" => "area_multi_field",
				"area_grid" => "area_container",
				"google_nocaptcha" => "security_recaptcha",
				"widget_signature" => "signature",
				"html_code" => "html",
				"field_secicon" => "security_question",
			];
			$views_areas_map = [
				"area_multi_field" => "fields",
				"area_container" => "views",
				"area_fieldset" => "views",
				"area_grid" => "views",
			];

			$actions_map = [
				"stopper" => "abort",
				"loop_event" => "loop",
				"switch_events" => "event_switcher",
				"data_builder" => "variables",
			];
			$actions_areas_map = [
				"loop" => "loop",
			];
			
			Chrono::pr($rows);
			// die();
			if(!empty($rows)){
				foreach($rows as $row){
					if(isset($row["Connection"]['id'])){
						$form = [];
						$form['id'] = 0;
						$form["title"] = $row["Connection"]["title"];
						$form["alias"] = $row["Connection"]["alias"];
						$form["published"] = $row["Connection"]["published"];
						$form["elements"] = [];
						
						$areas = [];
						if(!empty($row["Connection"]["events"])){
							$pages = json_decode($row["Connection"]["events"], true);
							$pk = 1;
							foreach($pages as $name => $page){
								$k = $pk;
								$form["elements"][$k] = [
									"id" => $k,
									"type" => "page",
									"title" => $page["name"],
									"alias" => $page["name"],
								];
								$areas[$page["name"]] = $k;
								$pk++;
							}
						}

						if(!empty($row["Connection"]["sections"])){
							$pages = json_decode($row["Connection"]["sections"], true);
							// $pk = 1;
							foreach($pages as $name => $page){
								if(isset($areas[$page["name"]])){
									continue;
								}
								$k = $pk;
								$form["elements"][$k] = [
									"id" => $k,
									"type" => "page",
									"title" => $page["name"],
									"alias" => $page["name"],
								];
								$areas[$page["name"]] = $k;
								$pk++;
							}
						}

						$items_ids = [];
						if(!empty($row["Connection"]["views"])){
							$views = json_decode($row["Connection"]["views"], true);
							foreach($views as $view){
								$k = $pk;
								$new_type = "";
								if(file_exists(__DIR__.'/chronoforms/views/'.$view["type"])){
									$new_type = $view["type"];
								}else if(!empty($views_map[$view["type"]])){
									$new_type = $views_map[$view["type"]];
								}

								$section = "load";

								if(str_contains($view["_section"], "/")){
									$parent = $items_ids[explode("/", $view["_section"])[0]];
									$section = explode("/", $view["_section"])[1];
									if(!empty($views_areas_map[$form["elements"][$parent]["name"]]) && empty($form["elements"][$parent]["events"])){
										$section = $views_areas_map[$form["elements"][$parent]["name"]];
									}
								}else{
									$section = "load";
									$parent = $areas[$view["_section"]];
								}

								if(!empty($new_type)){
									$items_ids[$view["name"]] = $k;
									$form["elements"][$k] = [
										"id" => $k,
										"behaviors" => [],
										"type" => "views",
										"name" => $new_type,
										"section" => $section,
										"parent" => $parent,
									];

									if(!empty($view["params"]["name"])){
										$form["elements"][$k]["fieldname"] = $view["params"]["name"];
									}
									if(!empty($view["label"])){
										$form["elements"][$k]["label"] = $view["label"];
									}
									if(!empty($view["options"])){
										$form["elements"][$k]["options"] = trim($view["options"]);
									}
									if(!empty($view["validation"]["required"])){
										$form["elements"][$k]["behaviors"][] = "validation_required";
										$form["elements"][$k]["validation_required"]["prompt"] = $view["verror"];
									}
									if(!empty($view["validation"]["email"])){
										$form["elements"][$k]["behaviors"][] = "validation_email";
										$form["elements"][$k]["validation_email"]["prompt"] = $view["verror"];
									}
									if(!empty($view["tooltip"]["text"])){
										$form["elements"][$k]["tooltip"]["text"] = $view["tooltip"]["text"];
										$form["elements"][$k]["behaviors"][] = "tooltip";
									}
									if(!empty($view["params"]["value"])){
										$form["elements"][$k]["default_value"]["value"] = $view["params"]["value"];
										$form["elements"][$k]["behaviors"][] = "default_value";
									}
									if(!empty($view["params"]["placeholder"])){
										$form["elements"][$k]["placeholder"]["text"] = $view["params"]["placeholder"];
										$form["elements"][$k]["behaviors"][] = "placeholder";
									}
									if(!empty($view["params"]["rows"])){
										$form["elements"][$k]["rows"] = $view["params"]["rows"];
									}
									if(!empty($view["checked"])){
										$form["elements"][$k]["behaviors"][] = "field_checkbox.checked";
									}
									if(!empty($view["attrs"])){
										$form["elements"][$k]["attributes"] = trim($view["attrs"]);
										$form["elements"][$k]["behaviors"][] = "html_attributes";
									}
									if(!empty($view["selected"])){
										$form["elements"][$k]["selected_values"] = array_map("trim", explode("\n", trim($view["selected"])));
										$form["elements"][$k]["behaviors"][] = "selected_values";
									}
									if(!empty($view["container"]["class"]) && trim($view["container"]["class"]) != "field" && trim($view["container"]["class"]) != "multifield"){
										$form["elements"][$k]["field_class"] = trim($view["container"]["class"]);
										$form["elements"][$k]["behaviors"][] = "field_class";
									}

									switch($new_type){
										case "javascript":
											$form["elements"][$k]["code"] = $view["content"];
											break;
										case "css":
											$form["elements"][$k]["code"] = $view["content"];
											break;
										case "html":
											$form["elements"][$k]["code"] = $view["content"];
											break;
										case "header":
											$form["elements"][$k]["tag"] = $view["tag"];
											$form["elements"][$k]["text"] = $view["text"];
											break;
										case "divider":
											$form["elements"][$k]["tag"] = $view["tag"];
											$form["elements"][$k]["text"] = $view["text"];
											break;
										case "field_calendar":
											$form["elements"][$k]["data-format"] = $view["calendar"]["dformat"];
											$form["elements"][$k]["data-sformat"] = $view["calendar"]["sformat"];
											break;
										case "field_button":
											$form["elements"][$k]["label"] = $view["content"];
											break;
										case "field_file":
											if(!empty($view["extensions"])){
												$form["elements"][$k]["extensions"] = explode(",", $view["extensions"]);
												$form["elements"][$k]["max_size"] = $view["max_size"];
											}
										case "area_container":
											if($view["type"] == "area_grid"){
												$form["elements"][$k]["behaviors"][] = "area_container.grid";
												$form["elements"][$k]["events"] = [];
												if(!empty($view["sections"])){
													foreach((array)$view["sections"] as $grid_section){
														$form["elements"][$k]["events"][] = $grid_section["name"];
													}
													$form["elements"][$k]["behaviors"][] = "area_container.subitems";
												}
											}
											break;
									}
								}

								$pk++;
							}
							Chrono::pr($views);
						}

						if(!empty($row["Connection"]["functions"])){
							$actions = json_decode($row["Connection"]["functions"], true);
							foreach($actions as $action){
								$k = $pk;
								$new_type = "";
								if(file_exists(__DIR__.'/chronoforms/actions/'.$action["type"])){
									$new_type = $action["type"];
								}else if(!empty($actions_map[$action["type"]])){
									$new_type = $actions_map[$action["type"]];
								}

								$section = "load";
								$type = "actions";

								if($action["type"] == "message"){
									$new_type = "message";
									$type = "views";
								}else if($action["type"] == "custom_code"){
									$new_type = "html";
									$type = "views";
								}

								if(str_contains($action["_event"], "/")){
									$parent = $items_ids[explode("/", $action["_event"])[0]];
									$section = !empty($actions_areas_map[$form["elements"][$parent]["name"]]) ? $actions_areas_map[$form["elements"][$parent]["name"]] : explode("/", $action["_event"])[1];
								}else{
									$section = "load";
									$parent = $areas[$action["_event"]];
								}

								if(!empty($new_type)){
									$items_ids[$action["name"]] = $k;
									$form["elements"][$k] = [
										"id" => $k,
										"type" => $type,
										"name" => $new_type,
										"section" => $section,
										"parent" => $parent,
									];

									$form["elements"][$k]["settings"]["name"] = $action["name"];
									if(!empty($action["designer_label"])){
										$form["elements"][$k]["behaviors"][] = "wizard_settings";
										$form["elements"][$k]["settings"]["designer_label"] = $action["designer_label"];
									}

									switch($new_type){
										case "curl":
											$form["elements"][$k]["url"] = $action["url"];
											break;
										case "redirect":
											$form["elements"][$k]["url"] = $action["url"];
											break;
										case "message":
											$form["elements"][$k]["text"] = $action["content"];
											break;
										case "html":
											$form["elements"][$k]["code"] = $action["content"];
											$form["elements"][$k]["behaviors"][] = "html.php";
											break;
										case "loop":
											$form["elements"][$k]["loopvar"] = $action["data_provider"];
											break;
										case "csv":
											$form["elements"][$k]["datasource"] = $action["data_provider"];
											break;
										case "event_switcher":
											$form["elements"][$k]["value"] = $action["data_provider"];
											$form["elements"][$k]["events"] = array_map("trim", explode("\n", trim($action["events"])));
											break;
										case "email":
											$form["elements"][$k]["recipients"] = explode(",", trim($action["recipients"]));
											$form["elements"][$k]["subject"] = $action["subject"];
											$form["elements"][$k]["body"] = $action["body"];
											$form["elements"][$k]["reply"] = $action["reply_email"];
											$form["elements"][$k]["replyname"] = $action["reply_name"];
											break;
										case "delete_data":
										case "read_data":
										case "save_data":
											$form["elements"][$k]["dbtable"] = $action["db_table"];
											if($new_type == "read_data"){
												$form["elements"][$k]["read_type"] = "single";
												if($action["select_type"] == "list"){
													$form["elements"][$k]["read_type"] = "all";
												}
											}
											break;
										case "php":
											$form["elements"][$k]["code"] = $action["code"];
											break;
										case "variables":
											if(!empty($action["values"])){
												foreach((array)$action["values"] as $vk => $var){
													$form["elements"][$k]["variables"][$vk] = $var;
												}
											}
											break;
									}
								}

								$pk++;
							}
							Chrono::pr($actions);
						}
						
						Chrono::pr($form);
						Chrono::pr($row);
						$result = CF8Model::instance()->Insert($form);

						if (!empty($result)) {
							ChronoSession::setFlash("success", sprintf(Chrono::l("%s Form restored successfully."), $row["title"]));
						}else{
							ChronoSession::setFlash("error", sprintf(Chrono::l("%s Error restoring form."), $row["title"]));
							break;
						}
					}
				}
				// die();

				ChronoApp::$instance->redirect(ChronoApp::$instance->extension_url . "&action=index");
			}
		}else if($ext == 'cf7bak'){
			$data = file_get_contents($target);
			
			$rows = json_decode($data, true);

			$views_map = [
				"area_fields" => "area_multi_field",
				"area_form" => "area_container",
				"area_segment" => "area_container",
				"area_grid" => "area_container",
				"gcaptcha" => "security_recaptcha",
				"wfield_signature" => "signature",
				"html_code" => "html",
				"list_table" => "table",
			];
			$views_areas_map = [
				"area_fields" => "fields",
				"area_form" => "views",
				"area_segment" => "views",
				"area_grid" => "views",
				"area_container" => "views",
			];

			$actions_map = [
				"var_constructor" => "variables",
			];
			$actions_areas_map = [
				"loop" => "loop",
			];
			// Chrono::pr($rows);die();
			if(!empty($rows)){
				foreach($rows as $row){
					if(isset($row["Connection"]['id'])){
						$form = [];
						$form['id'] = 0;
						$form["title"] = $row["Connection"]["title"];
						$form["alias"] = $row["Connection"]["alias"];
						$form["published"] = $row["Connection"]["published"];
						$form["elements"] = [];
						
						if(!empty($row["Connection"]["pages"])){
							$pages = json_decode($row["Connection"]["pages"], true);
							foreach($pages as $k => $page){
								if(is_int($k)){
									$k = -1 * $k;
									$form["elements"][$k] = [
										"id" => $k,
										"type" => "page",
										"title" => $page["name"],
										"alias" => $page["name"],
									];
								}else{
									$k = 0;
									$form["elements"][$k] = [
										"id" => $k,
										"type" => "page",
										"title" => $page["name"],
										"alias" => $page["name"],
									];
								}
							}
						}

						if(!empty($row["Connection"]["views"])){
							$views = json_decode($row["Connection"]["views"], true);
							foreach($views as $k => $view){
								$new_type = "";
								if(file_exists(__DIR__.'/chronoforms/views/'.$view["type"])){
									$new_type = $view["type"];
								}else if(!empty($views_map[$view["type"]])){
									$new_type = $views_map[$view["type"]];
								}

								$section = "load";

								if(!empty($new_type)){
									$parent = !empty($view["_parent"]) ? $view["_parent"] : (-1 * (int)$view["_area"]);
									$form["elements"][$k] = [
										"id" => $k,
										"behaviors" => [],
										"type" => "views",
										"name" => $new_type,
										"section" => !empty($view["_parent"]) ? (!empty($views_areas_map[$views[$view["_parent"]]["type"]]) && empty($form["elements"][$parent]["events"]) ? $views_areas_map[$views[$view["_parent"]]["type"]] : $view["_area"]) : "load",
										"parent" => $parent,
									];

									if(!empty($view["nodes"]["main"]["attrs"]["name"])){
										$form["elements"][$k]["fieldname"] = $view["nodes"]["main"]["attrs"]["name"];
									}
									if(!empty($view["nodes"]["label"]["content"])){
										$form["elements"][$k]["label"] = $view["nodes"]["label"]["content"];
									}
									if(!empty($view["options"])){
										$options = "";
										foreach($view["options"] as $option){
											$options .= $option["value"]."=".$option["content"]."\n";
										}
										$form["elements"][$k]["options"] = trim($options);
									}
									if(!empty($view["behaviors"]["validation"])){
										foreach((array)$view["behaviors"]["validation"] as $validation){
											if(in_array($validation, ["field_validation_required", "field_validation_email"])){
												$form["elements"][$k]["behaviors"][] = str_replace("field_", "", $validation);
												if(in_array("field_validation_message", (array)$view["behaviors"]["validation"])){
													$form["elements"][$k][str_replace("field_", "", $validation)]["prompt"] = $view["fns"]["validation"]["fields"][$k]["error"];
												}else{
													$form["elements"][$k][str_replace("field_", "", $validation)]["prompt"] = ["Validation error."];
												}
											}
										}
									}
									if(!empty($view["nodes"]["help"]["content"])){
										$form["elements"][$k]["hint"]["text"] = $view["nodes"]["help"]["content"];
										$form["elements"][$k]["behaviors"][] = "hint";
									}
									if(!empty($view["nodes"]["tooltip"]["attrs"]["data-hint"])){
										$form["elements"][$k]["tooltip"]["text"] = $view["nodes"]["tooltip"]["attrs"]["data-hint"];
										$form["elements"][$k]["behaviors"][] = "tooltip";
									}
									if(!empty($view["nodes"]["main"]["attrs"]["value"]) OR !empty($view["nodes"]["main"]["attrs"]["placeholder"])){
										$form["elements"][$k]["default_value"]["value"] = $view["nodes"]["main"]["attrs"]["value"];
										$form["elements"][$k]["behaviors"][] = "default_value";

										$form["elements"][$k]["placeholder"]["text"] = $view["nodes"]["main"]["attrs"]["placeholder"];
										$form["elements"][$k]["behaviors"][] = "placeholder";
									}
									if(!empty($view["nodes"]["icon"]["attrs"]["class"]["icon"])){
										$form["elements"][$k]["icon"]["name"] = $view["nodes"]["icon"]["attrs"]["class"]["icon"];
										$form["elements"][$k]["behaviors"][] = "icon";
									}
									if(!empty($view["nodes"]["main"]["attrs"]["class"]["color"])){
										$form["elements"][$k]["color"]["name"] = $view["nodes"]["main"]["attrs"]["class"]["color"];
										$form["elements"][$k]["behaviors"][] = "color";
									}
									if(!empty($view["attrs"])){
										$form["elements"][$k]["attributes"] = "";
										foreach((array)$view["attrs"] as $attr){
											$form["elements"][$k]["attributes"] .= $attr["name"]."=".$attr["value"]."\n";
										}
										$form["elements"][$k]["attributes"] = trim($form["elements"][$k]["attributes"]);
										$form["elements"][$k]["behaviors"][] = "html_attributes";
									}

									switch($new_type){
										case "javascript":
											$form["elements"][$k]["code"] = $view["content"];
											break;
										case "css":
											$form["elements"][$k]["code"] = $view["content"];
											break;
										case "html":
											$form["elements"][$k]["code"] = $view["nodes"]["main"]["content"];
											break;
										case "header":
											$form["elements"][$k]["tag"] = $view["nodes"]["main"]["tag"];
											$form["elements"][$k]["text"] = $view["nodes"]["content"]["content"];
											break;
										case "field_calendar":
											$form["elements"][$k]["data-format"] = $view["calendar"]["dformat"];
											$form["elements"][$k]["data-sformat"] = $view["calendar"]["sformat"];
											break;
										case "field_button":
											$form["elements"][$k]["label"] = $view["nodes"]["main"]["content"];
											break;
										case "field_file":
											if(!empty($view["fns"]["upload"]["fields"][$k]["extensions"])){
												$form["elements"][$k]["extensions"] = $view["fns"]["upload"]["fields"][$k]["extensions"];
												$form["elements"][$k]["max_size"] = $view["fns"]["upload"]["fields"][$k]["size"];
											}
											break;
										case "text_node":
											$form["elements"][$k]["text"] = $view["nodes"]["main"]["content"];
											break;
										case "table":
											if(!empty($view["areas"])){
												$form["elements"][$k]["events"] = [];
												foreach((array)$view["areas"] as $ak => $area){
													$form["elements"][$k]["events"][$ak] = [
														"name" => $area["name"],
														"title" => $view["columns"][$ak]["title"],
													];
												}
											}
											break;
										case "area_container":
											if($view["type"] == "area_grid"){
												$form["elements"][$k]["behaviors"][] = "area_container.grid";
												$form["elements"][$k]["events"] = [];
												if(!empty($view["areas"])){
													foreach((array)$view["areas"] as $grid_section){
														$form["elements"][$k]["events"][] = $grid_section["name"];
													}
													$form["elements"][$k]["behaviors"][] = "area_container.subitems";
												}
											}
											break;
									}
								}
							}
							Chrono::pr($views);
						}

						if(!empty($row["Connection"]["functions"])){
							$actions = json_decode($row["Connection"]["functions"], true);
							foreach($actions as $k => $action){
								$new_type = "";
								if(file_exists(__DIR__.'/chronoforms/actions/'.$action["type"])){
									$new_type = $action["type"];
								}else if(!empty($actions_map[$action["type"]])){
									$new_type = $actions_map[$action["type"]];
								}

								$section = "load";
								$type = "actions";

								if($action["type"] == "message"){
									$new_type = "message";
									$type = "views";
								}

								if(!empty($new_type)){
									$form["elements"][$k] = [
										"id" => $k,
										"type" => $type,
										"name" => $new_type,
										"section" => !empty($action["_parent"]) ? (!empty($actions_areas_map[$actions[$action["_parent"]]["type"]]) ? $actions_areas_map[$actions[$action["_parent"]]["type"]] : $action["_area"]) : "load",
										"parent" => !empty($action["_parent"]) ? $action["_parent"] : (-1 * (int)$action["_area"]),
									];

									switch($new_type){
										case "curl":
											$form["elements"][$k]["url"] = $action["url"];
											break;
										case "redirect":
											$form["elements"][$k]["url"] = $action["pageurl"];
											break;
										case "message":
											$form["elements"][$k]["text"] = $action["content"];
											break;
										case "loop":
											$form["elements"][$k]["loopvar"] = $action["data_provider"];
											break;
										case "email":
											$form["elements"][$k]["recipients"] = $action["recipients"];
											$form["elements"][$k]["subject"] = $action["subject"];
											$form["elements"][$k]["body"] = $action["body"];
											$form["elements"][$k]["reply"] = $action["reply_email"];
											$form["elements"][$k]["replyname"] = $action["reply_name"];
											break;
										case "delete_data":
										case "read_data":
										case "save_data":
											$form["elements"][$k]["dbtable"] = $action["models"]["data"]["name"];
											break;
										case "php":
											$form["elements"][$k]["code"] = $action["code"];
											break;
										case "variables":
											if(!empty($action["values"])){
												foreach((array)$action["values"] as $vk => $var){
													$form["elements"][$k]["variables"][$vk] = $var;
												}
											}
											break;
									}
								}
							}
							Chrono::pr($actions);
						}

						Chrono::pr($form);
						Chrono::pr($row);
						$result = CF8Model::instance()->Insert($form);

						if (!empty($result)) {
							ChronoSession::setFlash("success", sprintf(Chrono::l("%s Form restored successfully."), $row["title"]));
						}else{
							ChronoSession::setFlash("error", sprintf(Chrono::l("%s Error restoring form."), $row["title"]));
							break;
						}
					}
				}
				// die();

				ChronoApp::$instance->redirect(ChronoApp::$instance->extension_url . "&action=index");
			}
		}
	}
}
?>
<form class="nui form" action="<?php echo ChronoApp::$instance->current_url; ?>" method="post" enctype="multipart/form-data" accept-charset="UTF-8">
	<?php
	$buttons = [
		new MenuButton(name: "upload", title: "Upload", icon: "upload", color: "blue"),
		new MenuButton(name: "close", link: true, title: "Close", icon: "xmark", color: "red", url: "action=index"),
	];
	$title = "Restore Form(s)";
	new MenuBar(title: $title, buttons: $buttons);
	?>

	<div class="equal fields">
	<?php new FormField(name: "backup", label: "Backup File (Supports ChronoForms v6, v7 & v8)", type:"file", extensions:["cf8bak", "cf7bak", "cf6bak"], hint:"v6 & v7 forms restore is supported but is partial, only some elements/settings will be restored.", code: 'data-validations=\'{"rules":[{"type":"required","prompt":"Please choose the backup file."}]}\''); ?>
	</div>
</form>