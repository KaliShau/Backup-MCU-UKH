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
<?php new FormField(name: "elements[$id][validation_matches][id]", label: "Other field ID", hint:"The ID of the other field"); ?>
<?php new FormField(name: "elements[$id][validation_matches][prompt]", label: "Error Message", value:"Values do not match"); ?>