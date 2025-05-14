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
	<?php new FormField(name: "elements[$id][count]", label: "List Count", hint:"Set the count of records, usually provided by a Read Data Count action"); ?>
	<?php new FormField(name: "elements[$id][limit]", label: "List Limit", hint:"The number of records per page as you set it in the Read Data action"); ?>
</div>