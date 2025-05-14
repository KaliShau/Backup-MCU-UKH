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
    <?php new FormField(name: "elements[$id][tag]", type:"select", label: "Tag", options: ["h1", "h2", "h3", "h4", "h5", "h6"], hint:"The header tag."); ?>
    <?php new FormField(name: "elements[$id][position]", type:"select", label: "Position", options: ["self-start" => "Start", "self-end" => "End", "self-center" => "Center"], hint:"The text position."); ?>
</div>
<?php new FormField(name: "elements[$id][text]", type:"text", label: "Text", value: "", hint:"The header text."); ?>
<?php
$behaviors = ["icon", "color", "size", "class"];
$listBehaviors($id, $behaviors);
?>