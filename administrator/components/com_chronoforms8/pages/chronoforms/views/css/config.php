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
<?php new FormField(name: "elements[$id][code]", type:"textarea", label: "CSS code", rows:10, hint:"CSS code withOUT style tags to add to the page", code:"data-codeeditor='1'"); ?>
<?php
$behaviors = [];
$listBehaviors($id, $behaviors);
?>