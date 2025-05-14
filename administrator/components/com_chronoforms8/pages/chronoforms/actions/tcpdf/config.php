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
<div class="equal fields">
	<?php new FormField(name: "elements[$id][file_path]", label: "Storage path", value:'{path:front}/files/test.pdf', hint:'The server path under which the file will be stored if the storage option is enabled'); ?>
	<?php new FormField(name: "elements[$id][pdf_view]", type:"select", label: "Action", options:[
		new Option(text:"Download", value:"D"),
		new Option(text:"Store", value:"F"),
		new Option(text:"Inline display", value:"I"),
		new Option(text:"Store and Inline display", value:"FI"),
		new Option(text:"Store and download", value:"FD"),
		new Option(text:"String data", value:"S"),
	], hint:'How the resulting file should be processed ?'); ?>
</div>

<div class="equal fields">
	<?php new FormField(name: "elements[$id][pdf_title]", label: "Title", hint:'The PDF file title'); ?>
	<?php new FormField(name: "elements[$id][pdf_header]", label: "Header", hint:'The PDF file header'); ?>
</div>

<div class="equal width fields">
	<?php new FormField(name: "elements[$id][pdf_page_orientation]", type:"select", label: "Orientation", options:[
		new Option(text:"Portrait", value:"P"),
		new Option(text:"Landscape", value:"L"),
	]); ?>
	<?php new FormField(name: "elements[$id][pdf_page_format]", value:"A4", label: "Page format"); ?>
</div>
<?php new FormField(name: "elements[$id][content]", type:"textarea", label: "Content", rows:10, hint:"Your PDF file content in HTML", editor:0); ?>

<?php
$behaviors = ["tcpdf.docinfo", "tcpdf.fonts", "tcpdf.page_margins", "tcpdf.passwords", "tcpdf.custom_header"];
$listBehaviors($id, $behaviors);
?>