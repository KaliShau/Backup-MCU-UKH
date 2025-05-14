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
<input name="<?php echo $field->name; ?>"
 value="<?php echo $field->value; ?>"
  title=""
  <?php if($field->checked): ?>checked="checked"<?php endif; ?>
   type="checkbox" class="hidden" <?php echo $field->code; ?>>