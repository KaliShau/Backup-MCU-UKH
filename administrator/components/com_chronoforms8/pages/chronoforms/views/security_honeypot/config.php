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
<?php new FormField(name: "elements[$id][pot_name]", label: "Field name", value:"email_address_".$id); ?>
<?php new FormField(name: "elements[$id][error]", label: "Error Message", value:"The spam bot check has failed."); ?>
<?php new FormField(name: "elements[$id][min-time]", label: "Minimum time to submit", value:"", hint:"If provided then submissions in less time (in seconds) will be rejected."); ?>