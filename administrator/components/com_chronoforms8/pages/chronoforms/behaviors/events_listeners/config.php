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
	$element_name = !empty($this->data["elements"][$id]["name"]) ? $this->data["elements"][$id]["name"] : $this->data("name");
?>
<?php foreach(["n" => []] + (!empty($this->data["elements"][$id]["listeners"]) ? $this->data["elements"][$id]["listeners"] : []) as $k => $item): ?>
	<div class="nui form clonable listeners-<?php echo $id; ?>" data-selector=".clonable.listeners-<?php echo $id; ?>" data-cloner=".listeners-<?php echo $id; ?>-cloner" data-key="<?php echo $k; ?>">
		<div class="equal fields">
			<?php
				// new FormField(name: "elements[$id][listeners][".$k."][trigger]", label: "On Trigger of");
				new FormField(name: "elements[$id][listeners][".$k."][trigger]", type:"select", multiple:true, label: "On Trigger of", code:" data-additions='1' data-separators=','", options:[]);
				
				$options = [
					new Option(text:"Show", value:"show"),
					new Option(text:"Hide", value:"hide"),
					new Option(text:"Disable Validation", value:"disable_validation"),
					new Option(text:"Enable Validation", value:"enable_validation"),
					new Option(text:"Enable", value:"enable"),
					new Option(text:"Disable", value:"disable"),
				];
				if($element_name == "field_checkboxes"){
					$options[] = new Option(text:'Select All', value:"select_all");
				}

				new FormField(name: "elements[$id][listeners][".$k."][actions]", type:"select", multiple:true, label: "Action to do", options:$options);
			?>
			<button type="button" class="nui label red rounded link flex_center remove-clone self-center"><?php echo Chrono::ShowIcon("trash"); ?></button>
		</div>
		<div class="nui divider block"></div>
	</div>
<?php endforeach; ?>

<div class="equal fields">
	<button type="button" class="nui button blue iconed listeners-<?php echo $id; ?>-cloner"><?php echo Chrono::ShowIcon("plus"); ?>Add Listener</button>
</div>

<div class="nui divider block"></div>
<div class="nui flex vertical divided rounded accordion">
	<div class="item">
		<div class="title nui bold underlined">
			<?php echo Chrono::ShowIcon("arrow-down"); ?>Actions Hints ?
		</div>
		<div class="content nui flex vertical spaced p0">
			<ol>
				<li>Call Function: will call a function with one parameter which is this field object, the function must be defined inside a Javascript View, Action Parameters: the javascript function name</li>
				<li>Set Value: will set the value of this field, Action Parameters: the target value(s)</li>
				<li>Clear Value: will clear the value of this field, Action Parameters: none</li>
				<li>Submit Form: will submit the form, Action Parameters: none</li>
				<li>AJAX Call: will post the current form values to the page specified, Action Parameters: Form Page alias to call, (Optional) JS function to call on complete with the AJAX result passed as a parameter</li>
				<li>Reload: post form to page specified and replace the current item with the returned output, Action Parameters: Form Page alias to call</li>
				<li>Load Options: post form to page specified and set the dropdown options to the list of json encoded options returned, Action Parameters: Form Page alias to call</li>
			</ol>
		</div>
	</div>
</div>

<?php foreach(["n" => []] + (!empty($this->data["elements"][$id]["listeners2"]) ? $this->data["elements"][$id]["listeners2"] : []) as $k => $item): ?>
	<div class="nui form clonable listeners2-<?php echo $id; ?>" data-selector=".clonable.listeners2-<?php echo $id; ?>" data-cloner=".listeners2-<?php echo $id; ?>-cloner" data-key="<?php echo $k; ?>">
		<div class="equal fields">
			<?php
				// new FormField(name: "elements[$id][listeners2][".$k."][trigger]", label: "On Trigger of");
				new FormField(name: "elements[$id][listeners2][".$k."][trigger]", type:"select", multiple:true, label: "On Trigger of", code:" data-additions='1' data-separators=','", options:[]);
				
				$options = [
					new Option(text:"Select action", value:""),
					new Option(text:'Call Function', value:"call_fn"),
					new Option(text:'Set Value', value:"set_value"),
					new Option(text:'Clear Value', value:"clear_value"),
					new Option(text:'Submit Form', value:"submit"),
					new Option(text:'AJAX Call', value:"ajax"),
					new Option(text:'Reload', value:"reload"),
				];
				if($element_name == "field_select"){
					$options[] = new Option(text:'Load Options', value:"load_options");
				}

				new FormField(name: "elements[$id][listeners2][".$k."][action]", type:"select", label: "Action to do", options:$options);
				
				new FormField(name: "elements[$id][listeners2][".$k."][params]", type:"select", multiple:true, label: "Action Parameters", code:" data-additions='1' data-separators=','", options:[]);
			?>
			<button type="button" class="nui label red rounded link flex_center remove-clone self-center"><?php echo Chrono::ShowIcon("trash"); ?></button>
		</div>
		<div class="nui divider block"></div>
	</div>
<?php endforeach; ?>

<div class="equal fields">
	<button type="button" class="nui button blue iconed listeners2-<?php echo $id; ?>-cloner"><?php echo Chrono::ShowIcon("plus"); ?>Add Advanced Listener</button>
</div>