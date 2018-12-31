<?php
require_once('../helper/config.php');
require_once($base_dir.'helper/admin.php');
require_once($base_dir.'helper/posts.php');
require_once($base_dir.'layouts/header.php');
if(isset($_GET['id'])){
    $id=$_GET['id'];
    $post=getPostAdmin($id);
    if($post==null){
        header('Location: posts.php');
        die();
    }
}else
{
    header('Location: posts.php');
    die();
}
if(
    isset($_POST['title']) 
    && isset($_POST['content']) 
    && isset($_POST['category_id'])){
    if(editPost($id,$_POST['title'],$_POST['content'],$_POST['category_id'])){
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
             <h1>Edit Post</h1>
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
             <form action="editPost.php?id=<?php echo $id;?>" method="POST">
                <textarea class="form-control" name="title"  placeholder="post title"><?php echo $post['title'] ?></textarea>
                <textarea class="form-control" name="content" placeholder="description"><?php echo $post['content'] ?></textarea>
                <select type = "text" class="form-control" name="category_id" >
                
                <?php
                foreach($categories as $category){
                    if($category['id'] ==$post['category_id'] ){
                        echo "<option value='".$category['id']."' selected='selected'>".$category['name']."</option>";
                    }
                    else{
                        echo "<option value='".$category['id']."'>".$category['name']."</option>";
                    }                    
                }
                ?>
                </select>
                


                <button class="btn btn-primary" type="submit">Edit</button>
             </form>

                    

           </div>
       </div>
   </div>
   
<?php
require_once($base_dir.'layouts/footer.php');
