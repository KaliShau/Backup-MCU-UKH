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
if(!empty($action['url'])){
	$url = CF8::parse($action['url']);
	
	$data = [];
	
	if(!empty($action['parameters'])){
		$lines = CF8::multiline($action['parameters']);
		
		foreach($lines as $line){
			$data[$line->name] = CF8::parse($line->value);
		}
	}
	
	$query = http_build_query($data);
	$query = urldecode($query);
	
	$this->debug[CF8::getname($element)]['url'] = $url;
	$this->debug[CF8::getname($element)]['query'] = $query;
	
	$ch = curl_init($url);
	curl_setopt($ch, CURLOPT_HEADER, (int)$action['header']);// set to 0 to eliminate header info from response
	curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);// Returns response data instead of TRUE(1)

	if($action['request'] == "post"){
		curl_setopt($ch, CURLOPT_POSTFIELDS, $query);// use HTTP POST to send form data
	}
	//curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);
	$response = curl_exec($ch);//execute post and get results
	
	$this->debug[CF8::getname($element)]['error'] = curl_error($ch);
	$curlInfo = curl_getinfo($ch);

	$this->debug[CF8::getname($element)]['info'] = print_r($curlInfo, true);
	
	curl_close($ch);
	
	$this->set(CF8::getname($element), $response);

	if($curlInfo['http_code'] != 200){
		$this->debug[CF8::getname($element)]['error'] = sprintf(Chrono::l('Response status code is %s.'), $curlInfo['http_code']);
		$DisplayElements($elements_by_parent, $element["id"], "fail");
	}
}else{
	$this->debug[CF8::getname($element)]['error'] = Chrono::l('No URL is provided.');
	$this->set(CF8::getname($element), false);
	$DisplayElements($elements_by_parent, $element["id"], "fail");
}