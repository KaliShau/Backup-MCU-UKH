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
<?php new FormField(name: "elements[$id][input_type]", type:"select", label: "Custom Type", options:[
	new Option(value:"", text:"Text"),
	new Option(value:"date", text:"Date"),
	new Option(value:"time", text:"Time"),
	new Option(value:"datetime-local", text:"DateTime Local"),
	new Option(value:"week", text:"Week"),
	new Option(value:"month", text:"Month"),
	new Option(value:"number", text:"Number"),
	new Option(value:"tel", text:"Telephone"),
], hint:"Change the field type to another HTML input type instead of text, you can set a 'pattern' attribute using the HTML attribute behavior"); ?>