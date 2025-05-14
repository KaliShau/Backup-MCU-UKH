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
	<?php new FormField(name: "elements[$id][debug]", type:"select", label: "Debug", options:[
		new Option(text:"Disabled", value:"0"),
		new Option(text:"Enabled", value:"1"),
	]); ?>
</div>


<div class="nui divider large bold">Order information</div>
<div class="equal fields">
	<?php new FormField(name: "elements[$id][payment][amount][currency]", label: "Currency", value:"EUR"); ?>
	<?php new FormField(name: "elements[$id][payment][amount][value]", label: "Value"); ?>
	<?php new FormField(name: "elements[$id][payment][metadata][order_id]", label: "Order id"); ?>
</div>
<div class="equal fields">
	<?php new FormField(name: "elements[$id][payment][redirectUrl]", label: "Return URL", hint: "A url on your website to return the user to after the purchase"); ?>
	<?php new FormField(name: "elements[$id][payment][webhookUrl]", label: "WebHook URL", hint: "A url on your website to have the Mollie listener action, usually a different form page"); ?>
</div>
<?php new FormField(name: "elements[$id][payment][description]", label: "Description", hint:'Your payment description'); ?>

<?php
$behaviors = ["mollie_redirect.parameters"];
$listBehaviors($id, $behaviors);
?>