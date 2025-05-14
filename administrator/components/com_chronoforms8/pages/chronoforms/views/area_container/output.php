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
	$style = [];
	if(!empty($element["class"])){
		$element["class"] = (array)$element["class"];
	}else{
		$element["class"] = [];
	}
	
	if(!empty($element["grid"])){
		$style[] = "display:grid";
		$element["class"][] = "nui grid";
	}
	if(!empty($element["grid"]["columns"])){
		if(is_array($element["grid"]["columns"])){
			$element["grid"]["columns"] = implode(" ", $element["grid"]["columns"]);
		}
		$style[] = "grid-template-columns:".$element["grid"]["columns"];
	}
	if(!empty($element["grid"]["rows"])){
		if(is_array($element["grid"]["rows"])){
			$element["grid"]["rows"] = implode(" ", $element["grid"]["rows"]);
		}
		$style[] = "grid-template-rows:".$element["grid"]["rows"];
	}
	if(!empty($element["grid"]["gap"])){
		$style[] = "column-gap:".$element["grid"]["gap"]["columns"];
		$style[] = "row-gap:".$element["grid"]["gap"]["rows"];
	}
?>
<div class="<?php echo implode(" ", $element["class"]); ?> <?php echo $element["name"].$element["id"]; ?>" style="<?php echo implode(";", $style); ?>">
	<?php $DisplayElements($elements_by_parent, $element["id"], "views"); ?>
	<?php
		if(!empty($element["events"])){
			foreach((array)$element["events"] as $subitem){
				echo '<div class="subitem-'.$subitem.'">';
				$DisplayElements($elements_by_parent, $element["id"], $subitem);
				echo "</div>";
			}
		}
	?>
</div>