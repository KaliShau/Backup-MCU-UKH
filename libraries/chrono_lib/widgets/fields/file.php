<?php
/**
* ChronoLibrary
* Copyright (c) 2025 ChronoEngine.com, All rights reserved.
* Author: (ChronoEngine.com Team)
* license: GNU General Public License version 2 or later; see LICENSE.txt
* Visit http://www.ChronoEngine.com for regular updates and information.
**/
defined('_JEXEC') or die('Restricted access');
?>
<label for="<?php echo $field->id; ?>" class="nui button grey iconed" tabindex="0">
	<?php echo Chrono::ShowIcon("file"); ?>
	<?php if(!empty(ChronoApp::$instance->data($field->name))): ?>
		<?php
		$files = (array)ChronoApp::$instance->data($field->name);
		foreach($files as $k => $file):
		?>
		<input type="hidden" name="<?php echo $field->name; ?>" value="<?php echo $file; ?>">
		<?php $files[$k] = htmlspecialchars($file); ?>
		<?php endforeach; ?>
		<?php echo implode(", ", $files); ?>
	<?php else: ?>
		<?php echo !empty($field->placeholder) ? $field->placeholder : "Select file"; ?>
	<?php endif; ?>
</label>
<?php
	$accept = (!empty($field->params["extensions"]) ? 'accept=".'.implode(",.", $field->params["extensions"]).'"' : '');
?>
<input class="nui file hidden" type="file" name="<?php echo $field->name; ?>" id="<?php echo $field->id; ?>" placeholder="<?php echo !empty($field->placeholder) ? $field->placeholder : "Select file"; ?>" <?php echo $accept; ?> <?php echo $field->code; ?>>