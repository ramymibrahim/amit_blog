<?php
require_once($base_dir.'helper/session.php');
require_once($base_dir.'helper/database.php');
require_once($base_dir.'helper/config.php');

function hashStr($username,$password){    
    $salt='123';
    $hashString=$username.$salt.$password;
    return sha1($hashString);
}

function login($username,$password){
    $query = "select users.* from users where username='$username'";
    $user = getRow($query);    
    if($user){ 
        if($user['password']==hashStr($username,$password)){  
            $_SESSION['user']=$user;
            return true;
        }
    }
    return false;
}

function register($post,$files){
    $base_dir = $_SERVER["DOCUMENT_ROOT"].'/amit_blog/';
    if($post['password']!=$post['confirm_password']){
        return 'Invalid password!';
    }
    if($files['picture']['type']!='image/png' && $files['picture']['type']!='image/jpg'){
        return 'Invalid File Type!';
    }
    $uploaded = move_uploaded_file($files['picture']['tmp_name'],$base_dir.'img/'.$files['picture']['name']);
    if(!$uploaded){
        return 'Error while  uploading!';
    }
    $username = $post['username'];
    $password = $post['password'];
    $name = $post['name'];
    $picture = 'img/'.$files['picture']['name'];
    $password = hashStr($username,$password);
    $query="
    INSERT INTO users(id,username,password,name,picture,is_author,is_admin)
    values (null,'$username','$password','$name','$picture',0,0)
    ";
    executeQuery($query);
}

?>