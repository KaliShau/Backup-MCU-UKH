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
	if(isset($this->data[$element["fieldname"]]) && !empty($completed_elements[$element["id"]]["noptions"])){
		$noptions = $completed_elements[$element["id"]]["noptions"];

		$selections = [];
		if(is_array($this->data[$element["fieldname"]])){
			foreach($this->data[$element["fieldname"]] as $k => $v){
				$selections[] = $noptions[$v];
			}
		}else{
			$selections = $noptions[$this->data[$element["fieldname"]]];
		}

		$this->set($element["fieldname"], ["selection" => $selections]);
	}