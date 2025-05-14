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
	<?php new FormField(name: "elements[$id][label]", label: "Label", value: "Calendar $id"); ?>
	<?php new FormField(name: "elements[$id][fieldname]", label: "Field Name", value: "calendar_$id"); ?>
</div>
<div class="equal fields">
	<?php new FormField(name: "elements[$id][data-format]", label: "Display Format", value: "YYYY-MM-DD HH:mm:ss"); ?>
	<?php new FormField(name: "elements[$id][data-sformat]", label: "Stored Format", value: "YYYY-MM-DD HH:mm:ss"); ?>
</div>
<?php
$behaviors = [
	"field_calendar.datelimits",
	"field_calendar.opentimes",
	"field_calendar.startmode",
	"field_calendar.text",
	"field_calendar.timegap",
	"validation_required",
	"validation_function",
	"field_class", 
	"field_width",
	"placeholder", "default_value", "hint", "tooltip", "html_attributes", "events_triggers", "events_listeners"
];
$listBehaviors($id, $behaviors);
?>