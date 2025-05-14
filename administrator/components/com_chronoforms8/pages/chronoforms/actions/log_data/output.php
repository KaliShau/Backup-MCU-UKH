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
$data = [];
foreach ($completed_elements as $completed_element) {
	if ($completed_element["type"] == "views") {
		if (str_starts_with($completed_element["name"], "field_") && $completed_element["name"] != "field_button") {
			if (!empty($completed_element["fieldname"])) {
				$fname = CF8::cleanfieldname($completed_element["fieldname"]);
				$data[$completed_element["id"]] = Chrono::getVal($this->data, $fname);
			}
		}
	}
}
$logdata = [
	"form_id" => $row["id"],
	"user_id" => $this->user()->id,
	"ip" => !empty(Chrono::getVal($this->settings, "datalog_save_ip", "1")) ? $_SERVER['REMOTE_ADDR'] : "",
	"created" => gmdate("Y-m-d H:i:s"),
	"data" => json_encode($data),
];

$logger = CF8LogModel::instance();
if(empty($this->get("log_data"))){
	$result = $logger->Insert($logdata);
	$this->set("log_data", $logdata);
}else{
	$result = $logger->Update($logdata, where:CF8::parse("id={var.quote:log_data.id}"));
	$this->set("log_data", array_merge($this->get("log_data"), $logdata));
}

$this->debug["log_data"]['sql'] = $logger->SQL;
$this->debug["log_data"]['data'] = $this->get("log_data");