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
	<?php new FormField(name: "elements[$id][username_provider]", label: "Username provider", hint:"You may use shortcodes to call the value of one of the form fields."); ?>
	<?php new FormField(name: "elements[$id][password_provider]", label: "Password provider", hint:"You may use shortcodes to call the value of one of the form fields."); ?>
</div>
<?php new FormField(name: "elements[$id][error]", label: "Login failed error", value:"Login failed."); ?>
<?php
$behaviors = ["events"];
$listBehaviors($id, $behaviors);
?>