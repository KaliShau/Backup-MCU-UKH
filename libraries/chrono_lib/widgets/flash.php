<?php
/**
* ChronoLibrary
* Copyright (c) 2025 ChronoEngine.com, All rights reserved.
* Author: (ChronoEngine.com Team)
* license: GNU General Public License version 2 or later; see LICENSE.txt
* Visit http://www.ChronoEngine.com for regular updates and information.
**/
defined('_JEXEC') or die('Restricted access');

$errors = ChronoSession::getFlash("error");
foreach($errors as $msg){
    echo '<div class="nui alert red">'.$msg.'</div>';
}

$warning = ChronoSession::getFlash("warning");
foreach($warning as $msg){
    echo '<div class="nui alert orange">'.$msg.'</div>';
}

$info = ChronoSession::getFlash("info");
foreach($info as $msg){
    echo '<div class="nui alert blue">'.$msg.'</div>';
}

$success = ChronoSession::getFlash("success");
foreach($success as $msg){
    echo '<div class="nui alert green">'.$msg.'</div>';
}
?>