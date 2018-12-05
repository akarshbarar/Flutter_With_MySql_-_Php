<?php

include 'conn.php';
$uid=$_POST['uid'];
$name=$_POST['name'];
$mobile=$_POST['mobile'];
$email=$_POST['email'];
$password=$_POST['password'];

$conn->query("update user_details
 set uid='".$uid."',name='".$name."',mobile='".$mobile."',email='".$email."',password='".$password."' 
where mobile='".$mobile."'");

?>
