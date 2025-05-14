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
<?php new FormField(name: "elements[$id][code]", type:"textarea", label: "HTML code", rows:10, hint:"HTML code to display", editor:0); ?>
<?php
$behaviors = ["html.php", "html.joomla_plugins"];
$listBehaviors($id, $behaviors);
?>