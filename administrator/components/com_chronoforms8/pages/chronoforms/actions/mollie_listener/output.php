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

	$payment = $mollie->payments->get($this->data('id'));

	$this->set(CF8::getname($element), $payment);

	if ($payment->isPaid() && !$payment->hasRefunds() && !$payment->hasChargebacks()) {
		/*
			* The payment is paid and isn't refunded or charged back.
			* At this point you'd probably want to start the process of delivering the product to the customer.
			*/
		$DisplayElements($elements_by_parent, $element["id"], "complete");
	} elseif ($payment->isOpen()) {
		/*
			* The payment is open.
			*/
		$DisplayElements($elements_by_parent, $element["id"], "open");
	} elseif ($payment->isPending()) {
		/*
			* The payment is pending.
			*/
		$DisplayElements($elements_by_parent, $element["id"], "pending");
	} elseif ($payment->isFailed()) {
		/*
			* The payment has failed.
			*/
		$DisplayElements($elements_by_parent, $element["id"], "failed");
	} elseif ($payment->isExpired()) {
		/*
			* The payment is expired.
			*/
		$DisplayElements($elements_by_parent, $element["id"], "expired");
	} elseif ($payment->isCanceled()) {
		/*
			* The payment has been canceled.
			*/
		$DisplayElements($elements_by_parent, $element["id"], "canceled");
	} elseif ($payment->hasRefunds()) {
		/*
			* The payment has been (partially) refunded.
			* The status of the payment is still "paid"
			*/
		$DisplayElements($elements_by_parent, $element["id"], "refunds");
	} elseif ($payment->hasChargebacks()) {
		/*
			* The payment has been (partially) charged back.
			* The status of the payment is still "paid"
			*/
		$DisplayElements($elements_by_parent, $element["id"], "chargebacks");
	}
} catch (\Mollie\Api\Exceptions\ApiException $e) {
	echo '<div class="ui message red">API call failed: '.htmlspecialchars($e->getMessage()).'</div>';
}