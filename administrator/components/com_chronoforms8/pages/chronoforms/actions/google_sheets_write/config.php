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
    <?php new FormField(name: "elements[$id][sheet_id]", label: "Sheet ID", hint: "The sheet id appears in the browser address bar when you open the sheet, the sheet must be shared with the Role = Editor"); ?>
    <?php new FormField(name: "elements[$id][sheet_name]", label: "Sheet Name", value:"Sheet1", hint: "The sheet name, usually Sheet1 but you should double check this"); ?>
</div>
<div class="equal fields">
	<?php new FormField(name: "elements[$id][method]", type:"select", label: "Write Method", hint: "Which method to use for saving the rows.", options:['append' , "update" , "clear" ]); ?>
    <?php new FormField(name: "elements[$id][range]", label: "Range", hint: "The cells range to update or clear, append will append to the end of the file", value:"A1:Z1"); ?>
</div>
<?php new FormField(name: "elements[$id][credentials_path]", label: "Service Account JSON file path", hint: "The absolute path to the file on your web server"); ?>
<?php
$behaviors = ["data_override"];
$listBehaviors($id, $behaviors);
?>