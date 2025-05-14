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
	<?php new FormField(name: "elements[$id][label]", label: "Label", value: "Range $id"); ?>
	<?php new FormField(name: "elements[$id][fieldname]", label: "Field Name", value: "range_$id"); ?>
</div>
<div class="equal fields">
	<?php new FormField(name: "elements[$id][min]", label: "Minimum", value: "0", hint:"Minimum value for the slider"); ?>
	<?php new FormField(name: "elements[$id][max]", label: "Maximum", value: "10", hint:"Maximum value for the slider"); ?>
	<?php new FormField(name: "elements[$id][step]", label: "Step", value: "1", hint:"The value of each slider step"); ?>
</div>
<?php new FormField(name: "elements[$id][options]", type:"textarea", label: "Options", value: "1=1
4=4
9=9", rows: 5, hint:"Multiline list of range slider markers, use the format value=Label"); ?>
<?php new FormField(name: "elements[$id][display]", type:"select", label: "Display Value Field", hint: "Show the current selected value under the range slider", options:[
	new Option(value:"", text:"No"),
	new Option(value:"1", text:"Yes"),
]); ?>
<?php
$behaviors = ["validation_required", "validation_function", "hint", "tooltip", "field_class", "field_width", "html_attributes", "events_triggers", "events_listeners", "default_value"];
$listBehaviors($id, $behaviors);
?>