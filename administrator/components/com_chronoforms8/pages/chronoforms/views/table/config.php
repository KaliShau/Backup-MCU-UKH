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
	<?php new FormField(name: "elements[$id][data_source]", label: "Data Source", value: "", hint:"Read Data action NAME or variable with the records to list"); ?>
	<?php new FormField(name: "elements[$id][dbtable]", type:"select", label: "or Table name", code:"data-searchable='1' data-additions='1'", hint: "If no data source is provided then choose a database table to read", options:['' => ""] + CF8Model::instance()->Tables()); ?>
</div>

<?php
	if(!empty($element["events"])){
		foreach($element["events"] as $k => $event){
			if(!isset($event["name"])){
				$element["events"][$k] = [
					"name" => explode("=", $event)[0],
					"title" => isset(explode("=", $event)[1]) ? explode("=", $event)[1] : "",
					"class" => isset(explode("=", $event)[2]) ? explode("=", $event)[2] : "",
				];
			}
		}
		$this->data["elements"][$id]["events"] = $element["events"];
	}
	if(empty($element["events"]) && !empty($element["columns"])){
		$element["events"] = [];
		foreach($element["columns"] as $column){
			$element["events"][] = [
				"name" => $column["path"],
				"title" => $column["header"],
				"class" => $column["class"],
			];
		}
		$this->data["elements"][$id]["events"] = $element["events"];
	}
?>
<div class="clonable_container">
	<?php foreach(["n" => []] + (!empty($this->data["elements"][$id]["events"]) ? $this->data["elements"][$id]["events"] : []) as $k => $item): ?>
		<div class="nui form clonable sortable events-<?php echo $id; ?>" data-selector=".clonable.events-<?php echo $id; ?>" data-cloner=".events-<?php echo $id; ?>-cloner" data-key="<?php echo $k; ?>">
			<div class="nui grid spaced" style="grid-template-columns: 30% 40% calc(25% - 60px) 30px 30px;">
				<?php
					new FormField(name: "elements[$id][events][".$k."][name]", label: "Data Path", code:' data-eventname="'.$this->data("elements.$id.events.$k.name").'"', hint:"In most cases this is the table column name");
					new FormField(name: "elements[$id][events][".$k."][title]", label: "Header Text");
					new FormField(name: "elements[$id][events][".$k."][class]", label: "Class");
				?>
				<button type="button" class="nui label red rounded link self-center remove-clone"><?php echo Chrono::ShowIcon("trash"); ?></button>
				<button type="button" class="nui label yellow rounded link self-center drag_item"><?php echo Chrono::ShowIcon("sort"); ?></button>
			</div>
		</div>
	<?php endforeach; ?>
</div>
<button type="button" class="nui button blue iconed events-<?php echo $id; ?>-cloner"><?php echo Chrono::ShowIcon("plus"); ?>Add Table Column</button>

<!-- <?php new FormField(name: "elements[$id][events][]", type:"select", label: "Columns", multiple:true, code:"data-additions='1' data-separators=',' data-formbuilder_dynamicevents='$id'", hint:"Comma separated list of columns, each column should be in this format: data-path=Title[=class]"); ?> -->

<!-- <div class="nui hidden">
<?php foreach(["n" => []] + (!empty($this->data["elements"][$id]["columns"]) ? $this->data["elements"][$id]["columns"] : []) as $k => $item): ?>
	<div class="nui form clonable columns-<?php echo $id; ?>" data-selector=".clonable.columns-<?php echo $id; ?>" data-cloner=".columns-<?php echo $id; ?>-cloner" data-key="<?php echo $k; ?>">
		<div class="nui grid spaced" style="grid-template-columns: 30% 40% calc(25% - 30px) 30px;">
			<?php
				new FormField(name: "elements[$id][columns][".$k."][path]", label: "Data Path", hint:"In most cases this is the table column name");
				new FormField(name: "elements[$id][columns][".$k."][header]", label: "Header Text");
				new FormField(name: "elements[$id][columns][".$k."][class]", label: "Class");
			?>
			<button type="button" class="nui label red rounded link self-center remove-clone"><?php echo Chrono::ShowIcon("trash"); ?></button>
		</div>
	</div>
<?php endforeach; ?>
<button type="button" class="nui button blue iconed columns-<?php echo $id; ?>-cloner"><?php echo Chrono::ShowIcon("plus"); ?>Add Table Column</button>
</div> -->

<?php
$behaviors = ["table.expand"];
if(!empty($element["dbtable"])){
	$behaviors = array_merge($behaviors, ["table.sortable", "table.limit", "table.count_source", "where_statement"]);
}
if(!empty($element["output"])){
	$behaviors = array_merge($behaviors, ["table.output"]);
}
$listBehaviors($id, $behaviors);
?>