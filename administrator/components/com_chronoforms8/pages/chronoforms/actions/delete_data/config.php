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
	<?php new FormField(name: "elements[$id][dbtable]", type:"select", label: "Table name", code:"data-searchable='1' data-additions='1'", hint: "The database table to delete from.", options:['' => ""] + CF8Model::instance()->Tables()); ?>
</div>
<?php
$behaviors = ["where_statement", "external_database", "events"];
$listBehaviors($id, $behaviors);
?>