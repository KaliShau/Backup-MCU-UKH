<?php

/**
 * ChronoLibrary
 * Copyright (c) 2025 ChronoEngine.com, All rights reserved.
 * Author: (ChronoEngine.com Team)
 * license: GNU General Public License version 2 or later; see LICENSE.txt
 * Visit http://www.ChronoEngine.com for regular updates and information.
 **/
defined('_JEXEC') or die('Restricted access');

if (!defined('DS')) {
	define('DS', DIRECTORY_SEPARATOR);
}

class Chrono
{
	public static $assets = [];
	public static function getVal($data, $path, $default = null)
	{
		if(is_string($path)){
			if (str_contains($path, "[")) {
				$path = trim($path, "[]");
				$path = str_replace("][", ".", $path);
				$path = str_replace("[", ".", $path);
			}

			$path = explode(".", trim($path, "."));
		}

		$result = &$data;

		foreach ($path as $key) {
			if (!isset($result[$key])) {
				if(!is_null($default)){
					return $default;
				}
				return null;
			}
			if (!is_array($result[$key])) {
				// Chrono::pr($path);
				return $result[$key];
			}
			$result = &$result[$key];
		}
		reset($result);
		return $result;
	}

	public static function pr($array = array(), $return = false, $class = '')
	{
		if (is_array($array)) {
			array_walk_recursive($array, function (&$v) {
				if (is_string($v)) {
					$v = htmlspecialchars($v);
				} else if (is_bool($v)) {
					$v = '<span class="ui text blue">' . json_encode($v) . '</span>';
				} else if (is_int($v) or is_float($v)) {
					$v = '<span class="ui text red">' . json_encode($v) . '</span>';
				} else if (is_null($v)) {
					$v = '<span class="ui text blue">NULL</span>';
				}
			});
		} else if (is_string($array)) {
			$array = htmlspecialchars($array);
		} else if (is_bool($array)) {
			$array = '<span class="ui text blue">' . json_encode($array) . '</span>';
		} else if (is_int($array) or is_float($array)) {
			$v = '<span class="ui text red">' . json_encode($array) . '</span>';
		} else if (is_null($array)) {
			$v = '<span class="ui text blue">NULL</span>';
		}

		if ($return) {
			return '<pre style="word-wrap:break-word; white-space:pre-wrap;" class="' . $class . '">' . print_r($array, $return) . '</pre>';
		} else {
			echo '<pre style="word-wrap:break-word; white-space:pre-wrap;" class="' . $class . '">';
			print_r($array, $return);
			echo '</pre>';
		}
	}

	public static function uuid()
	{
		return sprintf(
			'%04x%04x-%04x-%04x-%04x-%04x%04x%04x',
			// 32 bits for "time_low"
			mt_rand(0, 0xffff),
			mt_rand(0, 0xffff),

			// 16 bits for "time_mid"
			mt_rand(0, 0xffff),

			// 16 bits for "time_hi_and_version",
			// four most significant bits holds version number 4
			mt_rand(0, 0x0fff) | 0x4000,

			// 16 bits, 8 bits for "clk_seq_hi_res",
			// 8 bits for "clk_seq_low",
			// two most significant bits holds zero and one for variant DCE1.1
			mt_rand(0, 0x3fff) | 0x8000,

			// 48 bits for "node"
			mt_rand(0, 0xffff),
			mt_rand(0, 0xffff),
			mt_rand(0, 0xffff)
		);
	}

	public static function slug($str, $limiter = '-', $unicode = false){
		$pattern = $unicode ? '/[^\pL\pN-]+/u' : '/[^A-Za-z0-9'.$limiter.']+/';
		
		if(function_exists('mb_convert_encoding')){
			$str = mb_convert_encoding((string)$str, 'UTF-8', mb_list_encodings());
		}
		
		$str = str_replace(array("'", '"'), '', $str);
		$str = preg_replace($pattern, $limiter, $str);
		if(!empty($limiter)){
			$str = preg_replace('/['.$limiter.']+/', $limiter, $str);
		}
		$str = str_replace($limiter.$limiter, $limiter, $str);
		$str = trim($str, $limiter);
		return mb_strtolower($str, 'UTF-8');
	}

	public static function l($text, ...$vars)
	{
		if(count($vars) == 0){
			$vars = [null];
		}
		if(!ChronoApp::isJoomla()){
			return sprintf($text, ...$vars);
		}
		return sprintf(Joomla\CMS\Language\Text::_($text), ...$vars);
	}

	public static function r($url){
		if(!ChronoApp::isJoomla()){
			return $url;
		}
		return Joomla\CMS\Router\Route::_($url, false);
	}

	public static function addUrlParam($url, $params = []){
		if(empty($params)){
			return $url;
		}
		if(str_contains($url, "?")){
			$parts = explode("?", $url);
			parse_str($parts[1], $coms);
			$params = array_merge($coms, $params);
			$url = $parts[0];
		}
		return $url."?".http_build_query($params);
	}

	public static function ShowIcon($icon)
	{
		$pts = explode(" ", $icon);

		$type = "solid";
		if (count($pts) > 0 && in_array($pts[count($pts) - 1], ["regular", "brands"])) {
			$type = $pts[count($pts) - 1];
		}

		$path = "/assets/fasvgs/" . $type . "/" . $pts[0] . ".svg";
		if(!file_exists(__DIR__ . $path)){
			return "";
		}
		$myfile = fopen(__DIR__ . $path, "r") or die("Unable to open file.");
		$data = fread($myfile, filesize(__DIR__ . $path));
		fclose($myfile);

		$data = str_replace('<!--! Font Awesome Free 6.2.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free (Icons: CC BY 4.0, Fonts: SIL OFL 1.1, Code: MIT License) Copyright 2022 Fonticons, Inc. -->', '', $data);
		$data = str_replace('<svg ', '<svg class="fasvg icon ' . $icon . '" ', $data);
		return $data;
	}

	public static function loadAsset($path, $read = true)
	{
		if(!file_exists(__DIR__ . $path)){
			die("File does not exist:".__DIR__ . $path);
		}
		$myfile = fopen(__DIR__ . $path, "r") or die("Unable to open file:".__DIR__ . $path);
		$data = fread($myfile, filesize(__DIR__ . $path));
		fclose($myfile);

		if (str_ends_with($path, ".css")) {
			self::$assets[$path] = "<style>" . $data . "</style>";
		} else if (str_ends_with($path, ".js")) {
			if(!ChronoApp::isJoomla() && !ChronoApp::isAdmin()){
				wp_register_script( 'dummy-handle-header', '' );
				wp_enqueue_script( 'dummy-handle-header' );
				wp_add_inline_script( 'dummy-handle-header', $data );
	
				return;
			}

			self::$assets[$path] = "<script>" . $data . "</script>";
		}
	}

	public static function addHeaderTag($code){
		if(!ChronoApp::isJoomla()){
			echo $code;
			return;
			// $custom_tag = function() use($code) {
			// 	echo $code;
			// };
			// // Add hook for admin <head></head>
			// add_action('admin_head', $custom_tag);
			// // Add hook for front-end <head></head>
			// add_action('wp_head', $custom_tag);

			// return;
		}
		$document = \Joomla\CMS\Factory::getDocument();
		$document->addCustomTag($code);
	}

	public static function loadEditor(){
		Chrono::loadAsset("/assets/nui.tinymce.min.js");

		if(ChronoApp::isJoomla()){
			$version = new \Joomla\CMS\Version();
			$version = explode('.', $version->getShortVersion())[0];
			if((int)$version>= 4){
				Chrono::addHeaderTag('<script src="'.ChronoApp::$instance->root_url.'media/vendor/tinymce/tinymce.min.js?nocache"></script>');
			}else{
				Chrono::addHeaderTag('<script src="'.ChronoApp::$instance->root_url.'media/editors/tinymce/tinymce.min.js?nocache"></script>');
			}
		}else{
			Chrono::addHeaderTag('<script src="'.ChronoApp::$instance->root_url.'wp-includes/js/tinymce/tinymce.min.js?nocache"></script>');
		}
	}
}

class ChronoPage{
	public static function SaveSettings(){
		if (ChronoApp::$instance->isPost) {
			if (ChronoApp::$instance->DataExists("id") && strlen(ChronoApp::$instance->Data("id")) > 0) {
				$extension = ExtensionsModel::instance()->Select(conditions:[["name", "=", ChronoApp::$instance->extension]], single:true);
				if(isset($extension["settings"]["vkey"])){
					unset($extension["settings"]["vkey"]);
				}
				$_POST["settings"] = array_merge($extension["settings"], $_POST["settings"]);
				$result = ExtensionsModel::instance()->Update($_POST);
		
				if ($result === false) {
					ChronoSession::setFlash("error", Chrono::l("Error updating settings"));
				}else{
					ChronoSession::setFlash("success", Chrono::l("Settings updated successfully."));
				}
			} else {
				$data = $_POST;
				$result = ExtensionsModel::instance()->Insert($data);
		
				if ($result === true) {
					ChronoSession::setFlash("success", Chrono::l("Settings saved successfully."));
					ChronoApp::$instance->redirect(ChronoApp::$instance->extension_url . "&action=settings");
				}else{
					ChronoSession::setFlash("error", Chrono::l("Error saving settings"));
				}
			}
		}
	}

	public static function ReadSettings(){
		$extension = ExtensionsModel::instance()->Select(conditions:[["name", "=", ChronoApp::$instance->extension]], single:true);
		ChronoApp::$instance->MergeData($extension);
	}

	public static function SettingsHTML(){
		// $crumbs = [
		// 	new Breadcrumb(title:ChronoApp::$instance->title, action:"index"),
		// ];
		// new BreadcrumbsBar($crumbs);
		$buttons = [
			new MenuButton(name: "save", title: "Save", icon: "floppy-disk", color: "blue"),
			new MenuButton(name: "close", link: true, title: "Close", icon: "xmark", color: "red", url: "action=index"),
		];
		new MenuBar(title: "Settings", buttons: $buttons);
		new FormField(name: "id", label: "ID", type: "hidden");
		new FormField(name: "name", value: ChronoApp::$instance->extension, type: "hidden");
		// new FormField(name: "settings[".ChronoApp::$instance->domain_save."]", type: "hidden");
		// // new FormField(name: "settings[vkey]", type: "hidden");
		// new FormField(name: "settings[vtime]", type: "hidden");
	}

	public static function Save($model){
		if (ChronoApp::$instance->isPost) {
			if(!empty(ChronoApp::$instance->Data("title")) && empty(ChronoApp::$instance->Data("alias"))){
				ChronoApp::$instance->data["alias"] = Chrono::slug(ChronoApp::$instance->Data("title"));
				$_POST["alias"] = ChronoApp::$instance->data["alias"];
			}
			if (ChronoApp::$instance->DataExists("id") && strlen(ChronoApp::$instance->Data("id")) > 0) {
				$result = $model->Update(ChronoApp::$instance->data);
		
				if ($result === false) {
					ChronoSession::setFlash("error", Chrono::l("Error updating ".$model->Title));
				}else{
					ChronoSession::setFlash("success", Chrono::l($model->Title." updated successfully."));
				}
			} else {
				$data = ChronoApp::$instance->data;//$_POST;
				$result = $model->Insert($data);
		
				if (!empty($result)) {
					ChronoSession::setFlash("success", Chrono::l($model->Title." saved successfully."));
					ChronoApp::$instance->redirect(ChronoApp::$instance->extension_url . "&action=".ChronoApp::$instance->action."&id=" . $data["id"]);
				}else{
					ChronoSession::setFlash("error", Chrono::l("Error saving ".$model->Title));
				}
			}
		}
	}

	public static function Delete($model, $next = "index"){
		if(!ChronoApp::$instance->DataExists("id")){
			ChronoSession::setFlash("error", "You did not select any ".$model->Title);
			ChronoApp::$instance->Redirect(ChronoApp::$instance->extension_url."&action=".$next);
		}
		
		$model->Delete(conditions: [["id", "in", (array)ChronoApp::$instance->DataArray()["id"]]]);
		ChronoSession::setFlash("success", $model->Title."(s) deleted.");
		ChronoApp::$instance->Redirect(ChronoApp::$instance->extension_url."&action=".$next);
	}

	public static function Toggle($model, $next = "index"){
		if(!ChronoApp::$instance->DataExists("id")){
			ChronoSession::setFlash("error", "You did not select any ".$model->Title);
			ChronoApp::$instance->Redirect(ChronoApp::$instance->extension_url."&action=".$next);
		}
		
		$result = $model->Update(["id" => ChronoApp::$instance->data("id"), ChronoApp::$instance->data("field") => ChronoApp::$instance->data("value")]);
		if($result){
			ChronoSession::setFlash("success", $model->Title."(s) updated.");
		}else{
			ChronoSession::setFlash("error", "error updating ".$model->Title);
		}
		
		ChronoApp::$instance->Redirect(ChronoApp::$instance->extension_url."&action=".$next);
	}

	public static function Copy($model, $next = "index"){
		if(!empty(ChronoApp::$instance->DataArray()["id"])){
			$rows =  $model->Select(conditions: [["id", "in", (array)ChronoApp::$instance->DataArray()["id"][0]]]);

			if(!empty($rows)){
				foreach($rows as $row){
					unset($row["id"]);
					$row["alias"] = $row["alias"].gmdate("Ymd-His");
					$result = $model->Insert($row);
				}
			}
	
			ChronoSession::setFlash("success", Chrono::l($model->Title." copied successfully."));
		}else{
			ChronoSession::setFlash("error", "error saving ".$model->Title);
		}
		
		ChronoApp::$instance->redirect(ChronoApp::$instance->extension_url . "&action=".$next);
	}
}

class ChronoApp
{
	public $ename;
	public $extension;
	public $extension_url;
	public $current_url;
	public $root_url;
	public $title;
	public $data;
	public $isPost = false;
	public $path = "";
	public $front_path = "";
	public $root_path = "";
	public static $instance;
	public $debug = [];
	public $vars = [];
	public $vars2 = [];
	public $errors = [];
	public $settings = [];
	public $domain = "";
	public $domain_save = "";
	public $locale = "";
	public $sectoken = "";
	public $assets_loaded = false;
	public $action = "";
	public $nav = [];
	public $redirected = false;

	public static function Instance($extension, $title = "", $nav = [])
	{
		static $instances;
		if (!empty($instances[$extension])) {
			return $instances[$extension];
		}

		$app = new ChronoApp();

		$app->nav = $nav;
		$app->ename = $extension;
		$app->isPost = ($_SERVER['REQUEST_METHOD'] === "POST");


		if(ChronoApp::isJoomla()){
			$uri = Joomla\CMS\Uri\Uri::getInstance();
			$uri_base = $uri->base(true);

			$app->extension = "com_" . $extension;
			$app->extension_url = $uri_base . "/index.php?option=" . $app->extension;
			$app->current_url = $uri->toString();
			$app->root_url = $uri->root();
			$app->path = JPATH_ROOT.DS."administrator".DS."components".DS."com_". $extension.DS;
			$app->front_path = JPATH_ROOT.DS."components".DS."com_". $extension.DS;
			$app->root_path = JPATH_ROOT.DS;
		}else{
			$app->extension = $extension;
			// $app->extension_url = plugins_url().'/'.$app->extension;
			$app->extension_url = home_url("wp-admin/admin.php?page=".$extension);
			$protocol = (!empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] !== 'off' || $_SERVER['SERVER_PORT'] == 443) ? "https://" : "http://";
			$app->current_url = $protocol.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
			$app->root_url = home_url("/");
			$app->root_path = dirname(dirname(dirname(__FILE__))).DIRECTORY_SEPARATOR;
			$app->path = $app->root_path.$extension.DIRECTORY_SEPARATOR."admin".DS;
			$app->front_path = $app->root_path.$extension.DIRECTORY_SEPARATOR."front".DS;

			$_POST = stripslashes_deep($_POST);
		}


		$app->title = $title;
		$app->data = array_replace_recursive($_REQUEST, $_GET, $_POST);
		$domain = $_SERVER["HTTP_HOST"];
		if(str_contains($domain, ":")){
			$domain = explode(":", $domain)[0];
		}
		$app->domain = $domain;
		$app->domain = str_replace("www.", "", $app->domain);
		$app->domain_save = str_replace(".", "_", $app->domain);
		$app->locale = self::isJoomla() ? Joomla\CMS\Factory::getLanguage()->getTag() : get_locale();
		
		$settings = ExtensionsModel::instance()->Select(conditions:[["name", "=", $app->extension]], single:true);
		if(!empty($settings)){
			$app->settings = $settings["settings"];
		}

		$instances[$extension] = $app;
		self::$instance = $instances[$extension];

		return $instances[$extension];
	}

	// public function Data($name, $default = "")
	// {
	// 	$value = Chrono::getVal($this->data, $name);
		
	// 	if (!is_null($value)) {
	// 		return $value;
	// 	}

	// 	return $default;
	// }

	public function data($name, $default = "", $set = false)
	{
		if(!$set){
			$value = Chrono::getVal($this->data, $name);
		
			if (!is_null($value)) {
				return $value;
			}
	
			return $default;
		}else{
			$this->data[$name] = $default;
		}
	}

	public function DataArray()
	{
		return $this->data;
	}

	public function DataExists($name)
	{
		return !is_null(Chrono::getVal($this->data, $name));
	}

	public function MergeData($row)
	{
		if (!is_null($row)) {
			// foreach ($row as $k => $v) {
			// 	$this->data[$k] = $v;
			// }
			$this->data = array_merge($this->data, $row);
			// $this->data = array_merge($row, $this->data); // this breaks form saving
		}
	}

	public function SetData($k, $v)
	{
		$this->data[$k] = $v;
	}

	public function request($k)
	{
		return $this->config()->get($k);
	}

	public static function Redirect($url)
	{
		if(!ChronoApp::isJoomla()){
			wp_redirect($url);
			exit;
		}

		Joomla\CMS\Factory::getApplication()->redirect($url);
		ChronoApp::$instance->redirected = true;
	}

	public static function isAdmin()
	{
		if(!ChronoApp::isJoomla()){
			return is_admin();
		}

		return Joomla\CMS\Factory::getApplication()->isClient('administrator');
	}

	public static function isJoomla()
	{
		return defined('_JEXEC');
	}

	public function processExtension($action = "", $params = [])
	{
		if((int)explode(".", phpversion())[0] < 8){
			echo "PHP 8 or later is required.";
			return;
		}

		if ($this->isAdmin()) {
			if(!ChronoApp::isJoomla()){
				
			}else{
				if (!Joomla\CMS\Factory::getUser()->authorise('core.manage', $this->extension)) {
					\Joomla\CMS\Factory::getApplication()->enqueueMessage("You are not authorized to access this page.", "error");
					return;
				}
	
				$model = new ChronoModel();
				$model->Table = "#__viewlevels";
				$levels = $model->Select();
				$this->set("app_viewlevels", $levels);
			}
		}

		if ($this->data('output') != "component") {
			if(!$this->assets_loaded){
				Chrono::loadAsset("/assets/nui.min.css");
				if(!ChronoApp::isJoomla()){
					Chrono::loadAsset("/assets/wordpress.css");
				}else{
					Chrono::loadAsset("/assets/joomla.css");
				}
				Chrono::loadAsset("/assets/nui.min.js");
				Chrono::loadAsset("/assets/boot.min.js");
				// $this->assets_loaded = true;
			}

			// if($this->isAdmin() && $this->data('action') != "validate"){
			// 	$v = $this->validated(true);
			// 	if ($v === false) {
			// 		echo '<div class="nui alert orange">' . $this->title . ' is not validated and some features are disabled or not available, <a style="text-decoration:underline;" href="' . $this->extension_url . '&action=validate">Validate Now</a>.</div>';
			// 	}else{
			// 		$found = ExtensionsModel::instance()->Select(conditions: [["name", "=", $this->extension]], single: true);
			// 		if($found != null){
			// 			if(empty($found["settings"]["vtime"]) || !is_int($found["settings"]["vtime"])){
			// 				$found["settings"]["vtime"] = 0;
			// 			}
			// 			if($found["settings"]["vtime"] + (30 * 24 * 60 * 60) < time() || $found["settings"]["vtime"] > time()){
			// 				ChronoSession::setFlash("error", "Please re-validate your ".$this->title." installation in order to access the admin panel.");
			// 				$action = "validate";
			// 			}
			// 		}
			// 	}
			// }

			if ($this->isAdmin()) {
				if(self::isJoomla()){
					Joomla\CMS\Toolbar\ToolbarHelper::title($this->title, '');
				}
			}
		}

		if(empty($action)){
			$action = $this->data('action');
		}
		if(!empty($params)){
			foreach($params as $kp => $param){
				$this->data[$kp] = $param;
			}
		}

		if (strlen($action) == 0) {
			$action = "index";
		}
		$this->action = $action;
		$file_path = $this->path . "/pages/" . $action . ".php";
		if($action == "validate"){
			$file_path = __DIR__ . "/widgets/validate.php";
		}
		if (file_exists($file_path)) {
			$app = $this;

			ob_start();

			if (empty($this->data("output"))) {
				if($this->isAdmin() && $this->data('action') != "validate"){
					$v = $this->validated(true);
					if ($v === false) {
						// echo '<div class="nui alert orange">' . $this->title . ' is not validated and some features are disabled or not available, <a style="text-decoration:underline;" href="' . $this->extension_url . '&action=validate">Validate Now</a>.</div>';
					}else{
						$found = ExtensionsModel::instance()->Select(conditions: [["name", "=", $this->extension]], single: true);
						if($found != null){
							if(empty($found["settings"]["vtime"]) || !is_int($found["settings"]["vtime"])){
								$found["settings"]["vtime"] = 0;
							}
							if($found["settings"]["vtime"] + (30 * 24 * 60 * 60) < time() || $found["settings"]["vtime"] > time()){
								ChronoSession::setFlash("error", "Please re-validate your ".$this->title." installation in order to access the admin panel.");
								$action = "validate";
								$file_path = __DIR__ . "/widgets/validate.php";
							}
						}
					}
				}
			}

			if(ChronoApp::$instance->isAdmin()){
				if (empty($this->data("output"))) {
					$v = ChronoApp::$instance->validated();
					if ($v === false) {
						echo '<a class="nui label rounded red inverted underlined block bold" href="'.ChronoApp::$instance->extension_url . '&action=validate">'.Chrono::ShowIcon("up-right-from-square").ChronoApp::$instance->title.' Free Version, few features are limited to Premium version, Click to Validate.</a>';
					}else if ($v === true) {
						echo '<span class="nui label rounded green inverted block">'.ChronoApp::$instance->title.' Premium</span>';
					}else{
						if(intval($v) > time()){
							echo '<a class="nui label rounded green underlined block bold" href="'.ChronoApp::$instance->extension_url . '&action=validate">'.Chrono::ShowIcon("up-right-from-square").ChronoApp::$instance->title.' Premium, expires '.gmdate("d M Y, H:m", intval($v)).'</a>';
						}else{
							echo '<a class="nui label rounded red underlined block bold" href="'.ChronoApp::$instance->extension_url . '&action=validate">'.Chrono::ShowIcon("up-right-from-square").ChronoApp::$instance->title.' Free Version, Last validation expired '.gmdate("d M Y, H:m", intval($v)).', few features are limited to Premium version, Click to Validate.</a>';
						}
					}

					if(file_exists(ChronoApp::$instance->path."sql".DS."update.sql")){
						if(filemtime(ChronoApp::$instance->path."sql".DS."update.sql") > Chrono::getVal($this->settings, "utime", 0)){
							ChronoApp::$instance->updated();
						}
					}
				}
			}

			if(file_exists($this->path . "/pages/app.php")){
				require($this->path . "/pages/app.php");
			}
			// ob_start();
			if(file_exists($this->path . "/pages/parts/notice.php")){
				require($this->path . "/pages/parts/notice.php");
			}
			if(file_exists($this->path . "/pages/parts/menubar.php")){
				require($this->path . "/pages/parts/menubar.php");
			}
			require($file_path);
			$output = ob_get_clean();

			if(str_contains($output, "data-imask")){
				Chrono::loadAsset("/assets/imask.min.js");
			}

			if($this->redirected){
				return;
			}

			if(!$this->assets_loaded){
				foreach(Chrono::$assets as $path => $asset_data){
					echo $asset_data;
				}
				$this->assets_loaded = true;
			}

			$this->flash();
			echo $output;
		} else {
			echo "Action file not found.";
		}

		if ($this->data("output") == "component") {
			die();
		}
	}

	public function flash()
	{
		require(__DIR__ . "/widgets/flash.php");
	}

	public function loadLanguageFile($alias = ""){
		if(self::isJoomla()){
			Joomla\CMS\Factory::getLanguage()->load($this->extension, $this->path.$alias, $this->locale, true);
		}
	}

	public function set($k, $v)
	{
		$this->vars[$k] = $v;
	}

	public function get($k, $d = null)
	{
		$value = Chrono::getVal($this->vars, $k);
		
		if (!is_null($value)) {
			return $value;
		}

		return $d;
	}

	public function globals($name, $d = null)
	{
		$value = null;

		if(!empty(ChronoApp::$instance->settings["globals"])){
			foreach($this->settings["globals"] as $k => $global){
				if($global["name"] == $name){
					$value = $global["value"];
				}
			}
		}
		
		if (!is_null($value)) {
			return $value;
		}

		return $d;
	}

	// public function MergeVars($row)
	// {
	// 	if (!is_null($row)) {
	// 		// foreach ($row as $k => $v) {
	// 		// 	$this->data[$k] = $v;
	// 		// }
	// 		$this->vars = array_merge($row, $this->vars);
	// 	}
	// }

	// public function validate($name, $rule, $error)
	// {
	// 	$data = Chrono::getVal($this->data, $name);
		
	// 	switch ($rule) {
	// 		case "required":
	// 			if (
	// 				is_null($data) || 
	// 				(is_string($data) && strlen($data) == 0) ||
	// 				(is_array($data) && count($data) == 0)
	// 			) {
	// 				$this->errors[$name] = $error;
	// 			}
	// 			break;
	// 	}
	// }

	public function user()
	{
		if(ChronoApp::isJoomla()){
			$user = Joomla\CMS\Factory::getUser();
			return $user;
		}else{
			$current_user = wp_get_current_user();

			$user = new stdClass();
			$user->id = $current_user->ID;
			$user->username = $current_user->user_login;
			$user->email = $current_user->user_email;
			$user->name = !empty($current_user->user_first) ? $current_user->user_first." ".$current_user->user_last : "";

			return $user;
		}
	}

	public static function mailer()
	{
		if(ChronoApp::isJoomla()){
			return Joomla\CMS\Factory::getMailer();
		}else{
			$mailer = new ChronoWPMail();
			return $mailer;
		}
	}

	public static function config()
	{
		if(ChronoApp::isJoomla()){
			return Joomla\CMS\Factory::getConfig();
		}else{
			$config = new ChronoWPConfig();
			return $config;
		}
	}

	public function validated($bool = false)
	{
		static $read = [];
		static $found = [];
		if(empty($read[$this->ename])){
			$found[$this->ename] = ExtensionsModel::instance()->Select(conditions: [["name", "=", $this->extension]], single: true);
			$read[$this->ename] = true;
		}
		
		if (!is_null($found[$this->ename])) {
			if (!empty($found[$this->ename]["settings"][$this->domain_save])) {
				if ($found[$this->ename]["settings"][$this->domain_save] == 1) {
					return true;
				} else {
					if($bool === true){
						$v = $found[$this->ename]["settings"][$this->domain_save];
						return (is_numeric($v) && (intval($v) > time()));
					}else{
						return $found[$this->ename]["settings"][$this->domain_save];
					}
				}
			}
		}

		return false;
	}

	public function validate($value)
	{
		$insert = true;
		$data = ExtensionsModel::instance()->Select(conditions:[["name", "=", $this->extension]], single:true);
		if(!is_null($data)){
			$insert = false;
		}

		$vkey = !empty($this->DataArray()["vkey"]) ? $this->DataArray()["vkey"] : "";
		if($insert){
			$data = ["name" => $this->extension];
			$data["settings"][$this->domain_save] = $value;
			$data["settings"]["vkey"] = $vkey;
			$data["settings"]["vtime"] = time();
			ExtensionsModel::instance()->Insert($data);
		}else{
			$data["settings"][$this->domain_save] = $value;
			$data["settings"]["vkey"] = $vkey;
			$data["settings"]["vtime"] = time();
			ExtensionsModel::instance()->Update($data);
		}
	}

	public function updated()
	{
		$insert = true;
		$data = ExtensionsModel::instance()->Select(conditions:[["name", "=", $this->extension]], single:true);
		if(!is_null($data)){
			$insert = false;
		}

		if(file_exists(ChronoApp::$instance->path."sql".DS."update.sql")){
			$sqlContent = file_get_contents(ChronoApp::$instance->path."sql".DS."update.sql");

			// Split into individual SQL statements
			$statements = explode(';', $sqlContent);

			// Execute each statement
			foreach ($statements as $statement) {
				$trimmedStatement = trim($statement);
				if (!empty($trimmedStatement)) {
					try{
						$result = ExtensionsModel::instance()->Execute($trimmedStatement, silent:true);
					}catch(Exception $e){
						// ChronoSession::setFlash('error', "Update SQL Error: ".$e->getMessage());
					}
				}
			}
		}

		if($insert){
			$data = ["name" => $this->extension];
			$data["settings"]["utime"] = time();
			ExtensionsModel::instance()->Insert($data);
		}else{
			$data["settings"]["utime"] = time();
			ExtensionsModel::instance()->Update($data);
		}

		ChronoSession::setFlash('info', $this->title." SQL has been updated.");
	}
}


class ChronoWPConfig {
	public function get($key) {
		global $wpdb;
		$current_user = wp_get_current_user();

		switch($key){
			case "fromname":
				return get_user_by( 'email', get_bloginfo('admin_email') )->get('user_login');
				break;
			case "mailfrom":
				return get_bloginfo('admin_email');
				break;
			case "list_limit":
				return 20;
				break;
			case "db":
				return $wpdb->dbname;
				break;
			default:
				return "";
		}

		return "";
	}
}

class ChronoWPMail {
	public function sendMail($from_email,
		$from_name,
		$to,
		$subject,
		$body,
		$mode,//($mode == 'html') ? true : false,
		$cc,
		$bcc,
		$attachments,
		$reply_email,
		$reply_name) {
		// Define email parameters
		// $to = array('recipient1@example.com', 'recipient2@example.com');
		// $subject = 'Report Update';
		// $message = '<p>This is an <strong>HTML</strong> email with attachments.</p>';
		$headers = array(
			'Content-Type: text/html; charset=UTF-8',
			'From: '.$from_name.' <'.$from_email.'>',
		);
		// $attachments = array(WP_CONTENT_DIR . '/uploads/report.pdf'); // File path
		if(is_null($attachments)){
			$attachments = [];
		}

		// Send the email
		if ( wp_mail($to, $subject, $body, $headers, $attachments) ) {
			return true;
		} else {
			return false;
		}
	}
}

class ChronoSession
{
	public static function get($name, $default = "")
	{
		if(ChronoApp::isJoomla()){
			$session = Joomla\CMS\Factory::getSession();
			return $session->get($name, $default);
		}else{
			if(!session_id()) {
				session_start();
			}

			return (isset($_SESSION[$name]) ? $_SESSION[$name] : $default);
		}
	}

	public static function set($name, $value)
	{
		if(ChronoApp::isJoomla()){
			$session = Joomla\CMS\Factory::getSession();
			return $session->set($name, $value);
		}else{
			if(!session_id()) {
				session_start();
			}

			$_SESSION[$name] = $value;
			return true;
		}
	}
	public static function clear($name)
	{
		if(ChronoApp::isJoomla()){
			$session = Joomla\CMS\Factory::getSession();
			return $session->clear($name);
		}else{
			if(!session_id()) {
				session_start();
			}

			if(isset($_SESSION[$name])){
				unset($_SESSION[$name]);
			}
			return true;
		}
	}

	public static function setFlash($type, $msg)
	{
		if(ChronoApp::isJoomla()){
			$session = Joomla\CMS\Factory::getSession();
			$msgs = ChronoSession::getFlash($type);
			return $session->set("flash." . $type, array_merge($msgs, [$msg]));
		}else{
			if(!session_id()) {
				session_start();
			}

			$name = "flash." . $type;
			$msgs = ChronoSession::getFlash($type);
			$_SESSION[$name] = array_merge($msgs, [$msg]);
		}
	}

	public static function getFlash($type)
	{
		if(ChronoApp::isJoomla()){
			$session = Joomla\CMS\Factory::getSession();
			$result = $session->get("flash." . $type, []);
			$session->clear("flash." . $type);
			return $result;
		}else{
			if(!session_id()) {
				session_start();
			}

			$name = "flash." . $type;
			$result = (isset($_SESSION[$name]) ? $_SESSION[$name] : []);
			if(isset($_SESSION[$name])){
				unset($_SESSION[$name]);
			}
			return $result;
		}
	}
}

class ChronoModel
{
	public $Title = "Item";
	public $Table = "";
	public $PKey = "";
	public $Data = [];
	public $JSON = [];
	public $Fields = [];
	public $SQL = "";

	public $InsertID = null;
	public $DBO = null;

	public function __construct($table = "", $pkey = "")
	{
		if(!empty($table)){
			$this->Table = $table;
		}
		if(!empty($pkey)){
			$this->PKey = $pkey;
		}

		if(ChronoApp::isJoomla()){
			$this->DBO =  Joomla\CMS\Factory::getDbo();
		}else{
			global $wpdb;
			$this->DBO = $wpdb;
		}
	}

	public static function instance($array = [])
	{
		$class = get_called_class();
		return new $class();

		// foreach ($object as $k => $v) {
		// 	if (isset($array[$k])) {
		// 		$object->$k = $array[$k];
		// 	}
		// }

		// return $object;
	}

	function BeforeInsert(&$data){
		return $data;
	}

	function AfterInsert($data){
		
	}

	function AfterUpdate($data){
		
	}

	public function Insert(&$array, $duplicate = "")
	{
		$result = false;

		$array = $this->BeforeInsert($array);

		if (!empty($this->JSON)) {
			foreach ($this->JSON as $field) {
				if (isset($array[$field]) && !empty($array[$field]) && is_array($array[$field])) {
					$fson = json_encode($array[$field]);
					$array[$field] = $fson;
				}
			}
		}

		try {
			// $db = Joomla\CMS\Factory::getDbo();

			if(false && !empty($this->PKey)){
				// $obj = new stdClass();
				// foreach($array as $field => $value){
				// 	$obj->$field = $value;
				// 	// if(!in_array($field, ["Table", "PKey", "JSON", "Data"])){
				// 	// 	$obj->$field = $value;
				// 	// }
				// }
				// $result = $db->insertObject($this->Table, $obj, $this->PKey);

				// $pkey = $this->PKey;
				// $this->$pkey = $obj->$pkey;
			}else{
				// $query = $db->getQuery(true);

				$columns = [];
				$values = [];
				$default = self::instance();
				foreach($array as $field => $value){
					if(!empty($this->Fields) && !in_array($field, $this->Fields)){
						continue;
					}
					if($field == $this->PKey && empty($value)){
						continue;
					}
					$columns[] = $this->quoteName($field);
					if(is_array($value)){
						$value = json_encode($value);
					}
					if(is_null($value)){
						$values[$field] = 'NULL';
					}else{
						$values[$field] = $this->quote($value);
					}
				}

				$ignore = "";
				if($duplicate == "ignore"){
					$ignore = "IGNORE";
				}

				$sqls = ["INSERT", $ignore, "INTO", $this->quoteName($this->Table)];
				$sqls[] = "(".implode(", ", $columns).")";
				$sqls[] = "VALUES (".implode(", ", $values).")";

				if($duplicate == "update"){
					$sqls[] = "ON DUPLICATE KEY UPDATE";
					$ufields = [];
					foreach($values as $field => $value){
						$ufields[] = "$field = VALUES($field)";
					}
					$sqls[] = implode(", ", $ufields);
				}

				// Chrono::pr($sqls);
				$sql = implode(" ", $sqls);
				// Chrono::pr($sql);

				// $query
				// ->insert($this->quoteName($this->Table))
				// ->columns($this->quoteName($columns))
				// ->values(implode(',', $values));

				// $db->setQuery($query);
				if(!ChronoApp::isJoomla()){
					global $wpdb;
					$sql = str_replace("#__", $wpdb->prefix, $sql);
				}

				$this->SQL = $sql;
				$result = $this->Execute($sql);
				// false = failed, 1 = success, 0 = ignored or updated
			}
			
			if (!empty($result)) {
				$this->InsertID = $this->insertid();
				if(!empty($this->PKey)){
					$array[$this->PKey] = $this->insertid();
				}

				$this->AfterInsert($array);
			}
		} catch (Exception $e) {
			ChronoSession::setFlash("error", $e->getMessage());
		}

		return $result;
	}

	public function Update($array, $where = "")
	{
		$result = false;

		if (!empty($this->JSON)) {
			foreach ($this->JSON as $field) {
				if (isset($array[$field]) && !empty($array[$field]) && is_array($array[$field])) {
					$fson = json_encode($array[$field]);
					$array[$field] = $fson;
				}
			}
		}

		// $data = new stdClass();
		// foreach ($array as $field => $v) {
		// 	if(!empty($this->Fields) && !in_array($field, $this->Fields)){
		// 		continue;
		// 	}
		// 	$data->$field = $array[$field];
		// 	// if (isset($this->$k)) {
		// 	// 	$data->$field = $this->$k;
		// 	// }
		// }

		try {
			if(true || !empty($where)){
				// $db = Joomla\CMS\Factory::getDbo();
				// $query = $db->getQuery(true);
				$fields = [];
				foreach($array as $field => $value){
					if(!empty($this->Fields) && !is_numeric($field) && !in_array($field, $this->Fields)){
						continue;
					}
					if(is_numeric($field)){
						$fields[] = $value;
					}else if(is_null($value)){
						$fields[] = $this->quoteName($field) . ' = NULL';
					}else{
						$fields[] = $this->quoteName($field) . ' = ' . $this->quote($value);
					}
				}

				$sqls = ["UPDATE ".$this->quoteName($this->Table)];
				$sqls[] = "SET ".implode(", ", $fields);

				if(!empty($where)){
					$sqls[] = "WHERE $where";
				}else if(!empty($this->PKey) && isset($array[$this->PKey])){
					$sqls[] = "WHERE $this->PKey = ".$this->quote($array[$this->PKey]);
				}

				// Chrono::pr($sqls);

				$sql = implode(" ", $sqls);

				// $query->update($this->quoteName($this->Table))->set($fields)->where($where);

				// $db->setQuery($query);
				if(!ChronoApp::isJoomla()){
					global $wpdb;
					$sql = str_replace("#__", $wpdb->prefix, $sql);
				}
				
				$this->SQL = $sql;
				$result = $this->Execute($sql);

				if($result !== false){
					$this->AfterUpdate($array);
				}
			}else{
				// $result = Joomla\CMS\Factory::getDbo()->updateObject($this->Table, $data, $this->PKey);
			}
		} catch (Exception $e) {
			ChronoSession::setFlash("error", $e->getMessage());
		}

		return $result;
	}

	public function insertid(){
		if(ChronoApp::isJoomla()){
			return $this->DBO->insertid();
		}else{
			return $this->DBO->insert_id;
		}
	}

	public function quote($string){
		if(ChronoApp::isJoomla()){
			return $this->DBO->quote($string);
		}else{
			return "'".esc_sql($string)."'";
		}
	}

	public function quoteName($string){
		if(ChronoApp::isJoomla()){
			return $this->DBO->quoteName($string);
		}else{
			return "`".esc_sql($string)."`";
		}
	}

	public function conditions($conditions)
	{
		$where2 = "";

		foreach ($conditions as $condition) {
			if (is_array($condition)) {
				if (count($condition) == 3) {
					$where2 .= $this->quoteName($condition[0]);
					$where2 .= $condition[1];
					if(strtolower($condition[1]) == "is null" || strtolower($condition[1]) == "is not null"){
						continue;
					}
					if (is_array($condition[2])) {
						$items = [];
						foreach ($condition[2] as $item) {
							$items[] = $this->quote($item);
						}
						$where2 .= "(" . implode(", ", $items) . ")";
					} else {
						$where2 .= $this->quote($condition[2]);
					}
				}
			} else {
				$where2 .= " " . $condition . " ";
			}
		}

		return $where2;
	}

	public function Select($fields = "*", $count = false, $where = "", $order = "", $order_by = false, $group_by = "", $single = false, $conditions = [], $limit = 0, $offset = 0, $paging = false, $sql = "", $alias = "", $joins = [], $key = "")
	{
		// $class = get_called_class();
		// $object = $class::instance();

		$sqls = [];
		if(empty($sql)){
			$sqls[] = "SELECT";

			// $query = $db->getQuery(true);
	
			if($count && empty($group_by)){
				$fields = 'COUNT(*)';
			}
	
			if(is_array($fields)){
				// $query->select($this->quoteName(array_keys($fields), array_values($fields)));
				$sql_fields = [];
				foreach($fields as $k => $v){
					if(str_contains($k, "*")){
						$sql_fields[] = $k;
					}else{
						if(is_numeric($k)){
							$sql_fields[] = $this->quoteName($v)." AS ".$this->quote($v);
						}else{
							$sql_fields[] = $this->quoteName($k)." AS ".$this->quote($v);
						}
					}
				}
				$sqls[] = implode(", ", $sql_fields);
			}else{
				// $query->select($fields);
				$sqls[] = $fields;
			}
			
			// $query->from($this->quoteName($this->Table));
	
			$sqls[] = "FROM ".$this->quoteName($this->Table);

			if(!empty($alias)){
				$sqls[] = "AS ".$this->quoteName($alias);
			}

			if(!empty($joins)){
				foreach($joins as $join){
					$sqls[] = $join["type"]." JOIN ".$join["table"]." AS ".$this->quoteName($join["alias"])." ON ".$join["on"];
				}
			}
	
			if (strlen($where) > 0) {
				// $query->where($where);
				$sqls[] = "WHERE $where";
			}
	
			if (!empty($conditions)) {
				// $query->where(self::conditions($conditions));
				$sqls[] = "WHERE ".self::conditions($conditions);
			}
	
			// Chrono::pr($sqls);
			// $sql = implode(" ", $sqls);
		}else{
			$sqls[] = $sql;
		}

		if (!empty($group_by)) {
			$sqls[] = "GROUP BY ".$group_by;
		}

		if(!$count){
			if (strlen($order) > 0) {
				if (!empty($order_by) && ChronoApp::$instance->DataExists("order_by") && strlen(ChronoApp::$instance->data("order_by"))) {
					$order_string = str_replace([" ", "("], "", ChronoApp::$instance->data("order_by"));
					// $query->order(str_replace(":", " ", $order_string));
					$sqls[] = "ORDER BY ".str_replace(":", " ", $order_string).", ".$order;
				}else{
					$sqls[] = "ORDER BY ".$order;
				}
			}else{
				if (!empty($order_by)) {
					if(ChronoApp::$instance->DataExists("order_by") && strlen(ChronoApp::$instance->data("order_by")) > 0){
						$order_string = str_replace([" ", "("], "", ChronoApp::$instance->data("order_by"));
						// $query->order(str_replace(":", " ", $order_string));
						$sqls[] = "ORDER BY ".str_replace(":", " ", $order_string);
					}
				}
			}
		}

		if(!empty($paging)){
			$start_at = 0;
			if(ChronoApp::$instance->DataExists("start_at") && strlen(ChronoApp::$instance->data("start_at")) > 0 && is_numeric(ChronoApp::$instance->data("start_at"))){
				$start_at = intval(ChronoApp::$instance->data("start_at"));
			}
			if(!empty($limit)){
				if(is_numeric($limit) && is_numeric($start_at)){
					// $query->setLimit($limit, $start_at);
					$sqls[] = "LIMIT $limit OFFSET $start_at";
				}
			}else{
				$list_limit = ChronoApp::$instance->request("list_limit");
				if(is_numeric($list_limit) && is_numeric($start_at)){
					// $query->setLimit($list_limit, $start_at);
					$sqls[] = "LIMIT ".$list_limit." OFFSET $start_at";
				}
			}
		}else{
			if(!empty($limit)){
				if(is_numeric($limit) && is_numeric($offset)){
					// $query->setLimit($limit, $offset);
					$sqls[] = "LIMIT $limit OFFSET $offset";
				}
			}
		}

		$sql = implode(" ", $sqls);

		if($count && !empty($group_by)){
			$sql = "SELECT COUNT(*) FROM (".$sql.") AS count;";
		}

		// if(!empty($sql)){
		// 	$db->setQuery($sql);

		// 	return $db->loadAssocList();
		// }

		// Chrono::pr($sql);
		
		$db = $this->DBO;

		if(!ChronoApp::isJoomla()){
			global $wpdb;
			$sql = str_replace("#__", $wpdb->prefix, $sql);
		}

		$this->SQL = $sql;

		if(ChronoApp::isJoomla()){
			try{
				$db->setQuery($sql);
			}catch(Exception $e){
				ChronoSession::setFlash("error", $e->getMessage());
				if ($single) {
					return null;
				}
				return [];
			}
		}

		if($count){
			if(ChronoApp::isJoomla()){
				return $db->loadResult();
			}else{
				return $db->get_var($sql);
			}
		}

		if ($single) {
			if(ChronoApp::isJoomla()){
				$row = $db->loadAssoc();
			}else{
				$row = $db->get_row($sql, ARRAY_A);
			}
			if (!empty($row) && !empty($this->JSON)) {
				foreach ($this->JSON as $field) {
					if (isset($row[$field]) && strlen($row[$field]) > 0) {
						$fson = json_decode($row[$field], true);
						$row[$field] = $fson;
					} else {
						$row[$field] = [];
					}
				}
			}
			return $row;
		} else {
			if(ChronoApp::isJoomla()){
				$rows = $db->loadAssocList();
			}else{
				$rows = $db->get_results($sql, ARRAY_A);
			}
			
			if (!empty($rows) && !empty($this->JSON)) {
				foreach ($this->JSON as $field) {
					foreach ($rows as $k => $row) {
						if (isset($row[$field]) && !is_null($row[$field]) && strlen($row[$field]) > 0) {
							$fson = json_decode($row[$field], true);
							$rows[$k][$field] = $fson;
						} else {
							$rows[$k][$field] = [];
						}
					}
				}
			}

			if(!empty($key)){
				$rows2 = [];
				$multi = false;
				if(str_ends_with($key, "[]")){
					$key = str_replace("[]", "", $key);
					$multi = true;
				}
				foreach ($rows as $k => $row) {
					if($multi){
						$rows2[$rows[$k][$key]][] = $row;
					}else{
						$rows2[$rows[$k][$key]] = $row;
					}
				}

				return $rows2;
			}
			return $rows;
		}
	}

	function BeforeDelete(){
		
	}

	public function Delete($conditions, $where = "")
	{
		// $class = get_called_class();
		// $object = $class::instance();

		// $db = Joomla\CMS\Factory::getDbo();
		// $query = $db->getQuery(true);

		// $query->delete($this->quoteName($this->Table));

		$sqls = ["DELETE FROM ".$this->quoteName($this->Table)];

		// $query->where($where);

		if (!empty($where)) {
			// $query->where($where);
			$sqls[] = "WHERE $where";
		} else {
			// $query->where(self::conditions($conditions));
			$sqls[] = "WHERE ".self::conditions($conditions);
		}

		$sql = implode(" ", $sqls);

		// $db->setQuery($sql);

		$this->SQL = $sql;

		$this->BeforeDelete();
		
		return $this->Execute($sql);
	}

	public function Execute($sql, $silent = false){
		$result = false;
		if(!ChronoApp::isJoomla()){
			global $wpdb;
			$sql = str_replace("#__", $wpdb->prefix, $sql);
		}
		try {
			$db = $this->DBO;

			if(ChronoApp::isJoomla()){
				$db->setQuery($sql);
				$result = $db->execute();
				$result = $db->getAffectedRows();
			}else{
				$result = $db->query($sql);
			}
		} catch (Exception $e) {
			if(!$silent){
				ChronoSession::setFlash("error", $e->getMessage());
			}
		}

		return $result;
	}

	public function Tables(){
		if(!ChronoApp::isJoomla()){
			$result = $this->DBO->get_col('SHOW TABLES');
			$tables = [];
			foreach($result as $table){
				$tables[$table] = $table;
			}
			return $tables;
		}
		$result = $this->DBO->setQuery('SHOW TABLES')->loadColumn();
		$tables = [];
		foreach($result as $table){
			$tables[$table] = $table;
		}
		return $tables;
	}

	public function Columns($table = ""){
		if(empty($table)){
			$table = $this->Table;
		}
		$tcolumns = $this->Select(sql: "SHOW FULL COLUMNS FROM ".$table);
		foreach($tcolumns as $tcolumn){
			$fields[] = $tcolumn["Field"];
		}
		return $fields;
	}

	public function PKeys($table){
		$db = $this->DBO;
		if(!ChronoApp::isJoomla()){
			return $db->get_results("SHOW KEYS FROM `".$this->quoteName($table)."` WHERE Key_name = 'PRIMARY'", ARRAY_A);//->loadAssocList("Seq_in_index", "Column_name");
		}
		return $db->setQuery("SHOW KEYS FROM `".$this->quoteName($table)."` WHERE Key_name = 'PRIMARY'")->loadAssocList("Seq_in_index", "Column_name");
	}
}

class ExtensionsModel extends ChronoModel
{
	public $Table = "#__chronog3_extensions";
	public $PKey = "id";
	public $Data = [];
	public $JSON = ["settings"];

	public $Fields = [
		"id",
		"name",
		"settings",
	];
}

class ChronoPaginator
{
	public $count = 0;

	public function __construct($count, $limit = 0)
	{
		$this->count = $count;

		require(__DIR__ . "/widgets/paginator.php");
	}
}
class DataTable
{
	public $rows = [];
	public $columns = [];

	public function __construct($rows, $columns, $count = 0, $limit = 0, $wide = false)
	{
		$this->rows = $rows;
		$this->columns = $columns;

		require(__DIR__ . "/widgets/table.php");
	}
}
class TableColumn
{
	public bool $expand = false;
	public string $name;
	public string $title = "";
	public string $class = "";
	public bool $selector = false;
	public bool $sortable = false;
	public $func;

	public function __construct($name, $title = "", $selector = false, $sortable = false, $expand = false, $func = null, $class = "")
	{
		$this->name = $name;
		$this->title = $title;
		$this->selector = $selector;
		$this->sortable = $sortable;
		$this->expand = $expand;
		$this->class = $class;
		$this->func = $func;
	}
}
class FormField
{
	public $id = "";
	public $name = "";
	public $type = "text";
	public $label = "";
	public $placeholder = "";
	public $value = "";
	public $code = "";
	public $class = "";
	public $options = [];
	public $multiple = false;
	public $hint = "";
	public $tooltip = "";
	public $rows = 3;
	public $icon = "";
	public $checked = false;
	public $params = [];
	public $errors = [];

	public function __construct($name, $id = "", $label = "", $type = "text", $value = "", $placeholder = "", $options = [], $multiple = false, $hint = "", $tooltip = "", $rows = 3, $icon = "", $class = "", $checked = false, $selected = [], $code = "", $errors = [], ...$params)
	{
		// $field = new FormField();
		$this->type = $type;
		$this->name = $name;
		$this->id = $id;
		$this->label = $label;
		$this->value = $value;
		$this->placeholder = $placeholder;
		$this->code = $code;
		$this->class = $class;
		if(!is_null($options)){
			if (is_array($options)) {
				if(!empty($options)){
					if($options == array_values($options)){
						foreach ($options as $k => $option) {
							if(!is_object($option)){
								$options[$k] = new Option(text:$option, value:$option);
							}
						}
					}else if(is_string(array_values($options)[0])){
						$options2 = [];
						foreach ($options as $value => $text) {
							$options2[] = new Option(text:$text, value:$value);
						}
						$options = $options2;
					}
				}
				// foreach($options as &$option){
				// 	if(is_null($option->text)){
				// 		$option->text = $option->value;
				// 	}
				// }
				$this->options = $options;
			} else {
				$list = explode("\n", $options);
				foreach ($list as $item) {
					$item = trim($item);
					if (strlen($item) > 0) {
						if (str_contains($item, "=")) {
							$this->options[] = new Option(text: explode("=", $item, 2)[1], value: explode("=", $item, 2)[0]);
						} else {
							$this->options[] = new Option(text: $item, value: $item);
						}
					}
				}
			}
		}

		if(!empty($selected)){
			foreach($this->options as $k => $option){
				if(in_array($option->value, $selected)){
					$this->options[$k]->selected = true;
				}
			}
		}

		$this->multiple = $multiple;
		$this->checked = $checked;
		$this->hint = $hint;
		$this->tooltip = $tooltip;
		$this->rows = $rows;
		$this->icon = $icon;
		$this->params = $params;
		$this->errors = $errors;

		$field = $this;
		require(__DIR__ . "/widgets/field.php");
	}
}
class Option
{
	public $text;
	public $value = "";
	public $header = false;
	public $selected = false;
	public $html = "";

	public function __construct($text = null, $value = "", $header = false, $selected = false, $html = "")
	{
		$this->text = $text;
		$this->value = $value;
		$this->header = $header;
		$this->selected = $selected;
		$this->html = $html;
	}
}
class BreadcrumbsBar
{
	public $breadcrumbs = [];

	public function __construct($breadcrumbs = [])
	{
		$this->breadcrumbs = $breadcrumbs;

		require(__DIR__ . "/widgets/breadcrumbs.php");
	}
}
class Breadcrumb{
	public $title = "";
	public $action = "";

	public function __construct($title = "", $action = "")
	{
		$this->title = $title;
		$this->action = $action;
	}
}
class MenuBar
{
	public $title = "";
	public $buttons = [];
	public $tabs = [];
	public $sticky = true;

	public function __construct($title, $buttons, $tabs = [], $sticky = true)
	{
		$this->title = $title;
		$this->buttons = $buttons;
		$this->tabs = $tabs;
		$this->sticky = $sticky;

		require(__DIR__ . "/widgets/topmenu.php");
	}
}
class MenuTab{
	public $title = "";
	public $action = "";
	public $active = false;

	public function __construct($title = "", $action = "", $active = false)
	{
		$this->title = $title;
		$this->action = $action;
		$this->active = $active;
	}
}
class MenuButton
{
	public $name = "";
	public $title = "";
	public $icon = "";
	public $color = "";
	public $url = "";
	public $params = "";
	public $type = "";
	public $dynamic = false;
	public $link = false;
	public $action = false;

	public function __construct($name = "", $title = "", $icon = "", $color = "", $url = "", $link = false, $dynamic = false, $action = false, $params = "", $type = "")
	{
		$this->name = $name;
		$this->title = $title;
		$this->icon = $icon;
		$this->color = $color;
		$this->url = $url;
		$this->link = $link;
		$this->dynamic = $dynamic;
		$this->action = $action;
		$this->params = $params;
		$this->type = $type;
	}
}

class ChronoEngine
{
	public static function connect($fields)
	{
		$target_url = 'https://www.chronoengine.com/index.php?option=com_chronocontact&task=extra&chronoformname=validateLicense&ver=7&api=4&ext_name='.ChronoApp::$instance->ename.'&joomla='.((int)ChronoApp::isJoomla());

		$result = 0;
		$curlInfo = "no_curl";

		if (function_exists('curl_init')) {
			$ch = curl_init();
			curl_setopt($ch, CURLOPT_URL, $target_url);
			curl_setopt($ch, CURLOPT_HEADER, 0);
			curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
			curl_setopt($ch, CURLOPT_TIMEOUT, 10);
			curl_setopt($ch, CURLOPT_POSTFIELDS, rtrim($fields, "& "));

			$output = curl_exec($ch);

			$curlInfo = curl_getinfo($ch);

			if (curl_error($ch)) {
				ChronoSession::setFlash('error', 'CURL Error: ' . curl_error($ch));

				if (ini_get('allow_url_fopen')) {
					$output = file_get_contents($target_url . '&' . rtrim($fields, "& "));
				}
			}

			curl_close($ch);
		} else if (ini_get('allow_url_fopen')) {
			$output = file_get_contents($target_url . '&' . rtrim($fields, "& "));
		} else {
			ChronoSession::setFlash('error', 'Please enable the curl library on your server in order to be able to connect to the chronoengine.com web server');
		}

		$validstatus = $output;
		// pr3($output);die();

		if (strpos($validstatus, 'valid') === 0) {
			$valresults = explode(':', $validstatus, 2);
			$valprods = json_decode($valresults[1], true);

			foreach ($valprods as $valprod) {
				if (!empty($valprod['ext'])) {
					if (!empty($valprod['maxtime'])) {
						$result = $valprod['maxtime'];
					} else {
						$result = 1;
					}
				}
			}

			if ($result > 0) {
				ChronoSession::setFlash('success', 'Validated successfully.');
			} else {
				ChronoSession::setFlash('error', 'Validation error.');
			}
		} else if (strpos($validstatus, 'invalid') === 0) {
			ChronoSession::setFlash('error', 'Validation error, you have provided incorrect data.');
			if (strpos($validstatus, ':') !== false) {
				$msg_data = explode(':', $validstatus, 2);
				ChronoSession::setFlash('info', $msg_data[1]);
			}
		} else if (strpos($validstatus, 'Error') === 0) {
			ChronoSession::setFlash('error', explode(':', $validstatus)[1]);
		} else {
			// $fields .= "&return=".ChronoApp::$instance->domain;
			// ChronoApp::$instance->Redirect($target_url . '&' . rtrim($fields, "& "));
			ChronoSession::setFlash('error', 'We could not connect to the chronoengine.com web server.');
			ChronoSession::setFlash('warning', $validstatus);
			ChronoSession::setFlash('warning', print_r($curlInfo, true));
		}

		return $result;
	}
}

class ChronoHTML{
	public static function EditorButtons($id){
		require(__DIR__."/widgets/editor_buttons.php");
	}
}

class UsersModel extends ChronoModel
{
	public $Table = "#__users";
	public $PKey = "id";
	public $Data = [];
	// public $JSON = ["params"];
	public $Title = "User";
	public $Fields = [];
}

class ChronoExternal{
	
	// Function to get access token using service account credentials
	public static function getAccessToken() {
		$authUrl = "https://www.googleapis.com/oauth2/v4/token";
		$credentials = json_decode(file_get_contents(getenv('GOOGLE_APPLICATION_CREDENTIALS')), true);

		$jwtHeader = base64_encode(json_encode([
			'alg' => 'RS256',
			'typ' => 'JWT'
		]));

		$now = time();
		$jwtClaim = base64_encode(json_encode([
			'iss' => $credentials['client_email'],
			'scope' => 'https://www.googleapis.com/auth/spreadsheets',
			'aud' => $authUrl,
			'iat' => $now,
			'exp' => $now + 3600 // Token expiration time in seconds (3600 = 1 hour)
		]));

		$jwtSignature = '';
		openssl_sign("$jwtHeader.$jwtClaim", $jwtSignature, openssl_pkey_get_private($credentials['private_key']), 'sha256');
		$jwtSignature = base64_encode($jwtSignature);

		$jwt = "$jwtHeader.$jwtClaim.$jwtSignature";

		$postData = [
			'grant_type' => 'urn:ietf:params:oauth:grant-type:jwt-bearer',
			'assertion' => $jwt
		];

		$curl = curl_init();
		curl_setopt($curl, CURLOPT_URL, $authUrl);
		curl_setopt($curl, CURLOPT_POST, true);
		curl_setopt($curl, CURLOPT_POSTFIELDS, http_build_query($postData));
		curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);

		$response = curl_exec($curl);
		$responseData = json_decode($response, true);

		if (isset($responseData['access_token'])) {
			return $responseData['access_token'];
		} else {
			echo 'Error getting access token: ' . $response;
			return null;
		}

		curl_close($curl);
	}
}

if(!function_exists("esc_attr")){
	function esc_attr($string){
		return $string;
	}
}