<?php
/**
* ChronoLibrary
* Copyright (c) 2025 ChronoEngine.com, All rights reserved.
* Author: (ChronoEngine.com Team)
* license: GNU General Public License version 2 or later; see LICENSE.txt
* Visit http://www.ChronoEngine.com for regular updates and information.
**/
defined('_JEXEC') or die('Restricted access');
$list = "";
if(!empty($field->options)){
	$list = $field->id."-list";
}
?>
<input type="range" name="<?php echo $field->name; ?>"
 id="<?php echo $field->id; ?>" 
 placeholder="<?php echo $field->placeholder; ?>" 
 value="<?php echo $field->value; ?>" min="<?php echo $field->params["min"]; ?>" max="<?php echo $field->params["max"]; ?>" step="<?php echo $field->params["step"]; ?>" list="<?php echo $list; ?>" <?php if(!empty($field->params["display"])): ?>onchange="document.querySelector('#<?php echo $field->id; ?>-display').value = this.value;"<?php endif; ?> <?php echo $field->code; ?>>

<datalist id="<?php echo $list; ?>">
	<?php $total = 0; ?>
	<?php foreach($field->options as $option): ?>
		<?php
			$width = (intval($option->value) * 100 / (intval($field->params["max"]) - intval($field->params["min"]))) - $total;
			$total = $total + $width;
		?>
		<option value="<?php echo $option->value; ?>" label="<?php echo $option->text; ?>" style="flex-basis:<?php echo $width; ?>%;"></option>
	<?php endforeach; ?>
</datalist>

<?php if(!empty($field->params["display"])): ?>
<input type="text" readonly="readonly" value="<?php echo $field->value; ?>" size="10" style="width:fit-content" id="<?php echo $field->id; ?>-display">
<?php endif; ?>