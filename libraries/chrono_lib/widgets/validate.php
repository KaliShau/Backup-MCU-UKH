<?php
/**
* ChronoLibrary
* Copyright (c) 2025 ChronoEngine.com, All rights reserved.
* Author: (ChronoEngine.com Team)
* license: GNU General Public License version 2 or later; see LICENSE.txt
* Visit http://www.ChronoEngine.com for regular updates and information.
**/
defined('_JEXEC') or die('Restricted access');

$insert = true;
$found = ExtensionsModel::instance()->Select(conditions:[["name", "=", ChronoApp::$instance->extension]], single:true);
if(!is_null($found)){
	$insert = false;
	ChronoApp::$instance->data["key"] = !empty($found["settings"]["vkey"]) ? $found["settings"]["vkey"] : "";
}

if(ChronoApp::$instance->isPost){
	if(!empty(ChronoApp::$instance->data("error"))){
		ChronoSession::setFlash("error", ChronoApp::$instance->data("error"));
		die();
	}else if(isset(ChronoApp::$instance->DataArray()["valid"])){
		$value = ChronoApp::$instance->DataArray()["valid"];
		if($value == 0){
			$value = 1;
		}

		ChronoApp::$instance->validate($value);

		ChronoSession::setFlash("success", "Extension validated successfully.");
		die();

		// ChronoApp::$instance->Redirect(ChronoApp::$instance->extension_url."&action=validate");
	}else if(ChronoApp::$instance->DataExists("trial")){
		$value = 0;
		if(!is_null($found) && !empty($found["settings"][ChronoApp::$instance->domain_save])){
			$value = $found["settings"][ChronoApp::$instance->domain_save];
		}
		if(empty($value)){
			$value = time() + (10 * 24 * 60 * 60);
			ChronoApp::$instance->validate($value);
			ChronoSession::setFlash("success", "Trial period has been activated.");

			ChronoApp::$instance->Redirect(ChronoApp::$instance->extension_url."&action=validate");
		}else{
			ChronoSession::setFlash("error", "Trial has already been used.");
		}
	}
}
?>
<script>
	document.addEventListener("DOMContentLoaded", function (event) {
		document.querySelector("#validate").addEventListener("click", e => {
			document.querySelector(".nui.form").classList.add("loading");
			const xhttp = new XMLHttpRequest();
			xhttp.addEventListener("readystatechange", e => {
				if (e.target.readyState == 4 && e.target.status == 200) {
					const xhttp2 = new XMLHttpRequest();
					xhttp2.addEventListener("readystatechange", e => {
						if (e.target.readyState == 4 && e.target.status == 200) {
							window.location.href = '<?php echo ChronoApp::$instance->extension_url."&action=validate"; ?>';
						}
					})

					xhttp2.open("POST", '<?php echo ChronoApp::$instance->extension_url."&action=validate"; ?>');
					let postBody = new FormData(undefined)

					if(e.target.responseText.startsWith("invalid")){
						postBody.append("error", e.target.responseText.replace("invalid:", ""))
					}else if(e.target.responseText.startsWith("valid")){
						postBody.append("valid", JSON.parse(e.target.responseText.replace("valid:", ""))[0]["maxtime"])
						postBody.append("vkey", document.querySelector("#key").value)
					}else{
						postBody.append("error", "Error connecting to ChronoEngine.com")
					}

					xhttp2.send(postBody);
				}
			})

			xhttp.open("GET", '<?php echo "https://www.chronoengine.com/index.php?option=com_chronocontact&task=extra&chronoformname=validateLicense&ver=7&api=4&ext_name=".ChronoApp::$instance->ename.'&joomla='.((int)ChronoApp::isJoomla())."&domain_name=".ChronoApp::$instance->domain."&license_key="; ?>'+document.querySelector("#key").value);
			xhttp.send();
		})

		document.querySelector("#trial").addEventListener("click", e => {
			document.querySelector(".nui.form").classList.add("loading");
			document.querySelector(".nui.form").append(Nui.Core.create_element('<input type="hidden" name="trial">'));
			document.querySelector(".nui.form").submit();
		})
	})
</script>
<form class="nui form" action="<?php echo ChronoApp::$instance->current_url; ?>" method="post" enctype="multipart/form-data" accept-charset="UTF-8">
	<?php
	$buttons = [
		new MenuButton(name: "close", link: true, title: "Close", icon: "xmark", color: "red", url: "action=index"),
	];
	new MenuBar(title: "Validate Installation", buttons: $buttons);
	?>

	<div class="equal fields">
		<?php new FormField(name: "domain", label: "Domain name", value: ChronoApp::$instance->domain, code:"readonly='readonly'", hint:"This is auto detected and should be validated in your ChronoEngine.com account."); ?>
		<?php new FormField(name: "key", label: "<a href='https://www.chronoengine.com/my-validations' target='_blank' style='text-decoration:underline;'>Your ChronoEngine Validation Key </a>", hint: "You can find your key in your ChronoEngine.com account.<br>Get free 10 days (repeatable) if your domain is localhost or an IP address"); ?>
	</div>
	<div class="nui divider block"></div>
	<div class="equal fields">
		<button type="button" name="validate2" id="validate" class="nui button blue iconed"><?php echo Chrono::ShowIcon("check"); ?>Validate</button>
		<!-- <button type="submit" name="validate" class="nui button blue iconed"><?php echo Chrono::ShowIcon("check"); ?>Validate</button> -->
		<button type="button" name="trial" id="trial" class="nui button yellow iconed"><?php echo Chrono::ShowIcon("clock"); ?>Free 10 days Validation</button>
		<a href="https://www.chronoengine.com/shop?ref=<?php echo ChronoApp::$instance->ename; ?>-validate" target="_blank" class="nui button green">Purchase validation</a>
	</div>
</form>