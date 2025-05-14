<?php
/**
* ChronoForms 8
* Copyright (c) 2023 ChronoEngine.com, All rights reserved.
* Author: (ChronoEngine.com Team)
* license:     GNU General Public License version 2 or later; see LICENSE.txt
* Visit http://www.ChronoEngine.com for regular updates and information.
**/
defined('_JEXEC') or die('Restricted access');
?>
<fieldset class="<?php echo !empty($element["fieldset_class"]) ? CF8::parse($element["fieldset_class"]) : "nui segment bordered rounded"; ?>">
	<legend class="<?php echo !empty($element["legend_class"]) ? CF8::parse($element["legend_class"]) : "nui bold large label grey rounded"; ?>"><?php echo CF8::parse($element["legend"]); ?></legend>
	<?php $DisplayElements($elements_by_parent, $element["id"], "views"); ?>
</fieldset>