<?php
require_once('../helper/config.php');
require_once($base_dir.'helper/admin.php');
require_once($base_dir.'helper/categories.php');

if(isset($_POST['name']) && isset($_POST['id'])){
    if(editCategory($_POST['id'],$_POST['name'])){
        header('Location: categories.php');
        die();
    }
    else{
        $alert="Error while editing";
    }
    $id=$_POST['id'];
}
else{
    if(!isset($_GET['id'])){
        header('Location: categories.php');
        die();
    }
    $id=$_GET['id'];
}
require_once($base_dir.'layouts/header.php');
$cat=getCategory($id);
if($cat==null){
    header('Location: categories.php');
    die();
}
?>

<!-- Page Header -->
<!-- Page Header -->
<header class="masthead" style="height: 300px;">
     <div class="overlay"></div>
     <div class="container">
       <div class="row">
         <div class="col-lg-8 col-md-10 mx-auto">
           <div class="site-heading">
             <h1>Edit Category</h1>
           </div>
         </div>
       </div>
     </div>
   </header>


   <div class="container">
       <div class="row">
           <div class="col-md-12">
           <?php
           if(isset($alert)){
               ?>
               <div class="alert alert-danger"><?php echo $alert;?></div>
               <?php
           }           
           ?>           
           
             <form action="editCategory.php" method="POST">
                <input type = "hidden" name="id" value="<?php echo $cat['id']?>"/>
                <input type = "text" class="form-control" name="name"  value="<?php echo $cat['name']?>"/>
                <button class="btn btn-primary" type="submit">Edit</button>
             </form>
           </div>
       </div>
   </div>
   
<?php
require_once($base_dir.'layouts/footer.php');
