<?php
require_once('../helper/config.php');
require_once($base_dir.'helper/admin.php');
require_once($base_dir.'layouts/header.php');
require_once($base_dir.'helper/posts.php');
if(isset($_POST['action']) && isset($_POST['id'])){
    if($_POST['action']=='delete'){
        if(!deletePost($_POST['id'])){
            $alert="Error while deleting";
        }
    }
    elseif($_POST['action']=='setactive'){
      if(!setActivePost($_POST['id'])){
          $alert="Error while Action";
      }
  }
  elseif($_POST['action']=='setnotactive'){
    if(!setNotActivePost($_POST['id'])){
        $alert="Error while Action";
    }
}
}
$posts=getAdminPosts();
?>
  <!-- Page Header -->
 <!-- Page Header -->
 <header class="masthead" style="height: 300px;">
      <div class="overlay"></div>
      <div class="container">
        <div class="row">
          <div class="col-lg-8 col-md-10 mx-auto">
            <div class="site-heading">
              <h1>Posts</h1>
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
            <a href="addPost.php" class="btn btn-success">Add</a>
                <table class="table">
                    <thead>
                        <tr>
                            <th>Id</th>                            
                            <th>Title</th>
                            <th>Category</th>
                            <th>Author</th>
                            <th>Created At</th>
                            <th colspan="3">Actions</th>                        
                        </tr>
                    </thead>
                    <tbody>
                    <?php
                    $i=1;
                    foreach($posts as $post){                                              
                        ?>
<tr>
                        <td><?php echo $i++?></td>                        
                        <td><?php echo $post['title'];?></td>
                        <td><?php echo $post['category_name'];?></td>
                        <td><?php echo $post['user_name'];?></td>
                        <td><?php echo $post['created_at'];?></td>
                        <td width="50px">
                        <a class="btn btn-primary" href="editPost.php?id=<?php echo $post['id'];?>">Edit</a>
                        </td>
                        <td width="50px">
                        
                        <?php                        
                        if($post['is_active']){
?>

  <form action="posts.php" method="POST">
                                <button type="submit" class="btn btn-sm btn-primary">Set Not Active</button>
                                <input type="hidden" name="id" value="<?php echo $post['id'];?>"/>
                                <input type="hidden" name="action" value="setnotactive"/>
                            </form>
<?php
                        }
                        else{
?>
                            <form action="posts.php" method="POST">
                                <button type="submit" class="btn btn-sm btn-primary">Set Active</button>
                                <input type="hidden" name="id" value="<?php echo $post['id'];?>"/>
                                <input type="hidden" name="action" value="setactive"/>
                            </form>

<?php
                        }
                        ?>
                        
                        </td>

                        <td width="50px">
                            <form action="posts.php" method="POST">
                                <button type="submit" class="btn btn-sm btn-danger" onclick="return confirmDelete();">Delete</button>
                                <input type="hidden" name="id" value="<?php echo $post['id'];?>"/>
                                <input type="hidden" name="action" value="delete"/>
                            </form>
                        </td>                        
                        </tr>
                        <?php
                    }
                    ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        function confirmDelete(){
            return confirm('Are you sure ?');
        }
    </script>
<?php
require_once($base_dir.'layouts/footer.php');
