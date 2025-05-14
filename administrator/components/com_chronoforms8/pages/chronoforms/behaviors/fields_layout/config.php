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
	<?php new FormField(name: "elements[$id][fields_layout]", type:"select", label: "Layout", options:[
		new Option(value:"vertical", text:"Vertical"),
		new Option(value:"", text:"Horizontal"),
	]); ?>
</div>