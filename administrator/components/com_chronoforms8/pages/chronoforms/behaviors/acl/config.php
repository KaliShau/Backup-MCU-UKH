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
<?php
	$levels = $this->get("app_viewlevels", []);

	$options = [new Option(text: "?", value: "")];
	foreach($levels as $level){
		$options[] = new Option(text: $level["title"], value: $level["id"]);
	}
	new FormField(name: "elements[$id][acl]", label: "Viewlevel", type: "select", hint:"Which access level will be required to run this element", options: $options);
?>