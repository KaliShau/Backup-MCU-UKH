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
<?php foreach(["n" => []] + (!empty($this->data["elements"][$id]["output"]) ? $this->data["elements"][$id]["output"] : []) as $k => $item): ?>
	<div class="nui form clonable output-<?php echo $id; ?>" data-selector=".clonable.output-<?php echo $id; ?>" data-cloner=".output-<?php echo $id; ?>-cloner" data-key="<?php echo $k; ?>">
		<div class="nui grid spaced" style="grid-template-columns: 20% calc(75% - 30px) 30px;">
			<?php
				new FormField(name: "elements[$id][output][".$k."][path]", label: "Data Path");
				new FormField(name: "elements[$id][output][".$k."][html]", type:"textarea", rows:5, label: "HTML", hint:"Enter any HTML code here, use {row:column_name} to get the value of any column, you may also use PHP code with tags, the \$row variable is an array with all columns");
			?>
			<button type="button" class="nui label red rounded link self-center remove-clone"><?php echo Chrono::ShowIcon("trash"); ?></button>
		</div>
	</div>
<?php endforeach; ?>
<button type="button" class="nui button blue iconed output-<?php echo $id; ?>-cloner"><?php echo Chrono::ShowIcon("plus"); ?>Add Table Column</button>