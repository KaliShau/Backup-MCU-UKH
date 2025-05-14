<?php
/**
* ChronoLibrary
* Copyright (c) 2025 ChronoEngine.com, All rights reserved.
* Author: (ChronoEngine.com Team)
* license: GNU General Public License version 2 or later; see LICENSE.txt
* Visit http://www.ChronoEngine.com for regular updates and information.
**/
defined('_JEXEC') or die('Restricted access');
?>
<div class="nui grid spaced">
    <a class="nui button red full width iconed" onclick='Nui.Extensions.tinymce.remove(document, "#<?php echo $id; ?>");'><?php echo Chrono::ShowIcon("xmark"); ?>Remove Editor</a>
    <a class="nui button green full width iconed" onclick='Nui.Extensions.tinymce.init(document, "#<?php echo $id; ?>");'><?php echo Chrono::ShowIcon("check"); ?>Enable Editor</a>
</div>