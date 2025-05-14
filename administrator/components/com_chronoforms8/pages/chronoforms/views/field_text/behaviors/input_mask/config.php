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
<?php new FormField(name: "elements[$id][imask_options]", type:"textarea", label: "Mask Options", rows:5, code:"data-codeeditor='1'", value: "mask=+{0}(000)000-00-00\nlazy=false\nplaceholderChar=#", 
hint: "The mask options format in multi line, option=value, check all settings here: <a target='_blank' href='https://imask.js.org/guide.html'>https://imask.js.org/guide.html</a>"); ?>
<?php new FormField(name: "elements[$id][imask_variable]", label: "Mask settings variable name", hint: "a Javascript variable name which contains the IMask settings object"); ?>