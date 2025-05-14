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
    <?php new FormField(name: "elements[$id][fieldset_class]", label: "Fieldset Class", value: "", hint:"Custom HTML class for the fieldset node"); ?>
    <?php new FormField(name: "elements[$id][legend_class]", label: "Title Class", value: "", hint:"Custom HTML class for the title"); ?>
</div>