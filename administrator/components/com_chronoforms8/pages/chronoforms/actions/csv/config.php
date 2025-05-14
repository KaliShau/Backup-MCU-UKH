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
	<?php new FormField(name: "elements[$id][datasource]", label: "Data Source", hint: "The data source to use, usually coming from a Read Data action", value:""); ?>
	<?php new FormField(name: "elements[$id][action]", type:"select", label: "Action", options:[
		new Option(text:"Download", value:"D"),
		new Option(text:"Store", value:"F"),
		new Option(text:"Store and download", value:"FD"),
	], hint:'How the resulting file should be processed ?'); ?>
</div>
<div class="equal fields">
	<?php new FormField(name: "elements[$id][path]", label: "Storage Path", value:"{path:front}/files/export.csv", hint:"Absolute path to the directory where you want the file to be saved."); ?>
</div>
<?php
$behaviors = ["csv.columns", "csv.format"];
$listBehaviors($id, $behaviors);
?>