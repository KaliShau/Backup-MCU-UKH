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
	<?php new FormField(name: "elements[$id][label]", label: "Label", value: "Radio Group $id"); ?>
	<?php new FormField(name: "elements[$id][fieldname]", label: "Field Name", value: "radios_$id"); ?>
</div>
<?php new FormField(name: "elements[$id][options]", type:"textarea", label: "Options", value: "ck1=Choice #1
ck2=Choice #2
ck3=Choice #3", rows:5, hint:"Multiline list of options, may use any of these formats: value OR value=Text"); ?>
<?php
$behaviors = ["validation_required", "validation_function", 
"hint", "tooltip", 
"field_class", 
"field_width", 
"html_attributes", 
"fields_layout", 
"column_count", 
"dynamic_options", 
"events_triggers", 
"events_listeners", 
"selected_values",
"field_radios.labeled"
];
$listBehaviors($id, $behaviors);
?>