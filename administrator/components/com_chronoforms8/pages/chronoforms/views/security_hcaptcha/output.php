<?php
/**
* ChronoForms 8
* Copyright (c) 2023 ChronoEngine.com, All rights reserved.
* Author: (ChronoEngine.com Team)
* license:     GNU General Public License version 2 or later; see LICENSE.txt
* Visit http://www.ChronoEngine.com for regular updates and information.
**/
defined('_JEXEC') or die('Restricted access');

$sk = (!empty($element["sitekey"]) ? $element["sitekey"] : Chrono::getVal($this->settings, "recaptcha.sitekey"));
?>
<?php Chrono::addHeaderTag("<script src='https://www.hCaptcha.com/1/api.js' async defer></script>"); ?>
<div class="field">
	<div class="h-captcha" data-sitekey="<?php echo $sk; ?>"></div>
</div>