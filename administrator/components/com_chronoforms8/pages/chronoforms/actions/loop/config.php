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
	<?php new FormField(name: "elements[$id][loopvar]", label: "Loop Variable", hint:"The variable to loop on, usually a var from a Read Data Action
	e.g: {var:read_data_name}
	Each loop item can access {var:loop$id.key} & {var:loop$id.value} to get the item's key and value"); ?>
</div>
<?php
$behaviors = [];
$listBehaviors($id, $behaviors);
?>