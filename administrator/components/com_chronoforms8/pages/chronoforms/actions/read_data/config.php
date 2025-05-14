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
	<?php new FormField(name: "elements[$id][dbtable]", type:"select", label: "Table name", code:"data-searchable='1' data-additions='1'", hint: "The database table to read the data from.", options:['' => ""] + CF8Model::instance()->Tables()); ?>
	<?php new FormField(name: "elements[$id][read_type]", type:"select", label: "Read Type", options:[
		new Option(value:"single", text:"First matching record"),
		new Option(value:"all", text:"All matching records"),
		new Option(value:"count", text:"Count of matching records"),
		new Option(value:"all_with_count", text:"All matching records with count"),
	]); ?>
</div>
<?php
$behaviors = ["where_statement", "events",
"read_data.merge_data", 
"read_data.fields", 
"read_data.json_fields", 
"read_data.order", 
"read_data.group_by",
"read_data.joins", 
"read_data.limit", 
"read_data.paging", 
"read_data.sortable", 
"read_data.sql", 
"external_database"];
$listBehaviors($id, $behaviors);
?>