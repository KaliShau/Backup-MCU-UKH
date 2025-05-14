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
<?php new FormField(name: "elements[$id][countries][iso_value]", type:"select", label: "ISO value", options:[
	new Option(value:"0", text:"No"),
	new Option(value:"1", text:"Yes"),
], hint:"Use 2 letter ISO code for Option Value"); ?>