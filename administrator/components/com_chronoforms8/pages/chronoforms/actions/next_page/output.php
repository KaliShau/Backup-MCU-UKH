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
if(!empty($action["next_page"])){
	$this->set("next_page", CF8::parse($action["next_page"]));

	$this->set(CF8::getname($element), CF8::parse($action["next_page"]));
}

// if(!empty($action["ending_page"])){
// 	$this->set("__ending_page", 1);
// }