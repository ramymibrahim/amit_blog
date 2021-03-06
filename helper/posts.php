<?php
require_once($base_dir.'helper/database.php');
require_once($base_dir.'helper/session.php');
function getAdminPosts(){
    $query="SELECT posts.*,users.name as user_name,categories.name as category_name
    FROM posts LEFT JOIN users ON users.id=posts.user_id 
    LEFT JOIN categories  on categories.id=posts.category_id ORDER BY posts.created_at desc";
    return getRows($query);
}
function getPosts($cat_id=0,$limit=10,$page=1,$condition=''){
    $query = "
    SELECT posts.*,users.name as user_name,categories.name as category_name
    FROM posts LEFT JOIN users ON users.id=posts.user_id 
    LEFT JOIN categories  on categories.id=posts.category_id
    WHERE (posts.title like '%$condition%' or posts.content like '%$condition%') and users.is_active=1
    ";
    if($cat_id>0){
        $query=$query." AND posts.category_id=$cat_id";
    }
    $query = $query ." order by created_at desc ";
    /*
    To Get the limit on the query you must specify
    Start index and the limit
    start = page number  - 1 multiplied by the limit
    e.g.
    page    start
    1       0
    2       10
    3       20
    */
    $start=($page-1)*$limit;
    $query =$query . " limit $start,$limit";    
    $posts = getRows($query);
return $posts;
}

function getCount($cat_id=0,$condition=''){
    $query="
    SELECT COUNT(0) FROM posts 
    inner join users on users.id=posts.user_id
    WHERE (posts.title like '%$condition%' or posts.content like '%$condition%') and users.is_active=1";
    
    if($cat_id>0){
        $query=$query." AND posts.category_id=$cat_id";
    }    
    $count = getRow($query)[0];    
    return $count;
}
function getPostAdmin($id){
    $query= "SELECT * from posts WHERE id=$id";
    return getRow($query);
}
function getPost($id){
    $query= "
    SELECT posts.*,categories.name as category_name,users.name as user_name 
    from posts
    INNER JOIN categories on categories.id=posts.category_id
    INNER JOIN users on users.id=posts.user_id
    WHERE  posts.id = $id and posts.is_active=1 and users.is_active=1;";
    $post = getRow($query);        
    if(!$post)
        return null;
    $query="
    SELECT comments.*,users.name,users.picture FROM comments
    INNER join users on users.id=comments.user_id
    WHERE comments.post_id=$id and users.is_active=1 order by created_at desc";
    $post['comments']=getRows($query);
    return $post;
}

function getContentForHome($content){    
    $max = 20;
    $arr=explode(" ", $content);    
    if(count($arr)<=$max)
        return $content;    
    $arr=array_splice($arr,0, $max);
    $content = implode(" ", $arr);
    return $content.'...';
}

function getHref($cat_id,$limit,$page,$condition){
    $params = "index.php?&cat_id=$cat_id&limit=$limit&page=$page&condition=$condition";
    return $params;
}

function setNotActivePost($id){
    return executeNonQuery("UPDATE posts set is_active=0 where id=$id");
}
function setActivePost($id){
    return executeNonQuery("UPDATE posts set is_active=1 where id=$id");
}
function deletePost($id){
    return executeNonQuery("DELETE FROM posts where id=$id");
}


function addComment($post_id,$content){
    $user_id=$_SESSION['user']['id'];
    return executeNonQuery("INSERT INTO comments (id,user_id,post_id,content) VALUES (null,$user_id,$post_id,'$content')");
}

function addPost($title,$content,$category_id,$picture){
    $base_dir = $_SERVER["DOCUMENT_ROOT"].'/amit_blog/';
    $user_id=$_SESSION['user']['id'];
    if($picture['type']!='image/png' && $picture['type']!='image/jpg' && $picture['type']!='image/jpeg'){
        return 'Invalid File Type!';
    }      
    $farr = explode(".",$picture['name']);        
    $ext = ".".$farr[count($farr)-1];
    $picture_name='img/'.date("U").(microtime(true)*10000).$ext;        
    $uploaded = move_uploaded_file($picture['tmp_name'],$base_dir.$picture_name);
    if(!$uploaded){
        return 'Error while  uploading!';
    }  
    $q="INSERT INTO posts(id,title,content,category_id,user_id,is_active,picture) value (null,'$title','$content',$category_id,$user_id,0,'$picture_name')";    
    return executeNonQuery($q);
}
function editPost($id,$title,$content,$category_id){
    $q="Update posts set title='$title',content='$content',category_id='$category_id' where id=$id";    
    return executeNonQuery($q);
}
