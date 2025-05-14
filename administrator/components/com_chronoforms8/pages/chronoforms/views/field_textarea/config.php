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
	<?php new FormField(name: "elements[$id][label]", label: "Label", value: "Textarea $id"); ?>
	<?php new FormField(name: "elements[$id][fieldname]", label: "Field Name", value: "textarea_$id"); ?>
</div>
<?php
$behaviors = [
	"validation_required",
	"validation_regex",
	"validation_function",
	"field_class",
	"field_width",
	"field_textarea.editor",
	"field_textarea.rows",
	"placeholder", "default_value", "hint", "tooltip", "html_attributes", "events_triggers", "events_listeners"
];
$listBehaviors($id, $behaviors);
?>