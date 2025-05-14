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
<?php
$name = CF8::getname($element);
$num1 = rand(1, 10);
$num2 = rand(1, 10);
ChronoSession::set($name, $num1 + $num2);
new FormField(name: $name, label: $num1." + ".$num2." = ?");
?>