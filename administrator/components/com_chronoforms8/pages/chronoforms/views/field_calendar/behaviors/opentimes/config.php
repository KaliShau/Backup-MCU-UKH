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
<?php new FormField(name: "elements[$id][data-opendays]", type:"select", label: "Open Days", multiple:true, options:[
	new Option(value:"0", text:"Sunday"),
	new Option(value:"1", text:"Monday"),
	new Option(value:"2", text:"Tuesday"),
	new Option(value:"3", text:"Wednesday"),
	new Option(value:"4", text:"Thursday"),
	new Option(value:"5", text:"Friday"),
	new Option(value:"6", text:"Saturday"),
]); ?>
<?php new FormField(name: "elements[$id][data-openhours]", type:"select", label: "Open Hours", multiple:true, options:[
	new Option(value:"0", text:"00:00"),
	new Option(value:"1", text:"01:00"),
	new Option(value:"2", text:"02:00"),
	new Option(value:"3", text:"03:00"),
	new Option(value:"4", text:"04:00"),
	new Option(value:"5", text:"05:00"),
	new Option(value:"6", text:"06:00"),
	new Option(value:"7", text:"07:00"),
	new Option(value:"8", text:"08:00"),
	new Option(value:"9", text:"09:00"),
	new Option(value:"10", text:"10:00"),
	new Option(value:"11", text:"11:00"),
	new Option(value:"12", text:"12:00"),
	new Option(value:"13", text:"13:00"),
	new Option(value:"14", text:"14:00"),
	new Option(value:"15", text:"15:00"),
	new Option(value:"16", text:"16:00"),
	new Option(value:"17", text:"17:00"),
	new Option(value:"18", text:"18:00"),
	new Option(value:"19", text:"19:00"),
	new Option(value:"20", text:"20:00"),
	new Option(value:"21", text:"21:00"),
	new Option(value:"22", text:"22:00"),
	new Option(value:"23", text:"23:00"),
]); ?>