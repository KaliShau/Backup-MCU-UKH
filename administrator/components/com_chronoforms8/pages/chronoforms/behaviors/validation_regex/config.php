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
<?php new FormField(name: "elements[$id][validation_regex][regex]", label: "Regular Expression", hint:"The regular expression used to validate the field value.
example: /^[A-Za-z]+$/ for alphabetic characters only"); ?>
<?php new FormField(name: "elements[$id][validation_regex][prompt]", label: "Error Message", value:"This value is not valid."); ?>