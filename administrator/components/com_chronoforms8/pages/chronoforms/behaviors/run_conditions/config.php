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
	new FormField(name: "elements[$id][run_conditions_rule]", label: "Conditions Rule", type: "select", options: [
		new Option(text: "If ANY succeeds", value: "or"),
		new Option(text: "If ALL succeeds", value: "and"),
	]);
?>
<?php foreach(["n" => []] + (!empty($this->data["elements"][$id]["run_conditions"]) ? $this->data["elements"][$id]["run_conditions"] : []) as $k => $item): ?>
	<div class="nui form clonable run_conditions-<?php echo $id; ?>" data-selector=".clonable.run_conditions-<?php echo $id; ?>" data-cloner=".run_conditions-<?php echo $id; ?>-cloner" data-key="<?php echo $k; ?>">
		<div class="equal fields">
			<?php
				new FormField(name: "elements[$id][run_conditions][".$k."][value1]", type:"text", label: "Value 1");
				new FormField(name: "elements[$id][run_conditions][".$k."][type]", type:"select", label: "Comparator", options:[
					new Option(text:"IN", value:"in"),
					new Option(text:"NOT IN", value:"not_in"),
					new Option(text:"Is Empty", value:"empty"),
					new Option(text:"Is NOT Empty", value:"not_empty"),
					new Option(text:"Contains", value:"contains"),
				]);
				new FormField(name: "elements[$id][run_conditions][".$k."][value2]", type:"select", multiple:true, label: "Value 2", code:" data-additions='1' data-separators=','", options:[]);
			?>
			<button type="button" class="nui label red rounded link flex_center remove-clone self-center"><?php echo Chrono::ShowIcon("trash"); ?></button>
		</div>
	</div>
<?php endforeach; ?>
<button type="button" class="nui button blue iconed run_conditions-<?php echo $id; ?>-cloner"><?php echo Chrono::ShowIcon("plus"); ?>Add Condition</button>