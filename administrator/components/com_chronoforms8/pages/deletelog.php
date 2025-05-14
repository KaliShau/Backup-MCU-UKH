<?php
/**
* ChronoForms 8
* Copyright (c) 2023 ChronoEngine.com, All rights reserved.
* Author: (ChronoEngine.com Team)
* license:     GNU General Public License version 2 or later; see LICENSE.txt
* Visit http://www.ChronoEngine.com for regular updates and information.
**/
defined('_JEXEC') or die('Restricted access');

if(!ChronoApp::$instance->DataExists("id")){
	ChronoSession::setFlash("error", "No records selected.");
	ChronoApp::$instance->Redirect(ChronoApp::$instance->extension_url."&action=datalog&form_id=".ChronoApp::$instance->data("form_id"));
}

CF8LogModel::instance()->Delete(conditions: [["id", "in", (array)ChronoApp::$instance->DataArray()["id"]]]);
ChronoSession::setFlash("success", "records deleted.");
ChronoApp::$instance->Redirect(ChronoApp::$instance->extension_url."&action=datalog&form_id=".ChronoApp::$instance->data("form_id"));
?>