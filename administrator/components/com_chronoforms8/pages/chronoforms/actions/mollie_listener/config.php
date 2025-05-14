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
	<?php new FormField(name: "elements[$id][api_live]", label: "Live API key", hint: "Your Mollie Live API key"); ?>
	<?php new FormField(name: "elements[$id][api_test]", label: "Test API Key", hint: "Your Mollie Test API key"); ?>
</div>
<div class="equal fields">
	<?php new FormField(name: "elements[$id][profile_id]", label: "Profile ID", hint: "Your Mollie Profile ID"); ?>
	<?php new FormField(name: "elements[$id][live]", type:"select", label: "Live/Test", options:[
		new Option(text:"Test", value:"0"),
		new Option(text:"Live", value:"1"),
	]); ?>
</div>

<?php
$behaviors = ["events"];
$listBehaviors($id, $behaviors);
?>