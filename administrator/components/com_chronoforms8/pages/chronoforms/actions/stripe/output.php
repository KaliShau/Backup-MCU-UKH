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
if(file_exists($this->path.DS.'libs/stripe/init.php')){
	require_once($this->path.DS.'libs/stripe/init.php');
}else{
	echo 'Payments lib not found, you can download the Payments lib here: <a target="_blank" href="https://www.chronoengine.com/downloads/chronoforms/chronoforms-v8/">Chronoforms v8 downloads</a>';
	return;
}
Chrono::addHeaderTag('<script src="https://js.stripe.com/v3/"></script>');

try {
	$stripe = new \Stripe\StripeClient($element['secret_key']);
	
	$products = CF8::parse($element["products_provider"]);

	$this->debug[CF8::getname($element)]['products'] = $products;

	if(empty($products) OR !is_array($products)){
		$this->errors[] = 'Error getting the products list.';
		$this->set($element['name'], false);

		return;
	}

	$line_items = [];
	foreach($products as $product){
		$line_items[] = [
			'price_data' => [
				'currency' => $element['currency'] ?? 'USD',
				'product_data' => [
					'name' => $product['name'],
					'description' => $product['description'],
				],
				'unit_amount' => (float)$product['price'] * 100,
			],
			'quantity' => (int)$product['quantity'],
		];
	}

	$vars = [
		'payment_method_types' => ['card'],
		'line_items' => $line_items,
		'mode' => 'payment',
		'success_url' => $element['successUrl'],
		'cancel_url' => $element['cancelUrl'],
		'payment_intent_data' => [
			'description' => CF8::parse($element["payment_description"]),
		],
	];

	if(!empty($element['parameters'])){
		$lines = CF8::multiline($element['parameters']);
		
		foreach($lines as $line){
			$vars[$line->name] = CF8::parse($line->value);
		}
	}
	
	$checkout = $stripe->checkout->sessions->create($vars);

	$this->debug[CF8::getname($element)]['checkout']['session'] = $checkout->toArray();
	$this->set(CF8::getname($element), $checkout->toArray());

	$code = '
		document.addEventListener("DOMContentLoaded", function(event) {
			var stripe = Stripe("'.$element['publishable_key'].'");
			stripe.redirectToCheckout({ sessionId: "'.$checkout->toArray()['id'].'" });
		})
	';
	if(!empty($element['redirect_button'])){
		$code = '
		document.addEventListener("DOMContentLoaded", function(event) {
			document.querySelector("'.$element['redirect_button'].'").addEventListener("click", e => {
				e.preventDefault();
				var stripe = Stripe("'.$element['publishable_key'].'");
				stripe.redirectToCheckout({ sessionId: "'.$checkout->toArray()['id'].'" });
			})
		})
	';
	}
	Chrono::addHeaderTag('<script type="text/javascript">'.$code.'</script>');

} catch(\Stripe\Exception\CardException $e) {
	// Since it's a decline, \Stripe\Exception\CardException will be caught
	echo 'Status is:' . $e->getHttpStatus() . '\n';
	echo 'Type is:' . $e->getError()->type . '\n';
	echo 'Code is:' . $e->getError()->code . '\n';
	// param is '' in this case
	echo 'Param is:' . $e->getError()->param . '\n';
	echo 'Message is:' . $e->getError()->message . '\n';
} catch (\Stripe\Exception\RateLimitException $e) {
	// Too many requests made to the API too quickly
	echo 1;
	Chrono::pr($e);
} catch (\Stripe\Exception\InvalidRequestException $e) {
	// Invalid parameters were supplied to Stripe's API
	echo 2;
	Chrono::pr($e);
} catch (\Stripe\Exception\AuthenticationException $e) {
	// Authentication with Stripe's API failed
	// (maybe you changed API keys recently)
	echo 3;
	Chrono::pr($e);
} catch (\Stripe\Exception\ApiConnectionException $e) {
	// Network communication with Stripe failed
	echo 4;
	Chrono::pr($e);
} catch (\Stripe\Exception\ApiErrorException $e) {
	// Display a very generic error to the user, and maybe send
	// yourself an email
	echo 5;
	Chrono::pr($e);
} catch (Exception $e) {
	// Something else happened, completely unrelated to Stripe
	echo 6;
	Chrono::pr($e);
}