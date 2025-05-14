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
<?php new FormField(name: "elements[$id][events][]", type:"select", label: "Events", multiple:true, code:"data-additions='1' data-separators=',' data-formbuilder_dynamicevents='$id'", hint:"Comma separated list of expected return values to be triggered as events."); ?>