<?php
/**
* ChronoForms 8
* Copyright (c) 2023 ChronoEngine.com, All rights reserved.
* Author: (ChronoEngine.com Team)
* license:     GNU General Public License version 2 or later; see LICENSE.txt
* Visit http://www.ChronoEngine.com for regular updates and information.
**/
defined('_JEXEC') or die('Restricted access');

if(defined('_JEXEC')){
	// Joomla
	require_once(dirname(dirname(dirname(__DIR__))).DIRECTORY_SEPARATOR."libraries".DIRECTORY_SEPARATOR."chrono_lib".DIRECTORY_SEPARATOR."chrono.php");
}else{
	// WordPress
	require_once(dirname(__DIR__).DIRECTORY_SEPARATOR."chrono_lib".DIRECTORY_SEPARATOR."chrono.php");
}

class CF8Model extends ChronoModel
{
	public $Table = "#__chronoforms8";
	public $PKey = "id";
	public $Data = [];
	public $JSON = ["elements", "params"];
	public $Title = "Form";

	public $Fields = [
		"id",
		"parent_id",
		"title",
		"alias",
		"created",
		"published",
		"category",
		"elements",
		"params",
	];
}

class CF8LogModel extends ChronoModel
{
	public $Table = "#__chronoforms8_datalog";
	public $PKey = "id";
	public $Data = [];
	public $JSON = ["data"];

	public $id = 0;
	public $form_id = 0;
	public $user_id = 0;
	public $ip = "";
	public $created = "";
	public $data = "";
}

class CF8{
	public static $locales = [];
	public static $actions = [];
	public static $views = [];

	public static function multiline($string){
		$results = [];
		$lines = trim($string);
		$lines = explode("\n", $lines);
		foreach($lines as $line){
			$line = trim($line);
			if(strlen($line) == 0){
				continue;
			}
			$pts = explode("=", $line, 2);
			$nline = new stdClass();
			$nline->name = $pts[0];
			$nline->value = "";
			if(count($pts) > 1){
				$nline->value = $pts[1];
			}
			$results[] = $nline;
		}
		return $results;
	}

	public static function getlabel($element){
		if(!empty($element["label"])){
			return $element["label"];
		}else if(!empty($element["placeholder"])){
			return $element["placeholder"]["text"];
		}else{
			return $element["fieldname"];
		}
	}

	public static function getname($element){
		if(!empty($element["settings"]["name"])){
			return $element["settings"]["name"];
		}else{
			return $element["name"].$element["id"];
		}
	}

	public static function cleanfieldname($fieldname){
		return str_replace(['[n]', '[', ']'], ['', '.', ''], $fieldname);
	}

	public static function parse($code, $parse_data = [], $quote = false){
		if(!str_contains($code, "{") OR !str_contains($code, "}")){
			return $code;
		}
		$pattern = '/{([a-z_]+)([\.][^:]+)?:([^}]*?)}/i';
		$pattern = '/{([a-z_]+)(?:\.([^:]+))?:((?:[^{}]|(?R))*)}/i';
		$output = trim($code);
		preg_match_all($pattern, $output, $matches);
		// Chrono::pr($matches);

		if(!empty($matches[0])){
			
			$tags = $matches[0];

			if($quote){
				$model = new ChronoModel();
			}
			
			foreach($tags as $k => $tag){
				$result = null;

				$type_not_found = false;
				$type = $matches[1][$k];
				$method = ltrim($matches[2][$k], '/.');
				$name = trim($matches[3][$k]);
				$params = [];
				$fullname = $name;
				if(str_contains($name, " ")){
					$pts = explode(" ", $name, 2);
					$name = $pts[0];
					$params = explode(" ", $pts[1]);
				}
				
				if($type == 'var'){
					$result = ChronoApp::$instance->get($name, !empty($params) ? self::parse($params[0]) : null);

				}else if($type == 'const'){
					$result = $name;
					if($name == "null"){
						return null;
					}
					
				}else if($type == 'data'){
					if(empty($name)){
						$result = ChronoApp::$instance->data;
					}else{
						$result = ChronoApp::$instance->data($name, !empty($params) ? self::parse($params[0]) : null);
					}

					if($quote && empty($method)){
						if(!empty(Chrono::getVal(ChronoApp::$instance->settings, "data_sql_safe", "1"))){
							$result = $model->quote($result);
						}
					}
				}else if($type == 'post'){
					if(empty($name)){
						$result = $_POST;
					}else{
						$result = isset($_POST[$name]) ? $_POST[$name] : (!empty($params) ? self::parse($params[0]) : null);
					}

				}else if($type == 'session'){
					$result = ChronoSession::get($name, !empty($params) ? self::parse($params[0]) : null);

				}else if($type == 'user'){
					$result = ChronoApp::$instance->user()->$name;

				}else if($type == 'document'){
					if($name == "title"){
						if(ChronoApp::isJoomla()){
							$document = Joomla\CMS\Factory::getDocument();
							$result = $document->getTitle();
						}
					}

				}else if($type == 'date'){
					if(strlen($fullname) == 0){
						$fullname = "Y-m-d H:i:s";
					}
					$format = $fullname;
					$time = 'now';
					$zone = !empty($method) ? $method : "utc";
					if(str_contains($fullname, "=")){
						$format = explode("=", $fullname)[0];
						$time = self::parse(explode("=", $fullname)[1]);
					}

					if(is_numeric($time)){
						$time = '@'.$time;
					}
					
					if($zone == 'utc'){
						$zone = new \DateTimeZone('UTC');
					}else if($zone == 'site'){
						$zone = ChronoApp::config()->get('offset', 'UTC');
						$zone = new \DateTimeZone($zone);
					}else{
						$timezones = \DateTimeZone::listIdentifiers();
						if(is_array($timezones) AND in_array($zone, $timezones)){
							$zone = new \DateTimeZone($zone);
						}else{
							$zone = ChronoApp::config()->get('offset', 'UTC');
							$zone = new \DateTimeZone($zone);
						}
					}
					
					$date = new \DateTime($time ? $time : "", $zone);
					$date->setTimeZone($zone);
					
					$result = $date->format($format);

					// if(strlen($fullname) == 0){
					// 	$fullname = "Y-m-d H:i:s";
					// }

					// if($method == "site"){
					// 	if(str_contains($fullname, "=")){
					// 		$result = date(explode("=", $fullname)[0], strtotime(explode("=", $fullname)[1]));
					// 	}else{
					// 		$result = date($fullname);
					// 	}
					// }else{
					// 	if(str_contains($fullname, "=")){
					// 		$result = gmdate(explode("=", $fullname)[0], strtotime(explode("=", $fullname)[1]));
					// 	}else{
					// 		$result = gmdate($fullname);
					// 	}
					// }

				}else if($type == 'icon'){
					$result = Chrono::ShowIcon($fullname);

				}else if($type == 'l'){
					$result = isset(self::$locales[$fullname]) ? self::$locales[$fullname] : "";

				}else if($type == 'fn' || $type == "function" || $type == "action"){
					$result = "";

					if(isset(self::$actions[$name])){
						$result = self::$actions[$name]();
					}

				}else if($type == 'vw' || $type == "view"){
					$result = "";
					
					if(isset(self::$views[$name])){
						$result = self::$views[$name]($method == "output");
					}

				}else if($type == '_'){
					$result = Chrono::l($name);

				}else if($type == 'url'){
					if(empty($name) || $name == "current"){
						$result = Chrono::r(ChronoApp::$instance->current_url);
					}

				}else if($type == 'path'){
					if($name == "front"){
						$result = "/".trim(ChronoApp::$instance->front_path, "/\\");
					}else if($name == "root"){
						$result = "/".trim(ChronoApp::$instance->root_path, "/\\");
					}else if($name == "admin"){
						$result = "/".trim(ChronoApp::$instance->path, "/\\");
					}

				}else if($type == 'globals' || $type == 'global'){
					if(!empty(ChronoApp::$instance->settings["globals"])){
						foreach(ChronoApp::$instance->settings["globals"] as $k => $global){
							if($global["name"] == $name){
								$result = $global["value"];
							}
						}
					}

				}else if($type == 'str'){

					if($name == 'uuid'){
						$result = Chrono::uuid();

					}else if($name == 'rand'){
						if(!empty($params[0]) AND is_numeric($params[0])){
							$first = str_repeat('%04X', ceil((float)$params[0]/4));
							$result = substr(sprintf($first, mt_rand(0, 0xffff), mt_rand(0, 0xffff), mt_rand(0, 0xffff), mt_rand(0, 0xffff)), 0, $params[0]);
						}else{
							$result = mt_rand();
						}
						
					}else if($name == 'ip'){
						$result = $_SERVER['REMOTE_ADDR'];
					}else if($name == 'locale'){
						$result = ChronoApp::$instance->locale;
					}
					
				}else{
					if(!empty($parse_data) && isset($parse_data[$type])){
						if(isset($parse_data[$type][$name])){
							$result = $parse_data[$type][$name];
						}
					}else{
						$type_not_found = true;
					}
				}

				if(!is_null($result)){
					if(!empty($method)){
						$model = new ChronoModel();
						switch($method){
							case "quote":
								$result = $model->quote($result);
								break;
							case "quoteName":
								$result = $model->quoteName($result);
								break;
							case "in":
								$result = (array)$result;
								$result2 = [];
								foreach($result as $item){
									$result2[] = $model->quote($item);
								}
								$result = "(".implode(", ", $result2).")";
								break;
							case "!null":
								$result = !is_null($result);
								break;
							case "!empty":
								$result = !empty($result);
								break;
							case "encode":
								$result = json_encode($result);
								break;
							case "decode":
								$result = json_decode($result, true);
								break;
							case "join":
								$result = implode(", ", $result);
								break;
							case "br":
								$result = nl2br($result);
								break;
							case "string":
								$result = (string)$result;
								break;
							case "increment":
								$result = ((int)$result) + 1;
								break;
							case "pr":
								$result = Chrono::pr($result, true);
								break;
							case "export":
								$result = var_export($result, true);
								break;
						}
					}
				}

				if(count($tags) == 1 && strlen($tag) == strlen($output)){
					if(is_array($result)){
						return $result;
					}else if(is_null($result) && !$type_not_found){
						return $result;
					}
				}else{
					if(is_array($result)){
						$result = json_encode($result);
					}
				}

				if($type_not_found){
					// $output = substr_replace($output, $result, strpos($output, $tag), strlen($tag));
				}else{
					if(is_null($result)){
						$result = "";
					}
					$output = substr_replace($output, $result, strpos($output, $tag), strlen($tag));
				}
			}
		}

		return $output;
	}
}
