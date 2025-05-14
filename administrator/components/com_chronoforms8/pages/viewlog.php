<?php
/**
 * ChronoForms 8
 * Copyright (c) 2023 ChronoEngine.com, All rights reserved.
 * Author: (ChronoEngine.com Team)
 * license:     GNU General Public License version 2 or later; see LICENSE.txt
 * Visit http://www.ChronoEngine.com for regular updates and information.
 **/
defined('_JEXEC') or die('Restricted access');

$row =  CF8LogModel::instance()->Select(conditions: [['id', "=", ChronoApp::$instance->data("id")]], single: true);

$form =  CF8Model::instance()->Select(conditions: [['id', "=", $row["form_id"]]], single: true);

if(!empty($form["params"]["locales"])){
	foreach($form["params"]["locales"]["lang"] as $k => $lang){
		if($lang == $this->locale){
			$strings = $form["params"]["locales"]["strings"][$k];
			$lines = CF8::multiline($strings);
			foreach($lines as $line){
				CF8::$locales[$line->name] = !empty($line->value) ? $line->value : $line->name;
			}

			break;
		}
	}
}

new MenuBar(title: "Data Log", buttons: [
	new MenuButton(link: true, title: "Close", icon: "xmark", color: "red", url: "action=datalog&form_id=".$row["form_id"]),
]);
?>
<table class="nui table white block bordered rounded celled definition">
	<tbody>
	<?php foreach ($row as $k => $v) : ?>
		<?php if($k == "data"): ?>
			<?php
			foreach ($form["elements"] as $element) {
				if ($element["type"] == "views") {
					if (str_starts_with($element["name"], "field_") && $element["name"] != "field_button") {
						if(in_array($element["name"], ["field_hidden", "field_virtual"])){
							$label = $element["fieldname"];
						}else{
							$label = $element["label"];
						}
						$label = CF8::parse($label);
						?>
						<tr>
							<td class="collapsing"><?php echo $label; ?></td>
							<td><?php echo isset($v[$element["id"]]) ? (is_array($v[$element["id"]]) ? implode(", ", $v[$element["id"]]) : htmlspecialchars($v[$element["id"]])) : ""; ?></td>
						</tr>
						<?php
					}
				}
			}
			?>
		<?php else: ?>
		<tr>
			<td class="collapsing"><?php echo $k; ?></td>
			<td><?php echo $v; ?></td>
		</tr>
		<?php endif; ?>
	<?php endforeach; ?>
	</tbody>
</table>