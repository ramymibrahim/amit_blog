<?php
require_once('../helper/config.php');
require_once($base_dir.'helper/admin.php');
require_once($base_dir.'layouts/header.php');
if(isset($_POST['action']) && isset($_POST['id'])){
    if($_POST['action']=='delete'){
        if(!deleteCategory($_POST['id'])){
            $alert="Error while deleting";
        }
    }    
}
$cats=getCategories();
?>
  <!-- Page Header -->
 <!-- Page Header -->
 <header class="masthead" style="height: 300px;">
      <div class="overlay"></div>
      <div class="container">
        <div class="row">
          <div class="col-lg-8 col-md-10 mx-auto">
            <div class="site-heading">
              <h1>Categories</h1>
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
            <a href="addCategory.php" class="btn btn-success">Add</a>
                <table class="table">
                    <thead>
                        <tr>
                            <th>Id</th>                            
                            <th>Name</th>
                            <th colspan="2">Actions</th>                        
                        </tr>
                    </thead>
                    <tbody>
                    <?php
                    $i=1;
                    foreach($cats as $cat){                        
                        ?>
<tr>
                        <td><?php echo $i++?></td>                        
                        <td><?php echo $cat['name'];?></td>
                        <td width="50px">
                        <a class="btn btn-primary" href="editCategory.php?id=<?php echo $cat['id'];?>">Edit</a>                            
                        </td>
                        <td width="50px">
                            <form action="categories.php" method="POST">
                                <button type="submit" class="btn btn-sm btn-danger" onclick="return confirmDelete();">Delete</button>
                                <input type="hidden" name="id" value="<?php echo $cat['id'];?>"/>
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
