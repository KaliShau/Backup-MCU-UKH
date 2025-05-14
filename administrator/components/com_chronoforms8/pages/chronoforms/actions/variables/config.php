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
<?php foreach(["n" => []] + (!empty($this->data["elements"][$id]["variables"]) ? $this->data["elements"][$id]["variables"] : []) as $k => $item): ?>
	<div class="nui form clonable variables-<?php echo $id; ?>" data-selector=".clonable.variables-<?php echo $id; ?>" data-cloner=".variables-<?php echo $id; ?>-cloner" data-key="<?php echo $k; ?>">
		<div class="equal fields">
			<?php
				new FormField(name: "elements[$id][variables][".$k."][type]", type:"select", label: "Variable Type", options:[
					new Option(text:"Data", value:"data"),
					new Option(text:"Variable", value:"var"),
					new Option(text:"Session", value:"session"),
				]);
                new FormField(name: "elements[$id][variables][".$k."][name]", type:"text", label: "Name");
				new FormField(name: "elements[$id][variables][".$k."][value]", type:"text", label: "Value");
			?>
			<button type="button" class="nui label red rounded link flex_center remove-clone self-center"><?php echo Chrono::ShowIcon("trash"); ?></button>
		</div>
	</div>
<?php endforeach; ?>
<button type="button" class="nui button blue iconed variables-<?php echo $id; ?>-cloner"><?php echo Chrono::ShowIcon("plus"); ?>Add Variable</button>

<?php
$behaviors = [];
$listBehaviors($id, $behaviors);
?>