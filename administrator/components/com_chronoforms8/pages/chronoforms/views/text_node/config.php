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
<?php new FormField(name: "elements[$id][text]", type:"text", label: "Content", hint:"Text to display"); ?>
<?php new FormField(name: "elements[$id][class]", type:"text", label: "HTML Class", hint:"HTML class to add to the text node"); ?>
<?php
$behaviors = ["size", "color", "icon", "text_node.link"];
$listBehaviors($id, $behaviors);
?>