<?php
/**
* ChronoForms 8
* Copyright (c) 2023 ChronoEngine.com, All rights reserved.
* Author: (ChronoEngine.com Team)
* license:     GNU General Public License version 2 or later; see LICENSE.txt
* Visit http://www.ChronoEngine.com for regular updates and information.
**/
defined('_JEXEC') or die('Restricted access');

// Chrono::pr($this->data);
if(ChronoApp::$instance->DataExists("form_data")){
	// $form_data = implode("", ChronoApp::$instance->data("form_data"));
	// $form_data = str_replace(["%5B", "%5D"], ["[", "]"], $form_data);
	// Chrono::pr($this->data);
	$tot = [];
	foreach($this->data["form_data"] as $ch){
		parse_str($ch, $d);
		$tot = array_replace_recursive($tot, $d);
	}
	unset($this->data["form_data"]);
	$this->data = array_merge($this->data, $tot);
	// Chrono::pr($this->data);
	// $pieces = explode("&", $form_data);
	// $chunk = "";
	// $j = 0;
	// $data = [];
	// for($i = 0; $i < count($pieces); $i++){
	// 	$chunk .= "&".$pieces[$i];
	// 	$j++;

	// 	if($j == 20 OR ($i == count($pieces) - 1)){
	// 		parse_str($chunk, $queryArray);
	// 		Chrono::pr($queryArray);
	// 		foreach($queryArray as $k => $v){
	// 			if(is_array($v)){
	// 				// $data[$k] = array
	// 			}else{
	// 				$data[$k] = $v;
	// 			}
	// 		}
	// 		if(isset($queryArray["elements"])){
	// 			foreach($queryArray["elements"] as $k => $values){
	// 				if(isset($data["elements"][$k])){

	// 				}
	// 			}
	// 		}
	// 		$data = array_merge_recursive($data, $queryArray);
	// 		ChronoApp::$instance->MergeData($queryArray);
	// 		$chunk = "";
	// 		$j = 0;
	// 	}
	// }
	// parse_str($form_data, $queryArray);

	// Chrono::pr($queryArray);
	// ChronoApp::$instance->MergeData($queryArray);
	// Chrono::pr($data);
	// return;
}
$this->data["created"] = gmdate("Y-m-d H:i:s", time());
// if(!empty($this->isPost) && strlen($this->data("id", "")) > 0){
// 	$versionData = $this->data;
// 	$versionData["parent_id"] = (int)$this->data("id", "");
// 	unset($versionData["id"]);
// 	$versionData["alias"] .= "-".time();
// 	CF8Model::instance()->Insert($versionData);
// }

ChronoPage::Save(CF8Model::instance());

if(!empty($_POST) && !empty(ChronoApp::$instance->data("id"))){
	ChronoSession::clear("chronoforms8_pages_" . ChronoApp::$instance->data("id"));
	ChronoSession::clear("chronoforms8_data_" . ChronoApp::$instance->data("id"));
	ChronoSession::clear("chronoforms8_vars_" . ChronoApp::$instance->data("id"));
	ChronoSession::clear("chronoforms8_elements_" . ChronoApp::$instance->data("id"));
	ChronoSession::clear("sectoken".ChronoApp::$instance->data("id"));
}

Chrono::loadAsset("/assets/form_builder.min.css");
Chrono::loadAsset("/assets/form_builder.min.js");
// Chrono::loadAsset("/assets/nui.tinymce.min.js");
Chrono::loadAsset("/assets/ace.min.js");

$row =  CF8Model::instance()->Select(conditions:[['id', "=", ChronoApp::$instance->data("id")]], single: true);
$elements = [1 => ["id" => 1, "type" => "page"]];
if (!is_null($row) && !empty($row["elements"])) {
	$elements = $row["elements"];
}
ChronoApp::$instance->MergeData($row);

$elements_by_parent = [];
foreach ($elements as $element) {
	if(!isset($element["type"])){
		Chrono::pr($element);
	}
	if ($element["type"] != "page") {
		$elements_by_parent[$element["parent"]][] = $element;
	}
}
// Chrono::pr($row);

$views = [];
$views_path = __DIR__ . '/chronoforms/views/';
$scan = scandir($views_path);

foreach ($scan as $folder) {
	if (is_dir($views_path . $folder) && !str_contains($folder, ".")) {
		$path = $views_path . $folder . "/info.json";
		if(!file_exists($path)){
			ChronoSession::setFlash("error", "View json file not found:".$folder);
			continue;
		}
		$myfile = fopen($path, "r") or die("Unable to open file $path");
		$data = fread($myfile, filesize($path));
		fclose($myfile);
		$view = json_decode($data);
		$view->name = $folder;
		$views[$view->group][] = $view;
	}
}

$actions = [];
$actions_path = __DIR__ . '/chronoforms/actions/';
$scan = scandir($actions_path);

foreach ($scan as $folder) {
	if (is_dir($actions_path . $folder) && !str_contains($folder, ".")) {
		$path = $actions_path . $folder . "/info.json";
		if(!file_exists($path)){
			ChronoSession::setFlash("error", "Action json file not found:".$folder);
			continue;
		}
		$myfile = fopen($path, "r") or die("Unable to open file $path");
		$data = fread($myfile, filesize($path));
		fclose($myfile);
		$action = json_decode($data);
		if (!empty($action->hidden)) {
			continue;
		}
		$action->name = $folder;
		$actions[$action->group][] = $action;
	}
}

$loadElements = function ($elements, $pid, $section) use(&$loadElements, $elements_by_parent) {
	foreach ($elements as $element) {
		if ($element["type"] != "page") {
			if ($element["parent"] == $pid && $element["section"] == $section) {
				$element["pid"] = $pid;
				ChronoApp::$instance->MergeData($element);
				require(__DIR__ . "/load_element.php");
			}
		}
	}
};

// Chrono::addHeaderTag('<script src="'.$this->root_url.'media/vendor/tinymce/tinymce.min.js?nocache'.'"></script>');
Chrono::loadEditor();
?>
<script>
	function saveform(){
		<?php
			if(empty(Chrono::getVal($this->settings, "max_field_mode", ""))){
				echo "return";
			}
		?>
		form = document.querySelector("form.nui.form")

		let formData = new FormData(form)
		let arr = new FormData(undefined)
		let fi = 1
		let tot = 1

		// console.log(Array.from(formData.keys()).length)

		formData.keys().forEach(key => {
			if(arr.has(key)){
				return
			}
			// console.log(key, formData.getAll(key))
			// arr[key] = formData.getAll(key)
			value = formData.getAll(key)
			if(value.length > 1){
				value.forEach(v => {
					arr.append(key, v)
				})
				// arr.set(key, new Blob(value), 'blob')
			}else{
				arr.set(key, value)
			}
			// arr.set(key, value)
			
			form.querySelector('[name="'+key+'"]').disabled = true
			fi++
			tot++
			if(fi == 200){
				// console.log(arr)
				values = new URLSearchParams(arr);
				values = values.toString()
				// console.log(values)
				form_data = Nui.Core.create_element('<textarea name="form_data[]" style="display:none;" class="form_data"></textarea>')
				form.append(form_data)
				form_data.value = values

				fi = 1
				arr = new FormData(undefined)
			}
		})

		if(fi  > 1){
			// console.log(arr)
			values = new URLSearchParams(arr);
			values = values.toString()
			// console.log(values)
			form_data = Nui.Core.create_element('<textarea name="form_data[]" style="display:none;" class="form_data"></textarea>')
			form.append(form_data)
			form_data.value = values

			fi = 1
			arr = new FormData(undefined)
		}

		// data = new FormData(form)
		
		// data.forEach((input, name) => {
		// 	form.querySelector('[name="'+name+'"]:not(.form_data)').disabled = true
		// });
		
		// return true

		// values = new URLSearchParams(Array.from(new FormData(form)));
		// values = values.toString()

		// data = new FormData(form)
		
		// data.forEach((input, name) => {
		// 	form.querySelector('[name="'+name+'"]').disabled = true
		// });
		// // return false

		// var chunks = [];
		// var chunkSize = 1000;

		// while (values) {
		// 	if (values.length < chunkSize) {
		// 		chunks.push(values);
		// 		break;
		// 	}else {
		// 		chunks.push(values.substr(0, chunkSize));
		// 		values = values.substr(chunkSize);
		// 	}
		// }

		// let i = 0
		// while(i < chunks.length){
		// 	form_data = Nui.Core.create_element('<textarea name="form_data['+i+']" style="display:none;"></textarea>')
		// 	form.append(form_data)
		// 	form_data.value = chunks[i]
		// 	i++
		// }
	}

	function quicksaveform(field){
		field.closest("form").classList.add("loading");

		saveform()
		
		let postBody = new FormData(field.closest("form"))

		if(field.closest("form").querySelectorAll(".form_data")){
			field.closest("form").querySelectorAll(".form_data").forEach(form_data => {
				form_data.remove()
			})
			field.closest("form").querySelectorAll("[name]").forEach(input => {
				input.disabled = false
			})
		}
		
		
		const xhttp = new XMLHttpRequest();

		xhttp.addEventListener("readystatechange", (e) => {
			if (e.target.readyState == 4 && e.target.status == 200) {
				field.closest("form").classList.remove("loading");
				Nui.Toast.show({ "message": "Form Saved", "color": "green", "position": "bottom right" })
			}
		})

		xhttp.open("POST", field.closest("form").getAttribute("action"));
		xhttp.send(postBody);
	}

	// document.addEventListener("DOMContentLoaded", function(event) {
	// 	document.querySelector(".nui.form").addEventListener("dynamic_init", e => {
	// 		quicksaveform()
	// 	})
	// })
</script>
<form class="nui form" action="<?php echo ChronoApp::$instance->current_url; ?>" method="post" enctype="multipart/form-data" accept-charset="UTF-8" onsubmit="saveform()" <?php if(Chrono::getVal($this->settings, "label_fieldname", "1") == "1"): ?>data-autofieldname="1"<?php endif; ?>>
	<?php
	$buttons = [];
	
	$buttons[] = new MenuButton(name: "save", title: "Save", icon: "floppy-disk", color: "blue");
	
	if (strlen(ChronoApp::$instance->Data("id")) > 0){
		$buttons[] = new MenuButton(name: "quick_save", title: "Quick Save", icon: "check", color: "blue", params:'onclick="quicksaveform(this)"', type:"button");
	}
	$title = "New Form";
	if(!empty($row["id"])){
		$title = "<span class='nui smaller'>".$row["title"]." (".$row["alias"].")</span>";
		array_push($buttons, new MenuButton(name: "preview", link: true, title: "Preview", icon: "display", color: "colored slate", params:"target='_blank'", url: "action=view&chronoform=".$row["alias"]));
	}
	$buttons[] = new MenuButton(name: "help", link: true, title: "Help", icon: "question", color: "slate", params:"target='_blank'", url: "https://www.chronoengine.com/faqs/chronoforms/chronoforms8/");
	$buttons[] = new MenuButton(name: "close", link: true, title: "Close", icon: "xmark", color: "red", url: "action=index");
	
	new MenuBar(title: $title, buttons: $buttons);

	new FormField(name: "id", label: "ID", type: "hidden");
	?>

	<div class="equal fields">
		<?php new FormField(name: "title", label: "Title", value:"Form @ ".gmdate("d-m-Y H:i:s"), code: 'data-validations=\'{"rules":[{"type":"required","prompt":"This field is required."}]}\''); ?>
		<?php new FormField(name: "alias", label: "Alias", value:"", hint: "This alias is used for calling form in shortcodes and menuitems, example: my-form", code: 'data-validations=\'{"rules":[{"type":"regex","regex":"/^[0-9A-Za-z-_]+$/","prompt":"Only alphabetical characters, numbers and - are allowed."}]}\''); ?>
	</div>
	
	<div>
		<div class="nui flex tabular menu top attached">
			<div class="active item" data-tab="designer">Designer</div>
			<div class="item" data-tab="settings">Settings</div>
		</div>
		<div class="nui segment flex white spaced bordered bottom attached tab" data-tab="designer">
			<div style="width:75%">
				<div class="nui flex vertical spaced form_designer" data-url="<?php echo ChronoApp::$instance->extension_url; ?>&output=component">
					<?php
						$pagegroups = [""];
						foreach ($elements as $element){
							if ($element["type"] == "page"){
								if(!empty($element["pagegroup"]) && !in_array($element["pagegroup"], $pagegroups)){
									$pagegroups[] = $element["pagegroup"];
								}
							}
						}
					?>
					<?php foreach ($elements as $element) : ?>
						<?php if ($element["type"] == "page") : ?>
							<?php $pid = $element["id"]; ?>

							<div class="nui page_box">
								<input type="hidden" name="elements[<?php echo $pid; ?>][id]" value="<?php echo $pid; ?>">
								<input type="hidden" name="elements[<?php echo $pid; ?>][type]" value="page">
								<?php new FormField(name: "elements[".$pid."][minimized]", type: "hidden"); ?>

								<div class="nui flex tabular menu top attached" data-parent='[data-tab="designer"]'>
									<div class="item nui header">Page<span class="nui italic page_counter"><?php echo $pid; ?></span></div>
									<div class="active item hide_minimized" data-tab="load"><?php echo Chrono::ShowIcon("bolt"); ?>Load</div>
									<div class="item hide_minimized" data-tab="submit"><?php echo Chrono::ShowIcon("bolt"); ?>Submit</div>
									<div class="item hide_minimized" data-tab="page-options"><?php echo Chrono::ShowIcon("gears"); ?>Options</div>
									<div class="item nui header"><span class="nui underlined page-alias-display"><?php echo (!empty($element["alias"]) ? $element["alias"] : "page".$pid); ?></span></div>
									<div class="item right nui header">
										<div class="nui link hide_minimized minimize_page"><?php echo Chrono::ShowIcon("minimize"); ?></div>
										<div class="nui link maximize_page"><?php echo Chrono::ShowIcon("maximize"); ?></div>
										<div class="nui link drag_page"><?php echo Chrono::ShowIcon("sort"); ?></div>
										<div class="nui link remove_page"><?php echo Chrono::ShowIcon("xmark"); ?></div>
									</div>
								</div>
								<div class="nui segment spaced bordered rounded bottom attached tab flex vertical droppable sortable form_page hide_minimized" data-pid="<?php echo $pid; ?>" data-section="load" data-tab="load" data-hint="Drag Views or Actions from the right side."><?php $loadElements($elements, $pid, "load"); ?></div>
								<div class="nui segment spaced bordered rounded bottom attached tab flex vertical droppable sortable form_page hide_minimized" data-pid="<?php echo $pid; ?>" data-section="submit" data-tab="submit" data-hint="Drag Views or Actions from the right side."><?php $loadElements($elements, $pid, "submit"); ?></div>
								<div class="nui segment form white bordered rounded bottom attached tab hide_minimized" data-tab="page-options">
									<div class="equal fields">
										<?php new FormField(name: "elements[".$pid."][title]", label: "Title", field_class:"page_title", value: "Page".$pid, hint:"Page title is used in Navigation bar in Multi Page forms"); ?>
										<?php new FormField(name: "elements[".$pid."][alias]", label: "Alias", field_class:"page_alias", value: "page".$pid, hint:"Page alias is used in links when you want to link to a specific page using: form-url&chronopage=page-alias"); ?>
									</div>
									<div class="equal fields">
										<?php new FormField(name: "elements[".$pid."][pagegroup]", label: "Page Group", value: "", hint:"The page group to which this page belongs, use page groups if your form pages will do different tasks."); ?>
										<?php new FormField(name: "elements[".$pid."][icon]", label: "Icon", hint:"Page icon is used in Navigation bar in Multi Page forms"); ?>
									</div>
								</div>
							</div>
						<?php endif; ?>
					<?php endforeach; ?>
				</div>

				<div class="nui block"></div>

				<button type="button" class="nui button blue block full width iconed add_page"><?php echo Chrono::ShowIcon("plus"); ?>New Page</button>
			</div>

			<div class="nui xsegment flex vertical xbordered rounded white tools_box sticky" style="top:75px">
				<?php if (strlen(ChronoApp::$instance->Data("id")) > 0) : ?>
					<!-- <h4><?php echo $row["title"]; ?></h4> -->
					<!-- <button type="button" id="quick_save" name="apply" class="nui button blue iconed" onclick="quicksaveform(this)"><?php echo Chrono::ShowIcon("check"); ?>Quick Save</button> -->
				<?php endif; ?>

				<!-- <div class="nui block"></div> -->

				<div class="nui flex tabular menu top attached" data-parent='[data-tab="designer"]'>
					<div class="active item" data-tab="views" data-demo="field">Views</div>
					<div class="item" data-tab="actions" data-demo="message">Actions</div>
				</div>
				<div class="nui flex vertical bordered rounded grey bottom attached tab" data-tab="views">
					<div class="nui flex vertical p1 divided rounded accordion">
						<?php foreach(["Fields", "Security", "Areas", "Content"] as $group): ?>
							<div class="item <?php if($group == "Fields"){ echo "active"; } ?> nui pv1">
								<div class="title nui bold">
									<i class="dropdown icon"></i>
									<?php echo $group; ?>
								</div>
								<div class="content nui flex vertical spaced p0">
									<?php foreach ($views[$group] as $view) : ?>
										<div class="nui label rounded colored teal inverted link draggable original_item" data-type="views" data-name="<?php echo $view->name; ?>"><?php echo Chrono::ShowIcon($view->icon); ?><?php echo $view->title; ?><?php echo (!empty($view->premium) ? Chrono::ShowIcon("dollar-sign nui black") : "") ?></div>
									<?php endforeach; ?>
								</div>
							</div>
						<?php endforeach; ?>
					</div>
				</div>
				<div class="nui flex vertical bordered rounded grey bottom attached tab" data-tab="actions">
					<div class="nui flex vertical p1 divided rounded accordion">
						<?php foreach(["Basics", "Database", "Files", "Advanced", "Services", "Joomla"] as $group): ?>
							<div class="item <?php if($group == "Basics"){ echo "active"; } ?> nui pv1">
								<div class="title nui bold">
									<i class="dropdown icon"></i>
									<?php echo $group; ?>
								</div>
								<div class="content nui flex vertical spaced p0">
									<?php foreach ($actions[$group] as $action) : ?>
										<div class="nui label rounded colored purple inverted link draggable original_item" data-type="actions" data-name="<?php echo $action->name; ?>"><?php echo Chrono::ShowIcon($action->icon); ?><?php echo $action->title; ?><?php echo (!empty($action->premium) ? Chrono::ShowIcon("dollar-sign nui black") : "") ?></div>
									<?php endforeach; ?>
								</div>
							</div>
						<?php endforeach; ?>
					</div>
				</div>

			</div>

		</div>
		<div class="nui segment form white bordered rounded bottom attached tab" data-tab="settings">
		
			<fieldset class="nui segment form bordered rounded">
				<legend class="nui bold large label grey rounded">General</legend>
				<div class="equal fields">
					<?php
					new FormField(name: "published", label: "Published", type: "select", hint:"Form is open for public ?", options: [
						new Option(text: "Yes", value: "1"),
						new Option(text: "No", value: "0"),
					]);
					new FormField(name: "params[log_data]", label: "Log Data", type: "select", hint:"Log form data to the log table ?", options: [
						new Option(text: "Yes", value: "1"),
						new Option(text: "No", value: "0"),
					]);
					?>
				</div>
				<?php new FormField(name: "params[info]", type: "textarea", rows:2, label: "Description", hint:"Short description for the form to appear in the forms manager"); ?>
				<div class="equal fields">
					<?php
						new FormField(name: "params[debug]", label: "Debug", type: "select", hint:"Show form debug data ?", options: [
							new Option(text: "No", value: "0"),
							new Option(text: "Yes", value: "1"),
						]);
					?>
					<?php new FormField(name: "params[debug_ips]", type:"select", label: "Debug allowed IPs", multiple:true, code:"data-additions='1' data-separators=','", hint:"Comma separated list of IP addresses to enable the Debug display"); ?>
				</div>
				<?php
					if(!empty($this->settings["categories"])){
						new FormField(name: "category", label: "Category", type: "select", hint:"Form Category", options: array_merge([""], $this->settings["categories"]));
					}
				?>
			</fieldset>

			<fieldset class="nui segment form bordered rounded">
				<legend class="nui bold large label grey rounded">Multi Page</legend>

				<div class="equal fields">
					<?php
						new FormField(name: "params[next_page]", label: "Next Page", type: "select", hint:"How to decide next page ?", options: [
							new Option(text: "Auto", value: "1"),
							new Option(text: "Manual", value: "0"),
						]);
						// new FormField(name: "params[page_jump]", label: "Page Hopping", type: "select", hint:"Users can go back or forward to previous completed pages", options: [
						// 	new Option(text: "Yes", value: "1"),
						// 	new Option(text: "No", value: "0"),
						// ]);
						new FormField(name: "params[navbar]", label: "Navigation Bar", type: "select", hint:"Enable the navigation bar for Multi page forms ?", options: [
							new Option(text: "Yes", value: "1"),
							new Option(text: "No", value: "0"),
						]);
					?>
				</div>
			</fieldset>

			<fieldset class="nui segment form bordered rounded">
				<legend class="nui bold large label grey rounded">Processing</legend>
				<div class="equal fields">
					<?php
						new FormField(name: "params[method]", label: "Form Method", type: "select", options: [
							new Option(text: "POST", value: "post"),
							new Option(text: "GET", value: "get"),
						]);
						new FormField(name: "params[ajax]", label: "AJAX Form", type: "select", hint:"Use AJAX to submit the form, parent page will not reload.", options: [
							new Option(text: "No", value: ""),
							new Option(text: "Yes", value: "1"),
						]);
					?>
				</div>
				<?php new FormField(name: "params[action]", label: "Action URL", hint:"LEAVE EMPTY to use the default Action URL or set one to use yours, WARNING, changing this will disable ALL submit actions & views."); ?>
			</fieldset>

			<fieldset class="nui segment form bordered rounded">
				<legend class="nui bold large label grey rounded">Display</legend>
				<?php
					new FormField(name: "params[class]", label: "CSS Class", hint:"css classes to add to the form tag, you can create custom classes using the Style view");
				?>
				<div class="equal fields">
				<?php
					new FormField(name: "params[css_vars][pad]", label: "Padding", hint:"Set a global padding css variable for all form fields. default: 0.5em");
					new FormField(name: "params[css_vars][space]", label: "Spacing", hint:"Set a global spacing css variable for all form fields. default: 0.5em");
					new FormField(name: "params[css_vars][rad]", label: "Radius", hint:"Set a global border radius css variable for all form fields. default: 0.5em");
					new FormField(name: "params[css_vars][bw]", label: "Border Width", hint:"Set a global border width css variable for all form fields. default: 1px");
				?>
				</div>
			</fieldset>
			
			<fieldset class="nui segment form bordered rounded">
				<legend class="nui bold large label grey rounded">Access</legend>
				<div class="equal fields">
				<?php
					$levels = $this->get("app_viewlevels", []);

					$options = [new Option(text: "?", value: "")];
					foreach($levels as $level){
						$options[] = new Option(text: $level["title"], value: $level["id"]);
					}
					new FormField(name: "params[acl]", label: "Viewlevel", type: "select", hint:"Which user levels can access any of the form pages", options: $options);
					new FormField(name: "params[acl_error]", label: "Access error", value:"You can not access this form.", hint:"Error shown when the user does not have the access level selected.");
				?>
				</div>
				<?php
					new FormField(name: "params[session_token_error]", label: "Session token error", value:"Your session has timed out or your tried to access a wrong page.", hint:"Error shown when a form page is accessed directly without the session token.");
				?>
			</fieldset>

			<fieldset class="nui segment form bordered rounded">
				<legend class="nui bold large label grey rounded">Locales</legend>
				<?php //new FormField(name: "params[locales][default]", label: "Default Language Code", value:"", hint:"The default language code of your web site."); ?>
				<?php foreach(["n" => ""] + (!empty($row["params"]["locales"]) ? $row["params"]["locales"]["lang"] : []) as $k => $lang): ?>
					<div class="nui form clonable locales" data-selector=".clonable.locales" data-cloner=".locales-cloner" data-key="<?php echo $k; ?>">
						<?php
							new FormField(name: "params[locales][lang][".$k."]", label: "Language Code", value:"", hint:"The language code in your web site.");
							new FormField(name: "params[locales][strings][".$k."]", type:"textarea", rows:10, label: "Language Strings", value:"", hint:"The language translation strings in this format:
								LANGUAGE_STRING=String translated in this Language
								Call language strings in your form using {l:LANGUAGE_STRING}");
						?>
						<button type="button" class="nui button red iconed block remove-clone"><?php echo Chrono::ShowIcon("xmark"); ?>Remove Language</button>
						<div class="nui divider block"></div>
					</div>
				<?php endforeach; ?>
				<button type="button" class="nui button blue iconed locales-cloner"><?php echo Chrono::ShowIcon("plus"); ?>Add Language</button>
			</fieldset>
		</div>
	</div>

</form>