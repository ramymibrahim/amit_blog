<?php
require_once($base_dir.'helper/database.php');

function getCategories(){
    $categories = getRows("select * from categories");    
    return $categories;
}

function getCategory($id){    
    return getRow("select * from categories where id=$id");
}

function getCategoryName($categories,$id){
    foreach($categories as $cat){
        if($cat['id']==$id){
            return $cat['name'];
        }
    }
    return "Amit Blog";
}

function addCategory($name){
    return executeNonQuery("INSERT INTO categories(id,name) value(null,'$name')");
}

function editCategory($id,$name){    
    return executeNonQuery("UPDATE categories set name='$name' where id=$id");
}

function deleteCategory($id){    
    return executeNonQuery("DELETE FROM categories where id=$id");
}