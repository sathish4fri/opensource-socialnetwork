<?php
/**
 * OpenSocialWebsite
 *
 * @package   OpenSocialWebsite
 * @author    Open Social Website Core Team <info@opensocialwebsite.com>
 * @copyright 2014 iNFORMATIKON TECHNOLOGIES
 * @license   General Public Licence http://www.opensocialwebsite.com/licence 
 * @link      http://www.opensocialwebsite.com/licence
 */

$OssnLikes = new OssnLikes;
$OssnComments = new OssnComments;
$object= $params['entity_guid'];
$count = $OssnLikes->CountLikes($object);
?>
    <div class="like_share">
    <div id="ossn-like-<?php echo $object;?>" class="button-container">
    <?php if(!$OssnLikes->isLiked($object, ossn_loggedin_user()->guid)){
		 $link['onclick'] = "Ossn.EntityLike({$object});";
		 $link['href'] = 'javascript::;';
		 $link['text'] = ossn_print('ossn:like');
		 echo ossn_view('system/templates/link', $link);
	
        } else { 
	     $user_liked = true;
		 $link['onclick'] = "Ossn.EnrityUnlike({$object});";
		 $link['href'] = 'javascript::;';
		 $link['text'] = ossn_print('ossn:unlike');
		 echo ossn_view('system/templates/link', $link);
	 
        } ?>  
    </div>   
     <span class="dot-comments">.</span> <a href="#comment-box-<?php echo $object;?>">Comment</a>
     <?php if($OssnComments->countComments($object) > 5 ){ ?>
     <span class="dot-comments">.</span> <a href="#">View all comments</a>
     <?php } ?>
     </div>
   <?php if($OssnLikes->CountLikes($object)){ ?> 
    <div class="like_share">
     <?php if($user_liked == true && $count == 1){ ?>
             <?php echo ossn_print("ossn:liked:you"); ?>
      <?php } elseif($user_liked == true && $count > 1){
		     $count = $count - 1;
			 $total = 'person';
			 if($count > 1){ 
			 $total = 'people';
			 }
			 $link['onclick'] = "Ossn.ViewLikes({$object});";
			 $link['href'] = '#';
			 $link['text'] = ossn_print("ossn:like:{$total}", array($count));
			 $link = ossn_view('system/templates/link', $link);
			 echo ossn_print("ossn:like:you:and:this", array($link));
	        }
			elseif(!$user_liked){
		     $total = 'person';
			 if($count > 1){ 
			 $total = 'people';
			 }
			 $link['onclick'] = "Ossn.ViewLikes({$object});";
			 $link['href'] = '#';
			 $link['text'] = ossn_print("ossn:like:{$total}", array($count));
			 $link = ossn_view('system/templates/link', $link);
			 echo ossn_print("ossn:like:this", array($link));
	        }?>
    </div> 
    <?php } ?>
