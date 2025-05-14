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
	$id = "repeater-".$element["id"];
	$key = !empty($element["key"]) ? $element["key"] : "n";
	$startcount = !empty($element["start_count"]) ? $element["start_count"] : "0";
	$maxcount = !empty($element["max_count"]) ? $element["max_count"] : "0";
?>
<?php foreach([$key => ""] + (!empty($this->data[CF8::getname($element)]) ? $this->data[CF8::getname($element)] : []) as $k => $lang): ?>
	<div class="nui form clonable <?php echo $id; ?>" data-selector=".clonable.<?php echo $id; ?>" data-cloner=".<?php echo $id; ?>-cloner" data-key="<?php echo $k; ?>" data-rkey="<?php echo $key; ?>" data-startcount="<?php echo $startcount; ?>" data-maxcount="<?php echo $maxcount; ?>">
		<?php $this->set(CF8::getname($element)."_key", $k); ?>
		<?php
		ob_start();
		$DisplayElements($elements_by_parent, $element["id"], "views");
		$content = ob_get_clean();
		echo str_replace("[".$key."]", "[".$k."]", $content);
		?>
		<?php $this->set(CF8::getname($element)."_key", null); ?>
		<button type="button" class="nui button red rounded iconed block remove-clone"><?php echo Chrono::ShowIcon("xmark"); ?><?php echo (!empty($element["remove_text"]) ? $element["remove_text"] : "Remove"); ?></button>
		<!-- <div class="nui divider block"></div> -->
		<input type="hidden" name="<?php echo CF8::getname($element); ?>[<?php echo $key; ?>]" value="1">
	</div>
<?php endforeach; ?>
<button type="button" class="nui button blue rounded iconed <?php echo $id; ?>-cloner"><?php echo Chrono::ShowIcon("plus"); ?><?php echo (!empty($element["add_text"]) ? $element["add_text"] : "Add"); ?></button>