<?php
require_once($base_dir.'helper/database.php');
function getPosts($cat_id=0,$limit=10,$page=1,$condition=''){
    $query = "
    SELECT posts.*,users.name as user_name,categories.name as category_name
    FROM posts LEFT JOIN users ON users.id=posts.user_id 
    LEFT JOIN categories  on categories.id=posts.category_id
    WHERE (posts.title like '%$condition%' or posts.content like '%$condition%')
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
    WHERE (posts.title like '%$condition%' or posts.content like '%$condition%')";
    
    if($cat_id>0){
        $query=$query." AND posts.category_id=$cat_id";
    }    
    $count = getRow($query)[0];    
    return $count;
}
function getPost($id){
    $query= "
    SELECT posts.*,categories.name as category_name,users.name as user_name 
    from posts
    INNER JOIN categories on categories.id=posts.category_id
    INNER JOIN users on users.id=posts.user_id
    WHERE  posts.id = $id and is_active=1;";
    $post = getRow($query);
    if(!$post)
        return null;
    $query="
    SELECT comments.*,users.name,users.picture FROM comments
    INNER join users on users.id=comments.user_id
    WHERE comments.post_id=$id order by created_at desc";
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