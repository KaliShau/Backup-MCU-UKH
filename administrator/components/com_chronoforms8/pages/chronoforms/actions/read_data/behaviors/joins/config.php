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

<?php new FormField(name: "elements[$id][alias]", type:"text", label: "Main Table alias", value:"Main", hint: "Alias for the main table, you will need to update your WHERE statement and fields aliases to use this ALIAS"); ?>

<?php foreach(["n" => []] + (!empty($this->data["elements"][$id]["joins"]) ? $this->data["elements"][$id]["joins"] : []) as $k => $item): ?>
	<div class="nui form clonable joins-<?php echo $id; ?>" data-selector=".clonable.joins-<?php echo $id; ?>" data-cloner=".joins-<?php echo $id; ?>-cloner" data-key="<?php echo $k; ?>">
		<div class="equal fields">
			<?php
				new FormField(name: "elements[$id][joins][".$k."][type]", type:"select", label: "Join Type", options:[
					new Option(text:"Left", value:"LEFT"),
					new Option(text:"Inner", value:"INNER"),
					new Option(text:"Right", value:"RIGHT"),
				]);
				new FormField(name: "elements[$id][joins][".$k."][table]", type:"select", label: "Table name", code:"data-searchable='1' data-additions='1'", hint: "The database table to join.", options:['' => ""] + CF8Model::instance()->Tables());
				new FormField(name: "elements[$id][joins][".$k."][alias]", type:"text", label: "Table alias", hint: "Alias for the joined table used in the query.");
			?>
			<button type="button" class="nui label red rounded link flex_center remove-clone self-center"><?php echo Chrono::ShowIcon("trash"); ?></button>
		</div>
		<?php new FormField(name: "elements[$id][joins][".$k."][on]", type:"text", label: "On", hint: "The on part of the query, the conditions based on which the 2 tables are joined."); ?>
		<div class="nui divider block"></div>
	</div>
<?php endforeach; ?>

<div class="equal fields">
<button type="button" class="nui button blue iconed joins-<?php echo $id; ?>-cloner"><?php echo Chrono::ShowIcon("plus"); ?>Add Join</button>
</div>