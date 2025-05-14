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
<?php
$secretkey = !empty($element["secretkey"]) ? $element["secretkey"] : Chrono::getVal($this->settings, "recaptcha.secretkey");

if(!empty($secretkey)){
	if(function_exists('curl_version')){
		$ch = curl_init('https://www.google.com/recaptcha/api/siteverify?secret='.$secretkey.'&response='.$this->data('g-recaptcha-response'));
		curl_setopt($ch, CURLOPT_FRESH_CONNECT, 1);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
		$response = curl_exec($ch);
		curl_close($ch);
	}else if(ini_get('allow_url_fopen')){
		$response = file_get_contents('https://www.google.com/recaptcha/api/siteverify?secret='.$secretkey.'&response='.$this->data('g-recaptcha-response'));
	}else{
		$response = null;
	}
	// if(ini_get('allow_url_fopen')){
	// 	$response = file_get_contents('https://www.google.com/recaptcha/api/siteverify?secret='.$secretkey.'&response='.$this->data('g-recaptcha-response'));
	// }else{
	// 	$ch = curl_init('https://www.google.com/recaptcha/api/siteverify?secret='.$secretkey.'&response='.$this->data('g-recaptcha-response'));
	// 	curl_setopt($ch, CURLOPT_FRESH_CONNECT, 1);
	// 	curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
	// 	$response = curl_exec($ch);
	// 	curl_close($ch);
	// }
	
	$response = json_decode($response, true);
	
	$this->debug[CF8::getname($element)]['response'] = $response;
	
	if($response['success'] === true){
		$this->set(CF8::getname($element), true);
		return;
	}else{
		$this->errors[] = CF8::parse($element["error"]);
		$this->set(CF8::getname($element), false);
		return;
	}
	
}else{
	$this->errors[] = Chrono::l('reCaptcha secret key is not provided.');
	
	$this->debug[CF8::getname($element)][] = Chrono::l('No secret key is provided.');
	$this->set(CF8::getname($element), false);
}