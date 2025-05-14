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
	<?php new FormField(name: "elements[$id][pdf_author]", label:"Author", value:"Chronoforms"); ?>
	<?php new FormField(name: "elements[$id][pdf_subject]", label:"Subject", value:"Powered by Chronoforms & TCPDF"); ?>
</div>

<div class="equal fields">
	<?php new FormField(name: "elements[$id][pdf_keywords]", label:"Keywords", value:"Chronoforms, TCPDF Plugin, TCPDF, PDF"); ?>
</div>