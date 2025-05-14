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
    <?php new FormField(name: "elements[$id][hidden]", type:"select", label: "Hidden", options: ["" => "No", "1" => "Yes"], hint:"The divider is hidden."); ?>
    <?php new FormField(name: "elements[$id][block]", type:"select", label: "Extra Margin", options: ["" => "No", "1" => "Yes"], hint:"The divider has extra space."); ?>
</div>
<?php new FormField(name: "elements[$id][text]", type:"text", label: "Text", value: "", hint:"The divider text."); ?>
<?php
$behaviors = ["size"];
$listBehaviors($id, $behaviors);
?>