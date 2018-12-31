<?php
require_once('../helper/config.php');
require_once('../helper/users.php');
if(isset($_GET['id'])){
    $id=$_GET['id'];
    $auther = getAuthor($id);
    if($auther==null){
        header("Location: $base_url/index.php");
        die();
    }    
}
else{
    header("Location: $base_url/index.php");
    die();
}
$CountComments = getCountComments($id);
$CountPosts = getCountPosts($id);



require_once($base_dir.'layouts/header.php');
?>
<link rel="stylesheet" href="<?php echo $base_url?>/css/style.css" type="text/css" />
 <!-- Page Header -->
 <header class="masthead">
      <div class="overlay"></div>
      <div class="container">
        <div class="row">
          <div class="col-lg-8 col-md-10 mx-auto">
            <div class="site-heading">
            <img class="img-fluid mb-5 " style="border-radius:100px;max-width:200px;max-height:200px" src="../<?php echo $auther['picture'];?>" alt="">
            <h1 class="text-uppercase "><?php echo $auther['Name'];?></h1>
            <hr >
            <h2 class="font-weight-light mb-0"><?php echo $auther['UserName'];?></h2>
            <h2 class="font-weight-light mb-0">Posts Count : <?php echo $CountPosts['0'];?> , Comments Count : <?php echo $CountComments['0'];?></h2>
            </div>
          </div>
        </div>
      </div>
    </header>

<div class="container">
    <div class="row">
    
   
    </div>
</div>
<?php
require_once($base_dir.'layouts/footer.php');
?>