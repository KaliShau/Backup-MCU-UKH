<?php
/**
* ChronoForms 8
* Copyright (c) 2023 ChronoEngine.com, All rights reserved.
* Author: (ChronoEngine.com Team)
* license:     GNU General Public License version 2 or later; see LICENSE.txt
* Visit http://www.ChronoEngine.com for regular updates and information.
**/
defined('_JEXEC') or die('Restricted access');


$data = CF8::parse($element["datasource"]);
if(!is_array($data)){
	$data = [];
}

$columns = [];

if(!empty($action['columns'])){
	$lines = CF8::multiline($action['columns']);
	
	foreach($lines as $line){
		$columns[$line->name] = CF8::parse($line->value);
	}
}else{
	if(isset($data[0])){
		foreach ($data[0] as $k => $v) {
			$columns[$k] = $k;
		}
	}else{
		foreach ($data as $k => $v) {
			$columns[$k] = $k;
		}
	}
}

function array_to_csv($data, $settings, $filename, $headers = array(), $save = true, $download = false, ) {
	// Start output buffering
	ob_start();

	// Open output stream
	$output = fopen('php://output', 'w');

	// Write custom headers if provided
	if (!empty($headers)) {
		fputcsv($output, $headers, $settings->delimiter, $settings->enclosure, $settings->escape_char);
	}

	// Write data rows
	foreach ($data as $row) {
		$row_data = [];
		foreach($row as $k => $v){
			foreach($headers as $name => $title){
				$row_data[$name] = $row[$name];
			}
		}
		fputcsv($output, $row_data, $settings->delimiter, $settings->enclosure, $settings->escape_char);
	}

	$content = ob_get_clean();  // Get and clean the buffer content

	// Close output stream
	fclose($output);

	if ($save){
		file_put_contents($filename, $content);
	}

	if($download){
		// Set headers for CSV download
		header('Content-Type: text/csv');
		header('Content-Disposition: attachment; filename="' . basename($filename) . '"');

		while (ob_get_level() > 0) {
			ob_end_clean();  // Discards the current buffer and continues to the next one
		}
		echo $content;
		exit;
	}
}

$settings = new stdClass();

$settings->delimiter = ',';
if(!empty($element["delimiter"])){
	$settings->delimiter = $element["delimiter"];
}

$settings->enclosure = '"';
if(!empty($element["enclosure"])){
	$settings->enclosure = $element["enclosure"];
}

$settings->escape_char = '\\';
if(!empty($element["escape_char"])){
	$settings->escape_char = $element["escape_char"];
}

array_to_csv($data, $settings, CF8::parse($element["path"]), $columns, $save = ($element["action"] == "F" || $element["action"] == "FD"), $download = ($element["action"] == "D" || $element["action"] == "FD"));

$this->set(CF8::getname($element), CF8::parse($element["path"]));
$this->debug[CF8::getname($element)]['path'] = CF8::parse($element["path"]);