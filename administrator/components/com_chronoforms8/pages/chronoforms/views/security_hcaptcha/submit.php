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
	if(isset($_POST['h-captcha-response']) && !empty($_POST['h-captcha-response'])){
        // get verify response
        $data = array(
			'secret' => $secretkey,
			'response' => $_POST['h-captcha-response']
		);

        $verify = curl_init();
        curl_setopt($verify, CURLOPT_URL,   "https://hcaptcha.com/siteverify");
        curl_setopt($verify, CURLOPT_POST, true);
        curl_setopt($verify, CURLOPT_POSTFIELDS, http_build_query($data));
        curl_setopt($verify, CURLOPT_RETURNTRANSFER, true);
        $verifyResponse = curl_exec($verify);
        $responseData = json_decode($verifyResponse);
		$this->debug[CF8::getname($element)]['response'] = $responseData;
		
        if($responseData->success){
			$this->set(CF8::getname($element), true);
			return;
		}else{
			$this->errors[] = CF8::parse($element["error"]);
			$this->set(CF8::getname($element), false);
			return;
		}
	}else{
		$this->errors[] = Chrono::l('hCaptcha value not found.');
	
		$this->debug[CF8::getname($element)][] = Chrono::l('hCaptcha value not found.');
		$this->set(CF8::getname($element), false);
	}
}else{
	$this->errors[] = Chrono::l('hCaptcha secret key is not provided.');
	
	$this->debug[CF8::getname($element)][] = Chrono::l('No secret key is provided.');
	$this->set(CF8::getname($element), false);
}