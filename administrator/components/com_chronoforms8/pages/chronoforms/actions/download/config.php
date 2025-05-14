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
<?php new FormField(name: "elements[$id][path]", label: "File Path", hint: "The absolute full path to the file to be downloaded."); ?>
<?php new FormField(name: "elements[$id][download_name]", label: "Download Name", hint: "The name of the download file, this can be left empty and the real file name will be used."); ?>
<?php
$behaviors = [];
$listBehaviors($id, $behaviors);
?>