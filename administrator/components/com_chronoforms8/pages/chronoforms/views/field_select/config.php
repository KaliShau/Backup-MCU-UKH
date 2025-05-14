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
	<?php new FormField(name: "elements[$id][label]", label: "Label", value: "Select $id"); ?>
	<?php new FormField(name: "elements[$id][fieldname]", label: "Field Name", value: "select_$id"); ?>
</div>
<?php new FormField(name: "elements[$id][options]", type: "textarea", label: "Options", value: "=?
1=Yes
0=No", rows: 5, hint: "Multiline list of options, may use any of these formats: value OR value=Text"); ?>
<?php
$behaviors = ["validation_required", "validation_function", "hint", "tooltip", "field_class", "field_width", "column_count", "multi_selection", "html_attributes",
"dynamic_options", 
"events_triggers", 
"events_listeners", 
"list_search",
"list_filter",
"field_select.countries", 
"field_select.searchable", 
"field_select.additions", 
"field_select.autocomplete", 
"selected_values"];
$listBehaviors($id, $behaviors);
?>