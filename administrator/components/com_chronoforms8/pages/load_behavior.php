<?php
/**
* ChronoForms 8
* Copyright (c) 2023 ChronoEngine.com, All rights reserved.
* Author: (ChronoEngine.com Team)
* license:     GNU General Public License version 2 or later; see LICENSE.txt
* Visit http://www.ChronoEngine.com for regular updates and information.
**/
defined('_JEXEC') or die('Restricted access');

$id = ChronoApp::$instance->data("id");
$behavior = ChronoApp::$instance->data("behavior");

$behavior_path = __DIR__ . '/chronoforms/behaviors/' . $behavior;
if(str_contains($behavior, ".")){
	$name = explode(".", $behavior)[0];
	$behavior_path = __DIR__.'/chronoforms/'.ChronoApp::$instance->data("type").'/'.$name.'/behaviors/'.explode(".", $behavior)[1];
}

if (file_exists($behavior_path . "/info.json")) {
	$info_path = $behavior_path . "/info.json";
	$myfile = fopen($info_path, "r");
	if($myfile === false){
		return;
	}
	$data = fread($myfile, filesize($info_path));
	fclose($myfile);
	$info = json_decode($data);

	$config = "";
	if (file_exists($behavior_path . "/config.php")) {
		ob_start();
		require($behavior_path . "/config.php");
		$config = ob_get_clean();
	}
	
	$config = '<div class="item nui p1 behavior_config" data-type="' . $behavior . '"><div class="title nui flex"><i class="dropdown icon"></i><span class="nui bold">' . $info->text . '</span><span class="nui right">'.$info->description.'</span></div>
	<div class="content nui flex vertical spaced p0">
	' . $config . '</div></div>';
} else {
	$config = '<div class="nui hidden behavior_config" data-type="' . $behavior . '"></div>';
}

echo $config;