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
	<?php foreach(["n" => []] + (!empty($this->data["elements"][$id]["files"]) ? $this->data["elements"][$id]["files"] : []) as $k => $item): ?>
		<div class="nui form clonable sortable files-<?php echo $id; ?>" data-selector=".clonable.files-<?php echo $id; ?>" data-cloner=".files-<?php echo $id; ?>-cloner" data-key="<?php echo $k; ?>">
			<div class="nui grid spaced" style="grid-template-columns: 90% 30px 30px;">
				<?php
					new FormField(name: "elements[$id][files][".$k."][path]", label: "File Path");
				?>
				<button type="button" class="nui label red rounded link self-center remove-clone"><?php echo Chrono::ShowIcon("trash"); ?></button>
				<button type="button" class="nui label yellow rounded link self-center drag_item"><?php echo Chrono::ShowIcon("sort"); ?></button>
			</div>
		</div>
	<?php endforeach; ?>
</div>
<button type="button" class="nui button blue iconed files-<?php echo $id; ?>-cloner"><?php echo Chrono::ShowIcon("plus"); ?>Add File Path</button>