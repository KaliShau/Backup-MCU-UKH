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

if(empty($action['range'])){
	$action['range'] = "A1:Z500";
}

// Google Sheets API endpoint for appending values
$apiEndpoint = "https://sheets.googleapis.com/v4/spreadsheets/".CF8::parse(trim($action['sheet_id']))."/values/Sheet1!".CF8::parse(trim($action['range'])).""; // Adjust range as needed

// Set cURL options for making the API request
$curl = curl_init();
curl_setopt($curl, CURLOPT_URL, $apiEndpoint);
curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
curl_setopt($curl, CURLOPT_HTTPHEADER, [
	'Authorization: Bearer ' . $accessToken,
]);

// Execute cURL request and capture the response
$response = curl_exec($curl);

$data = [];

// Check if the request was successful
if ($response === false) {
	$this->debug[CF8::getname($element)]['error'] = curl_error($curl);
} else {
	$temp = json_decode($response, true);
	
	// Display fetched values
	if (isset($temp['values']) && !empty($temp['values'])) {
		foreach ($temp['values'] as $row) {
			$data[] = $row;
		}
	} else {
		$this->debug[CF8::getname($element)]['msg'] = 'No data found in the spreadsheet.';
	}
}

$this->debug[CF8::getname($element)]['response'] = $response;

$this->set(CF8::getname($element), $data);

// Close cURL session
curl_close($curl);
