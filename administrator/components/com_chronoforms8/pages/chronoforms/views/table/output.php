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

$limit = 0;
if(!empty($element["limit"])){
	$limit = CF8::parse($element["limit"]);
}

$count = 0;
$rows = [];
if(!empty($element["dbtable"])){
	$model = new ChronoModel();
	$model->Table = $element["dbtable"];


	$where = "";
	if(!empty($element["where"])){
		$where = CF8::parse($element["where"]);
	}
	
	$rows = $model->Select(where:$where, paging:true, limit:$limit, order_by:true);
	$count = $model->Select(where:$where, count:true);
}else if(!empty($element["data_source"])){
	$rows = CF8::parse($element["data_source"]);
	$count = !empty($element["count_source"]) ? CF8::parse($element["count_source"]) : 20;
	if(is_string($rows) && isset($elements_by_name[$element["data_source"]])){
		$read_data = $element["data_source"];
		
		$rows = $this->get($read_data);
		$count = $this->get($read_data."_count");
		$limit = !empty($elements_by_name[$read_data]["limit"]) ? CF8::parse($elements_by_name[$read_data]["limit"]) : 1000;
		$element["sortable"] = isset($elements_by_name[$read_data]["sortable"]) ? $elements_by_name[$read_data]["sortable"] : [];
	}
}

if(empty($element["columns"]) && !empty($element["events"])){
	$element["columns"] = [];
	foreach($element["events"] as $event){
		if(isset($event["name"])){
			$element["columns"][] = [
				"event" => $event["name"],
				"path" => $event["name"],
				"header" => $event["title"],
				"class" => $event["class"],
			];
		}else{
			$pcs = explode("=", $event);
			$element["columns"][] = [
				"event" => $event,
				"path" => $pcs[0],
				"header" => count($pcs) > 1 ? $pcs[1] : "",
				"class" => count($pcs) > 2 ? $pcs[2] : "",
			];
		}
	}
}

if(is_array($rows) && !empty($element["columns"])){
	$columns = [];
	if(empty($count) && !empty($limit)){
		$count = count($rows);
	}
	foreach($element["columns"] as $column){
		$expand = isset($element["expand"]) && ($element["expand"] == $column["path"]);
		$sort = in_array($column["path"], isset($element["sortable"]) ? $element["sortable"] : []);
		
		$func = function($row) use ($column, $element, $DisplayElements, $elements_by_parent){
			if(isset($element["output"])){
				foreach($element["output"] as $output){
					if($output["path"] == $column["path"]){
						ob_start();
						eval("?>".$output["html"]);
						$code = ob_get_clean();
						return CF8::parse($code, ["row" => $row]);
					}
				}
			}

			if(!empty($element["events"])){
				ob_start();

				$this->set("row", $row);
				$DisplayElements($elements_by_parent, $element["id"], $column["event"]);
				$result = ob_get_clean();
				if(!empty($result)){
					return $result;
				}
			}
			
			return Chrono::getVal($row, $column["path"], "");
		};
		$columns[] = new TableColumn(name:$column["path"], title:$column["header"], expand:$expand, sortable:$sort, func:$func, class:!empty($column["class"]) ? $column["class"] : "");
	}

	new DataTable($rows, $columns, count:$count, limit:$limit);
}