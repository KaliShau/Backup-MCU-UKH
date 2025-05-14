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
	<?php new FormField(name: "elements[$id][external_database][driver]", label: "Driver", value:"mysqli"); ?>
	<?php new FormField(name: "elements[$id][external_database][host]", label: "Host", value:"localhost"); ?>
</div>
<div class="equal fields">
	<?php new FormField(name: "elements[$id][external_database][user]", label: "User", value:""); ?>
	<?php new FormField(name: "elements[$id][external_database][password]", type:"password", label: "Password", value:""); ?>
</div>
<div class="equal fields">
	<?php new FormField(name: "elements[$id][external_database][database]", label: "Database", value:""); ?>
	<?php new FormField(name: "elements[$id][external_database][prefix]", label: "Prefix", value:""); ?>
</div>