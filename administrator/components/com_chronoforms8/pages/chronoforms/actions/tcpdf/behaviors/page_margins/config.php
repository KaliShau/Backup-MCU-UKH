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
	<?php new FormField(name: "elements[$id][pdf_margin_top]", label:"Top margin", value:"27", hint:"in px units"); ?>
	<?php new FormField(name: "elements[$id][pdf_margin_bottom]", label:"Bottom margin", value:"25", hint:"in px units"); ?>
	<?php new FormField(name: "elements[$id][pdf_margin_right]", label:"Right margin", value:"15", hint:"in px units"); ?>
	<?php new FormField(name: "elements[$id][pdf_margin_left]", label:"Left margin", value:"15", hint:"in px units"); ?>
</div>

<div class="equal fields">
	<?php new FormField(name: "elements[$id][pdf_margin_header]", label:"Header margin", value:"5"); ?>
	<?php new FormField(name: "elements[$id][pdf_margin_footer]", label:"Footer margin", value:"10"); ?>
</div>

<div class="equal fields">
	<?php new FormField(name: "elements[$id][disable_pdf_header]", type:"select", label:"Disable Header", options:[
		new Option(text:"No", value:""),
		new Option(text:"Yes", value:"1"),
	], hint:"Disable PDF pages headers"); ?>
	<?php new FormField(name: "elements[$id][disable_pdf_footer]", type:"select", label:"Disable Footer", options:[
		new Option(text:"No", value:""),
		new Option(text:"Yes", value:"1"),
	], hint:"Disable PDF pages footers"); ?>
</div>