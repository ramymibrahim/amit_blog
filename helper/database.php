<?php
function getRows($q){
    $result=[];    
    $con = mysqli_connect("localhost","blog_user","blog_user123","amit_blog");
    mysqli_set_charset($con,"utf8");
    $query = mysqli_query($con,$q);
    while($row=mysqli_fetch_array($query)){
        array_push($result,$row);
    } 
    mysqli_close($con);
    return $result;
}

function getRow($q){
    $con = mysqli_connect("localhost","blog_user","blog_user123","amit_blog");
    mysqli_set_charset($con,"utf8");
    $query = mysqli_query($con,$q);
    $row=mysqli_fetch_array($query);
    mysqli_close($con);
    return $row;
}
