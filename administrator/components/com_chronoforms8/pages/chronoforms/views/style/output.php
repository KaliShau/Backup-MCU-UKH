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
	$breakpoints = [
		"all" => "",
		"desktop" => "1200px",
		"laptop" => "992px",
		"tablet" => "768px",
		"phone" => "600px",
	];
	if(!empty($element["style"]["css"])){
		foreach($breakpoints as $screen => $width){
			if(!empty($element["style"]["css"][$screen]["output"])){
				$class = $element["selector"]."{".$element["style"]["css"][$screen]["output"].'}';

				if(!empty($width)){
					$rule = "max-width";
					$class = '@media only screen and ('.$rule.': '.$width.') {'.$class.'}';
				}

				Chrono::addHeaderTag('<style type="text/css">'.$class.'</style>');
			}
		}
	}
?>