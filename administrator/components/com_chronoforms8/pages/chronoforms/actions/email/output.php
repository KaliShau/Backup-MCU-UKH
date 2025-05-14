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
$mailer = ChronoApp::mailer();
$config = ChronoApp::config();

$from_email = !empty($action["from"]) ? CF8::parse($action["from"]) : $config->get('mailfrom');
$from_name = !empty($action["fromname"]) ? CF8::parse($action["fromname"]) : $config->get('fromname');
$reply_email = !empty($action["reply"]) ? CF8::parse($action["reply"]) : null;
$reply_name = !empty($action["replyname"]) ? CF8::parse($action["replyname"]) : null;


$mode = "html";
$attachments = [];
if(!empty($action['attachments'])){
	$lines = CF8::multiline($action['attachments']);
	foreach($lines as $line){
		$attachments[] = CF8::parse($line->name);
	}
}
// Chrono::pr($action);die();
$to = isset($action["recipients"]) ? (array)$action["recipients"] : [];
foreach($to as $k => $v){
	$to[$k] = trim(CF8::parse($to[$k]));
}
$to = array_map('strtolower', $to);
$subject = CF8::parse($action["subject"]);

$body = CF8::parse($action["body"]);
if(str_contains($body, "{email:data_table}")){
	$table = '<table>';
	foreach($completed_elements as $complete){
		// Chrono::pr($complete);
		if(str_starts_with($complete["name"], "field_") && $complete["name"] != "field_button"){
			$fname = CF8::cleanfieldname($complete["fieldname"]);
			$fname = CF8::parse($fname);
			$field_value = implode("<br>", (array)$this->data($fname, ""));
			if(in_array($complete["name"], ["field_checkboxes", "field_radios", "field_select"])){
				$field_value = implode("<br>", (array)$this->get($fname.".selection", []));
			}
			$label = CF8::getlabel($complete);
			$table .= '<tr>
				<td style="vertical-align:top;"><strong>'.$label.'</strong></td>
				<td>'.$field_value.'</td>
			</tr>';
		}
	}
	$table .= '</table>';
	$body = str_replace("{email:data_table}", $table, $body);

	// echo $body;
	// return;
}

if(preg_match('/<[a-z]+>/', $body) === 0){
	$body = nl2br(CF8::parse($action["body"]));
}

if(!$this->validated(true)){
	$body .= '<br><br><a href="https://www.chronoengine.com/?ref=chronoforms8-email" target="_blank" class="chronocredits">This email was sent by ChronoForms 8</a>';
}
$body = CF8::parse($body);
$this->debug[CF8::getname($element)]['content'] = $body;

if(empty($to)){
	$this->errors[] = "Email has no recipients";
	return;
}

// $cc = array_map('strtolower', $cc);
// $bcc = array_map('strtolower', $bcc);

// take out duplicates in bcc and  then cc.
// $bcc = array_diff($bcc, $to, $cc);
// $cc = array_diff($cc, $to, $bcc);

foreach($completed_elements as $complete){
	if($complete["name"] == "field_file" && !empty($complete["behaviors"]) && in_array("field_file.attach", $complete["behaviors"])){
		$var = $this->get($complete["fieldname"]);
		if(!empty($var)){
			if(is_array($var["path"])){
				$attachments = array_merge($attachments, $var["path"]);
			}else{
				$attachments[] = $var["path"];
			}
		}
	}else if($complete["name"] == "signature" && !empty($complete["behaviors"]) && in_array("signature.attach", $complete["behaviors"])){
		$var = $this->get($complete["fieldname"]);
		if(!empty($var)){
			if(is_array($var["path"])){
				$attachments = array_merge($attachments, $var["path"]);
			}else{
				$attachments[] = $var["path"];
			}
		}
	}
}

$cc = isset($action["cc"]) ? (array)$action["cc"] : [];
$bcc = isset($action["bcc"]) ? (array)$action["bcc"] : [];

if(!empty($cc)){
	$cc = array_map('strtolower', $cc);
	foreach($cc as $k => $v){
		$cc[$k] = CF8::parse($cc[$k]);
	}

	$cc = array_diff($cc, $to, $bcc);
}

if(!empty($bcc)){
	$bcc = array_map('strtolower', $bcc);
	foreach($bcc as $k => $v){
		$bcc[$k] = CF8::parse($bcc[$k]);
	}

	$bcc = array_diff($bcc, $to, $cc);
}

if(isset($action["behaviors"]) && in_array("email.print", $action["behaviors"])){
	echo '<h2>Email "'.CF8::getname($element).'" Content:</h2>';
	echo $body;
}else{
	$result = $mailer->sendMail(
		$from_email,
		$from_name,
		$to,
		$subject,
		$body,
		($mode == 'html') ? true : false,
		$cc,
		$bcc,
		!empty($attachments) ? $attachments : null,
		$reply_email,
		$reply_name
	);
	
	if(!empty($result)){
		$DisplayElements($elements_by_parent, $element["id"], "sent");
	}else{
		$DisplayElements($elements_by_parent, $element["id"], "not_sent");
	}

	$this->set(CF8::getname($element), $result);
	$this->debug[CF8::getname($element)]['status'] = $result;
}

// if(!empty($result)){
// 	$DisplayElements($elements_by_parent, $element["id"], "success");
// }else{
// 	$DisplayElements($elements_by_parent, $element["id"], "fail");
// }

$this->debug[CF8::getname($element)]['recipients'] = $to;
$this->debug[CF8::getname($element)]['from'] = $from_name."(".$from_email.")";
$this->debug[CF8::getname($element)]['subject'] = $subject;
$this->debug[CF8::getname($element)]['attachments'] = $attachments;

if(!empty($cc)){
	$this->debug[CF8::getname($element)]['cc'] = $cc;
}
if(!empty($bcc)){
	$this->debug[CF8::getname($element)]['bcc'] = $bcc;
}