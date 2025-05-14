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
    <?php new FormField(name: "elements[$id][next_page]", label: "Next Page Alias or ID", hint:"Enter the alias of the next page to be processed, You can set a page alias under the page options tab"); ?>
    <?php
        // new FormField(name: "elements[$id][ending_page]", label: "Ending page", type: "select", hint:"should this be an ending page ? if yes then log record will be saved and session data will be cleared", options: [
        //     new Option(text: "No", value: "0"),
		// 	new Option(text: "Yes", value: "1"),
		// ]);
    ?>
</div>
<?php
$behaviors = [];
$listBehaviors($id, $behaviors);
?>