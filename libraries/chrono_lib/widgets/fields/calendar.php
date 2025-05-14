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
<div class="input iconed <?php echo isset($field->params["icon_pos"]) ? $field->params["icon_pos"] : ""; ?>">
<input type="text" name="<?php echo $field->name; ?>"
 id="<?php echo $field->id; ?>" data-calendar="1" 
 placeholder="<?php echo $field->placeholder; ?>" 
 value="<?php echo $field->value; ?>" <?php echo $field->code; ?>>
<?php echo Chrono::ShowIcon("calendar"); ?></div>
<input type="hidden" name="<?php echo $field->name; ?>" value="<?php echo $field->value; ?>">