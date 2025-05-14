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
<?php
if(!empty($action['url'])){
	$url = CF8::parse($action['url']);

	// $attach = "?";
	// if(str_contains($url, "?")){
	// 	$attach = "&";
	// }
	if(!empty($action['parameters'])){
		// $url .= $attach;
		$lines = CF8::multiline($action['parameters']);
		
		foreach($lines as $line){
			$params[$line->name] = CF8::parse($line->value);
		}

		$url = Chrono::r(Chrono::addUrlParam($url, $params));
	}

	if(!empty($action["clear_session"])){
		ChronoSession::clear("chronoforms8_pages_" . $row["id"]);
		ChronoSession::clear("chronoforms8_data_" . $row["id"]);
		ChronoSession::clear("chronoforms8_vars_" . $row["id"]);
		ChronoSession::clear("chronoforms8_elements_" . $row["id"]);
		ChronoSession::clear("sectoken". $row["id"]);
	}

	if(!empty($action["delay"])){
		Chrono::addHeaderTag('<meta http-equiv="refresh" content="'.CF8::parse($action["delay"]).';url='.Chrono::r($url).'" />');
	}else{
		$this->redirect($url);
	}

	
}else{
	$this->debug[CF8::getname($element)][] = Chrono::l('No redirect URL is provided.');
}