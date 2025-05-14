<?php
/**
* ChronoForms 8
* Copyright (c) 2023 ChronoEngine.com, All rights reserved.
* Author: (ChronoEngine.com Team)
* license:     GNU General Public License version 2 or later; see LICENSE.txt
* Visit http://www.ChronoEngine.com for regular updates and information.
**/
defined('_JEXEC') or die('Restricted access');

$this->data["elements"][$id]["style"]["screen"] = "";
?>
<div class="equal fields">
	<?php new FormField(name: "elements[$id][label]", label: "Title", value: "Class $id", hint:"The title of the class in the wizard selections"); ?>
	<?php new FormField(name: "elements[$id][selector]", label: "Selector", value: ".class-$id", hint:"The selector of this style, choose a core selector to apply to core content or enter a new selector"); ?>
</div>
<?php new FormField(name: "elements[$id][style][screen]", type:"select", label: "Display", hint:"Select the display to apply the configured styles to", options:[
	"all" => "All",
	"desktop" => "Desktop",
	"laptop" => "Laptop",
	"tablet" => "Tablet",
	"phone" => "Phone",
]); ?>

<?php foreach(["all" => "All Displays", "desktop" => "Desktops", "laptop" => "Laptops", "tablet" => "Tablets", "phone" => "Phones"] as $screen => $screen_title): ?>
<div class="nui flex vertical p1 divided rounded accordion <?php if($screen != "all"): ?>hidden<?php endif; ?>" data-screen="<?php echo $screen; ?>">
	<div class="nui label slate large bold"><?php echo $screen_title; ?></div>
	<div class="item nui pv1">
		<div class="title nui bold flex wrap">
			<i class="dropdown icon"></i>Layout
		</div>
		<div class="content nui flex vertical spaced p0">
			<div class="equal fields">
				<?php new FormField(name: "elements[$id][style][css][$screen][display]", type:"select", hint:"Display", options:[
					"" => "Not Set",
					"inline" => "Inline",
					"block" => "Block",
					"inline-flex" => "Inline Flex",
					"flex" => "Flex",
					"grid" => "Grid",
				]); ?>
				<?php new FormField(name: "elements[$id][style][$screen][child-of]", type:"select", hint:"Child Settings", options:[
					"" => "Not Set",
					"flex-child" => "Flex Child",
				]); ?>
			</div>
			<div class="nui <?php if($this->data("elements.$id.style.css.$screen.display") != "flex"): ?>hidden<?php endif; ?> form flex-options options">
				<div class="equal fields">
					<?php new FormField(name: "elements[$id][style][css][$screen][flex-direction]", type:"select", hint:"Flex Direction", options:[
						"" => "Not Set",
						"row" => "Row",
						"row-reverse" => "Row-Reverse",
						"column" => "Column",
						"column-reverse" => "Column-Reverse",
					]); ?>
					<?php new FormField(name: "elements[$id][style][css][$screen][gap]", hint: "Gap", value: ""); ?>
					<?php new FormField(name: "elements[$id][style][css][$screen][flex-wrap]", type:"select", hint:"Flex Wrap", options:[
						"" => "Not Set",
						"wrap" => "Wrap",
					]); ?>
				</div>
				<div class="equal fields">
					<?php new FormField(name: "elements[$id][style][css][$screen][justify-content]", type:"select", hint:"MainAxis align", options:[
						"" => "Not Set",
						"start" => "Start",
						"center" => "Center",
						"end" => "End",
					]); ?>
					<?php new FormField(name: "elements[$id][style][css][$screen][align-items]", type:"select", hint:"CrossAxis align", options:[
						"" => "Not Set",
						"start" => "Start",
						"center" => "Center",
						"end" => "End",
					]); ?>
				</div>
			</div>
			<div class="nui <?php if($this->data("elements.$id.style.css.$screen.display") != "grid"): ?>hidden<?php endif; ?> form grid-options options">
				<div class="equal fields">
					<?php new FormField(name: "elements[$id][style][css][$screen][grid-auto-flow]", type:"select", hint:"Grid Auto Flow", options:[
						"" => "Not Set",
						"row" => "Row",
						"column" => "Column",
						"revert" => "Revert",
					]); ?>
					<?php new FormField(name: "elements[$id][style][css][$screen][gap]", hint: "Gap", value: ""); ?>
				</div>
				<div class="equal fields">
					<?php new FormField(name: "elements[$id][style][css][$screen][grid-auto-columns]", hint: "Grid Auto Columns", value: ""); ?>
					<?php new FormField(name: "elements[$id][style][css][$screen][grid-auto-rows]", hint: "Grid Auto Rows", value: ""); ?>
				</div>
			</div>
			<div class="nui <?php if($this->data("elements.$id.style.$screen.child-of") != "flex-child"): ?>hidden<?php endif; ?> form flex-child-options child-options">
				<div class="equal fields">
					<?php new FormField(name: "elements[$id][style][css][$screen][flex-basis]", hint: "Flex Basis", value: ""); ?>
					<?php new FormField(name: "elements[$id][style][css][$screen][flex-grow]", hint: "Flex Grow", value: ""); ?>
				</div>
				<div class="equal fields">
					<?php new FormField(name: "elements[$id][style][css][$screen][justify-self]", type:"select", hint:"MainAxis align", options:[
						"" => "Not Set",
						"start" => "Start",
						"center" => "Center",
						"end" => "End",
					]); ?>
					<?php new FormField(name: "elements[$id][style][css][$screen][align-self]", type:"select", hint:"CrossAxis align", options:[
						"" => "Not Set",
						"start" => "Start",
						"center" => "Center",
						"end" => "End",
					]); ?>
				</div>
			</div>
		</div>
	</div>
	<div class="item nui pv1">
		<div class="title nui bold">
			<i class="dropdown icon"></i>Background
		</div>
		<div class="content nui flex vertical spaced p0">
			<?php new FormField(name: "elements[$id][style][css][$screen][background-image]", hint: "Background Image", value: ""); ?>
			<div class="equal fields">
				<?php new FormField(name: "elements[$id][style][css][$screen][background-color]", hint: "Background Color", value: ""); ?>
				<?php new FormField(name: "elements[$id][style][css][$screen][background-position]", type:"select", hint:"Background Position", options:[
					"" => "Not Set",
					"top" => "Top",
					"bottom" => "Bottom",
					"right" => "Right",
					"left" => "Left",
					"center" => "Center",
				]); ?>
			</div>
			<div class="equal fields">
				<?php new FormField(name: "elements[$id][style][css][$screen][background-repeat]", type:"select", hint:"Background Repeat", options:[
					"" => "Not Set",
					"repeat" => "Repeat",
					"no-repeat" => "No Repeat",
					"repeat-x" => "Repeat X",
					"repeat-y" => "Repeat Y",
					"space" => "Space",
					"round" => "Round",
				]); ?>
				<?php new FormField(name: "elements[$id][style][css][$screen][background-size]", type:"select", hint:"Background Size", options:[
					"" => "Not Set",
					"cover" => "Cover",
					"contain" => "Contain",
				]); ?>
			</div>
		</div>
	</div>
	<div class="item nui pv1">
		<div class="title nui bold">
			<i class="dropdown icon"></i>Border
		</div>
		<div class="content nui flex vertical spaced p0">
			<div class="equal fields">
				<?php new FormField(name: "elements[$id][style][css][$screen][border-color]", hint: "Border Color", value: ""); ?>
				<?php new FormField(name: "elements[$id][style][css][$screen][border-style]", type:"select", hint:"Border Style", options:[
					"" => "Not Set",
					"solid" => "Solid",
					"dotted" => "Dotted",
					"dashed" => "Dashed",
				]); ?>
			</div>
			<div class="equal fields">
				<?php new FormField(name: "elements[$id][style][css][$screen][border-width]", hint: "Border Width", value: ""); ?>
				<?php new FormField(name: "elements[$id][style][css][$screen][border-radius]", hint: "Border Radius", value: ""); ?>
			</div>
			<?php new FormField(name: "elements[$id][style][css][$screen][overflow]", type:"select", hint:"Overflow", options:[
				"" => "Not Set",
				"auto" => "Auto",
				"scroll" => "Scroll",
				"hidden" => "Hidden",
				"visible" => "Visible",
			]); ?>
		</div>
	</div>
	<div class="item nui pv1">
		<div class="title nui bold">
			<i class="dropdown icon"></i>Position
		</div>
		<div class="content nui flex vertical spaced p0">
			<div class="equal fields">
				<?php new FormField(name: "elements[$id][style][css][$screen][position]", type:"select", hint:"Position", options:[
					"" => "Not Set",
					"relative" => "Relative",
					"absolute" => "Absolute",
					"sticky" => "Sticky",
					"fixed" => "Fixed",
				]); ?>
				<?php new FormField(name: "elements[$id][style][css][$screen][z-index]", hint: "Z-Index", value: ""); ?>
			</div>
			<div class="equal fields">
				<?php new FormField(name: "elements[$id][style][css][$screen][top]", hint: "Top", value: ""); ?>
				<?php new FormField(name: "elements[$id][style][css][$screen][left]", hint: "Left", value: ""); ?>
				<?php new FormField(name: "elements[$id][style][css][$screen][bottom]", hint: "Bottom", value: ""); ?>
				<?php new FormField(name: "elements[$id][style][css][$screen][right]", hint: "Right", value: ""); ?>
			</div>
			<?php new FormField(name: "elements[$id][style][css][$screen][transform]", hint: "Transform", value: ""); ?>
		</div>
	</div>
	<div class="item nui pv1">
		<div class="title nui bold">
			<i class="dropdown icon"></i>Size
		</div>
		<div class="content nui flex vertical spaced p0">
			<div class="equal fields">
				<?php new FormField(name: "elements[$id][style][css][$screen][width]", hint: "Width", value: ""); ?>
				<?php new FormField(name: "elements[$id][style][css][$screen][min-width]", hint: "Minimum Width", value: ""); ?>
				<?php new FormField(name: "elements[$id][style][css][$screen][max-width]", hint: "Maximum Width", value: ""); ?>
			</div>
			<div class="equal fields">
				<?php new FormField(name: "elements[$id][style][css][$screen][height]", hint: "Height", value: ""); ?>
				<?php new FormField(name: "elements[$id][style][css][$screen][min-height]", hint: "Minimum Height", value: ""); ?>
				<?php new FormField(name: "elements[$id][style][css][$screen][max-height]", hint: "Maximum Height", value: ""); ?>
			</div>
		</div>
	</div>
	<div class="item nui pv1">
		<div class="title nui bold">
			<i class="dropdown icon"></i>Spacing
		</div>
		<div class="content nui flex vertical spaced p0">
			<div class="equal fields">
				<?php new FormField(name: "elements[$id][style][css][$screen][padding]", hint: "Padding", value: ""); ?>
				<?php new FormField(name: "elements[$id][style][css][$screen][margin]", hint: "Margin", value: ""); ?>
			</div>
		</div>
	</div>
	<div class="item nui pv1">
		<div class="title nui bold">
			<i class="dropdown icon"></i>Typography
		</div>
		<div class="content nui flex vertical spaced p0">
			<div class="equal fields">
				<?php new FormField(name: "elements[$id][style][css][$screen][font-size]", hint: "Font Size", value: ""); ?>
				<?php new FormField(name: "elements[$id][style][css][$screen][font-weight]", hint: "Font Weight", value: ""); ?>
				<?php new FormField(name: "elements[$id][style][css][$screen][line-height]", hint: "Line Height", value: ""); ?>
			</div>
			<div class="equal fields">
				<?php new FormField(name: "elements[$id][style][css][$screen][color]", hint: "Text Color", value: ""); ?>
				<?php new FormField(name: "elements[$id][style][css][$screen][text-decoration]", type:"select", hint:"Text Decoration", options:[
					"" => "Not Set",
					"underline" => "UnderLined",
					"italic" => "Italic",
					"bold" => "Bold",
				]); ?>
			</div>
		</div>
	</div>
	<div class="item nui pv1">
		<div class="title nui bold">
			<i class="dropdown icon"></i>Raw CSS
		</div>
		<div class="content nui flex vertical spaced p0">
			<?php new FormField(name: "elements[$id][style][css][$screen][output]", type: "textarea", label: "Output", rows: 3, hint:"Auto generated..."); ?>
		</div>
	</div>
</div>
<?php endforeach; ?>

<?php
$behaviors = [];
$listBehaviors($id, $behaviors);
?>