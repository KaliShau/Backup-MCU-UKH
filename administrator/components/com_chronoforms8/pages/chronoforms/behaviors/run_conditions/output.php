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
	if(!empty($element["run_conditions"])){
		$result = false;

		$rule = $element["run_conditions_rule"];
		$k = 0;
		foreach($element["run_conditions"] as $run_condition){
			$value1 = CF8::parse($run_condition["value1"]);
			$value2 = [];
			if(!empty($run_condition["value2"])){
				foreach((array)$run_condition["value2"] as $v2){
					$value2 = array_merge($value2, (array)CF8::parse($v2));
				}
			}

			$current = false;
			switch($run_condition["type"]){
				case "in":
					$current = in_array($value1, $value2);
					break;
				case "not_in":
					$current = !in_array($value1, $value2);
					break;
				case "empty":
					$current = empty($value1);
					break;
				case "not_empty":
					$current = !empty($value1);
					break;
				case "contains":
					foreach($value2 as $v){
						if(str_contains($value1, $v)){
							$current = true;
							break;
						}
					}
					break;
			}

			if($rule == "and"){
				if($k == 0){
					$result = true;
				}
				$result = $result && $current;
			}else{
				$result = $result || $current;
			}

			$k++;
		}

		if(!$result){
			$element["settings"]["disabled"] = 1;
		}
	}