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
<div class="nui labeled divider <?php if(!empty($element["hidden"])): ?>hidden<?php endif; ?> <?php if(!empty($element["block"])): ?>block<?php endif; ?> <?php if(!empty($element["size"]["name"])){echo $element["size"]["name"];}; ?>">
	<?php
	if(!empty($element["text"])){
		echo "<div class='label'>".CF8::parse($element["text"])."</div>";
	}
	?>
</div>