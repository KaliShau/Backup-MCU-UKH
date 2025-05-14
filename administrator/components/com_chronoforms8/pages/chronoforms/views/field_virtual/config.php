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
	<?php new FormField(name: "elements[$id][fieldname]", label: "Field Name", value: "virtual_$id"); ?>
	<?php new FormField(name: "elements[$id][value]", label: "Default Value", value: ""); ?>
</div>

<?php foreach(["n" => []] + (!empty($this->data["elements"][$id]["conditions"]) ? $this->data["elements"][$id]["conditions"] : []) as $k => $item): ?>
	<div class="nui form clonable conditions-<?php echo $id; ?>" data-selector=".clonable.conditions-<?php echo $id; ?>" data-cloner=".conditions-<?php echo $id; ?>-cloner" data-key="<?php echo $k; ?>">
		<div class="equal fields">
			<?php
				new FormField(name: "elements[$id][conditions][".$k."][case]", type:"select", label: "Rule", options:[
					new Option(text:"IF value IN", value:"in"),
					new Option(text:"IF value NOT IN", value:"not_in"),
				]);
                new FormField(name: "elements[$id][conditions][".$k."][matches]", type:"select", multiple:true, label: "Value(s)", code:" data-additions='1' data-separators=','", options:[], hint:"comma separated list of values");
				new FormField(name: "elements[$id][conditions][".$k."][value]", type:"text", label: "Set Value to");
			?>
			<button type="button" class="nui label red rounded link flex_center remove-clone self-center"><?php echo Chrono::ShowIcon("trash"); ?></button>
		</div>
	</div>
<?php endforeach; ?>
<button type="button" class="nui button blue iconed conditions-<?php echo $id; ?>-cloner"><?php echo Chrono::ShowIcon("plus"); ?>Add Condition</button>

<?php
$behaviors = [];
$listBehaviors($id, $behaviors);
?>