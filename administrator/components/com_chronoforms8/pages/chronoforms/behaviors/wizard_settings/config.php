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
	<?php new FormField(name: "elements[$id][settings][disabled]", type:"select", label: "Disabled", options:[
		new Option(text:"No", value:""),
		new Option(text:"Yes", value:"1"),
	], hint:"Disable this Element so that it will not run"); ?>
	<?php new FormField(name: "elements[$id][settings][name]", label: "Name", value:"", hint:"The element name to use in shortcodes"); ?>
</div>
<div class="equal fields">
	<?php new FormField(name: "elements[$id][settings][designer_label]", label: "Designer Label", hint:"Special label for this element in the designer"); ?>
	<?php new FormField(name: "elements[$id][settings][designer_label_color]", type:"select", label: "Label color", options:'=Default
slate
grey
red
orange
amber
yellow
lime
green
emerald
teal
cyan
sky
blue
indigo
violet
purple
fuchsia
pink
rose', hint:"Choose a color for the designer label"); ?>
</div>