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
<?php new FormField(name: "elements[$id][data_override]", type:"textarea", label: "Override Data", rows:10, hint:"Multi line list of fields to add/update/remove to/from the data source with their new values
example:field_name={data:something}
To remove a field use '-' before the field name, example: -field_name."); ?>
</div>