<?php
/**
* ChronoForms 8
* Copyright (c) 2023 ChronoEngine.com, All rights reserved.
* Author: (ChronoEngine.com Team)
* license:     GNU General Public License version 2 or later; see LICENSE.txt
* Visit http://www.ChronoEngine.com for regular updates and information.
**/
defined('_JEXEC') or die('Restricted access');

if($this->isAdmin() && ($this->action == "index" || $this->action == "edit")){
    $count = CF8Model::instance()->Select(count:true);
    if($count < 3){
        echo '<div class="nui alert colored cyan">You can try different demo forms <a style="text-decoration:underline;" href="' . $this->extension_url . '&action=demo">Here</a>.</div>';
    }
}