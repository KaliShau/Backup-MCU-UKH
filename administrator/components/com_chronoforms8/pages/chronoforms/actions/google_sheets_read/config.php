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
<?php new FormField(name: "elements[$id][sheet_id]", label: "Sheet ID", hint: "The sheet id appears in the browser address bar when you open the sheet, the sheet must be shared"); ?>
<?php new FormField(name: "elements[$id][range]", label: "Range", hint: "The cells range to read", value:"A1:Z500"); ?>
<?php new FormField(name: "elements[$id][credentials_path]", label: "Service Account JSON file path", hint: "The absolute path to the file on your web server"); ?>
<?php
$behaviors = [];
$listBehaviors($id, $behaviors);
?>