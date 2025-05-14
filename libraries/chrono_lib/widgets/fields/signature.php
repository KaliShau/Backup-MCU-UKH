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
<?php
Chrono::loadAsset("/assets/signature_pad.min.js");
Chrono::loadAsset("/assets/nui.signature_pad.min.js");
?>
<div class="nui segment bordered rounded white">
    <canvas width="100%" data-signature="1" height="150" style="touch-action: none;"></canvas>
</div>
<?php new FormField(name: "", type:"button", btype:"button", label:"Clear", icon:"eraser", class:" self-start colored slate iconed", code:' data-action="clear"'); ?>
<input type="hidden" name="<?php echo $field->name; ?>" id="<?php echo $field->id; ?>" <?php echo $field->code; ?>>