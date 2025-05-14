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
$mainframe = Joomla\CMS\Factory::getApplication();
		
$credentials = array();
$credentials['username'] = CF8::parse($action['username_provider']);
$credentials['password'] = CF8::parse($action['password_provider']);

if(!empty(array_filter($credentials))){
	if($mainframe->login($credentials) === true){
		$this->set(CF8::getname($element), true);
		$this->debug[CF8::getname($element)]['success'] = Chrono::l('User logged in successfully.');

		$DisplayElements($elements_by_parent, $element["id"], "login_success");
	}else{
		$this->debug[CF8::getname($element)]['error'] = Chrono::l('User login failed.');
		$this->set(CF8::getname($element), false);
		$this->errors[] = CF8::parse($action['error']);

		$DisplayElements($elements_by_parent, $element["id"], "login_failed");
	}
}else{
	$this->debug[CF8::getname($element)]['error'] = Chrono::l('User login failed, missing credentials data');
	$this->set(CF8::getname($element), false);
	$this->errors[] = CF8::parse($action['error']);

	$DisplayElements($elements_by_parent, $element["id"], "login_failed");
}