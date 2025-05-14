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
	$class = !empty($element["class"]["name"]) ? $element["class"]["name"] : "";
?>
<<?php echo $element["tag"]; ?> class="nui header <?php echo $size; ?> <?php echo $color; ?> <?php echo $class; ?> <?php echo $element["position"]; ?>">
    <?php
	if(!empty($element["icon"]["name"])){
		echo Chrono::ShowIcon($element["icon"]["name"]);
	}
	echo CF8::parse($element["text"]);
	?>
</<?php echo $element["tag"]; ?>>