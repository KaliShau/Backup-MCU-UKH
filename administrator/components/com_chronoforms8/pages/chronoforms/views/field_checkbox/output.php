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
	$field = $formElementToField($element);
	if(isset($element["ghostvalue"]) && strlen($element["ghostvalue"]) > 0){
		$field["ghostvalue"] = CF8::parse($element["ghostvalue"]);
	}
	new FormField(... $field);
?>