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
	if(!empty($element["list_search"]["read_data"]) && !empty($element["list_search"]["columns"])){
		$this->vars2[$element["list_search"]["read_data"]]["search"][CF8::getname($element)] = [
			"data" => $this->data($element["fieldname"]),
			"columns" => $element["list_search"]["columns"],
		];
	}