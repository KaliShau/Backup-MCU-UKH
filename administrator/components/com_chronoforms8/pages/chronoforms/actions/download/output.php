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
if(!empty($action['path'])){
	$path = CF8::parse($action['path']);

	if(file_exists($path) AND is_file($path)){
		$ext = pathinfo($path, PATHINFO_EXTENSION);
		
		$inline_extensions = [];
		
		if(!empty($action['inline_extensions'])){
			$inline_extensions = $action['inline_extensions'];
		}
		
		$view = 'D';
		
		if(in_array(strtolower($ext), $inline_extensions)){
			$view = 'I';
		}
		
		// Set headers for CSV download
		header('Content-Type: application/octet-stream'); // Ensures correct download behavior
		header('Content-Disposition: attachment; filename="' . (!empty($element["download_name"]) ? $element["download_name"] : basename($path)) . '"');
		header('Content-Length: ' . filesize($path)); // Specify file size for better browser handling
		header('Cache-Control: no-cache, no-store, must-revalidate');
		header('Pragma: no-cache');
		header('Expires: 0');

		// Clear output buffering before sending the file
		while (ob_get_level() > 0) {
			ob_end_clean();
		}

		// Read and output the file in chunks (better for large files)
		readfile($path);
		exit;
	}else{
		$this->debug[CF8::getname($element)]['error'] = Chrono::l('File does not exist.');
		$this->set(CF8::getname($element), false);
	}
}else{
	$this->debug[CF8::getname($element)]['error'] = Chrono::l('No File path is provided.');
	$this->set(CF8::getname($element), false);
}