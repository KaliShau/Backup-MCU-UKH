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
?>
<div class="nui segment <?php echo $size; ?> rounded bordered <?php echo $color; ?> flex vertical spaced middle aligned">
    <?php
	if(!empty($element["icon"]["name"])){
		echo Chrono::ShowIcon($element["icon"]["name"]);
	}
	echo $element["text"];
	?>
</div>