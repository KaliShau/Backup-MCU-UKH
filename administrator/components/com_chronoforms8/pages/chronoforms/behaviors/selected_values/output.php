<?php
/**
* ChronoForms 8
* Copyright (c) 2023 ChronoEngine.com, All rights reserved.
* Author: (ChronoEngine.com Team)
* license:     GNU General Public License version 2 or later; see LICENSE.txt
* Visit http://www.ChronoEngine.com for regular updates and information.
**/
defined('_JEXEC') or die('Restricted access');

if(!empty($element["selected_values"])){
    $element["selected"] = [];
    foreach((array)$element["selected_values"] as $value){
        $element["selected"] = array_merge($element["selected"], (array)CF8::parse($value));
    }
}