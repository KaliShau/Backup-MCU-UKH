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
<?php new FormField(name: "elements[$id][url]", label: "URL", hint: "The url to which the user will be redirected."); ?>
<div class="equal fields">
	<?php new FormField(name: "elements[$id][clear_session]", type:"select", label: "Clear Session", hint:"Clear form session data before redirecting ?", options:[
		new Option(value:"", text:"No"),
		new Option(value:1, text:"Yes"),

	]); ?>
</div>
<?php
$behaviors = ["redirect.delay", "redirect.parameters"];
$listBehaviors($id, $behaviors);
?>