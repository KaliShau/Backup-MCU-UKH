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

<div class="clonable_container">
	<?php foreach(["n" => []] + (!empty($this->data["elements"][$id]["items"]) ? $this->data["elements"][$id]["items"] : []) as $k => $item): ?>
		<div class="nui form clonable sortable block items-<?php echo $id; ?>" data-selector=".clonable.items-<?php echo $id; ?>" data-cloner=".items-<?php echo $id; ?>-cloner" data-key="<?php echo $k; ?>">
			<div class="nui grid spaced" style="grid-template-columns: 30% 40% calc(25% - 30px) 30px;">
				<?php
					new FormField(name: "elements[$id][items][".$k."][text]", label: "Text", hint:"The text to show on the menu item");
					new FormField(name: "elements[$id][items][".$k."][page]", label: "Page Alias", hint:"The form page alias to link to");
					new FormField(name: "elements[$id][items][".$k."][class]", label: "Class", hint:"A CSS class to add to the menu item");
				?>
				<button type="button" class="nui label red rounded link self-center remove-clone"><?php echo Chrono::ShowIcon("trash"); ?></button>
			</div>
		</div>
	<?php endforeach; ?>
</div>
<button type="button" class="nui button blue iconed items-<?php echo $id; ?>-cloner"><?php echo Chrono::ShowIcon("plus"); ?>Add Menu Item</button>

<?php
$behaviors = [];
$listBehaviors($id, $behaviors);
?>