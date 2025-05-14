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
<?php if(!class_exists('Crypt_GPG')): ?>
	<div class="nui alert red block">The Crypt_GPG class is NOT loaded</div>
<?php else: ?>
	<div class="nui alert green block">The Crypt_GPG class is loaded!</div>
<?php endif; ?>

<div class="equal fields">
	<?php new FormField(name: "elements[$id][gpg_sec_key]", label: "GPG Security key"); ?>
</div>