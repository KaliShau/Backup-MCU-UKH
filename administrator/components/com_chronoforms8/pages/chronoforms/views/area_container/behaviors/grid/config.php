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
    <?php  new FormField(name: "elements[$id][grid][gap][columns]", label: "Columns Gap", value: "50px", hint: "The gap between grid columns"); ?>
    <?php  new FormField(name: "elements[$id][grid][gap][rows]", label: "Rows Gap", value: "50px", hint: "The gap between grid rows"); ?>
</div>
<?php
    if(!empty($this->data["elements"][$id]["grid"]["columns"]) && is_array($this->data["elements"][$id]["grid"]["columns"])){
		$this->data["elements"][$id]["grid"]["columns"] = implode(" ", $this->data["elements"][$id]["grid"]["columns"]);
	}

    if(!empty($this->data["elements"][$id]["grid"]["rows"]) && is_array($this->data["elements"][$id]["grid"]["rows"])){
		$this->data["elements"][$id]["grid"]["rows"] = implode(" ", $this->data["elements"][$id]["grid"]["rows"]);
	}
?>
<div class="equal fields">
    <?php new FormField(name: "elements[$id][grid][columns]", type:"text", label: "Columns Sizes", hint:"space separated list of columns sizes in px, % or fr units, e.g: 1fr 2fr 1fr"); ?>
    <?php new FormField(name: "elements[$id][grid][rows]", type:"text", label: "Rows Sizes", hint:"space separated list of rows sizes in px, % or fr units, e.g: 1fr 2fr 1fr"); ?>
</div>