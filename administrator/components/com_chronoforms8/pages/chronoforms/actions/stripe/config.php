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
    <?php new FormField(name: "elements[$id][secret_key]", type:"text", label: "Secret Key", hint:"Your Stripe secret key."); ?>
    <?php new FormField(name: "elements[$id][publishable_key]", type:"text", label: "Publishable Key", hint:"Your Stripe Publishable Key."); ?>
</div>

<div class="equal fields">
    <?php new FormField(name: "elements[$id][successUrl]", type:"text", label: "Success URL", hint:"A url on your website to return the user to after the purchase is complete"); ?>
    <?php new FormField(name: "elements[$id][cancelUrl]", type:"text", label: "Cancel URL", hint:"A url on your website to return the user to after the purchase is cancelled"); ?>
</div>

<div class="equal fields">
    <?php new FormField(name: "elements[$id][currency]", type:"text", value:"USD", label: "Currency", hint:"The checkout currency"); ?>
    <?php new FormField(name: "elements[$id][products_provider]", type:"text", label: "Products provider", hint:"Set the variable for loading products and their info, this should provide an multi dimensional array with the following keys for each entry: name, description, price, quantity"); ?>
</div>
<div class="equal fields">
    <?php new FormField(name: "elements[$id][payment_description]", type:"text", label: "Payment Description", hint:"A description for the purchase to appear on the Stripe purchase page"); ?>
    <?php new FormField(name: "elements[$id][redirect_button]", type:"text", label: "Redirect button selector", hint:"provide a redirect button css selector, if provided then no auto redirect will be made until this button is clicked"); ?>
</div>

<?php
$behaviors = ["stripe.parameters"];
$listBehaviors($id, $behaviors);
?>