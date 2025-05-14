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
	if(!empty($element["count"]) && !empty($element["limit"])){
		$count = CF8::parse($element["count"]);
		$limit = CF8::parse($element["limit"]);

		new ChronoPaginator($count, $limit);
	}