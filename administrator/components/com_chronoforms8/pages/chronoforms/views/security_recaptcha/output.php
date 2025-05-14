<?php
/**
* ChronoForms 8
* Copyright (c) 2023 ChronoEngine.com, All rights reserved.
* Author: (ChronoEngine.com Team)
* license:     GNU General Public License version 2 or later; see LICENSE.txt
* Visit http://www.ChronoEngine.com for regular updates and information.
**/
defined('_JEXEC') or die('Restricted access');

$site_key = "data-sitekey";
$class = "g-recaptcha";
$sk = (!empty($element["sitekey"]) ? $element["sitekey"] : Chrono::getVal($this->settings, "recaptcha.sitekey"));
$params = "";
if(!empty($element["version"]) && $element["version"] == "3"){
	$site_key = "data-sitekey3";
	$class = "g-recaptcha v3";
	$params = "?render=".$sk;
	if(!empty($element["language"])){
		$params .= "&lang=".$element["language"];
	}
}else{
	if(!empty($element["language"])){
		$params .= "?hl=".$element["language"];
	}
}
?>
<?php Chrono::addHeaderTag('<script src="https://www.google.com/recaptcha/api.js'.$params.'" async defer></script>'); ?>
<div class="field">
	<div class="<?php echo $class; ?>" <?php echo $site_key; ?>="<?php echo $sk; ?>" data-theme="light"></div>
	<?php if($class == "g-recaptcha v3"): ?>
	<textarea name="g-recaptcha-response" class="nui hidden"></textarea>
	<?php endif; ?>
</div>