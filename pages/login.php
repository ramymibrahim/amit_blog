<?php
require_once('../helper/config.php');
require_once('../helper/users.php');
if(isset($_POST['username']) && isset($_POST['password'])){
    $login = login($_POST['username'],$_POST['password']);
    if($login){
        header("Location: $base_url/index.php");
        die();
    }
}     
require_once($base_dir.'layouts/header.php');

?>

  <!-- Page Header -->
  <header class="masthead" style="background-image: url('img/home-bg.jpg')">
      <div class="overlay"></div>
      <div class="container">
        <div class="row">
          <div class="col-lg-8 col-md-10 mx-auto">
            <div class="site-heading">
              <h1>Please Login</h1>
            </div>
          </div>
        </div>
      </div>
    </header>
	
    <div class="container">
      <div class="row">
        <div class="col-lg-8 col-md-10 mx-auto">
            <form action="<?php $base_url.'/pages/login.php'?>" method="post">
            <input type = "text" name="username" class="form-control" placeholder="User Name"/>
            <input type = "password" name="password" class="form-control" placeholder="Password"/>
            <button type="sumbit" class="btn btn-success">Login</button>
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