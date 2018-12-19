<?php
require_once($base_dir.'helper/database.php');

function getCategories(){
    $categories = getRows("select * from categories");    
    return $categories;
}

function getCategoryName($categories,$id){
    foreach($categories as $cat){
        if($cat['id']==$id){
            return $cat['name'];
        }
    }
    return "Amit Blog";
}