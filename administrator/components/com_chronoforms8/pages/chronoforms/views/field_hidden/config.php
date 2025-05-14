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
<div class="equal fields">
	<?php new FormField(name: "elements[$id][fieldname]", label: "Field Name", value: "hidden_$id"); ?>
</div>
<?php
$behaviors = ["default_value", "html_attributes", "validation_function"];
$listBehaviors($id, $behaviors);
?>