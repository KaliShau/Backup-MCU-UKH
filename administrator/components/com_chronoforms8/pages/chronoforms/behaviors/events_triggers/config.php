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
<div class="nui alert orange">Note: All conditions for the same trigger (in all fields) are validated before the trigger is fired.</div>
<?php
	$element_name = !empty($this->data["elements"][$id]["name"]) ? $this->data["elements"][$id]["name"] : $this->data("name");
?>
<?php foreach(["n" => []] + (!empty($this->data["elements"][$id]["triggers"]) ? $this->data["elements"][$id]["triggers"] : []) as $k => $item): ?>
	<div class="nui form clonable triggers-<?php echo $id; ?>" data-selector=".clonable.triggers-<?php echo $id; ?>" data-cloner=".triggers-<?php echo $id; ?>-cloner" data-key="<?php echo $k; ?>">
		<div class="equal fields">
			<?php
				$options = [
					new Option(text:"Document Ready", value:"ready"),
					new Option(text:"Value Changes", value:"change"),
					new Option(text:"Value is Empty", value:"empty"),
					new Option(text:"Value is Not Empty", value:"not-empty"),
					new Option(text:"Value IN", value:"in"),
					new Option(text:"Value is Not IN", value:"not-in"),
					new Option(text:"Value Matches Regex", value:"regex"),
					new Option(text:"String Not Empty", value:"string_not_empty"),
				];
				if($element_name == "field_button"){
					$options = [
						new Option(text:"Document Ready", value:"ready"),
						new Option(text:"Click", value:"click"),
					];
				}
				new FormField(name: "elements[$id][triggers][".$k."][condition]", type:"select", label: "On", options:$options);
				new FormField(name: "elements[$id][triggers][".$k."][value]", type:"select", label: "Value(s) - Optional", multiple:true, code:"data-additions='1' data-separators=','");
				// new FormField(name: "elements[$id][triggers][".$k."][name]", label: "Trigger");
				new FormField(name: "elements[$id][triggers][".$k."][name]", type:"select", multiple:true, label: "Trigger(s)", code:" data-additions='1' data-separators=','", options:[]);
			?>
			<button type="button" class="nui label red rounded link flex_center remove-clone self-center"><?php echo Chrono::ShowIcon("trash"); ?></button>
		</div>
	</div>
<?php endforeach; ?>
<button type="button" class="nui button blue iconed triggers-<?php echo $id; ?>-cloner"><?php echo Chrono::ShowIcon("plus"); ?>Add Trigger</button>