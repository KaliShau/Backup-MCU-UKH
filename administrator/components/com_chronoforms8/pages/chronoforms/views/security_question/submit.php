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
$total = ChronoSession::get(CF8::getname($element));

if($this->data(CF8::getname($element)) != $total || empty($this->data(CF8::getname($element)))){
	$this->errors[] = CF8::parse($element["error"]);
	$this->set(CF8::getname($element), false);
	$this->SetData(CF8::getname($element), "");
	return;
}else{
	$this->set(CF8::getname($element), true);
	return;
}