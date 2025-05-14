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
	<?php new FormField(name: "elements[$id][data-startdate]", label: "Start Date", hint: "A DateTime before which no selection will be allowed"); ?>
	<?php new FormField(name: "elements[$id][data-enddate]", label: "End Date", hint: "A DateTime after which no selection will be allowed"); ?>
</div>
<div class="equal fields">
	<?php new FormField(name: "elements[$id][data-startdate-field]", label: "Start Date Field Name", hint: "Another calendar field name to be used as the start date for this calendar"); ?>
	<?php new FormField(name: "elements[$id][data-enddate-field]", label: "End Date Field Name", hint: "Another calendar field name to be used as the end date for this calendar"); ?>
</div>
<div class="equal fields">
	<?php new FormField(name: "elements[$id][data-startdate_difference]", label: "Start Date Difference", value:0, hint: "A fixed number of units to add to the Start Date"); ?>
	<?php new FormField(name: "elements[$id][data-startdate_difference_unit]", type:"select", label: "Start Date Difference Unit", value:"days", options:["86400" => "Days", "3600" => "Hours", "1" => "Seconds"], hint: "In which unit is the start date difference ?"); ?>
</div>