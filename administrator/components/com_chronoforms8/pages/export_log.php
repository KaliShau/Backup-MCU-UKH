<?php
/**
* ChronoForms 8
* Copyright (c) 2023 ChronoEngine.com, All rights reserved.
* Author: (ChronoEngine.com Team)
* license:     GNU General Public License version 2 or later; see LICENSE.txt
* Visit http://www.ChronoEngine.com for regular updates and information.
**/
defined('_JEXEC') or die('Restricted access');

$form =  CF8Model::instance()->Select(conditions: [['id', "=", ChronoApp::$instance->data("form_id")]], single: true);
$columns = [];

$data = [];
foreach ($form["elements"] as $element) {
	if ($element["type"] == "views") {
		if (str_starts_with($element["name"], "field_") && $element["name"] != "field_button") {
			if (!empty($element["fieldname"])) {
				if($element["name"] == "field_hidden"){
					$label = $element["fieldname"];
				}else{
					$label = $element["label"];
				}
				$columns[$element["id"]] = $label;
			}
		}
	}
}


$rows =  CF8LogModel::instance()->Select(conditions: [['form_id', "=", ChronoApp::$instance->data("form_id")]], order_by:true, order:"created asc");
// Chrono::pr($rows);

function array_to_csv_download($data, $filename, $headers = array()) {
	ob_end_clean();
	// Start output buffering
	ob_start();
	
	// Set headers for CSV download
	header('Content-Type: text/csv');
	header('Content-Disposition: attachment; filename="' . $filename . '"');

	// Open output stream
	$output = fopen('php://output', 'w');

	// Write custom headers if provided
	if (!empty($headers)) {
		fputcsv($output, $headers);
	}

	// Write data rows
	foreach ($data as $row) {
		$row_data = $row['data'];
		foreach($row_data as $key => $value){
			if(is_array($value)){
				$row_data[$key] = json_encode($value);
			}
		}

		$fixed_data = [];
		foreach($headers as $id => $value){
			if(isset($row_data[$id])){
				$fixed_data[] = $row_data[$id];
			}else{
				$fixed_data[] = "";
			}
		}
		
		fputcsv($output, $fixed_data);
	}

	// Close output stream
	fclose($output);

	// Flush output buffer
	ob_end_flush();
	exit;
}

$headers = $columns;
array_to_csv_download($rows, 'chronoforms8_datalog_'.$form['alias'].'_'.gmdate('Y-m-d-H-i-s').'.csv', $headers);

?>