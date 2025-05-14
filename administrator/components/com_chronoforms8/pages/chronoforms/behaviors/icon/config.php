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
<div class="equal fields">
	<?php new FormField(name: "elements[$id][icon][name]", label: "Icon name", hint:"The icon name in font awesome"); ?>
	<?php new FormField(name: "elements[$id][icon][position]", type:"select", label: "Icon side", options:[
		new Option(value:"", text:"Left"),
		new Option(value:"right", text:"Right"),
	], hint:"The icon side in the element"); ?>
</div>