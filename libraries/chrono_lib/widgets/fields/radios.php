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
<?php foreach($field->options as $option): ?>
<div class="field">
    <?php if($option->header): ?>
	<label><strong><?php echo $option->text; ?></strong></label>
	<?php else: ?>
	<div class="nui checkbox radio <?php if(!empty($field->params["labeled"])): ?>labeled<?php endif; ?>">
		<input type="radio" name="<?php echo $field->name; ?>" tabindex="0" class="hidden" value="<?php echo $option->value; ?>" <?php if($option->selected): ?>checked="checked"<?php endif; ?> <?php echo $field->code; ?>>
		<label tabindex="0"><?php echo Chrono::ShowIcon("circle unchecked regular"); ?><?php echo Chrono::ShowIcon("circle-check checked"); ?><?php echo $option->text; ?></label>
	</div>
	<?php endif; ?>
</div>
<?php endforeach; ?>