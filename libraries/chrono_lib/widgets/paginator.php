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
if(empty($limit)){
	$limit = ChronoApp::$instance->request("list_limit");
}
$params = [];
$urlpts = parse_url(ChronoApp::$instance->current_url);
parse_str($urlpts["query"], $params);
$start_at = 0;
if(!empty(ChronoApp::$instance->data["start_at"])){
	$start_at = intval(ChronoApp::$instance->data["start_at"]);
}

$nparams = [];
$url = $urlpts["path"] . "?";
foreach ($params as $pk => $pv) {
	if ($pk == "start_at") {
		continue;
	}
	$nparams[$pk] = $pv;
	// $url .= $pk . "=" . $pv . "&";
}
$url .= http_build_query($nparams);
$url = trim($url, "&");

$max = ceil($count/$limit);
?>
<div class="nui flex basic menu bordered rounded divided white inline self-start">
	<?php for($i = 0; $i < $count; $i = $i + $limit): ?>
		<?php
			$current = ($i/$limit) + 1;
			$active = ($start_at/$limit) == 0 ? 0 : ($start_at/$limit);
			if(!in_array($current, [1, $max, $active + 1, $active + 2, $active + 3, $active, $active - 1])){
				continue;
			}
		?>
		<a class="item <?php echo ($i == $start_at) ? "active" : ""; ?>" href="<?php echo $url."&start_at=".$i; ?>"><?php echo ($i/$limit) + 1; ?></a>
	<?php endfor; ?>
	<!-- <div class="nui dropdown item">
		<svg class="fasvg icon caret-down" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 320 512">
			<path d="M137.4 374.6c12.5 12.5 32.8 12.5 45.3 0l128-128c9.2-9.2 11.9-22.9 6.9-34.9s-16.6-19.8-29.6-19.8L32 192c-12.9 0-24.6 7.8-29.6 19.8s-2.2 25.7 6.9 34.9l128 128z"></path>
		</svg>
		<div class="nui flex menu grey bordered rounded">
			<a class="item" href="?limit=20&amp;startat=100">+5</a>
			<a class="item" href="?limit=20&amp;startat=200">+10</a>
			<a class="item" href="?limit=20&amp;startat=500">+25</a>
		</div>
	</div>
	<a class="item" href="?limit=20&amp;startat=680">35</a> -->
</div>