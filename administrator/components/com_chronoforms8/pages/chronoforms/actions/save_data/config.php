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
	<?php new FormField(name: "elements[$id][dbtable]", type:"select", label: "Table name", code:"data-searchable='1' data-additions='1'", hint: "The database table to save the data to.", options:['' => ""] + CF8Model::instance()->Tables()); ?>
	<?php new FormField(name: "elements[$id][datasource]", label: "Data Source", hint: "The data source to use, all data keys should match table columns.
	Set the table fields using the Table Fields behavior below, otherwise a SHOW COLUMNS query will be used to get a list of table fields", value:""); ?>
</div>
<?php
$behaviors = ["events", "save_data.where_conditions", "save_data.pkey", "save_data.allowed_fields", "save_data.json_fields", "save_data.duplicates", "data_override", "where_statement", "external_database"];
$listBehaviors($id, $behaviors);
?>