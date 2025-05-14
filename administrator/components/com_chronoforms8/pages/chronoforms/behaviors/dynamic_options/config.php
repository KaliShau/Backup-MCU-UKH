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
	<?php new FormField(name: "elements[$id][dynamic_options][datasource]", label: "Data Source", hint:"The source list of options, usually a var from a Read Data Action
	e.g: {var:read_data_name}"); ?>
</div>
<div class="equal fields">
	<?php new FormField(name: "elements[$id][dynamic_options][value]", label: "Option Value path", hint:"Shortcode for the option value, e.g: {row:id}, assuming each data source item has a field named 'id'"); ?>
	<?php new FormField(name: "elements[$id][dynamic_options][text]", label: "Option Text path", hint:"Shortcode for the option text, e.g: {row:title}, assuming each data source item has a field named 'title'"); ?>
</div>