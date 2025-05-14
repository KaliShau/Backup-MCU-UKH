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
$name = CF8::parse(trim($action['name_provider']));
$username = CF8::parse(trim($action['username_provider']));
$password = CF8::parse(trim($action['password_provider']));
$email = CF8::parse(trim($action['email_provider']));
// $block = $this->Parser->parse(trim($action['block_provider']));
// $status = trim($action['status']);
// Chrono::pr($action);
$groups = [];
if(!empty($action['groups_provider'])){
	foreach($action['groups_provider'] as $gid){
		$groups[] = $gid;
	}
}

$userData = [
	'name' => trim($name),
	'username' => trim($username),
	'email' => $email,
	'password' => trim($password),
	'block' => ((int)$action['status'] >= 1) ? 1 : 0,
	'activation' => ((int)$action['status'] >= 2) ? str_replace("-", "", Chrono::uuid()) : '',
];

$this->set(CF8::getname($element).'_activation_token', $userData['activation']);

if(!empty($action["data_override"])){
	$lines = CF8::multiline($action["data_override"]);
	foreach($lines as $line){
		if(str_starts_with($line->name, "-")){
			$line->name = substr_replace($line->name, "", 0, 1);
			if(isset($userData[$line->name])){
				unset($userData[$line->name]);
			}
			continue;
		}
		$userData[$line->name] = CF8::parse($line->value);
	}
}

if(!empty($userData['password'])){
	$userData['password'] = JUserHelper::hashPassword($userData['password']);
}

if(empty($userData['id']) AND empty($action['where']) AND empty($userData['registerDate'])){
	$userData['registerDate'] = gmdate('Y-m-d H:i:s');
}

foreach(['name', 'username', 'password', 'email'] as $req){
	if(isset($userData[$req]) AND empty($userData[$req])){
		if(!empty($action['where'])){
			unset($userData[$req]);
		}else{
			$this->debug[CF8::getname($element)]['error'] = Chrono::l('%s is missing', $req);
			$this->set(CF8::getname($element), false);
			$this->errors[] = Chrono::l('%s is missing', $req);
			return;
		}
	}
}

// Chrono::pr($userData);

$userModel = new ChronoModel();
$userModel->Table = "#__users";
$userModel->PKey = "id";

if(empty($userData['id']) AND empty($action['where'])){
	//check if username/email are unique
	$exists = $userModel->Select(single:true, conditions:[["username", "=", $username], "OR", ["email", "=", $email]]);
	// ->where('username', $username)->where('OR')->where('email', $email)->select('first');
	
	if(!empty($exists)){
		// if(!isset($action['userexists_error']) OR !empty($action['userexists_error'])){
		// 	$this->errors[CF8::getname($element)][] = $this->Parser->parse($action['userexists_error']);
		// }
		$this->errors[CF8::getname($element)] = Chrono::l('A user with the same username or email already exists.');
		$this->debug[CF8::getname($element)]['error'] = Chrono::l('A user with the same username or email already exists.');
		$this->set(CF8::getname($element), false);
		// $this->fevents[CF8::getname($element)]['user_exists'] = true;
		return;
	}
}
// return;

//save the use
$user_id = 0;
if(empty($action['where'])){
	if(!isset($userData["params"])){
		$userData["params"] = "{}";
	}
}

// foreach($userData as $field => $value){
// 	$userModel->$field = $value;
// }

if(!empty($action['where'])){

	$exists = $userModel->Select(single:true, where:CF8::parse($action['where']));
	
	if(empty($exists)){
		$this->errors[] = Chrono::l('Could not find this user account');
		$this->debug[CF8::getname($element)]['error'] = Chrono::l('Could not find this user account');
		$this->set(CF8::getname($element), false);
		return;
	}

	$userSave = $userModel->Update($userData, where:CF8::parse($action['where']));

	$user_id = $exists['id'];
}else{
	$userSave = $userModel->Insert($userData);

	if($userSave !== false){
		$user_id = $userData["id"];
	}
}
// return;

if($userSave !== false){
	// $user_id = $userModel->id;
	$userData['id'] = $user_id;
	
	if(!empty($groups)){
		$groups = (array)$groups;
		$groups = array_filter(array_unique($groups));
		
		$userGroupModel = new ChronoModel();
		$userGroupModel->Table = "#__user_usergroup_map";

		$userGroupModel->Delete([["user_id", "=", $user_id]]);
		
		foreach($groups as $group){
			$guser = ['group_id' => $group, 'user_id' => $user_id];
			$groupSave = $userGroupModel->Insert($guser);
			
			if($groupSave === false){
				$this->debug[CF8::getname($element)]['error'] = Chrono::l('Error assignning the user to a group.');
				$this->set(CF8::getname($element), false);
				$this->errors[] = Chrono::l('Error assignning the user to a group.');
				return;
			}
		}
	}

	if(!empty($action['custom_fields'])){
		$fieldsModel = new ChronoModel();
		$fieldsModel->Table = "#__fields_values";
		
		$lines = CF8::multiline($action["custom_fields"]);
		foreach($lines as $line){
			$fieldsModel->Delete(conditions:[["field_id", "=", $line->name], "AND", ["item_id", "=", $user_id]]);
			$fdata = ['field_id' => $line->name, 'item_id' => $user_id, 'value' => CF8::parse($line->value)];
			$fieldsModel->Insert($fdata);
		}
	}
	
	$this->set(CF8::getname($element).'_activation_url', $this->root_url."index.php?option=com_users&view=registration&task=registration.activate&token=".$userData["activation"]);
	
	$this->set(CF8::getname($element), $userData);

	$DisplayElements($elements_by_parent, $element["id"], "saved");
	
	$this->debug[CF8::getname($element)]['success'] = Chrono::l('User saved successfully under id '.$user_id);
}else{
	$DisplayElements($elements_by_parent, $element["id"], "not_saved");

	$this->debug[CF8::getname($element)]['error'] = Chrono::l('Error saving user.');
	$this->set(CF8::getname($element), false);
	$this->errors[] = Chrono::l('Error saving user.');
	return;
}