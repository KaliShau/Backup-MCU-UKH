<?php
/**
* ChronoForms 8
* Copyright (c) 2023 ChronoEngine.com, All rights reserved.
* Author: (ChronoEngine.com Team)
* license:     GNU General Public License version 2 or later; see LICENSE.txt
* Visit http://www.ChronoEngine.com for regular updates and information.
**/
defined('_JEXEC') or die('Restricted access');

if(class_exists('Crypt_GPG')){
	$mySecretKeyId = trim($element['gpg_sec_key']);
	$gpg = new Crypt_GPG();
	$gpg->addEncryptKey($mySecretKeyId);
	$element["body"] = $gpg->encrypt($element["body"]);
}