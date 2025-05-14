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
<div class="nui flex tabular menu wrap mb1 middle aligned stackable">
	<?php foreach($element["items"] as $item): ?>
		<?php
			$active = "";
			$url = Chrono::addUrlParam($this->current_url, ["chronoform" => $row["alias"], "chronopage" => $item["page"]]);
			if($pages_ids_to_alias[$active_page_id] == $item["page"]){
				$active = "active";
			}
		?>
	<a class="item <?php echo $active; ?> <?php echo $item["class"]; ?>" href="<?php echo $url; ?>"><?php echo $item["text"]; ?></a>
	<?php endforeach; ?>
</div>