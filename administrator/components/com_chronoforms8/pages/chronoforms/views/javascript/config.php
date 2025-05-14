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
<?php new FormField(name: "elements[$id][code]", type:"textarea", label: "JavaScript code", rows:10, hint:"JavaScript code withOUT script tags to add to the page", code:"data-codeeditor='1'"); ?>
<?php
$behaviors = ["javascript.domready", "javascript.files"];
$listBehaviors($id, $behaviors);
?>