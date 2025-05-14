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
	$size = !empty($element["size"]["name"]) ? $element["size"]["name"] : "";
	$color = !empty($element["color"]["name"]) ? "colored ".$element["color"]["name"] : "";
	$href = "";
	$tag = "div";

	if(!empty($element['url'])){
		$params = [];
		if(!empty($element['url_parameters'])){
			$lines = CF8::multiline($element['url_parameters']);
			
			foreach($lines as $line){
				$params[$line->name] = CF8::parse($line->value);
			}
		}

		$url = Chrono::r(Chrono::addUrlParam(CF8::parse($element['url']), $params));
		$href = 'href="'.$url.'"';
		$tag = "a";
	}
?>
<<?php echo $tag; ?> class="nui text <?php echo $size; ?> <?php echo $color; ?> <?php echo !empty($element["class"]) ? $element["class"] : ""; ?>" <?php echo $href; ?>>
    <?php
	if(!empty($element["icon"]["name"])){
		echo Chrono::ShowIcon($element["icon"]["name"]);
	}
	echo CF8::parse($element["text"]);
	?>
</<?php echo $tag; ?>>