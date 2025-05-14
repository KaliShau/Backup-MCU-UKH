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
<div class="nui flex breadcrumb colored slate rounded">
    <?php foreach($breadcrumbs as $bc): ?>
        <a class="section" href="<?php echo ChronoApp::$instance->extension_url."&action=".$bc->action; ?>"><?php echo $bc->title; ?></a>
        <div class="divider"> / </div>
    <?php endforeach; ?>
</div>