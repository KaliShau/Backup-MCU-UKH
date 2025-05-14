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
<?php new FormField(name: "elements[$id][validation_function][function]", label: "JavaScript Function Name", hint:"The name of the function to test the value.
The function should be defined on the same page using a JavaScript view.
The function parameter is the field value.
The function return value is either true (bool) or an error message (string)."); ?>

<?php new FormField(name: "elements[$id][validation_function][php]", type:"textarea", label: "PHP Code", rows:7, hint:"PHP code to test the rule, use \$value for the field value, return true or an error message.", code:"data-codeeditor='1'"); ?>