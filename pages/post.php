<?php
require_once('../helper/config.php');
require_once('../helper/posts.php');
if(isset($_GET['id'])){
    $id=$_GET['id'];
    if(isset($_POST['content'])){
        addComment($id,$_POST['content']);
    }
    $post = getPost($id);
    if($post==null){
        header("Location: $base_url/index.php");
        die();
    }    
}
else{
    header("Location: $base_url/index.php");
    die();
}
require_once($base_dir.'layouts/header.php');
?>
<link rel="stylesheet" href="<?php echo $base_url?>/css/style.css" type="text/css" />
 <!-- Page Header -->
 <header class="masthead" style="background-image: url('<?php echo $base_url.'/'.$post['picture']?>')">
      <div class="overlay"></div>
      <div class="container">
        <div class="row">
          <div class="col-lg-8 col-md-10 mx-auto">
            <div class="site-heading">
            <h2><?php echo $post['title'];?></h2>
            <p><?php echo "Posted by".$post['user_name']." on ".$post['created_at'];?></p>
            </div>
          </div>
        </div>
      </div>
    </header>

    <article>
      <div class="container">
        <div class="row">
          <div class="col-lg-8 col-md-10 mx-auto">
            <?php 
            echo  $post['content'];
            ?>
          </div>
        </div>
      </div>
    </article>
<div class="container">
    <div class="row">
    
    <?php
    if(!empty($post['comments'])){
        foreach($post['comments'] as $comment){
            ?>
            <div class="col-sm-8">
                <div class="panel panel-white post panel-shadow">
                    <div class="post-heading">
                        <div class="float-left image">
                            <img src="<?php echo $base_url.'/'.$comment['picture']?>" class="img-circle avatar" alt="user profile image">
                        </div>
                        <div class="float-left meta">
                            <div class="title h5">
                                <a href="<?php echo $base_url.'/pages/users?id='.$comment['id'];?>"><b><?php echo $comment['name'];?></b></a>.                                
                            </div>
                            <h6 class="text-muted time"><?php echo $comment['created_at'];?></h6>
                        </div>
                    </div>
                    <div class="post-description">
                        <p style="margin:0px;"><?php echo $comment['content'];?></p>
                    </div>
                </div>
            </div>
            <?php
        }
    }    
    ?>
    </div>

    
<?php
if(isset($user)){
    ?>
        <div class="col-12">
                            <div class="widget-area no-padding blank">
                                <div class="status-upload">
                                    <form action="post.php?id=<?php echo $id;?>" method="POST">
                                        <div class="form-group">
                                          <textarea type="text" class="form-control" name="content" placeholder=" leave a comment "></textarea>
                                        </div>
                                        <button type="submit" class="btn btn-success green"><i class="fa fa-share"></i> Comment</button>
                                    </form>
                                </div><!-- Status Upload  -->
                            </div><!-- Widget Area -->
                        </div>
        
    </div>
    <?php
}
?>
</div>
<?php
require_once($base_dir.'layouts/footer.php');
?>