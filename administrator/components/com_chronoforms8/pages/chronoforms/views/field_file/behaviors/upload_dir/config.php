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
<?php new FormField(name: "elements[$id][upload_dir]", label: "Upload Directory", value:"{path:front}/uploads/", hint:"Absolute path to the directory where you want the file(s) to be saved."); ?>
<?php new FormField(name: "elements[$id][create_upload_dir]", type:"select", label: "Create Directory", hint:"Should the folder be created if it does not exist ?", options:["" => "No", "1" => "Yes"]); ?>