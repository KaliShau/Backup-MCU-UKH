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
$returned = CF8::parse($element["value"]);
	
$this->debug[CF8::getname($element)]['returned'] = $returned;

$this->set(CF8::getname($element), $returned);

if(!empty($action["events"]) && in_array($returned, (array)$action["events"])){
	$DisplayElements($elements_by_parent, $element["id"], $returned);
}