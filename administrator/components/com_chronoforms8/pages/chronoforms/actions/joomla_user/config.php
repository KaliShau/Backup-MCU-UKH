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
	<?php new FormField(name: "elements[$id][name_provider]", label: "Account Name", hint:"The account name provider, can use a shortcode"); ?>
	<?php new FormField(name: "elements[$id][username_provider]", label: "Account Username", hint:"The account username provider, can use a shortcode"); ?>
</div>
<div class="equal fields">
	<?php new FormField(name: "elements[$id][password_provider]", label: "Account Password", hint:"The account password provider, can use a shortcode"); ?>
	<?php new FormField(name: "elements[$id][email_provider]", label: "Account Email", hint:"The account email provider, can use a shortcode"); ?>
</div>
<div class="equal fields">
	<?php new FormField(name: "elements[$id][status]", type:"select", label: "Account Status", options:[
		new Option(value:0, text:"Activated & Enabled"),
		new Option(value:1, text:"Activated & Blocked"),
		new Option(value:2, text:"Inactivated & Blocked"),

	]); ?>
</div>
<?php
	$model = new ChronoModel();
	$model->Table = "#__usergroups";
	$model->PKey = "id";
	$rows = $model->Select();
	$groups = [];
	foreach($rows as $row){
		$groups[] = new Option(value:$row["id"], text:$row["title"]);
	}
	new FormField(name: "elements[$id][groups_provider][]", type:"select", label: "Account Groups", multiple:true, options:$groups);
?>
<?php
$behaviors = ["events", "where_statement","data_override","joomla_user.custom_fields"];
$listBehaviors($id, $behaviors);
?>