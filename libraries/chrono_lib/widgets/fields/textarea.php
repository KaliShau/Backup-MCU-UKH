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
<textarea name="<?php echo $field->name; ?>" id="<?php echo $field->id; ?>"
 <?php if(isset($field->cols)): ?>cols="<?php echo $field->cols; ?>"<?php endif; ?>
  rows="<?php echo $field->rows; ?>" placeholder="<?php echo $field->placeholder; ?>" <?php echo $field->code; ?>><?php echo $field->value; ?></textarea>