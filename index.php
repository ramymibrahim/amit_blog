<?php
require_once('helper/config.php');
require_once('layouts/header.php');
require_once('helper/params.php');
require_once('helper/posts.php');
?>
  <!-- Page Header -->
  <header class="masthead" style="background-image: url('img/home-bg.jpg')">
      <div class="overlay"></div>
      <div class="container">
        <div class="row">
          <div class="col-lg-8 col-md-10 mx-auto">
            <div class="site-heading">
              <h1><?php echo getCategoryName($categories,$cat_id);?></h1>
            </div>
          </div>
        </div>
      </div>
    </header>
	
    <div class="container">
      <div class="row">
        <div class="col-lg-8 col-md-10 mx-auto">

<!-- -->		
<?php
$posts=getPosts($cat_id,$limit,$page,$keywords);

foreach($posts as $post)
{
  ?>
<div class='post-preview'>
		<a href='<?php echo $base_url.'/pages/post.php?id='.$post['id'];?>'>
			<h2 class='post-title'><?php echo $post['title']?></h2>
			<h3 class='post-subtitle'><?php echo getContentForHome($post['content'])?></h3>
        </a>
        <p class='post-meta'> 
        <a href='<?php echo $base_url.'/pages/author.php?id='.$post['user_id'];?>'>
        <?php echo 'Posted by '.$post['user_name'].' on '.$post['created_at'];?>
        </a>
        </p>
        </div>
    <hr>
  <?php
}
?>
          
          <!-- Pager -->
          <div class="clearfix">

<nav aria-label="Page navigation example"class="d-flex justify-content-center ">
              <ul class="pagination pagination-circle bg-primary">
            <?php
            $totalCount=getCount($cat_id,$keywords);
            $pageCount = intval(($totalCount-1)/$limit) + 1;
            if($page>1){
              $href=getHref($cat_id,$limit,1,$keywords);
              echo "<li class='page-item'><a class='page-link' href='$base_url/$href'>First</a></li>";
              $href=getHref($cat_id,$limit,$page-1,$keywords);
              echo "<li class='page-item '>
              <a class='page-link' aria-label='Previous' href='$base_url/$href'>
                <span aria-hidden='true'>&laquo;</span>
                <span class='sr-only'>Previous</span>
              </a>
            </li>";
            }
            for($i=1;$i<=$pageCount;$i++){
              $href=getHref($cat_id,$limit,$i,$keywords);
              if($page==$i)
                echo "<li class='page-item active'><a class='page-link '>$i</a></li>";
                else
              echo "<li class='page-item'><a class='page-link' href='$base_url/$href'>$i</a></li> ";
            }
            if($page<$pageCount){
              $href=getHref($cat_id,$limit,$page+1,$keywords);
              echo "<li class='page-item'>
              <a class='page-link' aria-label='Next'  href='$base_url/$href'>
                <span aria-hidden='true'>&raquo;</span>
                <span class='sr-only'>Next</span>
              </a>
            </li>";
              $href=getHref($cat_id,$limit,$pageCount,$keywords);
              echo "<li class='page-item'><a class='page-link' href='$base_url/$href' >Last</a></li>";
            } 
            ?>

             </ul>
            </nav>

          </div>
        </div>
      </div>
    </div>
    <hr>
    <?php
    require_once('layouts/footer.php');
    ?>