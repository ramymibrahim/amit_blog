<?php
require_once('../helper/config.php');
require_once('../helper/users.php');
require_once($base_dir.'layouts/header.php');
if(
  isset($_POST['username']) && 
  isset($_POST['password']) &&
  isset($_POST['confirm_password']) &&
  isset($_POST['name']) &&
  isset($_FILES['picture'])
  ){
    $error = register($_POST,$_FILES);
  }
?>

  <!-- Page Header -->
  <header class="masthead" style="background-image: url('img/home-bg.jpg')">
      <div class="overlay"></div>
      <div class="container">
        <div class="row">
          <div class="col-lg-8 col-md-10 mx-auto">
            <div class="site-heading">
              <h1>Please Register</h1>
            </div>
          </div>
        </div>
      </div>
    </header>
	
    <div class="container">
      <div class="row">
        <div class="col-lg-8 col-md-10 mx-auto">
            <form action="<?php $base_url.'/pages/register.php'?>" method="post" enctype="multipart/form-data">
            <input type = "text" name="username" class="form-control" placeholder="User Name"/>
            <input type = "password" name="password" class="form-control" placeholder="Password"/>
            <input type = "password" name="confirm_password" class="form-control" placeholder="Confirm Password"/>
            <input type = "text" name="name" class="form-control" placeholder="User Name"/>
            <label>Please select your favorite picture</label>
            <input type="file" name="picture">
            <button type="sumbit" class="btn btn-success">Register</button>
            </form>
            <?php             
            if(isset($login)){                
                if(!$login){                    
                    ?>
                    <div class="text-danger">Invalid username or password</div>
                    <?php
                }
            }
            ?>
        </div>
        </div>
      </div>
    </div>
    <hr>
    <?php
    require_once($base_dir.'layouts/footer.php');
    ?>

<!-- -->	