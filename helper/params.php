<?php
$cat_id=getNumericParam('cat_id',0);
$limit=getNumericParam('limit',10);
$page=getNumericParam('page',1);
$keywords=getStringParam('keywords');

function getNumericParam($name,$defult){
    if(!isset($_GET[$name]))
        return $defult;
    $result=$_GET[$name];
    if(!is_numeric($result))
        return $defult;
    if($result<0)
        return  $defult; 
    return $result;    
}

function getStringParam($name){
    if(!isset($_GET[$name]))
        return '';
    return addslashes($_GET[$name]);
}