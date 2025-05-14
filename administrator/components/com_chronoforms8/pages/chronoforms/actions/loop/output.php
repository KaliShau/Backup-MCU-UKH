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
if(!empty($element["loopvar"])){
	$loopvar = CF8::parse($element["loopvar"]);
	if(is_array($loopvar)){
		foreach($loopvar as $k => $v){
			$this->set(CF8::getname($element), ["key" => $k, "value" => $v]);

			$DisplayElements($elements_by_parent, $element["id"], "loop");
		}
	}
}