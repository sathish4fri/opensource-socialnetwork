<?php
/**
 * Open Source Social Network
 *
 * @package   (Informatikon.com).ossn
 * @author    OSSN Core Team <info@opensource-socialnetwork.org>
 * @copyright 2014 iNFORMATIKON TECHNOLOGIES
 * @license   General Public Licence http://www.opensource-socialnetwork.org/licence
 * @link      http://www.opensource-socialnetwork.org/licence
 */
?>
<div class="container">
	<div class="row">
       	<?php echo ossn_plugin_view('theme/page/elements/system_messages'); ?>    
		<div class="ossn-layout-newsfeed">
			<div class="col-md-7">
				<div class="newsfeed-middle">
					<?php echo $params['content']; ?>
				</div>
			</div>
			<div class="col-md-4">
				<div class="newsfeed-right">
					<?php
						if(ossn_is_hook('newsfeed', "sidebar:right")) {
								$newsfeed_right = ossn_call_hook('newsfeed', "sidebar:right", NULL, array());
								echo implode('', $newsfeed_right);
						}
						?>                            
				</div>
			</div>
		</div>
	</div>
	<?php echo ossn_plugin_view('theme/page/elements/footer');?>
</div>