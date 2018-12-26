<?php 
require_once('session.php');
if(!(isset($user) && $user['is_admin'])){
    header('Location: ../index.php');
    die();
}