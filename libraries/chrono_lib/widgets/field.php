<?php
/**
* ChronoLibrary
* Copyright (c) 2025 ChronoEngine.com, All rights reserved.
* Author: (ChronoEngine.com Team)
* license: GNU General Public License version 2 or later; see LICENSE.txt
* Visit http://www.ChronoEngine.com for regular updates and information.
**/
defined('_JEXEC') or die('Restricted access');

// if(class_exists('CF8')){
// 	// make sure this is for CF only
// 	$field->name = CF8::parse($field->name);
// }

if(str_contains($field->name, ".")){
	$count = 1;
	$field->name = substr_replace($field->name, "[", strpos($field->name, "."), 1);
	$field->name = $field->name."]";
	$field->name = str_replace(".", "][", $field->name);
}
if (strlen($field->type) == 0) {
	$field->type = "text";
}
if (strlen($field->id) == 0) {
	$field->id = $field->name;
	if(str_contains($field->id, "[")){
		$field->id = str_replace("][", "_", $field->id);
		$field->id = str_replace("[", "_", $field->id);
		$field->id = trim($field->id, "]");
		$field->id = strtolower($field->id);
	}
}
if ($field->multiple) {
	$field->code .= ' multiple="multiple"';
	if(!str_ends_with($field->name, "[]")){
		$field->name .= "[]";
	}
}
if($field->type == "checkboxes"){
	if(!str_ends_with($field->name, "[]")){
		$field->name .= "[]";
	}
}
if($field->type == "textarea"){
	if(isset($field->params["editor"])){
		if($field->params["editor"] != "1"){
			ChronoHTML::EditorButtons($field->id);
		}
		$field->code .= ' data-editor="'.$field->params["editor"].'"';
	}
}

// $field_data_path = $field->name;
// if (str_contains($field->name, "[")) {
// 	$field_data_path = trim($field_data_path, "[]");
// 	$field_data_path = str_replace("][", ".", $field_data_path);
// 	$field_data_path = str_replace("[", ".", $field_data_path);
// 	// Chrono::pr($field_data_path);
// 	// Chrono::pr(explode(".", $field_data_path));
// 	// Chrono::pr(Chrono::getVal(ChronoApp::$instance->DataArray(), explode(".", $field_data_path)));
// }
$dvalue = Chrono::getVal(ChronoApp::$instance->DataArray(), $field->name);
// Chrono::pr($dvalue);
if(is_null($dvalue) && !empty($field->value) && ($field->type != "checkbox")){
	$dvalue = $field->value;
}
if (strlen($field->name) > 0 && !is_null($dvalue)) {
	switch ($field->type) {
		case "select":
		case "radios":
		case "checkboxes":
			if (str_contains($field->code, "data-additions")) {
				$options_values = [];
				foreach ($field->options as $k => $option) {
					$options_values[] = $option->value;
				}
				foreach ((array)$dvalue as $dv) {
					if (!in_array($dv, $options_values)) {
						$field->options[] = new Option(text: $dv, value: $dv);
					}
				}
			}
			
			foreach ($field->options as $k => $option) {
				$field->options[$k]->selected = false;
				if ($field->multiple || $field->type == "checkboxes" || $field->type == "radios") {
					if (in_array($option->value, (array)$dvalue)) {
						$field->options[$k]->selected = true;
					}
				} else {
					if ($option->value == $dvalue) {
						$field->options[$k]->selected = true;
					}
				}
			}

			break;
		case "checkbox":
			if($field->value == $dvalue){
				$field->checked = true;
			}
			break;
		default:
			$field->value = $dvalue;
			break;
	}
}

if(is_string($field->value) && strlen($field->value) > 0){
	$field->value = htmlspecialchars($field->value);
}

$belowField = function ($field) {
	if (strlen($field->hint)) {
		echo "<small>" . nl2br($field->hint) . "</small>";
	}
	if (count($field->errors) > 0) {
		foreach ($field->errors as $error) {
			echo '<span class="errormsg">' . $error . '</span>';
		}
	}
};

$besideLabel = function ($field) {
	if (strlen($field->tooltip)) {
		echo '&nbsp;<span class="nui label blue circular small inverted" data-popup title="'.nl2br($field->tooltip).'">' . Chrono::ShowIcon("info") . '</span>';
	}
};

$error = "";
if (count($field->errors) > 0) {
	$error = "error";
}
?>
<?php if (!in_array($field->type, ["hidden", "button"])) : ?>
	<?php if ($field->type == "checkbox") : ?>
		<div class="field holder <?php echo $error; ?> <?php echo isset($field->params["field_class"]) ? $field->params["field_class"] : ""; ?>" <?php if(!empty($field->params["styles"])){ echo 'style="'.implode(";", $field->params["styles"]).'"';} ?>>
			<?php if (!empty($field->params["toplabel"])) : ?>
				<label for="<?php echo $field->id; ?>"><?php echo $field->params["toplabel"]; ?></label>
			<?php endif; ?>
			<div class="nui checkbox <?php echo isset($field->params["color"]) ? $field->params["color"] : ""; ?>">
				<?php require(__DIR__ . "/fields/" . $field->type . ".php"); ?>
				<label tabindex="0"><?php echo Chrono::ShowIcon("square unchecked regular"); ?><?php echo Chrono::ShowIcon("square-check checked"); ?><?php echo $field->label; ?></label>
				<input name="<?php echo $field->name; ?>" value="<?php echo isset($field->params["ghostvalue"]) ? $field->params["ghostvalue"] : ""; ?>" type="hidden">
			</div>
			<?php $belowField($field); ?>
		</div>
	<?php elseif(in_array($field->type, ["radios", "checkboxes"])) : ?>
		<div class="field holder <?php echo $error; ?> <?php echo isset($field->params["field_class"]) ? $field->params["field_class"] : ""; ?>" <?php if(!empty($field->params["styles"])){ echo 'style="'.implode(";", $field->params["styles"]).'"';} ?>>
			<?php if (strlen($field->label)) : ?>
				<label><?php echo $field->label; ?></label>
			<?php endif; ?>
			<div class="<?php echo (isset($field->params["layout"]) && empty($field->params["layout"])) ? "fields" : "nui grid stackable horizontal spaced columnx".(isset($field->params["column_count"]) ? $field->params["column_count"] : "1"); ?> <?php echo $error; ?> <?php echo isset($field->params["field_class"]) ? $field->params["field_class"] : ""; ?>">
				<?php require(__DIR__ . "/fields/" . $field->type . ".php"); ?>
			</div>
			<?php $belowField($field); ?>
		</div>
	<?php else : ?>
		<div class="field holder <?php echo $error; ?> <?php echo isset($field->params["field_class"]) ? $field->params["field_class"] : ""; ?>" <?php if(!empty($field->params["styles"])){ echo 'style="'.implode(";", $field->params["styles"]).'"';} ?>>
			<?php if (strlen($field->label)) : ?>
				<label for="<?php echo $field->id; ?>"><?php echo $field->label; ?><?php $besideLabel($field); ?></label>
			<?php endif; ?>
			<?php require(__DIR__ . "/fields/" . $field->type . ".php"); ?>
			<?php $belowField($field); ?>
		</div>
	<?php endif; ?>
<?php else : ?>
	<?php require(__DIR__ . "/fields/" . $field->type . ".php"); ?>
	<?php $belowField($field); ?>
<?php endif; ?>