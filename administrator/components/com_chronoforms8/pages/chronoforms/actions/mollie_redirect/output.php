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
try {
	require_once($this->path.'/libs/mollie/vendor/autoload.php');

	$mollie = new \Mollie\Api\MollieApiClient();
	if(empty($element['live'])){
		$mollie->setApiKey($element['api_test']);
	}else{
		$mollie->setApiKey($element['api_live']);
	}

	// if(!empty($element['parameters'])){
	// 	foreach($element['parameters'] as $parameter){
	// 		$element['payment']['metadata'][$parameter['name']] = $parameter['value'];
	// 	}
	// }
	if(!empty($action['parameters'])){
		$lines = CF8::multiline($action['parameters']);
		
		foreach($lines as $line){
			$element['payment']['metadata'][$line->name] = CF8::parse($line->value);
		}
	}

	array_walk_recursive($element['payment'], function(&$item, $key){
		$item = CF8::parse($item);
	});

	if(!empty($element['payment']['amount']['value'])){
		$element['payment']['amount']['value'] = number_format((float)$element['payment']['amount']['value'], 2);
	}

	$element['payment']['redirectUrl'] = $element['payment']['redirectUrl'];
	$element['payment']['webhookUrl'] = $element['payment']['webhookUrl'];
	// if(!empty($element['payment']['redirectUrl'])){
	// 	if(is_numeric($element['payment']['redirectUrl'])){
	// 		$element['payment']['redirectUrl'] = r3(\G3\L\Url::build($this->Parser->_url(), ['gpage' => $this->controller->FData->cdata('pages.'.$element['payment']['redirectUrl'].'.urlname')]), ['full' => true]);
	// 	}
	// }

	// if(!empty($element['payment']['webhookUrl'])){
	// 	if(is_numeric($element['payment']['webhookUrl'])){
	// 		$element['payment']['webhookUrl'] = r3(\G3\L\Url::build($this->Parser->_url(), ['gpage' => $this->controller->FData->cdata('pages.'.$element['payment']['webhookUrl'].'.urlname')]), ['full' => true, 'ssl' => true]);
	// 	}
	// }

	$vars = $element['payment'];

	if(!empty($element['parameters'])){
		foreach($element['payment']['metadata'] as $k => $v){
			$vars[$k] = $v;
		}
	}

	$this->debug[CF8::getname($element)]['vars'] = $vars;

	$payment = $mollie->payments->create($vars);

	$url = $payment->getCheckoutUrl();

	if(!empty($element['debug'])){
		echo $url;
		$this->debug[CF8::getname($element)]['data'] = $element['payment'];
	}else{
		$this->redirect($url);
	}
} catch (\Mollie\Api\Exceptions\ApiException $e) {
	echo '<div class="ui message red">API call failed: '.htmlspecialchars($e->getMessage()).'</div>';
}