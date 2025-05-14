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
<?php new FormField(name: "elements[$id][filename_provider]", label: "Filename Provider", hint:"Use {file:name} for original file name,
{file:safename} for sanitized file name, 
{file:extension} for file extension.
example: {file:safename}_{date:Ymd_His}.{file:extension}"); ?>