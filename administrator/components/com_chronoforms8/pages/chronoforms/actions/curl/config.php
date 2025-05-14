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
<?php new FormField(name: "elements[$id][url]", label: "URL", hint: "The url to which the request will be made."); ?>
<div class="equal fields">
	<?php new FormField(name: "elements[$id][request]", type:"select", label: "Request Type", options:[
		new Option(value:"", text:"GET"),
		new Option(value:"post", text:"POST"),
	], hint:"What type of request is this"); ?>
	<?php new FormField(name: "elements[$id][header]", type:"select", label: "Header in response", options:[
		new Option(value:"0", text:"No"),
		new Option(value:"1", text:"Yes"),
	], hint:"Include header in response"); ?>
</div>
<?php
$behaviors = ["curl.parameters", "events"];
$listBehaviors($id, $behaviors);
?>