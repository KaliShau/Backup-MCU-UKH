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
	<?php new FormField(name: "elements[$id][label]", label: "Label", value: "Text $id"); ?>
	<?php new FormField(name: "elements[$id][fieldname]", label: "Field Name", value: "text_$id"); ?>
</div>
<?php
$behaviors = [
	"validation_required",
	"validation_email",
	"validation_regex",
	"validation_function",
	"validation_matches",
	"field_class",
	"field_width",
	"list_search",
	"list_filter",
	"placeholder", "default_value", "hint", "tooltip", "icon", "html_attributes", "events_triggers", "events_listeners", "field_text.input_type", "field_text.input_mask"
];
$listBehaviors($id, $behaviors);
?>