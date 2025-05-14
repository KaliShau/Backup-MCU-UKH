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
<select name="<?php echo $field->name; ?>" id="<?php echo $field->id; ?>" class="nui select <?php echo $field->class; ?>" <?php if(!empty($field->params["column_count"])): ?>data-menuclass="nui grid stackable horizontal columnx<?php echo $field->params["column_count"]; ?>"<?php endif; ?> <?php echo $field->code; ?>>
    <?php foreach($field->options as $option): ?>
		<?php if(!empty($option->header)): ?>
		<option class="header"><?php echo $option->text; ?></option>
		<?php else: ?>
		<option value="<?php echo $option->value; ?>" <?php if($option->selected): ?>selected="selected"<?php endif; ?> <?php if($option->html): ?>data-html='<?php echo $option->html; ?>'<?php endif; ?>><?php echo (is_null($option->text) ? $option->value : $option->text); ?></option>
		<?php endif; ?>
	<?php endforeach; ?>
</select>