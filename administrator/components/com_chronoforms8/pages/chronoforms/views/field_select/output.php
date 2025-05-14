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
	$field = new FormField(... $formElementToField($element));

	if(!empty($field->options)){
		$element["noptions"] = [];
		foreach($field->options as $k => $option){
			$element["noptions"][$option->value] = $option->text;
		}
	}
?>