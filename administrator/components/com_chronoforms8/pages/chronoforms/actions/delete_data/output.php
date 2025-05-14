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
if(!empty($action["dbtable"])){
	$model = new ChronoModel();
	$model->Table = $action["dbtable"];

	if(!empty($action["external_database"]["database"])){
		$option = $action["external_database"];
		foreach($option as $k => $op){
			$option[$k] = CF8::parse($op);
		}
		$model->DBO = (new Joomla\Database\DatabaseFactory)->getDriver('mysqli', $option);
	}

	if(empty($action["where"])){
		$result = $model->Delete([]);
	}else{
		$result = $model->Delete([], where:CF8::parse($action["where"]));
	}
	
	if($result !== false){
		$DisplayElements($elements_by_parent, $element["id"], "deleted");
		if(!empty($result)){
			$DisplayElements($elements_by_parent, $element["id"], "delete_matched");
		}else{
			$DisplayElements($elements_by_parent, $element["id"], "delete_not_matched");
		}
	}else{
		$DisplayElements($elements_by_parent, $element["id"], "not_deleted");
	}

	$this->set(CF8::getname($element), $result);

	$this->debug[CF8::getname($element)]['sql'] = $model->SQL;
	$this->debug[CF8::getname($element)]['returned'] = $result;
}