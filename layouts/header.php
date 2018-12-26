<?php
require_once($base_dir.'helper/session.php');
require_once($base_dir.'helper/categories.php');
$categories=getCategories();
?>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Amit Blog</title>

    <!-- Bootstrap core CSS -->
    <link href="<?php echo $base_url?>/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom fonts for this template -->
    <link href="<?php echo $base_url?>/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>

    <!-- Custom styles for this template -->
    <link href="<?php echo $base_url?>/css/clean-blog.min.css" rel="stylesheet">

  </head>

  <body>

    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
      <div class="container">
        <a class="navbar-brand" href="<?php echo $base_url;?>">Amit Blog</a>
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          Menu
          <i class="fas fa-bars"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item">
              <a class="nav-link" href="<?php  echo $base_url;?>">Home</a>
            </li>
            <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Categories
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="<?php echo $base_url.'/index.php';?>">All</a>
          <div class="dropdown-divider"></div>
        <?php
          foreach($categories as $cat){
            echo "<a class='dropdown-item' href='".$base_url."/index.php?cat_id=".$cat['id']."'>".$cat['name']."</a>";
          }
        ?>
        </div>
            </li>  
            <?php
          if($loggedIn){
            ?>
            <li class="nav-item">
              <a class="nav-link" href="<?php  echo $base_url.'/pages/logout.php';?>">Logout</a>
            </li>        
            <?php
              }
              else{
              ?>
            <li class="nav-item">
              <a class="nav-link" href="<?php  echo $base_url.'/pages/login.php';?>">Login</a>
            </li>

            <li class="nav-item">
              <a class="nav-link" href="<?php  echo $base_url.'/pages/register.php';?>">Register</a>
            </li>
            <?php
              }
            ?>
<?php
if($loggedIn && $user['is_admin']){
?>
<li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Admin</a>
            <div class="dropdown-menu" aria-labelledby="navbarDropdown">        
              <a class='dropdown-item' href='<?php echo $base_url?>/admin/users.php'>Users</a>
              <a class='dropdown-item' href='<?php echo $base_url?>/admin/categories.php'>Categories</a>
              <a class='dropdown-item' href='<?php echo $base_url?>/admin/posts.php'>Posts</a>
            </div>
          </li> 
            <?php }?>
<?php
if($loggedIn && $user['is_author']){
?>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Author</a>
            <div class="dropdown-menu" aria-labelledby="navbarDropdown">              
              <a class='dropdown-item' href='<?php echo $base_url?>/admin/posts.php?myposts=1'>Posts</a>
            </div>
          </li> 
          <?php
}
?>
          </ul>
        </div>
      </div>
    </nav>      