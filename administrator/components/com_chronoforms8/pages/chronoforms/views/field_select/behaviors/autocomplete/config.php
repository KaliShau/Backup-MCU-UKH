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
    <?php new FormField(name: "elements[$id][autocomplete][page]", label: "AutoComplete Page Alias", hint: "The alias of the page to return the auto complete json encoded array of objects, the page must have a unique page group, example result:
     [['value' => '1', 'text' => '1'],['value' => '2', 'text' => '2']...]"); ?>
     <?php new FormField(name: "elements[$id][autocomplete][length]", label: "AutoComplete Char Length", value:"1", hint: "The minimum number of characters to have before loading the remote content"); ?>
</div>