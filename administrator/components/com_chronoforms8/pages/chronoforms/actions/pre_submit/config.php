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
<p>Add this action to the LOAD area of your page, you may use this to trigger errors to reload the page by adding errors using PHP to the $this->errors array: $this->errors[] = "an error was found...".</p>
<?php
$behaviors = [];
$listBehaviors($id, $behaviors);
?>