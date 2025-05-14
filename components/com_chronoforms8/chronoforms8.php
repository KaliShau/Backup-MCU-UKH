<?php
/**
* ChronoForms 8
* Copyright (c) 2023 ChronoEngine.com, All rights reserved.
* Author: (ChronoEngine.com Team)
* license:     GNU General Public License version 2 or later; see LICENSE.txt
* Visit http://www.ChronoEngine.com for regular updates and information.
**/
defined('_JEXEC') or die('Restricted access');

$app = \Joomla\CMS\Factory::getApplication();

$menu = $app->getMenu();
$active = $menu->getActive();

if(!empty($active->id)){
	$itemId = $active->id;
	$mparams = $menu->getParams($itemId);

	$alias = $mparams->get('chronoform', '');
	$extra = $mparams->get('form_params', '');
	$params = [];
	if(!empty($alias)){
		$_REQUEST["chronoform"] = $alias;
		if(!empty($extra)){
			parse_str($extra, $params);
			foreach($params as $pk => $pv){
				$_REQUEST[$pk] = $pv;
			}
		}
	}
}

require_once(JPATH_ROOT."/administrator/components/com_chronoforms8/extension.php");
ChronoApp::Instance("chronoforms8")->processExtension(action:"view");