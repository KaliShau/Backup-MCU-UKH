<?php
/**
* ChronoLibrary
* Copyright (c) 2025 ChronoEngine.com, All rights reserved.
* Author: (ChronoEngine.com Team)
* license: GNU General Public License version 2 or later; see LICENSE.txt
* Visit http://www.ChronoEngine.com for regular updates and information.
**/
defined('_JEXEC') or die('Restricted access');
?>
<?php
	if(!empty($limit) && !empty($count) && ($count > $limit)){
		new ChronoPaginator($count, $limit);
		// echo "<div class='nui divider invisible block'></div>";
	}
?>
<div <?php if(!empty($wide)): ?>style="overflow-x: scroll;"<?php endif; ?>>
<table class="nui table white celled selectable bordered rounded full width block">
	<thead>
		<tr>
			<?php foreach ($columns as $column) : ?>
				<?php
				$class = "nui collapsing";
				if ($column->expand) {
					$class = "expanding";
				}
				if (!empty($column->class)) {
					$class .= " ".$column->class;
				}
				$class .= " breakwords";
				?>
				<th class="<?php echo $class; ?>">
					<?php
					if ($column->selector) {
					?>
						<div class="nui checkbox select_all">
							<input type="checkbox" class="hidden" tabindex="0" title="select all">
							<label><?php echo Chrono::ShowIcon("square unchecked regular"); ?><?php echo Chrono::ShowIcon("square-check checked"); ?></label>
						</div>
					<?php
					} else {
					?>
						<?php if ($column->sortable) : ?>
							<?php
							$params = [];
							$urlpts = parse_url(ChronoApp::$instance->current_url);
							parse_str($urlpts["query"], $params);
							$dir = "asc";
							$icon = "";
							if(!empty($params["order_by"]) && str_starts_with($params["order_by"], $column->name.":")){
								$dir = (explode(":", $params["order_by"])[1] == "asc" ? "desc" : "asc");
								if($dir == "desc"){
									$icon = Chrono::ShowIcon("arrow-down-short-wide");
								}else{
									$icon = Chrono::ShowIcon("arrow-down-wide-short");
								}
							}
							
							$url = $urlpts["path"]."?";
							$nparams = [];
							foreach($params as $pk => $pv){
								if(str_contains($pk, "/") || $pk == "order_by"){
									continue;
								}
								$nparams[$pk] = $pv;
								// $url .= $pk."=".$pv."&";
							}
							$url .= http_build_query($nparams);
							$url = trim($url, "&");
							$clear_icon = '<a href="'.$url.'">'.Chrono::ShowIcon("xmark nui red").'</a>';
							$url .= "&order_by=".$column->name.":".$dir;
							?>
							<a href="<?php echo $url; ?>"><?php echo $column->title; ?></a><?php echo "&nbsp;".$icon; ?><?php echo !empty($icon) ? "&nbsp;".$clear_icon : ""; ?>
						<?php else : ?>
							<?php echo $column->title; ?>
						<?php endif; ?>
					<?php
					}
					?>
				</th>
			<?php endforeach; ?>
		</tr>
	</thead>
	<tbody>
		<?php foreach ($rows as $row) : ?>
			<tr>
				<?php foreach ($columns as $column) : ?>
					<?php
					$class = "nui collapsing";
					if ($column->expand) {
						$class = "expanding";
					}
					if (!empty($column->class)) {
						$class .= " ".$column->class;
					}
					$class .= " breakwords";
					?>
					<td class="<?php echo $class; ?>">
						<?php
						if (true) {
							$row2 = $row;
							if ($column->func != null) {
								$func = $column->func;
								$row2[$column->name] = $func($row);
							}
							if ($column->selector) {
						?>
								<div class="nui checkbox selector">
									<input type="checkbox" class="hidden" title="selector" name="<?php echo $column->name; ?>[]" value="<?php echo $row2[$column->name]; ?>" tabindex="0">
									<label><?php echo Chrono::ShowIcon("square unchecked regular"); ?><?php echo Chrono::ShowIcon("square-check checked"); ?></label>
								</div>
						<?php
							} else {
								echo isset($row2[$column->name]) ? implode("<br>", (array)$row2[$column->name]) : "";
							}
						}
						?>
					</td>
				<?php endforeach; ?>
			</tr>
		<?php endforeach; ?>
	</tbody>
</table>
</div>
<?php
	if(!empty($limit) && !empty($count) && ($count > $limit)){
		new ChronoPaginator($count, $limit);
	}
?>