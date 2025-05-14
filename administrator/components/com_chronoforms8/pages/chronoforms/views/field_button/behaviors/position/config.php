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
<?php new FormField(name: "elements[$id][position]", type:"select", label: "Position", options:[
	new Option(value:"self-start", text:"Start Aligned"),
	new Option(value:"self-end", text:"End Aligned"),
	new Option(value:"self-center", text:"Center Aligned"),
	new Option(value:"full width", text:"Full Width"),
], hint:"Choose the button position on the form"); ?>