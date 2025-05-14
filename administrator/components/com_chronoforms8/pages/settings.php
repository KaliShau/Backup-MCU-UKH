<?php
/**
* ChronoForms 8
* Copyright (c) 2023 ChronoEngine.com, All rights reserved.
* Author: (ChronoEngine.com Team)
* license:     GNU General Public License version 2 or later; see LICENSE.txt
* Visit http://www.ChronoEngine.com for regular updates and information.
**/
defined('_JEXEC') or die('Restricted access');

ChronoPage::SaveSettings();

ChronoPage::ReadSettings();
?>
<form class="nui form" action="<?php echo $this->current_url; ?>" method="post" enctype="multipart/form-data" accept-charset="UTF-8">
	<?php
		ChronoPage::SettingsHTML();
	?>

	<fieldset class="nui segment white bordered rounded">
		<legend class="nui bold large label grey rounded">ReCaptcha</legend>
		<div class="equal fields">
			<?php new FormField(name: "settings[recaptcha][sitekey]", label: "ReCaptcha Site Key", hint:"Global reCaptcha site key to use when the site key is empty in your reCaptcha view"); ?>
			<?php new FormField(name: "settings[recaptcha][secretkey]", label: "ReCaptcha Secret Key", hint:"Global reCaptcha secret key to use when the secret key is empty in your reCaptcha view"); ?>
		</div>
	</fieldset>

	<fieldset class="nui segment white bordered rounded">
		<legend class="nui bold large label grey rounded">Admin Settings</legend>
		<div class="equal fields">
			<?php new FormField(name: "settings[index_sort]", type:"select", label: "Sort forms by", options:[
				new Option(text:"ID ASC", value:"id asc"),
				new Option(text:"ID DESC", value:"id desc"),
				new Option(text:"Title ASC", value:"title asc"),
				new Option(text:"Title DESC", value:"title desc"),
			], hint:"The field to use for sorting forms."); ?>
			<?php new FormField(name: "settings[datalog_limit]", label: "DataLog Records#", value:20, hint:"Number of records to show on each Data Log list page"); ?>
			<?php new FormField(name: "settings[datalog_save_ip]", type:"select", label: "DataLog Save IP", options:[
				new Option(text:"Yes", value:"1"),
				new Option(text:"No", value:"0"),
			], hint:"Save the IP address of user when saving a datalog entry ?"); ?>
			<?php //new FormField(name: "settings[categories]", type:"select", label: "Forms Categories", multiple:true, code:"data-additions='1' data-separators=','", hint:"Comma separated list of Categories to assign to your forms"); ?>
		</div>
	</fieldset>

	<fieldset class="nui segment white bordered rounded">
		<legend class="nui bold large label grey rounded">Form editor Settings</legend>
		<div class="equal fields">
			<?php new FormField(name: "settings[label_fieldname]", type:"select", label: "Fieldname from Label", options:[
				new Option(text:"Yes", value:"1"),
				new Option(text:"No", value:"0"),
			], hint:"Auto update the field name when the label text is changed."); ?>
			<?php new FormField(name: "settings[items_hints]", type:"select", label: "Show items hints", options:[
				new Option(text:"Yes", value:"1"),
				new Option(text:"No", value:""),
			], hint:"Show selected settings from selected items in the designer, like the Table value of a Read Data action."); ?>
			<?php new FormField(name: "settings[max_field_mode]", type:"select", label: "Increase max fields", options:[
				new Option(text:"No", value:""),
				new Option(text:"Yes", value:"1"),
			], hint:"The maximum possible number of fields per form is dependent on the server's PHP setting max_input_vars, but this setting can bypass the limit without changing the server setting"); ?>
		</div>
	</fieldset>

	<fieldset class="nui segment white bordered rounded">
		<legend class="nui bold large label grey rounded">Processing Settings</legend>
		<div class="equal fields">
			<?php new FormField(name: "settings[data_sql_safe]", type:"select", label: "Auto Quote Data variables", options:[
				new Option(text:"Yes", value:"1"),
				new Option(text:"No", value:"0"),
			], hint:"Auto quote data variables when calling {data:param} in WHERE or SQL code."); ?>
		</div>
	</fieldset>

	<fieldset class="nui segment white bordered rounded">
		<legend class="nui bold large label grey rounded">Validation Key</legend>
		<div class="equal fields">
			<?php new FormField(name: "settings[vkey]", label: "Your ChronoEngine.com validation key", hint:"The validation key is stored for convenience and can be cleared from the system if necessary."); ?>
		</div>
	</fieldset>

	<fieldset class="nui segment white bordered rounded">
		<legend class="nui bold large label grey rounded">Global Variables</legend>
		<?php foreach(["n" => ""] + (!empty($this->data["settings"]["globals"]) ? $this->data["settings"]["globals"] : []) as $k => $lang): ?>
			<div class="nui equal fields block clonable globals" data-selector=".clonable.globals" data-cloner=".globals-cloner" data-key="<?php echo $k; ?>">
				<?php
					new FormField(name: "settings[globals][".$k."][name]", label: "Variable Name", value:"", hint:"The name of the global variable.");
					new FormField(name: "settings[globals][".$k."][value]", label: "Variable Value", value:"", hint:"The value of the global variable accessible in forms under {globals:var-name}.");
				?>
				<button type="button" class="nui button red iconed block self-center remove-clone"><?php echo Chrono::ShowIcon("xmark"); ?>Remove</button>
				<!-- <div class="nui divider block"></div> -->
			</div>
		<?php endforeach; ?>
		<button type="button" class="nui button blue iconed globals-cloner"><?php echo Chrono::ShowIcon("plus"); ?>Add Global Variable</button>
	</fieldset>

</form>