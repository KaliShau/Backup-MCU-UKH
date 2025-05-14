<?php
/**
* ChronoForms 8
* Copyright (c) 2023 ChronoEngine.com, All rights reserved.
* Author: (ChronoEngine.com Team)
* license:     GNU General Public License version 2 or later; see LICENSE.txt
* Visit http://www.ChronoEngine.com for regular updates and information.
**/
defined('_JEXEC') or die('Restricted access');

$sort = Chrono::getVal($this->settings, "index_sort", "id asc");
$sql = "select a.*, b.count from #__chronoforms8 as a left join (select count(id) as count, form_id from #__chronoforms8_datalog group by form_id) as b on b.form_id = a.id";
if(!empty($this->data("filters"))){
	// ChronoSession::set("filters", $this->data("filters"));
	foreach($this->data("filters") as $k => $v){
		if(strlen($v) > 0){
			$sql .= " AND ".CF8Model::instance()->quoteName($k)." = ".CF8Model::instance()->quote($v);
		}
	}
}
$rows = CF8Model::instance()->Select(order_by:true, order:$sort, sql:$sql);
?>
<form class="nui form" action="<?php echo ChronoApp::$instance->current_url; ?>" method="post" enctype="multipart/form-data" accept-charset="UTF-8">
	<?php
	new MenuBar(title: "Forms", buttons: [
		new MenuButton(link: true, url: "action=edit", title: "New", color:"blue bordered", icon:"plus"),
		new MenuButton(action:true, title: "Copy", icon:"copy", color:"grey bordered", url:"action=copy"),
		new MenuButton(action:true, title: "Backup", icon:"download", color:"grey bordered", url:"action=backup&output=component"),
		new MenuButton(link: true, url: "action=restore", title: "Restore", color:"grey bordered", icon:"upload"),
		new MenuButton(action:true, title: "Delete", icon:"trash", color:"red bordered", url:"action=delete"),
		new MenuButton(link: true, url: "action=extend", title: "Extend", color:"grey bordered", icon:"puzzle-piece"),
		new MenuButton(link: true, url: "action=demo", title: "Demo Forms", color:"grey bordered", icon:"briefcase"),
		new MenuButton(link: true, url: "action=settings", title: "Settings", color:"slate", icon:"gear"),
		new MenuButton(link: true, url: "https://www.chronoengine.com/faqs/chronoforms/chronoforms8", title: "Help", color:"orange bordered", icon:"circle-question"),
	]);

	?>
	
	<?php if(!empty($this->settings["categories"])): ?>
		<div class="fields">
			<?php new FormField(name: "filters[category]", label: "Category", type: "select", code:"onchange='this.closest(\"form\").submit()'", options: array_merge([""], $this->settings["categories"])); ?>
		</div>
	<?php endif; ?>

	<?php
	new DataTable($rows, [
		new TableColumn(selector:true, name:"id"),
		new TableColumn(name:"title", title:"Form", expand:true, sortable:true, func:function($row){
			$text = '<a href="'.ChronoApp::$instance->extension_url.'&action=edit&id='.$row["id"].'"><strong>'.$row["title"].'</strong></a>'.' ('.$row["alias"].')';
			if(!empty($row["params"]["info"])){
				$text .= '<br><small>'.nl2br($row["params"]["info"]).'</small>';
			}
			return $text;
			// return '<a href="'.ChronoApp::$instance->extension_url.'&action=edit&id='.$row["id"].'">'.$row["title"].'</a>'.' ('.$row["alias"].')';
		}),
		new TableColumn(name:"statistics", title:"Details", func:function($row){
			$hints = "";
			if(!empty($row["params"]["debug"])){
				$hints .= '<label class="nui label red small">Debug ON</label>&nbsp;';
			}
			if(!empty($row["elements"])){
				$pages = 0;
				$views = 0;
				$actions = 0;
				foreach($row["elements"] as $element){
					if($element["type"] == "page"){
						$pages++;
					}else if($element["type"] == "views"){
						$views++;

						if(!ChronoApp::isJoomla()){
							if(isset($element["fieldname"]) && $element["fieldname"] == "name"){
								$hints .= '<label class="nui label red inverted small">Invalid Field name "'.$element["fieldname"].'"</label>&nbsp;';
							}
						}
					}else if($element["type"] == "actions"){
						$actions++;
					}
				}
				$hints .= '<label class="nui label blue small">'.$pages.' Pages</label>&nbsp;';
				$hints .= '<label class="nui label colored grey small">'.$views.' Views</label>&nbsp;';
				$hints .= '<label class="nui label colored grey small">'.$actions.' Actions</label>&nbsp;';
			}
			return $hints;
		}),
		new TableColumn(name:"published", title:Chrono::l("Enabled"), sortable:true, class:"text-center", func:function($row){
			if($row["published"] == "1"){
				return '<a href="'.ChronoApp::$instance->extension_url.'&action=toggle&id='.$row["id"].'&field=published&value=0">'.Chrono::ShowIcon("check nui green").'</a>';
			}else{
				return '<a href="'.ChronoApp::$instance->extension_url.'&action=toggle&id='.$row["id"].'&field=published&value=1">'.Chrono::ShowIcon("xmark nui red").'</a>';
			}
		}),
		new TableColumn(name:"view", title:"Preview", func:function($row){
			if(!ChronoApp::isJoomla()){
				$pages = get_posts(array(
					'post_type' => 'page',
					'posts_per_page' => 1, // Limit to 1 page
					'post_status' => 'publish',
				));
				
				$page_url = "";
				if (!empty($pages)) {
					$page_url = get_permalink($pages[0]->ID);
				}
				return '<a href="'.ChronoApp::$instance->extension_url.'&action=view&id='.$row["id"].'" target="_blank">Admin</a>, <a href="'.$page_url.'?plugin='.ChronoApp::$instance->extension.'&action=view&id='.$row["id"].'" target="_blank">Front</a>';
			}
			return '<a href="'.ChronoApp::$instance->extension_url.'&action=view&chronoform='.$row["alias"].'" target="_blank">Admin</a>, <a href="'.str_replace("/administrator", "", ChronoApp::$instance->extension_url).'&action=view&chronoform='.$row["alias"].'" target="_blank">Front</a>';
		}),
		new TableColumn(name:"log", title:"Submissions", func:function($row){
			return '<a href="'.ChronoApp::$instance->extension_url.'&action=datalog&form_id='.$row["id"].'">'.(!empty($row["count"]) ? $row["count"] : "0").' Records</a>';
			// if(!empty($row["params"]["log_data"])){
			// 	return '<a href="'.ChronoApp::$instance->extension_url.'&action=datalog&form_id='.$row["id"].'">'.(!empty($row["count"]) ? $row["count"] : "0").' Records</a>';
			// }else{
			// 	return '<label class="nui label colored red small">Disabled</label>';
			// }
		}),
		new TableColumn(name:"id", title:"ID", sortable:true),
	]);
	?>
</form>