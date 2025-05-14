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
<?php new FormField(name: "elements[$id][data-days]", label: "Days Strings", value:'["S", "M", "T", "W", "T", "F", "S"]'); ?>
<?php new FormField(name: "elements[$id][data-months]", type:"textarea", rows:"3", label: "Months Strings", value:'["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]'); ?>
<?php new FormField(name: "elements[$id][data-units]", label: "Units Strings", value:'{"year":"Year","month":"Month","hour":"Hour","minute":"Minute","second":"Second"}'); ?>