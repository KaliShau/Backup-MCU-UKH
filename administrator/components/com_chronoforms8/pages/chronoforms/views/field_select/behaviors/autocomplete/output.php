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
	$url = Chrono::addUrlParam($this->current_url, ["chronoform" => $row["alias"], "output" => "ajax", "chronopage" => $element["autocomplete"]["page"], $element["fieldname"] => ""]);
	$element["code"] = (!empty($element["code"]) ? $element["code"] : "")." data-searchable='1' data-autocomplete='".$url."' data-autocomplete-length='".$element["autocomplete"]["length"]."'";