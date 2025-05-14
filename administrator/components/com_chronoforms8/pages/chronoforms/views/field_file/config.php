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
	<?php new FormField(name: "elements[$id][label]", label: "Label", value: "File $id"); ?>
	<?php new FormField(name: "elements[$id][fieldname]", label: "Field Name", value: "file_$id"); ?>
</div>
<div class="equal fields">
	<?php new FormField(name: "elements[$id][max_size]", label: "Max size", hint:"Maximum allowed file size in KB", value: "1000"); ?>
	<?php new FormField(name: "elements[$id][extensions][]", type:"select", label: "Allowed Extensions", hint:"Permitted file extensions", options:["png","jpg","pdf","zip"], multiple:true, code:"data-additions='1' data-separators=','"); ?>
</div>
<?php
$behaviors = ["validation_required", "validation_function", "multi_selection", "hint", "tooltip", "field_class", "field_width", "placeholder", "events_triggers", "events_listeners", 
"field_file.filename_provider", "field_file.attach", "field_file.upload_dir", "field_file.overwrite", "html_attributes"];
$listBehaviors($id, $behaviors, ["field_file.attach"]);
?>