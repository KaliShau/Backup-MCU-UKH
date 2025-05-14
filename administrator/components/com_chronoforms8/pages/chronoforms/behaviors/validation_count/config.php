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
    <?php new FormField(name: "elements[$id][validation_count][mincount]", label: "Minimum Selections", value:"", hint:"The lowest number of selections required, keep empty to ignore."); ?>
    <?php new FormField(name: "elements[$id][validation_count][maxcount]", label: "Maximum Selections", value:"", hint:"The highest number of selections allowed, keep empty to ignore."); ?>
</div>
<?php new FormField(name: "elements[$id][validation_count][prompt]", label: "Error Message", value:"The minimum selections should be 1"); ?>