<?php
require_once('../helper/config.php');
require_once($base_dir.'helper/admin.php');
require_once($base_dir.'helper/users.php');
if(isset($_POST['action']) && $_POST['action']=='delete' && isset($_POST['id'])){
    $id=$_POST['id'];
    if(!delete($id)){
        $alert = "Error while deleting";
    }
}
if(isset($_GET['action']) && isset($_GET['id'])){
    $id = $_GET['id'];
    if($_GET['action']=='setadmin'){
        if(!setAdmin($id)){
            $alert = "Error while Action";
        }
    }
    elseif($_GET['action']=='setnotadmin'){
        if(!setNotAdmin($id)){
            $alert = "Error while Action";
        }
    }
    elseif($_GET['action']=='setauthor'){
        if(!setAuthor($id)){
            $alert = "Error while Action";
        }
    }
    elseif($_GET['action']=='setnotauthor'){
        if(!setNotAuthor($id)){
            $alert = "Error while Action";
        }
    }
}
$users=getUsers();
require_once($base_dir.'layouts/header.php');
?>
  <!-- Page Header -->
  <header class="masthead" style="height: 300px;">
      <div class="overlay"></div>
      <div class="container">
        <div class="row">
          <div class="col-lg-8 col-md-10 mx-auto">
            <div class="site-heading">
              <h1>Users</h1>
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
                <table class="table">
                    <thead>
                        <tr>
                            <th>Id</th>
                            <th>UserName</th>
                            <th>Name</th>
                            <th colspan="3">Actions</th>                        
                        </tr>
                    </thead>
                    <tbody>
                    <?php
                    $i=1;
                    foreach($users as $user){                        
                        ?>
<tr>
                        <td><?php echo $i++?></td>
                        <td><?php echo $user['UserName'];?></td>
                        <td><?php echo $user['Name'];?></td>
                        <td width="50px">
                            <form action="users.php" method="POST">
                                <button type="submit" class="btn btn-sm btn-danger" onclick="return confirmDelete();">Delete</button>
                                <input type="hidden" name="id" value="<?php echo $user['id'];?>"/>
                                <input type="hidden" name="action" value="delete"/>
                            </form>
                        </td>
                        <?php
                        if($user['is_author']){
                        ?>
                            <td width="50px"><a href="users.php?action=setnotauthor&id=<?php echo $user['id'];?>" class="btn btn-primary">Set Not Author</a></td>
                        <?php
                        }
                        else{
                            ?>
                            <td width="50px"><a href="users.php?action=setauthor&id=<?php echo $user['id'];?>" class="btn btn-primary">Set Author</a></td>
                            <?php
                        }
                        ?>
                        <?php
                        if($user['is_admin']){
                        ?>
                        <td width="50px"><a href="users.php?action=setnotadmin&id=<?php echo $user['id'];?>" class="btn btn-primary">Set Not Admin</a></td>
                        <?php
                        }
                        else
                        {
                        ?>
                        <td width="50px"><a href="users.php?action=setadmin&id=<?php echo $user['id'];?>" class="btn btn-primary">Set Admin</a></td>
                        <?php
                        }
                        ?>                                            
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

