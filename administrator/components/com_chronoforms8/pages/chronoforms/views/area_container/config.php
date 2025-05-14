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
    $options = [];
    $options[] = new Option(text:"Horizontal Grid", value:"horizontal", html:'<span class="nui label">Horizontal Grid</span><span class="nui right">Grid flow will be horizontal</span>');
    $options[] = new Option(text:"Stackable", value:"stackable", html:'<span class="nui label">Stackable</span><span class="nui right">Grid items will stack on smalle screens</span>');
    new FormField(name: "elements[$id][class]", type:"select", label: "Classes", multiple:true, code:"data-additions='1' data-separators=','", options:$options, hint: "Choose a class or add custom classes to be added to this div container");
?>
<?php
$behaviors = ["events_listeners", "area_container.subitems", "area_container.grid"];
$listBehaviors($id, $behaviors);
?>