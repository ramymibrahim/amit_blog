<?php
$username=$_GET['username'];
$password=$_GET['password'];
$salt='123';
$hashString=$username.$salt.$password;
echo sha1($hashString);
?>