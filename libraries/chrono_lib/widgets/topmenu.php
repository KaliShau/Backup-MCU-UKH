<?php
/**
* ChronoLibrary
* Copyright (c) 2025 ChronoEngine.com, All rights reserved.
* Author: (ChronoEngine.com Team)
* license: GNU General Public License version 2 or later; see LICENSE.txt
* Visit http://www.ChronoEngine.com for regular updates and information.
**/
defined('_JEXEC') or die('Restricted access');
?>

<?php if(!empty(ChronoApp::$instance->nav)): ?>
<div class="nui flex spaced p1 block basic menu colored blue rounded">
	<?php foreach(ChronoApp::$instance->nav as $navk => $navt): ?>
	<a href="<?php echo ChronoApp::$instance->extension_url; ?>'&action=<?php echo $navk; ?>" class="item <?php if(ChronoApp::$instance->action == $navk || str_starts_with(ChronoApp::$instance->action, explode(".", $navk)[0].".")): ?>active<?php endif; ?>"><?php echo $navt; ?></a>
	<?php endforeach; ?>
</div>
<?php endif; ?>

<?php if($sticky): ?>
	<div class="nui xsegment sticky" style="background-color:#f0f4fb">
<?php endif; ?>

<div class="nui flex tabular menu wrap mb1 middle aligned stackable">
	<div class="item nui header" style="padding-left: 0;">
		<h2 style="margin: 0;"><?php echo Chrono::l($title); ?></h2>
	</div>
	<?php foreach($tabs as $tab): ?>
		<a class="item <?php echo ($tab->action == ChronoApp::$instance->action || $tab->active) ? "active" : ""; ?>" href="<?php echo ChronoApp::$instance->extension_url."&action=".$tab->action; ?>"><?php echo $tab->title; ?></a>
	<?php endforeach; ?>

	<div class="nui flex spaced right stackable" style="padding: 0;">
		<?php foreach ($buttons as $button) : ?>
			<div class="item xbutton" style="padding: 0.15em 0;">
				<?php if ($button->link) : ?>
					<?php
					$link = ChronoApp::$instance->extension_url.'&'.$button->url;
					$target = "";
					if(str_starts_with($button->url, "http")){
						$link = $button->url;
						$target = 'target="_blank"';
					}
					?>
					<a class="nui button <?php echo $button->color; ?> <?php if($button->icon): ?>iconed<?php endif; ?>" <?php echo $button->params; ?> href="<?php echo $link; ?>" <?php echo $target; ?>>
						<?php 
                        if(!empty($button->icon)){
                            echo Chrono::ShowIcon($button->icon);
                        }
                        ?>
						<?php echo Chrono::l($button->title); ?>
					</a>
				<?php elseif (!$button->action): ?>
					<button type="<?php echo !empty($button->type) ? $button->type : "submit"; ?>" name="<?php echo $button->name; ?>" id="<?php echo $button->name; ?>" <?php echo $button->params; ?> class="nui button <?php echo $button->color; ?> <?php if($button->icon): ?>iconed<?php endif; ?> <?php if($button->dynamic): ?>dynamic<?php endif; ?>">
						<?php 
						if(!empty($button->icon)){
							echo Chrono::ShowIcon($button->icon);
						}
						?>
						<?php echo Chrono::l($button->title); ?>
					</button>
				<?php else: ?>
					<a onclick="return Nui.Core.postLink(this);" <?php echo $button->params; ?> class="nui button <?php echo $button->color; ?> <?php if($button->icon): ?>iconed<?php endif; ?>" href="<?php echo ChronoApp::$instance->extension_url; ?>&<?php echo $button->url; ?>">
						<?php 
						if(!empty($button->icon)){
							echo Chrono::ShowIcon($button->icon);
						}
						?>
						<?php echo Chrono::l($button->title); ?>
					</a>
				<?php endif; ?>
			</div>
		<?php endforeach; ?>
	</div>
</div>

<?php if($sticky): ?>
	</div>
<?php endif; ?>