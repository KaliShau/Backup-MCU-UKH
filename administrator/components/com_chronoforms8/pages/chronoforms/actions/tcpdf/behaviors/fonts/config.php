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
	<?php new FormField(name: "elements[$id][pdf_body_font]", label:"Body font", value:"courier"); ?>
	<?php new FormField(name: "elements[$id][pdf_body_font_size]", label:"Body font size", value:"14"); ?>
</div>

<div class="equal fields">
	<?php new FormField(name: "elements[$id][pdf_header_font]", label:"Header font", value:"helvetica"); ?>
	<?php new FormField(name: "elements[$id][pdf_header_font_size]", label:"Header font size", value:"10"); ?>
</div>

<div class="equal fields">
	<?php new FormField(name: "elements[$id][pdf_footer_font]", label:"Footer font", value:"helvetica"); ?>
	<?php new FormField(name: "elements[$id][pdf_footer_font_size]", label:"Footer font size", value:"8"); ?>
</div>