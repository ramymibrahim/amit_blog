<?php
require_once('../helper/config.php');
require_once($base_dir.'helper/admin.php');
require_once($base_dir.'helper/categories.php');

if(isset($_POST['name'])){
    if(addCategory($_POST['name'])){
        header('Location: categories.php');
        die();
    }
    else{
        $alert="Error while adding";
    }
}
require_once($base_dir.'layouts/header.php');
?>

<!-- Page Header -->
<!-- Page Header -->
<header class="masthead" style="height: 300px;">
     <div class="overlay"></div>
     <div class="container">
       <div class="row">
         <div class="col-lg-8 col-md-10 mx-auto">
           <div class="site-heading">
             <h1>Add Category</h1>
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
             <form action="addCategory.php" method="POST">
                <input type = "text" class="form-control" name="name" />
                <button class="btn btn-primary" type="submit">Add</button>
             </form>
           </div>
       </div>
   </div>
   
<?php
require_once($base_dir.'layouts/footer.php');
