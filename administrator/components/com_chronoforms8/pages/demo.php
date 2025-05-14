<?php

/**
 * ChronoForms 8
 * Copyright (c) 2023 ChronoEngine.com, All rights reserved.
 * Author: (ChronoEngine.com Team)
 * license:     GNU General Public License version 2 or later; see LICENSE.txt
 * Visit http://www.ChronoEngine.com for regular updates and information.
 **/
defined('_JEXEC') or die('Restricted access');

$target = __DIR__.'/demos/demos.cf8bak';
$data = file_get_contents($target);
			
$rows = json_decode($data, true);

if(ChronoApp::$instance->DataExists("id") && count((array)ChronoApp::$instance->DataArray()["id"]) > 0){
	foreach($rows as $row){
		if(isset($row['id']) && in_array($row["id"], (array)ChronoApp::$instance->DataArray()["id"])){
			$row['id'] = 0;
			$row['alias'] .= "-".gmdate("Ymd-His");
			$row['title'] .= "-".gmdate("Ymd-His");
			$row['published'] = 0;
			$result = CF8Model::instance()->Insert($row);

			if (!empty($result)) {
				ChronoSession::setFlash("success", Chrono::l("%s Form restored successfully.", $row["title"]));
			}else{
				ChronoSession::setFlash("error",Chrono::l("%s Error restoring form.", $row["title"]));
				break;
			}
		}
	}

	ChronoApp::$instance->redirect(ChronoApp::$instance->extension_url . "&action=index");
}
?>
<form class="nui form" action="<?php echo ChronoApp::$instance->current_url; ?>" method="post" enctype="multipart/form-data" accept-charset="UTF-8">
	<?php
	$buttons = [
		new MenuButton(name: "install", title: "Install Demo Form", icon: "floppy-disk", color: "blue"),
		new MenuButton(name: "close", link: true, title: "Close", icon: "xmark", color: "red", url: "action=index"),
	];
	$title = "Demo Form(s)";
	new MenuBar(title: $title, buttons: $buttons);

	new DataTable($rows, [
		new TableColumn(selector:true, name:"id"),
		new TableColumn(name:"title", title:"Title", expand:true, func:function($row){
			$text = $row["title"];
			if(!empty($row["params"]["info"])){
				$text .= '<br><small>'.nl2br($row["params"]["info"]).'</small>';
			}
			return $text;
		}),
	]);
	?>
</form>