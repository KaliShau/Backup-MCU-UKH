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
putenv('GOOGLE_APPLICATION_CREDENTIALS='.CF8::parse(trim($action['credentials_path']))); // Path to your service account credentials JSON file
// Get the access token using the service account credentials
$accessToken = ChronoExternal::getAccessToken();

if (empty($action['method'])){
	$action['method'] = "append";
}

// Google Sheets API endpoint for appending values
$apiEndpoint = "https://sheets.googleapis.com/v4/spreadsheets/".CF8::parse(trim($action['sheet_id']))."/values/".CF8::parse(trim($action['sheet_name']))."!".CF8::parse(trim($action['range'])).":".CF8::parse(trim($action['method']))."?valueInputOption=USER_ENTERED";

// Data to be inserted into the spreadsheet
$data = [
	// ['John', 'Doe', 'john@example.com'],
	// ['Jane', 'Smith', 'jane@example.com'],
	// Add more rows as needed
];

if(!empty($action["data_override"])){
	$lines = CF8::multiline($action["data_override"]);
	foreach($lines as $line){
		$data[0][] = CF8::parse($line->name);
	}
}

$this->debug[CF8::getname($element)]['data'] = $data;

// Prepare the data payload
$postData = [
	'values' => $data
];

// Encode the data to JSON
$postDataJson = json_encode($postData);

// Set cURL options for making the API request
$curl = curl_init();
curl_setopt($curl, CURLOPT_URL, $apiEndpoint);
curl_setopt($curl, CURLOPT_POST, true);
curl_setopt($curl, CURLOPT_POSTFIELDS, $postDataJson);
curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
curl_setopt($curl, CURLOPT_HTTPHEADER, [
	'Authorization: Bearer ' . $accessToken,
	'Content-Type: application/json',
	'Content-Length: ' . strlen($postDataJson)
]);

// Execute cURL request and capture the response
$response = curl_exec($curl);

$this->debug[CF8::getname($element)]['response'] = $response;

$this->debug[CF8::getname($element)]['error'] = curl_error($curl);

// Check if the request was successful
// if ($response === false) {
// 	echo 'Error: ' . curl_error($curl);
// } else {
// 	echo 'Data successfully appended to the spreadsheet.';
// }

// Close cURL session
curl_close($curl);
