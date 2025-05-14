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
	if(!empty($element["behaviors"]) && in_array("javascript.domready", (array)$element["behaviors"])){
		$element["code"] = 'document.addEventListener("DOMContentLoaded", function(event) {
		'.$element["code"].'
		})';
	}

	if(!empty($element["code"])){
		Chrono::addHeaderTag('<script type="text/javascript">'.$element["code"].'</script>');
	}

	if(!empty($element["files"])){
		foreach($element["files"] as $k => $file){
			Chrono::addHeaderTag('<script src="'.$file["path"].'"></script>');
		}
	}
?>