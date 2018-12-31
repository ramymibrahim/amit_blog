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
    $query = "select users.* from users where username='$username' and is_active=1";
    $user = getRow($query);    
    if($user){ 
        if($user['password']==hashStr($username,$password)){  
            $_SESSION['user']=$user;
            return true;
        }
    }
    return false;
}

function register($username,$password,$confirm_password,$name,$picture){
    
    $base_dir = $_SERVER["DOCUMENT_ROOT"].'/amit_blog/';
    if($password!=$confirm_password){
        return 'Invalid password!';
    }
    if($picture['type']!='image/png' && $picture['type']!='image/jpg' && $picture['type']!='image/jpeg'){
        return 'Invalid File Type!';
    }    
    $farr = explode(".",$picture['name']);        
    $ext = ".".$farr[count($farr)-1];
    $picture_name='img/'.$username.date("U").(microtime(true)*10000).$ext;        
    $uploaded = move_uploaded_file($picture['tmp_name'],$base_dir.$picture_name);
    if(!$uploaded){
        return 'Error while  uploading!';
    }    
    $hashed_password = hashStr($username,$password);
    
    $query="
    INSERT INTO users(id,username,password,name,picture,is_author,is_admin,is_active)
    values (null,'$username','$hashed_password','$name','$picture_name',0,0,1)
    ";    
    if(!executeNonQuery($query)){
        return 'Error while registration, please try again later!';
    }
    $login= login($username,$password);
    if($login){        
        header('Location: ../index.php');
        die();
    }
}

function getUsers(){
    $query="
        SELECT id,UserName,Name,is_author,is_admin,is_active from users;
    ";
    return getRows($query);
}

function delete($id){
    return executeNonQuery("delete from users where id=$id");
}

function setAdmin($id){
    return executeNonQuery("update users set is_admin=1 where id=$id");
}

function setNotAdmin($id){
    return executeNonQuery("update users set is_admin=0 where id=$id");
}

function setAuthor($id){
    return executeNonQuery("update users set is_author=1 where id=$id");
}

function setNotAuthor($id){
    return executeNonQuery("update users set is_author=0 where id=$id");
}
function setActive($id){
    return executeNonQuery("update users set is_active=1 where id=$id");
}

function setNotActive($id){
    return executeNonQuery("update users set is_active=0 where id=$id");
}

function getAuthor($id){
    $query="
        SELECT UserName,Name,picture from users where id=$id and is_active=1 and is_author=1;
    ";
    return getRow($query);
}

function getCountPosts($id){
    $query="
    SELECT COUNT(0) FROM posts WHERE is_active=1 AND user_id=$id;
    ";
    return getRow($query);
}

function getCountComments($id){
    $query="
    SELECT COUNT(0) FROM comments inner JOIN posts on posts.id=comments.post_id WHERE posts.is_active=1 and comments.user_id=$id;
    ";
    return getRow($query);
}




?>