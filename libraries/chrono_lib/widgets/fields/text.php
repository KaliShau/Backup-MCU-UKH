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
<?php if(!empty($field->icon)): ?><div class="input iconed <?php echo isset($field->params["icon_pos"]) ? $field->params["icon_pos"] : ""; ?>"><?php endif; ?>
<input type="<?php echo !empty($field->params["input_type"]) ? $field->params["input_type"] : "text"; ?>" name="<?php echo $field->name; ?>"
 id="<?php echo $field->id; ?>" 
 placeholder="<?php echo $field->placeholder; ?>" 
 value="<?php echo $field->value; ?>" <?php echo $field->code; ?>>
 <?php if(!empty($field->icon)): ?><?php echo Chrono::ShowIcon($field->icon); ?></div><?php endif; ?>