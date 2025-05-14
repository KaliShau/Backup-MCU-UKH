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
	$fname = CF8::cleanfieldname($element["fieldname"]);	
	if(isset($this->data[$fname]) && !empty($completed_elements[$element["id"]]["noptions"])){
		$noptions = $completed_elements[$element["id"]]["noptions"];

		$selections = [];
		if(is_array($this->data[$fname])){
			foreach($this->data[$fname] as $k => $v){
				$selections[] = $noptions[$v];
			}
		}else{
			$selections = isset($noptions[$this->data[$fname]]) ? $noptions[$this->data[$fname]] : $this->data[$fname];
		}

		$this->set($fname, ["selection" => $selections]);
	}