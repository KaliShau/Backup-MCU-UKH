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
if(!empty($action["variables"])){
	foreach($action["variables"] as $variable){
		if(!empty($variable["name"]) && strlen($variable["value"]) > 0){
			switch($variable["type"]){
				case "data":
					$this->data[$variable["name"]] = CF8::parse($variable["value"]);
					break;
				case "var":
					$this->set($variable["name"], CF8::parse($variable["value"]));
					break;
				case "session":
					ChronoSession::set($variable["name"], CF8::parse($variable["value"]));
					break;
			}
		}
	}
}