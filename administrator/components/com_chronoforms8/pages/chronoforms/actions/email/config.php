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
<?php new FormField(name: "elements[$id][recipients][]", type:"select", label: "Recipients", multiple:true, code:"data-additions='1' data-separators=','", hint:"Comma separated list of email address"); ?>
<?php new FormField(name: "elements[$id][subject]", label: "Subject", value: "New email from ChronoForms8"); ?>
<?php new FormField(name: "elements[$id][body]", type:"textarea", label: "Body", rows:9, value:"This is a list of form data:<br>{email:data_table}", hint:"Enter your email content, use shortcodes to get fields values.
Use {email:data_table} to get a formatted list of data.", editor:0); ?>
<div class="equal fields">
	<?php new FormField(name: "elements[$id][replyname]", label: "Reply name", hint: "This will be used when the email receiver hits reply."); ?>
	<?php new FormField(name: "elements[$id][reply]", label: "Reply email", hint: "This will be used when the email receiver hits reply."); ?>
</div>
<?php
$behaviors = ["email.from", "email.attachments", "email.php", "email.cc_bcc", "email.gpg_encryption", "email.print", "events"];
$listBehaviors($id, $behaviors);
?>