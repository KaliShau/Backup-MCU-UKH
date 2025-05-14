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
<button class="nui button <?php echo $field->class; ?>" name="<?php echo $field->name; ?>" <?php if(strlen($field->value) > 0): ?>value="<?php echo $field->value; ?>"<?php endif; ?>
 id="<?php echo $field->id; ?>" type="<?php echo !empty($field->params["btype"]) ? $field->params["btype"] : "submit"; ?>" <?php echo $field->code; ?>>
 <?php echo !empty($field->icon) ? Chrono::ShowIcon($field->icon) : ""; ?><?php echo $field->label; ?>
</button>