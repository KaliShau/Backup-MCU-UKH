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

	if(!empty($action["json_fields"])){
		$model->JSON = $action["json_fields"];
	}

	$order = "";
	if(!empty($action["order"])){
		$order = $action["order"];
		$order = implode(", ", $order);
	}

	$group_by = "";
	if(!empty($action["group_by"])){
		$group_by = $action["group_by"];
		$group_by = implode(", ", $group_by);
	}

	$sql = "";
	if(!empty($action["sql"])){
		$sql = CF8::parse($action["sql"], quote:true);
	}

	$where = "";
	if(!empty($action["where"])){
		$where = CF8::parse($action["where"], quote:true);
	}
	if(!empty($this->vars2[CF8::getname($element)]["search"])){
		foreach($this->vars2[CF8::getname($element)]["search"] as $field => $search_settings){
			if(isset($search_settings["data"]) && (!empty($search_settings["data"]) || (is_string($search_settings["data"]) && strlen($search_settings["data"]))) > 0){
				if(!empty($where)){
					$where .= " AND ";
				}
				$terms = [];
				$value = $model->quote("%".$search_settings["data"]."%");
				foreach($search_settings["columns"] as $col){
					$terms[] = $col." LIKE ".$value;
				}
				$where .= "(".implode(" OR ", $terms).")";
			}
		}

		if(!empty($_POST)){
			$this->data["start_at"] = 0;
		}
	}

	if(!empty($this->vars2[CF8::getname($element)]["filter"])){
		foreach($this->vars2[CF8::getname($element)]["filter"] as $field => $search_settings){
			if(isset($search_settings["data"]) && (!empty($search_settings["data"]) || (is_string($search_settings["data"]) && strlen($search_settings["data"]))) > 0){
				if(!empty($where)){
					$where .= " AND ";
				}
				$terms = [];
				$value = $model->quote($search_settings["data"]);
				foreach($search_settings["columns"] as $col){
					$terms[] = $col." = ".$value;
				}
				$where .= "(".implode(" OR ", $terms).")";
			}
		}

		if(!empty($_POST)){
			$this->data["start_at"] = 0;
		}
	}

	$limit = 0;
	if(!empty($element["limit"])){
		$limit = CF8::parse($element["limit"]);
	}

	$paging = false;
	if(!empty($element["behaviors"]) && in_array("read_data.paging", $element["behaviors"])){
		$paging = true;
	}

	$sortable = false;
	if(!empty($element["behaviors"]) && in_array("read_data.sortable", $element["behaviors"])){
		$sortable = true;
	}

	$alias = "";
	if(!empty($action["alias"])){
		$alias = $action["alias"];
	}

	$joins = [];
	if(!empty($action["joins"])){
		$joins = $action["joins"];
	}

	$single = false;
	$count = false;
	if($action["read_type"] == "single"){
		$single = true;
	}
	if($action["read_type"] == "count"){
		$count = true;
	}

	$fields = "*";
	if(!empty($action["fields"])){
		$fields = [];
		$lines = CF8::multiline($action['fields']);
		foreach($lines as $line){
			$fields[$line->name] = $line->name;
			if(!empty($line->value)){
				$fields[$line->name] = CF8::parse($line->value);
			}
		}
	}
	
	$result = $model->Select(count:$count, single:$single, where:$where, fields:$fields, limit:$limit, paging:$paging, sql:$sql, order_by:$sortable, order:$order, group_by:$group_by, joins:$joins, alias:$alias);

	$this->set(CF8::getname($element), $result);

	if($action["read_type"] != "count"){
		if(!empty($result)){
			$DisplayElements($elements_by_parent, $element["id"], "found");
		}else{
			$DisplayElements($elements_by_parent, $element["id"], "not_found");
		}
	}

	$this->debug[CF8::getname($element)]['sql'] = $model->SQL;
	$this->debug[CF8::getname($element)]['returned'] = $result;

	if(!is_null($result) && $action["read_type"] == "single" && isset($action["behaviors"]) && in_array("read_data.merge_data", $action["behaviors"])){
		if(!empty($result)){
			foreach($result as $k => $v){
				if(!isset($_POST[$k])){
					$this->data[$k] = $v;
				}
			}
		}
		// $this->MergeData($result); // merge overwrites new entered data with row data if page is reloaded
	}

	if($action["read_type"] == "all_with_count"){
		$result = $model->Select(count:true, single:$single, where:$where, fields:$fields, limit:0, paging:false, sql:$sql, group_by:$group_by, order_by:$sortable, joins:$joins, alias:$alias);

		$this->set(CF8::getname($element)."_count", $result);

		$this->debug[CF8::getname($element)."_count"]['sql'] = $model->SQL;
		$this->debug[CF8::getname($element)."_count"]['returned'] = $result;
	}
}