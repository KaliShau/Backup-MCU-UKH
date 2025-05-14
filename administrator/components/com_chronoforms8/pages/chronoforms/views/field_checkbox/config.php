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
	<?php new FormField(name: "elements[$id][label]", label: "Label", value: "Check this $id", hint:"To be shown beside the checkbox"); ?>
	<?php new FormField(name: "elements[$id][fieldname]", label: "Field Name", value: "checkbox_$id"); ?>
</div>
<div class="equal fields">
	<?php new FormField(name: "elements[$id][value]", label: "Value", value: "1"); ?>
	<?php new FormField(name: "elements[$id][toplabel]", label: "Top Label", value: "", hint:"To be shown above the checkbox"); ?>
</div>
<?php
$behaviors = ["validation_required", "validation_function", "hint", "tooltip", "field_width", "html_attributes", "events_triggers", "events_listeners", "color", "field_checkbox.checked", "field_checkbox.ghost"];
$listBehaviors($id, $behaviors);
?>