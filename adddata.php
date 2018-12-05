<?php

include 'conn.php';

$uid=$_POST['uid'];
$name=$_POST['name'];
$mobile=$_POST['mobile'];
$email=$_POST['email'];
$password=$_POST['password'];


$conn->query("INSERT into user_details values('".$uid."','".$name."','".$mobile."','".$email."','".$password."')");

?>
