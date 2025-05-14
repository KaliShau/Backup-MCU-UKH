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
	$this->data[$element["fieldname"]] = CF8::parse($element["value"]);

	if(!empty($element["conditions"])){
		foreach($element["conditions"] as $condition){
			if(!empty($condition["matches"])){
				switch($condition["case"]){
					case "in":
						if(in_array($this->data[$element["fieldname"]], (array)$condition["matches"])){
							$this->data[$element["fieldname"]] = CF8::parse($condition["value"]);
							break 2;
						}
						break;
					case "not_in":
						if(!in_array($this->data[$element["fieldname"]], (array)$condition["matches"])){
							$this->data[$element["fieldname"]] = CF8::parse($condition["value"]);
							break 2;
						}
						break;
				}
			}
		}
	}