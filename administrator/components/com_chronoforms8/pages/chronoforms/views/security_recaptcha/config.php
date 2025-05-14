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
<?php new FormField(name: "elements[$id][error]", label: "Error Message", value:"ReCaptcha verification failed."); ?>
<div class="equal fields">
	<?php new FormField(name: "elements[$id][sitekey]", label: "Site Key", hint:"if empty then it will use the key in the settings page"); ?>
	<?php new FormField(name: "elements[$id][secretkey]", label: "Secret Key", hint:"if empty then it will use the key in the settings page"); ?>
</div>
<?php new FormField(name: "elements[$id][version]", type:"select", label: "ReCaptcha version", hint: "Choose which version to use, if you use v3 then your keys must be for v3", options:[
	new Option(value:"", text:"v2"),
	new Option(value:"3", text:"v3"),
]); ?>
<?php new FormField(name: "elements[$id][language]", label: "Language", hint:"By default the ReCaptcha will use the browser's language, but you can force a specific language for the ReCaptcha, e.g: en, fr, it"); ?>