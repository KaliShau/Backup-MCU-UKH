<?php

/**
 * ChronoForms 8
 * Copyright (c) 2023 ChronoEngine.com, All rights reserved.
 * Author: (ChronoEngine.com Team)
 * license:     GNU General Public License version 2 or later; see LICENSE.txt
 * Visit http://www.ChronoEngine.com for regular updates and information.
 **/
defined('_JEXEC') or die('Restricted access');

if(!empty($_FILES)){
	$file = $_FILES['backup'];
	
	if(!empty($file['size'])){
		
		$ext = strtolower(pathinfo($file['name'], PATHINFO_EXTENSION));
		
		if($ext != 'zip'){
			ChronoSession::setFlash("error", "Invalid library file extension.");
			ChronoApp::$instance->Redirect(ChronoApp::$instance->extension_url."&action=extend");
		}
		
		$target = $file['tmp_name'];
		
		if($ext == 'zip'){
			//file upload, let's extract it
			$zip = new \ZipArchive();
			$handler = $zip->open($target);
			if($handler === true){
				$extract_path = $this->path.DS.'libs'.DS;
				$zip->extractTo($extract_path);
				$zip->close();
				unlink($target);
				
				ChronoSession::setFlash("success", Chrono::l("Library installed successfully."));
			}else{
				ChronoSession::setFlash("success", Chrono::l("Error installing library."));
			}
		}
	}
}
?>
<form class="nui form" action="<?php echo ChronoApp::$instance->current_url; ?>" method="post" enctype="multipart/form-data" accept-charset="UTF-8">
	<?php
	$buttons = [
		new MenuButton(name: "upload", title: "Upload", icon: "upload", color: "blue"),
		new MenuButton(name: "close", link: true, title: "Close", icon: "xmark", color: "red", url: "action=index"),
	];
	$title = "Install Libraries";
	new MenuBar(title: $title, buttons: $buttons);
	?>

	<div class="equal fields">
	<?php new FormField(name: "backup", label: "Library File", type:"file", extensions:["zip"], hint:"You can find library files on ChronoEngine.com downloads area", code: 'data-validations=\'{"rules":[{"type":"required","prompt":"Please choose the library file."}]}\''); ?>
	</div>
</form>