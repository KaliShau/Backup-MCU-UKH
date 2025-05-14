<?php

/**
 * ChronoForms 8
 * Copyright (c) 2023 ChronoEngine.com, All rights reserved.
 * Author: (ChronoEngine.com Team)
 * license:     GNU General Public License version 2 or later; see LICENSE.txt
 * Visit http://www.ChronoEngine.com for regular updates and information.
 **/
defined('_JEXEC') or die('Restricted access');

if(!ChronoApp::$instance->DataExists("id")){
	ChronoSession::setFlash("error", "No forms selected.");
	ChronoApp::$instance->Redirect(ChronoApp::$instance->extension_url."&action=index");
}

$rows =  CF8Model::instance()->Select(conditions:[['id', "IN", (array)ChronoApp::$instance->DataArray()["id"]]]);
$output = json_encode($rows);
	
$name = 'chronoforms8_'.$this->domain;
if(count($rows) == 1){
	$name = $rows[0]['title'];
}

//download the file
if(preg_match('Opera(/| )([0-9].[0-9]{1,2})', $_SERVER['HTTP_USER_AGENT'])){
	$UserBrowser = 'Opera';
}elseif(preg_match('MSIE ([0-9].[0-9]{1,2})', $_SERVER['HTTP_USER_AGENT'])){
	$UserBrowser = 'IE';
}else{
	$UserBrowser = '';
}
$mime_type = ($UserBrowser == 'IE' || $UserBrowser == 'Opera') ? 'application/octetstream' : 'application/octet-stream';
@ob_end_clean();
ob_start();

header('Content-Type: ' . $mime_type);
header('Expires: ' . gmdate('D, d M Y H:i:s') . ' GMT');

if ($UserBrowser == 'IE') {
	header('Content-Disposition: inline; filename="' . $name.'_'.date('d_M_Y_H:i:s').'.cf8bak"');
	header('Cache-Control: must-revalidate, post-check=0, pre-check=0');
	header('Pragma: public');
}
else {
	header('Content-Disposition: attachment; filename="' . $name.'_'.date('d_M_Y_H:i:s').'.cf8bak"');
	header('Pragma: no-cache');
}
print $output;
exit();