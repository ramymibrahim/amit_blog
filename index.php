<?php
require_once('layouts/header.php');
?>
  <!-- Page Header -->
  <header class="masthead" style="background-image: url('img/home-bg.jpg')">
      <div class="overlay"></div>
      <div class="container">
        <div class="row">
          <div class="col-lg-8 col-md-10 mx-auto">
            <div class="site-heading">
              <h1>Clean Blog</h1>
              
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
$posts=[];
for($i=0;$i<count($posts);$i++){
?>
	<div class='post-preview'>
		<a href='post.html'>
			<h2 class='post-title'></h2>
			<h3 class='post-subtitle'></h3>
        </a>
		<?php
		if(!empty($posts[$i]['author'])){
			?>
			<p class='post-meta'>Posted by <a href='#'>
		<?php echo $posts[$i]['author'];?></a>
             on <?php $posts[$i]['created_at'];?>
		</p>
			<?php
		}
		?>
    </div>
    <hr>
	<?php
}
?>
          
          <!-- Pager -->
          <div class="clearfix">
            <a class="btn btn-primary float-right" href="#">Older Posts &rarr;</a>
          </div>
        </div>
      </div>
    </div>
    <hr>
    <?php
    require_once('layouts/footer.php');
    ?>