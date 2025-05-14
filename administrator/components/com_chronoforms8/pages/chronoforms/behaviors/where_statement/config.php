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
<?php new FormField(name: "elements[$id][where]", type:"textarea", label: "Where", rows:7, hint:"<span class='nui label red'>Use {data.quote:param-name} to quote values in your where statement to prevent SQL injection.</span>", code:"data-codeeditor='1'"); ?>