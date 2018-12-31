<?php
require_once('../helper/config.php');
require_once($base_dir.'helper/admin.php');
require_once($base_dir.'helper/posts.php');
require_once($base_dir.'layouts/header.php');

if(
    isset($_POST['title']) 
    && isset($_POST['content']) 
    && isset($_POST['category_id'])
    && isset($_FILES['picture'])){
    if(addPost($_POST['title'],$_POST['content'],$_POST['category_id'],$_FILES['picture'])){
        header('Location: posts.php');
        die();
    }
    else{
        $alert="Error while adding";
    }
}
?>

<!-- Page Header -->
<header class="masthead" style="height: 300px;">
     <div class="overlay"></div>
     <div class="container">
       <div class="row">
         <div class="col-lg-8 col-md-10 mx-auto">
           <div class="site-heading">
             <h1>Add Post</h1>
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
             <form action="addPost.php" method="POST"  enctype="multipart/form-data">
                <input type = "text" class="form-control" name="title"  placeholder="post title" />
                <input type = "text" class="form-control" name="content" placeholder="description" />
                <select type = "text" class="form-control" name="category_id" >
                
                <?php
                foreach($categories as $category){
                    echo "<option value='".$category['id']."'>".$category['name']."</option>";
                }
                ?>
                </select>
                <input type="file" name="picture"  />
                <button class="btn btn-primary" type="submit">Add</button>
             </form>

                    

           </div>
       </div>
   </div>
   
<?php
require_once($base_dir.'layouts/footer.php');
